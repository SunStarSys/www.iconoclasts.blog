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

* Hantering av beroenden för smart innehåll&trade;* handlar om cirkeln av idéer relaterade till att ge stöd och underlättande för *inkrementella byggen*, samtidigt som man håller sig till **Innehållsnormaliseringsprincipen** &mdash; det där [*permalänkar*]

I den här artikeln presenteras webbplatsen för <https://sunstarsys.com/> som en fallstudie för en <a href="#commentAB" class="border border-warning text-muted reference-link" id="commentAB-link" title="{{commentAB.headers.title}}">demonstration</a> av praxis och analyser av associerade diagramtopologier.

Antal förbehåll

Det här är bara viktigt när du behöver väga kostnaden för att utföra fullständiga webbplatsbyggen varje gång du behöver justera innehållet på en webbsida. Om din webbplats innehåller mindre än 1K-källfiler **avslappnar** och läs följande med ett öga på dina framtida behov. Du valde att använda vår plattform, som är utformad för att skala med dig, inte mot dig. För de flesta sidor handlar det här materialet nedan om *glesa innehållsberoendediagram* för webbplatser med mer än 1K-sidor.

Webbplatsen Apache <https://www.OpenOffice.Org> kunde till exempel bygga sina 40K+-filer med den ursprungliga Apache-versionen av det här byggsystemet, med fullt integrerat stöd för inkrementella byggen. &mdash; utan konfigurerade beroenden &mdash;

Som standard bygger vårt byggsystem endast de filer som du har ändrat, utan problem för beroenden inom filen (om du inte anger dem i `%path::beroenden` &mdash; mer om detta nedan). Om filen du ändrade finns i `mallar/` eller `lib/`

## Weaving Your Website's *Dependency Graph * Tillsammans

Matematiskt en *Topologi* `$$\tau$$` är en fullständig specifikation av de *öppna* delmängderna i ett utrymme `$$X$$`, vars syfte är att ange närhetsrelationerna mellan *punkter* `$$x$$` från rymden `$$X$$`. När `$$X$$` är ett diagram, en *topologi* `$$\tau$$` för `$$X$$` uppgår till att ange kanterna som förbinder diagrammets brytpunkter tillsammans (här ses brytpunkter som *punkter* för `$$X$$`, och de anslutande kanterna bestämmer områdena för dessa punkter som *grundläggande öppna uppsättningar* för topologin).  En *riktad graftopologi* är i huvudsak samma sak, men innehåller en hänvisning till en topologisk inbäddning av `$$(X,\tau)$$` till ett större topologiskt rum `$$(Y,\sigma)$$`

