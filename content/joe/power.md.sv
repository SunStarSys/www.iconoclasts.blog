---
archived: ~
categories: Sjukvård, matematik, dynamik
dependencies: '*.md.sv'
keywords: exponentiell, kraft, covid-19, epidemi, pandemi
published: ~
status: arkiverad
title: Exponentiell tillväxt och COVID-19
---

Låt mig försöka ge dig en kvalitativ analys av vad en exponentiell (aka power) funktionens diagram är geometriskt, och hur det gäller för covid-19-epidemin som sveper över planeten.  Det är inte en lång, komplex läsning, så {# lede #}ta din tid med ** matte** avsnittet &mdash; Det är viktigt att vara en utbildad konsument av statistik som är relevant för den nuvarande pandemin{# lede #}. En bakgrund i freshman [calculus](https://en.wikipedia.org/wiki/Calculus).

### Matematik

Först exponentiella funktionens värden är mikroskopiskt små, och knappt ökar över tiden (på `x-axeln`). Men den grundläggande frågan är att **dess förändringstakt alltid är i fast proportion till dess nuvarande värde<sup>1</sup>**, vilket innebär att den så småningom kommer att träffa en punkt där ökningarna är astronomiska.  Följande diagram skildrar detta fenomen ganska kortfattat, eftersom de representerar * världsomfattande * summor för covid-19 i slutet av mars 2020.

![COVID-19 i mars 2020](../images/covid-march-2020-e.png).

För att illustrera detta analogt: föreställ dig hur snabbt du skulle gå nu om din bils hastighet alltid var bunden, genom en proportionalitetskonstant, till körsträckan på vägmätaren. Under denna hypotetiska, för varje fast tidsintervall som passerar, både bilens hastighet och totala avstånd reste *multiplies * med samma fasta belopp (större än en). I själva verket är det [turtles all the way down](https://en.wikipedia.org/wiki/Turtles_all_the_way_down): bilens acceleration, ryck, etc. (dvs alla [derivat](https://en.wikipedia.org/wiki/Derivative).

På en [logaritmisk skala](https://en.wikipedia.org/wiki/Logarithmic_scale) för "y-axeln" visas diagram över sådana effektfunktioner som ** raka linjer**.  De två diagrammen nedan har parallella tillväxtlinjer (som jag lade till i svart till dessa [världsmätare](https://www.worldometers.info/coronavirus/) källor), och reflekterar samma *worldwide* totalsummor som paret ovan. Om vi   representerar dessa "linjer" i "log y = mx + b" form, skulle `m`-värdena (`slopes`) hålla med; endast `b`-värdena (`log y-intercepts`) skiljer sig åt.  Den viktigaste punkten här är att fokusera uppmärksamheten på **invarianten** `slope`, inte de varierande `avlyssningarna`, för någon uppsättning per-age-demografisk eller per-geografisk-region pandemistatistik, eller kombinationer därav.  Multiplicera `ln 10 = 2.302585...` med `lope` här ger den grundläggande proportionalitetskonstanten som motsvarar de avbildade exponentiella funktionernas värden med deras * ögonblickliga * förändringstakt.  Med andra ord, med fokus på de relativa procentandelarna mellan olika statistik, som [villkorlig](https://en.wikipedia.org/wiki/Conditional_expectation).

För att vara tydlig är skillnaden i `b`-värden mer om tidsskillnader på `x-axeln` än det är skillnader i `y`-värden; när det gäller ekvationer: `log y = mx + b = m(x + b/m)` är en implicit översättning av raden `y = mx` , `b` enheter längs `y-axeln`, eller motsvarande `b/m` enheter längs `x-axeln` (i motsatt riktning).   **Någon** typ av relativ statistik (som fallet Dödlighetsgrad) kan fångas när det gäller sådana tidsöversättningar, när `m` är känd (och icke-noll).  Återigen, den *kritiska * statistiken är "m"!

![Logaritmisk skala för COVID-19 i mars 2020](../images/covid-march-2020.png).

### COVID-19-pandemin i USA

Den "5-dagars-period fördubbling" av det totala antalet infekterade befolkningen i NY denna vecka, liksom "3-dagars-period fördubbling" för USA, är starka påminnelser om denna effekt (ovan *multiplier* för båda fallen är 2).  De amerikanska ** 10-dagars** siffrorna är ännu mer nykterande: ** Allt ökar 10-faldigt**, precis som indikeras av de svarta parallella linjerna jag lade till i följande världsometergrafer. Att projicera dessa till en hel månad lämnar oss med en *multiplier* någonstans runt ** 1000x** för de amerikanska siffrorna, vilket är ** groteskt** med tanke på de månadslånga förseningarna i att se betydande statliga ledåtgärder mot pandemin.


![Mars 2020 COVID-19 US logaritmisk skala](../images/covid-us-march-2020.png).

![Mars 2020 COVID-19 US Deaths logaritmiska skala](../images/covid-us-march-2020-deaths.png).

Här är de *goda nyheterna: * epidemier följer bara exponentiella funktioner för den första delen av utbrottet. Så småningom kommer förändringstakten att plattas ut och bli negativ, vilket tyder på en fallande nivå av den totala befolkningen som för närvarande är sjuk.

Den dåliga nyheten är att [WHO](https://www.who.int/emergencies/diseases/novel-coronavirus-2019).

### Fallout

Det är inte voodoo att orsaka en epidemi att börja röra sig bort från [exponentiell tillväxt](https://en.wikipedia.org/wiki/Exponential_growth).

Vad epidemiologer försöker åstadkomma är att sparka igång den processen så snart som möjligt.  Varje förlorad dag innebär en accelererande förlust av liv, ökad drivkraft av allvarliga fall och större risk för att helt överväldiga hälso- och sjukvårdssystemet som grafen spricker.

Oundvikligen kommer utplattningen att ske. Om det inte är på grund av mänsklig social visdom, beror det på att viruset inte kan infektera tidigare offer <sup>2</sup>, och det infekterar helt enkelt majoriteten av befolkningen innan de peterar ut och dröjer sig för att infektera nyfödda eller bara försvinner helt.

### Fotnoter (24 september 2020).

1. Jag är avsiktligt vag om det faktiska *tidsintervallet * för förändringstakten, men det spelar egentligen ingen roll för sanningsvärdet av uttalandet.  Olika tidsintervall ger olika proportionalitetskonstanter, men dessa konstanter beror bara på tidsintervallets storlek, inte de uppmätta ögonblicken av tid (vid slutpunkterna) själva.

2. Juryn är fortfarande ute på detta.  Beroende på vilka stammar som är i naturen, i kombination med svårighetsgraden av sjukdomen en patient kontrakt, kan reinfektion vara möjlig, åtminstone en del av tiden.

<!-- $Date$ $Author$ $Revision$ -->
