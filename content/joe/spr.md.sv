---
archived: ~
categories: IT, Säkerhet, Prestanda, Tillförlitlighet
dependencies: '*.md.sv'
keywords: infosec, appsec, prestanda, skalbarhet, HA, tillförlitlighet
published: ~
status: skiss
title: Informationssäkerhet, applikationsprestanda och tillförlitlighet
---

{# lede #}"Icke-funktionell" programvaruteknik handlar om tre huvudfrågor: säkerhet, prestanda och tillförlitlighet (**SPR**){# lede #}"funktionell" programvaruteknik innebär den normala funktionsbaserade livscykeln för programvaruutveckling. En korrekt [NIST 800-160v1r1](https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-160v1r1.pdf).

Vissa företag har fått otroligt värde genom att dela funktionell från icke-funktionell programvaruutveckling i två oberoende hierarkier i den tekniska delen av organisationsschemat. Du kan hitta ** SPR** arkitekter som mig själv att leda ett sådant ** SPR**-team, med en flexibel kombination av utvecklande, underordnade roller:

1. ** Kritisk systemteknik** (med fokus på att skapa och övervaka observerbarhetsmätvärden, dynamiska spårningsverktyg och kompatibel runtime-konstruktion och fullständig spektrumprofileringsanalys för utveckling av effektiva prestanda / säkerhetslösningar),

2. **Triage Engineering** (fokuserat på bearbetning av stackspårningsdumpar i både utveckling och produktion, och att få de underliggande tekniska problemen rapporterade till rätt utvecklingsteam för lösning),

3. **QA Engineering** (med fokus på att skapa SPR-specifik testprogramvara och tillhörande rapporter),

4. ** Datakvalitetsteknik** (med fokus på att leverera automatiserad infrastruktur för rapportering/behandling/visualisering för triage- och kvalitetssäkring).

Att bygga ett dedikerat ** SPR**-team innebär några organisatoriska utmaningar. På ledningsnivå måste det finnas buy-in att prestanda / säkerhetsexperterna i **SPR** har några rimliga förväntningar på att deras rekommendationer, och framgångsrikt testade, inlämnade programfixar, kommer att införlivas i tid i produktionskodbasen. För att skapa de nödvändiga effektiva arbetsrelationerna mellan funktionella och icke-funktionella ingenjörsteam bör prestandatekniker delvis bäddas in i funktionella produktutvecklingsteam som jämlikar, med peer-baserad granskning/bekräftelsebehörighet på kodbaserna.

Genom att ha ett dedikerat **SPR**-team kan ledningen frigöra produktingenjörer (att göra funktionsutveckling) från att behöva bygga / hantera / testa mockups av dina produktionsmiljöer som är lämpliga för prestanda / skalning / säkerhet / hållbarhet / tillförlitlighet arbete. Många team har helt enkelt inte de cykler som krävs för att spendera detta, trots att det är viktigt att storleksanpassa sina molnresurser och exekveringstider för beroende programvara för att tillgodose snabb tillväxt.

Det finns också en betydande specialisering när det gäller observationsverktyg och kärnbaserade spårningstekniker, som bra systemingenjörer genomgår för att hålla sig på toppen av sitt område. Det är svårt att anställa för dessa hjälpfärdigheter när man söker kvalitetstalang för traditionella agile-baserade produkt / full stack ingenjörer och / eller datavetare.

Robust, säker, skalbar, kostnadseffektiv och välfungerande programvara är inom räckhåll för alla små / medelstora ingenjörsteam med rätt investeringar i **SPR**. [Reach out](/contact).


<!-- $Date$ $Author$ $Revision$ -->
