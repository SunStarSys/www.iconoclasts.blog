---
archived: ~
categories: Orión, Arquitectura
dependencies: '*.md.es'
keywords: arquitectura,incremental,sitio web,generación,edificios,dependencias,topología,wiki,gráfico,inteligente
published: ~
status: verificado=22163
title: ¿De qué se trata <em>Smart Content Dependency ManagementTM</em>?
---

[TOC]

## Resumen

*Gestión de dependencias de contenido inteligente&trade;* trata sobre el círculo de ideas relacionadas con el apoyo y la facilitación de *construcciones incrementales*, al tiempo que se mantiene fiel al **Principio de Normalización del Contenido** &mdash; que [*permalinks*]

En este artículo se presenta el sitio web de <https://sunstarsys.com/> como un caso práctico para una <a href="#commentAB" class="border border-warning text-muted reference-link" id="commentAB-link" title="{{commentAB.headers.title}}">demostración</a> de mejores prácticas y análisis de las topologías de gráficos asociadas.

No de grutas

Esto solo importa cuando necesita sopesar el costo de realizar compilaciones completas del sitio cada vez que necesita ajustar el contenido en una página web. Si su sitio web tiene menos de 1K archivos de origen, **relaje** y lea lo siguiente con atención a sus necesidades futuras. Usted eligió utilizar nuestra plataforma, que está diseñada para escalar con usted, no en su contra. Para la mayoría de las páginas, este material a continuación trata sobre *gráficos de dependencia de contenido dispersos* para sitios con más de 1K páginas.

Por ejemplo, el sitio web de Apache <https://www.OpenOffice.Org> pudo crear sus archivos 40K+ utilizando la versión original de Apache de este sistema de compilación, con soporte totalmente integrado para compilaciones incrementales. &mdash; sin ninguna dependencia configurada &mdash;

Por defecto, nuestro sistema de compilación creará solo los archivos que ha cambiado, sin preocuparse por las dependencias dentro del archivo (a menos que los especifique en `%path::dependencias` &mdash; más sobre esto abajo). Si el archivo que ha cambiado está en el `plantillas/` o `lib/`

## Tejiendo el *gráfico de dependencia* de su sitio web

Matemáticamente, una *Topología* `$$\tau$$` es una especificación completa de los subconjuntos *open* de un espacio `$$X$$`, cuyo objetivo es indicar las relaciones de proximidad entre *puntos* `$$x$$` del espacio `$$X$$`. Cuándo `$$X$$` es un gráfico, una *topología* `$$\tau$$` para `$$X$$` equivale a especificar los bordes que conectan los vértices del gráfico juntos (aquí los vértices se ven como los *puntos* de `$$X$$`, y los bordes de conexión determinan los vecindarios de esos puntos como *conjuntos abiertos básicos* para la topología).  Una *topología de gráfico dirigida* es esencialmente la misma cosa, pero incorpora una referencia a una incrustación topológica de `$$(X,\tau)$$` en un espacio topológico más amplio `$$(Y,\sigma)$$`

