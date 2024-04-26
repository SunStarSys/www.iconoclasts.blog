---
archived: ~
categories: ~
dependencies: '*.md.es'
keywords: dtrace,solaris,bpftrace,modperl
published: ~
status: borrador
title: La alegría de DTrace
---

<div style="float:right" class="col-lg-5">
	<div class="embed-responsive embed-responsive-16by9">
	 	<iframe class="embed-responsive-item" style="margin-bottom:20px;max-width:560;max-height:315" src="https://www.youtube.com/embed/SwnZf3j4f1I" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	</div>
</div>

[TOC]

## {# lede #}Medir dos veces, cortar una vez, antes de embarcarse en un esfuerzo de optimización de código{# lede #}

Nada facilita la medición del producto que DTrace.

## [Fuentes de vídeo]({{snippetA.pretty_uri}}).

[snippet:repo=joesuf4/home:path=.zshrc:lines=L253-L255:lang=shell:branch=wsl]

## [Optimización dirigida]({{snippetB.pretty_uri}}).

Cada `$vdt` class-method-call a continuación se realiza en tiempo de compilación `:Sellado`

[snippet:repo=SunStarSys/orion:path=lib/Dotiac/DTL/Core.pm:lines=417-503:lang=perl]


<!-- $Date: 2024-04-17 15:47:19 +0000 (Wed, 17 Apr 2024) $ $Author: joe $ $Revision: 22360 $ -->
