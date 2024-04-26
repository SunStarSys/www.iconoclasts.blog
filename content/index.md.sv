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
US /aÉaËkÉË.nÉ.klæst/
En person som starkt motsätter sig
accepterade övertygelser och traditioner
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

![Ikonoklast]

<div style="max-width:900px">

Välkommen till vår

<center>

**STEM/Akademi/Politik/Kultur/Arter**

</center>

Bloggvärlden! Registrera dig redan idag på [Kontakta oss]

Vänligen kolla in  [Orion](https://www.sunstarsys.com/orion/)<span class="text-success"><img alt="Orions logotyp" src="images/sunstar-orion-symbol-linear.png" style="width:60px"><!-- Derived work from Dennis Moskowitz's original CC BySA v4.0 --> &nbsp;<em>Wikisystemet Enterprise Jamstack.</em></span>&trade; &mdash; Orion är den enda SCM-baserade företagsprodukten med inbyggd [sjöjungfru mindmap]

&nbsp;

<div class="embed-responsive embed-responsive-16by9" style="min-width:400px">
	 	<iframe allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen class="embed-responsive-item" frameborder="0" src="https://www.youtube.com/embed/f55XLGCs3H0" style="min-width:400px;min-height:275px" title="video"></iframe>
	</div>
	<p style="height:20px">&nbsp;</p>

</div>

&nbsp;

## Utvalda bloggar

&nbsp;

- <span class="badge bg-success">Ny</span> [Apache HTTPd Devs ansåg vara skadliga]

- [Trippelprodukter av Eigenfunctions och Spectral Geometry]

- [Applikationsprestanda](/joe/performance) &mdash;

- [Informationssäkerhet](/joe/infosec) &mdash;

- [Förseglade Lexicals för Perl 7](/joe/perl7-sealed-lexicals) &mdash;

- [Rörelsen DevOps](/joe/devops) &mdash;

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

<!-- $Date: 2024-04-22 22:37:23 +0000 (Mon, 22 Apr 2024) $ $Author: joe $ $Revision: 23409 $ -->
