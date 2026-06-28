---
categories: Apache, seguridad
dependencies: '*.md.es'
keywords: confluencia, jira, atlético, seguridad
status: verificado=46122
title: Atlassian considerado dañino
---

<div class="right">

![Tarred y Featured](wishful-thinking.page/confluence)

</div>

Hay dos puntos de vista en cosas como esta página de la [Últimos 10 años de vulnerabilidades reveladas en el software Atlassian](https://atlassian.com/trust/security/advisories):

1. que demuestra una divulgación abierta responsable y es un buen material de marketing para las ventas,

2. {# lede #}que es un largo registro de abyectos fallos arquitectónicos a escala{# lede #}.

Estoy en este último campo.[^1]

-----

## Notas al pie

[^1]. En la última frase de la famosa postmortem de nuestro equipo 2010

https://infra.apache.org/blog/apache_org_04_09_2010 [^2]

decimos (parafraseado)

"Esperamos que otras personas aprendan de nuestros errores.

En retrospectiva, claramente nuestra esperanza estaba fuera de lugar:

https://cybersecuritynews.com/atlassians-model-context-protocol/

Sin embargo, [Orión](https://sunstarsys.com/orion)El progenitor de Apache, el CMS, nació seis meses después de que se publicara la postmortem.  En ese caso, esas lecciones informaron el diseño del dolor de la experiencia vivida.

[^2]. La entrada del blog a la inepta postmortem de Atlassian sobre este incidente ha sido redactada desde Internet. Básicamente no lograron mantener el 301 después de unos años, así que aquí es donde terminó:

https://www.atlassian.com/blog/news/2010/04/oh_man_what_a_day_an_update_on_our_security_breach

Tanto para las prioridades de enlace permanente para las megacorporaciones que ven los incidentes de seguridad como oportunidades de avance de relaciones públicas.

Para el registro, SHA-\* es un *algoritmo hash*, no un *algoritmo de cifrado*, y mucho menos un **algoritmo hash criptográficamente seguro** (como, por ejemplo, `bcrypt` o `crypt-md5`). No quiere que su proveedor de SaaS le diga que sus contraseñas están *encriptadas* porque un hacker puede obtener la clave de descifrado y leerlas en texto sin formato.

Ciertamente no quieres que te aseguren que están seguros cuando el hacker tiene los hashes SHA-\*, porque SHA-\* está diseñado para ser lo suficientemente eficaz como para someter tus contraseñas a un algoritmo de búsqueda / adivinación de fuerza bruta computacionalmente rastreable contra el propio hash. Usted quiere que su proveedor le diga que sus contraseñas son hash a través de `bcrypt` con al menos 5 rondas en su configuración, diseñadas para derrotar la adivinación de la fuerza bruta y actualizables a las especificaciones de hardware de los tiempos.

Y aun así, deberían recomendarte cambiarlos, porque es lo responsable de hacer.

Es absurdo leer el estruendo de Mike Cannon-Brooke enviado a los clientes sobre la seguridad de sus hash SHA-\* de contraseñas de clientes robadas por los piratas informáticos si puede molestarse en comprender los puntos de bala de la postmortem de Apache sobre seguridad de contraseñas.

Además, cada día que su Equipo de Respuesta a Incidentes dormía durante el fin de semana, otra organización de F/OSS fue hackeada por esa caja SliceHost. Informamos a su equipo el viernes de nuestros hallazgos después del horario laboral en Sydney, y en lugar de decirle a sus clientes que leen correos electrónicos de seguridad fuera de horas y, por lo tanto, no fueron hackeados el domingo por la hora del PST, fibbed y dijeron que descubrieron el hackeo ellos mismos. &mdash; atrapado completamente desprevenido.

RedHat, CodeHaus y JBoss fueron tres de las víctimas incidentales hackeadas mientras el equipo de Atlassian IR dormía, pero había varias otras.

<!-- $Date$ $Author$ $Revision$ -->
