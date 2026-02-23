---
archived: ~
categories: ~
dependencies: /categories/*/index.html.ru
keywords: вики,знание
published: ~
status: опубликовано
title: Для иконоборцев,
---

<div class=" float-lg-end" id="news">
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
	 	<iframe allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen class="embed-responsive-item" frameborder="0" src="https://www.youtube.com/embed/{{elt.key}}" style="max-width:560;max-height:315" title="{{elt.name}}"></iframe>
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

**STEM/Академия/Политика/Культура/Искусство**

</center>

Сообщество блогов! Зарегистрируйтесь сегодня в [Контакты](/contact) страница во время нашего рекламного запуска!

Также, пожалуйста, проверьте  [Орион](https://www.sunstarsys.com/orion/)<span class="text-success"><img alt="Логотип Orion" src="images/sunstar-orion-symbol-linear.png" style="width:60px"><!-- Derived work from Dennis Moskowitz's original CC BySA v4.0 --> &nbsp;<em>Вики-платформа Jamstack.</em></span>&trade; &mdash; Orion – единственный корпоративный продукт на основе SCM с нативными средствами [русалка](https://www.sunstarsys.com/orion/features) интеграция!

&nbsp;

<div class="embed-responsive embed-responsive-16by9" style="min-width:400px">
	 	<iframe allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen class="embed-responsive-item" frameborder="0" src="https://www.youtube.com/embed/f55XLGCs3H0" style="min-width:400px;min-height:275px" title="видео"></iframe>
	</div>
	<p style="height:20px">&nbsp;</p>

</div>

&nbsp;

## Рекомендуемые блоги

&nbsp;

- <span class="badge bg-success">Новое</span> [Реквием для волонтера с открытым исходным кодом](/jimjag/requiem) @jimjag,

- [Тройные продукты собственных функций и спектральной геометрии](/joe/triple-products) по @joe=; опубликовано в SSRN,

- [Производительность приложения](/joe/performance) &mdash; рабочий пример: от наблюдаемого узкого места до эффективного разрешения,

- [Информационная безопасность](/joe/infosec) &mdash; абстрагирование основных понятий приводит к широкой реальной применимости и ясности,

- [Герметичные лексикалы для перла 7](/joe/perl7-sealed-lexicals) &mdash; добавьте <span class="text-info">:sealed</span> в определение функции и наслаждайтесь дополнительной скоростью поиска метода времени компиляции для всех его типизированных лексик,

- [Git и Non-Repudiation, Пересмотрено](/joe/git-and-non-repudiation) &mdash; Решения обновлены на 2025 год!

&nbsp;

## Карта сайта

&nbsp;

- [Британские единицы](sitemap.html.en)
- [Испанский](sitemap.html.es)
- [немецкий](sitemap.html.de)
- [Французский](sitemap.html.fr)
- [Португальский](sitemap.html.pt-BR)
- [Русский](sitemap.html.ru)
- [Китайский](sitemap.html.zh-TW)
- [Корейский](sitemap.html.ko)
- [Японский](sitemap.html.ja)
- [Арабский](sitemsp.html.ar)
- [Иврит](sitemap.html.he)
- [шведский](sitemap.html.sv).

&nbsp;

# индекс категории

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

<!-- $Date: 2026-02-17 21:35:00 -0700 (Tue, 17 Feb 2026) $ $Author: joe $ $Revision: 27812 $ -->
