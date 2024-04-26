---
archived: ~
categories: Versionskontroll, Apache
dependencies: '*.md.sv'
keywords: säkerhet,icke-förnekande,DVCS,versionskontroll,icla
published: ~
status: arkiverad
title: Git och non repudement
---

Denna uppsats gäller verkligen DVCS i allmänhet, inte bara git per se.  Men vi kommer att fokusera uppmärksamheten på git eftersom det fortfarande är den mest populära DVCS runt idag.

[Ej avvisande]

Med ett traditionellt centraliserat versionskontrollverktyg är sådana poster lätt tillgängliga från bekräftelsehistoriken.  Varje bekräftelse till systemet går igenom en auktoriseringsmekanism för att säkerställa att den person som gjorde ändringen har behörighet att ladda upp den.  Dessa register är avgörande för företaget för att säkerställa att korrekta register förs som visar vem som är ansvarig för att ladda upp varje kodrad till programvaran i fråga.

Med git, eller distribuerad versionskontroll i allmänhet, {# lede #}Det finns en tydlig skillnad mellan "åtagandets" historia och "uppladdningens" historia.{# lede #} &mdash; som jag kommer att hänvisa till som "push records". Bekräftelser i git autentiseras inte, eftersom de sker lokalt, med lokala, overifierade metadata tillagda i historiken.  Uppladdningssteget, aka `git push`

Med [Apache Software Foundation]

Varför är detta viktigt?  Tja till att börja med låt mig ta itu med en vanlig missuppfattning om behovet av bidragsgivare licensavtal (ICLA) för Apache-företag.  Många verkar inte förstå att det inte finns någon skillnad mellan det tillämpliga språket i de enskilda författarverken. [ICLA](http://www.apache.org/licenses/icla.txt) och [Apache-licens 2.0]

Vad push-poster ger då är ett sätt att spåra tillbaka, till varje rad av kod i en release, den enskilda committer som ansvarar för att driva den koden till ASF: s git-datalager. Detta är kritiskt viktigt för att bestämma härkomst av ett bidrag från tredje part med git, eftersom det tyvärr är möjligt för en sådan bidragsgivare att "gå bort" från sitt bidrag till ett git-projekt på grund av den distribuerade typen av DVCS-loggar.  Den ansvariga parten blir då, enligt ICLA, den beställare som drev koden.

Tidiga och korrekta begränsningsstrategier kretsar kring att ta bort det övergivna bidraget, men skadorna på projektet kan redan ha gjorts.  Och utan push-rekorden skulle vi bokstavligen inte ha någon auktoritativ process för att bestämma hur den koden faktiskt kom in i vårt lager, annat än att tråla igenom alternativa poster i problemspårare eller on-list-kommunikation.  Att enbart förlita sig på sammanslagningsbekräftelseloggar för att bestämma härkomst är inte särskilt tillfredsställande ur säkerhetssynpunkt, eftersom det kräver strikt efterlevnad av en viss typ av arbetsflöde, som vi inte vill diktera.

Utan sådana saker skulle vi behöva mandat åtminstone PGP-signering av varje bidragsgivares åtagande, vilket är betungande för många projekt.  Push-poster ger en transparent process som inte påverkar ett projekts arbetsflöde, annat än för att säkerställa att ASF:s git-datalager är det verkliga huvuddatalagret.

*$Datum: 2023-01-19 22:58:40 +0000 (Thu, 19 Jan 2023) $*
