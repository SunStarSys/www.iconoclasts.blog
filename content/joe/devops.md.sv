---
categories: informationsteknik
dependencies: '*.md.sv'
keywords: utveckling
status: arkiverad
title: DevOps-rörelsen
---

[TOC]#sidebar

## Mer än att bara ge utvecklare root-åtkomst!

Eller inte ens det. {# lede #}Den stora idén bakom "rörelse" Det är inte bara att ge utvecklare mer rep{# lede #}Det handlar om att säkerställa bättre kommunikationslinjer mellan *utvecklare* och *operations* teamen i företaget.  Mycket av detta är inte nytt, i själva verket är det en rehash av "kaizen" -rörelsen inom traditionella industriella (esp. bil) leveranskedjor under det föregående århundradet.  Kanban styrelser är bara den senaste rehashen av fågelperspektiv instrumentpaneler (dubbling som arbetsflödets lagerchefer) som täcker den kollektiva dagliga ansträngningen att leverera kvalitetsprodukter som glädjer både kunder och affärspartners.

Begränsningshantering är nyckeln till processen.  Genom att först identifiera eventuella flaskhalsar i systemet, kan du fokusera dina ansträngningar på att optimera dessa resurser för att utföra maximal effekt.  Optimeringar bortom dessa områden är nästan alltid inte värt besväret &mdash; Arbetsflödet kommer fortfarande att begränsas av dessa resurser.

## Trunkbaserad utveckling

Att uppmuntra till inkrementella förändringar med automatiserade test-, marknadsförings- och frisläppningsprocesser på en schemalagd frekvens är ett bra sätt att få bollen i rullning, men en stor del av kvalitetskontrollen i SaaS/PaaS-distributioner innebär att man antar *[stambaserad utveckling](https://trunkbaseddevelopment.com)* och dess *gren av abstraktion* begrepp.  (Besök länken för en grundlig diskussion om funktioner och nackdelar).

I grund och botten, multiversum av långsiktig `git` grenar skapar den psykologiska fiktion som den kombinerade sammanslagningen av allt detta lokala utvecklingsarbete (och testning!) kommer att leda till en helhet som är minst lika stor som summan av dess delar.  Erfarenhet är den bättre domaren, vilket tyder på att omfattande nya funktioner bör konstrueras *inkrementellt* *in situ * på den befintliga produktion / frisättning filial källkod.  I grund och botten konstruerar du dina utvecklingsstrategier inom begränsningarna i den biologiska världens fysik, som säger:

```text
        Surgery on a patient must result
		in good outcomes (at all times) for
        that patient, not just for siblings
		or future generations.
```

### CI-/CD-pipeliner

Trunk Based Development är grunden för alla efterföljande automatiserade rörledningar för förändringskontroll som har vuxit upp under de senaste två decennierna.

## Kod är lag (utveckling + infrastruktur + konfiguration)

Lite historiskt perspektiv först; punchline följer dessa fyra stycken.  Den gemensamma tråden här är att Apache nästan alltid har varit före sin tid.

Tillbaka i pre-[CFEngine](https://cfengine.com) Dagar behöll Apache Software Foundation alla sina IT-konfigurationsfiler och supportskript i CVS och därefter Subversion.  Dessutom hade varje tjänst vi körde en tillhörande "körbok" för att vägleda administratörer med sina praktiska underhållsarbeten.

Arbetsflödet var mindre än idealiskt: förutom att bygga våra egna lokalt korrigerade FreeBSD-portar träd i distribuerbara (binära) paket från grunden, var personalen tvungen att träna svårt att tillämpa *disciplin* när du distribuerar ändringar i produktionen, genom att först binda till versionskontroll, logga in på målservern, uppdatera kassan och eventuellt starta om tjänsten &mdash; Allt detta repetitiva arbete utförs för hand. I verkligheten hackade sysadmins för det mesta direkt på målservern och begick från den serverns kassan, vilket riskerade många sammanslagningskonflikter längs vägen när trädet uppdaterades (antingen då, eller någon gång på vägen genom framtida åtgärder som utfördes av någon annan anställd). Ett ganska mindre transparent arbetsflöde, med tvivelaktig säkerhet för lösenordshantering, för ett samarbetsinriktat ops-team.

Numera håller de allt i en `git`-stödda marionettkällträd och tilldela / distribuera / konfigurera direkt till molnet med hjälp av generiska uppströms Ubuntu-paket, vilket är ett något modernt tillvägagångssätt för deras IT-ops arbete, sedan planerat `git` dra av marionettmästaren kommer så småningom att distribuera uppdateringar som marionettagenterna check-back-in.  Men CI/CD är ett pågående arbete, även till denna dag.

Å andra sidan var ett tidigt, banbrytande CI-liknande initiativ på ASF (för faktiska Apache-program TLP-projekt) [Apache Gump](https://gump.apache.org/), som var hjärnbarnet av briljanta kollegor som Sam Ruby och företag.  Vad gumpen gjorde var att regelbundet checka ut, bygga och testa HEAD (inklusive HEAD av alla deps) av stammen i varje kodbas i Subversion-förvaret (men går tillbaka till CVS) för varje projekt som den framgångsrikt kunde räkna ut hur man bygger (som var i stort sett begränsad till Java-projekt ursprungligen). Rapporter skickades automatiskt till varje utvecklingsgemenskap och arkiverades för eftervärlden.  Denna insiktsfulla **toil automation**-aktivitet pågår fortfarande (med git) till denna dag!  **Alla utvecklingsgrupper i företagsklass som inte kör sin egen Gump-server är 20y bakom den senaste tekniken på ASF (IMO; kom inte igång med versionshålade programvarumodulberoenden med öppen källkod i /trunk|master/ ...).**

Här är *punkten i ett nötskal *: alla dina källor (utveckling, infrastruktur och konfiguration) hör till versionskontroll (inte nödvändigtvis dela samma lagringsplats) som kan granskas av alla devops personal, och är en del av din fullständiga uppsättning av test-automatiseringsrörledningar mellan korrigeringsrevisioner och produktionsdistributioner.  En undersökning av den senaste tekniken, där förändringar testas / tillhandahålls / distribueras på begäran i IaC / CaC inställningar, finns på min vän och visionär Paul Hammants hemsida [här](https://paulhammant.com/2014/08/27/provisioning-deployment-and-app-config-cycles/). Snälla ta en titt!

## Virtualisering kontra containerisering

A [Husdjur vs. nötkreatur](http://cloudscaling.com/blog/cloud-computing/the-history-of-pets-vs-cattle/) Redux

Containersystem som Docker är anpassningsbara, omdistributionsbara virtualiseringstekniker som vanligtvis används för att stödja ett MSA-ramverk (MicroService Architecture) som Kubernetes. De plockar upp där virtualiseringssystem slutade, handlar obegränsat stöd för (helt) isolerade per-VM-operativsystem för Linux-kernel-baserade virtuella maskiner som har betydligt mer programmerbar anpassning och integration med den överordnade Linux-värd som de körs på.  Dessutom kan de byggas om och *laddas upp* till en central distributionstjänst (som artefakt) för omfattande återanvändning i flera beroendekedjor och råa körbara serverdistributioner.

### Vertikal kontra horisontell skalning

Omkonfigurerbara containrar som kan hämtas från en central server möjliggör möjligheter som är svåra att förverkliga med grundläggande virtualiseringsteknik – du är inte låst till någon enskild servers maskinvarugränser för att skala ut dina tjänster för att möta efterfrågan.  Med andra ord är horisontell skalning genom att distribuera samma container över samlingar av värdar, **på begäran**, en förstklassig funktion som omedelbart kan uppnås i MSA-ramverk baserade på Docker.  Precis som du distribuerar dussintals fler containrar än processorkärnor på värden *samma*.

## Mät, hantera och kontrollera brandbekämpningsinsatser, både verkliga och praktiska

En av de andra viktiga sakerna att känna igen är att skilja mellan *planerad* och *oplanerad* arbete i någon av dina produktivitetsmätetal och hur resurser allokeras till dessa uppgifter.  Oplanerat arbete uppgår till **brandbekämpning**, och om för mycket tid (mer än ~ 20 %) spenderas på dessa uppgifter blir det planerade arbetet, vilket är det verkliga affärsbehovet för företaget, eftersläpande.

Flaskhalsarna i systemet klarar sällan oplanerat arbete, så det är viktigt att ha tillräckligt med extra resurser för att hantera den ökade belastningen och efterföljande eftersläpning.

En av de viktigaste lärdomarna av COVID-19 i början av 2020, som sjukhuskapacitet när det gäller IT, är att det finns en sådan sak som att vara *alltför magert *, åtminstone när det gäller devops bemanning (hårdvara är en annan historia).  Planering för en regnig dag, antingen med "redundant" personal eller cross-training initiativ, i kombination med regelbundna förberedande övningar, inte bara håller läkaren borta, men är faktiskt **mission kritisk **.

## Komma med programmet

På ledningsnivå är ett globalt förändringshanteringsperspektiv mellan både devs och ops förändringar avgörande. Båda grupperna måste vara medvetna om varandras förändringar. Helst med planeringsdetaljer tillgängliga längs vägen. **Bra saker kan hända** när teamen är en hälsosam blandning av utvecklare och ops-personal i en datadriven, transparent kultur av samarbetsarbete.

Filosofin att inkludera många olika intressenter i skapandet, och **evolution**, av en konkret arbetsprodukt har konsekvenser långt bortom bara *dev* och *ops* team som delar kontroll och ansvar för en serverteknikinsats. Denna lektion fortsätter att upprepas i hela den moderna företagsvärlden, eftersom nya domäner för kreativt mänskligt uttryck tar form inom näringslivet, liksom för att återuppfinna gamla sätt att göra affärer tillsammans.

<!-- $Date$ $Författare: joe $ $Revision$ -->
