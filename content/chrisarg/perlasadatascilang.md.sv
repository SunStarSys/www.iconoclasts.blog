---
archived: ~
categories: Perl
dependencies: '*.md.sv'
keywords: pdl,perl5
published: ~
status: avslutad
title: Perl5 som datavetenskapsspråk
---

<div class="right">

![Datavetenskap](perlasadatascilang.page/datasci).

</div>

> **Serieintroduktion – Post 0 av N**
> Det här inlägget är det första i en serie som dokumenterar samutvecklingen av en vektor-databasmotor (VDBE) skriven helt i Perl5 + PDL.  Senare inlägg går igenom varje komponent i den motorn; den här sätter scenen. Den viktigaste drivkraften för denna serie är INTE att du dumpar din VDBE eftersom jag inte gör några prestandakrav, men för att visa hur man kan använda Perl för att uppnå i stort sett allt du kan uppnå med något annat språk, men smartare!

---

## Innehållsförteckning

[TOC]

---

## 1. Varför Perl5 för datavetenskap? <a id="why-perl5-for-data-science"></a>

När dataforskare diskuterar språkval konvergerar konversationen snabbt på Python, R eller Julia.  Perl5 får sällan en plats vid bordet - men det bär en övertygande uppsättning egenskaper som förtjänar en andra titt. Dessa egenskaper har inte förändrats väsentligt genom åren (Perl5 har alltid varit så!), men om inte {# lede #}Du har blivit utsatt för språket och lärt dig att uppskatta dess tercity, rationalitet, flexibilitet, uttrycksfullhet och faktiskt använt det för att driva ditt arbete framåt.{# lede #}, du skulle inte veta att dessa funktioner inte bara kommer gratis med Perl5, men kan hjälpa dig att driva dina projekt framåt.

### Ubiquity och driftsättning utan installation

Perl5 levereras som standardkomponent i praktiskt taget alla UNIX-liknande operativsystem – Linux-distributioner, macOS, BSD:er och många inbäddade Linux-miljöer innehåller alla en fungerande `möjligen` Binär ur lådan.  Python har gjort inbrytningar här, men det är fortfarande vanligt att hitta huvudlösa servrar, nätverksenheter eller HPC-inloggningsnoder
där Perl är närvarande och en full Python stack är inte.  En datapipeline skriven i Perl kan köras dag ett utan en `conda` miljö, a `venv`eller en container.

### Portabilitet från datacentret till kanten

Samma skript som analyserar en terabyte-datamängd på en 256-kärnig HPC-nod kan, med mindre konfigurationsändringar, köras på en Raspberry Pi, en IoT-gateway eller en inbäddad styrenhet.  Perl'en binär distributionsmodell och låga administrationskostnader gör den till en äkta "skriv en gång, kör var som helst" Språk i miljöer där Python's tolk overhead eller Julia'JIT uppvärmningstid skulle vara oacceptabelt.

Om du planerar att distribuera var som helst och _everywhere_ Perl5 är ditt självklara val.

### Ett arv byggt på text- och datamunging

Perl har utformats från grunden för textbearbetning, reguljära uttryck och "lim" arbete mellan systemkomponenter.  I praktiken domineras vetenskapliga datapipeliner inte av numerisk beräkning utan av *dataskryptering*: läsning av heterogena filformat, rengöring av röriga poster, koppling av datamängder från olika källor och dirigering av resultat till nedströmskrävande komponenter.

Perl'regex-motorn är fortfarande bland de mest kraftfulla tillgängliga, och en-liners kan utföra datarengöringsuppgifter som skulle kräva hjälpbibliotek på andra språk.

Om du är inom området vetenskaplig databehandling kan du ha stött på begreppet *arbetsflödeshanteringssystem *och *reproducerbar forskning *. De är båda beroende av exekveringen av heltäckande datatransformeringar och arbetsflöden för att eliminera de manuella, felbenägna och tråkiga peka och klicka-aktiviteter som analytiker och forskare måste göra för att omvandla sina data till insikter respektive slutsatser.

I denna modiga nya värld, Perl5's rika historia gör det möjligt att lysa både som en komponent i arbetsflöden, eller som ett applikationsspråk som implementerar dessa arbetsflöden.

### CPAN: ett stridstestat modulekosystem

Det omfattande Perl Archive Network (CPAN) är värd för över 200 000 moduler över alla tänkbara domäner.  Medan datavetenskapserbjudandena inte är nästan lika omfattande som Python, finns de grundläggande komponenterna för dedikerade byggare där:

- **PDL** (Perl Data Language) – vektoriserad numerisk databehandling med starkt typangivna N-dimensionella matriser (täckt på djupet nedan).

- **PDL::Stats** – beskrivande statistik, regression, klustring (k-means, mini-batch k-means) och mer, byggd ovanpå PDL ndarrays.

- **AI::MXNet**, **AI::TensorFlow** – djupinlärningsbindningar.

- **Statistik::Regression**, **Statistik::Beskrivning** — klassisk statistik utan PDL-beroendet.

- **Text::CSV**, **Kalkylblad::XLSX**, **Data::MessagePack**, **Sereal** — serialisering med hög prestanda och I/O.

- **DBI** + dussintals databasdrivrutiner - SQL-åtkomst till alla större RDBMS.

- **MCE** (Many-Core Engine) – strukturerad parallellitet för arbetsbelastningar med delade och distribuerade minnen.

- **Inline::C**, **Inline::CPP** — bädda in C- eller C++-kod direkt i en Perl-källfil; kompilatorn anropas transparent första gången skriptet körs, vilket gör det trivialt att släppa prestandakritiska kärnor i ett annars rent-Perl-program utan ett fullständigt XS-byggsystem.

- **FFI::Platypus** — anropsfunktioner i ett delat bibliotek (`så` / `.dylib` / `.dll`) från Perl utan att skriva en enda rad med XS- eller C-limkod.  Platypus stöder alla C-ekvivalenta typer, strukturer, återuppringningar och nedstängningar, och är det moderna sättet att binda Perl till BLAS, LAPACK, HDF5 eller något annat ursprungligt bibliotek.

### Modern Perl är inte din farfar's Perl

Funktionerna nedan är hämtade direkt från den officiella releaseinformationen (`perl5360delta`, `perl5380delta`, `perl5400delta`) och organiseras av den utgåva där de uppnådde status **stabil** eller först introducerades. Endast funktioner som är relevanta för arbetsbelastningar inom datavetenskap och vetenskaplig beräkning markeras.

#### Perl 5.36 – maj 2022

- **`Använd v5.36`** — funktionspaketet aktiveras nu automatiskt `använd varningar` och `använd strikt`. Det inaktiverar också `indirekt` metod-call syntax och `flerdimensionell` hash-key simulering, vilket eliminerar två vanliga källor till subtila buggar.

- **Namngivna subrutinsignaturer** *(stabil sedan 5.36; experimentell sedan 5.20)* – funktionsparametrar deklareras nu med namn, med valfria standardvärden. Den `//=` och `||=` Operatorer med standardvärden har lagts till i signaturer i 5.38, vilket tillåter standardvärden som utlöses på `ofördelaktig` eller falskhet respektive:

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

### PDL-primitiva typer

PDL exponerar hela paletten av C numeriska typer som förstklassiga konstruktorer:

| PDL-typ | Byte | C-typ | Konstruktör |
|---|---|---|---|
| `byte` | 1 | `uint8_t` | `byte(...)` |
| `kortslutning` | 2 | `int16_t` | `kort(...)` |
| `kohort` | 2 | `uint16_t` | `Om oss(...)` |
| `hög` | 4 | `int32_t` | `lång(...)` |
| `indx` 4 eller 8 | `ssize_t` | `indx(...)` |
| `lång` | 8 | `int64_t` | `långa(...)` |
| `flyta` | 4 | `flyta` | `flyta(...)` |
| `fördubbla` | 8 | `fördubbla` | `dubbel(...)` |
| `toalett` | 8 | `_Komplex flyttal` | `Cfloat(...)` |
| `dubbel` | 16 | `_Komplex dubbel` | `dubbel(...)` |

### Gängning och SIMD

En av PDL's mest distinkta funktioner är *implicit trådning *: operationer sänds automatiskt över extra dimensioner, vilket eliminerar explicita slingor i användarkoden och delegerar inre slingor till optimerade C- eller Fortran-kärnor.  Kombinerad med `set_autopthread_targ(N)`, PDL parallelliserar automatiskt oberoende segment över `N` OS-trådar – utan att användaren skriver en enda `vägskäl` eller `Tråd::Kö` ring.

### Felaktiga värden

PDL har ett inbyggt koncept med *dåliga värden* (`PDL::Fel`), direkt analogt med R's `Ej tillämpligt`. En ndarray kan flaggas som "medveten om dåligt värde", och PDL-åtgärder sprider ondska korrekt genom aritmetik, statistik och I/O.

---

## 4. Typjämförelse: Perl, PDL och R sida vid sida <a id="type-comparison-table"></a>

Tabellen nedan kartlägger varje vanlig R-typ till sina närmaste Perl- och PDL-motsvarigheter, och belyser var de tre språken är överens, skiljer sig åt eller kompletterar varandra.

| R typ | Perl ekvivalent | PDL ekvivalent | Anmärkningar |
|---|---|---|---|
| `fördubbla` (längd-1) | `$x = 3,14` (skalär) | `dubbel(3.14)` — form `()` R har ingen skalär; allt är en vektor
| `heltal` (längd-1) | `$n = 42` (skalär) | `lång(42)` | |
| `logisk` (längd-1) | `$flag = 1` / `$flag = 0` | `byte(1)` Perl använder sanningsenlighet; PDL använder 0/1 byte |
| `fördubbla` vektor | `@arr = (1.1, 2.2, 3.3)` | `dubbel (1.1, 2.2, 3.3)` | PDL: sammanhängande; `@arr`: pekaruppställning |
| `heltal` vektor | `@arr = (1, 2, 3)` | `lång(1, 2, 3)` | |

| R typ | Perl ekvivalent | PDL ekvivalent | Anmärkningar |
|---|---|---|---|
| `logisk` vektor | `@flags = (1, 0, 1)` | `byte(1, 0, 1)` | |
| `komplex` vektor | — (ingen inbyggd) | `dubbel(...)` Perl behov `Matematik::Komplex`PDL har inbyggt stöd.
| `skrivtecken` vektor | `@strs = ('år','b)')` | — (inte numeriskt) | PDL används endast på nummer |
| `rå` vektor | `pack('C*', @bytes)` | `byte(...)` | |
| `Ej tillämpligt` | `ofördelaktig` | Dåligt värde i ndarray | PDL dåliga värden sprids som R's `Ej tillämpligt` |

| R typ | Perl ekvivalent | PDL ekvivalent | Anmärkningar |
|---|---|---|---|
| `NULL` | `ofördelaktig` i förteckningssammanhang | — | |
| `lista` | `@array` eller referens `\@array` | — | |
| namngiven `lista` | `% hash` eller `\%hash` | — | |
| `matris` (2-D) | array-of-arrays `@aoa` | 2D ndarray `pdl([[...],[...]])` | PDL: kolumnhuvudämne; R: kolumnhuvudämne |
| `uppställning` (N-D) | kapslade referenser | N-D ndarray `$x->reshape(...)` | |
| `data.frame` | `% hash` av `@arrays` | 2-D ndarray (numeriska kolon) + Perl hash (blandad) | Inga enskilda PDL-typkartor exakt |

| R typ | Perl ekvivalent | PDL ekvivalent | Anmärkningar |
|---|---|---|---|
| `faktor` | hash söktabell + `@indices` | `hög` ndarray + perl `@levels` uppställning | |
| `miljö` | `% hash` eller paketnamnrymd | — | |
| `funktion` / stängning | `nedsänkt { ... }` / stängning | — | PDL PP definierar sammanställda kärnor |
| `Objektet S3/S4` | välsignad referens + metodutskick | PDL objekt (välsignad ndarray) | PDL objekt är förstklassiga Perl objekt |

### Viktiga insikter

- För **rena numeriska, homogena data** (vektorer, matriser, tensorer), är PDL-ndarrays och R-atomvektorer funktionellt likvärdiga och jämförelsevis effektiva.

- För **heterogena tabelldata** (blandade typer, strängkolumner, faktorer), R's `data.frame` är mer ergonomisk; Perl använder vanligtvis en hash av arrayer eller en dedikerad modul som `Data::ram` eller `PDL::IO::CSV`.

- För **text, oregelbundna strukturer och systemlim**, Perl'De ursprungliga typerna är överlägsna både R och Python.

- Kombinationen av Perl+PDL ger därför *union* av vad R erbjuder som ett statistiskt språk och vad Perl erbjuder som ett systemspråk - på bekostnad av en brantare inlärningskurva och mindre out-of-the-box och uppriktigt sagt begränsad statistisk verktyg.

Kombinationen av Perl+PDL+R (med den senare som komponent, eller [instrumentaliserad](https://chrisarg.github.io/Killing-It-with-PERL/2025/01/18/Timing-Peak-DRAM-Use-In-R-With-Perl-Part-1.html) via Perl).

---

## 5. Vägkarta: Vad resten av denna serie täcker <a id="road-map"></a>

Den här serien dokumenterar konstruktionen av en **vektordatabasmotor** byggd i Perl5 + PDL från grunden.  Vektordatabaser bygger på moderna RAG-pipeliner (hämtningsförstärkta generering), semantisk sökning och rekommendationssystem närmaste granne.  Att genomföra en av de första principerna är ett utmärkt fordon för att demonstrera PDL's numeriska förmågor tillsammans med Perl'Styrkor med systemprogrammering.

Katalogen som samutvecklas tillsammans med dessa inlägg innehåller följande komponenter, som var och en kommer att vara föremål för en eller flera dedikerade inlägg som kommer att referera till filer i ett dedikerat arkiv.

### Post 1 – Serialisering och I/O: `VectorIO` modul

*Fil: `VectorIO.pm`*

Motorn lagrar vektorer som packade binära blobbar inuti [MessagePack](https://msgpack.org/) nyttolaster.  Det här inlägget täcker:

- Designa en modul med en ren `Exportör`-baserat offentligt API under `Använd v5.40`.
- Valideringshjälpmedel som upprätthåller schemanättighet vid systemgränser.

### Post 2 – Simulera en vektordatabas

*Fil: `simulate_vectorDB.pl`*

Innan vi kan söka i en databas behöver vi en.  Det här inlägget visar:

- Genererar reproducerbara slumpmässiga float vektorer med `PDL::slumpmässig`.
- Använda `GetOpt::Lång` för ergonomisk CLI-tolkning.
- Skriva en `--frö`-styrd simulering som producerar identiska databaser över körningar - viktigt för benchmarking.

### Post 3 – Riktmärkning: `timing_DB` Modul

*Fil: `timing_DB.pm`*

Prestationsanspråk kräver mätning.  Detta inlägg introducerar:

- En återanvändbar Perl benchmarking sele byggd på `Tid::HiRes`.
- Metodik för rättvisa väggklockjämförelser mellan Perl/PDL och R-implementationer.
- Tolkningsdataflöde (vektorer/sekund) kontra svarstid (ms/fråga) för olika arbetsbelastningsstorlekar.

### Post 4 — K-Means-klustring med `PDL::Stat::Kmedel`

*Fil: `kmeans.pl`*

K-medel klustring är ryggraden i inverterad fil index (IVF) tillvägagångssätt för ungefärlig närmaste granne sökning.  Det här inlägget täcker:

- Den `PDL::Stat::Kmedel` gränssnitt och dess returavtal (`centroid`, `kluster`, `n`, `R2`, `ss`).
- Att tolka `[obs × kluster]` medlemskapsmask returnerad av `run_kmeans`.
- Jämföra perl/PDL k-medel centroider mot R's `kmeans()` och `ClusterR::MiniBatchKmeans()` för att validera numerisk korrekthet.

### Inlägg 5 — Mini-Batch K-Means: Skalning till stora datamängder

*Fil: `compare_kmeans_centroids.pl`*

Full k-means kräver alla data i minnet för varje iteration.  Mini-batch k-medel handlar en liten mängd centroid noggrannhet för en stor minskning av minne och beräkning.  Denna artikel utforskar:

- Genomföra en sann återsamplad mini-batch loop i PDL.
- Kvantifiera centroid drift mellan full och mini-batch varianter.
- Utgång sida vid sida med R's `MiniBatchKmeans` från `ClusterR` paket.

### Inlägg 6 — Sökning efter index för inverterad fil (IVF).

*Fil: `compare_ivf_search.pl`*

Med centroider i handen kan vi partitionera databasen och utföra sublinjär ungefärlig närmaste granne sökning.  Det här inlägget täcker:

- Bygga inverterade listor: kartlägga varje databasvektor till närmaste centroid.
- Den `unpack_inverted_lists` hjälpare i `VectorIO`.
- Querying: söka efter de närmaste centroiderna i topp-K och sedan endast söka efter dessa listor.
- Noggrannhet vs. hastighet avvägningar som antalet probed listor varierar.

### Post 7 – Validering mot R: Numerisk korrekthet och korsspråkiga pipeliner

*Filer: `compare_kmeans_centroids.R`, `compare_kmeans_centroids_pure.R`, `plot_centroid_coordinates.R`*

Det sista inlägget i grundserien stänger slingan mellan Perl och R:

- Exportera PDL-resultat till CSV och läsa dem i R för oberoende validering.
- Använda ggplot2 för att visualisera centroidkoordinater från båda språken samtidigt.
- Ett arbetsflödesmönster för "beräkna i Perl, visualisera i R" som utnyttjar styrkorna i båda ekosystemen.

---

> **Nästa upp – Post 1:** Serialisering och I/O med `VectorIO.pm`

---

<a id="fn-cache"></a>

**†** Moderna processorer har flera nivåer av snabbt minne på chip som kallas **cache** (L1, L2, L3) som sitter mellan processorkärnorna och huvud-RAM.  L1 är den minsta (vanligtvis 32-64 KB per kärna) och snabbaste (1-4 klockcykler latens); L2 är större (256 KB-1 MB) och något långsammare; L3 delas över kärnor (4-64 MB) med högre latens fortfarande.  Huvud RAM sitter längre bort vid 60-100 ns latens - ungefär 200× långsammare än L1.

När en beräkning berör minnet i ett förutsägbart, sammanhängande mönster kan maskinvaran *prefetcher* ladda kommande data till L1/L2 innan det behövs, vilket ger ett nästan högt dataflöde.  Spridd pekarsökning (t.ex. genom att korsa en Perl-matris med heap-allokerade skalärer) besegrar förhämtning, stoppar processorn medan den väntar på att varje cache-miss ska lösas från RAM.

<!-- $Date: 2026-04-16 16:45:10 -0700 (Thu, 16 Apr 2026) $ $Author: $ $Revision: 31803 $ -->