Det senare konceptet är vad vi kommer att använda när vi diskuterar *beroende diagrammets * topologi `$$\tau$$` associerad med arbetsytan `$$X$$` av källfiler under webbplatsens `innehåll/` underkatalog (här `$$(Y,\sigma)$$` är `$$\mathbb{R}^n$$` med sin metriska topologi för `$$n \in \{2,3\}$$`och kanterna av `$$X$$` är riktade jordanska kurvor som inte korsar varandra och som ansluter en fil `$$x \in X$$` till sin uppsättning filer som `$$x$$` beror på: `$$\set{x^\prime \in X | x \rightarrow x^\prime}$$`

Har {# lede #}en tydlig förståelse av din webbplats *beroende graf* kommer att se till att du kan maximera prestandan hos vår byggteknik i stor skala{# lede #}. Vi tar den information du tillhandahåller `%path::beroenden` under byggets laddning av webbplatsens `lib/path.pm` fil, konstruera en omvänd mappning av beroende filer och använd *som omvänd mappning* för att fastställa den fullständiga korpus av filer som ska skapas för varje given `svn bekräftelse`

Det är viktigt att notera att beroenderelationerna mellan källfiler kan och bör fångas helt av `%path::beroenden` hash under byggsystemets startbelastning av `lib/path.pm` från ditt källträd, vilket är hur de inbyggda vyerna finns i våra `SunStarSys::Visa` Perl-paketet är tänkt att fungera. Den `walk_content_tree`, `arkiverad`och `seed_file_deps` nyttofunktioner som kan överföras från `SunStarSys::Till` är användbara hjälpmedel för att konstruera `%path::beroenden`

Här är den delen av vårt liv [`lib/path.pm`]({{snippetA.pretty_uri}}).

[snippet:lang=perl:repo=SunStarSys/www:branch=trunk:path=lib/path.pm:token=#snippet]

Gör mull den koden över för idéer om hur du vill * din webbplats * att fungera. Ja det finns en viss rimlig komplexitet (som omfattar både Perls reguljära uttryck och Perls UNIX C-skal) `glob` gränssnitt, på ett mycket exakt sätt) kring hur `%path::beroenden`

Var finns posterna i `%path::beroenden` ursprung? Om de inte är födda av en `walk_content_tree { seed_file_deps ... }`, (som i princip dyker in i dina markdown-källfilers rubriker och innehåll), då är de bara hårdkodade i `lib/path.pm`

### Cykliska beroendediagram är normen

Vår webbplats består för närvarande av `240 källfiler` om `innehåll/`. Här är en `85 hörn x 465 kanter`, rullningsbar, tvådimensionell riktad grafrepresentation av en aktuell ögonblicksbild av beroenden på den engelska språksidan på **vår webbplats** ([använda GraphViz `punkt`]

<div id="deps">

  ![Beroenden för engelska]

</div>

Ganska komplex, även för en liten webbplats som den här! Många kantskärningar när du tar `$$n=2$$` (kan undvikas i dimension `$$n=3$$`). Av särskild vikt är kärnuppsättningen av täta, cykliska beroenden i de icke-arkiverade filerna på vår webbplats. `/lektioner/` katalog, mot nedre mitten till höger i diagrammet, vilket är hur en bra bloggwebbplatsens beroendediagram ska se ut. Dessa beroenden dras in i `röda kurvor`

Observera också den interna, väsentligen isolerade sammankopplingen av elementen i `/kategorier/*/*` och `/archives/2022/11/*`. De enda externa beroendena omfattar icke-arkiverat innehåll i `/dagar/*`. Detta är genom design &mdash; De arkiverade uppsatserna bör endast ändras *adiabatiskt*, kanske enbart för justeringar av deras `Kategori` rubriker Ingen av dessa ändringar påverkar det befintliga innehållet väsentligt, så vi spårar det inte i `%path::beroenden`

Självklart, vår [Wiki för Orion Enterprise]

### Handlar det inte bara om hyperlänkar?

**Nej!** I själva verket är *link-topologin* på din webbplats en helt separat fråga från källträdets *beroende diagram*.  En sökmotor kommer naturligtvis att iller ut *link topologi*, men har ingen inblick i *beroende graf*.

Här är en `240+ hörn x 3859 kanter`, aktuella fågelögondiagram över den engelska *länka topologi* grafen för **vår plats** ([använda GraphViz `twopi`]

<div id="links">

  ![Engelska språklänkar]

</div>

Kan du upptäcka `röda kanter`

### Hur SSI-tekniken kan hjälpa till

#### Traditional [Serversidan innehåller]

- ** Stor** för beskärning av webbplatsens *beroende diagram* ner till hanterbar storlek utan att offra sidleveransfördröjning
- ** Stor** för att minska bortfall av mallobjekt i stora bekräftelsemeddelanden för bättre peer review och övervakning av dina byggda ändringsuppsättningar


#### API:er för mallar

#### ssi-tagg

Syntax:

&#123;% `ssi` &#96;/content_rooted/path/to/source_file&#96; %&#125;

- sökvägar rotade i `nöjd` källkatalog
- hoppar över huvuddelen av källfilen som ska `ssi` ingår


#### ssi-filter

Syntax:

&#123;&#123; innehåll|ssi &#125;&#125;

- rekursivt utvärderar `ssi` taggar i värdet som ska filtreras
- användbart för att undvika att använda ett stort värde (3+) av `quick_deps` i en `@path::mönster`

#### Varför inte SymLinks?

- barebones filsystem abstraktion som är svårt att säkert stödja i en `<virtualhost>` sammanhang kontext
- samma nackdelar med traditionella `ssi` på fullständiga webbsidor
- vår [Wiki för Orion Enterprise]

#### Byggverktyg för permalänkar

#### Dokumentvaraktighet

Orions byggsystem har integrerat stöd för vad vi kallar *Document Curation*, vilket är processen att retextualisera och omorganisera ditt innehåll baserat på hur du ställer in `Kategorier` och `Arkivera` rubriker i källfilerna för Markdown. Dessa funktioner är avaktiverade som standard, men kan aktiveras genom att ställa in en `category_root` (för kategoristöd) eller `archive_root` (för arkiveringsstöd) i det associerade hashref-argumentet till det önskade `@path::mönster`

#### Kategorier

- nytt innehåll konstrueras med hjälp av mall `ssi` taggar som pekar tillbaka till permalänkplatsen, medan du tar bort `Arkivera` sidhuvud från den konstruerade källsidan
- kategorier är strikt additiva (dvs. att ta bort en kategori från en källsidas rubriker kommer inte att ta bort den från den kategorin på den aktiva webbplatsen),
- genererad på begäran


#### Arkiverade sidor

På vår webbplats arkiverar vi aggressivt inaktuella essäer för att hålla byggtiderna för nya essäer låga, samtidigt som vi inte förstör permalänkar till arkiverade dokument. *beroende graf* i förhållande till `/arkiv/`

- innehåll konstruerat med hjälp av mall `ssi` taggar som pekar tillbaka till permalänkplatsen, medan du tar bort `Kategorier` och `Arkivera` rubriker från den konstruerade källsidan
- innehåll i `/(essays|clients)/` är alltid permalänkar, även efter arkivering


#### Ledare

HTML-kommentarer inbäddade i Markdown-prosans formgränser för lede-innehållet. Vi använder **&#123;Antal ledtrådar&#125;

Bearbetningslinjer görs med `ledare` Mallfilter. Det är nyttigt att kombinera detta med `ssi`

## Slutsatser

Det finns intressanta datastrukturer och relationer som ännu inte kan avslöjas när man hanterar en webbplats *beroende diagram* från ett byggprestandaperspektiv, vilket är ett mycket nyare intresseområde än forskningslitteraturen som gräver i datastrukturerna och tillhörande isärtaganden som omger *länka topologi*<sup>1,2</sup>.

Konventionella inkrementella byggen för rena mjukvaruutvecklingsprojekt är fortfarande ett hett ämne. Den forskning som omfattas av <sup>3 4</sup> publicerades i oktober 2022, ungefär en månad innan denna uppsats förväntas vara klar. Byggsystemet *pluto*<sup>5</sup> har funktioner som liknar våra (själva bygget kan dynamiskt återskapa och återskapa beroenden).

Den goda nyheten är att vi har dig täckt som vår kund. Vi kommer att hålla dig informerad om bästa praxis och den senaste tekniken inom detta område, så att du kommer att dra nytta av våra lärdomar under det senaste decenniet och in i framtiden.

## Fotnoter

1. [Identifiering av kluster i webbdiagrammet baserat på länktopologi]

2. [Hämta webbforum från länktopologi](https://dl.ACM.org/doi/pdf/10.1145/276627.276652) Förfaranden vid den nionde ACM-konferensen om Hypertext och hypermedia: länkar, objekt, tid och rum &mdash; struktur i hypermedia system: länkar, objekt, tid och rum &mdash;

3. [Om fördelarna och gränserna för inkrementella konfigurationer av programvara: en undersökande studie]

4. [Mot inkrementell utveckling av programvarukonfigurationer]

5. [Ett ljud och optimalt inkrementellt byggsystem med dynamiska beroenden]

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
