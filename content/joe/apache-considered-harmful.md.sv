---
archived: ~
categories: Apache, Perl
dependencies: '*.md.sv'
keywords: apache,httpd,mod_apreq2,libapreq2,mod_perl
published: ~
status: skiss
title: Apache HTTPd Devs ansåg vara skadliga
---

<div class="right">

![tjärad och fjädrad](apache-considered-harmful.page/feather.png).

</div>

## Bakgrund

Under de senaste 25 åren har jag varit den ledande utvecklaren av `apreq` delprojekt inom [Apache HTTPd-server](https://httpd.apache.org) Överordnat projekt. Den ursprungliga idén om `libapreq`som säker/presterande [Skicka HTML-formulär](https://www.w3.org/TR/2014/REC-html5-20141028/forms.html) och [Cookie](https://datatracker.ietf.org/doc/html/rfc6265).

Det var min vision då att omvandla biblioteket till en generisk, icke-Perl relaterad `C` bibliotek som skulle stödja språkbindningar från andra programmeringsspråk, vilket är anledningen till att jag tryckte på för projektet att vara [hemmagjord](https://httpd.apache.org/apreq) under paraplyet HTTPd i stället för [Apache-Perl](https://perl.apache.org/).

Med tillkomsten av `httpd-2 X`Ett helt nytt `I/O-filter` Arkitekturen kom från `httpd` Kärnan, liksom den fullständiga separationen av `Effektiv ränta` från själva kärnan som en mer allmän POSIX-liknande portabilitetskörning för `C` projekt som `Subversion`. Faktiskt, `libapreq2` är närmare i linje med `Apache, effektiv ränta` projektet i den andan, och dess Perl API återspeglar att som en del av dess `APR::Begäran` Utbyggnad.  Den har ett inbyggt *CGI*-läge för fristående drift, utanför `httpd`

Men den viktigaste komponenten i `apreq2` har alltid varit `mod_apreq2` Apache-modulen, som först skapades av `Bill Wrowe` i början av 2000-talet.  Vad han designade under en brainstorming session med mig (personligen) var ett enda parserbibliotek internt till `httpd`

Jag förklarade designmålen flera gånger under åren, även i 2012 på [utveckling@httpd](https://lists.apache.org/list.html?dev@httpd.apache.org:2012-04).

## Stormmolnsinsamling

Även om denna vision var mycket framgångsrik, med språkbindningar tillgängliga för flera språk som [`Perl`](https://perl.apache.org/), [`Sjukpenning`](https://github.com/php/php-src/blob/master/main/rfc1867.c),  [`TCL`](https://tcl.apache.org/), [`R`](https://github.com/jeffreyhorner/rapache)Sedan 2010 har det varit tragiskt för [befintlig användargrupp](https://webtechsurvey.com/technology/smod_apreq2) <a class="border border-warning text-muted reference-link" href="#commentAA" id="commentAA-link" title="{{commentAA.headers.title}}">består av alla</a>, inte bara medlemmarna i `Perl`

Vad hände? [Philip Gollucci](https://projects.apache.org/committee.html?httpd#:~:text=Philip%20M.%20Gollucci), en Perl/FreeBSD kollega till mig vid den tiden, började agitera att vi främjar projektet som ska släppas inifrån HTTPd-servern själv. Vad {# lede #}Philip visste inte mycket då var hur fullständigt [peevish, vapid och territorial](https://www.mail-archive.com/dev@httpd.apache.org/msg77781.html) Det laget hade blivit{# lede #}vilket skulle ha inneburit att samarbeta med dem direkt på [beslut riktade till användare](https://www.mail-archive.com/dev@httpd.apache.org/msg77806.html).

År 2012 fick Philip vad han ville och jag slutade motstå, så han [klädd](https://svn.apache.org/viewvc?view=revision&revision=1201372) det befintliga projektet och kopierade `C`

## Fallout

[År 2018](https://www.mail-archive.com/search?l=modperl@perl.apache.org&q=subject:%22Re%5C%3A+New+release+of+libapreq2%22&o=newest&f=1).

Under 2020 eller så, Googles säkerhetsteam utnyttjade en alfa release av httpd 2.5 genom att fuzzing sin 8 år gamla kopia av `apreq2`

I stället för att ha artigheten att nå ut till Philip, [Issac Goldstand](https://projects.apache.org/committee.html?httpd#:~:text=Issac%20Goldstand), [Max Kellermann](https://projects.apache.org/committee.html?httpd#:~:text=Max%20Kellermann) (@MaxKellermann), mig själv (@joesuf4), eller någon annan som är involverad i utvecklingen av `libapreq2`

Men coup de grace var 2022 års frigivning av [2.17](https://www.google.com/search?q=libapreq2-2.17)där rookieutvecklaren [avsiktligt infört en dödlig bugg i kodbasen](http://svn.apache.org/viewvc?view=revision&revision=1895107), bryta [ett nittonårigt regressionstest](http://svn.apache.org/viewvc/httpd/apreq/trunk/library/t/parsers.c?r1=161816&r2=164254&pathrev=1895107).

## Efterskott

Om du undrar hur något med ett brutet regressionstest hamnar på [CPAN](https://cpan-digger.perlmaven.com/dist/libapreq2)Du måste titta på hur [KOPPLA OM](https://httpd.apache.org/dev/release.html).

Lång historia kort, [De kommenterade testet](http://svn.apache.org/viewvc?view=revision&revision=1903489) och skickade det ändå och kallade det en säkerhetsversion som [åtgärdade en sårbarhet varje tidigare utgåva var mottaglig för](https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1018191).

<div class="right">

![Superman-logotyp](apache-considered-harmful.page/superman.jpg).

</div>

Varför bryr jag mig nu? För jag är sucker [användare når ut till för svar](https://www.mail-archive.com/dev@httpd.apache.org/msg77426.html).

Detta suger, men jag är ledsen att berätta att mina dagar bär Superman cape på Apache slutade ungefär ett decennium sedan.

<!-- $Date$ $Author$ $Revision$ -->
