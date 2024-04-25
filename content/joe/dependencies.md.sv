---
archived: ~
categories: Orion, Arkitektur
dependencies: '*.md.sv'
keywords: arkitektur,inkrementell,webbplats,generering,byggen,beroenden,topologi,wiki,graf,smart
published: ~
status: verifierad=22163
title: Vad handlar <em>Smart Content Dependency ManagementTM</em> om?
---

[TOC]

## Sammandrag

* Hantering av beroenden för smart innehåll&trade;* handlar om cirkeln av idéer relaterade till att ge stöd och underlättande för *inkrementella byggen*, samtidigt som man håller sig till **Innehållsnormaliseringsprincipen** &mdash; som [*permalinks*](https://en.wikipedia.org/wiki/Permalink).

I den här artikeln presenteras webbplatsen för <https://sunstarsys.com/> som en fallstudie för en <a href="#commentAB" class="border border-warning text-muted reference-link" id="commentAB-link" title="{{commentAB.headers.title}}">demonstration</a> av praxis och analyser av associerade diagramtopologier.

Antal förbehåll

Det här är bara viktigt när du behöver väga kostnaden för att utföra fullständiga webbplatsbyggen varje gång du behöver justera innehållet på en webbsida. Om din webbplats innehåller mindre än 1K-källfiler **avslappnar** och läs följande med ett öga på dina framtida behov. Du valde att använda vår plattform, som är utformad för att skala med dig, inte mot dig. För de flesta sidor handlar det här materialet nedan om *glesa innehållsberoendediagram* för webbplatser med mer än 1K-sidor.

Webbplatsen Apache <https://www.OpenOffice.Org> kunde till exempel bygga sina 40K+-filer med den ursprungliga Apache-versionen av det här byggsystemet, med fullt integrerat stöd för inkrementella byggen. &mdash; utan konfigurerade beroenden &mdash;

Som standard bygger vårt byggsystem endast de filer du ändrade, utan problem för beroenden inom filen (om du inte anger dem i `%path::dependencies` &mdash;

## Weaving Your Website's *Dependency Graph * Tillsammans

Matematiskt, en *Topologi* `$$\tau$$` är en fullständig specifikation av *öppna* delmängder av ett utrymme `$$X$$`, vars syfte är att ange närhetsrelationerna mellan *punkter* `$$x$$` av utrymmet `$$X$$`.  När `$$X$$` är ett diagram, en *topologi* `$$\tau$$` för `$$X$$`mängden anger kanterna som förbinder diagrammets brytpunkter tillsammans (här ses brytpunkter som *punkter* av `$$X$$", och de anslutande kanterna bestämmer stadsdelarna av dessa punkter som *bas öppna uppsättningar * för topologin."  En *riktad graftopologi* är i huvudsak samma sak, men innehåller en hänvisning till en topologisk inbäddning av `$$(X,\tau)$$` till ett större topologiskt utrymme `$$(Y,\sigma)$$

Det senare konceptet är vad vi kommer att använda när vi diskuterar *beroende diagrammets * topologi `$$\tau$$` associerad till utrymmet `$$X$$` av källfiler under webbplatsens `innehåll/` underkatalog (här `$$(Y,\sigma)$$` är `$$\mathbb{R}^n$$` med sin metriska topologi för `$$n \in \{2,3\}$$`, och kanterna av `$$X$$` är icke-korsande, riktade jordanska kurvor som ansluter en fil `$$x \in X$$till sin uppsättning filer på vilka$$x$$` beror på: `$$\set{x^\prime \in X | x \rightarrow x^\prime}$$

Har {# lede #}en tydlig förståelse av din webbplats *beroende graf* kommer att se till att du kan maximera prestandan hos vår byggteknik i stor skala{# lede #}

Det är viktigt att notera att beroenderelationerna mellan källfiler kan och bör fångas helt av hashvärdet `%path::dependencies` under byggsystemets startbelastning av `lib/path.pm` från källträdet, vilket är hur de inbyggda vyerna i vårt paket `SunStarSys::View` Perl är avsedda att fungera. Funktionerna `walk_content_tree`, `archived` och `seed_file_deps` kan importeras från `SunStarSys::Util` är användbara hjälpmedel för att konstruera hashningen `%path::dependencies`, med inbyggt stöd för att hantera ett beroendecache för att accelerera inkrementella byggen i stor skala.

Här är den delen av vår levande [`lib/path.pm`]({{snippetA.pretty_uri}}).

[snippet:lang=perl:repo=SunStarSys/www:branch=trunk:path=lib/path.pm:token=#snippet]

Gör mull den koden över för idéer om hur du vill * din webbplats * att fungera. Ja, det finns en viss rimlig komplexitet (som omfattar både Perls reguljära uttryck och Perls UNIX C-skala "glob" gränssnitt, på ett mycket exakt sätt) kring hur `%path::dependencies` konstrueras i den filen, Men istället för att bara se detta som optimeringsarbete, titta istället på det som att tillhandahålla de grundläggande ingredienserna som är nödvändiga för att konstruera viktiga aspekter av *link-topologin* på ett automatiserat, dynamiskt genererat sätt.

Var kommer poster i `%path::dependencies` från? Om de inte är födda från ett anrop till `walk_content_tree { seed_file_deps ... }`, (som i princip dyker in i dina nedsättningskällfilers huvuden och innehåll), är de bara hårdkodade i `lib/path.pm` vid laddning.

### Cykliska beroendediagram är normen

Vår webbplats består för närvarande av `240 källfiler` i `innehåll/`.  Här är en `85 hörn x 465 kanter`, bläddringsbar, tvådimensionell riktad grafrepresentation av en ny ögonblicksbild av de engelska språksidberoendena på **vår webbplats** ([med GraphViz `dot`](https://github.com/SunStarSys/orion/blob/master/deps2dotcfg.pl).

<div id="deps">

  ![Engelska språkberoenden](../images/deps).

</div>

Ganska komplex, även för en liten webbplats som den här! Många kantskärningar när du tar `$$n=2$$` (undvikbar i dimension `$$n=3$$

Notera också den interna, väsentligen isolerade sammankopplingen av elementen i `/kategorier/*/*` och `/archives/2022/11/*`. De enda externa beroendena involverar icke-arkiverat innehåll i `/essays/*`. Detta är genom design &mdash;

Självklart, vår [Orion Enterprise Wiki](/orion/).

### Handlar det inte bara om hyperlänkar?

**Nej!** I själva verket är *link-topologin* på din webbplats en helt separat fråga från källträdets *beroende diagram*.  En sökmotor kommer naturligtvis att iller ut *link topologi*, men har ingen inblick i *beroende graf*.

Här är en `240+ hörn x 3859 kanter`, aktuella fågel-öga diagram av den engelska *länk topologi* diagram för **vår webbplats** ([med GraphViz `twopi`](https://github.com/SunStarSys/orion/blob/master/links2dotcfg.pl).

<div id="links">

  ![Svenska språklänkar](../images/links).

</div>

Kan du upptäcka de `röda kanterna` som anges i *beroende diagrammet*? Diagrammet *link topology* är kvalitativt och kvantitativt **mycket annorlunda** än det (dramatiskt mindre och mindre sammanlänkade) *beroende diagrammet* som avbildas ovan.

### Hur SSI-tekniken kan hjälpa till

### Traditionell [Serversida omfattar](https://httpd.apache.org/docs/2.4/howto/ssi.html).

- ** Stor** för beskärning av webbplatsens *beroende diagram* ner till hanterbar storlek utan att offra sidleveransfördröjning
- ** Stor** för att minska bortfall av mallobjekt i stora bekräftelsemeddelanden för bättre peer review och övervakning av dina byggda ändringsuppsättningar
- **uppskämd** för att omtexualisera hela webbsidor till en annan plats i dokumentrotens hierarki

#### API:er för mallar

#### ssi-tagg

Syntax:

&#123;% `ssi` &#96;/content_rooted/path/to/source_file&#96; %&#125;

- sökvägar rotade i `content` källkatalog
- hoppar över huvuddelen av källfilen så att `ssi` inkluderas
- skriver om relativa URL:er till absoluta URL:er i målsökvägens inkluderade innehåll

#### ssi-filter

Syntax:

&#123;&#123; innehåll|ssi &#125;&#125;

- utvärderar rekursivt `ssi`-taggar i värdet som ska filtreras
- användbart för att undvika att använda ett stort värde (3+) av `quick_deps` i en `@path::patterns`-postens argument hashref, vilket kan påverka prestanda

#### Varför inte SymLinks?

- barebones-filsystems abstraktion som är svår att stödja på ett säkert sätt i en `<virtualhost>`kontext
- samma nackdelar med traditionella `ssi` på hela webbsidor
- vår [Orion Enterprise Wiki](/orion/).

#### Byggverktyg för permalänkar

#### Dokumentvaraktighet

Orions byggsystem har integrerat stöd för vad vi kallar *Document Curation*, vilket är processen att retextualisera och omorganisera ditt innehåll baserat på hur du ställer in rubrikerna `Kategorier` och `Arkiv` i dina Markdown-källfiler. Dessa funktioner är avaktiverade som standard, men kan aktiveras genom att ställa in en `category_root` (för kategoristöd) eller en `archive_root` (för arkiveringsstöd) i det associerade hashref-argumentet till önskad `@path::patterns`-post.

#### Kategorier

- nytt innehåll skapas med `ssi`-malltaggar som pekar tillbaka till permalänkplatsen, medan `Arkiv`-huvudet tas bort från den konstruerade källsidan
- kategorier är strikt additiva (dvs. att ta bort en kategori från en källsidas rubriker kommer inte att ta bort den från den kategorin på den aktiva webbplatsen),
- genererad på begäran
- Att ta bort alla kategorier i ett enda åtagande är ett bra sätt att synkronisera dem med de exakta specifikationerna i alla källsidors rubriker, utan att förstöra det bevarade kategoriinnehållet på den levande webbplatsen

#### Arkiverade sidor

På vår webbplats arkiverar vi aggressivt inaktuella essäer för att hålla byggtiderna för nya essäer låga, samtidigt som vi inte förstör permalänkar till arkiverade dokument. *Beroendegrafen* i förhållande till katalogen `/arkiv/` (för vår webbplats) är någorlunda fristående enligt följande regler:

- innehåll som konstruerats med `ssi`-taggar som pekar tillbaka till permalänkplatsen, samtidigt som rubrikerna `Kategorier` och `Arkiv` tas bort från den konstruerade källsidan
- innehåll i `/(essays|clients)/` är alltid permalänkar, även efter arkivering
- arkivering effektivt tar bort permalänk plats från *beroende graf *, medan inte ta bort permalänken själv från webbplatsen

#### Ledare

HTML-kommentarer inbäddade i Markdown-prosans formgränser för lede-innehållet. Vi använder **&#123;Antal ledtrådar&#125;

Bearbetning av ledningar utförs med mallfiltret `lede`. Det är användbart att kombinera detta med `ssi`-filtret för att indexera en kategorifil med mer än en kategorisida i den.

## Slutsatser

Det finns intressanta datastrukturer och relationer som ännu inte har upptäckts när man hanterar en webbplats *beroende diagram* från ett byggprestandaperspektiv, vilket är ett mycket nyare intresseområde än forskningslitteraturen som gräver i datastrukturerna och tillhörande isärtaganden som omger *länka topologi*<sup>1,2</sup>.

Konventionella inkrementella byggen för rena mjukvaruutvecklingsprojekt är fortfarande ett hett ämne. Den forskning som omfattas av <sup>3 4</sup> publicerades i oktober 2022, ungefär en månad innan denna uppsats förväntas vara klar. Byggsystemet *pluto*<sup>5</sup> har funktioner som liknar våra (själva bygget kan dynamiskt återskapa och återskapa beroenden).

Den goda nyheten är att vi har dig täckt som vår kund. Vi kommer att hålla dig informerad om bästa praxis och den senaste tekniken inom detta område, så att du kommer att dra nytta av våra lärdomar under det senaste decenniet och in i framtiden.

## Fotnoter

1. [Identifiering av kluster i webbdiagrammet baserat på länktopologi](https://ieeexplore.ieee.org/abstract/document/1214919).

2. [Inferring Web Communities från Link Topology](https://dl.acm.org/doi/pdf/10.1145/276627.276652) Den nionde ACM-konferensen om hypertext och hypermedia: länkar, objekt, tid och rum &mdash; struktur i hypermedia system: länkar, objekt, tid och rum &mdash;

3. [Om fördelarna och gränserna för inkrementella konfigurationer av programvara: en undersökande studie](https://dl.acm.org/doi/abs/10.1145/3510003.3510190).

4. [Mot inkrementell version av programvarukonfigurationer](https://dl.acm.org/doi/10.1145/3510455.3512792).

5. [Ett ljud och optimalt inkrementellt byggsystem med dynamiska beroenden](https://dl.acm.org/doi/10.1145/2814270.2814316).

<style type="text/css">

#deps {
 bredd:100 %;
 spill:auto;
margin-bottom:10px;
  padding-top:0;
  height:1000px;
}

#links {
 bredd:100 %;
 spill:auto;
margin-bottom:10px;
  padding-top:0;
  height:1000px;
}

@media endast skärm och (maxbredd: 1000px) {
    #links { höjd: 300px }
}

#links bild { bredd:100 % }
</style>

<!-- $Date$ $Author$ $Revision$  $Id$ -->
