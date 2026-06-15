---
categories: Perl, PDL
dependencies: '*.md.es'
keywords: pdl,perl5
status: finalizado
title: Perl5 como lenguaje de ciencia de datos
---

<div class="right">

![Ciencia de datos](perlasadatascilang.page/datasci)

</div>

> **Introducción a la serie — Posterior 0 de N**
> Este post es el primero de una serie que documenta el co-desarrollo de un motor de base de datos vectorial (VDBE) escrito enteramente en Perl5 + PDL.  Las publicaciones posteriores recorren todos los componentes de ese motor; éste establece el escenario. El ímpetu principal de esta serie NO es que vuelques tu VDBE, ya que no hago afirmaciones de rendimiento, sino que muestres cómo se puede usar Perl para lograr prácticamente cualquier cosa que puedas lograr con cualquier otro idioma, ¡pero más inteligente!

---

[TOC]#sidebar

## 1. ¿Por qué Perl5 para Data Science? <a id="why-perl5-for-data-science"></a>

Cuando los científicos de datos discuten las opciones de idioma, la conversación converge rápidamente en Python, R o Julia.  Perl5 rara vez tiene un asiento en la mesa, sin embargo, lleva un conjunto convincente de rasgos que merecen una segunda mirada. Estos rasgos no han cambiado sustancialmente a lo largo de los años (Perl5 siempre ha sido así), pero {# lede #}A menos que haya estado expuesto al lenguaje y haya aprendido a apreciar su tercidad, racionalidad, flexibilidad, expresibilidad y lo haya utilizado realmente para impulsar su trabajo, no sabría que estas características no solo vienen de forma gratuita con Perl5, sino que pueden ayudarlo a impulsar sus proyectos hacia adelante.{# lede #}.

### Ubiquity y despliegue sin instalación

Perl5 se incluye como componente predeterminado de prácticamente todos los sistemas operativos similares a UNIX: distribuciones de Linux, macOS, BSD y muchos entornos de Linux integrados, todos incluyen un entorno de trabajo `perl` binario listo para usar.  Python ha estado haciendo incursiones aquí, pero todavía es común encontrar servidores sin cabeza, dispositivos de red o nodos de inicio de sesión de HPC donde Perl está presente y una pila completa de Python no lo está.  Un pipeline de datos escrito en Perl se puede ejecutar el primer día sin un `conda` medio ambiente, un `venv`o un contenedor.

### Portabilidad desde el centro de datos hasta el borde

La misma secuencia de comandos que analiza un conjunto de datos de terabytes en un nodo HPC de 256 núcleos puede, con cambios de configuración menores, ejecutarse en una Raspberry Pi, una puerta de enlace IoT o un controlador incrustado.  El modelo de despliegue binario único de Perl y la baja sobrecarga de tiempo de ejecución lo convierten en un auténtico "escribir una vez, ejecutar en cualquier lugar" lenguaje en entornos donde la sobrecarga del intérprete de Python o el tiempo de calentamiento JIT de Julia serían inaceptables.

Si planea desplegar en cualquier lugar y _everywhere_ Perl5 es su elección obvia.

### Una herencia basada en el texto y la mungación de datos

Perl fue diseñado desde cero para el procesamiento de texto, expresiones regulares y "pegamento" trabajo entre los componentes del sistema.  En la práctica, los pipelines de datos científicos no están dominados por el cálculo numérico, sino por la *conversación de datos*: lectura de formatos de archivo heterogéneos, limpieza de registros desordenados, unión de conjuntos de datos de diferentes fuentes y enrutamiento de resultados a componentes de consumo descendente.

El motor de expresión regular de Perl sigue siendo uno de los más potentes disponibles, y las líneas únicas pueden realizar tareas de limpieza de datos que requerirían bibliotecas auxiliares en otros idiomas.

Si usted está en el dominio de la informática científica, es posible que haya encontrado la noción de *sistemas de gestión del flujo de trabajo* e *investigación reproducible*. Ambos se basan en la ejecución de transformaciones de datos integrales y el flujo de trabajo para eliminar las actividades manuales, propensas a errores y tediosas de puntos y clic que los analistas y científicos tienen que hacer para transformar sus datos en insights e inferencias, respectivamente.

En este nuevo y valiente mundo, la rica historia de Perl5 le permite brillar tanto como componente de flujos de trabajo, como como lenguaje de aplicación que implementa estos flujos de trabajo.

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

- **FFI::Platypus** — funciones de llamada en cualquier biblioteca compartida (`.so` / `.dylib` / `.dll`) desde Perl sin escribir una sola línea de código de pegamento XS o C.  Platypus soporta todos los tipos, estructuras, devoluciones de llamada y cierres equivalentes a C, y es la forma moderna de vincular Perl a BLAS, LAPACK, HDF5 o cualquier otra biblioteca nativa.

### Modern Perl no es el Perl de tu abuelo

Las siguientes características se extraen directamente de las notas de lanzamiento oficiales (`perl5360delta`, `perl5380delta`, `perl5400delta`) y organizados por el lanzamiento en el que alcanzaron el estado **estables** o se introdujeron por primera vez. Solo se destacan las funciones relevantes para las cargas de trabajo de ciencia de datos y computación científica.

#### Perl 5.36 — Mayo de 2022

- **`use v5.36`** — El paquete de funciones ahora habilita automáticamente `use warnings` además de `use strict`. También deshabilita el `indirect` sintaxis method-call y `multidimensional` simulación de clave de hash, eliminando dos fuentes comunes de errores sutiles.

- **Firmas de subrutinas con nombre** *(estables desde la versión 5.36; experimentales desde la versión 5.20)* — los parámetros de función ahora se declaran por nombre, con valores predeterminados opcionales. El `//=` y `||=` Los operadores de valor por defecto se agregaron a las firmas en 5.38, lo que permite los valores por defecto que se activan en `undef` o falsedad respectivamente:

```perl
  use v5.36;
  sub clamp ($val, $lo = 0, $hi //= 1) {
      $val < $lo ? $lo : $val > $hi ? $hi : $val;
  }
  ```

- **`isa` operador de clase-instancia** *(estable desde 5.36; introducido en 5.32)* — `$obj isa "ClassName"` devuelve un valor booleano; más limpio que `ref($obj) eq "ClassName"`.

- **`builtin` módulo** *(estable desde la versión 5.40; experimental desde la versión 5.36)* — funciones de importación léxica incorporadas directamente al intérprete.  El paquete estable 5.40 incluye, entre otros:

- `ceil`, `floor` — redondeo entero sin `use POSIX`.
  - `trim` — quitar el espacio en blanco inicial o final de una cadena.
  - `indexed` — empareja cada elemento con su índice; el compañero idiomático con el valor múltiple `for` bucles (ver más abajo).
  - `true`, `false`, `is_bool` — centinelas booleanos escritos; los serializadores ahora pueden emitir JSON `true`/`false` en lugar de `1`/`0`.
  - `weaken`, `unweaken`, `is_weak` — control de la cuenta de referencia para la construcción de estructuras de datos bidireccionales sin fugas de memoria.
  - `blessed`, `reftype`, `refaddr` — introspección de referencia.

- **Seguimiento booleano estable** *(5.36)* — escalares creados como booleanos (p. ej., `!!1`) ahora conservan su naturaleza booleana a través de la asignación, lo que permite una serialización fiable con reconocimiento de tipo para JSON y MessagePack.

- **Varios valores `for` bucles** *(estables desde 5.40; experimentales desde 5.36)* Iterate sobre pares o N-tuples sin aritmética de índice manual:

```perl
  use v5.40;
  use builtin 'indexed';

for my ($i, $val) (indexed @scores)  { ... } # index and value
  ```

O tome varios valores al mismo tiempo

```perl
  use v5.40;

for my ($val1, $val2, $val3) (@scores)  { ... }
  ```

- **`defer` bloques** *(experimental desde 5.36)* - un protector de salida de ámbito que ejecuta el código de limpieza incondicionalmente cuando un bloque sale, ya sea normalmente o por excepción - un reemplazo natural para los objetos de protección de alcance basados en destructores y un patrón importante para la gestión de recursos en pipelines de datos.

#### Perl 5.38 — julio de 2023

- **`PERL_RAND_SEED` variable de entorno** *(5.38)*: definir esta variable antes de que una ejecución realice cada `rand` llamada (sin `srand`) producir la misma secuencia, permitiendo algoritmos estocásticos **reproducibles** - simulaciones, muestreo aleatorio, métodos Monte Carlo - sin modificar el código fuente.

- **`class` / `field` / `method` Sintaxis** *(experimental desde 5.38)* — un sistema de objetos de ámbito léxico diseñado específicamente que no requiere `bless` ni `@ISA` ni ningún módulo CPAN.  Útil para definir objetos de valor con tipo, como filas de juegos de datos, parámetros de modelo o etapas de pipeline:

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

#### Perl 5.40 — Junio de 2024

- **`try` / `catch` manejo de excepciones***(estables desde 5.40; experimentales desde 5.34; `finally` bloque añadido en 5.36)* — el manejo de excepciones estructuradas es ahora una característica del lenguaje central; no se requiere ningún módulo CPAN:

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

(`Try::Tiny` / `Feature::Compat::Try` solo son necesarios cuando se dirigen a perlas mayores de 5,34.)

- **Varios valores `for` bucles** *(estables desde 5.40)* — véase la entrada 5.36 anterior; se graduaron de experimental a estable en esta versión.

- **`builtin::inf` y `builtin::nan`*(experimental desde 5.40)* — infinidad de puntos flotantes mecanografiadas y constantes no numéricas, eliminando `9**9**9` o POSIX hacks en código numérico.

- **`^^` Operador XOR lógico** *(5.40)*: completa el juego de operadores lógicos de prioridad media (`&&`, `||`, `^^`); útil para operaciones de máscara booleana.

- **`use v5.40` importa funciones acumuladas** — más allá de habilitar el paquete de funciones, `use v5.40` también importa los correspondientes `builtin` paquete de versiones, haciendo todo estable `builtin::` funciones disponibles como abreviaturas sin `use builtin` declaración.

#### Características de larga duración (pre-5.36)

- **`say` y `state`**(desde 5.10)* — `say` es `print` con una nueva línea implícita; `state` declara un léxico que persiste a través de las invocaciones de su subencerrante (un primitivo ligero de la memorización).

**Referencias y cierres de primera clase**: los subs anónimos, los cierres y la construcción de referencia son fundamentales y se han mantenido estables desde Perl 5.

- **`use constant`** o el CPAN `Readonly` módulo para constantes designadas; `Readonly` impone una profunda inmutabilidad que `use constant` no lo hace.

Combinado con [`perlbrew`](https://perlbrew.pl/) o [`plenv`](https://github.com/tokuhirom/plenv) para la gestión de versiones y [`carton`](https://metacpan.org/pod/Carton) para instantáneas de dependencia reproducibles, un proyecto moderno de Perl se ve y se siente como un esfuerzo de ingeniería de software de primera clase.

### Limitaciones honestas

No case for Perl is complete without honesty about where it falls short:

- **Visualización** — Perl no tiene equivalente a `ggplot2` o `matplotlib`. Por lo general, los gráficos requieren una llamada externa a R, gnuplot o una biblioteca web. A veces, esta debilidad puede convertirse en una fortaleza real, lo que permite utilizar Perl5 como lenguaje de aplicación que orquesta y mejora a los otros actores.

- **Momento comunitario**: la comunidad de ciencia de datos ha convergido en Python y R. Encontrar tutoriales preparados, respuestas de Stack Overflow y coautores es más difícil.

- **Orientación de objeto**: sin Moose/Moo, el modelo OOP es detallado; con ellos agrega una dependencia. La nueva `class` característica puede resolver algunos de estos problemas

- **Seguridad de tipo a escala**: los escalares dinámicos del lenguaje central hacen que las bases de código numéricas grandes y colaborativas sean más difíciles de razonar (consulte la siguiente sección).

---

## 2. El sistema Perl Data-Type: fortalezas y límites de Cache-Era <a id="the-perl-data-type-system"></a>

### Tipos de perl principal

El modelo de datos fundamental de Perl se centra en tres construcciones:

| Construir | Sigil | Lo que contiene |
|-----------|-------|---------------|
| **Escalar** | `$` | Un solo valor: número, cadena, referencia o `undef` |
| **Matriz** | `@` | Lista ordenada de escalares, indexada por enteros |
| **Hash** | `%` | Recopilación no ordenada de valores escalares tecleados por cadena |

Todo lo demás, objetos, cierres, estructuras de datos complejas, se construye a partir de estos tres primitivos a través de *referencias* (`\@array`, `\%hash`, `sub { ... }`).

Este modelo es extraordinariamente flexible.  Una única matriz puede contener números enteros, números de coma flotante, cadenas y referencias anidadas simultáneamente.  Esa flexibilidad es exactamente lo que hizo de Perl el lenguaje dominante de administración de sistemas y scripts web durante dos décadas.

### Problema de jerarquía de caché

Las CPU modernas logran un rendimiento máximo solo cuando los datos fluyen a través de la caché L1/L2/L3[^†] en bloques grandes y contiguos, una propiedad llamada *localidad espacial*.  Las matrices de perl no proporcionan esto.  Bajo el capó, una matriz de Perl es una matriz C de *pointers* al escalar asignado al montón (`SV`) estructuras.  Cada escalar lleva un recuento de referencias, una etiqueta de tipo y relleno, normalmente de 24 a 56 bytes por escalar en una compilación de 64 bits.  Por lo tanto, iterar más de un millón de elementos de la matriz de Perl implica un millón de referencias de puntero dispersas a través de la pila, produciendo un patrón de pérdida de caché que niega por completo la ventaja de velocidad de los pipelines SIMD modernos.

A concrete consequence: un producto de punto de dos vectores de 1 000 elementos escritos en Perl puro es aproximadamente **100-1000× más lento** que la operación equivalente en un par de ndarrays flotantes PDL, que ocupan dos regiones de memoria plana de 4 000 bytes que caben cómodamente en la caché L1.

### Contraste con R

R ocupa un curioso punto medio.  Al igual que Perl, es un lenguaje dinámico e interpretado: las variables son contenedores sin tipo, las funciones son valores de primera clase y la REPL interactiva es el entorno de desarrollo principal.  R incluso tiene análogos directos a los tres tipos principales de Perl:

| Concepto de perl | Análogo R |
|---|---|
| `$scalar` | longitud-1 vector atómico o escalar en la lista |
| `@array` | `list()` |
| `%hash` | nombrado `list()` |
| Referencia (`\@arr`) | R no utiliza referencias explícitas;  en su lugar, la semántica de copia en modificación |

Pero el tipo *caballo de trabajo* de R, es decir, el **vector atómico** no tiene una contraparte directa de Perl. Un vector atómico R es un bloque de memoria contiguo y de tipo homogéneo, exactamente el diseño que recompensa una caché de CPU.  Cada escalar incorporado en R es en realidad un vector atómico longitud-1; no hay "escalar simple" fuera de los vectores atómicos.

Esta elección de diseño significa que el código R funciona naturalmente en vectores de millones de dobles con rendimiento a nivel de BLAS, sin que el usuario escriba un solo bucle o asigne un bucle especial. "matriz" objeto.

Los tipos atómicos de R son:

| Tipo atómico R | Almacenamiento | Equivalente C |
|---|---|---|
| `logical` | 4 bytes/elemento | `int` (con NA centinela) |
| `integer` | 4 bytes/elemento | `int32_t` |
| `double` | 8 bytes/elemento | `double` |
| `complex` | 16 bytes/elemento | `_Complex double` |
| `character` | puntero a CHARSXP | `char *` (interno) |
| `raw` | 1 byte/elemento | `uint8_t` |

R also defines higher-level structures built on atomic vectors:

- **matriz** - un vector atómico 2-D con un `dim` atributo.
- **matriz** — un vector atómico N-D con un `dim` atributo.
- **data.frame** — una lista con nombre de vectores atómicos de igual longitud; la lingua franca de
  datos tabulares en R.
- **factor** — un vector entero con un `levels` atributo; codifica datos categóricos.

The lesson: El rendimiento informático de R cuando se utiliza en aplicaciones estadísticas y de ciencia de datos fluye directamente desde sus vectores atómicos contiguos. La ruta equivalente de Perl al rendimiento es una extensión (que también es una `matlab` como el medio ambiente), el lenguaje de datos Perl [`PDL`](https://pdl.perl.org/).

---

## 3. Introducir PDL: Matrices N-Dimensionales de Tipo Fuerte <a id="enter-pdl"></a>

**Lenguaje de datos de Perl** (PDL, `pdl.perl.org`) amplía Perl con *ndarrays* ( matrices N-dimensionales): buffers de memoria contiguos y fuertemente tipados que se ven y se sienten como objetos Perl de primera clase.

```perl
use PDL;

# A 1-D float ndarray — 4 bytes × 5 elements in one contiguous block
my $v = float( 1.0, 2.0, 3.0, 4.0, 5.0 );

# A 128-dimensional random database of 1000 vectors — all in cache-friendly memory
my $db = random( 128, 1000 );   # double by default

# Dot product of every DB vector against a query — a single BLAS call
my $scores = $db x $query->transpose;
```

### tipos primitivos de PDL

PDL exposes the full palette of C numeric types as first-class constructors:

| Tipo PDL | Bytes | Tipo C | Constructor |
|---|---|---|---|
| `byte` | 1 | `uint8_t` | `byte(...)` |
| `short` | 2 | `int16_t` | `short(...)` |
| `ushort` | 2 | `uint16_t` | `ushort(...)` |
| `long` | 4 | `int32_t` | `long(...)` |
| `indx` | 4 u 8 | `ssize_t` | `indx(...)` |
| `longlong` | 8 | `int64_t` | `longlong(...)` |
| `float` | 4 | `float` | `float(...)` |
| `double` | 8 | `double` | `double(...)` |
| `cfloat` | 8 | `_Complex float` | `cfloat(...)` |
| `cdouble` | 16 | `_Complex double` | `cdouble(...)` |

### Enhebrado y SIMD

Una de las características más distintivas de PDL es *hilo implícito*: las operaciones se transmiten automáticamente a través de dimensiones adicionales, eliminando bucles explícitos en el código de usuario y delegando bucles internos a núcleos C o Fortran optimizados.  Combinado con `set_autopthread_targ(N)`, PDL paralelizará automáticamente porciones independientes `N` Threads del sistema operativo: sin que el usuario escriba un solo `fork` o `Thread::Queue` llamada.

### Valores incorrectos

PDL tiene un concepto incorporado de *valores malos* (`PDL::Bad`), directamente análogo a R `NA`. Una matriz se puede marcar como "valor erróneo", y las operaciones de PDL propagan el error correctamente a través de la aritmética, las estadísticas y la E/S.

---

## 4. Comparación de tipos: Perl, PDL y R lado a lado <a id="type-comparison-table"></a>

La siguiente tabla asigna cada tipo R de uso común a sus homólogos más cercanos de Perl y PDL, destacando dónde los tres idiomas están de acuerdo, difieren o se complementan entre sí.

| {{table.csv_headers|join:" | "}} |
|---|---|---|---|
{% for row in table.content %}| {{row.r_type|safe}} | {{row.perl_equivalent|safe}} | {{row.pdl_equivalent|safe}} | {{row.notes|safe}} |
{% endfor %}

### Conclusiones clave

- Para **datos numéricos puros y homogéneos** (vectores, matrices, tensores), los ndarrays PDL y los vectores atómicos R son funcionalmente equivalentes y comparablemente eficientes.

- Para **datos tabulares heterogéneos** (tipos mixtos, columnas de cadena, factores), R `data.frame` es más ergonómico; Perl suele utilizar un hash de matrices o un módulo dedicado, como `Data::Frame` o `PDL::IO::CSV`.

- Para **texto, estructuras irregulares y pegamento del sistema**, los tipos nativos de Perl son superiores tanto a R como a Python.

- La combinación Perl+PDL, por lo tanto, proporciona la *unión *de lo que R ofrece como un lenguaje estadístico y lo que Perl ofrece como un lenguaje de sistemas, a costa de una curva de aprendizaje más pronunciada y menos herramientas estadísticas francamente limitadas.

Sin embargo, la combinación de Perl+PDL+R (con este último utilizado como componente, o [instrumentalizado](https://chrisarg.github.io/Killing-It-with-PERL/2025/01/18/Timing-Peak-DRAM-Use-In-R-With-Perl-Part-1.html) vía Perl)

---

## 5. Hoja de ruta: lo que cubre el resto de esta serie <a id="road-map"></a>

Esta serie documenta la construcción de un **motor de base de datos vectorial** incorporado en Perl5 + PDL desde cero.  Las bases de datos vectoriales respaldan los pipelines modernos de generación aumentada de recuperación (RAG), la búsqueda semántica y los sistemas de recomendación de vecinos más cercanos.  Implementar uno de los primeros principios es un excelente vehículo para demostrar las capacidades numéricas de PDL junto con las fortalezas de programación de sistemas de Perl.

El directorio co-desarrollado junto a estas publicaciones contiene los siguientes componentes, cada uno de los cuales será objeto de una o más publicaciones dedicadas que harán referencia a archivos en un repositorio dedicado.

### Post 1 — Serialización y E/S: el `VectorIO` módulo

*Archivo: `VectorIO.pm`*

El motor almacena vectores como bloques binarios empaquetados dentro [MessagePack](https://msgpack.org/) cargas útiles.  Este post cubre:

- Diseño de un módulo con una limpieza `Exporter`API pública basada en `use v5.40`.
- Ayudantes de validación que aplican la corrección del esquema en los límites del sistema.

### Publicación 2 — Simulación de una base de datos vectorial

*Archivo: `simulate_vectorDB.pl`*

Antes de buscar una base de datos, necesitamos una.  Este post muestra:

- Generación de vectores de flotador aleatorios reproducibles con `PDL::random`.
- Uso `GetOpt::Long` para el análisis ergonómico de opciones CLI.
- Escribir un `--seed`-simulación controlada que produce bases de datos idénticas en todas las ejecuciones, esenciales para la evaluación comparativa.

### Post 3 — Benchmarking: el `timing_DB` Módulo

*Archivo: `timing_DB.pm`*

Las reclamaciones de rendimiento requieren medición.  Este post presenta:

- Un arnés de benchmarking de Perl reutilizable construido sobre `Time::HiRes`.
- Metodología para comparaciones justas de reloj de pared entre las implementaciones de Perl/PDL y R.
- Interpretación del rendimiento (vectores/segundo) frente a la latencia (ms/consulta) para diferentes tamaños de carga de trabajo.

### Publicación 4 — Clusters de K-medias con `PDL::Stats::Kmeans`

*Archivo: `kmeans.pl`*

La agrupación en K-means es la columna vertebral del enfoque del índice de archivos invertidos (IVF) para aproximar la búsqueda de vecinos más cercanos.  Este post cubre:

- El `PDL::Stats::Kmeans` interfaz y su contrato de devolución (`centroid`, `cluster`, `n`, `R2`, `ss`).
- Interpretar el `[obs × clusters]` máscara de afiliación devuelta por `run_kmeans`.
- Comparando Perl/PDL k-means centroids contra R's `kmeans()` y `ClusterR::MiniBatchKmeans()` para validar la corrección numérica.

### Post 5 — Mini-Batch K-Means: Escalado a grandes conjuntos de datos

*Archivo: `compare_kmeans_centroids.pl`*

k-means completo requiere todos los datos en la memoria para cada iteración.  Mini-lote k-means negocia una pequeña cantidad de precisión centroide para una gran reducción en la memoria y la computación.  Este post explora:

- Implementación de un verdadero bucle mini-lote re-muestreo en PDL.
- Cuantificación de la deriva centroide entre las variantes completa y mini-lote.
- Salida lateral con R's `MiniBatchKmeans` del `ClusterR` paquete.

### Publicación 6 — Búsqueda de índice de archivos invertidos (IVF)

*Archivo: `compare_ivf_search.pl`*

Con los centroides en la mano podemos particionar la base de datos y realizar una búsqueda sublineal aproximada de vecinos más cercanos.  Este post cubre:

- Building the inverted lists: mapeando cada vector de base de datos a su centroide más cercano.
- El `unpack_inverted_lists` ayudante en `VectorIO`.
- Querying: encontrar los centroides más cercanos de la K superior y luego buscar solo esas listas.
- Precisión vs. velocidad de compensación, ya que el número de listas sondeadas varía.

### Post 7 — Validación contra R: corrección numérica y pipelines en varios idiomas

*Archivos: `compare_kmeans_centroids.R`, `compare_kmeans_centroids_pure.R`, `plot_centroid_coordinates.R`*

The final post in the foundation series closes the loop between Perl and R:

- Exportar los resultados de PDL a CSV y leerlos en R para validación independiente.
- Utilizando ggplot2 para visualizar las coordenadas centroides de ambos idiomas simultáneamente.
- Un patrón de flujo de trabajo para "Recursos informáticos en Perl, visualizar en R" que aprovecha las fortalezas de ambos ecosistemas.

---

> **Siguiente — Publicación 1:** Serie y E/S con `VectorIO.pm`

---

[^†] Las CPU modernas tienen varios niveles de memoria rápida en chip denominados **cachés** (L1, L2, L3) que se encuentran entre los núcleos del procesador y la RAM principal.  L1 es el más pequeño (normalmente de 32 a 64 KB por núcleo) y el más rápido (de 1 a 4 ciclos de reloj de latencia); L2 es más grande (256 KB a 1 MB) y ligeramente más lento; L3 se comparte entre núcleos (de 4 a 64 MB) con una latencia aún mayor.  La RAM principal se encuentra más lejos en latencia de 60-100 ns, aproximadamente 200 veces más lenta que L1.

Cuando un cálculo toca la memoria en un patrón predecible y contiguo, el hardware *prefetcher* puede cargar los próximos datos en L1/L2 antes de que sea necesario, logrando un rendimiento casi máximo.  La búsqueda de punteros dispersos (como recorrer una matriz Perl de escalares asignados a pilas) derrota la recuperación previa, deteniendo la CPU mientras espera a que cada falta de caché se resuelva desde RAM.

<!-- $Date$ $Author$ $Revision$ -->
