---
categories: ~
dependencies: '*.md.ru'
keywords: heyoka, иконоборчество
status: проверено=39016
title: Случайные мысли Джо
---


<div class="right">

[![Хёка](index.page/me)](https://en.wikipedia.org/wiki/Heyoka)

</div>

## Добро пожаловать!

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

### План

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

### Песочница: мысленная карта SSI

{% filter code:"mermaid"|slice:0|safe %}
{% ssi `/joe/wikis.md.en` %}
{% endfilter %}

-----

### Песочница: таблица, созданная SSI &mdash; {{table.headers.title}}

| {{table.csv_headers|join:" | "}} |
|---|---|---|---|
{% for row in table.content %}| {{row.r_type}} | {{row.perl_equivalent}} | {{row.pdl_equivalent}} | {{row.notes}} |
{% endfor %}| дополнительное | удовольствие | ниже | линия |

<!-- $Date$ $Author$ $Revision$ -->
