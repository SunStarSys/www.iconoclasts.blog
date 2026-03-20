---
archived: ~
categories: Perl, Apache, ZFS
dependencies: '*.md.sv'
keywords: apache,OpenOffice,cms,wiki
published: ~
status: skiss
title: Apache CMS retrospektiv
---

<div class="right">

![tjärat och fjädrat](apache-considered-harmful.page/feather2).

</div>

Den [Apache CMS](https://web.archive.org/web/20120112045033/http://www.apache.org/dev/cms) &mdash; uppfanns i oktober 2010 av utvalda medlemmar i Apache Infrastructure Team ([Paul Querna (VP)](https://paul.querna.org/articles/2010/10/22/evolution-of-apaches-websites/), Daniel Shahaf, Ph.D. (SVN dev), och jag själv), [formellt föråldrad i juni 2015](https://lists.apache.org/thread/zdv943hwmj7r4wms1pr1s4f72kvxd8gb)och slutligen [avvecklad i januari 2022](https://apache.org/dev/cms) &mdash; Alltid före sin tid.  Vid sin höjdpunkt förlitade sig över 100 Apache-projekt på det, men inget mer än Apache OpenOffice. Aldrig var dess nuvarande prestandateknik tydligare bevisad än i dess funktioner för hantering av innehållsberoende under de första åren av Oracle-donationen av OpenOffice till Apache i juni 2011.

För att vara tydlig: när andra talar om beroendehantering, är de främst intresserade av programberoenden, inte [innehållsberoenden](dependencies). {# lede #}Allt kokar ner till välreglerat innehåll "inkluderar" i templating+build-systemet{# lede #}, vilket inte alls är samma sak som mjukvarudeps.

Denna funktion var helt avgörande för att stödja Apache'massiv <https://OpenOffice.org> (OOo) webbplats.  RDBMS CMS Sun som ursprungligen tillhandahölls till OOo skulle falla över och dö även om du bara ville fixa ett stavfel. Däremot körde Apache CMS på en FreeBSD fängelse på baldr.apache.org: en måttligt tilldelad, [Dell 1950-låda som kördes på 8 CPU och 24 GB RAM med ett par speglade hårddiskar på 96 GB](https://web.archive.org/web/20120112034217/http://www.apache.org/dev/machines.html#:~:text=baldr) över flera fängelser, och flög genom arbetsflödet med relativ lätthet.

Utan några limning CMS som tjänst som kan få en bidragsgivare i en redigeringssession för sidan de vill reparera i en enda klick, är den kognitiva energin alldeles för stor för att fixa ett stavfel på en webbsida idag:

1. gå och fiska den sidan ur en github-repo,
2. gaffla repo,
3. redigera sidan,
4. genomföra ändringen,
5. tryck på den,
6. skapa en PR,
7. **vänta** tills en beställare godkänner och slår samman PR.
8. [**vänta** 10-15 minuter för att mellanlagringsversionen ska slutföras](https://ci-builds.apache.org/job/OpenOffice/job/OpenOffice-org-Staging-Site-Build/) medan den slipar igenom alla 40K+ byggbara tillgångar (~4 GB total storlek),
9. **vänta** så att en beställare kan hitta och granska det publicerade ändrade innehållet någonstans på [mellanlagringsplats](https://www.staging.openoffice.org/),
10. **vänta** så att beställaren flyttar upp den **hela platsen** till produktionen.
11. [**vänta** ytterligare 5-10 minuter för att publiceringsversionen ska slutföras](https://ci-builds.apache.org/job/OpenOffice/job/OpenOffice-org-Publish-Site/),
12. **vänta** för att gitpubsub ska pusha ut det nya innehållet till Apache's edge-webbservrar.

Med Apache CMS (webgui), dela en committable "patch/diff." över e-post var en enkelklicksoperation för någon person på jorden, samt en enkelklicksoperation för att bekräfta + bygga + publicera för en beställare att tillämpa på projektet. Det hela kretsade kring delning av funktions-URL:er i kontexten av en live Markdown-redigerare med samtidiga HTML-förhandsgranskningar med dubbla rutor. De tillät en Apache committer på projektet att "klon" baldr-jail-hosted zfs-filsystem för en bidragsgivare's (obekräftade) utcheckning; och därefter inspektera, ändra och begå den klonade utcheckningen av Apache committer själva **som committer och inte bidragsgivaren**.  När det begås har CMS inte bara byggt det på *sekunder *(eftersom det'endast bygga de ändrade filerna och deras handfull beroende filer), men det gav också **länkar** till bygget och till levande återgivning av innehållet på mellanlagringsplatsen för granskning före befordran till produktion.

Hela **One-Click **Amazon Patent var avgörande för kundnöjdhet för dem.  Samma sak här; men Apache CMS var helt ensam i detta utrymme.

Apache CMS (webgui) var den nödvändiga samordningsväxeln mellan all frivillig energi som tyvärr har lämnat org bakom sig.

Det finns flera ursäkter Apache'Infrastruktur Ledarskap gjort om varför det släpptes:

1. en bussfaktor på 1 (me),

2. Utfasning av FreeBSD ([OpenZFS](https://openzfs.org/wiki/Main_Page) körs på ubuntu),

3. [mod_perl](https://perl.apache.org/)inte python (men tydligen [mod_lua](https://lists.apache.org/) är kosher),

4. buggy (otroliga zfs kloner från ett litet FreeBSD fängelse),

5. ful (tack, rik!),

5. git är bättre (tack Greg!).

Men det verkliga motivet var *spett*.  Mellan den tid den avvecklades i mars 2015 och den tid den slutligen avvecklades i januari 2022 hade den kört på autopilot i ett FreeBSD-fängelse på baldr.apache.org i nästan 7 år. Det enda underhåll som krävdes var (kvartalsvis?) omstart av värd på grund av artikel 4 ovan, och årliga förnyelser av SSL-certifikat. Detta'IT.

När push kom att skjuta i slutet av 2021 erbjöd jag Dave Fisher att vara värd för OpenOffice-webbplatsen på Orion med en brant rabatt. Först bad Dave styrelsen och de **godkände kostnaden**. Dave erbjöd ASF att avstå från fyndavgiften jag gick med på att betala honom och sa till mig att lägga pengarna mot värdkostnaderna.

Vad som hände sedan var verkligen anmärkningsvärt: Apache Infrastructure Team, omedelbart och ihärdigt under en period av veckor, satte Dave i den otacksamma positionen att förklara sina nu exklusiva lojaliteter, enligt dem: för mig och i förlängningen projektet.'s **volontärgrupp**, eller till **ASF**.

Dave var den viktigaste innovatören och samarbetspartnern bakom skalbarhetsframgångarna i The Apache CMS'stegvis byggteknik.  Han gjorde't uppfinna lösningarna; men han arbetade produktivt med mig om hur jag lade till skalbarhetsfunktioner han behövde för att säkerställa högpresterande byggen från The Apache CMS som tillämpas på OpenOffice-webbplatsen - som vid den tiden levererade norr om 25M begär en dag! Tillsammans upptäckte vi en djupgående tillämpning av [SSI](https://en.wikipedia.org/wiki/Server_Side_Includes) i hans ansträngningar, som jag tror fortfarande genomförs i det JBake-templateringssystem som används i dag.

Tyvärr, om du tittar på innehållsredigering som pågår med OpenOffice'på GitHub nyligen kan du tydligt se en massiv avhoppning i aktivitet när Apache Infrastructure Team tvingade Dave att flytta dem från Apache CMS, och som ett resultat kanaliserade all bidragsaktivitet genom GitHub ensam.

Ja, det gör jag'Jag skyller inte Dave för det fula val han tvingades göra, inte heller för det förutbestämda resultatet, men vi är uppenbarligen inte längre på talande villkor sedan den dagen.

Vad som är chockerande med hela affären var den absoluta krigaren hos Apache Infrastructure Team om hela ansträngningen.  Jag höll personligen hand om varje projekt som vi introducerade till Apache CMS; att se all den goodwill som skapade **brännas till marken genom autokratiska dekret** var helt enkelt outgrundlig för mig som en lång tid medlem av organisationen.

Allt de någonsin gjorde var att ge de strandsatta Apache-projekten kalla ultimatum, och aldrig en enda timmes ansträngning dedikerad till att personligen offboarding dem till **allt annat**. Det var inte annorlunda med OOo; de missbrukade, hotade och tvingade Dave att göra sin budgivning.  Och det gjorde han.

Jag avgick 2018. Kunde inte'Fortsätta att bevittna det.  Det jag gjorde 2020 var att bygga [Orion](https://sunstarsys.com/orion) från askan.  Men även den avenyn stängdes för Apache-projekt av Apache Infrastructure Team.

Allt för *spite*.

Ledsen.

<!-- $Date$ $Author$ $Revision$ -->
