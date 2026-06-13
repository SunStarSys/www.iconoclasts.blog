---
categories: Orion, Arkitektur
dependencies: '*.md.sv'
keywords: arkitektur,inkrementell,webbplats,generering,byggnader, beroenden,topologi,wiki,graf
status: vitbok
title: Vad handlar <em>Smart Content Dependency Management™</em> om?
---

<div class="right">

![träd](https://www.sunstarsys.com/orion/index.page/lightning)

</div>

## Innehållsförteckning

[TOC]#sidebar

-----

## Sammandrag

*Beroendehantering för smart innehåll&trade;* handlar om cirkeln av idéer relaterade till att ge stöd och underlättande för *inkrementella byggen *, samtidigt som man håller sig till **Content Normalization Principle **&mdash; det där [*permalänkar*](https://en.wikipedia.org/wiki/Permalink) bör vara den enda sanningskällan, oavsett hur deras innehåll kurateras i hela källträdet och resulterande byggartefakter.

Denna artikel presenterar <https://iconoclasts.blog/> webbplats som en fallstudie för demonstration av bästa praxis och analys av tillhörande graftopologier.

-----

## Varningar

Detta betyder bara när du behöver väga kostnaden för att utföra hela webbplatsbyggen varje gång du behöver justera innehållet på en webbsida. Om din webbplats har mindre än 1K källfiler i den, **avslappna**, och läs följande med ett öga mot dina framtida behov. Du valde att använda vår plattform, som är utformad för att skala med dig, inte mot dig. För de flesta sidor handlar det här materialet nedan om *glesa diagram över innehållsberoende* för webbplatser med fler än 1K-sidor.

Till exempel Apache <https://www.OpenOffice.Org> webbplatsen kunde bygga sina filer på 40K+ med den ursprungliga Apache-versionen av detta byggsystem, med fullt integrerat stöd för inkrementella byggen &mdash; utan några konfigurerade beroenden &mdash; Genom att göra smart användning av traditionell SSI-teknik ensam.

Som standard bygger vårt byggsystem endast de filer du har ändrat, utan problem för de interna filberoendena (om du inte anger dem i `%path::dependencies` &mdash; Mer om detta nedan). Om filen du ändrade finns i `templates/` eller `lib/` En fullständig webbplatsversion utlöses istället.

-----

## Vävning av webbplatsens *beroende diagram *tillsammans

Matematiskt, en* topologi *`$$\tau$$` är en fullständig specifikation av de *öppna* delmängderna av ett utrymme `$$X$$`, vars syfte är att indikera närhetsrelationerna mellan *punkter* `$$x$$` från rymden `$$X$$`. När `$$X$$` är ett diagram, en *topologi* `$$\tau$$` för `$$X$$` belopp för att ange kanterna som kopplar ihop diagrammets brytpunkter (här visas brytpunkterna* för `$$X$$`, och de anslutande kanterna bestämmer grannskapen för dessa punkter som *basöppningsuppsättningar* för topologin).  En *riktad graf topologi *är i huvudsak samma sak, men innehåller en hänvisning till en topologisk inbäddning av `$$(X,\tau)$$` i ett större topologiskt rum `$$(Y,\sigma)$$` , där inbäddningens kantanslutningar representeras av riktade, icke-skärande (Jordanien) kurvor.

Det senare konceptet är vad vi kommer att använda när vi diskuterar *beroendegrafens *topologi `$$\tau$$` associerad med arbetsytan `$$X$$` av källfiler under webbplatsens `content/` underkatalog (här) `$$(Y,\sigma)$$` är `$$\mathbb{R}^n$$` med sin metriska topologi för `$$n \in \{2,3\}$$`och kanterna på `$$X$$` är icke-korsande, riktade jordanska kurvor som ansluter en fil `$$x \in X$$` till sin uppsättning filer som `$$x$$` beror på: `$$\set{x^\prime \in X | x \rightarrow x^\prime}$$`).

Att {# lede #}en tydlig förståelse för din webbplats *beroende diagram *kommer att se till att du kan maximera prestandan hos vår byggteknik i stor skala{# lede #}. Vi tar den information du lämnar till `%path::dependencies` under byggets belastning av din webbplats `lib/path.pm` fil, konstruera en omvänd karta över beroende filer och använd *den omvända kartan* för att fastställa den fullständiga korpus av filer som ska byggas för en given `svn commit` Du gör till vårt system.

Det är viktigt att notera att beroenderelationerna mellan källfiler kan och bör helt fångas av `%path::dependencies` hash under byggsystemets startladdning av `lib/path.pm` från ditt källträd, vilket är hur de inbyggda vyerna i våra `SunStarSys::View` Perl-paketet är tänkt att fungera. Den `walk_content_tree`, `archived`och `seed_file_deps` verktygsfunktioner som kan importeras från `SunStarSys::Util` är användbara hjälpmedel för att konstruera `%path::dependencies` hash, med inbyggt stöd för att hantera ett beroendecacheminne för att påskynda inkrementella byggen i stor skala.

Här är den delen av vårt liv [`lib/path.pm`]({{snippetA.pretty_uri}}):

[snippet:lang=perl:repo=SunStarSys/www.iconoclasts.blog:branch=trunk:path=lib/path.pm:token=#snippet]

Vänligen gör mull den koden över för idéer om hur du vill *din webbplats* att fungera. Ja, det finns en viss rimlig komplexitet (med både Perls reguljära uttryck och Perls UNIX C-skal) `glob` gränssnitt, på ett mycket exakt sätt) kring hur `%path::dependencies` är konstruerad i den filen, men istället för att bara titta på detta som optimeringsarbete, titta istället på det som att tillhandahålla de grundläggande ingredienserna som behövs för att konstruera viktiga aspekter av *link topologi *på ett automatiserat, dynamiskt genererat sätt.

Var går in i `%path::dependencies` Ursprung? Om de inte är födda av en åkallan av `walk_content_tree { seed_file_deps ... }`, (som i princip dyker in i dina markdown-källfilers huvuden och innehåll), då är de bara hårdkodade i `lib/facts.yml` vid lastningstid.

### Cykliska beroendediagram är normen

Vår webbplats består för närvarande av `2417 source files` om `content/`. Här är en `100+ vertices x 600+ edges`, rullningsbar, tvådimensionell dirigerad diagramrepresentation av en aktuell ögonblicksbild av sidberoenden på engelska på **den här webbplatsen** ([använda GraphViz `dot`](https://github.com/SunStarSys/orion/blob/master/deps2dotcfg.pl)):

<div id="deps">

![Beroenden för engelska språk](../images/deps.svg{{lang}})

</div>

Ganska komplicerat, även för en liten webbplats som denna! Många kantskärningar när du tar `$$n=2$$` (undvikbar i dimension `$$n=3$$`). Särskilt viktigt är kärnuppsättningen av täta, cykliska beroenden i de icke-arkiverade filerna på vår webbplats `/essays/` katalog, mot den nedre mitten-höger av grafen, vilket är vad en bra blogg webbplats beroende diagram bör se ut. Dessa beroenden dras in i `red curves` i bilden.

Notera också den interna, väsentligen isolerade sammankopplingen av elementen i `/categories/*/*` och `/archives/2026/05/*`. De enda externa beroendena involverar icke-arkiverat innehåll i `/joe/*`. Detta är genom design &mdash; De arkiverade uppsatserna bör endast ändras *adiabatiskt* kanske enbart för justeringar av deras `Category` rubriker. Ingen av dessa ändringar påverkar väsentligt det befintliga innehållet, så vi spårar det inte i `%path::dependencies`.

Självklart vår [Wiki för Orion Enterprise](https://www.sunstarsys.com/orion/) Har aldrig haft problem med att hantera cykliska beroenden.

### Handlar det inte bara om hyperlänkar?

**Nej!** Faktum är att *länkens topologi* på din webbplats är en helt separat fråga från källträdets *beroendediagram*.  En sökmotor kommer naturligtvis att illera *link topologi *, men har ingen inblick i *beroende diagram *.

Här är en `16k+ vertices x 90k+ edges`, aktuell bird-eye grqaph i det engelska *link topology*-grafen för **vår plats** ([använda GraphViz `twopi`](https://github.com/SunStarSys/orion/blob/master/links2dotcfg.pl)):

<div id="links">

![Engelska språklänkar](../images/links.svg{{lang}})

</div>

Kan du upptäcka `red edges` som anges i *beroendekurvan*? Diagrammet *link topology* är kvalitativt och kvantitativt **mycket annorlunda** från (dramatiskt mindre och mindre sammanlänkat) *beroendegraf* som visas ovan.

### Hur SSI-teknik kan hjälpa

#### Traditionell [Server-sidan inkluderar](https://httpd.apache.org/docs/2.4/howto/ssi.html) (SSI)

- **Bra** för att rensa webbplatsens *beroende diagram* ner till hanterbar storlek utan att offra sidleverans latens
- **Stor** för att minska bortfall av mallobjekt i stora bekräftelsemeddelanden för bättre peer-granskning och övervakning av dina skapade ändringsuppsättningar
- **lousy** för omtexualisering av hela webbsidor till en annan plats i dokumentrotens hierarki

#### Mall-API:er

##### ssi-tagg

Syntax:

&#123;% `ssi` &#96;/content_rooted/path/to/source_file&#96; %&#125;

- banor rotade vid `content` källkatalog
- hoppar över huvuddelen av källfilen som ska `ssi` ingår
- skriver om relativa URL:er till absoluta URL:er i målsökvägens inkluderade innehåll

##### ssi-filter

Syntax:

&#123;&#123; innehåll|ssi &#125;&#125;

- Recursivt utvärderar `ssi` taggar i värdet som ska filtreras
- användbart för att undvika att använda ett stort värde (3+) av `quick_deps` om `@path::patterns` postens argument hashref, vilket kan påverka prestanda

#### Varför inte SymLinks?

- barebones filsystem abstraktion som är svårt att säkert stödja i en `<VirtualHost>` sammanhang kontext
- Samma nackdelar med traditionella `ssi` på hela webbsidor
- våra [Wiki för Orion Enterprise](https://www.sunstarsys.com/orion/) Systemet stöder dem inte

#### Verktyg för Permalänkar

##### Dokumentkuratering

Orions byggsystem har integrerat stöd för vad vi kallar *Document Curation*, vilket är processen att rekontextualisera och omorganisera ditt innehåll baserat på hur du ställer in `Categories` och `Status` huvuden i källfilerna för Markdown. Dessa funktioner är avaktiverade som standard, men kan aktiveras genom att en `category_root` (för kategoristöd) eller en `archive_root` (för arkiveringsstöd) i det associerade hashref-argumentet till önskat `@path::patterns` inträde.

##### Kategorier

- nytt innehåll konstrueras med hjälp av mall `ssi` taggar som pekar tillbaka till permalänkens plats,
- kategorierna är strikt additiva (dvs. att ta bort en kategori från en källsidas rubriker kommer inte att ta bort den från den kategorin på den aktiva webbplatsen),
- genereras på begäran,
- Att ta bort alla kategorier i ett enda åtagande är ett bra sätt att synkronisera dem med de exakta specifikationerna i alla källsidans rubriker, utan att förstöra det bevarade kategoriinnehållet på den aktiva webbplatsen.

##### Arkiverade sidor

På vår webbplats arkiverar vi aggressivt inaktuella essäer för att hålla byggtiderna för nya essäer låga, samtidigt som vi inte förstör permalänkar till arkiverade dokument. *beroendegrafen* i förhållande till `/archives/` katalogen (för vår webbplats) är rimligt fristående enligt följande regler:

- innehåll konstruerat med hjälp av mall `ssi` taggar som pekar tillbaka till permalänkens plats, medan borttagning av `Categories` sidhuvud från den konstruerade källsidan
- innehåll i `/(essays|clients)/` är alltid permalänkar, även efter arkivering
- arkivering tar effektivt bort permalänkens plats från *beroendegrafen*, utan att ta bort permalänken själv från webbplatsen

##### Lede

HTML-kommentarer inbäddade i gränserna för Markdown-prosa-formuläret för lede-innehållet. Vi använder **&#123;Antal ledarnr&#125;** för detta ändamål.

Bearbetningsledningar görs med `lede` Mallfilter. Det är nyttigt att kombinera detta med `ssi` filter för indexering av en kategorifil med fler än en kategorisida i den.

-----

## Slutsatser

Det finns intressanta datastrukturer och relationer som ännu ska avslöjas när man hanterar en webbplats *beroende diagram *från ett byggprestandaperspektiv, vilket är ett mycket nyare intresseområde än forskningslitteraturen som fördjupar sig i datastrukturer och tillhörande problem kring *länk topologi *<sup>1,2</sup>.

Konventionella inkrementella byggen för rena programvaruutvecklingsprojekt är fortfarande ett hett ämne. Den forskning som omfattas av <sup>3,4</sup> publicerades i oktober 2022, ungefär en månad innan denna uppsats förväntas vara klar. Den *pluto*<sup>5</sup> bygga system har funktioner som liknar vår (byggandet själv kan dynamiskt regenerera och bygga om beroenden).

Den goda nyheten är att vi har täckt dig som kund. Vi kommer att hålla dig underrättad om de bästa metoderna och den senaste tekniken inom detta område, så att du kommer att dra nytta av våra lärdomar under det senaste decenniet och in i morgon.

-----
## fotnoter

1. [Identifiering av kluster i webbdiagrammet baserat på länktopologi](https://ieeexplore.ieee.org/abstract/document/1214919) Sjunde internationella symposiet för databasteknik och tillämpningar, 2003. Förfaranden

2. [Härleda webbforum från länktopologi](https://dl.acm.org/doi/pdf/10.1145/276627.276652) Den nionde ACM-konferensen om hypertext och hypermedia fortsätter: länkar, objekt, tid och rum &mdash; struktur i hypermediasystem: länkar, objekt, tid och utrymme &mdash; struktur i hypermediasystem. 1998.

3. [Om fördelarna och gränserna för inkrementella programvarukonfigurationer för bygge: en undersökande studie](https://dl.acm.org/doi/abs/10.1145/3510003.3510190) ICSE '22: Förfaranden vid den 44:e internationella konferensen om programvaruteknik, maj 2022

4. [Mot inkrementell uppbyggnad av programvarukonfigurationer](https://dl.acm.org/doi/10.1145/3510455.3512792) ICSE-NIER '22: Förfaranden vid ACM/IEEE 44th International Conference on Software Engineering: Nya idéer och framväxande resultat, maj 2022

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
