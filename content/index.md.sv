---
archived: ~
categories: ~
dependencies: /categories/*/index.html.sv
keywords: wiki,kunskap
published: ~
status: publicerad
title: Av, Av och För Iconoclasts
---

<div class=" float-lg-end" id="news">
  <div class="card border-success" style="max-width:25rem;background-color:transparent">
    <div class="card-header"><a href="https://en.wikipedia.org/wiki/Iconoclasm">Ikonoklast</a></div>

<div class="card-body">
<small>
<pre class="card-title">
substantiv [ C ]   formell
Förenta staterna /aɪˈkː.nə.klæst/
en person som starkt motsätter sig i allmänhet
accepterade övertygelser och traditioner
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

![Ikonoklast](images/iconoclast.jpg).

<div style="max-width:900px">

Välkommen till vår

<center>

**STEM/Akademi/Politik/Kultur/Arter**

</center>

Bloggvärlden! Anmäl dig idag på [Kontakta oss](/contact) sida under vår kampanjlansering!

Också, vänligen kolla in  [Orion](https://www.sunstarsys.com/orion/)<span class="text-success"><img alt="Logotyp för Orion" src="images/sunstar-orion-symbol-linear.png" style="width:60px"><!-- Derived work from Dennis Moskowitz's original CC BySA v4.0 --> &nbsp;<em>Wiki-plattformen Jamstack.</em></span>&trade; &mdash; Orion är den enda SCM-baserade företagsprodukten med inbyggd [sjöjungfru-mindmap](https://www.sunstarsys.com/orion/features) integration!

&nbsp;

<div class="embed-responsive embed-responsive-16by9" style="min-width:400px">
	 	<iframe allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen class="embed-responsive-item" frameborder="0" src="https://www.youtube.com/embed/f55XLGCs3H0" style="min-width:400px;min-height:275px" title="video"></iframe>
	</div>
	<p style="height:20px">&nbsp;</p>

</div>

&nbsp;

## Utvalda bloggar

&nbsp;

- <span class="badge bg-success">Nytt</span> [Wikis i kunskapshanteringssystem](/joe/wikis) av @joe=,

- [Requiem för volontärens bidragare av öppen källkod](/jimjag/requiem) av @jimjag=,

- [Trippelprodukter av Eigenfunktioner och spektral geometri](/joe/triple-products) av @joe=; publicerad på SSRN,

- [Applikationsprestanda](/joe/performance) &mdash; Ett fungerande exempel: från en observerbar flaskhals till en effektiv lösning.

- [Informationssäkerhet](/joe/infosec) &mdash; abstraktion av de grundläggande begreppen leder till bred verklig tillämplighet och klarhet,

- [Förseglade Lexicals för Perl 7](/joe/perl7-sealed-lexicals) &mdash; lägg till <span class="text-info">:förseglad</span> i en funktionsdefinition och njut av extra snabbheten i uppslagningar av kompileringsmetoder för alla typangivna lexikaler.

- [Git och Non-repudiation, Revisited](/joe/git-and-non-repudiation) &mdash; lösningar uppdaterade för 2025!

&nbsp;

Antal webbplatskartor

&nbsp;

- [Engelska](sitemap.html.en)
- [Spanska](sitemap.html.es)
- [Tyska](sitemap.html.de)
- [Franska](sitemap.html.fr)
- [Portugisiska](sitemap.html.pt-BR)
- [Ryska](sitemap.html.ru)
- [kinesiska](sitemap.html.zh-TW)
- [Koreanska](sitemap.html.ko)
- [Japanska](sitemap.html.ja)
- [arabiska](sitemsp.html.ar)
- [Hebreiska](sitemap.html.he)
- [Svenska](sitemap.html.sv).

&nbsp;

## Kategoriindex

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

<!-- $Date: 2026-02-23 10:19:48 -0700 (Mon, 23 Feb 2026) $ $Author: joe $ $Revision: 27928 $ -->
