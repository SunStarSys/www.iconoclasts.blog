---
categories: Orión, Arquitectura
dependencies: '*.md.es'
keywords: arquitectura,incremental,sitio web,generación,construcciones,dependencias,topología,wiki,gráfico
status: documento técnico
title: ¿De qué se trata <em>Smart Content Dependency Management™</em>?
---

<div class="right">

![árbol](https://www.sunstarsys.com/orion/index.page/lightning)

</div>

[TOC]

-----
## Resumen

*Gestión de dependencias de contenido inteligente&trade;* trata sobre el círculo de ideas relacionadas con la prestación de apoyo y facilitación para *construcciones incrementales*, al tiempo que se mantiene fiel al **Principio de normalización de contenido** &mdash; que [*permalinks*](https://en.wikipedia.org/wiki/Permalink) debe ser la única fuente de datos, sin importar cómo se cure su contenido en todo el árbol de origen y los artefactos de compilación resultantes.

Este artículo presenta la <https://sunstarsys.com/> sitio web como un estudio de caso para una demostración de las mejores prácticas y análisis de las topologías de gráficos asociadas.

-----
## Caveats

Esto solo importa cuando necesitas sopesar el costo de realizar compilaciones completas de sitios cada vez que necesitas ajustar el contenido en una página web. Si su sitio web tiene menos de 1K archivos de origen, **relaje** y lea lo siguiente con vistas a sus necesidades futuras. Usted eligió usar nuestra plataforma, que está diseñada para escalar con usted, no en su contra. Para la mayoría de las páginas, este material a continuación trata sobre *gráficos de dependencia de contenido dispersos* para sitios con más de 1K páginas.

Por ejemplo, el Apache <https://www.OpenOffice.Org> sitio web fue capaz de construir sus archivos 40K+ utilizando la versión original de Apache de este sistema de compilación, con soporte totalmente integrado para las compilaciones incrementales &mdash; sin ninguna dependencia configurada &mdash; Haciendo un uso inteligente de la tecnología tradicional SSI solo.

Por defecto, nuestro sistema de compilación solo creará los archivos que ha cambiado, sin preocuparse por las dependencias entre archivos (a menos que los especifique en `%path::dependencias` &mdash; más abajo). Si el archivo que ha cambiado está en la `plantillas/` o `lib/` directorio, se disparará una compilación de sitio completa en su lugar.

-----
## Tejiendo el *gráfico de dependencia* de su sitio web

Matemáticamente, una *Topología* `$$\tau$$` es una especificación completa de los subconjuntos *abiertos* de un espacio `$$X$$`, cuyo objetivo es indicar las relaciones de proximidad entre *puntos* `$$x$$` del espacio `$$X$$`. Cuándo `$$X$$` es un gráfico, una *topología* `$$\tau$$` para `$$X$$` equivale a especificar los bordes que conectan los vértices del gráfico juntos (aquí los vértices se ven como los *puntos* de `$$X$$`, y los bordes de conexión determinan los barrios de esos puntos como *conjuntos abiertos básicos* para la topología).  Una topología de gráficos dirigida es esencialmente lo mismo, pero incorpora una referencia a una incrustación topológica de `$$(X,\tau)$$` en un espacio topológico más amplio `$$(Y,\sigma)$$` , donde las conexiones de borde de la incrustación están representadas por curvas direccionales, sin intersección (Jordania).

Este último concepto es lo que utilizaremos al discutir la topología del *gráfico de dependencia* `$$\tau$$` asociado al espacio `$$X$$` de archivos fuente debajo del sitio `contenido/` subdirectorio (aquí `$$(Y,\sigma)$$` es `$$\mathbb{R}^n$$` con su topología métrica para `$$n \in \{2,3\}$$`y los bordes de `$$X$$` No son intersecciones, curvas dirigidas Jordan que conectan un archivo `$$x \in X$$` a su conjunto de ficheros sobre los que `$$x$$` depende de: `$$\set{x^\prime \in X | x \rightarrow x^\prime}$$`).

Que tiene {# lede #}una comprensión clara del *gráfico de dependencia* de su sitio web garantizará que pueda maximizar el rendimiento de nuestra tecnología de creación a escala{# lede #}. Tomamos la información que usted proporciona a `%path::dependencias` durante la carga de creación de su sitio web `lib/path.pm` archivo, construir un mapa inverso de archivos dependientes y utilizar *ese mapa inverso* para determinar el corpus completo de archivos que se van a crear para cualquier `confirmación svn` a nuestro sistema.

Es importante tener en cuenta que las relaciones de dependencia entre los archivos de origen pueden y deben ser capturadas por completo por la `%path::dependencias` hash durante la carga de inicio del sistema de compilación de `lib/path.pm` de su árbol de origen, que es cómo las vistas incorporadas contenidas en nuestro `SunStarSys::Ver` El paquete Perl está destinado a funcionar. El `walk_content_tree`, `archivado`y `seed_file_deps` funciones de utilidad importables de `SunStarSys::Util` son útiles para construir el `%path::dependencias` hash, con soporte integrado para gestionar una caché de dependencias para acelerar las compilaciones incrementales a escala.

Esta es la parte de nuestra vida [`lib/path.pm`]({{snippetA.pretty_uri}}):

[snippet:lang=perl:repo=SunStarSys/www.iconoclasts.blog:branch=trunk:path=lib/path.pm:token=#snippet]

Por favor, revisa ese código para obtener ideas sobre cómo quieres que funcione tu sitio web. Sí, hay cierta complejidad razonable (que involucra tanto las expresiones regulares de Perl como la cáscara UNIX de Perl) `glob` interfaces, de forma muy precisa) sobre cómo `%path::dependencias` se construye en ese archivo, pero en lugar de simplemente ver esto como un trabajo de optimización, en su lugar, mirarlo como proporcionar los ingredientes básicos necesarios para construir los principales aspectos de la topología *link *de una manera automatizada y generada dinámicamente.

Dónde están las entradas en `%path::dependencias` ¿Origen? Si no nace de una invocación de `walk_content_tree { seed_file_deps ... }`, (que básicamente se sumerge en los encabezados y el contenido de los archivos de origen de Markdown), entonces solo están codificados en `lib/facts.yml` en tiempo de carga.

### Los gráficos de dependencias cíclicas son la norma

Nuestro sitio actualmente consiste en `240 archivos de origen` en `contenido/`. Este es un `85 vértices x 465 bordes`, representación de gráfico dirigida bidimensional desplazable de una instantánea reciente de las dependencias de la página en inglés en **nuestro sitio** ([uso de GraphViz `punto`](https://github.com/SunStarSys/orion/blob/master/deps2dotcfg.pl)):

<div id="deps">

![Dependencias del idioma inglés](../images/deps)

</div>

Muy complejo, incluso para un sitio web pequeño como este! Muchas intersecciones de borde al tomar `$$n=2$$` (evitable en dimensión `$$n=3$$`). De particular importancia es el conjunto principal de dependencias cíclicas densas en los archivos no archivados en nuestro sitio. `/ensayos/` directorio, hacia la parte inferior-centro-derecha del gráfico, que es lo que debe ser el gráfico de dependencia de un buen sitio de blogs. Estas dependencias se trazan en `curvas rojas` en la imagen.

Observe también la interconexión interna, esencialmente aislada de los elementos en `/categorías/*/*` y `/archives/2022/11/*`. Las únicas dependencias externas implican contenido no archivado en `/ensayos/*`. Esto es por diseño &mdash; los ensayos archivados solo deben cambiar *adiabéticamente*, tal vez solo para ajustes en sus `Categoría` encabezados. Ninguno de esos cambios afecta materialmente el contenido preexistente, por lo que no lo rastreamos. `%path::dependencias`.

Por supuesto, nuestro [Orion Enterprise Wiki](https://sunstarsys.com/orion/) Nunca ha tenido problemas para lidiar con las dependencias cíclicas.

### ¿No se trata sólo de hipervínculos?

**¡No!** De hecho, la *topología de enlace* de su sitio web es un asunto completamente separado del *gráfico de dependencia* del árbol de origen.  Un motor de búsqueda buscará naturalmente la topología *link*, pero no tiene información sobre el gráfico *dependent*.

Esta es una `Más de 240 vértices x 3859 bordes`, gráfico actual de ojos de pájaro del gráfico en inglés *link topology* para **nuestro sitio** ([uso de GraphViz `twopi`](https://github.com/SunStarSys/orion/blob/master/links2dotcfg.pl)):

<div id="links">

![Enlaces de idioma inglés](../images/links)

</div>

¿Puedes detectar `bordes rojos` como se especifica en el *gráfico de dependencia*? El gráfico de *topología de enlace* es cualitativa y cuantitativamente **muy diferente** del gráfico de *dependencia* (dramáticamente más pequeño y menos interconectado) que se muestra anteriormente.

### Cómo puede ayudar la tecnología SSI

#### Tradicional [Incluye el lado del servidor](https://httpd.apache.org/docs/2.4/howto/ssi.html) (SSI)

- **Excelente** para depurar el *gráfico de dependencia* de su sitio web hasta un tamaño manejable sin sacrificar la latencia de entrega de la página
- **Excelente** para reducir la rotación de texto fijo en grandes mensajes de confirmación para una mejor revisión por pares y supervisión de los juegos de cambios creados
- **lusura** para recontexualizar páginas web completas en una ubicación diferente en la jerarquía de la raíz de documentos

#### API de plantilla

##### etiqueta ssi

Syntax:

&#123;% `ssi` &#96;/content_rooted/path/to/source_file&#96; %&#125;

- rutas enraizadas en `contenido` directorio de origen
: omite la parte de cabecera del archivo de origen que se va a `ssi` incluido
- reescribe las URL relativas a las URL absolutas en el contenido incluido de la ruta de destino

##### filtro ssi

Syntax:

&#123;&#123; contenido|ssi &#125;&#125;

- evaluaciones recursivas `ssi` etiquetas en el valor que se va a filtrar
- útil para evitar el uso de un gran valor (3+) de `quick_deps` en un `@path::patrones` hashref de argumento de entrada, que puede afectar al rendimiento

#### ¿Por qué no SymLinks?

- Abstracción del sistema de archivos barebones que es difícil de soportar de forma segura en un `<VirtualHost>` contexto
- las mismas desventajas con las tradicionales `ssi` en páginas web completas
- nuestro [Orion Enterprise Wiki](https://sunstarsys.com/orion/) sistema no los apoya

#### Herramientas de creación para enlaces permanentes

##### Curación de documentos

El sistema de compilación de Orion tiene soporte integrado para lo que llamamos *Curación de documentos*, que es el proceso de recontextualización y reorganización de su contenido en función de cómo establezca el `Categorías` y `Estado` encabezados en los archivos de origen de Markdown. Estas funciones están desactivadas por defecto, pero se pueden activar mediante la configuración de una `category_root` (para soporte de categoría) o `archive_root` (para el soporte de archivado) en el argumento hashref asociado al `@path::patrones` entrada.

##### Categorías

- el nuevo contenido se crea con la plantilla `ssi` etiquetas que apuntan a la ubicación de enlace permanente,
- las categorías son estrictamente aditivas (es decir, eliminar una categoría de los encabezados de una página de origen no la eliminará de esa categoría en el sitio activo),
- generados bajo demanda,
- eliminar todas las categorías en una sola confirmación es una gran manera de sincronizarlas con las especificaciones exactas en todos los encabezados de las páginas de origen, sin destruir el contenido de la categoría conservado en el sitio en vivo.

##### Páginas archivadas

En nuestro sitio, archivamos agresivamente ensayos anticuados para mantener bajos los tiempos de construcción de nuevos ensayos, sin destruir los enlaces permanentes a los documentos archivados. El *gráfico de dependencia* con respecto al `/archivos/` directorio (para nuestro sitio) es razonablemente autónomo según las siguientes reglas:

- contenido construido usando Plantilla `ssi` etiquetas que apuntan hacia la ubicación de enlace permanente, mientras se quita el `Categorías` encabezado de la página de origen construida
- contenido en `/(ensayos|clientes)/` siempre son enlaces permanentes, incluso después de archivar
- el archivado elimina eficazmente la ubicación de enlace permanente del gráfico de dependencia*, sin eliminar el enlace permanente en sí mismo del sitio web

##### Lede

Comentarios HTML incrustados en los límites del formulario de prosa de Markdown del contenido de la hoja. Utilizamos **&#123;Nº de permiso&#125;** para este fin.

El procesamiento de las hojas se realiza con la `lede` Filtro de plantilla. Es útil combinar esto con la `ssi` filtro para indexar un archivo de categoría con más de una página de categoría dentro de él.

-----
## Conclusiones

Hay estructuras y relaciones de datos interesantes que aún no se han descubierto al tratar con el *gráfico de dependencia* de un sitio web desde una perspectiva de rendimiento de construcción, que es un área de interés mucho más nueva que la literatura de investigación que profundiza en las estructuras de datos y las emisiones asociadas que rodean la *topología de enlace *<sup>1,2</sup>.

Las compilaciones incrementales convencionales para proyectos de desarrollo de software puro siguen siendo un tema candente. La investigación cubierta en <sup>3,4</sup> publicado en octubre de 2022, aproximadamente un mes antes de que se espere que este ensayo se complete. El *pluto*<sup>5</sup> El sistema de construcción tiene características bastante similares a las nuestras (la construcción en sí puede regenerar y reconstruir dinámicamente dependencias).

La buena noticia es que lo tenemos cubierto como nuestro cliente. Le mantendremos informado de las mejores prácticas y el estado del arte en este espacio, por lo que se beneficiará de nuestras lecciones aprendidas durante la última década y hasta mañana.

-----
## Notas al pie

1. [Identificación de clusters en el gráfico web basado en la topología de enlaces](https://ieeexplore.ieee.org/abstract/document/1214919) Séptimo Simposio Internacional de Ingeniería y Aplicaciones de Bases de Datos, 2003. Procedimientos.

2. [Inferencia de Comunidades Web desde Topología de Enlace](https://dl.acm.org/doi/pdf/10.1145/276627.276652) Actas de la novena conferencia ACM sobre hipertexto e hipermedia: enlaces, objetos, tiempo y espacio &mdash; estructura en los sistemas hipermedia: enlaces, objetos, tiempo y espacio &mdash; estructura en los sistemas hipermedia. 1998.

3. [Sobre los beneficios y límites de las configuraciones incrementales de software de compilación: un estudio exploratorio](https://dl.acm.org/doi/abs/10.1145/3510003.3510190) ICSE '22: Actas de la 44ª Conferencia Internacional sobre Ingeniería de Software, mayo de 2022

4. [Hacia la creación incremental de configuraciones de software](https://dl.acm.org/doi/10.1145/3510455.3512792) ICSE-NIER '22: Actas de la 44ª Conferencia Internacional ACM/IEEE sobre Ingeniería de Software: Nuevas ideas y resultados emergentes, mayo de 2022

5. [Un sistema de creación incremental sólido y óptimo con dependencias dinámicas](https://dl.acm.org/doi/10.1145/2814270.2814316) OOPSLA 2015: Actas de la Conferencia Internacional ACM SIGPLAN 2015 sobre Programación, Sistemas, Idiomas y Aplicaciones Orientadas a Objetos Octubre 2015

<style type="text/css">

#deps {
  width:100%;
  overflow:auto;
  margin-bottom:10px;
  padding-top:0;
  height:1000px;
}

#links {
  width:100%;
  overflow:auto;
  margin-bottom:10px;
  padding-top:0;
  height:1000px;
}

@media only screen and (max-width: 1000px) {
    #links { height: 300px }
}

#links img { width:100% }
</style>

<!-- $Date$ $Author$ $Revision$  $Id$ -->
