---
archived: ~
categories: Rendimiento, herramientas
dependencies: '*.md.es'
keywords: ~
published: ~
status: archivado
title: Rendimiento de aplicaciones
---

{# lede #}Muchos desarrolladores caen en la trampa de pensar que la optimización del rendimiento consiste en hacer que cada línea de código sea lo más eficiente posible.{# lede #}

En realidad es todo lo contrario. Comienza con las restricciones arquitectónicas de la aplicación y las utiliza para aumentar detalle hasta la parte "más lenta" observada del programa. La **implantación** de esa parte guía todas las demás opciones de rendimiento que necesita realizar. Cualquier cosa que no sea tan lenta como esa parte, no necesita ser optimizada aún más. En su lugar, centrarse en la expresión humana y la simplicidad y claridad de la implementación, a los lectores no expertos sobre la `Modelo:SSL`

Puedes iterar en este libro de estrategias, pero nunca he tenido que ir más allá de 3 iteraciones en mi carrera profesional.

Así que adelante y utiliza un lenguaje de programación elegante como `Python3` o `Archivo Javascript`/`Tipo de letra`y deje que los expertos en la materia (**SME**) que hay en el mundo de código abierto le den una poderosa `C`/`C++`

Incluso una secuencia de comandos bash libre de dependencias es una solución viable para muchas tareas básicas. He aquí uno que escribí para la firma de Realidad Aumentada [Salto mágico](https://magicleap.com) años, para sustituir a un torpe [OpenGrok](https://oracle.github.io/opengrok/) servicio con algo que aprovecha la paralelización multiprocesador con `xargs -P`, y apoya [PCRE](https://www.pcre.org/) buscar con simple `Emacs`/`Vim`

https://github.com/joesuf4/home/blob/wsl/bin/pffxg.sh

Ese script es un orden de magnitud más rápido que los sospechosos habituales en GitHub, que se escribieron en lenguajes de programación compilados y estáticos. Pero al identificar el cuello de botella exacto en `bash` (en bucle con alto volumen `bifurcación + ejecución` llamadas en el medio), y utilizando `xargos` en su lugar, se obtiene un script que se parece mucho a este, con el algoritmo principal implementado en 10 líneas de `shell`

También está utilizando la comunidad de código abierto de **PYME** de una manera inteligente, en lugar de la forma en que lo hicieron las otras implementaciones de "grep recursivo filtrado" en GitHub. En lugar de adoptar y mantener internamente mi propia implementación (threaded) de `buscar`, `xargos`, y `verde`, acabo de reutilizar los ejecutables preinstalados que otras **PYME** han estado perfeccionando durante décadas **tal cual**. No necesito dominar sus implementaciones, solo reutilizarlas `CLI`

Para ver la tachuela opuesta, donde todo se hace internamente, completamente microoptimizado, y aún así no puede vencer a este script con las opciones de búsqueda predeterminadas, y no hay un sistema de almacenamiento en caché disponible, aquí hay un buen ejemplo <https://github.com/BurntSushi/ripgrep>

Solo para extraer el primer #performance #benchmark de esa página y escalarlo desde un tamaño de árbol de muestra de juguete (fuentes de núcleo linux) hasta un árbol heterogéneo que sea `23GB`: (mejores carreras después de 3 iteraciones; `LANG=en_US.UTF-8`

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

Es bastante tonto microoptimizar algo que está profundamente ligado al estado de la caché del sistema de archivos del núcleo para su búsqueda. La variación de los tiempos de rendimiento está dominada por la velocidad de acceso al corpus de contenido de los archivos, y es un orden de magnitud más relevante que cualquier otro factor para los resultados finales. Estar en `NVMe` ayuda, pero nada en este espacio late `RAM`

Es por eso que tener una caché comprimida en memoria para un gran corpus de archivos, estabilizará los tiempos de rendimiento. Es sorprendente que nadie más pensara que esto era lo suficientemente importante como para apoyar.

Desactive la segunda #performance #benchmark de esa página y amplíela verticalmente como antes (igual que `23GB`

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

A sintonizado `pffxg.sh` todavía es más rápido, a pesar de todo el trabajo puesto en microoptimización ripgrep para este `C`

La forma en que usé este guión con [AOSP](https://source.android.com) era programar un `repositorio` sincronización y una posterior `pffxg.sh` **`lzop`-compressed-cache seed-to-`tmpfs`** correr todas las mañanas antes del trabajo (via `crontab`), con `PFFXG_CACHE=...` establecido en mi `~/.pffxg.conf` archivo. Así pues, cualquier `pffxg.sh` las llamadas que he ejecutado durante el día laborable utilizarían la caché comprimida en `tmpfs`

.25M de LOC entre `ripgrep` y [ugrep](https://github.com/Genivia/ugrep). 632 LOC para `pffxg.sh`

Porque es un programa de shell tan pequeño, `pffxg.sh` puede darle poderosos ganchos en sus interiores con casi cero esfuerzo. Incluso el `verde` El comando en sí es personalizable: cualquier comando que necesite ejecutar en un corpus selecto de archivos, que puede aceptar una lista de nombres de archivo anexados al final de sus argumentos, es un juego justo. Aquí hay un "recuento total de líneas en `MiLOC`

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

`ripgrep`

```shell
	% time rg -c \$ | awk -F : '{a+=$2} END {print a/1024**2}'
    28.4284
    rg -c \$ 2.12s user 2.19s system 276% cpu 1.564 total
    awk -F : '{a+=$2} END {print a/1024**2}' 0.58s user 0.45s system 66% cpu 1.564 total
```

Aquí se limita a `C`

```shell
	% time pffxg.sh --workers 8 --cc --cmd wc -- -l | awk '$2 == "total" {a+=$1} END {print a/1024**2}'
    25.3935
    pffxg.sh --workers 8 --cc --cmd wc -- -l 0.76s user 0.54s system 734% cpu 0.177 total
    awk '$2 == "total" {a+=$1} END {print a/1024**2}' 0.02s user 0.00s system 9% cpu 0.177 total
```

y el `ripgrep`

```shell
	% time rg -tc -c \$ | awk -F : '{a+=$2} END {print a/1024**2}'
    25.3844
    rg -tc -c \$ 3.49s user 1.54s system 441% cpu 1.140 total
    awk -F : '{a+=$2} END {print a/1024**2}' 0.38s user 0.38s system 66% cpu 1.140 total
```

El verdadero **rendimiento de aplicación** proviene del equilibrio, la flexibilidad y las técnicas de programación funcional; no proviene de la fijación de tácticas de microoptimización imperativas en lenguajes de programación estáticos y compilados que son un oso para trabajar desde las perspectivas de equilibrio y flexibilidad. Estos lenguajes imperativos sobrevalorados son grandes objetivos para dominios de problemas muy específicos, pero son terribles para el rendimiento de las aplicaciones de todo el sistema.

`pffxg.sh` no es un producto, y esto no es un argumento de venta para él. Es un **ejemplo** para ilustrar mi punto de una manera muy dramática. Si está familiarizado con la larga historia de las soluciones "grep" recursivas filtradas en GitHub, todas ellas se basan en la idea de que el problema con el original de Andy Lester `Perl` implementación [confirmación](https://beyondgrep.com/), fue que fue escrito en `Perl`. El único problema real desde el punto de vista del rendimiento fue que `Perl` fue escrito por Andy, que no parecía tener ningún don para los conceptos de rendimiento de los sistemas (como cultivar el `buscar` trabajo de paralelización a un diseño específico `C` binario), sino que apuntaba a la portabilidad perezosa al tratar de capturar todo el código como un Pure de un solo hilo. `Perl`

¡Que florezcan mil flores, por tontas que parezcan!

<!-- $Date$ $Author$ $Revision$ -->
