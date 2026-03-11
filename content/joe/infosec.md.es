---
archived: ~
categories: Seguridad, TI, Perl
dependencies: '*.md.es'
keywords: infosec, confianza cero, tinte, dinámico, datos
published: ~
status: archivado
title: Manual de seguridad de la información
---

[TOC]

#### ¿Cuál es el objetivo principal de InfoSec?

*Para garantizar que todos los cambios en los límites del contexto estén bien regulados.*

Por ejemplo, cada **llamada de sistema** en una plataforma UNIX cumple esta condición, en términos del modelo de seguridad de usuario/grupo process+sistema de archivos de UNIX. La definición literal de un **conmutador de contexto**, como se caracteriza por **llamadas del sistema**, implica la comprobación de validez de uso de API en el lado del núcleo de la llamada.

En términos de entrega de SaaS, {# lede #}todos los datos procedentes de una **llamada de sistema** de UNIX en tiempo de ejecución se deben tratar como **contenidos**{# lede #} y validado en los puntos de entrada en la memoria de proceso accesible de la aplicación. Estos puntos de entrada deben considerarse **límites de contexto infeccioso** para dichos datos de aplicación. La validación normativa adecuada debe incluir en la lista blanca los patrones de cadena (por lo general, **regex**); los datos **contenidos** que borran la lista blanca y sus datos dependientes se pueden enviar de forma segura desde la memoria del proceso de la aplicación mediante otra **llamada del sistema**. Esos puntos de salida de **llamada del sistema** también son **límites de contexto de infeccios**; lo que constituye patrones de lista blanca "seguros" en los datos **contenidos** de entrada se informa mediante estas API específicas en los puntos de salida. Sobre el SSDLC, estos puntos de salida evolucionarán, al igual que las correspondientes listas blancas.

El modelo de seguridad de UNIX por sí solo nunca hizo provisiones para el desarrollo de aplicaciones de cliente/servidor en red, porque históricamente la API de socket BSD que precedió al aumento de la computación en red en 90s (Sun Microsystems) se inventó más de una década después del nacimiento de UNIX (con su modelo de seguridad multiusuario basado en SO totalmente formado al nacer). [MIT Kerberos](https://web.mit.edu/kerberos/) fue un paso en la dirección correcta, pero deja mucho que desear en un contexto SaaS.

La programación segura de CPU para realizar trabajos de nivel de núcleo en nombre de algún "contexto autorizado de usuario/grupo/rol" desvinculado del contexto de usuario/grupo UNIX del proceso subyacente siempre ha estado fuera del modelo UNIX. Muchas iniciativas de infosec no reconocen que esta responsabilidad regulatoria pertenece solo a las aplicaciones; ¡no dejes que la tuya sea una!

En caso de que no esté claro en este punto, los equipos de DevOps/SRE que evalúan los incidentes de seguridad (**CAI**) de SaaS en Linux deben familiarizarse con [top](fun-with-htop) `restricción` interfaz a través del `` clave! Mejor aún dominar `restricción` como autónomo. (Para su información: Tengo compilaciones estáticas de estos binarios en github que se pueden entregar a contenedores o nodos K8s, incluso a través de la entrega SSH/SSM, en <https://github.com/joesuf4/home/tree/wsl/bin>).

#### ¿Cómo se relaciona esto con las iniciativas de confianza cero, como una cuestión práctica?

[Arquitecturas de confianza cero](https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-207.pdf) no tienen límites de contexto de infosec específicos de red.

Si bien puede haber contextos de VPN/Firewall en la realidad, ninguno de esos detalles son relevantes para InfoSec dentro de un marco de confianza cero. En otras palabras, tales iniciativas de seguridad de topología de red pueden aumentar las iniciativas de confianza cero, pero nunca se confía en ellas dentro de una iniciativa de confianza cero a nivel de seguridad de servidor-host base en todo el nivel de la aplicación.

MIT Kerberos y Active Directory son compatibles con la confianza cero, por ejemplo.

<!-- $Date$ $Author$ $Revision$ -->