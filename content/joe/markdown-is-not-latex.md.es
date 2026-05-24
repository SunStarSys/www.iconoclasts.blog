---
categories: Orión
dependencies: '*.md.es'
keywords: rebaja,Microsoft,Github,corrupta, abraza,ampliar,sicofante
status: verificado=39687
title: Microsoft considerado dañino
---

<div class="right">

![Abrazar y extender el mal imperio](markdown-is-not-latex.page/microsoft)

</div>

## Orígenes de rebaja

{# lede #}El punto de [Especificación de sintaxis de Markdown de John Gruber](https://daringfireball.net/projects/markdown/syntax) era que era fácil trabajar con{# lede #}; no solo desde el punto de vista de la creación, sino también desde la perspectiva de un implementador.  $$\LaTeX$$, `MathML`y `HTML5` no son eso.

## :fa-github: GitHub Rebaja con sabor (GFM)

GFM se mantuvo fiel a los objetivos de diseño de esa especificación hasta [Microsoft bastardizó el signo de dólar aislado para convertirlo condicionalmente en un $$\LaTeX$$ token](https://docs.github.com/en/get-started/writing-on-github/working-with-advanced-formatting/writing-mathematical-expressions#writing-inline-expressions) Debido a algunos anticuados, feos crapware llamado MathJax que no tenían nada que ver con Markdown, y el hecho de que estos imbéciles no quieren promover $$\KaTeX$$ Sin un soborno de la Academia Khan.

## Abrazar y ampliar Redux

Por supuesto, esto fue totalmente intencional, porque [:editormd-logo: equipos de ingeniería de clase mundial](http://editor.md.ipandao.com) habían resuelto $$\KaTeX$$ con límites de token de doble dólar para matemáticas en línea y bloques de matemáticas vallados para bloques $$\KaTeX$$ procesamiento **antes de 2020**.

El punto aquí es que un delimitador de 2 caracteres que rara vez ocurre en la prosa típica es el ideal normal para situaciones como esta. [Se ha bloqueado Microsoft solo para admitir \$\` ... \`\$](https://github.blog/changelog/2023-05-08-new-delimiter-syntax-for-inline-mathematical-expressions/) No escribiría este artículo en 2026, porque esa elección cumple con las condiciones ideales normales para la introducción fiel de expresiones matemáticas en línea en una especificación de Markdown.

Ahora es un desastre ambiguo de defectos de la regex de ingeniería cada vez que un autor / implementador tiene que adivinar lo que se supone que el analizador tiene que ver con secuencias de signos de dólar aislados que ocurren dentro de un solo párrafo de la prosa de rebaja, como cuando se discuten dos precios, dicen. `$`1.50, y `$`2.00.  Buena suerte con eso (es el `$` a $$\LaTeX$$ token, o ¿es un prefijo de moneda?) si está realizando una conversión masiva de GFM de formatos de documentos heredados a una plataforma que no sea GitHub. Sólo "trabajo" cuando se presenta en Visual Studio.

A diferencia de los estándares que surgen de la [JCP](https://jcp.org/en/home/index), nunca habrá un conjunto de pruebas de certificación de cumplimiento para este desastre, porque es un [evolución de la situación sobre el terreno en GitHub](https://github.com/gjtorikian/commonmarker/blob/c1ce5afbf36610ae14d91db809f3f0a3bc4386bc/test/math_test.rb#L8). Una vez más, desviación intencional de los objetivos de Gruber.

Lo más repugnante es que el abrazo y la extensión del imperio maligno tiene un ejército de esclavos de trabajo libres de F / OSS para servir como policía de pensamiento sincofántico sobre sus esfuerzos para acumular el trabajo de otros para sus propias ganancias de mercado a través de la IA.

## Mierda Microsoft

En resumen, GFM ya no es una especificación de la industria, sino un formato de proveedor propietario que no es diferente de la basura de Wikimedia de la que lo copiaron.

[Orión](https://www.sunstarsys.com/orion/features) **no utiliza, y nunca utilizará, analizadores de GFM más nuevos que pretendan realizar un seguimiento de esta disfunción sucia**.

En cambio, confiamos en una bifurcación interna de @markedjs/marked y continuaremos haciéndolo en el futuro previsible.

<!-- $Date$ $Author$ $Revision$ -->
