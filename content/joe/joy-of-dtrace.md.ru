---
categories: ~
dependencies: '*.md.ru'
keywords: dtrace,olaris,bpftrace,modperl
status: архивированный
title: Радость DTrace
---

<div style="float:right" class="col-lg-5">
	<div class="embed-responsive embed-responsive-16by9">
	 	<iframe class="embed-responsive-item" style="margin-bottom:20px;max-width:560;max-height:315" src="https://www.youtube.com/embed/SwnZf3j4f1I" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	</div>
</div>

[TOC]#sidebar

## {# lede #}Измеряйте дважды, вырезайте один раз, прежде чем приступить к оптимизации кода{# lede #}.

Ничто не упрощает измерение продукта, чем DTrace.

## [Источники видео]({{snippetA.pretty_uri}})

[snippet:repo=joesuf4/home:path=.zshrc:lines=L298-L300:lang=shell:branch=wsl]

## [Целевая оптимизация]({{snippetB.pretty_uri}})

Каждый `$dtlv` class-method-call ниже выполняется во время компиляции по `:Sealed`:

[snippet:repo=SunStarSys/orion:path=lib/Dotiac/DTL/Core.pm:lines=417-503:lang=perl]

<!-- $Date$ $Author$ $Revision$ -->
