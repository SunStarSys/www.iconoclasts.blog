---
archived: ~
categories: Перл
dependencies: '*.md.ru'
keywords: pdl,perl5
published: ~
status: завершено
title: Perl5 как язык для изучения данных
---

<div class="right">

![Изучение данных](perlasadatascilang.page/datasci).

</div>

> **Введение в серию – Пост 0 из N**
Эта статья является первой в серии, документирующей совместную разработку движка векторных баз данных (VDBE), написанной полностью на Perl5 + PDL.  Позже посты проходят через каждый компонент этого двигателя; этот устанавливает ступень. Основной импульс для этой серии заключается не в том, чтобы вы сбросили свой VDBE, поскольку я не предъявляю претензий к производительности, а в том, чтобы показать, как можно использовать Perl для достижения практически всего, чего вы можете достичь с помощью любого другого языка, но умнее!

---

## Содержание

[TOC]

---

## 1. Почему Perl5 для Data Science? <a id="why-perl5-for-data-science"></a>

Когда специалисты по изучению данных обсуждают выбор языка, разговор быстро сходится на Python, R или Julia.  Perl5 редко занимает место за столом, но он имеет убедительный набор признаков, которые заслуживают второго взгляда. Эти черты за эти годы не существенно изменились (Perl5 всегда был таким!), но если только не {# lede #}Вы были подвержены языку и научились ценить его красоту, рациональность, гибкость, выразительность и на самом деле использовали его для продвижения своей работы вперед{# lede #}Вы бы не знали, что эти функции не только бесплатны с Perl5, но и могут помочь вам продвигать ваши проекты вперед.

### Развертывание с нулевой установкой

Perl5 поставляется в качестве компонента по умолчанию практически для каждой UNIX-подобной операционной системы – дистрибутивы Linux, macOS, BSD и многие встроенные среды Linux – все это включает в себя работу `перл` бинарные из коробки.  Python продвигается здесь, но все еще часто можно найти автономные серверы, сетевые устройства или узлы входа в HPC
где присутствует Перл, а полного стека питона нет.  Конвейер данных, записанный в Perl, может работать в первый день без `конда` окружающая среда, `вен`или контейнер.

### Переносимость от центра обработки данных к границе

Тот же сценарий, который анализирует терабайтный набор данных на 256-ядерном узле HPC, может с незначительными изменениями конфигурации работать на Raspberry Pi, шлюзе IoT или встроенном контроллере.  Перл'однобинарная модель развертывания и низкие эксплуатационные расходы делают ее подлинной "однократная запись, запуск в любом месте" язык в среде, где Python's переводчик над головой или Юлия'Время разминки JIT было бы неприемлемым.

Если вы планируете развертывать в любом месте, и _everywhere_ Perl5 – ваш очевидный выбор.

### Наследие, основанное на обработке текста и данных

Перл был разработан с нуля для обработки текста, регулярных выражений и "клей" Работа между компонентами системы.  На практике в конвейерах научных данных преобладают не численные вычисления, а *смена данных*: чтение разнородных форматов файлов, очистка беспорядочных записей, объединение наборов данных из разных источников и маршрутизация результатов до последующих потребляющих компонентов.

Перл'движок регулярных выражений остается одним из самых мощных доступных, и однолинейные системы могут выполнять задачи очистки данных, которые потребуют вспомогательных библиотек на других языках.

Если вы находитесь в области научных вычислений, вы, возможно, столкнулись с понятием *системы управления рабочим процессом* и *воспроизводимые исследования*. Они оба полагаются на выполнение сквозных преобразований данных и рабочих процессов, чтобы устранить ручную, подверженную ошибкам и утомительную деятельность, которую аналитики и ученые должны выполнять, чтобы превратить свои данные в аналитику и выводы соответственно.

В этом смелом новом мире, Perl5'богатая история позволяет ему сиять как в качестве компонента рабочих процессов, так и в качестве языка приложения, который реализует эти рабочие процессы.

### CPAN: испытанная битвой экосистема модулей

Комплексная сеть архивов Perl (CPAN) содержит более 200 000 модулей по всем возможным доменам.  Хотя предложения по изучению данных не так обширны, как Python, основные компоненты для выделенных разработчиков существуют:

**PDL** (Perl Data Language) – векторизованные числовые вычисления с сильно типизированными N-мерными массивами (покрытыми ниже).

**PDL::Stats** – описательная статистика, регрессия, кластеризация (k-средства, мини-пакетные k-средства) и многое другое, построенное на основе PDL ndarrays.

- **AI::MXNet**, **AI::TensorFlow** – привязки для глубокого обучения.

- **Статистика::Регрессия**, **Статистика::Описание** – классическая статистика без зависимости PDL.

- **Text::CSV**, **Spreadsheet::XLSX**, **Data::MessagePack**, **Sereal** – высокопроизводительная сериализация и ввод-вывод.

**DBI** + десятки драйверов баз данных – доступ SQL к каждой крупной СУРБД.

**MCE** (Many-Core Engine) – структурированный параллелизм для рабочих нагрузок с общей и распределенной памятью.

**Inline::C**, **Inline::CPP** – встраивание кода C или C++ непосредственно в исходный файл Perl; компилятор вызывается прозрачно при первом запуске сценария, что делает тривиальным удаление критически важных ядер производительности в программу чисто Perl без полной системы сборки XS.

- **FFI::Platypus** – функции вызова в любой общей библиотеке (`.so` / `.dylib` / `.dll`) из Perl без написания одной строки кода клея XS или C.  Platypus поддерживает все типы C-эквивалентов, структуры, обратные вызовы и закрытия, а также является современным способом связывания Perl с BLAS, LAPACK, HDF5 или любой другой собственной библиотекой.

### Современный Перл не твой дед's Перл

Приведенные ниже функции взяты непосредственно из официальных примечаний к выпуску (`perl5360delta`, `perl5380delta`, `perl5400delta`) и организованы путем выпуска, в котором они достигли **стабильного** статуса или были впервые введены. Выделены только функции, относящиеся к научным и научно-вычислительным рабочим нагрузкам.

#### Перл 5.36 – май 2022

- **`использование v5.36`** – набор функций теперь автоматически включает `использовать предупреждения` в дополнение к `использовать строго`. Это также отключает `косвенный` синтаксис вызова метода и `многомерный` хэш-ключевое моделирование, устраняющее два общих источника тонких ошибок.

**Именованные подпрограммные подписи** *(стабильные с 5.36; экспериментальные с 5.20)* – параметры функции теперь объявляются по имени, с необязательными значениями по умолчанию. The `//=` и `||=` операторы значения по умолчанию добавлены к подписям в версии 5.38, что позволяет использовать значения по умолчанию, которые запускаются `неопределённая` или ложь соответственно:

```perl
  use v5.36;
  sub clamp ($val, $lo = 0, $hi //= 1) {
      $val < $lo ? $lo : $val > $hi ? $hi : $val;
  }
  ```

- **`isa` class-instance operator** *(stable since 5.36; introduced in 5.32)* — `$obj isa "ClassName"` returns a boolean; cleaner than `ref($obj) eq "ClassName"`.

- **`builtin` module** *(stable since 5.40; experimental since 5.36)* — lexically importable functions built directly into the interpreter.  The stable 5.40 bundle includes, among others:

- `ceil`, `floor` — integer rounding without `use POSIX`.
  - `trim` — strip leading/trailing whitespace from a string.
  - `indexed` — pairs each element with its index; the idiomatic companion to multi-value `for` loops (see below).
  - `true`, `false`, `is_bool` — typed boolean sentinels; serialisers can now emit JSON `true`/`false` rather than `1`/`0`.
  - `weaken`, `unweaken`, `is_weak` — reference-count control for building bidirectional data structures without memory leaks.
  - `blessed`, `reftype`, `refaddr` — reference introspection.

- **Stable boolean tracking** *(5.36)* — scalars created as booleans (e.g., `!!1`) now retain their boolean nature through assignment, enabling reliable type-aware serialisation to JSON and MessagePack.

- **Multi-value `for` loops** *(stable since 5.40; experimental since 5.36)* Iterate over pairs or N-tuples without manual index arithmetic:

```perl
  use v5.40;
  use builtin 'indexed';

for my ($i, $val) (indexed @scores)  { ... } # index and value
  ```

Or grab multiple values at the same time

```perl
  use v5.40;

for my ($val1, $val2, $val3) (@scores)  { ... }
  ```

- **`defer` blocks** *(experimental since 5.36)* — a scope-exit guard that runs cleanup code unconditionally when a block exits, whether normally or via exception — a natural replacement for destructor-based scope-guard objects and an important pattern for resource management in data pipelines.

#### Perl 5.38 — July 2023

- **`PERL_RAND_SEED` environment variable** *(5.38)* — setting this variable before a run makes every `rand` call (without an explicit `srand`) produce the same sequence, enabling **reproducible** stochastic algorithms — simulations, random sampling, Monte Carlo methods — without modifying source code.

- **`class` / `field` / `method` syntax** *(experimental since 5.38)* — a purpose-built, lexically-scoped object system requiring neither `bless` nor `@ISA` nor any CPAN module.  Useful for defining typed value objects such as dataset rows, model parameters, or pipeline stages:

```perl
  use feature 'class';
  no warnings 'experimental::class';

class Vector2D {
      field $x :param;
      field $y :param;
      method magnitude { sqrt($x**2 + $y**2) }
  }
  my $v = Vector2D->new(x => 3, y => 4);
  say $v->magnitude;    # 5
  ```

#### Perl 5.40 — June 2024

- **`try` / `catch` exception handling** *(stable since 5.40; experimental since 5.34; `finally` block added in 5.36)* — structured exception handling is now a core language feature; no CPAN module required:

```perl
  use v5.40;
  try {
      my $result = load_and_process($file);
  }
  catch ($e) {
      warn "Pipeline error: $e";
  }
  finally {
      close_resources();   # runs whether or not an exception was thrown
  }
  ```

(`Try::Tiny` / `Feature::Compat::Try` are only needed when targeting perls older than 5.34.).

- **Multi-value `for` loops** *(stable since 5.40)* — see 5.36 entry above; they graduated from experimental to stable in this release.

- **`builtin::inf` and `builtin::nan`** *(experimental since 5.40)* — typed floating-point infinity and Not-a-Number constants, eliminating `9**9**9` or POSIX hacks in numerical code.

- **`^^` logical XOR operator** *(5.40)* — completes the medium-precedence logical operator set (`&&`, `||`, `^^`); handy for boolean mask operations.

- **`use v5.40` imports builtin functions** — beyond enabling the feature bundle, `use v5.40` also imports the corresponding `builtin` version bundle, making all stable `builtin::` functions available as short names without a separate `use builtin` statement.

#### Longstanding features (pre-5.36).

- **`say` and `state`** *(since 5.10)* — `say` is `print` with an implicit newline; `state` declares a lexical that persists across invocations of its enclosing sub (a lightweight memoisation primitive).

- **First-class references and closures** — anonymous subs, closures, and reference construction are fundamental and have been stable since Perl 5.

- **`use constant`** or the CPAN `Readonly` module for named constants; `Readonly` enforces deep immutability that `use constant` does not.

Combined with [`perlbrew`](https://perlbrew.pl/) or [`plenv`](https://github.com/tokuhirom/plenv) for version management and [`carton`](https://metacpan.org/pod/Carton) for reproducible dependency snapshots, a modern Perl project looks and feels like a first-class software engineering effort.

### Honest limitations

No case for Perl is complete without honesty about where it falls short:

- **Visualisation** — Perl has no equivalent to `ggplot2` or `matplotlib`. Plots typically require an external call to R, gnuplot, or a web library. At times this weakness can become an actual strength, allowing one to use Perl5 as the application language that orchestrates and enhances the other actors.

- **Community momentum** — the data-science community has converged on Python and R. Finding ready-made tutorials, Stack Overflow answers, and co-authors is harder.

- **Object orientation** — without Moose/Moo the OOP model is verbose; with them it adds a dependency. The new `class` feature may solve some of these problems

- **Type safety at scale** — the core language's dynamic scalars make large, collaborative numerical codebases harder to reason about (see next section).

---

## 2. The Perl Data-Type System — Strengths and Cache-Era Limits <a id="the-perl-data-type-system"></a>

### Core Perl types

Perl's fundamental data model centres on three constructs:

| Construct | Sigil | What it holds |
|-----------|-------|---------------|
| **Scalar** | `$` | A single value: number, string, reference, or `undef` |
| **Array** | `@` | An ordered list of scalars, indexed by integer |
| **Hash** | `%` | An unordered collection of scalar values keyed by string |

Everything else — objects, closures, complex data structures — is built from these three primitives via *references* (`\@array`, `\%hash`, `sub { ... }`).

This model is extraordinarily flexible.  A single array can hold integers, floating-point numbers, strings, and nested references simultaneously.  That flexibility is exactly what made Perl the dominant system-administration and web-scripting language for two decades.

### The cache-hierarchy problem

Modern CPUs achieve peak throughput only when data flows through L1/L2/L3 cache<sup><a id="cache-ref" href="#fn-cache">†</a></sup> in large, contiguous blocks — a property called *spatial locality*.  Perl arrays do not provide this.  Under the hood, a Perl array is a C array of *pointers* to heap-allocated scalar (`SV`) structs.  Each scalar carries a reference count, a type tag, and padding — typically 24–56 bytes per scalar on a 64-bit build.  Iterating over a million-element Perl array therefore involves a million pointer dereferences scattered across the heap, producing a cache-miss pattern that completely negates the speed advantage of modern SIMD pipelines.

A concrete consequence: a dot product of two 1 000-element vectors written in pure Perl is roughly **100–1000× slower** than the equivalent operation on a pair of PDL float ndarrays, which occupy two flat, 4 000-byte memory regions that fit comfortably in L1 cache.

### Contrast with R

R occupies a curious middle ground.  Like Perl, it is a dynamic, interpreted language — variables are untyped containers, functions are first-class values, and the interactive REPL is the primary development environment.  R even has direct analogues to Perl's three core types:

| Perl concept | R analogue |
|---|---|
| `$scalar` | length-1 atomic vector or scalar-in-list |
| `@array` | `list()` |
| `%hash` | named `list()` |
| Reference (`\@arr`) | R does not use explicit references; copy-on-modify semantics instead |

But R's *workhorse* type, i.e.  the **atomic vector** has no straightforward Perl counterpart. An R atomic vector is a contiguous, homogeneously typed block of memory — exactly the layout that a CPU cache rewards.  Every built-in scalar in R is actually a length-1 atomic vector; there is no "bare scalar" outside of atomic vectors.

This design choice means that R code naturally operates on vectors of millions of doubles with BLAS-level throughput, without the user writing a single loop or allocating a special "array" object.

R's atomic types are:

| R atomic type | Storage | C equivalent |
|---|---|---|
| `logical` | 4 bytes/element | `int` (with NA sentinel) |
| `integer` | 4 bytes/element | `int32_t` |
| `double` | 8 bytes/element | `double` |
| `complex` | 16 bytes/element | `_Complex double` |
| `character` | pointer to CHARSXP | `char *` (interned) |
| `raw` | 1 byte/element | `uint8_t` |

R also defines higher-level structures built on atomic vectors:

- **matrix** — a 2-D atomic vector with a `dim` attribute.
- **array** — an N-D atomic vector with a `dim` attribute.
- **data.frame** — a named list of equal-length atomic vectors; the lingua franca of
  tabular data in R.
- **factor** — an integer vector with a `levels` attribute; encodes categorical data.

The lesson: R's computing performance when used in statistical and data science applications flows directly from its contiguous atomic vectors. Perl's equivalent path to performance is an extension (which also is a stand alone `matlab` like enviroment), the Perl Data Language [`PDL`](https://pdl.perl.org/).

---

## 3. Enter PDL: Strongly Typed N-Dimensional Arrays <a id="enter-pdl"></a>

The **Perl Data Language** (PDL, `pdl.perl.org`) extends Perl with *ndarrays* (N-dimensional arrays): contiguous, strongly typed memory buffers that look and feel like first-class Perl objects.

```perl
use PDL;

# A 1-D float ndarray — 4 bytes × 5 elements in one contiguous block
my $v = float( 1.0, 2.0, 3.0, 4.0, 5.0 );

# A 128-dimensional random database of 1000 vectors — all in cache-friendly memory
my $db = random( 128, 1000 );   # double by default

# Dot product of every DB vector against a query — a single BLAS call
my $scores = $db x $query->transpose;
```

### Типы примитивов PDL

PDL предоставляет полную палитру числовых типов C в качестве первоклассных конструкторов:

| Тип PDL | Байты | Тип C | Конструктор |
|---|---|---|---|
| `байт` | 1 | `uint8_t` | `байт(...)` |
| `короткий` | 2 | `int16_t` | `короткий(...)` |
| `ushort` | 2 | `uint16_t` | `рогоносец(...)` |
| `длинный` | 4 | `int32_t` | `длинный(...)` |
| `инд` 4 или 8 | `ssize_t` | `Индекс(...)` |
| `длинный` | 8 | `int64_t` | `длинный(...)` |
| `плавать` | 4 | `плавать` | `плавать(...)` |
| `удвоить` | 8 | `удвоить` | `двойной(...)` |
| `пла́вающий` | 8 | `_Комплексное плавание` | `cfloat(...)` |
| `двойка` |16 | | `_Сложный двойной` | `cdouble(...)` |

### Резьба и SIMD

Один из PDL'Наиболее отличительными особенностями являются *неявные потоки *: операции автоматически транслируются по дополнительным измерениям, устраняя явные циклы в пользовательском коде и делегируя внутренние циклы оптимизированным ядрам C или Fortran.  В сочетании с `set_autopthread_targ(N)`, PDL автоматически распараллеливает независимые срезы поперек `N` Потоки ОС – без записи пользователем одного `отрастать` или `Поток::Очередь` звоните.

### Недопустимые значения

PDL имеет встроенную концепцию *плохих значений* (`PDL::плохой`), непосредственно аналогично R'с `Н/Д`. ndarray может быть помечен как "осведомленность о плохом значении", и операции PDL правильно распространяют дефекты с помощью арифметики, статистики и ввода-вывода.

---

## 4. Сравнение типов: Perl, PDL и R бок о бок <a id="type-comparison-table"></a>

В таблице ниже каждый часто используемый тип R сопоставляется с его ближайшими аналогами Perl и PDL, выделяя, где три языка согласуются, различаются или дополняют друг друга.

| Тип R | эквивалент Perl | эквивалент PDL | Заметки |
|---|---|---|---|
| `удвоить` (длина-1) `$x = 3,14` (скалярный) `двойной(3.14)` – форма `()` R не имеет чистого скаляра; все является вектором.
| `целое число` (длина-1) `$n = 42` (скалярный) `длинные(42)` | |
| `логический` (длина-1) `$flag = 1` / `$flag = 0` | `байт(1)` Перл использует правдивость; PDL использует 0/1 байт.
| `удвоить` вектор | `@arr = (1.1, 2.2, 3.3)` | `двойной(1.1, 2.2, 3.3)` | PDL: непрерывный; `@arr`: массив указателей |
| `целое число` вектор | `@arr = (1, 2, 3)` | `длинный(1, 2, 3)` | |

| Тип R | эквивалент Perl | эквивалент PDL | Заметки |
|---|---|---|---|
| `логический` вектор | `@flags = (1, 0, 1)` | `байт(1, 0, 1)` | |
| `комплекс` вектор | – (без встроенных) | `cdouble(...)` | Потребности Perl `Математика::Комплекс`; PDL имеет встроенную поддержку |
| `характер` вектор | `@strs = ('a','b')` | – (не числовой) | PDL работает только на числах |
| `необработанный` вектор | `упаковка'C*', @bytes)` | `байт(...)` | |
| `Н/Д` | `неопределённая` | Неверное значение в ndarray | Плохие значения PDL распространяются, как R'с `Н/Д` |

| Тип R | эквивалент Perl | эквивалент PDL | Заметки |
|---|---|---|---|
| `NULL` | `неопределённая` в контексте списка | – |
| `список` | `@array` или ссылка `\@array` | — | |
|имя | `список` | `%hash` или `\%хеш` | — | |
| `матрица` (2-D) | массив массивов `@aoa` | 2D ndarray `pdl()[[...],[...]])` | PDL: основной столбец; R: основной столбец |
| `массив` (N-D) | вложенные ссылки | N-D ndarray `$x->обновить(...)` | |
| `data.frame` | `%hash` из `@arrays` | 2-D ndarray (числовые столбцы) + Perl хэш (смешанный) | Нет однозначных карт типа PDL точно |

| Тип R | эквивалент Perl | эквивалент PDL | Заметки |
|---|---|---|---|
| `фактор` | таблица поиска хеша + `@indices` | `длинный` Ндаррей + Перл `@levels` массив |
| `окружающая среда` | `%hash` или пространство имен пакета | |
| `вечеринка` / закрытие | `нижн.индекс { ... }` / закрытие | – | PDL PP определяет скомпилированные ядра |
| `S3 / S4 объект` | благословленная ссылка + метод диспетчеризации | PDL объект (благословенный ndarray) | PDL объекты первого класса объектов Perl |

### Основные выводы

- Для **чистых числовых, однородных данных** (векторов, матриц, тензоров), PDL ndarrays и R атомные векторы функционально эквивалентны и сопоставимо эффективны.

- Для **гетерогенных табличных данных** (смешанные типы, строковые столбцы, факторы), R'с `data.frame` является более эргономичным; Perl обычно использует хэш массивов или выделенный модуль, такой как `Данные::Рамка` или `PDL::IO::CSV`.

- Для **текста, неправильных структур и системного клея**, Перл'Родные типы превосходят как R, так и Python.

Таким образом, комбинация Perl+PDL обеспечивает *союз* того, что R предлагает в качестве статистического языка, и того, что Perl предлагает в качестве системного языка – за счет более крутой кривой обучения и менее готового, откровенно ограниченного статистического инструментария.

Однако комбинация Perl+PDL+R (при этом последний используется как компонент, или [инструментализированный](https://chrisarg.github.io/Killing-It-with-PERL/2025/01/18/Timing-Peak-DRAM-Use-In-R-With-Perl-Part-1.html) через Perl).

---

## 5. Дорожная карта: что покрывает остальная часть этой серии <a id="road-map"></a>

В этой серии описывается создание **векторного ядра базы данных**, встроенного в Perl5 + PDL с нуля.  Векторные базы данных лежат в основе современных конвейеров генерации с расширенным извлечением (RAG), семантического поиска и систем рекомендаций ближайших соседей.  Внедрение одного из первых принципов является отличным средством для демонстрации PDL'числовые возможности вместе с Perl'сильных сторон систем-программирования.

Каталог, совместно разработанный вместе с этими сообщениями, содержит следующие компоненты, каждый из которых будет предметом одного или нескольких выделенных сообщений, которые будут ссылаться на файлы в выделенном репозитории.

### Post 1 – Сериализация и ввод-вывод: `VectorIO` модуль

*Файл: `VectorIO.pm`*

Двигатель хранит векторы как упакованные бинарные blobs внутри [MessagePack](https://msgpack.org/) полезные нагрузки.  Эта статья охватывает:

- Проектирование модуля с чистым `Экспортер`на основе общедоступного API под `использование v5.40`.
- Помощники проверки, обеспечивающие правильность схемы на границах системы.

### Post 2 – Моделирование векторной базы данных

*Файл: `simulate_vectorDB.pl`*

Прежде чем искать базу данных, нужно ее выполнить.  Это сообщение показывает:

- Создание воспроизводимых случайных поплавковых векторов с `PDL::случайный`.
- Использование `GetOpt::Длинные` для эргономичного анализа параметров CLI.
- Написание a `--семян`-контролируемое моделирование, которое создает идентичные базы данных в разных прогонах, что важно для бенчмаркинга.

### Post 3 – Бенчмаркинг: The `timing_DB` Модуль

*Файл: `timing_DB.pm`*

Требования к исполнению требуют измерения.  Это сообщение представляет:

- Многоразовый бенчмаркинг Perl, построенный на `Время::HiRes`.
- Методология сравнения справедливых настенных часов между реализациями Perl/PDL и R.
- Интерпретация пропускной способности (векторы/секунды) в сравнении с задержкой (мс/запрос) для различных размеров рабочих нагрузок.

### Post 4 – Кластеризация K-средств с `PDL::Статы::Kmeans`

*Файл: `kmeans.pl`*

Кластеризация K-средних – это основа подхода инвертированного индекса (IVF) к приближенному поиску ближайших соседей.  Эта статья охватывает:

- The `PDL::Статы::Kmeans` интерфейс и договор возврата (`центроид`, `кластер`, `н`, `R2`, `СС`).
- Перевод `[ось × скопления]` маска членства возвращена `run_kmeans`.
- Сравнение центроидов Perl/PDL k-средних по отношению к R'с `kmeans()` и `ClusterR::MiniBatchKmeans()` для проверки числовой корректности.

### Post 5 – Мини-пакетные K-средства: масштабирование до больших наборов данных

*Файл: `compare_kmeans_centroids.pl`*

Для полного k-средства требуются все данные в памяти для каждой итерации.  Mini-batch k-means торгует небольшим количеством центроидной точности для значительного сокращения объема памяти и вычислительных ресурсов.  Этот пост исследует:

- Реализация подлинной повторно подобранной мини-пакетной петли в PDL.
- Количественный дрейф центроидов между полным и мини-пакетным вариантами.
- Боковой выход с R'с `MiniBatchKmeans` из `ClusterR` пакет.

### Post 6 – Поиск инвертированных файлов (IVF).

*Файл: `compare_ivf_search.pl`*

С центроидами в руке мы можем разбить базу данных и выполнить подлинейный приблизительный поиск ближайшего соседа.  Эта статья охватывает:

- Создание перевернутых списков: отображение каждого вектора базы данных на ближайший центроид.
- The `unpack_inverted_lists` помощник в `VectorIO`.
- Querying: поиск ближайших центроидов верхнего K, затем поиск только этих списков.
- Сравнение точности и скорости, поскольку количество проверенных списков варьируется.

### Post 7 – Проверка против R: Численная правильность и межязыковые трубопроводы

*Файлы: `compare_kmeans_centroids.R`, `compare_kmeans_centroids_pure.R`, `plot_centroid_coordinates.R`*

Окончательный пост в серии фундаментов закрывает петлю между Perl и R:

- Экспорт результатов PDL в CSV и чтение их в R для независимой проверки.
- Использование ggplot2 для визуализации координат центроидов с обоих языков одновременно.
- шаблон рабочего процесса для "вычисления в Perl, визуализация в R" которые используют сильные стороны обеих экосистем.

---

> **Далее – Сообщение 1:** Сериализация и ввод-вывод с `VectorIO.pm`

---

<a id="fn-cache"></a>

**†** Современные ЦП имеют несколько уровней быстрой встроенной памяти под названием **cache** (L1, L2, L3), которые находятся между ядрами процессора и основной оперативной памятью.  L1 является самым маленьким (обычно 32–64 КБ на ядро) и самым быстрым (задержка 1–4 часовых циклов); L2 больше (256 КБ–1 МБ) и немного медленнее; L3 делится между ядрами (4–64 МБ) с более высокой задержкой.  Основная оперативная память находится дальше с задержкой 60–100 нс – примерно в 200 раз медленнее, чем L1.

Когда вычисление затрагивает память в предсказуемом, непрерывном шаблоне, аппаратная программа *prefetcher* может загрузить предстоящие данные в L1/L2 до того, как это потребуется, обеспечивая почти пиковую пропускную способность.  Разрозненная погоня за указателями (например, обход массива Perl с распределенными по куче скалярами) побеждает предварительную выборку, останавливая процессор, пока он ожидает, что каждый недостаток кэша будет разрешен из оперативной памяти.

<!-- $Date: 2026-04-16 16:45:10 -0700 (Thu, 16 Apr 2026) $ $Author: $ $Revision: 31803 $ -->
