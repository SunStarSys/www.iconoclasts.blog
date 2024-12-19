---
archived: ~
categories: ~
dependencies: /categories/*/index.html.ru
keywords: вики,знание
published: ~
status: опубликовано
title: О, По и Для Иконоборцев
---

<div class=" float-lg-end" id="news">
  <div class="card border-success" style="max-width:25rem;background-color:transparent">
    <div class="card-header"><a href="https://en.wikipedia.org/wiki/Iconoclasm">Иконокласт</a></div>

<div class="card-body">
  <small>
<pre class="card-title">
имя существительное [ C ]   формальный
США /aɪˈkː.nə.klæst/
человек, который в целом выступает против
общепринятые верования и традиции
</pre>


&nbsp;

{% for elt in iconoclasts.content|shuffle|slice:":3" %}
<div class="embed-responsive embed-responsive-16by9">
	 	<iframe allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen class="embed-responsive-item" frameborder="0" src="https://www.youtube.com/embed/{{elt.name}}" style="max-width:560;max-height:315" title="{{elt.key}}"></iframe>
</div>
&nbsp;
{% endfor %}

</div>
</div>

&nbsp;

</div>

![Иконокласт](images/iconoclast.jpg).

<div style="max-width:900px">

Добро пожаловать в наш

<center>

**STEM/Academia/Politics/Culture/Arts**

</center>

Сообщество блогов! Зарегистрируйтесь прямо сейчас [Свяжитесь с нами](/contact).

Также, пожалуйста, проверьте  [Орион](https://www.sunstarsys.com/orion/)<span class="text-success"><img alt="Логотип Orion" src="images/sunstar-orion-symbol-linear.png" style="width:60px"><!-- Derived work from Dennis Moskowitz's original CC BySA v4.0 --> &nbsp;<em>Вики-страница Enterprise Jamstack.</em></span>&trade; &mdash; Orion является единственным корпоративным продуктом на основе управления цепочками поставок с собственным [русалка-карта](https://www.sunstarsys.com/orion/features).

&nbsp;

<div class="embed-responsive embed-responsive-16by9" style="min-width:400px">
	 	<iframe allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen class="embed-responsive-item" frameborder="0" src="https://www.youtube.com/embed/f55XLGCs3H0" style="min-width:400px;min-height:275px" title="видео"></iframe>
	</div>
	<p style="height:20px">&nbsp;</p>

</div>

&nbsp;

## Рекомендуемые блоги

&nbsp;

- <span class="badge bg-success">Создать</span> [Реквием для волонтера с открытым исходным кодом](/jimjag/requiem).

- [Тройные продукты собственных функций и спектральной геометрии](/joe/triple-products).

- [Производительность приложений](/joe/performance) &mdash;

- [Информационная безопасность](/joe/infosec) &mdash;

- [Герметичные лексические для Perl 7](/joe/perl7-sealed-lexicals) &mdash;

- [Движение DevOps](/joe/devops) &mdash;

&nbsp;

## Карты сайта

&nbsp;

- [Британские единицы](sitemap.html.en)
- [Испанский](sitemap.html.es)
- [Немецкий](sitemap.html.de)
- [Французский](sitemap.html.fr)
- [Русский](sitemap.html.ru)
- [Китайский](sitemap.html.zh-TW)
- [иврит](sitemap.html.he)
- [Шведский](sitemap.html.sv).

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

<!-- $Date: 2024-12-19 07:24:31 -0700 (Thu, 19 Dec 2024) $ $Author: joe $ $Revision: 25474 $ -->
