---
archived: ~
categories: ~
dependencies: /categories/*/index.html.ru
keywords: вики,знание
published: ~
status: опубликовано
title: Для иконоборцев,
---

<div id="news" class=" float-lg right">
  <div class="card border-success" style="max-width:25rem;background-color:transparent">
    <div class="card-header"><a href="https://en.wikipedia.org/wiki/Iconoclasm">Иконоборчество</a></div>

<div class="card-body">
<small>
<pre class="card-title">
имя существительное [ C ]   форма
США /aɪˈkː.nə.klæst/
человек, который выступает против
принятые верования и традиции
</pre>
</small>

&nbsp;

{% for elt in iconoclasts.content|shuffle|slice:":3" %}
<div class="embed-responsive embed-responsive-16by9">
	 	<iframe class="embed-responsive-item" style="max-width:560;max-height:315" src="https://www.youtube.com/embed/{{elt.key}}" title="{{elt.name}}" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</div>
&nbsp;
{% endfor %}

</div>
</div>

&nbsp;

</div>

![Иконоборчество](images/iconoclast.jpg).

<div style="max-width:900px">

Добро пожаловать в наш

<center>

**STEM / Академия / Политика / Культура / Искусство**

</center>

Сообщество блогов! Зарегистрируйтесь сегодня в [Контакты](/contact) страница!

## Предварительные категории письма на 2026 год Q2

- April: Война
- May: ИИ
- June: COVID

&nbsp;

Этот сайт размещен на Orion. Изъять  [Орион](https://www.sunstarsys.com/orion/)<span class="text-success"><img alt="Orion logo" style="width:60px" src="images/sunstar-orion-symbol-linear.png"><!-- Derived work from Dennis Moskowitz's оригинал CC BySA v4.0 --> &nbsp;<em>Платформа Jamstack Wiki.</em></span>&trade; &mdash; Orion – единственная корпоративная вики-страница на основе SCM с нативным [русалка](https://www.sunstarsys.com/orion/features) интеграция!

&nbsp;

<div class="embed-responsive embed-responsive-16by9" style="min-width:400px">
	 	<iframe title="video" class="embed-responsive-item" style="min-width:400px;min-height:275px" src="https://www.youtube.com/embed/f55XLGCs3H0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	</div>
	<p style="height:20px">&nbsp;</p>

</div>

&nbsp;

## Рекомендуемые блоги

&nbsp;

- <span class="badge bg-success">Новый</span> [Перл как язык науки о данных](chrisarg/perlasadatascilang) по @chrisarg=,

- [Википедия:Системы управления знаниями](/joe/wikis) по @joe=,

- [Реквием для волонтера с открытым исходным кодом](/jimjag/requiem) по @jimjag=,

- [Тройные продукты собственных функций и спектральной геометрии](/joe/triple-products) по @joe=; опубликовано в SSRN,

- [Герметичные лексикалы для перла 7](/joe/perl7-sealed-lexicals) &mdash; прибавить <span class="text-info">:запечатанный</span> для определения функции и наслаждайтесь дополнительной скоростью поиска метода компиляции времени для всех его типизированных лексикалов.

&nbsp;

## Карта сайта

&nbsp;

- [Британские единицы](sitemap.html.en)
- [Испанский](sitemap.html.es)
- [немецкий](sitemap.html.de)
- [Французский](sitemap.html.fr)
- [Русский](sitemap.html.ru)
- [Китайский](sitemap.html.zh-TW)
- [Корейский](sitemap.html.ko)
- [Иврит](sitemap.html.he)
- [Арабский](sitemap.html.ar)
- [шведский](sitemap.html.sv)
- [Португальский (Бразилия)](sitemap.html.pt-BR).

&nbsp;

## Индекс категории

&nbsp;

<div style="text-align:justify">
{% for d in deps|dictsort:0 %}<button type="button" class="btn btn-success"><a href="{{d.0}}">{{d.0|dirname|basename}}</a></button> {% endfor %}
</div>

<style type="text/css">
h2 { font-size: 18px }

button.btn a {
    color:#fff;
}
div.jumbotron button.btn {
    margin-bottom:5px;
}

/*-------------------------------------------
	Animations
-------------------------------------------*/
@-webkit-keyframes FADEY {
  0%   { opacity: 0; }
  100% { opacity: 1; }
}

@keyframes news {
  0% {
    left: 1000px;
	top: 1000px;
	position:relative;
  }

100% {top: 5px;position:relative}

}

#news {
	animation: news;
    animation-duration: 2s;
    animation-timing-function: ease-out;
}

.theme-showcase {
	-webkit-animation-name: FADEY;
	-webkit-animation-duration: 1s;
	-webkit-animation-timing-function: ease-in-out;
	-webkit-animation-iteration-count: 1;
}
</style>

<!-- $Date$ $Author$ $Revision$ -->
