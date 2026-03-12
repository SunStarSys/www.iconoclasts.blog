---
archived: ~
categories: Seguridad, TI, Perl
dependencies: '*.md.es'
keywords: infosec, confianza cero, tinte, dinámico, datos
published: ~
status: archivado
title: Manual de seguridad de la información
---

<div class="right">

![InfoSec](infosec.page/infosec).

</div>

[TOC]

#### ¿Cuál es el objetivo principal de InfoSec?

*Para garantizar que todos los cambios en los límites del contexto estén bien regulados.*

Por ejemplo, cada **llamada de sistema** en una plataforma UNIX cumple esta condición, en términos del modelo de seguridad de usuario/grupo process+sistema de archivos de UNIX. La definición literal de un **conmutador de contexto**, como se caracteriza por **llamadas del sistema**, implica la comprobación de validez de uso de API en el núcleo'lado de la llamada.

En términos de entrega de SaaS, {# lede #}todos los datos que se originan desde una **llamada de sistema** de UNIX en tiempo de ejecución se deben tratar como **contenidos**{# lede #}y validados en los puntos de entrada en la aplicación'memoria de proceso accesible. Estos puntos de entrada deben considerarse **límites de contexto infeccioso** para dichos datos de aplicación. La validación normativa adecuada debe incluir en la lista blanca los patrones de cadena (por lo general, **regex**); los datos **contenidos** que borran la lista blanca y sus datos dependientes se pueden enviar de forma segura desde la memoria del proceso de la aplicación mediante otra **llamada del sistema**. Esos puntos de salida de **llamada al sistema** también son **límites de contexto infeccioso**; lo que constituye "seguro" los patrones de lista blanca en los datos **contenidos** de entrada están informados por estas API específicas en los puntos de salida. Sobre el SSDLC, estos puntos de salida evolucionarán, al igual que las correspondientes listas blancas.

El modelo de seguridad de UNIX por sí solo nunca hizo provisiones para el desarrollo de aplicaciones de cliente/servidor en red, porque históricamente la API de socket BSD que precedió al aumento de la computación en red en 90s (Sun Microsystems) se inventó más de una década después del nacimiento de UNIX (con su modelo de seguridad multiusuario basado en SO totalmente formado al nacer). [MIT Kerberos](https://web.mit.edu/kerberos/) ha sido un paso en la dirección correcta, pero deja mucho que desear en un contexto SaaS.

Programación segura de CPU para realizar trabajo de nivel de núcleo en nombre de algunos "contexto de usuario/grupo/rol autorizado" sin ataduras al proceso subyacente'El contexto de usuario/grupo de UNIX siempre ha estado fuera del modelo de UNIX. Muchas iniciativas de infosec no reconocen que esta responsabilidad regulatoria pertenece solo a las aplicaciones;'¡Que el tuyo sea uno!

En caso de que'No está claro en este punto, los equipos de DevOps/SRE que clasifican los incidentes de seguridad (**CAI**) de SaaS en Linux deben familiarizarse con [htop](fun-with-htop)'s `estrecho` interfaz a través de `s` clave Mejor aún dominar `estrecho` como autónomo. (Para su información: Tengo compilaciones estáticas de estos binarios en github que se pueden entregar a contenedores o nodos K8s, incluso a través de la entrega SSH/SSM, en <https://github.com/joesuf4/home/tree/wsl/bin>).

#### ¿Cómo se relaciona esto con las iniciativas de confianza cero, como una cuestión práctica?

[Arquitecturas de confianza cero](https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-207.pdf) no tienen límites de contexto de infosec específicos de red.

Si bien puede haber contextos de VPN/Firewall en la realidad, ninguno de esos detalles son relevantes para InfoSec dentro de un marco de confianza cero. En otras palabras, tales iniciativas de seguridad de topología de red pueden aumentar las iniciativas de confianza cero, pero nunca se confía en ellas dentro de una iniciativa de confianza cero a nivel de seguridad de servidor-host base en todo el nivel de la aplicación.

MIT Kerberos y Active Directory son compatibles con la confianza cero, por ejemplo.

<!-- $Date$ $Author$ $Revision$ -->