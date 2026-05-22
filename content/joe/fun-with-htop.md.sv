---
categories: Verktyg
dependencies: '*.md.sv'
keywords: ~
status: arkiverad
title: Kul med htop
---

<div style="float:right" class="col-lg-5">
	<div class="embed-responsive embed-responsive-16by9">
	 	<iframe class="embed-responsive-item" style="margin-bottom:20px;max-width:560;max-height:315" src="https://www.youtube.com/embed/iEUZJ44mldI" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	</div>
</div>

## {# lede #}Avancerade toppfunktioner på populära Unix-plattformar{# lede #}

- Deltas från `top`

- sofistikerade interaktiva beteenden
	- tematiska, **semantiska** färgscheman
	- fungerar på POSIX-trådnivå, inte bara fullständiga processer

- Funktioner

- anpassa displayen `C`
	- sök `/` eller filtrera `\` lättviktsprocesser (LWP, även kallad pthreads) efter namn
	- filtrera LWP efter användarnamn `u`
	- växla `t` trädvy
	- kommandon per LWP
		- `s` systemspårning
		- `l` lista över öppna fildeskriptorer
		- `e` miljövariabler
		- `k` Skicka en signal med kill

### Linux

Fullständig funktionsuppsättning för OOTB.

### OSX-port

- Aktivera DTrace (kräver [starta i återställningsläge för att inaktivera SIP](https://apple.stackexchange.com/questions/208762/now-that-el-capitan-is-rootless-is-there-any-way-to-get-dtrace-working))
- kopiera [dtruss-htop](https://github.com/joesuf4/home/blob/master/bin/dtruss-htop) till `~/bin` och kör för att skapa `strace` symbolisk länk
- lansering `htop` som rot

### [Solglasögon 11](https://github.com/joesuf4/htop/tree/solaris-stable) / FreeBSD Portar

- Statistik för ZFS ARC
- Zonnamn/ID-kolumner
- Solaris LWP Redovisningsdeltaganden
	- PID på två nivåer + LWPID
	- ger inte fullständiga kommandoargument, bara kommandonamn

<!-- $Date$ $Author$ -->

<!-- $Date$ $Author$ $Revision$ -->
