---
archived: ~
categories: Orion, Arkitektur
dependencies: '*.md.sv'
keywords: arkitektur,inkrementell,webbplats,generering,byggnader, beroenden,topologi,wiki,diagram,smart
published: ~
status: vitbok
title: Vad handlar <em>Smart Content Dependency Management™</em> om?
---

<div class="right">

![träd](https://www.sunstarsys.com/orion/index.page/lightning).

</div>

[TOC]

-----
## Sammandrag

*Beroendehantering för smart innehåll&trade;* handlar om cirkeln av idéer relaterade till att ge stöd och underlättande för *inkrementella byggen *, samtidigt som man håller sig till **Content Normalization Principle **&mdash; det där [*permalänkar*](https://en.wikipedia.org/wiki/Permalink) bör vara den enda sanningskällan, oavsett hur deras innehåll kurateras i hela källträdet och resulterande byggartefakter.

Denna artikel presenterar <https://sunstarsys.com/> webbplats som en fallstudie för demonstration av bästa praxis och analys av tillhörande graftopologier.

-----
## Varningar

Detta betyder bara när du behöver väga kostnaden för att utföra hela webbplatsbyggen varje gång du behöver justera innehållet på en webbsida. Om din webbplats har mindre än 1K källfiler i den, **avslappna**, och läs följande med ett öga mot dina framtida behov. Du valde att använda vår plattform, som'är utformade för att skala med dig, inte mot dig. För de flesta sidor handlar det här materialet nedan om *glesa diagram över innehållsberoende* för webbplatser med fler än 1K-sidor.

Till exempel Apache <https://www.OpenOffice.Org> webbplatsen kunde bygga sina filer på 40K+ med den ursprungliga Apache-versionen av detta byggsystem, med fullt integrerat stöd för inkrementella byggen &mdash; utan några konfigurerade beroenden &mdash; Genom att göra smart användning av traditionell SSI-teknik ensam.

Som standard bygger vårt byggsystem endast de filer du har ändrat, utan problem för de interna filberoendena (om du inte anger dem i `%path::beroenden` &mdash; Mer om detta nedan). Om filen du ändrade finns i `mallar/` eller `lib/` En fullständig webbplatsversion utlöses istället.

-----
## Väv din webbplats's *Beroende diagram* Tillsammans

Matematiskt, en *topologi* `$$\tau$$` är en fullständig specifikation av de *öppna* delmängderna av ett utrymme `$$X$$`, vars syfte är att indikera närhetsrelationerna mellan *punkter* `$$x$$` från rymden `$$X$$`. När `$$X$$` är ett diagram, en *topologi* `$$\tau$$` för `$$X$$` belopp för att ange kanterna som kopplar ihop diagrammets brytpunkter (här visas brytpunkterna* för `$$X$$`, och de anslutande kanterna bestämmer grannskapen för dessa punkter som *basöppningsuppsättningar* för topologin).  En *riktad graf topologi *är i huvudsak samma sak, men innehåller en hänvisning till en topologisk inbäddning av `$$(X,\tau)$$` i ett större topologiskt rum `$$(Y,\sigma)$$` , där inbäddningen's kantanslutningar representeras av riktningskurvor som inte skär varandra (Jordanien).

Det senare konceptet är vad vi kommer att använda när vi diskuterar *beroendegrafen's* topologi `$$\tau$$` associerad med arbetsytan `$$X$$` av källfiler under din webbplats's `innehåll/` underkatalog (här) `$$(Y,\sigma)$$` är `$$\mathbb{R}^n$$` med sin metriska topologi för `$$n \in \{2,3\}$$`och kanterna på `$$X$$` är icke-korsande, riktade jordanska kurvor som ansluter en fil `$$x \in X$$` till sin uppsättning filer som `$$x$$` beror på: `$$\set{x^\prime \in X | x \rightarrow x^\prime}$$`).

Att {# lede #}En tydlig förståelse för din webbplats's *beroendegraf* ser till att du kan maximera prestandan hos vår byggteknik i stor skala{# lede #}. Vi tar den information du lämnar till `%path::beroenden` under bygget's belastning av din webbplats's `lib/path.pm` fil, konstruera en omvänd karta över beroende filer och använd *den omvända kartan* för att fastställa den fullständiga korpus av filer som ska byggas för en given `sv-bekräftelse` Du gör till vårt system.

Det'är viktigt att notera att beroenderelationerna mellan källfiler kan och bör helt fångas av `%path::beroenden` hash under byggsystemet's startladdning av `lib/path.pm` från ditt källträd, vilket är hur de inbyggda vyerna i våra `SunStarSys::Visa` Perl-paketet är tänkt att fungera. Den `walk_content_tree`, `arkiverad`och `seed_file_deps` verktygsfunktioner som kan importeras från `SunStarSys::Tillfälle` är användbara hjälpmedel för att konstruera `%path::beroenden` hash, med inbyggt stöd för att hantera ett beroendecacheminne för att påskynda inkrementella byggen i stor skala.

Här'Den delen av vårt liv [`lib/path.pm`]({{snippetA.pretty_uri}}):

[snippet:lang=perl:repo=SunStarSys/www:branch=trunk:path=lib/path.pm:token=#snippet]

Vänligen gör mull den koden över för idéer om hur du vill *din webbplats* att fungera. Ja, det finns en viss rimlig komplexitet (inklusive både Perl's reguljära uttryck och Perl's UNIX C-skal `glob` gränssnitt, på ett mycket exakt sätt) kring hur `%path::beroenden` är konstruerad i den filen, men istället för att bara titta på detta som optimeringsarbete, titta istället på det som att tillhandahålla de grundläggande ingredienserna som behövs för att konstruera viktiga aspekter av *link topologi *på ett automatiserat, dynamiskt genererat sätt.

Var går in i `%path::beroenden` Ursprung? Om de inte är födda av en åkallan av `walk_content_tree { seed_file_deps ... }`, (som i princip dyker in i dina markdown-källfiler' rubriker och innehåll), då är de bara hårdkodade i `lib/path.pm` vid lastningstid.

### Cykliska beroendediagram är normen

Vår webbplats består för närvarande av `240 källfiler` om `innehåll/`. Här's ett `85 hörn x 465 kanter`, rullningsbar, tvådimensionell dirigerad diagramrepresentation av en aktuell ögonblicksbild av sidberoenden på engelska på **vår webbplats** ([med hjälp av GraphViz's `prick`](https://github.com/SunStarSys/orion/blob/master/deps2dotcfg.pl)):

<div id="deps">

![Beroenden för engelska språk](../images/deps).

</div>

Ganska komplicerat, även för en liten webbplats som denna! Många kantskärningar när du tar `$$n=2$$` (undvikbar i dimension `$$n=3$$`). Särskilt viktigt är kärnuppsättningen av täta, cykliska beroenden i de icke-arkiverade filerna på vår webbplats.'s `/essays/` katalog, mot den nedre mitten-höger av grafen, vilket är vad en bra blogg webbplats'beroendediagrammet ska se ut. Dessa beroenden dras in i `röda kurvor` i bilden.

Notera också den interna, väsentligen isolerade sammankopplingen av elementen i `/kategorier/*/*` och `/archives/2022/11/*`. De enda externa beroendena involverar icke-arkiverat innehåll i `/essays/*`. Detta är genom design &mdash; De arkiverade uppsatserna bör endast ändras *adiabatiskt* kanske enbart för justeringar av deras `Kategori` rubriker. Ingen av dessa förändringar påverkar väsentligt det redan existerande innehållet, så vi't spåra den i `%path::beroenden`.

Självklart vår [Wiki för Orion Enterprise](/orion/) Har aldrig haft problem med att hantera cykliska beroenden.

### Isn'Det här handlar om hyperlänkar.

**Nej!** Faktum är att *länkens topologi* på din webbplats är en helt separat fråga från källträdet's *beroende diagram*.  En sökmotor kommer naturligtvis att illera *link topologi *, men har ingen inblick i *beroende diagram *.

Här's a `240+ hörn x 3859 kanter`, aktuellt diagram med fågelperspektiv i det engelska *link topology*-diagrammet för **vår plats** ([med hjälp av GraphViz's `tvåhörning`](https://github.com/SunStarSys/orion/blob/master/links2dotcfg.pl)):

<div id="links">

![Engelska språklänkar](../images/links).

</div>

Kan du upptäcka `röda kanter` som anges i *beroendekurvan*? Diagrammet *link topology* är kvalitativt och kvantitativt **mycket annorlunda** från (dramatiskt mindre och mindre sammanlänkat) *beroendegraf* som visas ovan.

### Hur SSI-teknik kan hjälpa

#### Traditionell [Server-sidan inkluderar](https://httpd.apache.org/docs/2.4/howto/ssi.html) (SSI).

- **Bra** för beskärning av din webbplats's *beroende diagram* ner till hanterbar storlek utan att offra sidleverans latens
- **Stor** för att minska bortfall av mallobjekt i stora bekräftelsemeddelanden för bättre peer-granskning och övervakning av dina skapade ändringsuppsättningar
- **lousy** för omtexualisering av hela webbsidor till en annan plats i dokumentroten's hierarki

#### Mall-API:er

##### ssi-tagg

Syntax:

&#123;% `ssi` &#96;/content_rooted/path/to/source_file&#96; %&#125;

- banor rotade vid `nöjd` källkatalog
- hoppar över huvuddelen av källfilen som ska `ssi` ingår
- skriver om relativa URL:er till absoluta URL:er i målsökvägen's inkluderat innehåll

##### ssi-filter

Syntax:

&#123;&#123; innehåll|ssi &#125;&#125;

- Recursivt utvärderar `ssi` taggar i värdet som ska filtreras
- användbart för att undvika att använda ett stort värde (3+) av `quick_deps` om `@path::mönster` inträde's argument hashref, vilket kan påverka prestanda

#### Varför inte SymLinks?

- barebones filsystem abstraktion som är svårt att säkert stödja i en `<VirtualHost>` sammanhang kontext
- Samma nackdelar med traditionella `ssi` på hela webbsidor
- våra [Wiki för Orion Enterprise](https://sunstarsys.com/orion/) Systemet stöder dem inte

#### Verktyg för Permalänkar

##### Dokumentkuratering

Orion's build system har integrerat stöd för vad vi kallar *Document Curation*, vilket är processen att retextualisera och omorganisera ditt innehåll baserat på hur du ställer in `Kategorier` och `Arkiv` huvuden i källfilerna för Markdown. Dessa funktioner är avaktiverade som standard, men kan aktiveras genom att en `category_root` (för kategoristöd) eller en `archive_root` (för arkiveringsstöd) i det associerade hashref-argumentet till önskat `@path::mönster` inträde.

##### Kategorier

- nytt innehåll konstrueras med hjälp av mall `ssi` taggar som pekar tillbaka till permalänkens plats, medan borttagning av `Arkiv` sidhuvud från den konstruerade källsidan
- kategorierna är strikt additiva (dvs. att ta bort en kategori från en källsida)'sidhuvuden tar inte bort den från den kategorin på den aktiva webbplatsen),
- genereras på begäran
- Att ta bort alla kategorier i ett enda åtagande är ett bra sätt att synkronisera dem med de exakta specifikationerna på alla källsidor' rubriker, utan att förstöra det bevarade kategoriinnehållet på den aktiva webbplatsen

##### Arkiverade sidor

På vår webbplats arkiverar vi aggressivt inaktuella essäer för att hålla byggtiderna för nya essäer låga, samtidigt som vi inte förstör permalänkar till arkiverade dokument. *beroendegrafen* i förhållande till `/arkiv/` katalogen (för vår webbplats) är rimligt fristående enligt följande regler:

- innehåll konstruerat med hjälp av mall `ssi` taggar som pekar tillbaka till permalänkens plats, medan borttagning av `Kategorier` och `Arkiv` rubriker från den konstruerade källsidan
- innehåll i `/(essays|clients)/` är alltid permalänkar, även efter arkivering
- arkivering tar effektivt bort permalänkens plats från *beroendegrafen*, utan att ta bort permalänken själv från webbplatsen

##### Lede

HTML-kommentarer inbäddade i gränserna för Markdown-prosa-formuläret för lede-innehållet. Vi använder **&#123;Antal ledarnr&#125;** för detta ändamål.

Bearbetningsledningar görs med `ledde` Mallfilter. Det är nyttigt att kombinera detta med `ssi` filter för indexering av en kategorifil med fler än en kategorisida i den.

-----
## Slutsatser

Det finns intressanta datastrukturer och relationer som ännu ska avslöjas när man hanterar en webbplats's *beroendegraf* från ett byggprestandaperspektiv, vilket är ett mycket nyare intresseområde än forskningslitteraturen som fördjupar sig i datastrukturer och tillhörande frågeställningar kring *länktopologi*<sup>1,2</sup>.

Konventionella inkrementella byggen för rena programvaruutvecklingsprojekt är fortfarande ett hett ämne. Den forskning som omfattas av <sup>3,4</sup> publicerades i oktober 2022, ungefär en månad innan denna uppsats förväntas vara klar. Den *pluto*<sup>5</sup> bygga system har funktioner som liknar vår (byggandet själv kan dynamiskt regenerera och bygga om beroenden).

Den goda nyheten är att vi har täckt dig som kund. Vi kommer att hålla dig underrättad om de bästa metoderna och den senaste tekniken inom detta område, så att du kommer att dra nytta av våra lärdomar under det senaste decenniet och in i morgon.

-----
## Fotnoter

1. [Identifiering av kluster i webbdiagrammet baserat på länktopologi](https://ieeexplore.ieee.org/abstract/document/1214919) Sjunde internationella symposiet för databasteknik och tillämpningar, 2003. Förfaranden

2. [Härleda webbforum från länktopologi](https://dl.acm.org/doi/pdf/10.1145/276627.276652) Den nionde ACM-konferensen om hypertext och hypermedia fortsätter: länkar, objekt, tid och rum &mdash; struktur i hypermediasystem: länkar, objekt, tid och utrymme &mdash; struktur i hypermediasystem. 1998.

3. [Om fördelarna och gränserna för inkrementella programvarukonfigurationer för bygge: en undersökande studie](https://dl.acm.org/doi/abs/10.1145/3510003.3510190) ICSE '22: Förfaranden vid den 44:e internationella konferensen om programvaruteknik, maj 2022

4. [Mot inkrementell uppbyggnad av programvarukonfigurationer](https://dl.acm.org/doi/10.1145/3510455.3512792) ICSE-NIER '22: Förfaranden vid ACM/IEEE 44:e internationella konferensen om programvaruteknik: nya idéer och nya resultat, maj 2022

5. [Ett ljud och optimalt inkrementellt byggsystem med dynamiska beroenden](https://dl.acm.org/doi/10.1145/2814270.2814316) OOPSLA 2015: Förfaranden vid ACM SIGPLANs internationella konferens om objektorienterad programmering, system, språk och tillämpningar oktober 2015

<style type="text/css">

#deps {
  width:100%;
  overflow:auto;
  margin-bottom:10px;
  padding-top:0;
  height:1000px;
}

#links {
  width:100%;
  overflow:auto;
  margin-bottom:10px;
  padding-top:0;
  height:1000px;
}

@media only screen and (max-width: 1000px) {
    #links { height: 300px }
}

#links img { width:100% }
</style>

<!-- $Date$ $Author$ $Revision$  $Id$ -->
