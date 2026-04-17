---
archived: ~
categories: ~
dependencies: /categories/*/index.html.es
keywords: wiki,conocimiento
published: ~
status: publicado
title: De, Por y Para Iconoclastas
---

<div id="news" class=" float-lg right">
  <div class="card border-success" style="max-width:25rem;background-color:transparent">
    <div class="card-header"><a href="https://en.wikipedia.org/wiki/Iconoclasm">Iconoclast</a></div>

<div class="card-body">
<small>
<pre class="card-title">
sustantivo [ C ]   formal
EE.UU.  /aɪˈkɑː.nə.klæst/
una persona que se opone en general
creencias y tradiciones aceptadas
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

![Iconoclast](images/iconoclast.jpg).

<div style="max-width:900px">

Bienvenido a nuestro

<center>

**STEM/Academia/Política/Cultura/Artes**

</center>

comunidad de blogs! Regístrese hoy en la [Contáctenos](/contact) página!

## Categorías provisionales de escritura para 2026 Q2

- April: Guerra
- May: IA
- June: COVID

&nbsp;

Este sitio está alojado en Orion. Bloquear  [Orión](https://www.sunstarsys.com/orion/)<span class="text-success"><img alt="Orion logo" style="width:60px" src="images/sunstar-orion-symbol-linear.png"><!-- Derived work from Dennis Moskowitz's CC original BySA v4.0 --> &nbsp;<em>La plataforma Wiki de Jamstack.</em></span>&trade; &mdash; Orion es la única wiki empresarial basada en SCM con nativo [mapa de mente de sirena](https://www.sunstarsys.com/orion/features) integración!

&nbsp;

<div class="embed-responsive embed-responsive-16by9" style="min-width:400px">
	 	<iframe title="video" class="embed-responsive-item" style="min-width:400px;min-height:275px" src="https://www.youtube.com/embed/f55XLGCs3H0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	</div>
	<p style="height:20px">&nbsp;</p>

</div>

&nbsp;

## Blogs destacados

&nbsp;

- <span class="badge bg-success">Nuevo</span> [Perl como lenguaje de ciencia de datos](chrisarg/perlasadatascilang) por @chrisarg=,

- [Wikis en Sistemas de Gestión del Conocimiento](/joe/wikis) por @joe=,

- [Réquiem para el colaborador de código abierto voluntario](/jimjag/requiem) por @jimjag=,

- [Triple producto de autofunciones y geometría espectral](/joe/triple-products) por @joe=; publicado en SSRN,

- [Léxico sellado para Perl 7](/joe/perl7-sealed-lexicals) &mdash; agregar <span class="text-info">:sellado</span> a una definición de función y disfrute de la velocidad adicional de las consultas de método de tiempo de compilación para todos sus léxicos mecanografiados.

&nbsp;

## Asignaciones de sitios

&nbsp;

- [Inglés](sitemap.html.en)
- [Español](sitemap.html.es)
- [Alemán](sitemap.html.de)
- [Francés](sitemap.html.fr)
- [Ruso](sitemap.html.ru)
- [Chino](sitemap.html.zh-TW)
- [Coreano](sitemap.html.ko)
- [Japonés](sitemap.html.ja)
- [Hebreo](sitemap.html.he)
- [Árabe](sitemap.html.ar)
- [Sueco](sitemap.html.sv)
- [Portugués brasileño](sitemap.html.pt-BR).

&nbsp;

## Índice de categorías

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
