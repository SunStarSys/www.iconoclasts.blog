---
categories: Rendimiento, herramientas
dependencies: '*.md.es'
keywords: ~
status: archivado
title: Rendimiento de aplicaciones
---

> {# lede #}Muchos desarrolladores caen en la trampa de pensar que la optimización del rendimiento consiste en hacer que cada línea de código sea lo más eficiente posible.{# lede #}

En realidad es todo lo contrario. Comienza con las restricciones arquitectónicas de la aplicación y las utiliza para aumentar detalle hasta la parte "más lenta" observada del programa. La **implantación** de esa parte guía todas las demás opciones de rendimiento que necesita realizar. Cualquier cosa que no sea tan lenta como esa parte, no necesita ser optimizada aún más. En su lugar, concéntrese en la expresión humana y la simplicidad y claridad de la implementación, para los lectores no expertos sobre el "SSDLC" del software, para el resto del código de su programa.

Puedes iterar en este libro de estrategias, pero nunca he tenido que ir más allá de 3 iteraciones en mi carrera profesional.

Así que adelante y utilice un lenguaje de programación elegante como `Python3` o `Javascript`/`Typescript`, y deje que los Expertos en Materia (**SME**) por ahí en el mundo de código abierto le den potentes enlaces nativos `C`/`C++` para sus necesidades de propósito especial. Nada de lo que haga para la lógica de negocio necesita más velocidad de lo que **cualquier** lenguaje de programación dinámico puede proporcionarle **listo para usar**.

Incluso una secuencia de comandos bash libre de dependencias es una solución viable para muchas tareas básicas. He aquí uno que escribí para la firma de realidad aumentada [Magic Leap](https://magicleap.com) hace años, para sustituir a un torpe [OpenGrok](https://oracle.github.io/opengrok/) servicio con algo que aprovecha la paralelización de varios procesadores con `xargs -P`, y soporta [PCRE](https://www.pcre.org/).

https://github.com/joesuf4/home/blob/wsl/bin/pffxg.sh

Ese script es un orden de magnitud más rápido que los sospechosos habituales en GitHub, que estaban escritos en lenguajes de programación compilados y estáticos. Pero al identificar el cuello de botella exacto en `bash` (en bucle con llamadas `fork+exec` de alto volumen en el medio), y usando `xargs` en su lugar, se obtiene un script que se parece mucho a este, con el algoritmo central implementado en 10 líneas de `shell`.

También está utilizando la comunidad de código abierto de **PYME** de una manera inteligente, en lugar de la forma en que lo hicieron las otras implementaciones de "grep recursivo filtrado" en GitHub. En lugar de adoptar y mantener internamente mi propia implementación (threaded) de "find", "xargs" y "grep", simplemente reutilizo los ejecutables preinstalados que otras **PYME** han estado perfeccionando durante décadas **tal cual**. No necesito dominar sus implementaciones, solo reutilice sus "CLI". Ni siquiera quiero dominarlos, eso es **su** bailiwick. Los deltas de rendimiento solo importan cuando son varios segundos o más, dados los casos de uso (humanos) esperados de la aplicación.

Para ver la tachuela opuesta, donde todo se hace internamente, completamente microoptimizado, y aún así no puede vencer a este script con las opciones de búsqueda predeterminadas, y no hay un sistema de almacenamiento en caché disponible, aquí hay un buen ejemplo <https://github.com/BurntSushi/ripgrep>

Solo para extraer el primer #performance #benchmark de esa página y escalarlo de un tamaño de árbol de muestra de juguete (fuentes de núcleo linux) a un árbol heterogéneo que es `23 GB`: (mejores ejecuciones después de 3 iteraciones; `LANG=en_US.UTF-8`).

```shell
    % du -sh .
    23G .
    % time rg -uuniw '[A-Z]+_SUSPEND' | wc -l
    6259
    rg -uuniw '[A-Z]+_SUSPEND' 9.46s user 16.08s system 261% cpu 9.759 total
    wc -l 0.00s user 0.07s system 0% cpu 9.759 total
    % time pffxg.sh -- -wnE '[A-Z]+_SUSPEND' | wc -l
    5855
    pffxg.sh -- -wnE '[A-Z]+_SUSPEND' 16.66s user 2.68s system 429% cpu 4.501 total
    wc -l 0.00s user 0.00s system 0% cpu 4.501 total
```

Es bastante tonto microoptimizar algo que está profundamente ligado al estado de la caché del sistema de archivos del núcleo para su búsqueda. La variación de los tiempos de rendimiento está dominada por la velocidad de acceso al corpus de contenido de los archivos, y es un orden de magnitud más relevante que cualquier otro factor para los resultados finales. Estar en un `NVMe` ayuda, pero nada en este espacio supera a `RAM` mismo.

Es por eso que tener una caché comprimida en memoria para un gran corpus de archivos, estabilizará los tiempos de rendimiento. Es sorprendente que nadie más pensara que esto era lo suficientemente importante como para apoyar.

Desactive la segunda página #performance #benchmark y amplíela como antes (el mismo árbol `23 GB`):

```shell
	% time rg -tc -uuuiwn '[A-Z]+_SUSPEND' | wc -l
    5629
    rg -tc -uuuiwn '[A-Z]+_SUSPEND' 3.51s user 1.71s system 1141% cpu 0.457 total
    wc -l 0.00s user 0.05s system 11% cpu 0.457 total
    % time LANG=C pffxg.sh --cache /tmp/pffxg-$USER --workers 32 --cc -- -wE '[A-Z]+_SUSPEND' | wc -l
    5628
    LANG=C pffxg.sh --cache /tmp/pffxg-$USER --workers 32 --cc -- -wE  3.14s user 0.88s system 1055% cpu 0.381 total
    wc -l 0.00s user 0.00s system 0% cpu 0.381 total
```

Un afinado `pffxg.sh` sigue siendo más rápido, a pesar de todo el trabajo puesto en la microoptimización ripgrep para esta búsqueda de `C`-file.

La forma en que usé este script con [AOSP](https://source.android.com).

.25M LOC entre `ripgrep` y [ugrep](https://github.com/Genivia/ugrep).

Debido a que es un programa de shell tan pequeño, `pffxg.sh` puede darle poderosos ganchos en sus interiores con casi cero esfuerzo. Incluso el comando 'grep' en sí es personalizable: cualquier comando que necesite ejecutar en un corpus selecto de archivos, que puede aceptar una lista de nombres de archivo anexados al final de sus argumentos, es un juego justo. Aquí hay un "recuento total de líneas en el ejercicio `MiLOC`" en el repositorio git del núcleo linux:

```shell
	% time find * -type f | xargs wc -l | awk '{ $2 == "total" {a+=$1} END {print a/1024**2}'
    28.451
    find * -type f 0.00s user 0.06s system 2% cpu 2.733 total
    xargs wc -l 0.53s user 1.02s system 54% cpu 2.853 total
    awk '$2 == "total" {a+=$1} END {print a/1024**2}' 0.23s user 0.59s system 28% cpu 2.853 total

    % time pffxg.sh --workers 8 --cmd wc --all -- -l | awk '{$2 == "total" {a+=$1} END {print a/1024**2}'
    28.4506
    pffxg.sh --workers 8 --cmd wc --all -- -l 0.92s user 0.66s system 826% cpu 0.192 total
    awk '$2 == "total" {a+=$1} END {print a/1024**2}' 0.02s user 0.00s system 11% cpu 0.192 total
```

Versión `ripgrep`:

```shell
	% time rg -c \$ | awk -F : '{a+=$2} END {print a/1024**2}'
    28.4284
    rg -c \$ 2.12s user 2.19s system 276% cpu 1.564 total
    awk -F : '{a+=$2} END {print a/1024**2}' 0.58s user 0.45s system 66% cpu 1.564 total
```

Aquí está restringido a `C`-files (mismo árbol de linux):

```shell
	% time pffxg.sh --workers 8 --cc --cmd wc -- -l | awk '$2 == "total" {a+=$1} END {print a/1024**2}'
    25.3935
    pffxg.sh --workers 8 --cc --cmd wc -- -l 0.76s user 0.54s system 734% cpu 0.177 total
    awk '$2 == "total" {a+=$1} END {print a/1024**2}' 0.02s user 0.00s system 9% cpu 0.177 total
```

y la versión "ripgrep":

```shell
	% time rg -tc -c \$ | awk -F : '{a+=$2} END {print a/1024**2}'
    25.3844
    rg -tc -c \$ 3.49s user 1.54s system 441% cpu 1.140 total
    awk -F : '{a+=$2} END {print a/1024**2}' 0.38s user 0.38s system 66% cpu 1.140 total
```

El verdadero **rendimiento de aplicación** proviene del equilibrio, la flexibilidad y las técnicas de programación funcional; no proviene de la fijación de tácticas de microoptimización imperativas en lenguajes de programación estáticos y compilados que son un oso para trabajar desde las perspectivas de equilibrio y flexibilidad. Estos lenguajes imperativos sobrevalorados son grandes objetivos para dominios de problemas muy específicos, pero son terribles para el rendimiento de las aplicaciones de todo el sistema.

`pffxg.sh` no es un producto, y este no es un argumento de venta para él. Es un **ejemplo** para ilustrar mi punto de una manera muy dramática. Si está familiarizado con la larga historia de las soluciones "grep" recursivas filtradas en GitHub, todas se basan en la idea de que el problema con la implementación "Perl" original de Andy Lester [ack](https://beyondgrep.com/).

¡Que florezcan mil flores, por tontas que parezcan!

*$Fecha: 2023-11-25 15:01:01 -0500 (Sat, 25 Nov 2023) $*
