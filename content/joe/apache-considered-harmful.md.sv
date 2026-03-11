---
archived: ~
categories: Apache (ort)
dependencies: '*.md.sv'
keywords: apache,httpd,mod_apreq2,libapreq2,mod_perl
published: ~
status: verifierad=28582
title: Apache HTTPd Devs betraktas som skadliga
---

<div class="right">

![tjärat och fjädrat](apache-considered-harmful.page/feather2.png).

</div>

## Bakgrund

Under de senaste 25 åren har jag varit ledande utvecklare av `apreq` delprojekt inom [Apache HTTPd-server](https://httpd.apache.org) Överordnat projekt. Den ursprungliga idén om `libapreq`som säker/presterande [Inskickning av HTML-formulär](https://www.w3.org/TR/2014/REC-html5-20141028/forms.html) och [Cookies](https://datatracker.ietf.org/doc/html/rfc6265) parsning bibliotek, kom ut ur ett samarbete mellan Lincoln Stein och Doug MacEachern i slutet av 90s.

Det var min vision då att omvandla biblioteket till en generisk, icke-Perl-relaterad `C` bibliotek som skulle stödja språkbindningar från andra programmeringsspråk, varför jag pressade för projektet att vara [hemlagad](https://httpd.apache.org/apreq) under paraplyet HTTPd i stället för [Apache-Perl](https://perl.apache.org/) projekt.

Med tillkomsten av `httpd-2. X`Ett helt nytt `I/O-filter` arkitektur uppstod från `httpd` såväl som den fullständiga separationen av `Effektiv ränta` från själva kärnan som en mer allmän POSIX-liknande portabilitetsexekvering för `C` projekt som `Subversion` Faktiskt, `libapreq2` är närmare förbunden med `Apache APR` projektet i den andan, och dess Perl API återspeglar att som en del av dess `APR::Begäran` bygga ut.  Den har ett inbyggt *CGI*-läge för fristående drift, utanför `httpd` körtid, vilket gör enhetstestning en bris.

Den viktigaste komponenten i `apreq2` har alltid varit den `mod_apreq2` Apache-modulen, som först utformades av `Bill Wrowe` I början av 2000s.  Vad han designade, under en brainstorming-session med mig (personligen), var ett enda parserbibliotek internt för `httpd` som **delade** den skickade begäran *text* med varje nyckelintressentmodul i exekveringen.  Det innebar att tillhandahålla parsade data till moduler som är anslutna till bearbetningsmotorn för begäran *före*, *under* och *efter* att innehållshanteraren körs. Och det behövde också fungera för delbegäranden, oavsett om innehållshanteraren konsumerade parsade data eller konsumerade och reparerade själva råbegärans textdel.

Jag förklarade designmålen flera gånger under åren, även under 2012 på [dev@httpd](https://lists.apache.org/list.html?dev@httpd.apache.org:2012-04) Men det var alltid som att prata med vinden med dessa killar; de brydde sig bara aldrig.

## Stormmoln samlas

Även om denna vision var väldigt framgångsrik, med språkbindningar tillgängliga för flera språk som [`Perl`](https://perl.apache.org/) [`Sjukpenning`](https://github.com/php/php-src/blob/master/main/rfc1867.c)  [`TCL`](https://tcl.apache.org/) [`R`](https://github.com/jeffreyhorner/rapache)Sedan 2010 har det varit tragiskt för [befintligt användarforum](https://webtechsurvey.com/technology/mod_apreq2) <a href="#commentAA" class="border border-warning text-muted reference-link" id="commentAA-link" title="{{commentAA.headers.title}}">som består av alla</a>Inte bara medlemmarna i `Perl` samhälle.

Vad hände? [Philip Gollucci](https://projects.apache.org/committee.html?httpd#:~:text=Philip%20M.%20Gollucci) en Perl/FreeBSD kollega till mig vid den tiden, började agitera att vi främjar projektet som ska släppas inifrån HTTPd servern själv. Vad {# lede #}Filip visste inte mycket väl då var hur fullständigt [peevish, vapid och territorialvatten](https://www.mail-archive.com/dev@httpd.apache.org/msg77781.html) Det laget hade blivit{# lede #}Det hade varit nödvändigt att samarbeta med dem direkt. [användarstyrda beslut](https://www.mail-archive.com/dev@httpd.apache.org/msg77806.html) om kodbasen.

2012 fick Philip vad han ville ha och jag slutade motstå, så han [kluven](https://svn.apache.org/viewvc?view=revision&revision=1201372) Det befintliga projektet och kopierade `C` bibliotekskomponenter till HTTPd-kärnan.

Antal förlorade

[År 2018](https://www.mail-archive.com/search?l=modperl@perl.apache.org&q=subject:%22Re%5C%3A+New+release+of+libapreq2%22&o=newest&f=1) Jag avgick från stiftelsen en masse. Du kan gissa orsakerna.

Under 2020 eller så utnyttjade Googles säkerhetsteam en alfautgåva av httpd 2.5 genom att fuzzing sin 8-åriga kopia av `apreq2` De hittade några hotspots som behövde repareras.

I stället för att ha artighet att nå ut till Philip, [Issac Goldstand](https://projects.apache.org/committee.html?httpd#:~:text=Issac%20Goldstand) [Max Kellermann](https://projects.apache.org/committee.html?httpd#:~:text=Max%20Kellermann) (@MaxKellermann), mig själv (@joesuf4), eller någon annan som är involverad i utvecklingen av `libapreq2` en junior ingenjör på HTTPd laget gick om verksamheten "bug fixing" de sårbarheter Google hittade. Du kan se ett register över hans rättegång och felarbete i varje utgåva sedan dess.

Men statskuppen var 2022 års frigivning av [2.17](https://www.google.com/search?q=libapreq2-2.17) där i rookie utvecklare [avsiktligt introducerade en dödlig bugg i kodbasen](https://github.com/apache/apreq/commit/de127ca503ad1d74bcfd8e066cf1eb3882d31891) bryta [Ett nittonårigt regressionstest](http://svn.apache.org/viewvc/httpd/apreq/trunk/library/t/parsers.c?r1=161816&r2=164254&pathrev=1895107).

## Efterskott

Om du undrar hur något med ett trasigt regressionstest hamnar på [CPAN](https://cpan-digger.perlmaven.com/dist/libapreq2)Du måste titta på hur [RELENG](https://httpd.apache.org/dev/release.html) Detta görs i serverprojektet.

Lång historia kort, [De kommenterade provet](https://github.com/apache/apreq/commit/ee43f996710aad757b783ee77382ac4a78169602) och skickade det ändå och kallade det en säkerhetsutgåva som [fixade en sårbarhet varje tidigare utgåva var mottaglig för](https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1018191).

<div class="right">

![Superman logotyp](apache-considered-harmful.page/superman.jpg).

</div>

Varför bryr jag mig nu? För jag är sucker [användare når ut till för svar](https://www.mail-archive.com/dev@httpd.apache.org/msg77426.html) som känd ämnesexpert.

Detta suger, men jag är ledsen att berätta att mina dagar med Superman cape i Apache slutade ungefär ett decennium sedan.

<!-- $Date$ $Author$ $Revision$ -->
