---
categories: Orion
dependencies: '*.md.sv'
keywords: nedsättning,Microsoft,Github,korrupt,omfamna, utöka,sykofant,AI
status: verifierad=40181
title: Microsoft anses vara skadligt
---

<div class="right">

![Omfamna och utöka det onda imperiet](markdown-is-not-latex.page/microsoft)

</div>

## Ursprung för nedsättning

{# lede #}Poängen med [Syntaxspecifikation för John Grubers Markdown](https://daringfireball.net/projects/markdown/syntax) var att hans "Nedsättning" var tänkt att vara lätt att arbeta med{# lede #}Inte bara ur författarsynpunkt, utan också ur en implementerares perspektiv.  $$\LaTeX$$, `MathML`och `HTML5` är inte det.

## :fa-github: GitHub Smaksatt nedsättning (GFM)

[Personalhantering](https://github.github.com/gfm/) höll fast vid specifikationens designmål ända fram till [Microsoft bastardized den isolerade dollartecknet för att villkorligt konvertera det till en $$\LaTeX$$ tecken](https://docs.github.com/en/get-started/writing-on-github/working-with-advanced-formatting/writing-mathematical-expressions#writing-inline-expressions) på grund av några cloistered, föråldrade, fula och långsamma institutionella crapware kallas [MathJax](https://www.mathjax.org/) som inte hade något att göra med Markdown, och det faktum att dessa rövhål inte vill främja performant, [`utf8`](https://www.bing.com/search?q=does%20mathjax%20support%20utf%208)-kompatibel [$$\KaTeX$$](https://katex.org/) Utan en muta från Khan Academy.

## Omfamna och utöka Redux

Naturligtvis var detta helt avsiktligt, eftersom [prisbelönt](https://itsfoss.com/online-markdown-editors/), [:editormd-logo: ingenjörsteam i världsklass](http://editor.md.ipandao.com) hade bestämt sig för $$\KaTeX$$ med [Tokengränser för dubbla dollar](https://github.com/pandao/editor.md/blob/master/examples/katex.html#L45) för infogad matematik, och inhägnade matematiska block eller par av dubbeldollar-bara omgivande stycken för block $$\KaTeX$$ bearbetning [**2015**](https://github.com/pandao/editor.md/releases/tag/v1.5.0).

Poängen här är att en 2-teckenavgränsare som sällan förekommer i typisk prosa är det normala idealet för situationer som denna. [Hade Microsoft fastnat för att bara stödja \$\` ... \`\$](https://github.blog/changelog/2023-05-08-new-delimiter-syntax-for-inline-mathematical-expressions/) Jag skulle inte skriva den här artikeln 2026, eftersom det valet uppfyller de normala idealiska förutsättningarna för trogen introduktion av inline matematiska uttryck i en Markdown spec. Det bidrar också till karpaltunnelsyndrom för professionella matematiktypister, så det finns något annat att tänka på förutom gränstoken unikhet.

Om jag var tvungen att gissa deras motiv för att överväga att bloggartikelns föreslagna syntax otillräcklig för deras nuvarande behov, misstänker jag att de var mer om girighet och marknadskontroll och "kundmissnöje" Bra F/OSS förvaltning.

Eller bara [Lättja, otålighet och Hubris](http://www.parrot.org/)Men det är inte konspiratoriskt nog för den här artikeln. ÅMMV

Det är nu en tvetydig katastrof av tekniska regex-defekter varje gång en författare / implementerare måste gissa vad parsern ska göra med sekvenser av isolerade dollartecken som förekommer inom ett enda stycke av nedsättningsprosa. Tänk dig en situation där [Franska](markdown-is-not-latex.html.fr) Kanadensiska finansiella matematiker diskuterar två priser i två olika valutor, säger USA `$`1,50 och 2 00`$` CA (visst framtagen, men det illustrerar komplexiteten). Hur skulle du skriva ett `i18n` kompatibel [GFM-parser](https://pandoc.org/) som förstår att grejerna mellan dollartecknen här är *inte att behandlas som inline $$\LaTeX$$*, även om det är syntaktiskt giltigt $$\TeX$$ och överensstämmer med detta [naiv spec](https://pandoc.org/demo/example33/8.13-math.html)? Har Claude läst den?

Lycka till med det om du gör en bulk GFM-konvertering av internationella äldre dokumentformat till en icke-GitHub plattform. Det kommer bara "studera" när det renderas i Visual Studio, om det ens fungerar alls.

Det är en sak att säga att du inte kommer att skriva saker **idag** som förvirrar parser **nu**; Det är en helt annan att säga att de saker som skrivs i **tidigare** inte kommer att förvirra parser: idag, eller i **framtida** parserutgåvor.

Till skillnad från standarder som kommer från [JCP](https://jcp.org/en/home/index), det kommer aldrig att finnas en överensstämmelse-certifierande testsvit för denna röra, eftersom det är en [utvecklas](https://github.com/github/markup?tab=readme-ov-file#github-markup) [plats](https://github.com/kivikakk/comrak/blob/d2da7a055008a8ccde18cc1c88a06a04de69fa99/src/nodes.rs#L200) på [marken](https://github.com/gjtorikian/commonmarker/blob/c1ce5afbf36610ae14d91db809f3f0a3bc4386bc/test/math_test.rb#L8) vid [GitHub](https://www.bing.com/search?q=what+is+github%27s+current+open+source+markdown+parser)<sup>1</sup>:

> GitHub har inte offentliggjort sin aktuella nedsättningsparser med öppen källkod. Det är dock känt att GitHub använder en anpassad implementering av Markdown för sin plattform, som baseras på specifikationen GitHub Smaksatt nedsättning (GFM). Den här implementeringen har stöd för olika tillägg och funktioner som förbättrar den nedsättningssyntax som används av GitHub.

Återigen, avsiktlig avvikelse från Grubers mål.

Mest äckligt, omfamna och utvidga onda imperiet har en armé av F / OSS fria arbetskraft slavar att fungera som sykofantisk tanke polisen om deras ansträngningar att pilfer arbetskraft andra för sina egna marknadsvinster via AI<sup>1</sup>. Kolla bara in svaren på det flaggade HackerNews-inlägget på den här sidan i avsnittet Länkar nedan för att träffa några av dem.

## Fuck Microsoft

Lång historia kort, GFM är inte längre en internationell industrispecifikation, men en ful-amerikansk-endast proprietär leverantörsformat som inte skiljer sig från den [Wikimediaskräp](https://www.mediawiki.org/wiki/Extension:SimpleMathJax) De kopierade den från.

[Orion](https://www.sunstarsys.com/orion/features) **använder inte och kommer aldrig att använda nyare GFM-parsrar som låtsas spåra denna smutsiga felfunktion**.

Istället förlitar vi oss på en intern gaffel på @markedjs/marked och kommer att fortsätta att göra det under överskådlig framtid.

## Fotnoter

1. Den citerade prosaen var bings ursprungliga AI-svar under de senaste 24 timmarna, tills jag lade till ytterligare bakgrundslänkar till den här artikeln, från vilken den "inlärd" Hur man säger något mindre idiotiskt som svar på frågan "vad är githubs aktuella nedsättningsparser med öppen källkod". Det här är AI som **tar våra jobb**, gott folk.

<!-- $Date$ $Author$ $Revision$ -->
