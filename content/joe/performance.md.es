---
categories: Rendimiento, herramientas
dependencies: '*.md.es'
keywords: ~
status: archivado
title: Rendimiento de aplicaciones
---

{# lede #}Muchos desarrolladores caen en la trampa de pensar que la optimización del rendimiento consiste en hacer que cada línea de código sea lo más eficiente posible.{# lede #}o eligiendo escribir toda su aplicación en el lenguaje de programación más rápido que puedan encontrar.

En realidad es todo lo contrario. Empiece por las restricciones arquitectónicas de la aplicación y utilícelas para aumentar el detalle de la observación "más lento" parte del programa. La **implementación** de esa parte guía todas las demás opciones de rendimiento que necesita realizar. Cualquier cosa que no sea tan lenta como esa parte, no necesita optimizarse aún más. En cambio, céntrese en la expresión humana y la simplicidad y claridad de la implementación, para los lectores no expertos sobre la `SSDLC` del software, para el resto del código de su programa.

Puedes iterar en este manual, pero nunca he necesitado ir más allá de 3 iteraciones en mi carrera profesional.

Así que sigue adelante y usa un lenguaje de programación elegante como `Python3` o `Javascript`/`Script de tipo`, y deje que los Expertos en Materia (**SME**) que existen en el mundo de código abierto le den poder `C`/`C++` vinculaciones nativas para sus necesidades especiales. Nada de lo que haga por la lógica de negocio necesita más velocidad de lo que **cualquier** lenguaje de programación dinámico puede proporcionarle **listos para usar**.

Incluso un script bash sin dependencia es una solución viable para muchas tareas básicas. He aquí uno que escribí para la firma de Realidad Aumentada [Salto mágico](https://magicleap.com) hace años, para sustituir a un torpe [OpenGrok](https://oracle.github.io/opengrok/) servicio con algo que aprovecha la paralelización de varios procesadores con `xargs -P`y apoya [PCRE](https://www.pcre.org/) Búsqueda sencilla `Emacs`/`Vim` vinculaciones.

https://github.com/joesuf4/home/blob/wsl/bin/pffxg.sh

Ese script es un orden de magnitud más rápido que los sospechosos habituales en GitHub, que se escribieron en lenguajes de programación compilados y de tipo estático. Pero al identificar el cuello de botella exacto en `bash` (bucle con alto volumen `bifurcación + ejecución` llamadas en el medio), y el uso de `xargs` En cambio, obtienes un script que se parece mucho a este, con el algoritmo central implementado en 10 líneas de `shell`.

También está utilizando la comunidad de código abierto de **PYME** de una manera inteligente, en lugar de la otra. "grep recursivo filtrado" implementaciones en GitHub. En lugar de adoptar y mantener internamente mi propia (hilo) implementación de `buscar`, `xargs`y `grep`, solo reutilizo los ejecutables preinstalados que otras **SME** han estado perfeccionando durante décadas **tal cual**, y principalmente uso shell *builtins* para el resto. No necesito dominar sus implementaciones, solo reutilizar sus `CLI`s. Ni siquiera quiero dominarlos, eso es **su** bailiwick. Los deltas de rendimiento solo importan cuando son varios segundos o más, dados los casos de uso esperados (humanos) de la aplicación.

El resto de la secuencia de comandos aprovecha principalmente las incorporaciones de shell bash, que se implementan en `C` por los desarrolladores de bash.

Para ver la dirección opuesta, donde todo se hace internamente, totalmente microoptimizado, y aún no puede superar este script con las opciones de búsqueda por defecto, y sin sistema de almacenamiento en caché disponible, aquí hay un buen ejemplo <https://github.com/BurntSushi/ripgrep>

Solo para sacar el primer #performance #benchmark de esa página y escalarlo desde un tamaño de árbol de muestra de juguete (fuentes de núcleo de línux), a un árbol heterogéneo que es `23GB`: (mejores ejecuciones después de 3 iteraciones; `LANG=en_US.UTF-8`)

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

Es bastante tonto microoptimizar algo que está profundamente vinculado al estado de la caché del sistema de archivos del núcleo para su búsqueda. La variación en los tiempos de rendimiento está dominada por la velocidad de acceso al corpus de contenidos de los archivos, y es un orden de magnitud más relevante que cualquier otro factor para los resultados finales. Estando en `NVMe` ayuda, pero nada en este espacio late `RAM` propio.

Es por eso que tener una caché comprimida en memoria para un gran corpus de archivos, estabilizará los tiempos de rendimiento. Es sorprendente que nadie más pensara que esto era lo suficientemente importante como para apoyar.

Desactive la segunda #performance #benchmark de esa página y amplíela como antes (mismo) `23GB` árbol):

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

Un ajuste `pffxg.sh` sigue siendo más rápido, a pesar de todo el trabajo puesto en microoptimización ripgrep para esto `C`-búsqueda de archivos.

La forma en que he utilizado este guión con [AOSP](https://source.android.com) era programar un `repositorio` sincronización y una posterior `pffxg.sh` **`lz4`-compressed-cache seed-to-`tmpfs`** correr todas las mañanas antes del trabajo (a través de `crontab`), con `PFFXG_CACHE=...` establecido en mi `~/.pffxg.conf` archivo. Por lo tanto, cualquier `pffxg.sh` las llamadas que he ejecutado durante el día laborable utilizarían la caché comprimida en `tmpfs`, independientemente del estado de la caché del sistema de archivos del núcleo en ese momento.

.25M Ubicación entre `ripgrep` y [ugrep](https://github.com/Genivia/ugrep). 632 LOC para `pffxg.sh`. Silencioso.

Porque es un programa de shell tan pequeño, `pffxg.sh` puede darte poderosos ganchos en sus interiores con casi cero esfuerzo. Incluso el `grep` El comando en sí es personalizable: cualquier comando que necesite ejecutar en un corpus selecto de archivos, que pueda aceptar una lista de nombres de archivo anexados al final de sus argumentos, es un juego justo. Esta es una "recuento total de líneas en `MiLOC`" ejercicio en el repositorio de git del núcleo linux:

```shell
	% time find *-type f | xargs wc -l | awk '{ $2 == "total" {a+=$1} END {print a/1024**2}'
    28.451
    find *-type f 0.00s user 0.06s system 2% cpu 2.733 total
    xargs wc -l 0.53s user 1.02s system 54% cpu 2.853 total
    awk '$2 == "total" {a+=$1} END {print a/1024**2}' 0.23s user 0.59s system 28% cpu 2.853 total

% time pffxg.sh --workers 8 --cmd wc --all -- -l | awk '{$2 == "total" {a+=$1} END {print a/1024**2}'
    28.4506
    pffxg.sh --workers 8 --cmd wc --all -- -l 0.92s user 0.66s system 826% cpu 0.192 total
    awk '$2 == "total" {a+=$1} END {print a/1024**2}' 0.02s user 0.00s system 11% cpu 0.192 total
```

`ripgrep` versión:

```shell
	% time rg -c \$ | awk -F : '{a+=$2} END {print a/1024**2}'
    28.4284
    rg -c \$ 2.12s user 2.19s system 276% cpu 1.564 total
    awk -F : '{a+=$2} END {print a/1024**2}' 0.58s user 0.45s system 66% cpu 1.564 total
```

Aquí se limita a `C`-files (mismo árbol de linux):

```shell
	% time pffxg.sh --workers 8 --cc --cmd wc -- -l | awk '$2 == "total" {a+=$1} END {print a/1024**2}'
    25.3935
    pffxg.sh --workers 8 --cc --cmd wc -- -l 0.76s user 0.54s system 734% cpu 0.177 total
    awk '$2 == "total" {a+=$1} END {print a/1024**2}' 0.02s user 0.00s system 9% cpu 0.177 total
```

y el `ripgrep` versión:

```shell
	% time rg -tc -c \$ | awk -F : '{a+=$2} END {print a/1024**2}'
    25.3844
    rg -tc -c \$ 3.49s user 1.54s system 441% cpu 1.140 total
    awk -F : '{a+=$2} END {print a/1024**2}' 0.38s user 0.38s system 66% cpu 1.140 total
```

El **rendimiento de aplicación** real proviene del equilibrio, la flexibilidad y las técnicas de programación funcional; no proviene de la fijación de tácticas de microoptimización imperativas en lenguajes de programación estáticos y compilados con los que trabajar desde las perspectivas de equilibrio y flexibilidad. Estos lenguajes excesivos e imperativos son grandes objetivos para dominios de problemas muy específicos, pero son terribles para el rendimiento de las aplicaciones en todo el sistema.

`pffxg.sh` No es un producto, y esto no es un argumento de venta para él. Es un **ejemplo** para ilustrar mi punto de una manera muy dramática. Si estás familiarizado con la larga historia de las soluciones filtradas-recursivas-grep en GitHub, todos ellos se basan en la idea de que el problema con el original de Andy Lester `Perl` implementación [confirmación](https://beyondgrep.com/), fue que fue escrito en `Perl`. El único problema real desde el punto de vista del rendimiento fue que la `Perl` Fue escrito por Andy, que no parecía tener ningún don para los conceptos de rendimiento de los sistemas (como la agricultura fuera de la `buscar` trabajo de paralelización a un diseño específico `C` binario), pero en su lugar dirigido a la portabilidad perezosa tratando de capturar todo el código como un solo hilo Pure `Perl` rareza.

¡Que mil flores florezcan, por tontas que parezcan!

<!-- $Date$ $Author$ $Revision$ -->
