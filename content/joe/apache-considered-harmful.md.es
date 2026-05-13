---
categories: Apache, Perl
dependencies: '*.md.es'
keywords: apache,httpd,mod_apreq2,libapreq2,mod_perl
status: borrador
title: Desarrolladores de Apache HTTPd considerados perjudiciales
---

<div class="right">

![tarrado y emplumado](apache-considered-harmful.page/feather2.png)

</div>

## Antecedentes

Durante los últimos 25 años, he sido el desarrollador principal de `apreq` subproyecto dentro del [Servidor HTTPd de Apache](https://httpd.apache.org) Proyecto principal. La idea original de `libapreq`, como seguro/performante [Envío de formulario HTML](https://www.w3.org/TR/2014/REC-html5-20141028/forms.html) y [Cookie](https://datatracker.ietf.org/doc/html/rfc6265) La biblioteca de análisis, surgió de una colaboración entre Lincoln Stein y Doug MacEachern a finales de 90s.

Fue mi visión en aquel entonces transformar la biblioteca en un genérico, no relacionado con Perl. `C` biblioteca que soportaría enlaces de lenguaje de otros lenguajes de programación, por lo que propuse que el proyecto se [alojado](https://httpd.apache.org/apreq) bajo el paraguas HTTPd en lugar del [Apache-Perl](https://perl.apache.org/) proyecto.

Con la llegada de `httpd-2.X`, totalmente nuevo `I/O Filter` arquitectura surgida de `httpd` núcleo, así como la separación completa de `APR` desde el propio núcleo como un tiempo de ejecución de portabilidad similar a POSIX de propósito más general para `C` proyectos como `Subversion`. De hecho, `libapreq2` está más estrechamente alineada con la `Apache APR` proyecto en ese espíritu, y su API de Perl refleja que como parte de su `APR::Request` acumulación.  Tiene un modo *CGI* incorporado para el funcionamiento independiente, fuera de la `httpd` tiempo de ejecución, lo que hace que las pruebas de unidades sean muy sencillas.

Sin embargo, el componente clave de `apreq2` siempre ha sido el `mod_apreq2` módulo Apache, que fue concebido por primera vez por `Bill Wrowe` a principios de 2000s.  Lo que él diseñó, durante una sesión de lluvia de ideas conmigo (en persona), fue una sola biblioteca de analizadores interna de `httpd`, que **compartió** la solicitud enviada *body* con cada módulo de partes interesadas clave en el tiempo de ejecución.  Esto significaba proporcionar datos analizados a los módulos conectados al motor de procesamiento de solicitudes *before*, *during*, y *after* que se ejecuta el manejador de contenido. Además, también tenía que trabajar para solicitudes secundarias, independientemente de si el manejador de contenido consumía o no los datos analizados, o consumía y volvía a analizar el propio cuerpo de solicitud sin procesar.

Le expliqué los objetivos de diseño varias veces a lo largo de los años, incluso en 2012. [desarrollo@httpd](https://lists.apache.org/list.html?dev@httpd.apache.org:2012-04). Pero siempre fue como hablar con el viento con estos chicos; simplemente nunca les importó.

## Reunión de nubes de tormenta

Si bien esta visión tuvo un gran éxito, con enlaces de idiomas disponibles para varios idiomas como [`Perl`](https://perl.apache.org/), [`PHP`](https://github.com/php/php-src/blob/master/main/rfc1867.c),  [`TCL`](https://tcl.apache.org/), [`R`](https://github.com/jeffreyhorner/rapache)desde 2010 ha demostrado ser trágico para la [comunidad de usuarios existente](https://webtechsurvey.com/technology/mod_apreq2) <a href="#commentAA" class="border border-warning text-muted reference-link" id="commentAA-link" title="{{commentAA.headers.title}}">compuesto por todos ellos</a>No sólo los miembros del `Perl` comunidad.

¿Qué pasó? [Philip Gollucci](https://projects.apache.org/committee.html?httpd#:~:text=Philip%20M.%20Gollucci), un colega mío de Perl/FreeBSD en ese momento, comenzó a agitar que promocionemos el proyecto para ser lanzado desde dentro del propio servidor HTTPd. Qué {# lede #}Felipe no sabía muy bien en aquel entonces era lo [peevish, vapid y territorial](https://www.mail-archive.com/dev@httpd.apache.org/msg77781.html) ese equipo se había convertido en{# lede #}que habría significado tener que colaborar con ellos directamente en [decisiones orientadas al usuario](https://www.mail-archive.com/dev@httpd.apache.org/msg77806.html) Sobre la base de código.

En 2012, Philip consiguió lo que quería y dejé de resistir, por lo que [bifurcado](https://svn.apache.org/viewvc?view=revision&revision=1201372) el proyecto existente y copió el `C` componentes de la biblioteca en el núcleo HTTPd.

## Fallo

[En 2018](https://www.mail-archive.com/search?l=modperl@perl.apache.org&q=subject:%22Re%5C%3A+New+release+of+libapreq2%22&o=newest&f=1) Renuncié a la Fundación en masa<sup>1</sup>. Puedes adivinar las razones.

En 2020, aproximadamente, el equipo de seguridad de Google aprovechó una versión alfa de httpd 2.5 al desconcertar su copia de 8 años de antigüedad de `apreq2`. Encontraron algunos puntos de acceso que necesitaban reparación.

En lugar de tener la cortesía de llegar a Felipe, [Issac Goldstand](https://projects.apache.org/committee.html?httpd#:~:text=Issac%20Goldstand), [Max Kellermann](https://projects.apache.org/committee.html?httpd#:~:text=Max%20Kellermann) (@MaxKellermann), yo mismo (@joesuf4), o cualquier otra persona involucrada en el desarrollo de `libapreq2`, un ingeniero junior en el equipo HTTPd pasó por el negocio de "corrección de bugs" las vulnerabilidades encontradas por Google. Puede ver un registro de su trabajo de prueba y error en cada versión desde entonces.

Por supuesto, los CVE reportados fueron escritos por aficionados:

1. Es imposible causar un desbordamiento de amortiguador (por diseño arquitectónico), por lo que tales afirmaciones siempre fueron tontas; como lo demuestra el hecho de que nunca se ha publicado ningún código de explotación.

2. A pesar de mis mejores esfuerzos, las des referencias del puntero NULL fueron posibles; con lo cual el desarrollador menor hizo una limpieza exhaustiva hace años.

3. Hace veinte años tuve un pedo en el cerebro alrededor de codificaciones de charset para encabezados MIME, que siempre están limpios ASCII de 7 bits cuando están bien formados.  La injusticia de eso [lógica del analizador](https://github.com/joesuf4/apreq/blob/trunk/library/util.c#L846) era la única preocupación de seguridad significativa en todo el historial de la base de código &mdash; Y como un NPE, todo lo que un atacante podía hacer era bloquear el servidor web. Por supuesto, en un entorno de prefork esto es dispararse en el pie como un hacker; pero con @joesuf4/mod_perl, ejecutarlo dentro de HTTP/2 con mpm_event ahora es fácilmente alcanzable. Por lo tanto, la eliminación de todas las formas de bloqueos del servidor fue un trabajo vital y necesario. El desarrollador junior merece mucho crédito por ese logro eventual en el baúl de @apache/apreq. Reconocimiento.

Pero el golpe de gracia fue la liberación de 2022 de [2.17](https://www.google.com/search?q=libapreq2-2.17), en donde el desarrollador novato [Introdujo deliberadamente un bug fatal en la base de código](https://github.com/apache/apreq/commit/de127ca503ad1d74bcfd8e066cf1eb3882d31891), romper [una prueba de regresión de diecinueve años](http://svn.apache.org/viewvc/httpd/apreq/trunk/library/t/parsers.c?r1=161816&r2=164254&pathrev=1895107).

## Postmortem

Si te estás preguntando cómo termina algo con una prueba de regresión rota / CVE excepcional [CPAN](https://metacpan.org/dist/libapreq2) como un accesorio permanente, tendrás que ver cómo [RELENG](https://httpd.apache.org/dev/release.html) se realiza en el proyecto del servidor.

Cuento largo, [comentaron la prueba](https://github.com/apache/apreq/commit/ee43f996710aad757b783ee77382ac4a78169602) y lo envió de todos modos, y lo llamó una liberación de seguridad que [Se solucionó una vulnerabilidad a la que cada versión anterior era susceptible de](https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1018191).

<div class="right">

![Logotipo de Superman](apache-considered-harmful.page/superman.jpg)

</div>

¿Por qué me importa ahora? Porque yo soy el tonto [los usuarios se ponen en contacto para obtener respuestas](https://www.mail-archive.com/dev@httpd.apache.org/msg77426.html) como un experto en temas conocidos.

Esto apesta<sup>2</sup>Pero lamento decirles que mis días usando la capa de Superman en Apache terminaron hace aproximadamente una década.

En cualquier caso, lo mejor que puedo hacer en este punto es mostrarle mi árbol de origen de producción para libapreq2 &mdash; @joesuf4/apreq (y @joesuf4/mod_perl).

## Notas al pie

1. Uno no simplemente "dimisión de la ASF". Para hacer una pausa limpia, uno debe renunciar no solo a la membresía de la ASF, sino a cada proyecto / comité del que uno es miembro.  De lo contrario, uno termina ahogándose en el e-mail spam infernal de Apache.

2. Los machos beta abandonaron el proyecto @apache/apreq, y están pasando a @apache/mod_perl, porque los machos beta no tienen nada mejor que ver con su tiempo. Yann Ylavic, el "desarrollador novato" Por encima de quien realmente trabajó en apreq mientras sus compañeros le fallaron, no emitió un voto para retirar el proyecto. No es sorprendente, porque es un solucionador de problemas, no un hombre beta.

<!-- $Date$ $Author$ $Revision$ -->
