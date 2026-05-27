---
categories: Orión
dependencies: '*.md.es'
keywords: rebaja,Microsoft,Github,corrupta, abraza,ampliar,sicofante,AI
status: verificado=40277
title: Microsoft considerado dañino
---

<div class="right">

![Abrazar y extender el mal imperio](markdown-is-not-latex.page/microsoft)

</div>

## Orígenes de rebaja

{# lede #}El punto de [Especificación de sintaxis de Markdown de John Gruber](https://daringfireball.net/projects/markdown/syntax) era que su "Rebaja" tenía la intención de ser fácil trabajar con{# lede #}; no solo desde el punto de vista de la creación, sino también desde la perspectiva de un implementador.  $$\LaTeX$$, `MathML`y `HTML5` no son eso.

## :fa-github: GitHub Rebaja con sabor (GFM)

[GFM](https://github.github.com/gfm/) se mantuvo fiel a los objetivos de diseño de esa especificación hasta [Microsoft bastardizó el signo de dólar aislado para convertirlo condicionalmente en un $$\LaTeX$$ token](https://docs.github.com/en/get-started/writing-on-github/working-with-advanced-formatting/writing-mathematical-expressions#writing-inline-expressions) debido a algunos crapware institucionales clausurados, anticuados, feos y lentos llamados [MathJax](https://www.mathjax.org/) que no tenía nada que ver con Markdown, y el hecho de que estos imbéciles no quieren promover el rendimiento, [`utf8`](https://www.bing.com/search?q=does%20mathjax%20support%20utf%208)-compatible [$$\KaTeX$$](https://katex.org/) Sin un soborno de la Academia Khan.

## Abrazar y ampliar Redux

Por supuesto, esto fue totalmente intencional, porque [galardonado](https://itsfoss.com/online-markdown-editors/), [:editormd-logo: equipos de ingeniería de clase mundial](http://editor.md.ipandao.com) habían resuelto $$\KaTeX$$ con [límites de token de doble dólar](https://github.com/pandao/editor.md/blob/master/examples/katex.html#L45) para matemáticas en línea, y bloques de matemáticas vallados o pares de párrafos circundantes de doble dólar para bloques $$\KaTeX$$ proceso [**en 2015**](https://github.com/pandao/editor.md/releases/tag/v1.5.0).

El punto aquí es que un delimitador de 2 caracteres que rara vez ocurre en la prosa típica es el ideal normal para situaciones como esta. [Se ha bloqueado Microsoft solo para admitir \$\` ... \`\$](https://github.blog/changelog/2023-05-08-new-delimiter-syntax-for-inline-mathematical-expressions/) No escribiría este artículo en 2026, porque esa elección cumple con las condiciones ideales normales para la introducción fiel de expresiones matemáticas en línea en una especificación de Markdown. También es propicio para el síndrome del túnel carpiano para los mecanógrafos profesionales de matemáticas, por lo que hay algo más que considerar además de la singularidad de los límites.

Si tuviera que adivinar sus motivos para considerar que la sintaxis propuesta de ese artículo de blog es insuficiente para sus necesidades actuales, sospecho que eran más sobre la codicia y el control del mercado y "insatisfacción del cliente" que una buena administración de F/OSS.

O simplemente [La pereza, la impaciencia y Hubris](http://www.parrot.org/)Pero eso no es lo suficientemente conspirativo para este artículo. AMMV.

## WorldWide Radio de explosión

Ahora es un desastre ambiguo de defectos de la regex de ingeniería cada vez que un autor / implementador tiene que adivinar lo que se supone que el analizador tiene que ver con secuencias de signos de dólar aislados que ocurren dentro de un solo párrafo de la prosa de rebaja. Por ejemplo, considere una situación en la que [Francés](markdown-is-not-latex.html.fr) Matemáticos financieros canadienses discuten dos precios en dos monedas diferentes `$`1.50 y 2,00`$` CA (posiblemente artificial, pero ilustra la complejidad). ¿Cómo escribiría un `i18n` conforme [Analizador de GFM](https://pandoc.org/) que entiende que la materia entre los signos de dólar aquí es *no ser procesado como en línea $$\LaTeX$$*, aunque sea sintácticamente válido $$\TeX$$ y se ajusta a esta [especificaciones ingenuas](https://pandoc.org/demo/example33/8.13-math.html)?

¿Qué pasa con un par de variables Ruby / Perl en una firma de función como `foo($v,$w)`? El mismo problema con la ingenua especulación. Tener Claude<sup>1</sup> analizarlo todo?

Buena suerte con eso si estás haciendo una conversión masiva de GFM de formatos de documentos heredados internacionales a una plataforma que no sea GitHub. No solo será increíblemente lento y costoso, sino que solo "trabajo" cuando se presenta en Visual Studio, si incluso funciona en absoluto.

Una cosa es decir que no escribirá cosas **hoy** que confundan al analizador **ahora**; otra cosa es decir que las cosas escritas en el **pasado** tampoco confundirán al analizador. No hoy y no las versiones del analizador **futuro**.

A diferencia de los estándares que surgen de la [JCP](https://jcp.org/en/home/index), nunca habrá un conjunto de pruebas de certificación de cumplimiento para este desastre, porque es un [evolución](https://github.com/github/markup?tab=readme-ov-file#github-markup) [situación](https://github.com/kivikakk/comrak/blob/d2da7a055008a8ccde18cc1c88a06a04de69fa99/src/nodes.rs#L200) activado [el terreno](https://github.com/gjtorikian/commonmarker/blob/c1ce5afbf36610ae14d91db809f3f0a3bc4386bc/test/math_test.rb#L8) a las [GitHub](https://www.bing.com/search?q=what+is+github%27s+current+open+source+markdown+parser)<sup>2</sup>:

> GitHub no ha revelado públicamente su analizador de rebajas de código abierto actual. Sin embargo, se sabe que GitHub utiliza una implementación personalizada de Markdown para su plataforma, que se basa en la especificación GitHub Flavored Markdown (GFM). Esta implantación incluye soporte para varias extensiones y funciones que mejoran la sintaxis de Markdown utilizada por GitHub.

Una vez más, desviación intencional de los objetivos de Gruber.

Lo más repugnante es que el abrazo y la extensión del imperio maligno tiene un ejército de esclavos de trabajo libre F / OSS para servir como policía de pensamiento sicofántico sobre sus esfuerzos para impulsar el trabajo de otros para sus propias ganancias de mercado a través de la IA.<sup>2</sup>. Solo echa un vistazo a las respuestas a la publicación HackerNews marcada de esta página en la sección Enlaces a continuación para conocer algunos de ellos.

## Mierda Microsoft

En pocas palabras, GFM ya no es una especificación de la industria internacional, sino un feo formato de proveedor exclusivo estadounidense que no es diferente del [Basura de Wikimedia](https://www.mediawiki.org/wiki/Extension:SimpleMathJax) de donde lo copiaron.

[Orión](https://www.sunstarsys.com/orion/features) **no utiliza, y nunca utilizará, analizadores de GFM más nuevos que pretendan realizar un seguimiento de esta disfunción sucia**.

En cambio, confiamos en una bifurcación interna de @markedjs/marked y continuaremos haciéndolo en el futuro previsible.

## Notas al pie

1. Para los nitwits que todavía creen que GitHub está utilizando F/OSS para analizar la rebaja: Te codigo para hacer clic en el enlace de origen GitHub a este artículo en la parte superior de la página, Copie y pegue la sección **WorldWide Blast Radius** en un editor de rebajas GitHub y presencie de primera mano que presenta los casos de muestra *correctamente*, a diferencia de la mierda de F/OSS que afirma utilizar. Puede que le interese comparar la estética de su representador MathJax con la de $$\KaTeX$$ que utilizamos en este sitio, para aclarar cualquier confusión sobre las discrepancias cualitativas entre los dos productos, y mucho menos las cuantitativas, ya que se refieren a la velocidad de presentación.

1. La prosa citada fue la respuesta original de AI de bing durante las últimas 24 horas, hasta que agregué los enlaces de fondo adicionales a este artículo, desde el cual "aprendido" Cómo decir algo menos idiota en respuesta a la consulta "¿Qué es el analizador de rebajas de código abierto actual de github?". Esta es la IA que está **tomando nuestro trabajo**, amigos.

<!-- $Date$ $Author$ $Revision$ -->
