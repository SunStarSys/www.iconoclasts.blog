---
archived: ~
categories: Perl, Apache, ZFS
dependencies: '*.md.es'
keywords: apache,OpenOffice,cms,wiki
published: ~
status: borrador
title: CMS retrospectivo de apache
---

<div class="right">

![tarrado y emplumado](apache-considered-harmful.page/feather2).

</div>

El [CMS de apache](https://web.archive.org/web/20120112045033/http://www.apache.org/dev/cms) &mdash; inventado en octubre de 2010 por miembros selectos de The Apache Infrastructure Team ([Paul Querna (VP)](https://paul.querna.org/articles/2010/10/22/evolution-of-apaches-websites/), Daniel Shahaf, Ph.D. (SVN dev), y yo mismo, [formalmente en desuso en junio de 2015](https://lists.apache.org/thread/zdv943hwmj7r4wms1pr1s4f72kvxd8gb)y finalmente [clausurado en enero de 2022](https://apache.org/dev/cms) &mdash; siempre se adelantó a su tiempo.  En su apogeo, más de 100 proyectos de nivel superior de Apache se basaron en él, pero ninguno más que Apache OpenOffice. Nunca se evidenció su antigua tecnología de rendimiento más claramente que en su funcionalidad de gestión de dependencia de contenido en los primeros años de la donación de Oracle de OpenOffice a Apache en junio de 2011.

Para ser claros: cuando otros hablan de gestión de dependencias, están predominantemente preocupados por las dependencias de software, no [dependencias de contenido](dependencies). {# lede #}Todo se reduce a un contenido bien regulado "incluye" en el sistema templating+build{# lede #}, que no es lo mismo que los deps de software.

Esta característica era absolutamente crítica para apoyar Apache'masiva <https://OpenOffice.org> (OOo) sitio web.  El CMS Sun de RDBMS proporcionado originalmente a OOo caería y moriría incluso si solo quisiera corregir un error tipográfico. Por el contrario, The Apache CMS se ejecutó en una cárcel de FreeBSD en baldr.apache.org: un aprovisionamiento moderado, [Caja Dell 1950 que funcionaba con 8 CPU y 24 GB de RAM con un par de discos duros reflejados de 96 GB](https://web.archive.org/web/20120112034217/http://www.apache.org/dev/machines.html#:~:text=baldr) a través de varias cárceles, y voló a través del flujo de trabajo con relativa facilidad.

Sin un poco de pegado CMS como servicio que puede hacer que un contribuyente en una sesión de edición para la página que quieren reparar en un solo clic, la energía cognitiva es demasiado grande para solucionar un error tipográfico en una página web hoy:

1. ve a pescar esa página de un repositorio de github,
2. bifurcar el repositorio,
3. editar la página,
4. comprometer el cambio,
5. empujarlo,
6. crear un PR,
7. **espere** hasta que un confirmador apruebe y fusione el PR,
8. [**espera** de 10 a 15 minutos para que finalice la creación de la ubicación temporal](https://ci-builds.apache.org/job/OpenOffice/job/OpenOffice-org-Staging-Site-Build/) mientras se muele a través de todos los 40K+ de activos construibles (~4 GB de tamaño total),
9. **espere** a que un confirmador encuentre y revise el contenido modificado publicado en algún lugar de la página de referencia [ubicación temporal](https://www.staging.openoffice.org/),
10. **espere** para que ese confirmador promocione el **sitio completo** a producción,
11. [**espere** otros 5-10 minutos para que finalice la creación de la publicación](https://ci-builds.apache.org/job/OpenOffice/job/OpenOffice-org-Publish-Site/),
12. **espere** para que gitpubsub envíe el nuevo contenido a Apache'servidores web perimetrales.

Con el CMS de Apache (webgui), compartir una tabla de confirmación "parche/diferenciador" por correo electrónico fue una operación de un solo clic para cualquier persona en la Tierra, así como una operación de un solo clic para confirmar + construir + publicar para que un confirmador aplique en el proyecto. Todo giraba en torno al intercambio de URL de capacidad en el contexto de un editor de Markdown en vivo con vistas previas instantáneas de HTML de doble panel. Permitieron que un confirmador de Apache en el proyecto "clonar" el sistema de archivos zfs alojado en baldr-jail de un contribuyente's (sin confirmar) finalización de compra; y posteriormente inspeccionar, modificar y confirmar esa finalización de compra clonada por el propio confirmador de Apache **como confirmador y no como contribuyente**.  Una vez que se produce la confirmación, el CMS no solo la creó en *segundos* (ya que'sólo está creando los archivos modificados y sus pocos archivos dependientes), pero también proporcionó **enlaces** a la creación y a la presentación en directo del contenido en el sitio temporal para su revisión antes de la promoción a producción.

Toda la patente **One-Click** Amazon fue fundamental para la satisfacción del cliente.  Lo mismo aquí; pero el CMS de Apache estaba solo en este espacio.

El CMS de Apache (webgui) fue esa centralita de coordinación esencial entre toda esa energía voluntaria que tristemente ha dejado atrás a la organización.

Hay varias excusas Apache's Liderazgo en Infraestructura sobre por qué se abandonó:

1. un factor de bus de 1 m),

2. eliminación gradual FreeBSD ([OpenZFS](https://openzfs.org/wiki/Main_Page) se ejecuta en Ubuntu),

3. [mod_perl](https://perl.apache.org/)no python, pero aparentemente [mod_lua](https://lists.apache.org/) es kosher),

4. buggy (clones de zfs no fiables de una pequeña cárcel FreeBSD),

5. feo (gracias, rico!),

5. git es mejor (gracias Greg!).

Pero el verdadero motivo era *spite*.  Entre el momento en que quedó en desuso en marzo de 2015 y el momento en que finalmente fue clausurado en enero de 2022, había estado funcionando en piloto automático en una cárcel de FreeBSD en baldr.apache.org durante casi 7 años. El único mantenimiento requerido fue (¿trimestral?) los reinicios del host debido al punto 4 anterior y las renovaciones anuales de certificados SSL. Que's IT.

Cuando se produjo un empuje a finales de 2021, ofrecí a Dave Fisher para alojar el sitio web OpenOffice en Orion con un fuerte descuento. Al principio, Dave solicitó a la junta y **aprobaron el gasto**. Dave ofreció a la ASF que renunciara a la tarifa de hallazgo que acepté pagarle y me dijo que pusiera ese dinero para los costos de alojamiento.

Lo que sucedió después fue verdaderamente notable: el Equipo de Infraestructura de Apache, inmediata y persistentemente en un lapso de semanas, puso a Dave en la posición poco envidiable de declarar sus ahora lealtades exclusivas, según ellos: para mí y por extensión el proyecto.'s **comunidad de voluntarios** o a **la ASF**.

Dave fue el innovador y colaborador clave detrás de los éxitos de escalabilidad de The Apache CMS'tecnología de compilación incremental.  Él no'inventar las soluciones; pero trabajó productivamente conmigo en cómo agregué las características de escalabilidad que necesitaba para garantizar compilaciones de alto rendimiento de The Apache CMS como se aplicaba al sitio web OpenOffice, que en ese momento estaba entregando al norte de 25M solicitudes al día! Juntos descubrimos una profunda aplicación de [SSI](https://en.wikipedia.org/wiki/Server_Side_Includes) en sus esfuerzos, que creo que todavía se llevan a cabo en el sistema de plantillas JBake en uso hoy.

Desafortunadamente, si miras la edición de contenido en curso con OpenOffice's sitio web en GitHub últimamente, se puede ver claramente un descenso masivo en la actividad cuando el Equipo de Infraestructura de Apache obligó a Dave a moverlos fuera del CMS de Apache, y como resultado canalizó toda la actividad de contribución a través de GitHub solo.

No'No culpo a Dave por la fea elección que se vio obligado a hacer, ni por el resultado predeterminado, pero obviamente ya no estamos hablando de términos desde ese día.

Lo que es impactante de todo el asunto fue la absoluta beligerancia del Equipo de Infraestructura de Apache sobre todo el esfuerzo.  Personalmente tomé la mano de cada proyecto que incorporamos al CMS de Apache; ver toda la buena voluntad que creó **quemada hasta el suelo por decreto autocrático** fue simplemente insondable para mí como miembro de larga data de la organización.

Todo lo que hicieron fue dar a los proyectos de Apache varados ultimátums insensibles, y nunca una sola hora de esfuerzo dedicado a desvincularlos personalmente a **cualquier otra cosa**. No era diferente con OOo; simplemente abusaron, golpearon y obligaron a Dave a hacer su oferta.  Y así lo hizo.

Renuncié en 2018. No se pudo'seguir presenciándolo.  Lo que hice en 2020 fue construir [Orión](https://sunstarsys.com/orion) de las cenizas.  Pero incluso esa vía fue ejecutada para los proyectos de Apache por el Equipo de Infraestructura de Apache.

Todo para *spite*.

Triste.

<!-- $Date$ $Author$ $Revision$ -->
