---
archived: ~
categories: Perl
dependencies: '*.md.es'
keywords: pdl,perl5
published: ~
status: finalizado
title: Perl5 como lenguaje de ciencia de datos
---

<div class="right">

![Ciencia de datos](perlasadatascilang.page/datasci).

</div>

> **Introducción a la serie — Posterior 0 de N**
> Este post es el primero de una serie que documenta el co-desarrollo de un motor de base de datos vectorial (VDBE) escrito enteramente en Perl5 + PDL.  Las publicaciones posteriores recorren todos los componentes de ese motor; éste establece el escenario. El ímpetu principal de esta serie NO es que vuelques tu VDBE, ya que no hago afirmaciones de rendimiento, sino que muestres cómo se puede usar Perl para lograr prácticamente cualquier cosa que puedas lograr con cualquier otro idioma, ¡pero más inteligente!

---

## Tabla de contenido

[TOC]

---

## 1. ¿Por qué Perl5 para Data Science? <a id="why-perl5-for-data-science"></a>

Cuando los científicos de datos discuten las opciones de idioma, la conversación converge rápidamente en Python, R o Julia.  Perl5 rara vez tiene un asiento en la mesa, sin embargo, lleva un conjunto convincente de rasgos que merecen una segunda mirada. Estos rasgos no han cambiado sustancialmente a lo largo de los años (Perl5 siempre ha sido así), pero a menos que {# lede #}Usted ha estado expuesto al lenguaje y ha aprendido a apreciar su tercidad, racionalidad, flexibilidad, expresibilidad y realmente lo ha utilizado para impulsar su trabajo hacia adelante.{# lede #}, no sabría que estas funciones no solo vienen de forma gratuita con Perl5, sino que pueden ayudarlo a impulsar sus proyectos.

### Ubiquity y despliegue sin instalación

Perl5 se incluye como componente predeterminado de prácticamente todos los sistemas operativos similares a UNIX: distribuciones de Linux, macOS, BSD y muchos entornos de Linux integrados, todos incluyen un entorno de trabajo `perl` binario listo para usar.  Python ha estado haciendo incursiones aquí, pero aún es común encontrar servidores sin cabecera, dispositivos de red o nodos de inicio de sesión de HPC.
donde Perl está presente y una pila completa de Python no lo está.  Un pipeline de datos escrito en Perl se puede ejecutar el primer día sin un `conda` medio ambiente, un `venv`o un contenedor.

### Portabilidad desde el centro de datos hasta el borde

La misma secuencia de comandos que analiza un conjunto de datos de terabytes en un nodo HPC de 256 núcleos puede, con cambios de configuración menores, ejecutarse en una Raspberry Pi, una puerta de enlace IoT o un controlador incrustado.  Perl'El modelo de despliegue binario único y la baja sobrecarga de tiempo de ejecución lo convierten en un auténtico "escribir una vez, ejecutar en cualquier lugar" lenguaje en entornos donde Python'Sobrecarga del intérprete o Julia'El tiempo de calentamiento del JIT sería inaceptable.

Si planea desplegar en cualquier lugar y _everywhere_ Perl5 es su elección obvia.

### Una herencia basada en el texto y la mungación de datos

Perl fue diseñado desde cero para el procesamiento de texto, expresiones regulares y "pegamento" trabajo entre los componentes del sistema.  En la práctica, los pipelines de datos científicos no están dominados por el cálculo numérico, sino por la *conversación de datos*: lectura de formatos de archivo heterogéneos, limpieza de registros desordenados, unión de conjuntos de datos de diferentes fuentes y enrutamiento de resultados a componentes de consumo descendente.

Perl'El motor regex sigue siendo uno de los más potentes disponibles, y las líneas únicas pueden realizar tareas de limpieza de datos que requerirían bibliotecas auxiliares en otros idiomas.

Si usted está en el dominio de la informática científica, es posible que haya encontrado la noción de *sistemas de gestión del flujo de trabajo* e *investigación reproducible*. Ambos se basan en la ejecución de transformaciones de datos integrales y el flujo de trabajo para eliminar las actividades manuales, propensas a errores y tediosas de puntos y clic que los analistas y científicos tienen que hacer para transformar sus datos en insights e inferencias, respectivamente.

En este nuevo mundo, Perl5's rico historial le permite brillar tanto como un componente de los flujos de trabajo, o como un lenguaje de aplicación que implementa estos flujos de trabajo.

### CPAN: un ecosistema de módulos probado en batalla

La Comprehensive Perl Archive Network (CPAN) aloja más de 200.000 módulos en todos los dominios imaginables.  Si bien las ofertas de ciencia de datos no son tan extensas como Python, los componentes básicos para los constructores dedicados están allí:

- **PDL** (Lenguaje de datos Perl): computación numérica vectorizada con matrices N-dimensionales de escritura fuerte (se trata en profundidad a continuación).

- **PDL::Estadísticas** — estadística descriptiva, regresión, agrupamiento (k-medias, k-medias minibatch), y más, construido sobre ndarrays PDL.

- **AI::MXNet**, **AI::TensorFlow** — Enlaces de aprendizaje profundo.

- **Estadísticas::Regresión**, **Estadísticas::Descriptivas**: estadísticas clásicas sin la dependencia PDL.

- **Texto::CSV**, **Hoja de cálculo::XLSX**, **Datos::MessagePack**, **Sereal** — Serialización y E/S de alto rendimiento.

- **DBI** + docenas de controladores de base de datos: acceso SQL a todos los principales RDBMS.

- **MCE** (motor de varios núcleos): paralelismo estructurado para cargas de trabajo de memoria compartida y distribuida.

- **En línea::C**, **En línea::CPP** — embeba código C o C++ directamente dentro de un archivo de origen de Perl; el compilador se llama de forma transparente la primera vez que se ejecuta el script, lo que hace que sea trivial borrar núcleos críticos para el rendimiento en un programa de Perl que de otro modo sería puro sin un sistema de compilación XS completo.

- **FFI::Platypus** — funciones de llamada en cualquier biblioteca compartida (`Así` / `.dilib` / `.dll`) desde Perl sin escribir una sola línea de código de pegamento XS o C.  Platypus soporta todos los tipos, estructuras, devoluciones de llamada y cierres equivalentes a C, y es la forma moderna de vincular Perl a BLAS, LAPACK, HDF5 o cualquier otra biblioteca nativa.

### Modern Perl no es tu abuelo's Perl

Las siguientes características se extraen directamente de las notas de lanzamiento oficiales (`perl5360delta`, `perl5380delta`, `perl5400delta`) y organizados por el lanzamiento en el que alcanzaron el estado **estables** o se introdujeron por primera vez. Solo se destacan las funciones relevantes para las cargas de trabajo de ciencia de datos y computación científica.

#### Perl 5.36 — Mayo de 2022

- **`usar v5.36`** — El paquete de funciones ahora habilita automáticamente `utilizar advertencias` además de `uso estricto`. También deshabilita el `indirecto` sintaxis method-call y `multidimensional` simulación de clave de hash, eliminando dos fuentes comunes de errores sutiles.

- **Firmas de subrutinas con nombre** *(estables desde la versión 5.36; experimentales desde la versión 5.20)* — los parámetros de función ahora se declaran por nombre, con valores predeterminados opcionales. El `//=` y `||=` Los operadores de valor por defecto se agregaron a las firmas en 5.38, lo que permite los valores por defecto que se activan en `sin definir` o falsedad respectivamente:

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

### Tipos primitivos de PDL

PDL expone la paleta completa de tipos numéricos C como constructores de primera clase:

| Tipo PDL | Bytes | Tipo C | Constructor |
|---|---|---|---|
| `byte` | 1 | `uint8_t` | `byte(...)` |
| `corto` | 2 | `int16_t` | `corto(...)` |
| `corto` | 2 | `uint16_t` | `ushort(...)` |
| `largo` | 4 | `int32_t` | `largo(...)` |
| `xx` | 4 u 8 | `ssize_t` | `indx(...)` |
| `largo` | 8 | `int64_t` | `largo(...)` |
| `flotante` | 4 | `flotante` | `flotante(...)` |
| `doble` | 8 | `doble` | `doble(...)` |
| `flotante` | 8 | `_Flotante complejo` | `cfloat(...)` |
| `doble` | 16 | `_Complejo doble` | `cdouble(...)` |

### Enhebrado y SIMD

Uno de PDL'Las características más distintivas son *hilo implícito*: las operaciones se transmiten automáticamente a través de dimensiones adicionales, eliminando bucles explícitos en el código del usuario y delegando bucles internos a núcleos C o Fortran optimizados.  Combinado con `set_autopthread_targ(N)`, PDL paralelizará automáticamente porciones independientes `N` Threads del sistema operativo: sin que el usuario escriba un solo `bifurcación` o `Thread::Cola` llamada.

### Valores incorrectos

PDL tiene un concepto incorporado de *valores malos* (`PDL: Malo`), directamente análogo a R's `N/D`. Una matriz se puede marcar como "valor erróneo", y las operaciones de PDL propagan el error correctamente a través de la aritmética, las estadísticas y la E/S.

---

## 4. Comparación de tipos: Perl, PDL y R lado a lado <a id="type-comparison-table"></a>

La siguiente tabla asigna cada tipo R de uso común a sus homólogos más cercanos de Perl y PDL, destacando dónde los tres idiomas están de acuerdo, difieren o se complementan entre sí.

| Tipo R | Equivalente en perl | Equivalente en PDL | Notas |
|---|---|---|---|
| `doble` (longitud-1) | `$x = 3,14` (escalar) | `doble(3.14)` — forma `()` | R no tiene escalar desnudo; todo es un vector |
| `entero` (longitud-1) | `$n = 42` (escalar) | `largo(42)` | |
| `lógico` (longitud-1) | `$flag = 1` / `Indicador de $ = 0` | `byte(1)` | Perl utiliza la veracidad; PDL utiliza 0/1 byte |
| `doble` vector | `@arr = (1.1, 2.2, 3.3)` | `doble(1.1, 2.2, 3.3)` | PDL: contiguo; `@arr`: matriz de punteros |
| `entero` vector | `@arr = (1, 2, 3)` | `largo(1, 2, 3)` | |

| Tipo R | Equivalente en perl | Equivalente en PDL | Notas |
|---|---|---|---|
| `lógico` vector | `@flags = (1, 0, 1)` | `byte(1, 0, 1)` | |
| `complejo` vector | — (no incorporado) | `cdouble(...)` | Necesidades de perl `Matemáticas::Complejo`; PDL tiene soporte nativo |
| `carácter` vector | `@strs = ('a','b')` | — (no numérico) | La PDL sólo funciona en números |
| `crudo` vector | `paquete('C*', @bytes)` | `byte(...)` | |
| `N/D` | `sin definir` | Valor negativo en ndarray | Los valores negativos de PDL se propagan como R's `N/D` |

| Tipo R | Equivalente en perl | Equivalente en PDL | Notas |
|---|---|---|---|
| `NULL` | `sin definir` en el contexto de la lista | — | |
| `lista` | `@array` o referencia `\@array` | — | |
| nombrado `lista` | `%hash` o `\%hash` | — | |
| `matriz` (2-D) | matriz de relatos `@aoa` | 2-D ndarray `pdl([[...],[...]])` | PDL: columna mayor; R: columna mayor |
| `matriz` (N-D) | referencias anidadas | N-D ndarray `$x->reforma(...)` | |
| `data.frame` | `%hash` de `@arrays` | 2-D ndarray (cols numéricos) + hash perl (mezclado) | No hay mapas de tipo PDL exactamente |

| Tipo R | Equivalente en perl | Equivalente en PDL | Notas |
|---|---|---|---|
| `factor` | tabla de búsqueda hash + `@indices` | `largo` ndarray + perl `@levels` matriz | |
| `entorno` | `%hash` o espacio de nombres de paquete | — | |
| `función` / cierre | `sub { ... }` / cierre | — | PDL PP define los granos compilados |
| `S3 / S4 objeto` | Referencia bendita + envío del método | Objeto PDL (ndarray bendito) | Los objetos PDL son objetos Perl de primera clase |

### Conclusiones clave

- Para **datos numéricos puros y homogéneos** (vectores, matrices, tensores), los ndarrays PDL y los vectores atómicos R son funcionalmente equivalentes y comparablemente eficientes.

- Para **datos tabulares heterogéneos** (tipos mixtos, columnas de cadena, factores), R's `data.frame` es más ergonómico; Perl suele utilizar un hash de matrices o un módulo dedicado, como `Datos::Marco` o `PDL::IO::CSV`.

- Para **texto, estructuras irregulares y pegamento del sistema**, Perl'Los tipos nativos son superiores tanto a R como a Python.

- La combinación Perl+PDL, por lo tanto, proporciona la *unión *de lo que R ofrece como un lenguaje estadístico y lo que Perl ofrece como un lenguaje de sistemas, a costa de una curva de aprendizaje más pronunciada y menos herramientas estadísticas francamente limitadas.

Sin embargo, la combinación de Perl+PDL+R (con este último utilizado como componente, o [instrumentalizado](https://chrisarg.github.io/Killing-It-with-PERL/2025/01/18/Timing-Peak-DRAM-Use-In-R-With-Perl-Part-1.html) vía Perl).

---

## 5. Hoja de ruta: lo que cubre el resto de esta serie <a id="road-map"></a>

Esta serie documenta la construcción de un **motor de base de datos vectorial** incorporado en Perl5 + PDL desde cero.  Las bases de datos vectoriales respaldan los pipelines modernos de generación aumentada de recuperación (RAG), la búsqueda semántica y los sistemas de recomendación de vecinos más cercanos.  Implementar uno de los primeros principios es un excelente vehículo para demostrar PDL's capacidades numéricas junto con Perl'puntos fuertes de la programación de sistemas.

El directorio co-desarrollado junto a estas publicaciones contiene los siguientes componentes, cada uno de los cuales será objeto de una o más publicaciones dedicadas que harán referencia a archivos en un repositorio dedicado.

### Post 1 — Serialización y E/S: el `VectorIO` módulo

*Archivo: `VectorIO.pm`*

El motor almacena vectores como bloques binarios empaquetados dentro [MessagePack](https://msgpack.org/) cargas útiles.  Este post cubre:

- Diseño de un módulo con una limpieza `Exportador`API pública basada en `usar v5.40`.
- Ayudantes de validación que aplican la corrección del esquema en los límites del sistema.

### Publicación 2 — Simulación de una base de datos vectorial

*Archivo: `simulate_vectorDB.pl`*

Antes de buscar una base de datos, necesitamos una.  Este post muestra:

- Generación de vectores de flotador aleatorios reproducibles con `PDL::aleatorio`.
- Uso `GetOpt::Largo` para el análisis ergonómico de opciones CLI.
- Escribir un `--semilla`-simulación controlada que produce bases de datos idénticas en todas las ejecuciones, esenciales para la evaluación comparativa.

### Post 3 — Benchmarking: el `timing_DB` Módulo

*Archivo: `timing_DB.pm`*

Las reclamaciones de rendimiento requieren medición.  Este post presenta:

- Un arnés de benchmarking de Perl reutilizable construido sobre `Hora::HiRes`.
- Metodología para comparaciones justas de reloj de pared entre las implementaciones de Perl/PDL y R.
- Interpretación del rendimiento (vectores/segundo) frente a la latencia (ms/consulta) para diferentes tamaños de carga de trabajo.

### Publicación 4 — Clusters de K-medias con `PDL::Estadísticas::Kmeans`

*Archivo: `kmeans.pl`*

La agrupación en K-means es la columna vertebral del enfoque del índice de archivos invertidos (IVF) para aproximar la búsqueda de vecinos más cercanos.  Este post cubre:

- El `PDL::Estadísticas::Kmeans` interfaz y su contrato de devolución (`centroide`, `cluster`, `n`, `R2`, `ss`).
- Interpretar el `[obs × clusters]` máscara de afiliación devuelta por `run_kmeans`.
- Comparando Perl/PDL k-means centroids contra R's `kmeans()` y `ClusterR::MiniBatchKmeans()` para validar la corrección numérica.

### Post 5 — Mini-Batch K-Means: Escalado a grandes conjuntos de datos

*Archivo: `compare_kmeans_centroids.pl`*

k-means completo requiere todos los datos en la memoria para cada iteración.  Mini-lote k-means negocia una pequeña cantidad de precisión centroide para una gran reducción en la memoria y la computación.  Este post explora:

- Implementación de un verdadero bucle mini-lote re-muestreo en PDL.
- Cuantificación de la deriva centroide entre las variantes completa y mini-lote.
- Salida lateral con R's `MiniBatchKmeans` del `ClusterR` paquete.

### Publicación 6 — Búsqueda de índice de archivos invertidos (IVF).

*Archivo: `compare_ivf_search.pl`*

Con los centroides en la mano podemos particionar la base de datos y realizar una búsqueda sublineal aproximada de vecinos más cercanos.  Este post cubre:

- Construyendo las listas invertidas: mapeando cada vector de base de datos a su centroide más cercano.
- El `unpack_inverted_lists` ayudante en `VectorIO`.
- Querying: encontrar los centroides más cercanos de la K superior y luego buscar solo esas listas.
- Precisión vs. velocidad de compensación, ya que el número de listas sondeadas varía.

### Post 7 — Validación contra R: corrección numérica y pipelines en varios idiomas

*Archivos: `compare_kmeans_centroids.R`, `compare_kmeans_centroids_pure.R`, `plot_centroid_coordinates.R`*

El último post de la serie de fundación cierra el bucle entre Perl y R:

- Exportar los resultados de PDL a CSV y leerlos en R para validación independiente.
- Utilizando ggplot2 para visualizar las coordenadas centroides de ambos idiomas simultáneamente.
- Un patrón de flujo de trabajo para "Recursos informáticos en Perl, visualizar en R" que aprovecha las fortalezas de ambos ecosistemas.

---

> **Siguiente — Publicación 1:** Serie y E/S con `VectorIO.pm`

---

<a id="fn-cache"></a>

**†** Las CPU modernas tienen varios niveles de memoria rápida en chip llamada **cachés** (L1, L2, L3) que se encuentran entre los núcleos del procesador y la RAM principal.  L1 es el más pequeño (normalmente de 32 a 64 KB por núcleo) y el más rápido (de 1 a 4 ciclos de reloj de latencia); L2 es más grande (256 KB a 1 MB) y ligeramente más lento; L3 se comparte entre núcleos (de 4 a 64 MB) con una latencia aún mayor.  La RAM principal se encuentra más lejos en latencia de 60-100 ns, aproximadamente 200 veces más lenta que L1.

Cuando un cálculo toca la memoria en un patrón predecible y contiguo, el hardware *prefetcher* puede cargar los próximos datos en L1/L2 antes de que sea necesario, logrando un rendimiento casi máximo.  La búsqueda de punteros dispersos (como recorrer una matriz Perl de escalares asignados a pilas) derrota la recuperación previa, deteniendo la CPU mientras espera a que cada falta de caché se resuelva desde RAM.

<!-- $Date: 2026-04-16 16:45:10 -0700 (Thu, 16 Apr 2026) $ $Author: $ $Revision: 31803 $ -->
