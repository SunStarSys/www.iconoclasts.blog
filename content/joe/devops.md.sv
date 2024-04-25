---
archived: ~
categories: informationsteknik
dependencies: '*.md.sv'
keywords: utvecklare
published: ~
status: arkiverad
title: Rörelsen DevOps
---

[TOC]

## Mer än att bara ge utvecklare rotåtkomst!

Eller inte ens det. {# lede #}Den stora idén bakom "rörelsen" är inte bara att ge utvecklare mer rep{# lede #}

Begränsningshantering är nyckeln till processen.  Genom att först identifiera alla flaskhalsar i systemet kan du fokusera dina ansträngningar på att optimera dessa resurser för att uppnå maximal effekt.  Optimeringar bortom dessa områden är nästan alltid inte värt besväret &mdash;

## Trunkbaserad utveckling

Att uppmuntra till inkrementella förändringar med automatiserade testnings-, marknadsförings- och frisläppningsprocesser på en schemalagd takt är ett bra sätt att få bollen i rullning, men en stor del av kvalitetskontrollen i SaaS/PaaS-distributioner involverar att *[trunkbaserad utveckling](https://trunkbaseddevelopment.com).

I grund och botten skapar multiversionen av långsiktiga "git"-grenar den psykologiska fiktionen att den kombinerade sammanslagningen av allt detta lokala utvecklingsarbete (och testning!) kommer att leda till en helhet som är minst lika stor som summan av dess delar.  Erfarenhet är den bättre domaren, vilket tyder på att omfattande-nya-funktioner-set bör konstrueras *inkrementellt*, *in-situ*, på den befintliga produktion / frisättning gren källkod.  I grund och botten konstruerar du dina utvecklingsstrategier inom gränserna för den biologiska världens fysik, som säger:

```text
        Surgery on a patient must result
		in good outcomes (at all times) for
        that patient, not just for siblings
		or future generations.
```

### CI-/CD-pipeliner

Trunk Based Development är grunden för alla därmed automatiserade förändringskontrollledningar som har vuxit upp under de senaste två decennierna.

## Kod är lag (Utveckling + Infrastruktur + Konfiguration).

Lite historiskt perspektiv först; slaglinjen följer dessa fyra stycken.  Den gemensamma tråden här är att Apache nästan alltid har varit före sin tid.

Tillbaka i pre-[CFEngine](https://cfengine.com).

Arbetsflödet var mindre än perfekt: förutom att bygga våra egna lokalt lappade FreeBSD-portar i driftsättningsbara (binära) paket från grunden var personalen tvungen att utöva svår att upprätthålla *disciplin* när de distribuerade ändringar i produktionen, genom att först bekräfta versionskontroll, logga in på målservern, uppdatera kassan och eventuellt starta om tjänsten &mdash;

Numera håller de allt i ett "git" -stödd marionettkällträd och tillhandahåller / distribuerar / konfigurerar direkt till molnet med generiska uppströms Ubuntu-paket, vilket är ett något modernt sätt att deras IT-ops arbete, eftersom schemalagda "git" drar av marionettmästaren så småningom kommer att distribuera uppdateringar som marionettagenter check-back-in.  Men CI / CD är en work-in-progress, även i dag.

Å andra sidan var ett tidigt, banbrytande CI-liknande initiativ vid ASF (för faktiska Apache-programvara TLP-projekt) [Apache Gump](https://gump.apache.org/).

Här är *punkten i ett nötskal*: alla dina källor (utveckling, infrastruktur och konfiguration) tillhör versionskontroll (inte nödvändigtvis samma datalager) som kan granskas av all utvecklingspersonal och är en del av din fullständiga uppsättning testautomatiseringspipeliner mellan korrigeringsversioner och produktionsdistributioner.  En undersökning av den senaste tekniken, där förändringar testas/tilldelas/distribueras på begäran i IaC/CaC inställningar, finns på min vän och visionär Paul Hammants hemsida [här](https://paulhammant.com/2014/08/27/provisioning-deployment-and-app-config-cycles/).

## Virtualisering kontra containerisering: en [Pets vs. boskap](http://cloudscaling.com/blog/cloud-computing/the-history-of-pets-vs-cattle/).

Containersystem som Docker är anpassningsbara, omdistribuerbara virtualiseringstekniker som vanligtvis används för att stödja ett MicroService Architecture (MSA) -ramverk för applikationskluster som Kubernetes. De plockar upp där virtualiseringssystem slutade, handel obegränsat stöd av (helt) isolerade per-VM operativsystem för Linux-kernel baserade virtuella maskiner som har betydligt mer programmerbar anpassning och integration med den överordnade Linux värd som de körs på.  Dessutom kan de byggas om och *uppladdas* till en central distributionstjänst (som artefakt) för storskalig återanvändning över flera beroendekedjor och råa körbara serverdistributioner.

### Vertikal kontra horisontell skalning

Omkonfigurerbara containrar som kan laddas ned från en central server gör det möjligt att utnyttja de möjligheter som är svåra att förverkliga med grundläggande virtualiseringsteknik - du är inte låst till någon enskild servers hårdvarugränser för att skala ut dina tjänster för att möta efterfrågan.  Med andra ord är horisontell skalning genom att distribuera samma behållare över samlingar av värdar, ** på begäran**, en omedelbart uppnåelig förstklassig funktion i MSA-ramverk baserade på Docker.  Precis som när du distribuerar dussintals fler containrar än processorkärnor på värden *samma*.

## Mät, bromsa och kontrollera brandbekämpningsinsatser, både verkliga och praktiska

En av de andra viktiga sakerna att känna igen är att skilja mellan *planerat* och * oplanerat* arbete i någon av dina produktivitetsmätvärden och hur resurser allokeras till dessa uppgifter.  Oplanerat arbete uppgår till **firefighting**, och om för mycket tid (mer än ~20 %) spenderas på dessa uppgifter, blir det planerade arbetet, vilket är det verkliga affärsbehovet för företaget, eftersläpande.

Flaskhalsarna i systemet klarar sällan av oplanerat arbete, så det är viktigt att ha tillräckligt med extra resurser för att hantera den ökade belastningen och efterföljande eftersläpning.

En av de viktigaste lärdomarna av COVID-19 i början av 2020, som sjukhuskapacitet när det gäller IT, är att det finns en sådan sak som att vara *för lean*, åtminstone när det gäller devops bemanning (hårdvara är en annan historia).  Beredskapsplanering för en regnig dag, antingen med "redundant" personal eller cross-training initiativ, kombinerat med regelbundna förberedande övningar, håller inte bara doktorn borta, men är faktiskt ** uppdragskritisk**.

## Komma med programmet

På ledningsnivå är ett globalt förändringshanteringsperspektiv mellan både devs och ops förändringar avgörande. Båda grupperna måste vara medvetna om varandras förändringar. Helst med planeringsdetaljer som görs tillgängliga längs vägen.  **Stora saker kan hända** när lagen är en hälsosam blandning av utvecklare och ops-personal, i en datastyrd, transparent kultur av samarbetsarbete.

Filosofin om att inkludera många intressenter i skapandet, och **evolution**, av en konkret arbetsprodukt har konsekvenser långt bortom bara * dev * och *ops * team som delar kontroll och ansvar för en serverteknikinsats. Denna lektion fortsätter att upprepas i hela den moderna företagsvärlden, eftersom nya domäner för kreativt mänskligt uttryck tar form i näringslivet, liksom att återuppfinna gamla sätt att göra affärer tillsammans.


<!-- $Date$ $Author$ $Revision$ -->
