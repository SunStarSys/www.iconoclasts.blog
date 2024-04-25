---
archived: ~
categories: Prestanda, Verktyg
dependencies: '*.md.sv'
keywords: ~
published: ~
status: arkiverad
title: Applikationsprestanda
---

{# lede #}Många utvecklare faller i fällan att tänka prestandaoptimering handlar om att göra varje rad av kod så effektiv som möjligt.{# lede #}

Det är faktiskt tvärtom. Du börjar med applikationens arkitektoniska begränsningar och använder dem för att borra ned till den observerade "långsamma" delen av programmet. Den delens **implementering** guidar alla andra prestationsval du behöver göra. Allt som inte är så långsamt som den delen behöver inte optimeras ytterligare. Fokusera istället på det mänskliga uttrycket och implementeringens enkelhet och tydlighet, till icke-expertläsare över mjukvarans "SSDLC", för resten av programmets kod.

Du kan iterera på den här spelboken, men jag har aldrig behövt gå utöver 3 iterationer i min professionella karriär.

Så fortsätt och använd ett elegant programmeringsspråk som `Python3` eller `Javascript`/`Typescript`, och låt ämnesexperterna (**SME**) där ute i öppen källkodsvärlden ge dig kraftfulla `C`/`C++` infödda bindningar för dina speciella behov. Ingenting du gör för affärslogiken kräver högre hastighet än **vilket dynamiskt programmeringsspråk som helst kan ge dig **utanför boxen**.

Även ett beroendefritt bash-skript är en fungerande lösning för många grundläggande uppgifter. Här är en jag skrev för Augmented Reality firm [Magic Leap](https://magicleap.com) år sedan, för att ersätta en klumpig [OpenGrok](https://oracle.github.io/opengrok/) tjänst med något som utnyttjar parallellisering med flera processorer med `xargs -P` och stöder [PCRE](https://www.pcre.org/).

https://github.com/joesuf4/home/blob/wsl/bin/pffxg.sh

Det skriptet är en storleksordning snabbare än de vanliga misstänkta på GitHub, som alla skrevs i statiska, kompilerade programmeringsspråk. Men genom att identifiera den exakta flaskhalsen i `bash` (looping med hög volym `fork+exec`-anrop i mitten), och använda `xargs` istället, får du ett skript som ser mycket ut som den här, med kärnalgoritmen implementerad i 10 rader av `shell`.

Det använder också Open Source Community av **SME** på ett smart sätt, i stället för hur de andra "filtrerade rekursiva grep" implementeringarna på GitHub gjorde. I stället för att internt anta och upprätthålla min egen (trådade) implementering av "find", "xargs" och "grep" återanvänder jag bara de förinstallerade körbara filerna som andra ** SM** har fulländat under årtionden ** i befintligt skick**. Jag behöver inte behärska deras genomförande, bara återanvända deras "CLI". Jag vill inte ens behärska dem, det är deras ** bailiwick. Prestationsdeltas spelar bara roll när de är flera sekunder eller mer, med tanke på applikationens förväntade (mänskliga) användningsfall.

För att se motsatsen, där allt görs internt, helt mikrooptimerat och fortfarande inte kan slå det här skriptet med standardsökalternativen och inget cachningssystem tillgängligt, här är ett bra exempel <https://github.com/BurntSushi/ripgrep>

Bara för att dra den första #performance #benchmark från den sidan och skala upp den från en leksak prov trädstorlek (linux kärna källor), till ett heterogent träd som är `23GB`: (bäst körs efter 3 iterationer; `LANG=en_US.UTF-8`).

```shell
    % du -sh .
    23G .
    % time rg -uuniw '[A-Z]+_SUSPEND' | wc -l
    6259
    rg -uuniw '[A-Z]+_SUSPEND' 9.46s user 16.08s system 261% cpu 9.759 total
    wc -l 0.00s user 0.07s system 0% cpu 9.759 total
    % time pffxg.sh -- -wnE '[A-Z]+_SUSPEND' | wc -l
    5855
    pffxg.sh -- -wnE '[A-Z]+_SUSPEND' 16.66s user 2.68s system 429% cpu 4.501 total
    wc -l 0.00s user 0.00s system 0% cpu 4.501 total
```

Det är ganska dumt att mikrooptimera något som är djupt knutet till tillståndet i kärnans filsystemcache för din sökning. Variationen i prestandatider domineras av åtkomsthastigheten till arkivens innehåll, och det är en storleksordning som är mer relevant än någon annan faktor för slutresultatet. Att vara på en `NVMe` hjälper, men ingenting i detta utrymme slår `RAM` sig själv.

Det är därför att ha en komprimerad cache i minnet för en stor korpus av filer, kommer att stabilisera prestandatiderna. Det är förvånande att ingen annan tyckte att detta var tillräckligt viktigt för att stödja.

Ta den andra #performance #benchmark från den sidan och skala upp den som tidigare (samma `23GB` träd):

```shell
	% time rg -tc -uuuiwn '[A-Z]+_SUSPEND' | wc -l
    5629
    rg -tc -uuuiwn '[A-Z]+_SUSPEND' 3.51s user 1.71s system 1141% cpu 0.457 total
    wc -l 0.00s user 0.05s system 11% cpu 0.457 total
    % time LANG=C pffxg.sh --cache /tmp/pffxg-$USER --workers 32 --cc -- -wE '[A-Z]+_SUSPEND' | wc -l
    5628
    LANG=C pffxg.sh --cache /tmp/pffxg-$USER --workers 32 --cc -- -wE  3.14s user 0.88s system 1055% cpu 0.381 total
    wc -l 0.00s user 0.00s system 0% cpu 0.381 total
```

En inställd `pffxg.sh` är fortfarande snabbare, trots allt arbete som lagts i mikrooptimering ripgrep för denna `C`-fil uppslagning.

Hur jag använde detta manus med [AOSP](https://source.android.com).

.25M LOC mellan `ripgrep` och [ugrep](https://github.com/Genivia/ugrep).

Eftersom det är ett så litet skalprogram kan `pffxg.sh` ge dig kraftfulla krokar i sina inre med nästan noll ansträngning. Till och med kommandot "grep" i sig är anpassningsbart: vilket kommando som helst som du behöver köra på en vald korpus av filer, som kan acceptera en lista med filnamn som läggs till i slutet av dess argument, är rättvist spel. Här är en "total radräkning i `MiLOC` övning på linux kernel git repo:

```shell
	% time find * -type f | xargs wc -l | awk '{ $2 == "total" {a+=$1} END {print a/1024**2}'
    28.451
    find * -type f 0.00s user 0.06s system 2% cpu 2.733 total
    xargs wc -l 0.53s user 1.02s system 54% cpu 2.853 total
    awk '$2 == "total" {a+=$1} END {print a/1024**2}' 0.23s user 0.59s system 28% cpu 2.853 total

    % time pffxg.sh --workers 8 --cmd wc --all -- -l | awk '{$2 == "total" {a+=$1} END {print a/1024**2}'
    28.4506
    pffxg.sh --workers 8 --cmd wc --all -- -l 0.92s user 0.66s system 826% cpu 0.192 total
    awk '$2 == "total" {a+=$1} END {print a/1024**2}' 0.02s user 0.00s system 11% cpu 0.192 total
```

`ripgrep` version:

```shell
	% time rg -c \$ | awk -F : '{a+=$2} END {print a/1024**2}'
    28.4284
    rg -c \$ 2.12s user 2.19s system 276% cpu 1.564 total
    awk -F : '{a+=$2} END {print a/1024**2}' 0.58s user 0.45s system 66% cpu 1.564 total
```

Här är den begränsad till `C`-filer (samma linux träd):

```shell
	% time pffxg.sh --workers 8 --cc --cmd wc -- -l | awk '$2 == "total" {a+=$1} END {print a/1024**2}'
    25.3935
    pffxg.sh --workers 8 --cc --cmd wc -- -l 0.76s user 0.54s system 734% cpu 0.177 total
    awk '$2 == "total" {a+=$1} END {print a/1024**2}' 0.02s user 0.00s system 9% cpu 0.177 total
```

och "ripgrep"-versionen:

```shell
	% time rg -tc -c \$ | awk -F : '{a+=$2} END {print a/1024**2}'
    25.3844
    rg -tc -c \$ 3.49s user 1.54s system 441% cpu 1.140 total
    awk -F : '{a+=$2} END {print a/1024**2}' 0.38s user 0.38s system 66% cpu 1.140 total
```

Real ** Applikationsprestanda** kommer från balans, flexibilitet och funktionell programmeringsteknik; det kommer inte från fixering på imperativ mikrooptimeringstaktik i statiska, kompilerade programmeringsspråk som är en björn att arbeta med från balans- och flexibilitetsperspektivet. Sådana överhypade, imperativa språk är stora mål för mycket specifika problemdomäner, men är hemska för systemomfattande applikationsprestanda.

`pffxg.sh` är inte en produkt, och detta är inte en säljargument för den. Det är ett **exempel** för att illustrera min poäng på ett mycket dramatiskt sätt. Om du är bekant med den långa historien av filtrerade-rekursiva-grep lösningar på GitHub, är de alla baserade på tanken att problemet med Andy Lester ursprungliga "Perl" implementering [ack](https://beyondgrep.com/).

Må tusen blommor blomma, oavsett dumma de verkar!

<!-- $Date$ $Author$ $Revision$ -->
