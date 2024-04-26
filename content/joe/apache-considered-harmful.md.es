---
archived: ~
categories: Apache, Perl
dependencies: '*.md.es'
keywords: apache,httpd,mod_apreq2,libapreq2,mod_perl
published: ~
status: borrador
title: Desarrolladores de Apache HTTPd considerados dañinos
---

<div class="right">

![alquitranados y emplumados]

</div>

## Fondo

Durante los últimos 25 años, he sido el desarrollador principal de la `apreq` subproyecto dentro de [Servidor HTTPd de Apache](https://httpd.apache.org) Proyecto principal. La idea original de `apreq`, como seguro/de buen rendimiento [Envío de formulario HTML](https://www.w3.org/TR/2014/REC-html5-20141028/forms.html) y [Italiano]

Era mi visión entonces transformar la biblioteca en un genérico, no relacionado con Perl. `C` biblioteca que soportaría enlaces de lenguaje de otros lenguajes de programación, por lo que presioné para que el proyecto fuera [homónimo](https://httpd.apache.org/apreq) bajo el paraguas HTTPd en lugar de la [Apache-Perl]

Con el advenimiento de `httpd-2. X`, un nuevo `Filtro de E/S` arquitectura surgió de `httpd` núcleo, así como la separación completa de `TAE` desde el propio núcleo como un tiempo de ejecución de portabilidad más general, similar a POSIX, para `C` proyectos como `Subversión`. De hecho, `libapreq2` está más estrechamente ligado al `APR de Apache` proyecto en ese espíritu, y su API de Perl refleja eso como parte de su `APR::Solicitud` buildout.  Tiene un modo *CGI* incorporado para la operación independiente, fuera de la `httpd`

Sin embargo, el componente clave de `apreq2` siempre ha sido el `mod_apreq2` Módulo Apache, que fue concebido por primera vez por `Bill Wrowe` a principios de la década de 2000.  Lo que diseñó, durante una sesión de lluvia de ideas conmigo (en persona), fue una sola biblioteca de analizadores interna para `httpd`

Expliqué los objetivos de diseño varias veces a lo largo de los años, incluso en 2012. [dev@httpd]

## Reunión de nubes de tormenta

Si bien esta visión tuvo un gran éxito, con enlaces lingüísticos disponibles para varios idiomas como [`Perl`](https://perl.apache.org/), [`PHP`](https://github.com/php/php-src/blob/master/main/rfc1867.c),  [`TCL`](https://tcl.apache.org/), [`R`](https://github.com/jeffreyhorner/rapache), etc., desde aproximadamente 2010 ha demostrado ser trágico para el [comunidad de usuarios existente](https://webtechsurvey.com/technology/smod_apreq2) <a class="border border-warning text-muted reference-link" href="#commentAA" id="commentAA-link" title="{{commentAA.headers.title}}">consistente en todos ellos</a>, no solo en los miembros de la `Perl`

¿Qué ha pasado? [Philip Gollucci](https://projects.apache.org/committee.html?httpd#:~:text=Philip%20M.%20Gollucci), un colega mío de Perl/FreeBSD en ese momento, comenzó a agitar que promocionáramos el proyecto para su lanzamiento desde el propio servidor HTTPd. Qué {# lede #}Felipe no sabía muy bien entonces era lo absolutamente [peevish, vapid y territorial](https://www.mail-archive.com/dev@httpd.apache.org/msg77781.html) en el que se había convertido ese equipo{# lede #}, lo que habría significado tener que colaborar con ellos directamente en [decisiones orientadas al usuario]

En 2012, Philip consiguió lo que quería y dejé de resistir, así que [bifurcado](https://svn.apache.org/viewvc?view=revision&revision=1201372) el proyecto existente y copió el `C`

## Caída

[En 2018]

En 2020, el equipo de seguridad de Google aprovechó una versión alfa de httpd 2.5 al difuminar su copia de 8 años de antigüedad de `apreq2`

En lugar de tener la cortesía de llegar a Felipe, [Isac Goldstand](https://projects.apache.org/committee.html?httpd#:~:text=Issac%20Goldstand), [Max Kellermann](https://projects.apache.org/committee.html?httpd#:~:text=Max%20Kellermann) (@MaxKellermann), yo mismo (@joesuf4), o cualquier otra persona implicada en el desarrollo de `libapreq2`

Pero el golpe de gracia fue la liberación de 2022 de [2.17](https://www.google.com/search?q=libapreq2-2.17), en el que el desarrollador novato [introdujo deliberadamente un error fatal en la base de código](http://svn.apache.org/viewvc?view=revision&revision=1895107), fraccionamiento [una prueba de regresión de diecinueve años]

## Postmortem

Si usted se pregunta cómo algo con una prueba de regresión rota termina en [CPAN](https://cpan-digger.perlmaven.com/dist/libapreq2), tendrá que ver cómo [RELENG]

Cuento corto, [comentaron la prueba](http://svn.apache.org/viewvc?view=revision&revision=1903489) y lo envió de todos modos, y lo llamó una versión de seguridad que [solucionó una vulnerabilidad cada versión anterior era susceptible de]

<div class="right">

![Logotipo de Superman]

</div>

¿Por qué me importa ahora? Porque yo soy el chupador [los usuarios buscan respuestas]

Esto apesta, pero lamento decirles que mis días usando la capa de Superman en Apache terminaron hace aproximadamente una década.

<!-- $Date$ $Author$ $Revision$ -->
