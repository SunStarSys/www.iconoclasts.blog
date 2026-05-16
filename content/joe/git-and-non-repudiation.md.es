---
archived: ~
categories: Control de versiones, Apache
dependencies: '*.md.es'
keywords: seguridad,no repudio,DVCS,control de versiones,icla
published: ~
status: archivado
title: Git y no repudio, revisado
---

Este ensayo realmente pertenece a DVCS en general, no solo a git per se.  Pero centraremos la atención en git porque sigue siendo el DVCS más popular en la actualidad.

[No repudio](http://en.wikipedia.org/wiki/Non-repudiation).

Con una herramienta de control de versiones centralizada tradicional, estos registros están disponibles en el historial de confirmaciones.  Cada confirmación en el sistema pasa por un mecanismo de autorización para garantizar que la persona que realizó el cambio esté autorizada a cargarlo.  Esos registros son vitales para la empresa para garantizar que se mantengan registros precisos que indiquen quién es responsable de cargar cada línea de código en el software en cuestión.

Con git, o control de versiones distribuido en general, {# lede #}Hay una clara distinción entre la historia de "compromiso" y la historia de "carga"{# lede #} &mdash; a la que me referiré como "push records". Las confirmaciones en git no se autentican, porque se producen localmente, con metadatos locales no verificados agregados al historial.  El paso de carga, también conocido como `git push`

Con [La Fundación Apache Software](https://www.apache.org/).

¿Por qué es importante?  Bueno, para empezar, permítanme abordar un concepto erróneo común sobre la necesidad de acuerdos de licencia de contribuyente (ICLA) para los emisores de Apache.  Muchas personas no parecen entender que en cuanto a las obras individuales de autoría de un autor, no hay diferencia entre el idioma aplicable en el [ICLA](http://www.apache.org/licenses/icla.txt) y el [Licencia Apache 2.0](http://www.apache.org/licenses/LICENSE-2.0).

Lo que proporcionan los registros push es una forma de rastrear hacia atrás, a cada línea de código en una versión, el confirmador individual responsable de transferir ese código al repositorio git de The ASF. Esto es de vital importancia para determinar la procedencia de una contribución de terceros con git, porque desafortunadamente es posible que un contribuyente de este tipo "se aleje" de su contribución a un proyecto de git debido a la naturaleza distribuida de los registros de compromiso de DVCS.  La parte responsable entonces, según la ICLA, se convierte en el autor que empujó el código.

Las estrategias de mitigación tempranas y adecuadas giran en torno a la eliminación de la contribución abandonada, pero es posible que el daño al proyecto ya se haya hecho.  Y sin los registros push, literalmente no tendríamos ningún proceso autorizado para determinar cómo ese código realmente entró en nuestro repositorio, aparte de rastrear registros alternativos en rastreadores de problemas o comunicaciones en la lista.  Confiar solo en los logs de confirmación de fusión para determinar la procedencia no es muy satisfactorio desde el punto de vista de la seguridad, ya que requiere una adherencia rígida a un tipo particular de flujo de trabajo, que no queremos dictar.

Sin tales cosas tendríamos que mandar al menos la firma PGP del compromiso de cada contribuyente, lo cual es oneroso para muchos proyectos.  Los registros push proporcionan un proceso transparente que no afecta al flujo de trabajo de un proyecto, aparte de garantizar que el repositorio git de ASF sea el verdadero repositorio maestro.

## Actualización de 2025

Git tiene soporte nativo para `SSH-SK-ED25519@openssh.com`

La hinchazón innecesaria y la complejidad de una Infraestructura PGP completa ya no son relevantes para resolver los problemas de no repudio discutidos anteriormente, en toda la organización o a nivel por proyecto. Y la buena integración de GitHub facilita este esfuerzo en su totalidad.

<!-- $Date$ $Author$ $Revision$ -->
