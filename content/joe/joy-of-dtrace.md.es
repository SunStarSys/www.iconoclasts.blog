---
categories: ~
dependencies: '*.md.es'
keywords: dtrace,solaris,bpftrace,modperl
status: archivado
title: La alegría de DTrace
---

<div style="float:right" class="col-lg-5">
	<div class="embed-responsive embed-responsive-16by9">
	 	<iframe class="embed-responsive-item" style="margin-bottom:20px;max-width:560;max-height:315" src="https://www.youtube.com/embed/SwnZf3j4f1I" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	</div>
</div>

[TOC]#sidebar

## {# lede #}Medir dos veces, cortar una vez, antes de embarcarse en un esfuerzo de optimización de código{# lede #}.

Nada facilita la medición del producto que DTrace.

## [Fuentes de vídeo]({{snippetA.pretty_uri}})

[snippet:repo=joesuf4/home:path=.zshrc:lines=L298-L300:lang=shell:branch=wsl]

## [Optimización dirigida]({{snippetB.pretty_uri}})

Cada `$dtlv` class-method-call a continuación se realiza en tiempo de compilación por `:Sealed`:

[snippet:repo=SunStarSys/orion:path=lib/Dotiac/DTL/Core.pm:lines=417-503:lang=perl]

<!-- $Date$ $Author$ $Revision$ -->
