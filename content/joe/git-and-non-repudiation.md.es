---
archived: ~
categories: Control de versiones, Apache
dependencies: '*.md.es'
keywords: seguridad,no repudio,DVCS,control de versiones,icla
published: ~
status: archivado
title: Git y no repudio
---

Este ensayo realmente pertenece a DVCS en general, no solo a git per se.  Pero vamos a centrar la atención en git porque sigue siendo el DVCS más popular en la actualidad.

[No repudio](http://en.wikipedia.org/wiki/Non-repudiation).

Con una herramienta de control de versiones centralizada tradicional, estos registros están fácilmente disponibles en el historial de confirmaciones.  Cada confirmación en el sistema pasa por un mecanismo de autorización para garantizar que la persona que realizó el cambio esté autorizada para cargarlo.  Estos registros son vitales para la empresa para garantizar que se conserven registros precisos que indiquen quién es responsable de cargar cada línea de código en el software en cuestión.

Con git, o control de versiones distribuido en general, {# lede #}hay una clara distinción entre la historia del "compromiso" y la historia de la "carga"{# lede #} &mdash; que me referiré aquí como "push records". Las confirmaciones en git no se autentican porque se producen localmente, con metadatos locales no verificados agregados al historial.  Paso de carga, alias `git push`

Con [La Fundación de Software Apache](https://www.apache.org/).

¿Por qué es importante?  Bueno, para empezar, permítanme abordar un concepto erróneo común sobre la necesidad de acuerdos de licencia de colaborador (ICLAs) para los confirmadores de Apache.  Muchas personas no parecen entender que en lo que respecta a las obras individuales de autoría de un autor, no hay diferencia entre el idioma aplicable en el [ICLA](http://www.apache.org/licenses/icla.txt) y el [Licencia Apache 2.0](http://www.apache.org/licenses/license-2.0).

Lo que los registros push proporcionan entonces es una forma de rastrear, a cada línea de código en una versión, el confirmador individual responsable de transferir ese código al repositorio de git de ASF. Esto es de vital importancia para determinar la procedencia de una contribución de terceros con git, porque lamentablemente es posible que un contribuyente de este tipo "se aleje" de su contribución a un proyecto git debido a la naturaleza distribuida de los registros de compromiso de DVCS.  La parte responsable entonces, de acuerdo con el ICLA, se convierte en el promotor que empujó el código.

Las estrategias de mitigación tempranas y adecuadas giran en torno a la eliminación de la contribución abandonada, pero es posible que el daño al proyecto ya se haya hecho.  Y sin los registros push, literalmente no tendríamos ningún proceso autorizado para determinar cómo ese código entró realmente en nuestro repositorio, aparte de rastrear registros alternativos en rastreadores de problemas o comunicaciones en la lista.  Confiar solo en los registros de confirmación de fusión para determinar la procedencia no es muy satisfactorio desde el punto de vista de la seguridad, porque requiere una adhesión rígida a un tipo particular de flujo de trabajo, que no queremos dictar.

Sin tales cosas tendríamos que exigir al menos la firma de PGP del compromiso de cada contribuyente, lo que es oneroso para muchos proyectos.  Los registros push proporcionan un proceso transparente que no afecta al flujo de trabajo de un proyecto, excepto para garantizar que el repositorio de Git de ASF sea el verdadero repositorio maestro.

*$Fecha: 2023-01-19 22:58:40 +0000 (Jue, 19 de enero de 2023) $*
