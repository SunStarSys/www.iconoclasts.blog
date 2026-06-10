---
dependencies: '*.md.ru'
keywords: heyoka, иконоборчество
status: проверено
title: Случайные мысли Джо
---


<div class="right">

[![Хёка](index.page/me)](https://en.wikipedia.org/wiki/Heyoka)

</div>

<div id="sidebar">

[TOC]

</div>

## Добро пожаловать! [:fa-calendar:](https://calendly.com/joe-sunstarsys/30min)

{# lede #}Мы практикуем [Открытая наука](triple-products) здесь{# lede #}.

## Обо мне

Я [ИНТДЖ-А](https://www.16personalities.com/intj-personality) тип человека, который ценит эклектичные, ненормальные, нетипичные аспекты жизни. Я освоил [Вин Чунь](https://www.youtube.com/watch?v=Qexxe6ANG2o) в средней школе, [Физическая математика](https://www.math.stonybrook.edu/~leontak/#:~:text=joseph%20schaefer) в университете, и [Проектирование оптимизации](https://www.linkedin.com/in/joesuf4) в моей профессиональной карьере.

### Личная жизнь

Женат на самой удивительной женщине на Земле, чья любовь ко мне благословила нас обоих с драгоценной дочерью.  Мы живем в Южной Флориде и совместно управляем моим S-CORP <https://sunstarsys.com>, который предоставляет оборудование и программное обеспечение инфраструктуры для этого сайта.

### Делия Фриз, ко мне

Вы знакомы с той ролью, которую Хейокя играет в культуре коренных американцев? Ты, моя дорогая, моя личная Хейокя.

![Грок Хейока](index.page/heyoka-grok)

Я создал <https://iconoclasts.blog> для удовлетворения родственных духов онлайн; кто нуждается в общественном, без цензуры, длинная форма эссе сообщество &mdash; делиться и взаимодействовать с наиболее политически неудобными, авангардными идеями друг друга.

Если это звучит как вы, пожалуйста [запросить демо сегодня](/contact)!

-----

## План

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
	"Маркетинг и реклама" : 60
    "Разработка" : 20
    "Операции" : 20
```

-----

## Эксперименты

### Песочница: мысленная карта SSI

```mermaid
{% filter fenced:"mermaid"|grep:"mindmap"|slice:0|safe %}
{% ssi `/joe/wikis.md.ru` %}
{% endfilter %}
```

-----

### Песочница: асимптотная векторная графика SSI

```asy
{% filter fenced:"asy"|slice:0|safe %}
{% ssi `/joe/stochastic-trace-formula.md.en` %}
{% endfilter %}
```

-----

### Песочница: таблица, созданная SSI &mdash; :dave_camel: {{table.headers.title}}

| {{table.csv_headers|join:" | "}} |
|---|---|---|---|
{% for row in table.content %}| {{row.r_type|safe}} | {{row.perl_equivalent|safe}} | {{row.pdl_equivalent|safe}} | {{row.notes|safe}} |
{% endfor %}| дополнительное | удовольствие | ниже | линия |

&nbsp;

#### {% filter split:"##+"|grep:"Основные выводы"|safe %}
{% ssi `/chrisarg/perlasadatascilang.md.ru` %}
{% endfilter %}

### Песочница: схема SSI Mermaid wardley-beta

```mermaid
{% filter fenced:"mermaid"|grep:"wardley"|slice:0|safe %}
{% ssi `/joe/wikis.md.ru` %}
{% endfilter %}
```

<!-- $Date$ $Author$ $Revision$ -->
