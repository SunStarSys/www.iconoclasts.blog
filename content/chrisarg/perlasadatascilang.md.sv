---
categories: Perl, PDL
dependencies: '*.md.sv'
keywords: pdl,perl5
status: avslutad
title: Perl5 som datavetenskapsspråk
---

<div class="right">

![Datavetenskap](perlasadatascilang.page/datasci)

</div>

> **Serieintroduktion – Post 0 av N**
> Det här inlägget är det första i en serie som dokumenterar samutvecklingen av en vektor-databasmotor (VDBE) skriven helt i Perl5 + PDL.  Senare inlägg går igenom varje komponent i den motorn; den här sätter scenen. Den viktigaste drivkraften för denna serie är INTE att du dumpar din VDBE eftersom jag inte gör några prestandakrav, men för att visa hur man kan använda Perl för att uppnå i stort sett allt du kan uppnå med något annat språk, men smartare!

---

[TOC]#sidebar

## 1. Varför Perl5 för datavetenskap? <a id="why-perl5-for-data-science"></a>

När dataforskare diskuterar språkval konvergerar konversationen snabbt på Python, R eller Julia.  Perl5 får sällan en plats vid bordet - men det bär en övertygande uppsättning egenskaper som förtjänar en andra titt. Dessa egenskaper har inte förändrats väsentligt genom åren (Perl5 har alltid varit så!), men {# lede #}Om du inte har blivit utsatt för språket och lärt dig att uppskatta dess tercity, rationalitet, flexibilitet, uttrycksfullhet och faktiskt använt det för att driva ditt arbete framåt, skulle du inte veta att dessa funktioner inte bara kommer gratis med Perl5, men kan hjälpa dig att driva dina projekt framåt{# lede #}.

### Ubiquity och driftsättning utan installation

Perl5 levereras som standardkomponent i praktiskt taget alla UNIX-liknande operativsystem – Linux-distributioner, macOS, BSD:er och många inbäddade Linux-miljöer innehåller alla en fungerande `perl` Binär ur lådan.  Python har gjort ingrepp här, men det är fortfarande vanligt att hitta huvudlösa servrar, nätverksenheter eller HPC-inloggningsnoder där Perl är närvarande och en full Python-stack är inte.  En datapipeline skriven i Perl kan köras dag ett utan en `conda` miljö, a `venv`eller en container.

### Portabilitet från datacentret till kanten

Samma skript som analyserar en terabyte-datamängd på en 256-kärnig HPC-nod kan, med mindre konfigurationsändringar, köras på en Raspberry Pi, en IoT-gateway eller en inbäddad styrenhet.  Perls enbinära distributionsmodell och låga exekveringskostnader gör den till en äkta "skriv en gång, kör var som helst" språk i miljöer där Pythons tolk overhead eller Julias JIT uppvärmningstid skulle vara oacceptabelt.

Om du planerar att distribuera var som helst och _everywhere_ Perl5 är ditt självklara val.

### Ett arv byggt på text- och datamunging

Perl har utformats från grunden för textbearbetning, reguljära uttryck och "lim" arbete mellan systemkomponenter.  I praktiken domineras vetenskapliga datapipeliner inte av numerisk beräkning utan av *dataskryptering*: läsning av heterogena filformat, rengöring av röriga poster, koppling av datamängder från olika källor och dirigering av resultat till nedströmskrävande komponenter.

Perls regex-motor är fortfarande bland de mest kraftfulla tillgängliga, och one-liners kan utföra datarengöringsuppgifter som skulle kräva hjälpbibliotek på andra språk.

Om du är inom området vetenskaplig databehandling kan du ha stött på begreppet *arbetsflödeshanteringssystem *och *reproducerbar forskning *. De är båda beroende av exekveringen av heltäckande datatransformeringar och arbetsflöden för att eliminera de manuella, felbenägna och tråkiga peka och klicka-aktiviteter som analytiker och forskare måste göra för att omvandla sina data till insikter respektive slutsatser.

I denna modiga nya värld gör Perl5 rika historia det möjligt att lysa både som en komponent i arbetsflöden, eller som ett applikationsspråk som implementerar dessa arbetsflöden.

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

- **FFI::Platypus** — anropsfunktioner i ett delat bibliotek (`.so` / `.dylib` / `.dll`) från Perl utan att skriva en enda rad med XS- eller C-limkod.  Platypus stöder alla C-ekvivalenta typer, strukturer, återuppringningar och nedstängningar, och är det moderna sättet att binda Perl till BLAS, LAPACK, HDF5 eller något annat ursprungligt bibliotek.

### Modern Perl är inte din farfars Perl

Funktionerna nedan är hämtade direkt från den officiella releaseinformationen (`perl5360delta`, `perl5380delta`, `perl5400delta`) och organiseras av den utgåva där de uppnådde status **stabil** eller först introducerades. Endast funktioner som är relevanta för arbetsbelastningar inom datavetenskap och vetenskaplig beräkning markeras.

#### Perl 5.36 – maj 2022

- **`use v5.36`** — funktionspaketet aktiveras nu automatiskt `use warnings` och `use strict`. Det inaktiverar också `indirect` metod-call syntax och `multidimensional` hash-key simulering, vilket eliminerar två vanliga källor till subtila buggar.

- **Namngivna subrutinsignaturer** *(stabil sedan 5.36; experimentell sedan 5.20)* – funktionsparametrar deklareras nu med namn, med valfria standardvärden. Den `//=` och `||=` Operatorer med standardvärden har lagts till i signaturer i 5.38, vilket tillåter standardvärden som utlöses på `undef` eller falskhet respektive:

```perl
  use v5.36;
  sub clamp ($val, $lo = 0, $hi //= 1) {
      $val < $lo ? $lo : $val > $hi ? $hi : $val;
  }
  ```

- **`isa` klassinstansoperator** *(stabil sedan 5.36; introducerad i 5.32)* — `$obj isa "ClassName"` returnerar ett booleskt värde; renare än `ref($obj) eq "ClassName"`.

- **`builtin` modul** *(stabil sedan 5.40; experimentell sedan 5.36)* — lexikalt importabla funktioner som är inbyggda direkt i tolken.  Det stabila 5.40-paketet innehåller bland annat:

- `ceil`, `floor` heltalsavrundning utan `use POSIX`.
  - `trim` — ta bort inledande/avslutande blanktecken från en sträng.
  - `indexed` - parar varje element med sitt index; den idiomatiska följeslagaren till flera värden `for` öglor (se nedan).
  - `true`, `false`, `is_bool` — Booleska sentineltyper; serialiserare kan nu avge JSON `true`/`false` snarare än `1`/`0`.
  - `weaken`, `unweaken`, `is_weak` — Kontroll av referensantal för att bygga dubbelriktade datastrukturer utan minnesläckor.
  - `blessed`, `reftype`, `refaddr` Referensintrospektion.

- **Tabell boolesk spårning** *(5.36)* – skalärer skapade som booleska värden (t.ex. `!!1`) behåller nu sin booleska karaktär genom tilldelning, vilket möjliggör tillförlitlig typmedveten serialisering till JSON och MessagePack.

- **Multivärde `for` loopar** *(stabil sedan 5.40; experimentell sedan 5.36)* Iterera över par eller N-tupler utan manuell indexaritmetik:

```perl
  use v5.40;
  use builtin 'indexed';

for my ($i, $val) (indexed @scores)  { ... } # index and value
  ```

Eller hämta flera värden samtidigt

```perl
  use v5.40;

for my ($val1, $val2, $val3) (@scores)  { ... }
  ```

- **`defer` block** *(experimentellt sedan 5.36)* – ett omfattnings-exit-skydd som kör rensningskoden villkorslöst när ett block avslutas, antingen normalt eller via undantag – en naturlig ersättning för destruktorbaserade omfattningsbevakningsobjekt och ett viktigt mönster för resurshantering i datapipeliner.

#### Perl 5.38 – juli 2023

- **`PERL_RAND_SEED` miljövariabel** *(5.38)* – ställer in den här variabeln innan en körning gör varje `rand` samtal (utan uttrycklig `srand`) producerar samma sekvens, vilket möjliggör **reproducerbara **stokastiska algoritmer - simuleringar, slumpmässig provtagning, Monte Carlo-metoder - utan att ändra källkoden.

- **`class` / `field` / `method` syntax** *(experimentellt sedan 5.38)* – ett specialbyggt, lexikaliskt begränsat objektsystem som inte kräver något `bless` och `@ISA` eller någon CPAN-modul.  Användbart för att definiera typangivna värdeobjekt, t.ex. datauppsättningsrader, modellparametrar eller pipelinesteg:

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

#### Perl 5.40 – juni 2024

- **`try` / `catch` undantagshantering** *(stabil sedan 5.40; experimentell sedan 5.34; `finally` block tillagt i 5.36)* – strukturerad undantagshantering är nu en huvudspråkfunktion; ingen CPAN-modul krävs:

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

(`Try::Tiny` / `Feature::Compat::Try` behövs endast vid målinriktning av perls äldre än 5,34.)

- **Multivärde `for` loopar** *(stabil sedan 5.40)* — se 5.36 posten ovan; de tog examen från experimentell till stabil i denna utgåva.

- **`builtin::inf` och `builtin::nan`** *(experimentell sedan 5.40)* — typade flytande-punkt oändlighet och Not-a-Number konstanter, eliminera `9**9**9` eller POSIX-hack i numerisk kod.

- **`^^` logisk XOR-operator** *(5.40)* – slutför den logiska operatoruppsättningen med medelhög prioritet (`&&`, `||`, `^^`); praktiskt för booleska maskoperationer.

- **`use v5.40` importerar inbyggda funktioner** – utöver att aktivera funktionspaketet `use v5.40` importerar även motsvarande `builtin` versionspaket, vilket gör alla stabila `builtin::` Funktioner tillgängliga som kortnamn utan separat `use builtin` sats.

#### Långvariga funktioner (före 5.36)

- **`say` och `state`** *(sedan 5.10)* — `say` är `print` med en implicit ny linje; `state` förklarar en lexikal som kvarstår över anrop av dess omslutande sub (en lätt primitiv memoar).

- **Referenser och stängningar i första klass** – anonyma del-, stängnings- och referenskonstruktioner är grundläggande och har varit stabila sedan Perl 5.

- **`use constant`** eller CPAN `Readonly` Modul för namngivna konstanter. `Readonly` genomdriver djup oföränderlighet som `use constant` gör det inte.

Kombinerad med [`perlbrew`](https://perlbrew.pl/) eller [`plenv`](https://github.com/tokuhirom/plenv) för versionshantering och [`carton`](https://metacpan.org/pod/Carton) För reproducerbara beroendeögonblicksbilder ser ett modernt Perl-projekt ut och känns som en förstklassig programvaruutveckling.

### Ärliga begränsningar

No case for Perl is complete without honesty about where it falls short:

- **Visualisering** – Perl har ingen motsvarighet `ggplot2` eller `matplotlib`. Plottningar kräver vanligtvis ett externt anrop till R, gnuplot eller ett webbbibliotek. Ibland kan denna svaghet bli en verklig styrka, så att man kan använda Perl5 som applikationsspråk som orkestrerar och förbättrar de andra aktörerna.

- **Gemenskapens drivkraft** - Datavetenskapssamhället har konvergerat på Python och R. Att hitta färdiga handledningar, Stack Overflow-svar och medförfattare är svårare.

- **Objektorientering** - utan Älg/Moo är OOP-modellen utförlig; med dem lägger det till ett beroende. Den nya `class` funktionen kan lösa några av dessa problem

- **Typsäkerhet i stor skala** – kärnspråkets dynamiska skalärer gör stora, samverkande numeriska kodbaser svårare att resonera om (se nästa avsnitt).

---

## 2. Perl Data-Type System – Styrkor och Cache-Era-gränser <a id="the-perl-data-type-system"></a>

### Kärna perl-typer

Perls grundläggande datamodell fokuserar på tre konstruktioner:

Konstruktion | Sigil | Vad den håller
|-----------|-------|---------------|
| **Skalär** | `$` | Ett enstaka värde: tal, sträng, referens eller `undef` |
| **Uppställning** | `@` | En ordnad lista över skalärer, indexerade efter heltal |
| **Hash** | `%` | En osorterad samling skalära värden som är indexerade efter sträng |

Allt annat - objekt, förslutningar, komplexa datastrukturer - byggs från dessa tre primitiver via *referenser *(`\@array`, `\%hash`, `sub { ... }`).

Denna modell är extremt flexibel.  En enskild array kan innehålla heltal, flyttal, strängar och kapslade referenser samtidigt.  Den flexibiliteten är precis vad som gjorde Perl till det dominerande systemadministrations- och webbskriptspråket i två decennier.

### Problemet med cachehierarkin

Moderna processorer uppnår toppdataflöde endast när data flödar genom cachen L1/L2/L3[^†] i stora, sammanhängande block - en egenskap som kallas *spatial locality*.  Perl-matriser tillhandahåller inte detta.  Under huven är en Perl-matris en C-matris med *pekare* till högallokerad skalär (`SV`) strukturerna.  Varje skalär har ett referensantal, en typtagg och utfyllnad - vanligtvis 24-56 byte per skalär på en 64-bitarsversion.  Iterera över en miljon-element Perl array innebär därför en miljon pekare avreferenser spridda över heap, vilket ger en cache-miss mönster som helt förnekar hastighetsfördelen med moderna SIMD rörledningar.

A concrete consequence: en punktprodukt av två 1 000-elementvektorer skrivna i ren Perl är ungefär **100-1000× långsammare** än motsvarande operation på ett par PDL-float ndarrays, som upptar två platta minnesregioner på 4 000 byte som passar bekvämt i L1-cachen.

### Jämför med R

R upptar en märklig medelväg.  Liksom Perl är det ett dynamiskt, tolkat språk - variabler är otypade behållare, funktioner är förstklassiga värden och den interaktiva REPL är den primära utvecklingsmiljön.  R har även direkta analoger till Perls tre kärntyper:

Perl koncept | R analog |
|---|---|
| `$scalar` | längd-1 atomär vektor eller skalär-i-lista |
| `@array` | `list()` |
| `%hash` | namngiven `list()` |
| Referens (`\@arr`) | R använder inte uttryckliga referenser; copy-on-modify semantik i stället |

Men R:s *arbetshäst* typ, dvs. den **atomiska vektorn** har ingen okomplicerad Perl motsvarighet. En R-atomvektor är ett sammanhängande, homogent typat minnesblock - exakt den layout som en CPU-cache belönar.  Varje inbyggd skalär i R är faktiskt en längd-1 atomär vektor; det finns ingen "blottad skalär" Utanför atomvektorer.

Detta designval innebär att R-kod naturligt fungerar på vektorer av miljontals dubbletter med BLAS-nivå genomströmning, utan att användaren skriver en enda slinga eller allokerar en speciell "uppställning" objekt.

R:s atomtyper är:

| R atomär typ | Lagring | C ekvivalent |
|---|---|---|
| `logical` | 4 byte/element | `int` (tillsammans med Nato) |
| `integer` | 4 byte/element | `int32_t` |
| `double` | 8 byte/element | `double` |
| `complex` | 16 byte/element | `_Complex double` |
| `character` | pekare till CHARSXP | `char *` (internerad) |
| `raw` | 1 byte/element | `uint8_t` |

R also defines higher-level structures built on atomic vectors:

- **matris** — en 2-D atomär vektor med en `dim` attribut
- **array** – en N-D-atomvektor med en `dim` attribut
- **data.frame** — en namngiven lista över atomvektorer av samma längd; lingua franca av
  tabelldata i R.
- **faktor** – en heltalsvektor med en `levels` attribut; kodar kategoriska data.

The lesson: R: s datorprestanda när den används i statistiska och datavetenskapliga applikationer flödar direkt från sina angränsande atomvektorer. Perls motsvarande väg till prestanda är en förlängning (som också är en fristående `matlab` som miljö), Perl Data Language [`PDL`](https://pdl.perl.org/).

---

## 3. Ange PDL: Starkt typade N-dimensionella uppställningar <a id="enter-pdl"></a>

**Perl-dataspråk** (PDL, `pdl.perl.org`) utökar Perl med *ndarrays *(N-dimensionella matriser): sammanhängande, starkt skrivna minnesbuffertar som ser ut och känns som förstklassiga Perl-objekt.

```perl
use PDL;

# A 1-D float ndarray — 4 bytes × 5 elements in one contiguous block
my $v = float( 1.0, 2.0, 3.0, 4.0, 5.0 );

# A 128-dimensional random database of 1000 vectors — all in cache-friendly memory
my $db = random( 128, 1000 );   # double by default

# Dot product of every DB vector against a query — a single BLAS call
my $scores = $db x $query->transpose;
```

### primitiva PDL-typer

PDL exposes the full palette of C numeric types as first-class constructors:

| PDL-typ | Byte | C-typ | Konstruktör |
|---|---|---|---|
| `byte` | 1 | `uint8_t` | `byte(...)` |
| `short` | 2 | `int16_t` | `short(...)` |
| `ushort` | 2 | `uint16_t` | `ushort(...)` |
| `long` | 4 | `int32_t` | `long(...)` |
| `indx` 4 eller 8 | `ssize_t` | `indx(...)` |
| `longlong` | 8 | `int64_t` | `longlong(...)` |
| `float` | 4 | `float` | `float(...)` |
| `double` | 8 | `double` | `double(...)` |
| `cfloat` | 8 | `_Complex float` | `cfloat(...)` |
| `cdouble` | 16 | `_Complex double` | `cdouble(...)` |

### Gängning och SIMD

En av PDL: s mest distinkta funktioner är *implicit trådning *: operationer sänds automatiskt över extra dimensioner, vilket eliminerar explicita loopar i användarkoden och delegerar inre loopar till optimerade C- eller Fortran-kärnor.  Kombinerad med `set_autopthread_targ(N)`, PDL parallelliserar automatiskt oberoende segment över `N` OS-trådar – utan att användaren skriver en enda `fork` eller `Thread::Queue` ring.

### Felaktiga värden

PDL har ett inbyggt koncept med *dåliga värden* (`PDL::Bad`), direkt analogt med R: s `NA`. En ndarray kan flaggas som "medveten om dåligt värde", och PDL-åtgärder sprider ondska korrekt genom aritmetik, statistik och I/O.

---

## 4. Typjämförelse: Perl, PDL och R sida vid sida <a id="type-comparison-table"></a>

Tabellen nedan kartlägger varje vanlig R-typ till sina närmaste Perl- och PDL-motsvarigheter, och belyser var de tre språken är överens, skiljer sig åt eller kompletterar varandra.

| {{table.csv_headers|join:" | "}} |
|---|---|---|---|
{% for row in table.content %}| {{row.r_type|safe}} | {{row.perl_equivalent|safe}} | {{row.pdl_equivalent|safe}} | {{row.notes|safe}} |
{% endfor %}

### Viktiga insikter

- För **rena numeriska, homogena data** (vektorer, matriser, tensorer), är PDL-ndarrays och R-atomvektorer funktionellt likvärdiga och jämförelsevis effektiva.

- För **heterogena tabelldata** (blandade typer, strängkolumner, faktorer), R `data.frame` är mer ergonomisk; Perl använder vanligtvis en hash av arrayer eller en dedikerad modul som `Data::Frame` eller `PDL::IO::CSV`.

- För **text, oregelbundna strukturer och systemlim** är Perls inhemska typer överlägsna både R och Python.

- Kombinationen av Perl+PDL ger därför *union* av vad R erbjuder som ett statistiskt språk och vad Perl erbjuder som ett systemspråk - på bekostnad av en brantare inlärningskurva och mindre out-of-the-box och uppriktigt sagt begränsad statistisk verktyg.

Kombinationen av Perl+PDL+R (med den senare som komponent, eller [instrumentaliserad](https://chrisarg.github.io/Killing-It-with-PERL/2025/01/18/Timing-Peak-DRAM-Use-In-R-With-Perl-Part-1.html) via Perl)

---

## 5. Vägkarta: Vad resten av denna serie täcker <a id="road-map"></a>

Den här serien dokumenterar konstruktionen av en **vektordatabasmotor** byggd i Perl5 + PDL från grunden.  Vektordatabaser bygger på moderna RAG-pipeliner (hämtningsförstärkta generering), semantisk sökning och rekommendationssystem närmaste granne.  Genomförandet av en av de första principerna är ett utmärkt verktyg för att visa PDL:s numeriska kapacitet tillsammans med Perls systemprogrammeringsstyrkor.

Katalogen som samutvecklas tillsammans med dessa inlägg innehåller följande komponenter, som var och en kommer att vara föremål för en eller flera dedikerade inlägg som kommer att referera till filer i ett dedikerat arkiv.

### Post 1 – Serialisering och I/O: `VectorIO` modul

*Fil: `VectorIO.pm`*

Motorn lagrar vektorer som packade binära blobbar inuti [MessagePack](https://msgpack.org/) nyttolaster.  Det här inlägget täcker:

- Designa en modul med en ren `Exporter`-baserat offentligt API under `use v5.40`.
- Valideringshjälpmedel som upprätthåller schemanättighet vid systemgränser.

### Post 2 – Simulera en vektordatabas

*Fil: `simulate_vectorDB.pl`*

Innan vi kan söka i en databas behöver vi en.  Det här inlägget visar:

- Genererar reproducerbara slumpmässiga float vektorer med `PDL::random`.
- Använda `GetOpt::Long` för ergonomisk CLI-tolkning.
- Skriva en `--seed`-styrd simulering som producerar identiska databaser över körningar - viktigt för benchmarking.

### Post 3 – Riktmärkning: `timing_DB` Modul

*Fil: `timing_DB.pm`*

Prestationsanspråk kräver mätning.  Detta inlägg introducerar:

- En återanvändbar Perl benchmarking sele byggd på `Time::HiRes`.
- Metodik för rättvisa väggklockjämförelser mellan Perl/PDL och R-implementationer.
- Tolkningsdataflöde (vektorer/sekund) kontra svarstid (ms/fråga) för olika arbetsbelastningsstorlekar.

### Post 4 — K-Means-klustring med `PDL::Stats::Kmeans`

*Fil: `kmeans.pl`*

K-medel klustring är ryggraden i inverterad fil index (IVF) tillvägagångssätt för ungefärlig närmaste granne sökning.  Det här inlägget täcker:

- Den `PDL::Stats::Kmeans` gränssnitt och dess returavtal (`centroid`, `cluster`, `n`, `R2`, `ss`).
- Att tolka `[obs × clusters]` medlemskapsmask returnerad av `run_kmeans`.
- Jämföra perl/PDL k-medel centroider mot R's `kmeans()` och `ClusterR::MiniBatchKmeans()` för att validera numerisk korrekthet.

### Inlägg 5 — Mini-Batch K-Means: Skalning till stora datamängder

*Fil: `compare_kmeans_centroids.pl`*

Full k-means kräver alla data i minnet för varje iteration.  Mini-batch k-medel handlar en liten mängd centroid noggrannhet för en stor minskning av minne och beräkning.  Denna artikel utforskar:

- Genomföra en sann återsamplad mini-batch loop i PDL.
- Kvantifiera centroid drift mellan full och mini-batch varianter.
- Sida vid sida utgång med R's `MiniBatchKmeans` från `ClusterR` paket.

### Inlägg 6 — Sökning efter index för inverterad fil (IVF)

*Fil: `compare_ivf_search.pl`*

Med centroider i handen kan vi partitionera databasen och utföra sublinjär ungefärlig närmaste granne sökning.  Det här inlägget täcker:

- Building the inverted lists: kartlägga varje databasvektor till närmaste centroid.
- Den `unpack_inverted_lists` hjälpare i `VectorIO`.
- Querying: söka efter de närmaste centroiderna i topp-K och sedan endast söka efter dessa listor.
- Noggrannhet vs. hastighet avvägningar som antalet probed listor varierar.

### Post 7 – Validering mot R: Numerisk korrekthet och korsspråkiga pipeliner

*Filer: `compare_kmeans_centroids.R`, `compare_kmeans_centroids_pure.R`, `plot_centroid_coordinates.R`*

The final post in the foundation series closes the loop between Perl and R:

- Exportera PDL-resultat till CSV och läsa dem i R för oberoende validering.
- Använda ggplot2 för att visualisera centroidkoordinater från båda språken samtidigt.
- Ett arbetsflödesmönster för "beräkna i Perl, visualisera i R" som utnyttjar styrkorna i båda ekosystemen.

---

> **Nästa upp – Post 1:** Serialisering och I/O med `VectorIO.pm`

---

[^†] Moderna processorer har flera nivåer av snabbt minne som kallas **cachar** (L1, L2, L3) som sitter mellan processorkärnorna och huvud-RAM.  L1 är den minsta (vanligtvis 32-64 KB per kärna) och snabbaste (1-4 klockcykler latens); L2 är större (256 KB-1 MB) och något långsammare; L3 delas över kärnor (4-64 MB) med högre latens fortfarande.  Huvud RAM sitter längre bort vid 60-100 ns latens - ungefär 200× långsammare än L1.

När en beräkning berör minnet i ett förutsägbart, sammanhängande mönster kan maskinvaran *prefetcher* ladda kommande data till L1/L2 innan det behövs, vilket ger ett nästan högt dataflöde.  Spridd pekarsökning (t.ex. genom att korsa en Perl-matris med heap-allokerade skalärer) besegrar förhämtning, stoppar processorn medan den väntar på att varje cache-miss ska lösas från RAM.

<!-- $Date$ $Author$ $Revision$ -->
