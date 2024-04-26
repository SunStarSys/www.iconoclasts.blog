---
archived: ~
categories: Seguridad, TI, Perl
dependencies: '*.md.es'
keywords: infosec,cerotrust,taint,dinámico,datos
published: ~
status: archivado
title: Manual de seguridad de la información
---

[TOC]

#### ¿Cuál es el objetivo principal de InfoSec?

*Para garantizar que todos los cambios en los límites del contexto estén bien regulados.*

Por ejemplo, cada **llamada de sistema** en una plataforma UNIX cumple esta condición, en términos del modelo de seguridad de usuario/grupo de UNIX process+filesystem. La definición literal de un **conmutador de contexto**, como se tipifica mediante **llamadas del sistema**, implica la comprobación de validez del uso de API en el lado del núcleo de la llamada.

En términos de entrega de SaaS, {# lede #}todos los datos procedentes de una **llamada de sistema** de UNIX en tiempo de ejecución se deben tratar como **mantenidos**{# lede #}

El modelo de seguridad UNIX por sí solo nunca hizo provisiones para el desarrollo de aplicaciones cliente/servidor en red, porque históricamente la API de socket BSD que precedió al aumento de Network Computing en los años 90 (Sun Microsystems) fue inventada más de una década después de que UNIX naciera (con su modelo de seguridad multiusuario basado en el sistema operativo completamente formado al nacer). [Kerberos del MIT](https://web.mit.edu/kerberos/).

La programación segura de CPU para realizar trabajo en el nivel de núcleo en nombre de algún "contexto de usuario/grupo/rol autorizado" sin conexión con el contexto de usuario/grupo de UNIX del proceso subyacente siempre ha estado fuera del modelo UNIX. Muchas iniciativas de infosec no reconocen que esta responsabilidad regulatoria pertenece solo a las aplicaciones; ¡no dejes que la tuya sea una!

En caso de que no esté claro en este punto, los equipos de DevOps/SRE que clasifican los incidentes de seguridad SaaS (**CAI**) en Linux deben familiarizarse con [htop](fun-with-htop)s `strapón` interfaz a través de `s` clave! Mejor aún para dominar `strapón`

#### ¿Cómo se relaciona esto con las iniciativas de Cero Confianza, como una cuestión práctica?

[Arquitecturas de confianza cero](https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-207.pdf).

Aunque puede haber contextos de VPN/Firewall en realidad, ninguno de esos detalles es relevante para InfoSec dentro de un marco de confianza cero. En otras palabras, estas iniciativas de seguridad de topología de red pueden aumentar las iniciativas de Zero-Trust, pero nunca se basan en una iniciativa de Zero-Trust en el nivel de seguridad base servidor-host hasta el nivel de aplicación.

MIT Kerberos y Active Directory cumplen con Zero-Trust, por ejemplo.

*$Fecha: 2023-01-19 22:58:40 +0000 (Jue, 19 de enero de 2023) $*
