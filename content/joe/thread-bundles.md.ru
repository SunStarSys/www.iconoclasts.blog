---
archived: ~
categories: ~
dependencies: '*.md.ru'
keywords: POSIX, нить, C, мьютекс
published: ~
status: проверено=26807
title: Пакеты потоков
---

[TOC]#sidebar

<div class="right">

![Генерируемый ИИ пакет потоков](thread-bundles.page/thread-bundle)

</div>

## {# lede #} Потоки POSIX {# lede #}

В этом году мне было поручено перенести нашу функцию максимальной вероятности из одной многопоточной версии в многопотоковую, основываясь на архитектурной предпосылке, что самая медленная часть этого кода – это то, где фактическая логика оптимизации переходит через индекс моделирующей группы Id's, который по дизайну каждая итерация через цикл должна быть независимой от остальных.

Забавная проблема, когда цикл

1. не удается повторно инициализировать зависимые автоматические переменные,
2. изменяет несколько глобальных указателей, индексируемых по идентификатору группы моделирования (`туалетная бумага`),
3. остро нуждается в переменных thread_local для разделения сегментов глобальной памяти, выделенных для расчета (на основе каждого идентификатора).

1 и 3 были простыми. С 2 я обнаружил умный алгоритм, включающий концепцию `THREAD_BUNDLE`, который является блоком для каждого потока идентификаторов групп последовательного моделирования.

путем обеспечения `THREAD_BUNDLE` по крайней мере, такой же большой, как размер страницы памяти, разделенный на размер отдельных указателей в 2, мы можем гарантировать, что различные потоки работают независимо [`страницы`](https://en.wikipedia.org/wiki/Page_%28computer_memory%29) в виртуальной памяти, поэтому мы можем избежать блокировки мьютекса на этих записях памяти. (При условии, что потоки обрабатывают их `THREAD_BUNDLE` примерно с той же скоростью).

Более того, я в конечном итоге удалил зависимость «одна и та же скорость», разделив цикл на четные/нечетные пары, что гарантирует по крайней мере одну память. `страница` разделяет активный `THREAD_BUNDLE` циклы.

Число базовых циклов

```clike
  /* EVEN */
  for (jG = minG; jG <= numG; jG += 2*THREAD_BUNDLE)
  {
    pthread_t ptid; 3 refs
    arg_t* arg = mal (sizeof(*arg), "arg_t"); 12 refs

#define SET_ARG(foo) arg->foo = (foo) 30 refs

SET_ARG(jG);
    ...

#undef SET_ARG

// rsim_mlf_thread loops over the index bundle
	// from jG to MIN(numG, jG + THREAD_BUNDLE - minG), doing
	// stuff with global data structures also indexed by jG

pthread_create (&ptid, NULL, rsim_mlf_thread, arg);
    PUSH_STACK_ELT(thread_stack, ptid, pthread_t);
  }

{
    pthread_t * ptid; 3 refs
    while (POP_STACK_PTR(thread_stack, ptid, pthread_t) != NULL)
    {
      arg_t* arg; 6 refs
      pthread_join(*ptid, (void**)&arg);
      ...
  }

/* ODD */
  for (jG = THREAD_BUNDLE + minG; jG <= numG; jG += 2*THREAD_BUNDLE)
  {
    pthread_t ptid; 3 refs
    arg_t* arg = mal (sizeof(*arg), "arg_t"); 12 refs
    ...
```

<!-- $Date$ $Author$ $Revision$ -->
