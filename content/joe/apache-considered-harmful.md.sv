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

![tjära och fjädrade](apache-considered-harmful.page/feather.png).

</div>

## Bakgrund

Under de senaste 25 åren har jag varit den ledande utvecklaren av underprojektet "apreq" inom [Apache HTTPd Server](https://httpd.apache.org) Överordnat projekt. Den ursprungliga idén om `libapreq`, som en säker/preformant [HTML formulär inlämning](https://www.w3.org/TR/2014/REC-html5-20141028/forms.html) och [Cookie](https://datatracker.ietf.org/doc/html/rfc6265).

Det var min vision då att omvandla biblioteket till ett generiskt, icke-Perl-relaterat "C"-bibliotek som skulle stödja språkbindningar från andra programmeringsspråk, vilket är anledningen till att jag tryckte på för att projektet skulle bli [homed](https://httpd.apache.org/apreq) under paraplyet HTTPd i stället för [Apache-Perl](https://perl.apache.org/).

Med tillkomsten av `httpd-2. X`, en helt ny `I/O Filter` arkitektur uppstod från `httpd` kärna, liksom den fullständiga separationen av `APR` från själva kärnan som en mer allmän POSIX-liknande portabilitet runtime för `C` projekt som `Subversion`. Faktum är att `libapreq2` är närmare anpassad till `Apache APR`-projektet i den andan, och dess Perl API återspeglar det som en del av dess `APR::Request`-utbyggnad.  Den har ett inbyggt *CGI*-läge för fristående drift, utanför "httpd" runtime, vilket gör enhetstestning en bris.

Ändå har nyckelkomponenten i `apreq2` alltid varit `mod_apreq2` Apache-modulen, som först utformades av `Bill Wrowe` i början av 2000-talet.  Vad han designade, under en brainstorming-session med mig (personligen), var ett enda parserbibliotek internt till `httpd`, som ** delade** den inlämnade begäran *kropp* med varje nyckelintressentmodul under körningen.  Det innebar att parsade data tillhandahölls till moduler som kopplats in i begärandebearbetningsmotorn *före*, *under*, och *efter* att innehållshanteraren körs. Och det behövde också fungera för delbegäranden, oavsett om innehållshanteraren konsumerade parsade data eller konsumerade och reparerade själva råförfrågningsenheten.

Jag förklarade designmålen flera gånger under åren, även 2012 på [dev@httpd](https://lists.apache.org/list.html?dev@httpd.apache.org:2012-04).

## Stormmolnsinsamling

Även om denna vision var mycket framgångsrik, med språkbindningar tillgängliga för flera språk som [`Perl`](https://perl.apache.org/), [PHP`](https://github.com/php/php-src/blob/master/main/rfc1867.c),  [`TCL`](https://tcl.apache.org/), [`R`](https://github.com/jeffreyhorner/rapache), etc., sedan omkring 2010 har det visat sig tragiskt för [existerande användarcommunity](https://webtechsurvey.com/technology/smod_apreq2).

Vad hände? [Philip Gollucci](https://projects.apache.org/committee.html?httpd#:~:text=Philip%20M.%20Gollucci), en Perl/FreeBSD kollega till mig vid den tiden, började agitera att vi främjar projektet som ska släppas inifrån HTTPd-servern själv. Vad {{commentAA.headers.title}}Philip visste inte mycket då var hur fullständigt [peevish, vapid och territorial](https://www.mail-archive.com/dev@httpd.apache.org/msg77781.html) Det laget hade blivit{# lede #}, vilket skulle ha inneburit att samarbeta med dem direkt på [användarorienterade beslut](https://www.mail-archive.com/dev@httpd.apache.org/msg77806.html).

År 2012 fick Philip vad han ville och jag slutade motstå, så han [forkade](https://svn.apache.org/viewvc?view=revision&revision=1201372).

## Fallout

[År 2018](https://www.mail-archive.com/search?l=modperl@perl.apache.org&q=subject:%22Re%5C%3A+New+release+of+libapreq2%22&o=newest&f=1).

Under 2020 eller så utnyttjade Googles säkerhetsteam en alfaversion av httpd 2.5 genom att fuzza sin 8-åriga kopia av `apreq2`. De hittade några hotspots som behövde repareras.

I stället för att ha artigheten att nå ut till Philip, [Issac Goldstand](https://projects.apache.org/committee.html?httpd#:~:text=Issac%20Goldstand), [Max Kellermann](https://projects.apache.org/committee.html?httpd#:~:text=Max%20Kellermann).

Men statskuppen var 2022 års release av [2.17](https://www.google.com/search?q=libapreq2-2.17), där rookieutvecklaren [avsiktligt introducerade en dödlig bugg i kodbasen](http://svn.apache.org/viewvc?view=revision&revision=1895107), bryta [ett nittonårigt regressionstest](http://svn.apache.org/viewvc/httpd/apreq/trunk/library/t/parsers.c?r1=161816&r2=164254&pathrev=1895107).

## Efterskott

Om du undrar hur något med ett brutet regressionstest hamnar på [CPAN](https://cpan-digger.perlmaven.com/dist/libapreq2)Du kommer att behöva titta på hur [RELENG](https://httpd.apache.org/dev/release.html).

Lång historia kort, [de kommenterade ut testet](http://svn.apache.org/viewvc?view=revision&revision=1903489) och skickade det ändå, och kallade det en säkerhetsversion som [fixade en sårbarhet varje tidigare utgåva var mottaglig för](https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1018191).

<div class="right">

![Superman logotyp](apache-considered-harmful.page/superman.jpg).

</div>

Varför bryr jag mig nu? Eftersom jag är sucker [användare nå ut till för svar](https://www.mail-archive.com/dev@httpd.apache.org/msg77426.html).

Detta suger, men jag är ledsen att berätta att mina dagar bär Superman cape på Apache slutade ungefär ett decennium sedan.

<!-- $Date$ $Author$ $Revision$ -->
