---
archived: ~
categories: ~
dependencies: /categories/*/index.html.es
keywords: wiki,conocimiento
published: ~
status: publicado
title: De, Por y Para Iconoclastas
---

<div class=" float-lg-end" id="news">
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
	 	<iframe allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen class="embed-responsive-item" frameborder="0" src="https://www.youtube.com/embed/{{elt.key}}" style="max-width:560;max-height:315" title="{{elt.name}}"></iframe>
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

comunidad de blogs! Regístrese hoy en la [Contáctenos](/contact) página durante nuestro lanzamiento promocional!

Además, por favor, echa un vistazo  [Orión](https://www.sunstarsys.com/orion/)<span class="text-success"><img alt="Logotipo de Orion" src="images/sunstar-orion-symbol-linear.png" style="width:60px"><!-- Derived work from Dennis Moskowitz's original CC BySA v4.0 --> &nbsp;<em>La plataforma Wiki de Jamstack.</em></span>&trade; &mdash; Orion es el único producto empresarial basado en SCM con tecnología nativa [mapa de mente de sirena](https://www.sunstarsys.com/orion/features) integración!

&nbsp;

<div class="embed-responsive embed-responsive-16by9" style="min-width:400px">
	 	<iframe allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen class="embed-responsive-item" frameborder="0" src="https://www.youtube.com/embed/f55XLGCs3H0" style="min-width:400px;min-height:275px" title="vídeo"></iframe>
	</div>
	<p style="height:20px">&nbsp;</p>

</div>

&nbsp;

## Blogs destacados

&nbsp;

- <span class="badge bg-success">Nuevo</span> [Réquiem para el colaborador de código abierto voluntario](/jimjag/requiem) en @jimjag,

- [Triple producto de autofunciones y geometría espectral](/joe/triple-products) por @joe=; publicado en SSRN,

- [Rendimiento de aplicaciones](/joe/performance) &mdash; un ejemplo práctico: desde un cuello de botella observable hasta una resolución eficaz,

- [Seguridad de la información](/joe/infosec) &mdash; abstracción de los conceptos básicos conduce a una amplia aplicabilidad y claridad en el mundo real,

- [Léxico sellado para Perl 7](/joe/perl7-sealed-lexicals) &mdash; agregar <span class="text-info">:sealed</span> a una definición de función y disfrutar de la velocidad adicional de las consultas de método de tiempo de compilación para todos sus léxicos escritos,

- [Git y no repudio, revisado](/joe/git-and-non-repudiation) &mdash; ¡Soluciones actualizadas para 2025!

&nbsp;

## Asignaciones de sitio

&nbsp;

- [Inglés](sitemap.html.en)
- [Español](sitemap.html.es)
- [Alemán](sitemap.html.de)
- [Francés](sitemap.html.fr)
- [Portugués](sitemap.html.pt-BR)
- [Ruso](sitemap.html.ru)
- [Chino](sitemap.html.zh-TW)
- [Coreano](sitemap.html.ko)
- [Japonés](sitemap.html.ja)
- [Árabe](sitemsp.html.ar)
- [Hebreo](sitemap.html.he)
- [Sueco](sitemap.html.sv).

&nbsp;

## Índice de categoría

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
