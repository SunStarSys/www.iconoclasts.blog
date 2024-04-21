---
categories: Orión, Arquitectura
dependencies: '*.md.es'
keywords: arquitectura,incremental,sitio web,generación,edificios,dependencias,topología,wiki,gráfico,inteligente
status: verificado=22163
title: ¿De qué se trata <em>Smart Content Dependency ManagementTM</em>?
---

[TOC]

## Resumen

*Smart Content Dependency ManagementTM* trata sobre el círculo de ideas relacionadas con la prestación de apoyo y facilitación para *construcciones incrementales*, al tiempo que se mantiene fiel al **Principio de Normalización de Contenido** - que [*permalinks*](https://en.wikipedia.org/wiki/Permalink).

En este artículo se presenta el sitio web de <https://sunstarsys.com/> como un caso práctico para una <a href="#commentAB" class="border border-warning text-muted reference-link" id="commentAB-link" title="{{commentAB.headers.title}}">demostración</a> de mejores prácticas y análisis de las topologías de gráficos asociadas.

No de grutas

Esto solo importa cuando necesita sopesar el costo de realizar compilaciones completas del sitio cada vez que necesita ajustar el contenido en una página web. Si su sitio web tiene menos de 1K archivos de origen, **relaje** y lea lo siguiente con atención a sus necesidades futuras. Usted eligió utilizar nuestra plataforma, que está diseñada para escalar con usted, no en su contra. Para la mayoría de las páginas, este material a continuación trata sobre *gráficos de dependencia de contenido dispersos* para sitios con más de 1K páginas.

Por ejemplo, el sitio web de Apache <https://www.OpenOffice.Org> pudo crear sus archivos 40K+ utilizando la versión original de Apache de este sistema de compilación, con soporte totalmente integrado para compilaciones incrementales, sin ninguna dependencia configurada, al hacer un uso inteligente de la tecnología SSI tradicional solo.

Por defecto, nuestro sistema de compilación creará solo los archivos que ha cambiado, sin preocuparse por las dependencias dentro del archivo (a menos que los especifique en `%path::dependencies` - más sobre eso a continuación). Si el archivo que ha cambiado está en el directorio `templates/` o `lib/`, se activará una creación de sitio completa.

## Tejiendo el *gráfico de dependencia* de su sitio web

Matemáticamente, una *Topología* `$$\tau$$` es una especificación completa de los subconjuntos *open* de un espacio `$$X$$`, cuyo propósito es indicar las relaciones de proximidad entre *puntos* `$$x$$` del espacio `$$X$$`.  Cuando `$$X$$` es un gráfico, una *topología* `$$\tau$$` para `$$X$$` equivale a especificar los bordes que conectan los vértices del gráfico juntos (aquí los vértices son vistos como los *puntos* de `$$X$$`, y los bordes de conexión determinan los vecindarios de esos puntos como *conjuntos abiertos básicos* para la topología).  Una topología de grafos *dirigida* es esencialmente la misma cosa, pero incorpora una referencia a una incrustación topológica de `$$(X,\tau)$$"en un espacio topológico más grande"$$(Y,\sigma)$$

Este último concepto es lo que utilizaremos al discutir la topología del *gráfico de dependencia* `$$\tau$$` asociado al espacio `$$X$$` de los archivos fuente debajo del subdirectorio `contenido/` de su sitio (aquí `$$(Y,\sigma)$$` es `$$\mathbb{R}^n$$` con su topología métrica para `$$n \in \{2,3\}$$`, y los bordes de `$$X$$` son curvas no intersectoriales, dirigidas de Jordan que conectan un archivo `$$x \in X$$a su conjunto de archivos sobre los que$$x$$` depende: `$$\set{x^\prime \in X | x \rightarrow x^\prime}$$

Que tiene {# lede #}una comprensión clara del *gráfico de dependencia* de su sitio web garantizará que pueda maximizar el rendimiento de nuestra tecnología de construcción a escala{# lede #}.

Es importante tener en cuenta que las relaciones de dependencia entre los archivos de origen pueden y deben ser capturadas por completo por el hash `%path::dependencies` durante la carga de inicio del sistema de compilación de `lib/path.pm` desde su árbol de origen, que es la forma en que las vistas incorporadas contenidas en nuestro paquete `SunStarSys::View` Perl están destinadas a funcionar. Las funciones de utilidad `walk_content_tree`, `archived` y `seed_file_deps` que se pueden importar de `SunStarSys::Util` son ayudas útiles para construir el hash `%path::dependencies`, con soporte incorporado para gestionar una caché de dependencia a fin de acelerar las compilaciones incrementales a escala.

Esta es la parte de nuestro live [`lib/path.pm`]({{snippetA.pretty_uri}}).

[snippet:lang=perl:repo=SunStarSys/www:branch=trunk:path=lib/path.pm:token=#snippet]

Por favor, analice ese código para obtener ideas sobre cómo desea que *su sitio web* funcione. Sí, hay cierta complejidad razonable (que implica tanto las expresiones regulares de Perl como las interfaces "glob" de shell C de UNIX de Perl, de una manera muy precisa) en torno a cómo se construye `%path::dependencies` en ese archivo, pero en lugar de simplemente ver esto como un trabajo de optimización, en lugar de verlo como proporcionar los ingredientes básicos necesarios para construir los principales aspectos de la topología de enlaces de una manera automatizada y generada dinámicamente.

¿Dónde se originan las entradas en `%path::dependencies`? Si no nacen de una llamada de `walk_content_tree { seed_file_deps ... }`, (que básicamente se sumerge en las cabeceras y el contenido de los archivos de origen de rebaja), simplemente se codifican en `lib/path.pm` en tiempo de carga.

### Los gráficos de dependencias cíclicas son la norma

Nuestro sitio actualmente consta de `240 archivos fuente` en `contenido/`.  Aquí hay un `85 vértices x 465 bordes`, desplazable, dos dimensiones de representación de gráficos dirigida de una instantánea reciente de las dependencias de la página de idioma Inglés en **nuestro sitio** ([utilizando el `punto` de GraphViz](https://github.com/SunStarSys/orion/blob/master/deps2dotcfg.pl).

<div id="deps">

  ![Dependencias de idioma inglés](../images/deps).

</div>

Muy complejo, incluso para un pequeño sitio web como este! Muchas intersecciones de borde al tomar `$$n=2$$` (evitable en dimensión `)$$n=3$$

Obsérvese también la interconexión interna y esencialmente aislada de los elementos en `/categories/*/*` y `/archives/2022/11/*`. Las únicas dependencias externas implican contenido no archivado en `/ensayos/*`. Esto es por diseño - los ensayos archivados sólo deben cambiar *adiabáticamente*, tal vez únicamente para los ajustes en sus encabezados de "Categoría". Ninguno de esos cambios afecta materialmente al contenido preexistente, por lo que no lo rastreamos en `%path::dependencies`.

Por supuesto, nuestro [Orion Enterprise Wiki](/orion/).

### ¿No se trata solo de hipervínculos?

**¡No!** De hecho, la *topología de enlace* de su sitio web es un asunto totalmente independiente del *gráfico de dependencia* del árbol de origen.  Un motor de búsqueda extraerá naturalmente la *topología de enlace*, pero no tiene idea del *gráfico de dependencia*.

Aquí hay un `240+ vértices x 3859 bordes`, gráfico actual de pájaros-ojos del gráfico *link topology* inglés para **nuestro sitio** ([utilizando el `twopi` de GraphViz](https://github.com/SunStarSys/orion/blob/master/links2dotcfg.pl).

<div id="links">

  ![Enlaces de idioma inglés](../images/links).

</div>

¿Puede detectar los "bordes rojos" como se especifica en el *gráfico de dependencia*? El gráfico de *topología de enlace* es cualitativa y cuantitativamente **muy diferente** del gráfico de *dependencia* (dramáticamente más pequeño y menos interconectado) descrito anteriormente.

### Cómo puede ayudar la tecnología SSI

#### Tradicional [Inclusiones del lado del servidor](https://httpd.apache.org/docs/2.4/howto/ssi.html).

- **gran** para depurar el *gráfico de dependencia* de su sitio web hasta un tamaño manejable sin sacrificar la latencia de entrega de la página
- **genial** para reducir la rotación de texto fijo en mensajes de confirmación grandes para mejorar la revisión por colegas y la supervisión de los juegos de cambios creados
- **extraño** para recontexualizar páginas web completas en una ubicación diferente en la jerarquía de la raíz de documentos

#### API de plantilla

##### etiqueta ssi

Sintaxis:

&#123;% `ssi` `/content_rooted/path/to/source_file` %&#125;

- rutas enraizadas en el directorio de origen `content`
- omite la parte de cabecera del archivo de origen para que se incluya `ssi`
: reescribe URL relativas en URL absolutas en el contenido incluido de la ruta de destino

##### filtro ssi

Sintaxis:

&#123;{ content|ssi }&#125;

- evalúa de forma recursiva las etiquetas `ssi` en el valor que se va a filtrar
- útil para evitar el uso de un valor grande (3+) de `quick_deps` en un hashref de argumento de entrada `@path::patterns`, que puede afectar al rendimiento

#### ¿Por qué no SymLinks?

- abstracción del sistema de archivos barebones que es difícil de soportar de forma segura en un contexto `<virtualhost>`
- las mismas desventajas con el tradicional 'ssi' en páginas web completas
- nuestro [Orion Enterprise Wiki](/orion/).

#### Herramientas de creación para enlaces permanentes

##### Documentación de curación

El sistema de construcción de Orion tiene soporte integrado para lo que llamamos *Document Curation*, que es el proceso de recontextualización y reorganización de su contenido en función de cómo establece las cabeceras "Categories" y "Archive" en sus archivos de origen de Markdown. Estas funciones están desactivadas por defecto, pero se pueden activar definiendo un `category_root` (para soporte de categoría) o un `archive_root` (para soporte de archivado) en el argumento hashref asociado a la entrada `@path::patterns` deseada.

##### categorías

- el nuevo contenido se construye usando etiquetas de plantilla `ssi` que apuntan hacia atrás a la ubicación del enlace permanente, mientras que quita el encabezado `Archive` de la página de origen construida
- las categorías son estrictamente aditivas (es decir, eliminar una categoría de los encabezados de una página de origen no la eliminará de esa categoría en el sitio activo),
- generado bajo demanda
- eliminar todas las categorías en una sola confirmación es una gran manera de sincronizarlas con las especificaciones exactas en las cabeceras de todas las páginas de origen, sin destruir el contenido de categoría conservado en el sitio activo

##### páginas archivadas

En nuestro sitio, archivamos agresivamente ensayos obsoletos para mantener bajos los tiempos de construcción de nuevos ensayos, sin destruir los enlaces permanentes a documentos archivados. El gráfico *dependency* relativo al directorio `/archives/` (para nuestro sitio) es razonablemente independiente según las siguientes reglas:

- contenido construido con etiquetas de plantilla `ssi` que apuntan a la ubicación de enlace permanente, al tiempo que eliminan las cabeceras `Categories` y `Archive` de la página de origen construida
- el contenido en `/(ensayos|clientes)/` siempre es un enlace permanente, incluso después del archivado
- el archivado elimina efectivamente la ubicación del enlace permanente del gráfico de dependencia*, sin quitar el enlace permanente del sitio web

##### LED

Comentarios HTML incrustados en los límites del formulario de prosa de Markdown del contenido del lede. Para ello, utilizamos **{# lede #}**.

Los ledes de procesamiento se realizan con el filtro de plantilla "lede". Es útil combinar esto con el filtro `ssi` para indexar un archivo de categoría con más de una página de categoría dentro de él.

## Conclusiones

Hay estructuras y relaciones de datos interesantes por descubrir cuando se trata del *gráfico de dependencia* de un sitio web desde una perspectiva de rendimiento de construcción, que es un área de interés mucho más reciente que la literatura de investigación que profundiza en las estructuras de datos y las emisiones asociadas relacionadas con la *topología de enlace*<sup>1,2</sup>.

Las compilaciones incrementales convencionales para proyectos de desarrollo de software puro siguen siendo un tema candente. La investigación cubierta en <sup>3,4</sup> se publicó en octubre de 2022, aproximadamente un mes antes de que se espere que este ensayo esté completo. El sistema de compilación *pluto*<sup>5</sup> tiene características muy similares a las nuestras (la compilación en sí misma puede regenerar y reconstruir dependencias de forma dinámica).

La buena noticia es que lo tenemos cubierto como nuestro cliente. Le mantendremos informado de las mejores prácticas y el estado de la técnica en este espacio, por lo que se beneficiará de nuestras lecciones aprendidas en la última década y en el futuro.

No de notas al pie

1. [Identificación de clusters en el gráfico web basada en la topología de enlaces](https://ieeexplore.ieee.org/abstract/document/1214919).

2. [Inferencia de comunidades web desde la topología de enlaces](https://dl.acm.org/doi/pdf/10.1145/276627.276652).

3. [Sobre los beneficios y límites de las configuraciones incrementales de software de construcción: un estudio exploratorio](https://dl.acm.org/doi/abs/10.1145/3510003.3510190).

4. [Hacia la creación incremental de configuraciones de software](https://dl.acm.org/doi/10.1145/3510455.3512792).

5. [Un sistema de creación incremental sólido y óptimo con dependencias dinámicas](https://dl.acm.org/doi/10.1145/2814270.2814316).

<style type="text/css">

#deps {
  ancho:100%;
  desbordamiento:automático;
margen-inferior:10 px;
  relleno-superior:0;
  altura:1000 px;
}

#links {
  ancho:100%;
  desbordamiento:automático;
margen-inferior:10 px;
  relleno-superior:0;
  altura:1000 px;
}

@media solo pantalla y (ancho máximo: 1000px) {
    #links { altura: 300px }
}

#links img { ancho:100% }
</style>

<!-- $Date$ $Author$ $Revision$  $Id$ -->
