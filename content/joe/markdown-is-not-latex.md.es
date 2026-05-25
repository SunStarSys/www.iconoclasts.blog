---
categories: Orión
dependencies: '*.md.es'
keywords: rebaja,Microsoft,Github,corrupta, abraza,ampliar,sicofante
status: verificado=39877
title: Microsoft considerado dañino
---

<div class="right">

![Abrazar y extender el mal imperio](markdown-is-not-latex.page/microsoft)

</div>

## Orígenes de rebaja

{# lede #}El punto de [Especificación de sintaxis de Markdown de John Gruber](https://daringfireball.net/projects/markdown/syntax) era que era fácil trabajar con{# lede #}; no solo desde el punto de vista de la creación, sino también desde la perspectiva de un implementador.  $$\LaTeX$$, `MathML`y `HTML5` no son eso.

## :fa-github: GitHub Rebaja con sabor (GFM)

[GFM](https://github.github.com/gfm/) se mantuvo fiel a los objetivos de diseño de esa especificación hasta [Microsoft bastardizó el signo de dólar aislado para convertirlo condicionalmente en un $$\LaTeX$$ token](https://docs.github.com/en/get-started/writing-on-github/working-with-advanced-formatting/writing-mathematical-expressions#writing-inline-expressions) debido a un anticuado, feo y lento crapware institucional llamado [MathJax](https://www.mathjax.org/) que no tenía nada que ver con Markdown, y el hecho de que estos imbéciles no quieren promover [$$\KaTeX$$](https://katex.org/) Sin un soborno de la Academia Khan.

## Abrazar y ampliar Redux

Por supuesto, esto fue totalmente intencional, porque [:editormd-logo: equipos de ingeniería de clase mundial](http://editor.md.ipandao.com) habían resuelto $$\KaTeX$$ con límites de token de doble dólar para matemáticas en línea y bloques de matemáticas vallados para bloques $$\KaTeX$$ procesamiento **antes de 2020**.

El punto aquí es que un delimitador de 2 caracteres que rara vez ocurre en la prosa típica es el ideal normal para situaciones como esta. [Se ha bloqueado Microsoft solo para admitir \$\` ... \`\$](https://github.blog/changelog/2023-05-08-new-delimiter-syntax-for-inline-mathematical-expressions/) No escribiría este artículo en 2026, porque esa elección cumple con las condiciones ideales normales para la introducción fiel de expresiones matemáticas en línea en una especificación de Markdown.

Si tuviera que adivinar sus motivos para considerar que la sintaxis propuesta de ese artículo de blog es insuficiente para sus necesidades actuales, sospecho que los motivos eran más sobre la codicia y el control del mercado y "insatisfacción del cliente" que una buena administración de F/OSS. AMMV.

Ahora es un desastre ambiguo de defectos de la regex de ingeniería cada vez que un autor / implementador tiene que adivinar lo que se supone que el analizador tiene que ver con secuencias de signos de dólar aislados que ocurren dentro de un solo párrafo de la prosa de rebaja, como cuando los matemáticos financieros canadienses franceses discuten dos precios en dos monedas diferentes, dicen. `$`1.50 EE.UU., y 2,00`$` CA (posiblemente artificial, pero ilustra la complejidad). Buena suerte con eso (es el `$` a $$\LaTeX$$ token, o es algo completamente diferente) si está realizando una conversión masiva de GFM de formatos de documentos heredados a una plataforma que no sea GitHub. Sólo "trabajo" cuando se presenta en Visual Studio, si incluso funciona en absoluto.

A diferencia de los estándares que surgen de la [JCP](https://jcp.org/en/home/index), nunca habrá un conjunto de pruebas de certificación de cumplimiento para este desastre, porque es un [evolución](https://github.com/github/markup?tab=readme-ov-file#github-markup) [situación](https://github.com/kivikakk/comrak/blob/d2da7a055008a8ccde18cc1c88a06a04de69fa99/src/nodes.rs#L200) activado [el terreno](https://github.com/gjtorikian/commonmarker/blob/c1ce5afbf36610ae14d91db809f3f0a3bc4386bc/test/math_test.rb#L8) a las [GitHub](https://www.bing.com/search?q=what+is+github%27s+current+open+source+markdown+parser)<sup>1</sup>:

> GitHub no ha revelado públicamente su analizador de rebajas de código abierto actual. Sin embargo, se sabe que GitHub utiliza una implementación personalizada de Markdown para su plataforma, que se basa en la especificación GitHub Flavored Markdown (GFM). Esta implantación incluye soporte para varias extensiones y funciones que mejoran la sintaxis de Markdown utilizada por GitHub.

Una vez más, desviación intencional de los objetivos de Gruber.

Lo más repugnante es que el abrazo y la extensión del imperio maligno tiene un ejército de esclavos de trabajo libres de F / OSS para servir como policía de pensamiento sincofántico sobre sus esfuerzos para acumular el trabajo de otros para sus propias ganancias de mercado a través de la IA.

## Mierda Microsoft

En resumen, GFM ya no es una especificación de la industria, sino un formato de proveedor propietario que no es diferente de la basura de Wikimedia de la que lo copiaron.

[Orión](https://www.sunstarsys.com/orion/features) **no utiliza, y nunca utilizará, analizadores de GFM más nuevos que pretendan realizar un seguimiento de esta disfunción sucia**.

En cambio, confiamos en una bifurcación interna de @markedjs/marked y continuaremos haciéndolo en el futuro previsible.

## Notas al pie

1. La prosa citada fue la respuesta original de AI de bing durante las últimas 24 horas, hasta que agregué los enlaces de fondo adicionales a este artículo, desde el cual "aprendido" Cómo decir algo menos idiota en respuesta a la consulta "¿Qué es el analizador de rebajas de código abierto actual de github?". Esta es la IA que está **tomando nuestro trabajo**, amigos.

<!-- $Date$ $Author$ $Revision$ -->
