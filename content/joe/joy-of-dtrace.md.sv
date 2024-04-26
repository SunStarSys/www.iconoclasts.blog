---
archived: ~
categories: ~
dependencies: '*.md.sv'
keywords: dtrace,solaris,bpftrace,modperl
published: ~
status: skiss
title: Glädjen i DTrace
---

<div style="float:right" class="col-lg-5">
	<div class="embed-responsive embed-responsive-16by9">
	 	<iframe class="embed-responsive-item" style="margin-bottom:20px;max-width:560;max-height:315" src="https://www.youtube.com/embed/SwnZf3j4f1I" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	</div>
</div>

[TOC]

## {# lede #}Mät två gånger, skära en gång innan du påbörjar ett arbete med kodoptimering{# lede #}

Inget gör mätningen enklare än DTrace.

## [Videokällor]({{snippetA.pretty_uri}}).

[snippet:repo=joesuf4/home:path=.zshrc:lines=L253-L255:lang=shell:branch=wsl]

## [Målinriktad optimering]({{snippetB.pretty_uri}}).

Varje `$dtlv` klassmetodanropet nedan görs vid kompileringstid `:Förseglad`

[snippet:repo=SunStarSys/orion:path=lib/Dotiac/DTL/Core.pm:lines=417-503:lang=perl]


<!-- $Date$ $Author$ $Revision$ -->
