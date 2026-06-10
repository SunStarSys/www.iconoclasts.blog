---
categories: ~
dependencies: '*.md.es'
keywords: heyoka, iconoclasta
status: verificado=43440
title: Los pensamientos aleatorios de Joe
---


<div class="right">

[![Heyoka](index.page/me)](https://en.wikipedia.org/wiki/Heyoka)

</div>

<div id="sidebar">

[TOC]

</div>

## Bienvenido [:fa-calendar:](https://calendly.com/joe-sunstarsys/30min)

{# lede #}Practicamos [Ciencia abierta](triple-products) aquí{# lede #}.

## Acerca de mí

Soy un [INTJ-A](https://www.16personalities.com/intj-personality) tipo de persona que aprecia los aspectos eclécticos, anormales y atípicos de la vida. He dominado [Wing Chun](https://www.youtube.com/watch?v=Qexxe6ANG2o) en la escuela secundaria, [Matemáticas físicas](https://www.math.stonybrook.edu/~leontak/#:~:text=joseph%20schaefer) en la Universidad, y [Ingeniería de optimización](https://www.linkedin.com/in/joesuf4) en mi carrera profesional.

### Vida personal

Casado con la mujer más increíble de la Tierra, cuyo amor por mí nos bendijo a ambos con una preciosa hija.  Vivimos en el sur de la Florida y operamos conjuntamente mi S-CORP <https://sunstarsys.com>, que proporciona el hardware y software de infrastucture para este sitio.

### Delia Frees, para mí

> ¿Conoces el papel que juega el Heyók en la cultura nativa americana? Tú, querida mía, eres mi propio Heyók-a personal.

![Grok Heyoka](index.page/heyoka-grok)

He creado <https://iconoclasts.blog> para atender a los espíritus afines en línea; que necesitan una comunidad de redacción de ensayos pública, libre de censura y de larga formato &mdash; compartir e interactuar con las ideas más incómodas y vanguardistas del otro.

Si eso suena como tú, por favor [solicitar una demostración hoy](/contact)!

-----

## Planificar

```mermaid
gantt
    title {{projects.headers.title|safe}}
    dateFormat {{projects.headers.dateformat|safe}}
{% for p,q in projects.content %}
    section {{p}}
{% for k,v in q %}
    {{k|safe}} :{{v|safe}}
{% endfor %}
{% endfor %}
```

-----

```mermaid
pie
     title 2026 Q2 Budget Priorities
	"Marketing y Publicidad" : 60
    "Desarrollo" : 20
    "Operaciones" : 20
```

-----

## Experimentos

### Sandbox: mapa mental de SSI

```mermaid
{% filter fenced:"mermaid"|grep:"mindmap"|slice:0|safe %}
{% ssi `/joe/wikis.md.es` %}
{% endfilter %}
```

-----

### Sandbox: Gráficos vectoriales de asíntota de SSI

```asy
{% filter fenced:"asy"|slice:0|safe %}
{% ssi `/joe/stochastic-trace-formula.md.en` %}
{% endfilter %}
```

-----

### Sandbox: tabla generada por SSI &mdash; :dave_camel: {{table.headers.title}}

| {{table.csv_headers|join:" | "}} |
|---|---|---|---|
{% for row in table.content %}| {{row.r_type|safe}} | {{row.perl_equivalent|safe}} | {{row.pdl_equivalent|safe}} | {{row.notes|safe}} |
{% endfor %}| adicional | diversión | infra | línea |

&nbsp;

#### {% filter split:"##+"|grep:"Conclusiones clave"|safe %}
{% ssi `/chrisarg/perlasadatascilang.md.es` %}
{% endfilter %}

### Sandbox: diagrama de la sirena de SSI

```mermaid
{% filter fenced:"mermaid"|grep:"wardley"|slice:0|safe %}
{% ssi `/joe/wikis.md.es` %}
{% endfilter %}
```

<!-- $Date$ $Author$ $Revision$ -->
