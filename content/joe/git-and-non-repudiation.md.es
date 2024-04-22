---
categories: Control de versiones, Apache
dependencies: '*.md.es'
keywords: Seguridad, sin rechazo, DVCS, control de versiones, ICLA
status: archivado
title: Git y no repudio
---


Este ensayo realmente se refiere a DVCS en general, no solo a Git per se.  Pero vamos a centrar la atención en Git porque sigue siendo el DVCS más popular hasta la fecha.

[No para el lado 1⁄4](http://en.wikipedia.org/wiki/Non-repudiation).

Con una herramienta de control de versiones tradicional y centralizada, estos conjuntos de datos del historial de confirmaciones están fácilmente disponibles.  Cada compromiso con el sistema pasa por un mecanismo de autorización para garantizar que la persona que realizó la modificación esté autorizada para cargar.  Estos conjuntos de datos son fundamentales para que la empresa garantice que se almacenan conjuntos de datos precisos que indiquen quién es responsable de cargar cada línea de código en el software en cuestión.

Con git o control de versiones distribuido en general, {# lede #}Hay una clara diferencia entre la historia de "Commit" y la historia de "Upload".{# lede #}

[La Fundación de Software Apache](https://www.apache.org/).

¿Por qué es importante?  Bueno, en primer lugar, permítanme abordar un malentendido común 1⁄4 sobre la necesidad de contribuyentes a acuerdos de licencia (ICLAs) para Apache Committers.  Muchas personas no parecen entender que, en lo que respecta a las obras individuales de autoría de un autor, no hay diferencia entre el idioma aplicable en la [ICLA](http://www.apache.org/licenses/icla.txt) [Licencia deApache 2.0](http://www.apache.org/licenses/license-2.0).

Lo que los suplementos de datos push ofrecen es la posibilidad de rastrear cada línea de código en una versión, el confirmador individual que es responsable de dafÃ1⁄4r a 1⁄4 transferir este código al repositorio de ASF Git. Esto es crucial para determinar el origen de una contribución de terceros con Git, ya que lamentablemente es posible que dicho contribuyente se retire de su contribución a un proyecto de Git debido a la naturaleza distribuida de los registros de compromiso de DVCS.  De acuerdo con ICLA, la parte responsable se convertirá en el promotor que impulsó el código.

FrÃ1⁄4he y las estrategias de mitigación apropiadas tratan de eliminar la contribución abandonada, pero el daño al proyecto puede haber ocurrido ya.  Y sin los registros push, literalmente no tendríamos un proceso autorizado para determinar cómo ese código entró realmente en nuestro repositorio, excepto a través de registros alternativos en rastreadores de problemas o en la lista de comunicaciones.  Confiar únicamente en los logs de confirmación de fusión para determinar el origen no es muy satisfactorio por razones de seguridad 1⁄4nden, ya que requiere una adhesión rígida a un tipo particular de flujo de trabajo que no queremos dictar.

Sin estas cosas, al menos debemos prescribir la firma PGP del compromiso de cada contribuyente, lo que es oneroso para muchos proyectos.1⁄4r  Las adiciones de datos push proporcionan un proceso transparente que no afecta al flujo de trabajo de un proyecto, excepto para garantizar que el repositorio de Git de ASF sea el repositorio maestro real.

<!-- $Date$ $Author$ $Revision$ -->
