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


- Deltavärden från `överst`

	- sofistikerade interaktiva beteenden
	- tematiska, ** semantiska** färgscheman



- Funktioner

	- anpassa display `C`
	- sök `/` eller filtrera `\` lätta processer (LWP, även kallade pthreads) efter namn
	- filtrera LWP efter användarnamn `du`
	- växla `tt` trädvy
	- per LWP-kommandon
		- `ss` systemspårning
		- `l` lista över öppna fildeskriptorer
		- `e` miljövariabler
		- `kull`

### Linux

OOTB:s fullt fungerande funktionsuppsättning.

### OSX-port

- Aktivera DTrace (kräver [starta i återställningsläge för att inaktivera SIP](https://apple.stackexchange.com/questions/208762/now-that-el-capitan-is-rootless-is-there-any-way-to-get-dtrace-working))
- kopia [dtruss](https://github.com/joesuf4/home/blob/master/bin/dtruss-htop) till `~/bin` och kör för att skapa `stjärt` symbolisk länk
- lansering `htop`

### [Solis 11]

- ZFS ARC-statistik
- Kolumner för zonnamn/ID
Solaris LWP Bokföring Deltas
	- två nivåer PID + LWPID


<!-- $Date$ $Author$ -->
