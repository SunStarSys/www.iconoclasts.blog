---
archived: ~
categories: ~
dependencies: '*.md.sv'
keywords: POSIX, tråd, C, mutex
published: ~
status: verifierad=26807
title: Trådpaket
---

[TOC]

<div class="right">

![AI-genererat trådpaket](thread-bundles.page/thread-bundle)

</div>

## {# lede #} POSIX-trådar {# lede #}

Jag fick i år i uppdrag att portera vår maximala sannolikhetsfunktion från en enda gängad version till en flertrådad en, baserat på den arkitektoniska förutsättningen att den långsammaste delen av den koden är där den faktiska optimeringslogiken slingrar sig över ett index av modelleringsgrupp Id: s, som genom design, varje iteration genom slingan ska vara oberoende av resten.

Roligt problem när slingan

1. kan inte initiera om beroende automatiska variabler,
2. ändrar flera globala pekare indexerade efter modelleringsgrupp-id (`kräkas`),
3. är i stort behov av thread_local-variabler för att separera globala minnessegment dedikerade till beräkningen (per id-basis).

1 och 3 var enkla. Med 2 upptäckte jag en smart algoritm som involverade konceptet `THREAD_BUNDLE`, som är ett block per tråd med grupp-ID:n för seriemodellering.

Genom att säkerställa `THREAD_BUNDLE` är minst lika stor som en minnessidstorlek dividerat med storleken på de enskilda pekarna i 2, vi kan se till att olika trådar fungerar på oberoende [`sidor`](https://en.wikipedia.org/wiki/Page_%28computer_memory%29) i virtuellt minne, så att vi kan undvika mutex-lås på dessa minnesskrivningar. (Förutsatt att trådarna bearbetar sina `THREAD_BUNDLE` i ungefär samma hastighet).

Dessutom avlägsnade jag så småningom "samma hastighet" beroende genom att dela upp slingan i jämna/odd parningar, vilket garanterar minst ett minne. `sida` separerar den aktiva `THREAD_BUNDLE` loopar.

## Kärnslingor

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