Este último concepto es lo que utilizaremos al discutir la topología del *gráfico de dependencia* `$$\tau$$` asociado al espacio `$$X$$` de archivos de origen debajo del sitio `contenido/` subdirectorio (aquí `$$(Y,\sigma)$$` es `$$\mathbb{R}^n$$` con su topología métrica para `$$n \in \{2,3\}$$`y los bordes de `$$X$$` son curvas no intersectoriales, dirigidas Jordan que conectan un archivo `$$x \in X$$` a su conjunto de archivos sobre los que `$$x$$` depende: `$$\set{x^\prime \in X | x \rightarrow x^\prime}$$`

Que tiene {# lede #}una comprensión clara del *gráfico de dependencia* de su sitio web garantizará que pueda maximizar el rendimiento de nuestra tecnología de construcción a escala{# lede #}. Tomamos la información que nos proporciona `%path::dependencias` durante la carga de construcción de su sitio web `lib/path.pm` archivo, construir un mapa inverso de archivos dependientes y utilizar *ese mapa inverso* para determinar el corpus completo de archivos que se van a crear para un determinado archivo `confirmación svn`

Es importante tener en cuenta que las relaciones de dependencia entre los archivos de origen pueden y deben ser capturadas completamente por el `%path::dependencias` hash durante la carga de inicio del sistema de compilación de `lib/path.pm` de su árbol de origen, que es cómo las vistas incorporadas contenidas en nuestro `SunStarSys::Ver` El paquete de Perl está destinado a funcionar. El `walk_content_tree`, `archivado`, y `seed_file_deps` funciones de utilidad importables de `SunStarSys::Util` son útiles para construir el `%path::dependencias`

Esta es la parte de nuestra vida [`lib/path.pm`]({{snippetA.pretty_uri}}).

[snippet:lang=perl:repo=SunStarSys/www:branch=trunk:path=lib/path.pm:token=#snippet]

Por favor, analice ese código para obtener ideas sobre cómo desea que *su sitio web* funcione. Sí, hay cierta complejidad razonable (que implica tanto las expresiones regulares de Perl como el shell C de UNIX de Perl) `global` interfaces, de una manera muy precisa) sobre cómo `%path::dependencias`

¿Dónde están las entradas en `%path::dependencias` originar? Si no nacen de una invocación de `walk_content_tree { seed_file_deps ... }`, (que básicamente se sumerge en las cabeceras y el contenido de los archivos de origen de Markdown), luego simplemente se codifican en `lib/path.pm`

### Los gráficos de dependencias cíclicas son la norma

Nuestro sitio consiste actualmente en `240 archivos de origen` en `contenido/`. Aquí hay un `85 vértices x 465 bordes`, representación de gráfico dirigida bidimensional desplazable de una instantánea reciente de las dependencias de página en inglés en **nuestro sitio** ([uso de GraphViz `punto`]

<div id="deps">

  ![Dependencias de idioma inglés]

</div>

Muy complejo, incluso para un pequeño sitio web como este! Muchas intersecciones de borde al tomar `$$n=2$$` (evitable en dimensión `$$n=3$$`). De particular importancia es el conjunto central de dependencias densas y cíclicas en los archivos no archivados de nuestro sitio. `/ensayos/` directorio, hacia el centro inferior derecho del gráfico, que es lo que un buen gráfico de dependencia de un sitio de blogs debe ser. Estas dependencias se dibujan en `curvas rojas`

Tenga en cuenta también la interconexión interna, esencialmente aislada de los elementos en `/categorías/*/*` y `/archives/2022/11/*`. Las únicas dependencias externas implican contenido no archivado en `/ensayos/*`. Esto es por diseño &mdash; los ensayos archivados solo deben cambiar *adiabáticamente*, tal vez únicamente para ajustar sus `Categoría` encabezados. Ninguno de esos cambios afecta materialmente al contenido preexistente, por lo que no lo rastreamos. `%path::dependencias`

Por supuesto, nuestro [Wiki de Orion Enterprise]

### ¿No se trata solo de hipervínculos?

**¡No!** De hecho, la *topología de enlace* de su sitio web es un asunto totalmente independiente del *gráfico de dependencia* del árbol de origen.  Un motor de búsqueda extraerá naturalmente la *topología de enlace*, pero no tiene idea del *gráfico de dependencia*.

Aquí hay un `Más de 240 vértices x 3859 bordes`, gráfico actual del gráfico *link topology* en inglés para **nuestro sitio** ([uso de GraphViz `twopi`]

<div id="links">

  ![Enlaces de idioma inglés]

</div>

¿Puedes ver el `bordes rojos`

### Cómo puede ayudar la tecnología SSI

#### Traditional [Incluye del lado del servidor]

- **gran** para depurar el *gráfico de dependencia* de su sitio web hasta un tamaño manejable sin sacrificar la latencia de entrega de la página
- **genial** para reducir la rotación de texto fijo en mensajes de confirmación grandes para mejorar la revisión por colegas y la supervisión de los juegos de cambios creados


#### API de plantilla

##### etiqueta ssi

Sintaxis:

&#123;% `ssi` &#96;/content_rooted/path/to/source_file&#96; %&#125;

- rutas enraizadas en `contenido` directorio de origen
- omite la parte de cabecera del archivo de origen que se va a `ssi` incluido


##### filtro ssi

Sintaxis:

&#123;&#123; contenido|ssi &#125;&#125;

- evalúa recursivamente `ssi` etiquetas en el valor que se va a filtrar
- útil para evitar el uso de un gran valor (3+) de `quick_deps` en un `@path::patrones`

#### ¿Por qué no SymLinks?

- abstracción del sistema de archivos barebones que es difícil de soportar de forma segura en un `<virtualhost>` contexto
- las mismas desventajas con los tradicionales `ssi` en páginas web completas
- nuestro [Wiki de Orion Enterprise]

#### Herramientas de creación para enlaces permanentes

##### Documentación de curación

El sistema de compilación de Orion tiene soporte integrado para lo que llamamos *Document Curation*, que es el proceso de recontextualización y reorganización de su contenido en función de cómo establezca el `Categorías` y `Archivo` encabezados de los archivos de origen de Markdown. Estas funciones están desactivadas de forma predeterminada, pero se pueden activar mediante la configuración de un `category_root` (para soporte de categoría) o `archive_root` (para soporte de archivado) en el argumento hashref asociado al `@path::patrones`

##### categorías

- el nuevo contenido se construye usando la plantilla `ssi` etiquetas que apuntan hacia atrás a la ubicación del enlace permanente, al eliminar la `Archivo` cabecera de la página de origen construida
- las categorías son estrictamente aditivas (es decir, eliminar una categoría de los encabezados de una página de origen no la eliminará de esa categoría en el sitio activo),
- generado bajo demanda


##### páginas archivadas

En nuestro sitio, archivamos agresivamente ensayos obsoletos para mantener bajos los tiempos de construcción de nuevos ensayos, sin destruir los enlaces permanentes a documentos archivados. El gráfico *dependencia* relativo al `/archivos/`

- contenido construido usando la plantilla `ssi` etiquetas que apuntan hacia atrás a la ubicación del enlace permanente, al eliminar la `Categorías` y `Archivo` encabezados de la página de origen construida
- contenido en `/(ensayos|clientes)/` siempre son enlaces permanentes, incluso después del archivado


##### LED

Comentarios HTML incrustados en los límites del formulario de prosa de Markdown del contenido del lede. Usamos **&#123;No de led&#125;

El procesamiento de ledes se realiza con el `LED` Filtro de plantilla. Es útil combinar esto con el `ssi`

## Conclusiones

Hay estructuras y relaciones de datos interesantes por descubrir cuando se trata del *gráfico de dependencia* de un sitio web desde una perspectiva de rendimiento de construcción, que es un área de interés mucho más reciente que la literatura de investigación que profundiza en las estructuras de datos y las emisiones asociadas relacionadas con la *topología de enlace*<sup>1,2</sup>.

Las compilaciones incrementales convencionales para proyectos de desarrollo de software puro siguen siendo un tema candente. La investigación cubierta en <sup>3,4</sup> se publicó en octubre de 2022, aproximadamente un mes antes de que se espere que este ensayo esté completo. El sistema de compilación *pluto*<sup>5</sup> tiene características muy similares a las nuestras (la compilación en sí misma puede regenerar y reconstruir dependencias de forma dinámica).

La buena noticia es que lo tenemos cubierto como nuestro cliente. Le mantendremos informado de las mejores prácticas y el estado de la técnica en este espacio, por lo que se beneficiará de nuestras lecciones aprendidas en la última década y en el futuro.

No de notas al pie

1. [Identificación de clusters en el gráfico web basada en la topología de enlaces]

2. [Inferencia de Comunidades Web desde la Topología de Enlaces](https://dl.acm.org/doi/pdf/10.1145/276627.276652) Actas de la novena conferencia ACM sobre hipertexto e hipermedia: enlaces, objetos, tiempo y espacio &mdash; estructura en sistemas hipermedia: enlaces, objetos, tiempo y espacio &mdash;

3. [Sobre los beneficios y límites de las configuraciones incrementales de software de construcción: un estudio exploratorio]

4. [Hacia la creación incremental de configuraciones de software]

5. [Un sistema de creación incremental sólido y óptimo con dependencias dinámicas]

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
