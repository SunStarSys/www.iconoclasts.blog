---
archived: ~
keywords: dtrace,solaris,bpftrace,modperl
dependencies: '*.md.ru'
status: черновик
published: ~
categories: ~
title: Радость DTrace
---

<div style="float:right" class="col-lg-5">
	<div class="embed-responsive embed-responsive-16by9">
	 	<iframe class="embed-responsive-item" style="margin-bottom:20px;max-width:560;max-height:315" src="https://www.youtube.com/embed/SwnZf3j4f1I" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	</div>
</div>

[Оглавление]

## {# lede #}Измеряйте дважды, сокращайте один раз, прежде чем приступить к оптимизации кода{# lede #}

Ничто не облегчает измерение продукта, чем DTrace.

## [Источники видео]({{snippetA.pretty_uri}}).

[snippet:repo=joesuf4/home:path=.zshrc:lines=L253-L255:lang=shell:branch=wsl]

## [Целевая оптимизация]({{snippetB.pretty_uri}}).

Каждый приведенный ниже вызов class-method-call `$dtlv` выполняется во время компиляции с помощью `:Sealed`:

[snippet:repo=SunStarSys/orion:path=lib/Dotiac/DTL/Core.pm:lines=417-503:lang=perl]


<!-- $Date$ $Author$ $Revision$ -->
