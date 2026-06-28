---
categories: Orion
dependencies: '*.md.sv'
keywords: Orion, Hugo, SSG
status: verifierad=46702
title: Orion vs. Hugo
---

<div class="right">

![Hugo SSG](ssg.page/hugo-logo-wide)

</div>

[TOC]#sidebar

@sunstarsys/status/2070917650042040818

## Förord

Jag förstår att tekniska jämförelser är ett religiöst tabu i många kretsar.  Det viktigaste jag försöker förmedla är att medan [Orion](https://www.sunstarsys.com/orion/) Den faktureras som en Enterprise Jamstack Wiki, den har många livskraftiga användningsfall utanför den specifika problemdomänen.

Men kärnan i den här artikeln är att representera Orions Apache-Licensed SSG som *en bättre SSG än Hugo för dig och dina programvarutekniker *.  Den har mer kraft, mer prestanda, fler kärnfunktioner och mycket enklare att anpassa. Plus att det är [väldokumenterad](https://www.sunstarsys.com/orion/api/) och har obegränsad potential för riktiga strömanvändare där ute, precis som du!

## @SunStarSys/orion

- NKOTB

- Yttrande med gradvis inlärningskurva

## @GoHugoIo/hugo

- Populär

- Robusta teman och tillägg från tredje part

- Yttrande med brant inlärningskurva

## Gemensamma funktionsuppsättningar

- Apache licensierad

- Hög prestanda (max dokumentbearbetningshastighet vid ~1K dokument per sekund)[^1]

- Cachelagrad beroendehantering

- Sofistikerad säkerhetsmodell

## Orion som Hugo++

1. {# lede #}(Konfigurerbar) Full kraft av Django mallar inom Markdown källor{# lede #}

2. Robust kontrollflöde, For-Loop konstruktioner och Django filter

3. Full åtkomst till bifogade YAML/CSV-dokument som datastrukturer

4. WebGL-aktiverad vektorgrafik[^2]

5. Aggregera vektoråtgärder på tabelldata via `PDL`

6. `ssi` hoppar över filhuvuden

7. [Innehållsförhandling / MultiViews](https://httpd.apache.org/docs/current/content-negotiation.html)

8. Lätt att använda

9. Flexibla, sanna inkrementella byggen

10. Åtkomstkontrollista per fil/katalog (även kallad finkornig) inklusive kontroller av själva byggets programvarustack och konfiguration

11. :editormd-logo: Robust [$$\KaTeX$$](markdown-is-not-latex#h2-embrace-and-extend-redux) Stöd

12. Integrerad PCRE-sökning

### Användningsfall för Orion CMS-redigerare

<center>

![Redigerare X](ssg.page/screenshot)

</center>

1. Luddning för dokumentuppladdning baserad på MIME-typ (nedsättning, perl, YAML, CSV, $$\LaTeX$$)

2. Automatisk länkvalidering/rubrikering

3. Förhandsgranskningsåtergivning i realtid för `@`-kortlänkar (t.ex. :fa-x-twitter: tweets)

4. Slutförande av elektrisk HTML/flik

5. Flerspråkig med AI-översättningsfunktion OOTB &mdash; inklusive kinesiska, hebreiska och arabiska

6. $$\text{Markdown }\rightarrow\LaTeX$$ templad artikelomvandlare

### Inkrementella Orion-byggen

#### O(N) kontra O(1)

Om du vill att din wikis författare och redaktörer ska vara nöjda med ditt byggsystem, måste det stödja inkrementella byggen som en första orderfunktion, och *inte en marknadsföringsgimmick som tackas på som en eftertanke*.

Det betyder att du vill ha Orion!

#### Hugos primitiva beroendecache (dvs. Gilding the Lilly)

Komiskt absurda nivåer av meningslös puffery i mycket detaljerade arkitektoniska diagram som skickligt undviker att ange elepanterna i rummet...

> https://deepwiki.com/gohugoio/hugo/3.6-dependency-tracking-and-caching

Här är vad den sidan inte säger om Hugo beroendehantering:

- oflexibel, internt genererad [**DAG**](https://en.wikipedia.org/wiki/Directed_acyclic_graph) baserat på nod-/löv-/paketträdlayouter

- aldrig skriven till disk

##### Hugos spårlösa `readFile` anropar stöd för inkrementell bygge för brytning

Låt oss undersöka elefanten i rummet i den här artikeln:

> https://mbuege.com/2025/09/04/hugo-include-shortcode/

```mermaid
treeView-beta
    arketyper/
    tillgångar/
    innehåll/
      inkluderar/
        dummy.md :::markera ## ospårat beroende i Hugo
      inlägg/
        2025-01-01-post1.md  ## kan använda "inkludera" kortkoder
        2025-01-02-post2.md  ## ...
    data/
    i18n/
    layout/
      kortkoder/
        include.html ## använder readFile() på ett godkänt argument
    statisk/
    teman/
```

*Hugo spårar inte innehållsberoenden som uppstår från kortkoder och gör rigida DAG-antaganden om innehållsberoenden som den spårar.*

##### Orions spårade `ssi` samtal

```mermaid
treeView-beta
bål/
   innehåll/
     foo/
	   fileA.md.en:::highlight ## målinkluderingsfil
	 bar/
	   fileB.md.en ## `ssi` innehåller utvalda delar av fileA.md.en
   cgi-bin/
   lib/
   mallar/
```

*Orion spårar internt `fileB.md.en`'s beroende av `fileA.md.en` och kommer att återuppbygga den när som helst `fileA.md.en` ändras, och beroenden är kompletterande konfigurerbara per dokument, inte bara antas av arvarkisk struktur.*

Orions beroendediagram är **nästan aldrig en DAG**. Och det är **en viktig del av byggandet**, inte bara en halvbackad optimering som det är med Hugo.

Till exempel har den här webbplatsens nedsättningskälla själv en `Dependencies: *.md{{lang}}` sidhuvud (du kan se det i ovanstående Editor skärmdump av det, eller genom att klicka på [:fa-github: källa](https://github.com/SunStarSys/www.iconoclasts.blog/blob/trunk/content/joe/ssg.md{{lang}}) länk där titel- och författarinformation visas) som används av Orion för att generera objekten under "Index" sidhuvud i sidans sidfot.
Alla filer i den här katalogen är på samma sätt konfigurerade att korsreferera varandra!

<span class="text-success">DAG är en bruttoförenkling av kraven på innehållsberoende i verkliga användningsfall.</span>

[![inte en DAG](../images/deps.svg{{lang}})](dependencies)

### Versionskontroll

#### Git- och finjusterade åtkomstkontrollistor

**Omöjligt** i alla DVCS som `git` &mdash; läsåtkomst till databasen innebär åtkomst till hela databasen, inklusive fullständig historik.  Ditto för push-åtkomst: det är allt-eller-ingenting, vilket är en deal-breaker i en wiki-kontext där olika databasanvändare kräver detaljerad fil / katalog skrivbehörighet / åtkomstkontroller.

#### Subversion

Trivial **per-user-integrering** med git/GitHub via `git-svn` brygga paketerad som en tilläggstillägg av varje `git` distribution.

## Fotnoter

[^1]. För en jämförelse mellan äpplen och äpplen porterade jag en delmängd av <https://www.openoffice.org> `JBake` källträd @apache/openoffice-org till Hugo och riktmärkte det mot en enkel `hyde` baserat tema som bara kullade `body` innerHTML utanför `.html` källor (namnändras som `.md` filer med inbäddade html) a'la

```html
{%templatetag openvariable %} define "main" -{% templatetag closevariable %}
<div class="post">
  <h1>{% templatetag openvariable %} .Title {% templatetag closevariable %}</h1>
  <time datetime={% templatetag openvariable %} .Date.Format "2006-01-02T15:04:05Z0700" {% templatetag closevariable %} class="post-date">{% templatetag openvariable %} .Date.Format "Mon, Jan 2, 2006" {% templatetag closevariable %}</time>
  {% templatetag openvariable %} $matches := findRESubmatch `(?s)<body[^>]*>(.*?)</body>` .Content {% templatetag closevariable %}
  {% templatetag openvariable %} range $matches {% templatetag closevariable %}{% templatetag openvariable %} index . 1 | safeHTML {% templatetag closevariable %}{% templatetag openvariable %} end {% templatetag closevariable %}
</div>
{% templatetag openvariable %} if .Site.Config.Services.Disqus.Shortname -{% templatetag closevariable %}
<h2>Comments</h2>
{% templatetag openvariable %} template "_internal/disqus.html" . {% templatetag closevariable %}
{% templatetag openvariable %}- end {% templatetag closevariable %}
{% templatetag openvariable %}- end {% templatetag closevariable %}
```

Och här är den `hugo.toml` fil:
```text
baseURL = 'https://openoffice.org/'
languageCode = 'en-us'
title = 'My New Hugo Site'
theme = "hyde"
[markup]
  [markup.goldmark]
    [markup.goldmark.renderer]
      unsafe = true
```

Det tog vanligtvis 8-12 sekunder (ibland upp till 30s) att bearbeta 10K sådana filer.  Jämfört med @SunStarSys/orion build `./test.sh ooo` vilket [konsekvent bygger över 20K sådana filer i ungefär 2-3x tiden](https://github.com/SunStarSys/orion/actions/runs/28297700630/job/83840391681#:~:text=44556), det verkar som om det finns **prestanda paritet** mellan dem på de minst komplexa men mycket stora webbplatser som <https://www.OpenOffice.org>.

Men, [Orion](https://www.sunstarsys.com/orion/) är kapabel till så mycket mer om du behöver sann flexibilitet och korrekt inkrementell byggstöd, eftersom **vi tror att du vet vad som fungerar bäst för din webbplats, till skillnad från resten av den överhypade SSG-gemenskapen runt Hugo.**

[^2]. Fullt stöd för inhägnad `asy` Markdown-block med källor kodade i @vectorgraphics/asymptote .

<!-- $Date$ $Author$ $Revision$ -->
