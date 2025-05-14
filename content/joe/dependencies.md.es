---
archived: ~
categories: Orión, Arquitectura
dependencies: '*.md.es'
keywords: arquitectura,incremental,sitio web,generación,edificios,dependencias,topología,wiki,gráfico,inteligente
published: ~
status: verificado=22964
title: ¿Qué es <em>Smart Content Dependency ManagementTM</em>?
---

[TOC]

## Resumen

*Gestión de dependencias de contenido inteligente&trade;* se trata del círculo de ideas relacionadas con la prestación de apoyo y facilitación para *construcciones incrementales*, mientras se mantiene fiel al **Principio de Normalización de Contenido** &mdash; que [*permalinks*](https://en.wikipedia.org/wiki/Permalink) debe ser la única fuente de verdad, sin importar cómo se curen sus contenidos en todo el árbol de origen y los artefactos de compilación resultantes.

En este artículo, se presenta el sitio web de <https://sunstarsys.com/> como un caso práctico para una demostración de las mejores prácticas y el análisis de las topologías de gráficos asociadas.

## Caveats

Esto solo importa cuando necesita sopesar el costo de realizar compilaciones completas de sitios cada vez que necesita modificar el contenido de una página web. Si su sitio web tiene menos de 1K archivos de origen, **relaje** y lea lo siguiente con atención a sus necesidades futuras. Usted eligió usar nuestra plataforma, que está diseñada para escalar con usted, no en su contra. Para la mayoría de las páginas, este material a continuación trata sobre *gráficos de dependencia de contenido disperso* para sitios con más de 1K páginas.

Por ejemplo, el sitio web de Apache <https://www.OpenOffice.Org> pudo crear sus archivos 40K+ con la versión original de Apache de este sistema de compilación, con soporte totalmente integrado para compilaciones incrementales. &mdash; sin ninguna dependencia configurada &mdash; haciendo un uso inteligente de la tecnología SSI tradicional solo.

Por defecto, nuestro sistema de compilación solo creará los archivos que ha cambiado, sin preocuparse por las dependencias dentro del archivo (a menos que las especifique en `%path::dependencias` &mdash; más sobre eso abajo). Si el archivo que ha cambiado está en el `plantillas/` o `lib/` directorio, se disparará una creación de sitio completa en su lugar.

## Tejer el *Gráfico de dependencia* de tu sitio web

Matemáticamente, una *Topología* `$$\tau$$` es una especificación completa de los subconjuntos *open* de un espacio `$$X$$`, cuyo objetivo es indicar las relaciones de proximidad entre *puntos* `$$x$$` del espacio `$$X$$`. Cuándo `$$X$$` es un gráfico, una *topología* `$$\tau$$` para `$$X$$` equivale a especificar los bordes que conectan los vértices del gráfico juntos (aquí los vértices se ven como los *puntos* de `$$X$$`, y los bordes de conexión determinan los vecindarios de esos puntos como *conjuntos abiertos básicos* para la topología).  Una *topología gráfica dirigida* es esencialmente la misma cosa, pero incorpora una referencia a una incrustación topológica de `$$(X,\tau)$$` en un espacio topológico más amplio `$$(Y,\sigma)$$` , donde las conexiones de borde de la incrustación están representadas por curvas direccionales, no intersectantes (Jordania).

Este último concepto es lo que utilizaremos al analizar la topología del *gráfico de dependencia* `$$\tau$$` asociado al espacio `$$X$$` de archivos de origen debajo de los de su sitio `contenido/` subdirectorio (aquí `$$(Y,\sigma)$$` es `$$\mathbb{R}^n$$` con su topología métrica para `$$n \in \{2,3\}$$`y los bordes de `$$X$$` son curvas Jordan dirigidas no intersectantes que conectan un archivo `$$x \in X$$` a su conjunto de archivos sobre los que `$$x$$` depende: `$$\set{x^\prime \in X | x \rightarrow x^\prime}$$`).

Que tiene {# lede #}Una comprensión clara del *gráfico de dependencia* de su sitio web garantizará que pueda maximizar el rendimiento de nuestra tecnología de compilación a escala{# lede #}. Tomamos la información que usted proporciona para `%path::dependencias` durante la carga de construcción de su sitio web `lib/path.pm` crear un mapa inverso de archivos dependientes y utilizar *ese mapa inverso* para determinar el corpus completo de archivos que se va a crear para cualquier `confirmación de svn` a nuestro sistema.

Es importante tener en cuenta que las relaciones de dependencia entre los archivos de origen pueden y deben ser capturadas completamente por la `%path::dependencias` hash durante la carga de inicio del sistema de creación de `lib/path.pm` desde su árbol de origen, que es la forma en que las vistas incorporadas `SunStarSys::Ver` El paquete Perl está destinado a funcionar. El `walk_content_tree`, `archivado`, y `seed_file_deps` funciones de utilidad importables de `SunStarSys::Util` son útiles para construir el `%path::dependencias` hash, con soporte integrado para gestionar una caché de dependencia para acelerar las compilaciones incrementales a escala.

Esta es la parte de nuestra vida [`lib/path.pm`]({{snippetA.pretty_uri}}):

[snippet:lang=perl:repo=SunStarSys/www:branch=trunk:path=lib/path.pm:token=#snippet]

Por favor, analice ese código para obtener ideas sobre cómo desea que funcione * su sitio web *. Sí, hay cierta complejidad razonable (que implica tanto las expresiones regulares de Perl como la cáscara UNIX de Perl) `glob` interfaces, de forma muy precisa) sobre cómo `%path::dependencias` está construido en ese archivo, pero en lugar de solo ver esto como un trabajo de optimización, en su lugar, mire que proporciona los ingredientes básicos necesarios para construir los principales aspectos de la topología de enlaces de una manera automatizada y generada dinámicamente.

¿Dónde están las entradas en `%path::dependencias` ¿Origen? Si no nacen de una invocación de `walk_content_tree { seed_file_deps ... }`, (que básicamente se sumerge en las cabeceras y el contenido de los archivos de origen de Markdown), luego solo están codificados en `lib/path.pm` en tiempo de carga.

### Gráficos de dependencia cíclica son la norma

Nuestro sitio actualmente consiste en `240 archivos de origen` en `contenido/`. Aquí hay un `85 vértices x 465 bordes`, representación gráfica dirigida en dos dimensiones desplazable de una instantánea reciente de las dependencias de la página en inglés en **nuestro sitio** ([uso de GraphViz `punto`](https://github.com/SunStarSys/orion/blob/master/deps2dotcfg.pl)):

<div id="deps">

![Dependencias del idioma inglés](../images/deps).

</div>

Muy complejo, incluso para un sitio web pequeño como este! Muchas intersecciones de borde al tomar `$$n=2$$` (evitable en dimensión `$$n=3$$`). De particular interés es el conjunto central de dependencias cíclicas densas en los archivos no almacenados en nuestro sitio. `/ensayos/` directorio, hacia el centro-derecho inferior del gráfico, que es lo que debería ser un buen gráfico de dependencia del sitio de blogs. Estas dependencias se dibujan en `curvas rojas` en la imagen.

Observe también la interconexión interna, esencialmente aislada, de los elementos en `/categorías/*/*` y `/archives/2022/11/*`. Las únicas dependencias externas implican contenido no archivado en `/ensayos/*`. Esto es por diseño &mdash; los ensayos archivados solo deben cambiar *adiabáticamente*, quizás únicamente para los ajustes a sus `Categoría` cabeceras. Ninguno de esos cambios afecta materialmente al contenido preexistente, por lo que no lo rastreamos en `%path::dependencias`.

Por supuesto, nuestro [Wiki de Orion Enterprise](/orion/) Nunca ha tenido problemas para lidiar con dependencias cíclicas.

### ¿No se trata solo de hipervínculos?

**¡No!** De hecho, la *topología de enlace* de su sitio web es un asunto completamente separado del *gráfico de dependencia* del árbol de origen*.  Un motor de búsqueda extraerá naturalmente la topología *link*, pero no tiene información sobre el gráfico *dependency*.

Aquí hay un `Más de 240 vértices x 3859 bordes`, gráfico de ojos de pájaros actual del gráfico de *topología de enlaces* en inglés para **nuestro sitio** ([uso de GraphViz `twopi`](https://github.com/SunStarSys/orion/blob/master/links2dotcfg.pl)):

<div id="links">

![Enlaces de idioma inglés](../images/links).

</div>

¿Puedes ver el `bordes rojos` como se especifica en el gráfico *dependency*? El gráfico *topología de enlaces* es cualitativa y cuantitativamente **muy diferente** del gráfico de dependencia* (dramáticamente más pequeño y menos interconectado) descrito anteriormente.

### Cómo puede ayudar la tecnología SSI

#### Tradicional [Incluye el lado del servidor](https://httpd.apache.org/docs/2.4/howto/ssi.html) (SSI).

- **gran** para depurar el *gráfico de dependencia* de su sitio web hasta un tamaño manejable sin sacrificar la latencia de entrega de la página
- **gran** para reducir la rotación de texto fijo en grandes mensajes de confirmación para una mejor revisión por pares y supervisión de los juegos de cambios creados
- **perjudicial** para recontexualizar páginas web completas en una ubicación diferente en la jerarquía de la raíz del documento

#### API de plantilla

##### etiqueta ssi

Sintaxis:

&#123;% `ssi` &#96;/content_rooted/path/to/source_file&#96; %&#125;

- rutas enraizadas en `contenido` directorio de origen
- omite la parte de encabezado del archivo de origen que `ssi` incluido
: reescribe las URL relativas en las URL absolutas en el contenido incluido de la ruta de destino

##### filtro ssi

Sintaxis:

&#123;&#123; contenido|ssi &#125;&#125;

- evaluaciones recursivas `ssi` etiquetas en el valor que se va a filtrar
- útil para evitar el uso de un gran valor (3+) de `quick_deps` en un `@path::patrones` hashref de argumento de entrada, que puede afectar al rendimiento

#### ¿Por qué no SymLinks?

- abstracción del sistema de archivos barebones que es difícil de soportar de forma segura en un `<virtualhost>` contexto
- las mismas desventajas con las tradicionales `ssi` en páginas web completas
- nuestro [Wiki de Orion Enterprise](/orion/) sistema no les apoya

#### Herramientas de creación para enlaces permanentes

##### Curación de documentos

El sistema de compilación de Orion tiene soporte integrado para lo que llamamos *Document Curation*, que es el proceso de recontextualización y reorganización de su contenido en función de cómo establezca el `Categorías` y `Archivo` Cabeceras en los archivos de origen de Markdown. Estas funciones están desactivadas de forma predeterminada, pero se pueden activar configurando una `category_root` (para el soporte de categoría) o un `archive_root` (para el soporte de archivado) en el argumento hashref asociado al `@path::patrones` entrada.

##### Categorías

- el nuevo contenido se construye utilizando la plantilla `ssi` etiquetas que apuntan de nuevo a la ubicación de enlace permanente, al eliminar la `Archivo` cabecera de la página de origen construida
- las categorías son estrictamente aditivas (es decir, la eliminación de una categoría de los encabezados de una página de origen no la eliminará de esa categoría en el sitio activo),
- generado bajo demanda
- Eliminar todas las categorías en una sola confirmación es una excelente manera de sincronizarlas con las especificaciones exactas en todos los encabezados de las páginas de origen, sin destruir el contenido de la categoría preservada en el sitio en vivo

##### Páginas archivadas

En nuestro sitio, archivamos agresivamente ensayos obsoletos para mantener bajos los tiempos de construcción de nuevos ensayos, sin destruir los enlaces permanentes a los documentos archivados. El *gráfico de dependencia* relativo al `/archivos/` directorio (para nuestro sitio) es razonablemente autónomo según las siguientes reglas:

- contenido construido usando plantilla `ssi` etiquetas que apuntan de nuevo a la ubicación de enlace permanente, al eliminar la `Categorías` y `Archivo` cabeceras de la página de origen construida
- contenido en `/(ensayos|clientes)/` son siempre enlaces permanentes, incluso después de archivar
- el archivado elimina eficazmente la ubicación de enlace permanente del gráfico de *dependencia*, sin eliminar el enlace permanente del sitio web

##### Lede

Comentarios HTML incrustados en los límites de forma de prosa Markdown del contenido del lede. Utilizamos **&#123;No de clientes potenciales&#125;** Para ello.

El procesamiento de ledes se realiza con el `guía` Filtro de plantilla. Es útil combinar esto con el `ssi` filtro para indexar un archivo de categoría con más de una página de categoría dentro de él.

## Conclusiones

Hay estructuras de datos y relaciones interesantes por descubrir cuando se trata del *gráfico de dependencia* de un sitio web desde una perspectiva de rendimiento de compilación, que es un área de interés mucho más nueva que la literatura de investigación que profundiza en las estructuras de datos y las emisiones asociadas en torno a la *topología de enlaces*<sup>1,2</sup>.

Las compilaciones incrementales convencionales para proyectos de desarrollo de software puro siguen siendo un tema candente. La investigación tratada en <sup>3,4</sup> se publicó en octubre de 2022, aproximadamente un mes antes de que se espere que este ensayo esté completo. El sistema de creación *pluto*<sup>5</sup> tiene funciones bastante similares a las nuestras (la propia creación puede regenerar y reconstruir dependencias de forma dinámica).

La buena noticia es que lo tenemos cubierto como nuestro cliente. Le mantendremos informado de las mejores prácticas y el estado de la técnica en este espacio, para que se beneficie de nuestras lecciones aprendidas en la última década y en el futuro.

## Notas al pie

1. [Identificación de clusters en el gráfico Web según la topología de enlaces](https://ieeexplore.ieee.org/abstract/document/1214919) Séptimo Simposio Internacional de Ingeniería y Aplicaciones de Bases de Datos, 2003. Procedimientos.

2. [Transferencia de Comunidades Web desde la Topología de Enlaces](https://dl.acm.org/doi/pdf/10.1145/276627.276652) Actas de la novena conferencia ACM sobre hipertexto e hipermedia: enlaces, objetos, tiempo y espacio &mdash; Estructura en sistemas hipermedia: enlaces, objetos, tiempo y espacio &mdash; estructura en los sistemas hipermedia. 1998.

3. [Sobre los beneficios y límites de las configuraciones incrementales de software de compilación: un estudio exploratorio](https://dl.acm.org/doi/abs/10.1145/3510003.3510190) ICSE '22: Actas de la 44a Conferencia Internacional sobre Ingeniería de Software, mayo de 2022

4. [Hacia la creación incremental de configuraciones de software](https://dl.acm.org/doi/10.1145/3510455.3512792) ICSE-NIER '22: Actas de la 44a Conferencia Internacional ACM/IEEE sobre Ingeniería de Software: Nuevas Ideas y Resultados Emergentes, mayo de 2022

5. [Un sistema de generación incremental sólido y óptimo con dependencias dinámicas](https://dl.acm.org/doi/10.1145/2814270.2814316) OOPSLA 2015: Actas de la Conferencia Internacional ACM SIGPLAN 2015 sobre Programación Orientada a Objetos, Sistemas, Idiomas y Aplicaciones Octubre 2015

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
