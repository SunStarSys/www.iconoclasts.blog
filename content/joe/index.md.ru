---
categories: ~
dependencies: '*.md.ru'
keywords: heyoka, иконоборчество
status: проверено=42579
title: Случайные мысли Джо
---


<div class="right">

[![Хёка](index.page/me)](https://en.wikipedia.org/wiki/Heyoka)

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

```mermaid
{% filter code:"mermaid"|grep:"mindmap"|slice:0|safe %}
{% ssi `/joe/wikis.md.ru` %}
{% endfilter %}
```

-----

### Песочница: асимптотная векторная графика SSI

```asy
{% filter code:"asy"|slice:0|safe %}
{% ssi `/joe/stochastic-trace-formula.md.en` %}
{% endfilter %}
```

-----

### Песочница: таблица, созданная SSI &mdash; {{table.headers.title}}

| {{table.csv_headers|join:" | "}} |
|---|---|---|---|
{% for row in table.content %}| {{row.r_type|safe}} | {{row.perl_equivalent|safe}} | {{row.pdl_equivalent|safe}} | {{row.notes|safe}} |
{% endfor %}| дополнительное | удовольствие | ниже | линия |

-----

### Песочница: диаграмма русалки wardley-beta

```mermaid
wardley-beta
  title Jamstack Wiki Value Chain
  anchor Business [0.95, 0.35]
  component Cloud Hosting [0.80, 0.80]
  component Agentic AI [0.50, 0.15]
  component Jamstack Wiki [0.60, 0.55]
  component Markdown Editor [0.70, 0.85]
  component Version Control [0.30, 0.45]
  component SSG [0.40, 0.80]
  Business -> Jamstack Wiki
  Agentic AI -> Jamstack Wiki
  Jamstack Wiki -> Cloud Hosting
  Jamstack Wiki -> Markdown Editor
  Version Control -> Jamstack Wiki
  SSG -> Jamstack Wiki
  evolve Version Control 0.80
  evolve Agentic AI 0.55
  note "Standardized Version Control allows Agentic AI to evolve faster" [0.2, 0.49]
```

<!-- $Date$ $Author$ $Revision$ -->
