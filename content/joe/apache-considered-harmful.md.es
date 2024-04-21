---
categories: Apache, Perl
dependencies: '*.md.es'
keywords: apache,httpd,mod_apreq2,libapreq2,mod_perl
status: verificado=19662
title: Desarrolladores de Apache HTTPd considerados dañinos
---

<div class="right">

![arrojado y emplumado](apache-considered-harmful.page/feather.png).

</div>

## Fondo

Durante los últimos 25 años, he sido el desarrollador principal del subproyecto `apreq` dentro del [servidor HTTPd de [Apache](https://httpd.apache.org) Proyecto principal. La idea original de `libapreq`, como un seguro / eficaz [envío del formulario HTML](https://www.w3.org/TR/2014/REC-html5-20141028/forms.html) y [Cookie](https://datatracker.ietf.org/doc/html/rfc6265).

Era mi visión en ese entonces transformar la biblioteca en una biblioteca genérica, no relacionada con Perl `C` que apoyara los enlaces de lenguaje de otros lenguajes de programación, por lo que presioné para que el proyecto fuera [hospedado](https://httpd.apache.org/apreq) bajo el paraguas HTTPd en lugar del [Apache-Perl](https://perl.apache.org/).

Con la llegada de `httpd-2. X`, una arquitectura completamente nueva `I/O Filter` emergió del núcleo `httpd`, así como la separación completa de `APR` del núcleo en sí como un tiempo de ejecución de portabilidad POSIX de propósito más general para proyectos `C` como `Subversion`. De hecho, `libapreq2` está más estrechamente ligado al proyecto `Apache APR` en ese espíritu, y su API de Perl refleja eso como parte de su proyecto `APR::Request`.  Tiene un modo *CGI* incorporado para la operación independiente, fuera del tiempo de ejecución `httpd`, lo que hace que las pruebas unitarias sean muy fáciles.

Sin embargo, el componente clave de `apreq2` ha sido siempre el módulo `mod_apreq2` Apache, que fue concebido por primera vez por `Bill Wrowe` a principios de la década de 2000.  Lo que diseñó, durante una sesión de lluvia de ideas conmigo (en persona), fue una única biblioteca de analizadores interna de `httpd`, que **compartió** la solicitud enviada *cuerpo* con cada módulo de partes interesadas clave en el tiempo de ejecución.  Eso significaba proporcionar datos analizados a los módulos conectados al motor de procesamiento de solicitudes *antes*, *durante*, y *después* de que se ejecute el manejador de contenido. Y también necesitaba trabajar para solicitudes secundarias, independientemente de si el manejador de contenido consumía los datos analizados o consumía y volvía a analizar el propio cuerpo de la solicitud raw.

He explicado los objetivos de diseño varias veces a lo largo de los años, incluso en 2012 en [dev@httpd](https://lists.apache.org/list.html?dev@httpd.apache.org:2012-04).

## Reunión de nubes de tormenta

Si bien esta visión tuvo un gran éxito, con enlaces lingüísticos disponibles para varios idiomas como [`Perl`](https://perl.apache.org/), [`PHP`](https://github.com/php/php-src/blob/master/main/rfc1867.c),  [`TCL`](https://tcl.apache.org/), [`R`](https://github.com/jeffreyhorner/rapache), etc., desde aproximadamente 2010 ha demostrado ser trágico para la [comunidad de usuarios existente](https://webtechsurvey.com/technology/smod_apreq2).

¿Qué pasó? [Philip Gollucci](https://projects.apache.org/committee.html?httpd#:~:text=Philip%20M.%20Gollucci), un colega mío Perl/FreeBSD en ese momento, comenzó a agitar que promoviéramos el proyecto que se lanzaría desde el propio servidor HTTPd. Qué {{commentAA.headers.title}}Felipe no sabía muy bien en ese entonces era lo completamente [peevish, vapid, y territorial](https://www.mail-archive.com/dev@httpd.apache.org/msg77781.html) ese equipo se había convertido{# lede #}, lo que habría significado tener que colaborar con ellos directamente en [decisiones orientadas al usuario](https://www.mail-archive.com/dev@httpd.apache.org/msg77806.html).

En 2012, Philip consiguió lo que quería y dejé de resistir, así que [forked](https://svn.apache.org/viewvc?view=revision&revision=1201372).

## Caída

[En 2018](https://www.mail-archive.com/search?l=modperl@perl.apache.org&q=subject:%22Re%5C%3A+New+release+of+libapreq2%22&o=newest&f=1).

En 2020, el equipo de seguridad de Google aprovechó una versión alfa de httpd 2.5 al difuminar su copia de 8 años de `apreq2`. Encontraron algunos puntos calientes que necesitaban reparación.

En lugar de tener la cortesía de llegar a Felipe, [Issac Goldstand](https://projects.apache.org/committee.html?httpd#:~:text=Issac%20Goldstand), [Max Kellermann](https://projects.apache.org/committee.html?httpd#:~:text=Max%20Kellermann).

Pero el golpe de gracia fue la liberación en 2022 de [2.17](https://www.google.com/search?q=libapreq2-2.17), en donde el desarrollador novato [a propósito introdujo un error fatal en la base de código](http://svn.apache.org/viewvc?view=revision&revision=1895107), rompiendo [una prueba de regresión de diecinueve años](http://svn.apache.org/viewvc/httpd/apreq/trunk/library/t/parsers.c?r1=161816&r2=164254&pathrev=1895107).

## Postmortem

Si te estás preguntando cómo algo con una prueba de regresión rota termina en [CPAN](https://cpan-digger.perlmaven.com/dist/libapreq2), tendrás que ver cómo [RELENG](https://httpd.apache.org/dev/release.html).

Larga historia corta, [comentaron la prueba](http://svn.apache.org/viewvc?view=revision&revision=1903489) y lo envió de todos modos, y lo llamó una versión de seguridad que [arregla una vulnerabilidad cada versión anterior era susceptible a](https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1018191).

<div class="right">

![Logotipo de Superman](apache-considered-harmful.page/superman.jpg).

</div>

¿Por qué me importa ahora? Porque yo soy el chupador [los usuarios se acercan para obtener respuestas](https://www.mail-archive.com/dev@httpd.apache.org/msg77426.html).

Esto apesta, pero lamento decirles que mis días usando la capa de Superman en Apache terminaron hace aproximadamente una década.

<!-- $Date$ $Author$ $Revision$ -->
