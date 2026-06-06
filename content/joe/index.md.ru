---
categories: ~
dependencies: '*.md.ru'
keywords: heyoka, иконоборчество
status: проверено=42287
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
{% ssi `/joe/stochastic-trace-formula.md.ru` %}
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
title Tea Shop Value Chain
Якорный бизнес [0.95, 0,63]
component "Чашка чая" [0.79, 0.61]
компонент Чай [0.63, 0.81]
component "Горячая вода" [0.52, 0.80]
компонент Чайник [0.43, 0.35]
Компонент питания [0.10, 0.70]
Бизнес -> "Чашка чая"
"Чашка чая" -> Чай
"Чашка чая" -> "Горячая вода"
"Горячая вода" -> Чайник
Чайник -> Мощность
эволюция Чайник 0.62
эволюция Мощность 0.89
note "Стандартизация мощности позволяет чайникам развиваться быстрее" [0.30, 0.49]
```

<!-- $Date$ $Author$ $Revision$ -->
