---
archived: ~
categories: Verktyg
dependencies: '*.md.sv'
keywords: ~
published: ~
status: arkiverad
title: Roligt med htop
---

<div style="float:right" class="col-lg-5">
	<div class="embed-responsive embed-responsive-16by9">
	 	<iframe class="embed-responsive-item" style="margin-bottom:20px;max-width:560;max-height:315" src="https://www.youtube.com/embed/iEUZJ44mldI" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	</div>
</div>


## {# lede #}Avancerade funktioner på populära Unix-plattformar{# lede #}


- Deltas från `top`

	- sofistikerade interaktiva beteenden
	- tematiska, ** semantiska** färgscheman
	- fungerar på POSIX-trådnivå, inte bara fullständiga processer


- Funktioner

	- anpassa visning `C`
	- sök `/` eller filtrera `\` lätta processer (LWP, aka pthreads) efter namn
	- filtrera LWP efter användarnamn `u`
	- växla trädvyn `t`
	- per LWP-kommandon
		- `s` systemspår
		- `l` lista över öppna fildeskriptorer
		- `e` miljövariabler
		- `k` skicka en signal med döda

### Linux

OOTB:s fullt fungerande funktionsuppsättning.

### OSX-port

- Aktivera DTrace (kräver [starta i återställningsläge för att inaktivera SIP](https://apple.stackexchange.com/questions/208762/now-that-el-capitan-is-rootless-is-there-any-way-to-get-dtrace-working))
- kopia [dtruss-htop](https://github.com/joesuf4/home/blob/master/bin/dtruss-htop).

### [Solaris 11](https://github.com/joesuf4/htop/tree/solaris-stable).

- ZFS ARC-statistik
- Kolumner för zonnamn/ID
Solaris LWP Bokföring Deltas
	- två nivåer PID + LWPID
	- tillhandahåller inte fullständiga kommandoargument, bara kommandonamn

<!-- $Date$ $Author$ -->
