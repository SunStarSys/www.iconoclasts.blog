---
categories: Matematik
dependencies: '*.md.sv'
keywords: spektralteori, riemannisk geometri, inversa problem, matematisk fysik, harmonisk
  analys, representationsteori, strukturkonstanter, konform fältteori
status: verifierad=51621
title: Trippelprodukter av Eigenfunktioner och spektral geometri
---

<div class="right">
  <img src="../images/lawson6-pod.png" style="width:200px">
  <p style="width:200px;text-align:center;line-height:20px">
  Lawsons minimala yta ξ<sub>6,1</sub> stereografiskt projicerad från S<sup>3</sup> till R<sup>3</sup>
  </p>
</div>

[TOC]#sidebar

## Författare

Joe Schaefer

## Dedikering

Till höst

## Sammandrag

Använda elementära tekniker från geometrisk analys, partiella differentialekvationer och abeliska $$C^*$$ Algebror, {# lede #}Vi avslöjar en roman, men ändå bekant, global geometrisk diskriminerande{# lede #} &mdash; nämligen **den indexerade uppsättningen integraler av tredubbla produkter av egenfunktioner hos Laplace-Beltrami-operatören**, för att exakt karakterisera vilka isospektrala slutna Riemanniska grenrör som är isometriska.

## Introduktion

För en stängd Riemannian mångfald $$(M,g)$$, som karakteriserar sin **klass** av icke-isometriska, isospektrala grenrör är en typ av omvänd problem [[DH11]](#DH11) i spektral geometri. Naiv man kan spekulera i att denna klass alltid skulle vara *tom*. Men den akademiska litteraturen är rik med decennier gamla konstruktioner av specifika parningar av motexempel: börjar 1964 med John Milnors 16-dimensionella par icke-isometriska, isospektrala platta tori [[JM64]](#JM64)och fortsätter [[CS92]](#CS92) mot den generiska dimensionella karaktäriseringen av platt tori i Alexander Schiemanns doktorsavhandling från 1993 [[AS94]](#AS94) &mdash; Fyll i med en datorstödd sökning efter den kritiska $$\dim = 3$$ ärende  En modern undersökning av hela platt tori historia visas i [[NRR22]](#NRR22).

Längs vägen var insiktsfulla utlöpare till mer sofistikerade, icke-euklidiska symmetriska täckutrymmen; konstruera sådana isospektrala, icke-isometriska "duetter" som omfattar icke-privata kröktensorer (och deras spektrumbestämda Euler-egenskaper i dimension 2 [[MS67]](#MS67)Ett utmärkt exempel på denna insats var Toshikazu Sunadas 1985. [[TS85]](#TS85) Uppfinning av ett allmänt syfte som täcker rymdramverk, som han sedan distribuerade i samma arbete för att bygga hyperboliska duetter i dimensionerna 2 och 3.

För inhomogena riemanniska mätvärden upptäckte Carolyn Gordon duetter som inte ens lokalt isometriska [[CG93]](#CG93).

Arbetet fortsätter inom många närliggande områden [[DH11]](#DH11), såsom bestämning av topologiska egenskaper hos klassen av isospektrala, icke-isometriska grenrör i allmänhet (tomt) [[ST80]](#ST80), ändlig [[AS94]](#AS94), styv [[GK80]](#GK80)och kompakt [[GZ97]](#GZ97)) som en delmängd av olika modulutrymmen för Riemannian-mätvärden.

What we offer in this article is a new perspective on a familiar tool: indexerade fourierkoefficienter för parvisa produkter av egenfunktioner som diskreta "algebraisk/topologisk diskriminerande" för att komplettera den befintliga, diskreta "invariantanalys" &mdash; det icke-negativa spektrumet hos *Laplace-Beltrami-operatören* (här kallad **Laplacian**) på $$ℋ = L^2(M,g)$$. Tillsammans observerar vi att paret ger en "diskret global geometrisk representation" av isometriklasserna av isospektral, slutna Riemanniska grenrör.

### Resultat

<br>

<div class="card border-dark">
  <div class="card-header">

#### Satsen

</div>
  <div class="card-body">

Med tanke på en (icke-minskande på egenvärdena) ortonormal grund av egenfunktioner $$\set{e^i}_{i=0}^{\infty}$$ för (icke-negativa) Lappland $$\Delta_M$$ på $$L^2(M,g)$$ förknippas med en sluten Riemannian mångfald $$(M,g)$$, definiera

```math

M^{i,j,k} := \int_M e^i e^j \bar{e^k} \sqrt{g} dx = \bra{e^i e^j}\ket{e^k}

```

Att vara isometrisk för $$(M,g)$$, det är ett *nödvändigt och tillräckligt villkor* för en annan **isospektral **stängt Riemannian mångfald för att ha en ortonormal grund för egenfunktioner (för sin Lappland) att båda bevarar tillhörande egenvärden och har en oföränderlig $$\set{M^{i,j,k}}$$ under varje grund.

</div>
</div>

<br>

Det är viktigt att erkänna $$M^{i,j,k}$$ är inte grundinvariant: det finns en naturlig enhetsförändring på det diskuteras i detalj efter bevis för denna sats. Diskussionen innehåller vissa uppsättningar av bas-invariant singulära värden som man kan bilda en allmän gissning runt, vilket hävdar att den ordnade uppsättningen av singulära värden helt karakteriserar uppsättningen isospektrala grenrör.

Oavsett tillräcklig hälften av den allmänna gissningen är nödvändigheten alltid fallet. Det betyder att dessa samlingar av enskilda värden definieras av $$M^{i,j,k}$$ och associerade till varje åttonde rymd trippel är en ny uppsättning Riemannian** invariants**.

Det hårda arbetet framåt för framtida forskning är att hitta sådana baspar, eller att bestämma att sådana par inte kan existera alls, bara genom att undersöka egenskaperna hos $$M^{i,j,k}$$ i bevis. Men denna uppsats sätter det målet fram och centrum: vi försöker minska de analytiska geometrifrågorna i spektralteorin till beräkningsstyrda linjära algebrafrågor om produkter av egenfunktioner.

*Symmetri* spelar en viktig roll i beräkningsrelaterade fall [[TF17]](#TF17) [[LS18]](#LS18) [[PS94]](#PS94), som är lämpligt illustrerad i vår platta tori [Exempel](#example) nedan. Styrkan i vårt tillvägagångssätt görs dock kanske bäst uppenbar när det gäller mångfalder med det minsta antalet Riemanniska symmetrier, vilket är det generiska fallet. I detta fall erbjuder vi följande

<br>

<div class="card border-dark">
  <div class="card-header">

#### Korollarium 1

</div>
  <div class="card-body">

(Diagonal Litmus Test) Med tanke på ett par egenvärde som bevarar ortonormala baser som beskrivs i teoremens hypotes är grenrör isometriska om för varje val av $$i,j,k$$, produkten $$M^{i,\bar i,k}\bar M^{j,\bar j,k}$$ överens om båda baserna, och om vektorrummet spänner över $$\set{|e^i|^2}$$ är tät i $$\mathscr H$$. Här $$\bar j$$ representerar egenfunktionen $$\bar e^j$$ i trippelproduktintegrerade beräkningar.

Om vi definierar $$\mathscr V$$ som Hilbert-rymden som genereras av $$\set{|e^i|^2}$$, $$\mathscr V = \mathscr H$$ om en endast om den adjoint kartan
```math
[M^{i,\bar i, k}]^*:\mathscr H \rightarrow \mathscr V
```
är injicerande.
</div>
</div>

&nbsp;

<div class="card border-dark">
  <div class="card-header">

#### Korollarium 2

</div>
  <div class="card-body">

Generiskt är isospektrala grenrör isometriska om och endast om de produkter som definieras i Corollary 1 är överens som verkliga värden.

</div>
</div>

<br>

Motivationen för studiet av $$\set{M^{i,j,k}}$$ är löst härledd från studien av den **bilineära multiplikationsoperatorns roll** $$Y:V\otimes V\rightarrow V((z))$$ i definitionen av en Vertex-operatoralgebra [[FBZ04]](#FBZ04) Det är en Chiral Conformal Field Theory. Här $$V$$ är vektorrummet av stater och $$V((z))$$ är den formella Laurent-serien i $$z$$ med koefficienter i $$V$$. Sedan $$V$$ ofta kommer utrustad som en Hilbert Space med en traditionell Fourier-serie ortonormal grund, indexering $$Y$$ använda Fourier-grundelementen för $$V$$ är bara lite mer involverad än $$M^{i,j,k}$$ Fallet studerades här, men ganska lika i anden. En detaljerad jämförelse ligger dock utanför artikelns tillämpningsområde.

Om vi tänker på kartan

```math
(M, g, \set{e^i}) \mapsto \set{\lambda_i, M^{i,j,k}}\ ,
```

Detta papper fastställer injicerbarhet av denna karta för slutna Riemannian grenrör (upp till Riemannian isometry i dess domän). Ytterligare resultat som tillämpar dessa tekniker för att beskriva sin bild (och invers), inom vissa moduli utrymmen av mätvärden, är bara att komma igång [[AA25]](#AA25). Där tacklar Anshul Adve rigoröst enhetstangensutrymmen av kompakta, hyperboliska 2-omkretsar med samma **strukturkonstanter** från Conformal Field Theory.

Vissa bilder kan vara till hjälp här. Om vi fixar $$(M,g)$$ och titta på banorna i $$\set{M^{i,j,k}}$$ under spektrumbevarande basbytesomvandlingar på $$\set{e^i}$$Vi ser att omloppsbana av olika isospektral $$(M,g)$$ par partitionerar bilden av denna karta längs isometriklasser.

Slutligen bevisar vi att det generiska Riemannian metriska fallet helt kännetecknas av studien av "diagonal" $$\set{\lambda_i, M^{i,\bar i,k}}$$.

Dessa resultat visades först under ett liknande tal av författaren vid **MSRI **1997, men de visas här i publicerad form för första gången.

## Preliminär

Nu med $$M,g,e^i,M^{i,j,k}$$ som ovan, för $$f \in C^\infty(M)$$ och $$i \geq 0$$ Observera att **Fourier koefficienter**

```math
\begin{aligned}

\hat{f}(i) &:= \int_M f(x)\bar{e^i}(x)\sqrt{g(x)}dx \\

\implies \\

f(x)        &= \sum_{i=0}^{\infty}\hat{f}(i)e^i(x)

\end{aligned}

```

sedan $$f$$ är unikt representabel som dess snabbt konvergerande **Fourier Series** ($$\Delta_M$$-Specifika Sobolev Embeddings [[MT13]](#MT13) [[RS75]](#RS75)tillsammans med Weyls asymptotiska lag [[HW11]](#HW11), innebär att villkoren i summan är $$o(i^{-n})$$ *Enhetligt i $$x$$* [[LH68]](#LH68), $$\forall n\in\N$$Då ser vi det för $$f_1, f_2 \in C^\infty(M)$$, den punktvisa produktens fourierkoefficienter $$f_1 f_2 \in C^\infty(M)$$ är

```math
\begin{aligned}

\widehat{f_1 f_2}(k) &= \sum_{i,j}^\infty\hat{f_1}(i)\hat{f_2}(j)M^{i,j,k} \\

\implies \\

f_1f_2(x) &= \sum_{i,j,k}\hat{f_1}(i)\hat{f_2}(j)M^{i,j,k}e^k(x) \\

f_1 = f^p_2,\space p > 2 \implies \\

\sum_{k}\hat{f_1}(k)e^k(x) &= \sum_{i_1,i_2,...,i_{2p-1}}\hat{f_2}(i_1)\hat{f_2}(i_2)\hat{f_2}(i_4)\hat {f_2}(i_6)...\hat{f_2}(i_{2p-2})M^{i_1,i_2,i_3}M^{i_3,i_4,i_5}...M^{i_{2p-3},i_{2p-2},i_{2p-1}}e^{i_{2p-1}}(x)

\end{aligned}
```

och så, *kritiskt*, alla multivariata polynom $$\weierp \in \Complex[z_1,...,z_l]$$ (på släta funktioner) **pendlar** med alla spektrumbevarande funktioner $$\Delta$$-egenfunktion ortonormal grundkarta $$\vec{F}$$ som bevarar $$\set{M^{i,j,k}}$$:

```math
\begin{CD}
  C^\infty(M,\space\Complex^l) @>\weierp >> C^\infty(M)\\
   @V\underbrace{\vec{F}\oplus\dots\oplus \vec{F}}_{l\space\text{times}}VV @VV\vec{F}V\\
  C^\infty(N,\space\Complex^l) @>>\weierp > C^\infty(N)
\end{CD}
```

Dessutom om $$A\subset M$$ är Borel-mätbar, då resultaten ovan håller punktvis för den *karakteristiska funktionen av $$A$$* överallt utom längs gränsen till $$A$$: om $$f = f^2$$ och $$A:=\set{x\in M|f(x)=1}$$,

```math
\sum_{i}\hat{f}(i)e^i(x) = \sum_{i,j,k}\hat{f}(i)\hat{f}(j)M^{i,j,k}e^k(x) = \begin{cases}
1 & x \in \mathring{A} \\
0 & x \in \mathring{A^\complement}\end{cases}
```

och genom unikhet har vi följande identitet

```math
\begin{aligned}
\hat{f}(k) &= \sum_{i,j}\hat{f}(i)\hat{f}(j)M^{i,j,k}\space\space \forall k\geq 0 \\
\iff f&=f^2 \space a.e.
\end{aligned}
```

Detta innebär att varje sådan baskarta som ovan har karakteristiska funktioner (som medlemmar av $$L^2(M,g)\subset L^1(M,g)$$) till karakteristiska funktioner på ett måttbevarande sätt.

Poängen med dessa beräkningar är att betona det faktum att $$\set{M^{i,j,k}}$$ **tecken** Harmonisk analys av den punktvisa multiplikationsoperatorn på $$C^\infty(M)$$, som är en tät subalgebra av Abelian $$C^*$$ algebra $$C(M)$$och Stone-Weierstrass teorem.

För den snabba konvergensen av dessa ovan belopp som omfattar $$M^{i,j,k}$$, notera att produkter av egenfunktioner är släta, så dessa Fourier koefficienter förfaller som ovan (i varje index). Mer information finns i Emmett Wymans arbete 2022 med dessa koefficienter när det gäller triangelns ojämlikhet på egenvärdena [[EW22]](#EW22).

Note: Vi kan alltid anta
```math
\begin{aligned}
e^0 &= M^{0,0,0} = 1/\sqrt{vol(M)} \\
\implies \\
M^{0,j,k} &= M^{j,0,k} = \delta_{j-k}\space/\sqrt{vol(M)}
\end{aligned}
```

där $$\delta_i$$ Det är Kronecker delta. Sedan $$vol(M)$$ är en spektral invariant [[HW11]](#HW11), är denna information redan tillgänglig från överväganden om isospektralitet.

## Teoretiskt bevis

För nödvändighet, låt $$F:(N,h)\rightarrow (M,g)$$ vara en isometri mellan slutna Riemanniska grenrör och låta målets ortonormala grund vara $$L^2(N,h)$$ Bli en pullback via $$F$$ av den ortonormala grunden $$\set{e^i}$$ på $$(M,g)$$ ovanför. Sedan

```math
\begin{aligned}
M^{i,j,k} &= \int_M e^i e^j \bar{e^k}\sqrt{g}dy \\
          &= \int_N e^i(F(x)) e^j(F(x))\bar{e^k}(F(x))\sqrt{h}dx

\end{aligned}
```

Vi gör det med nödvändighetsargumentet eftersom $$\Delta_N(f\circ F) = (\Delta_M f) \circ F,\ \ \forall f\in C^\infty(M)$$.

För tillräcklighet betraktar vi nu den linjära, bijektiva ortonormala egenfunktionskartan $$\vec{F}$$ från $$C^\infty(M)$$ till $$C^\infty(N)$$ och notera att från beräkningarna i [Preliminär](#preliminaries) ovanför, $$\vec{F}$$ bevarar punktvisa produkter för smidiga funktioner (och bevarar karakteristiska funktioner när de utvidgas till $$L^2(M,g)$$) av förutsättningen att $$\set{M^{i,j,k}}$$ är oföränderlig under denna karta.

### Lemma

$$\vec{F}: C^\infty(M)\rightarrow C^\infty(N)$$ Bevara den enhetliga normen.

### Bevis för Lemma

Låt $$\set{a_i}$$ vara en jämn delning av enhet på $$M$$.

```math
\begin{aligned}
1 &= \sum_i a_i(x) \\
       &= \sum_{i,j} \hat{a_i}(j)e^j(x) \\
	   &= \sum_j e^j(x)\sum_i \hat{a_i}(j)
\end{aligned}
```

Så $$\sum_i\hat{a_i}(j) = \delta_j\sqrt{vol(M)}$$ (Kronecker delta).

genom den dominerade konvergenssatsen,

```math
\lim_{p\rightarrow\infty}
\sum_j\hat{a^p_j}(k) = \int_{\dot{\bigcup}_j\set{a_j=1}}\bar{e^k}(x)\sqrt{g}dx
```

som är en karakteristisk funktion av positivt mått på varje delmängd $$\set{x\in M | a_j(x) = 1}$$. Detta innebär att Lemma är bevisat för varje $$a_j$$, eftersom den begränsande karakteristiska funktionen hos en uppsättning med positiv åtgärd bevaras, och därmed har enhetlig norm 1, liksom alla $$a_j^p,\space \vec{F}(a_j^p)=\vec{F}(a_j)^p,\space p\in\N$$, genom diagram (6).

Utan förlust av allmängiltighet kan vi tillämpa specialfallets resultat som visas för den smidiga uppdelningen av enhet $$\lbrace|f|/\lVert f \rVert_\infty, 1 - |f|/\lVert f\rVert_\infty\rbrace$$, där $$ \set{x\in M|\space|f(x)| = \lVert f \rVert_\infty}$$ har positiva mått, och Lemma bevisas i sin helhet.

Sedan $$\set {\bar e^i}$$ Det är också en Fourier-bas för $$L^2(M,g)$$Det framgår av ekvationen (4) att $$\vec F(\bar f) = \bar{\vec F}(f)$$. Detta innebär att på en tät uppsättning $$C(M)$$ (och $$C(N)$$), vi har etablerat $$\vec{F}$$ som en isomorfism av Abelian $$C^*$$ algebror, och därmed kan utvidgas till en isomorfism av $$C(M)$$ och $$C(N)$$ i samma kategori.

Nu tillämpar vi Gelfand-Naimark-Segal Representation Theorem (i kontravariant functor form) för unital Abelian $$C^*$$ algebror [[JC19]](#JC19) att representera denna isomorfism genom en homeomorfism $$F$$ mellan $$N$$ och $$M$$. Eftersom det är bijektiv på släta funktioner, måste det också vara smidigt.

Som det är nu diffeomorfism $$F$$ bevarar egenvärden och egenfunktioner (genom hypotes om $$\vec{F}(f) = f\circ F$$Det måste bevara Lappland på smidiga funktioner. Därför måste den också bevara de viktigaste symbolerna för samma elliptiska operatorer. [[MT13]](#MT13). De viktigaste symbolerna i Lappland är helt enkelt ett annat sätt att uttrycka Riemannian metriska på de mångfaldiga i fråga.

Detta kompletterar teoremens bevis.

### Diskussion om korollarier

Med $$\set{M_0^{i,j,k}}$$ och $$\set{M_1^{i,j,k}}$$ representerar de två trippelproduktseten för baserna $$\set{e_0^i}$$ och $$\set{e_1^i}$$, låt $$z_i \in U_1$$ vara $$U_1^\infty$$ åtgärder på en sådan ortonormal grund $$\set{e_1^i}$$. Därför kommer vi att välja $$z_i$$ så att $$\set{z_ie_1^i}$$ avkastning $$\set{M_0^{i,j,k}} = \set{z_i z_j \bar z_kM_1^{i,j,k}}$$.

Varför är detta fallet? I allmänhet är den symmetrigrupp som verkar på utrymmet för möjliga ortonormala baser av egenfunktioner utrymmet för enhetsoperatorer. $$U: \mathscr H\rightarrow\mathscr H$$ som pendlar med prognoser $$P_{\mathscr V_\lambda}$$ på de finita dimensionella åttondelar $$\mathscr V_{\lambda}$$ för varje enskilt egenvärde $$\lambda$$ från Lappland. Därför

```math
\begin{aligned}
P_{\mathscr V_{\lambda}}U(e^i) = UP_{\mathscr V_{\lambda}}(e^i),\ \therefore U(e^i) &= \sum_{\lambda_i = \lambda_j}u_{ij}e^j \implies \\
M_U^{i,j,k} := \int_M U(e^i)U(e^j)\bar U(\bar e^k)\sqrt g dx &= \sum_{\lambda_r = \lambda_i,\lambda_s=\lambda_j,\lambda_t=\lambda_k} u_{ir}u_{js}\bar u_{tk} M^{r,s,t}
\end{aligned}
```

är bilden av $$M^{i,j,k}$$ under $$U$$'s basåtgärd $$e^i \mapsto U(e^i)$$.

Nu under villkoren i Corollary 2, var och en av de $$\mathscr V_\lambda$$ är ett dimensionellt vektorrum över $$\Complex$$, men det betyder också att de är endimensionella vektorrum över $$\Reals$$och så är hela den multiplikativa symmetrigruppen $$O(1,\Reals)^\infty=\Z_2^\infty$$.

Mer allmänt, de associerade förutsättningarna "avtal om produktvärden" skulle helt enkelt bli "Bevarande av den ordnade uppsättningen av singulära värden (räknade med multiplikation) av linjära kartor från $$\mathscr V_{\lambda_i} \rightarrow Hom(\mathscr V_{\lambda_j}, \mathscr V_{\lambda_k})$$ definierad av $$\set{M^{i,j,k}}$$." Här är den inre produkten på $$A,B \in Hom(\mathscr V_{\lambda_i}, \mathscr V_{\lambda_j})$$ är $$tr (B^*A)$$. Per definition är dessa singulära värden invariant under direkta summor av enhetliga transformationer på $$\mathscr V_\lambda$$.

I multiplikation-1-spektrumfallet är den fullständiga uppsättningen av singulära värden helt enkelt uppsättningen absoluta värden för $$M^{i,j,k}$$ som vi fortfarande antar, helt karakteriserar isometri klasserna av sådana isospektrala grenrör. Se Ekvation (19) för nyckelförhållandet mellan denna gissning och Corollary 2. Vad som saknas är tillräcklighetsargumentet att om de absoluta värdena är överens är grenrör isometriska; vilket kräver ett argument för att eliminera eventuella teckenändringsavbrott mellan baser i LHS-topparna av ekvation (19).

Vi är betydligt mindre säkra på att den allmänna gissningen är sann (utanför multiplikations-1-spektrumfallet), eftersom det kan vara möjligt att producera ett motexempel (av tillräcklighet) via explicit Sunada-konstruktion.

Om indexnotationen försvårar situationen kanske denna grundoberoende beskrivning hjälper.  Ta $$v_{\lambda} \in \mathscr V_{\lambda}$$ och överväga uttrycket

$$
P_{\mathscr V_\gamma}(v_\alpha v_\beta).
$$

Kom ihåg att varje $$\mathscr V_\lambda$$ är ett finitdimensionellt komplexiserat euklidiskt rum. Alla $$M^{i,j,k}$$ ger baskoordinater för detta basoberoende uttryck. Sedan $$1 = \oplus_\lambda P_{\mathscr V_\lambda}$$Vad teorin säger är att ovanstående uttryck är **identiskt** mellan grenrör om och endast om grenrör är isometriska; vilket bör komma som en chock för bokstavligen ingen. Tillräcklighet hälften av dessa antaganden är till stor del kombinatoriska problem som innebär att rekonstruera dessa uttryck enbart från deras singular värde sönderdelning.

Dessa grundvarianter kan dock vara användbara vid dechiffrering av mer komplexa fall som innebär att två isospektrala grenrör är **inte isometriska**, genom att visa att deras singulära värden inte är identiska mellan de två baserna i fråga.

#### Förutom

Representationsteorin för en kompakt Liegrupp $$G$$ tar den explicit Lappland ut ur ekvationen och studier $$G$$-invariant (under vänster eller höger åtgärd) *irreducerbar* dekompositioner $$P_{\mathscr V_\lambda}$$ av $$L^2(G,dx)$$ (här $$dx$$ är det normaliserade Haar-sannolikhetsmåttet på $$G$$) som $$\oplus_\lambda P_{\mathscr V_\lambda}$$och hedrar deras samspel i uttrycket ovan som de väsentliga artefakterna i Lie Theory, som behandlas i Peter-Weyl Theorem [[AK01]](#AK01). Kompatibla Riemannian geometrier genereras av bekväma val av kvadratiska Casimir element som ligger i mitten av den universella omslutande algebra, som är av mindre betydelse än den irreducibla sönderdelningen själv. **Deras spektrala sönderdelning** är en (mindre bekväm) sammanställning av dessa irreducibla komponenter, eftersom den associerade Cartan-Killing Casimir element (Riemannian metriska) är konstant på varje irreducibla komponent.

Wigners $$3j$$ symboler för $$SU(2)$$ Ett bra exempel på vidare studier &mdash; Låt oss tillämpa vår allmänna konstruktion på det som en gruppmångfald med Cartan-Killing Riemannian metrik. Varje ändlig dimensionell irreducerbar enhetlig representation av $$SU(2)$$ är märkt med ett icke-negativt halv-heltal $$j = 0, \tfrac12, 1, \tfrac32, \dots  $$. Vi skriver $$\mathscr  V_j  $$ för $$ (2j+1)  $$-dimensionellt utrymme på vilket denna representation verkar. En standardortonormal grund för $$\mathscr  V_j $$ är den magnetiska basen $$  \ket{j\ m}$$ med $$m = -j,-j+1,\dots,j.$$

Ekvationen

```math
\begin{pmatrix}
j_1 & j_2 & j_3 \\
m_1 & m_2 & m_3
\end{pmatrix}
:=(-1)^{j_1-j_2-m_3}\frac{1}{\sqrt{2j_3+1}}C^{j_3\ -m_3}_{j_1\ m_1,j_2\ m_2}
```

uttrycker $$3j$$ symboldefinition i termer av Clebsch-Gordan koefficienter $$C^{j\ m}_{j_1\ m_1\,j_2\ m_2}:=\bra{j_1\ m_1,j_2\ m_2}\ket{j\ m}$$, som har slutna formuttryck som Racahs formel som stöder moderna numeriska programvarubibliotek [[JF16]](#JF16).

A $$3j$$ symbolen försvinner om inte $$m_1+m_2+m_3=0$$Triangeln ojämlikheter $$|j_1-j_2|\le j_3\le j_1+j_2$$ hålla, och $$j_1+j_2+j_3$$ är ett heltal. Egenfunktionen tredubblar för $$SU(2)$$ som omfattar dessa konventionellt (via Condon-Shortley-fasen) är realvärdekoefficienter exakt sfäriska övertoner av $$S^2$$.

Från den kompakta gruppens synvinkel $$SU(2)$$, $$3j$$ symbolerna är exakt de (riktigt normaliserade och fasade) sammanflätande operatorer som inser det unika (upp till skala) invarierade underutrymmet för trippeltensorprodukten $$\mathscr V_{j_1}\otimes \mathscr V_{j_2}\otimes \mathscr V_{j_3}$$ när produkten innehåller den triviala representationen. De är därför de naturliga "strukturkonstanterna" för sammansmältningen av tre irreducibla representationer till singleten.

Detta är exakt analogt med den roll som spelas av trippelproduktintegralerna. $$M^{i,j,k}$$ på ett Riemanniskt grenrör: de är strukturkonstanterna för den punktvisa produkten av egenfunktioner när den produkten expanderas tillbaka i egenbasen. I gruppen $$SU(2)$$ själv (eller på $$S^2=SU(2)/U(1)$$Dessa integraler reduceras till $$3j$$-symboler, via Gaunt Integral Formula [[O26]](#O26):

```math
M^{i,j,k}
=
(-1)^{m_k(l_k)}
\sqrt{\frac{(2l_i+1)(2l_j+1)(2l_k+1)}{4\pi}}
\begin{pmatrix}
l_i & l_j & l_k \\
0 & 0 & 0
\end{pmatrix}
\begin{pmatrix}
l_i & l_j & l_k \\
m_i(l_i) & m_j(l_j) & -m_k(l_k)
\end{pmatrix},
```
där $$l_i \in \set{0,1/2,1,3/2,\dots}$$ är icke-minskande från $$0$$ sedan $$\Delta|_ {\mathscr V_j} = j(j+1)$$och $$m_{i}(l_i) \in \set{-l_i,-l_i+1,\dots,l_i}$$. Med andra ord, $$m_i(l_i)$$ varierar med $$i$$men $$l_i$$ har tröskelmultiplikationer av $$\dim \mathscr V_{l_i} = 2l_i+1$$.

För kompakta Abeliska Liegrupper är dessa irreducibla komponenter alla endimensionella, så deras situation är helt lik den spektrala sönderdelningen av multiplicitet-1 Lapplandare ovan.  Mer om detta i exemplet nedan.

Att komma tillbaka till Corollary 1, observerar vi att beviset innebär att fastställa denna implikation:

```math
z_k = M_0^{i,\bar i,k} / M_1^{i,\bar i,k} \,\, \forall i,k\in\N,\, ⋺ M_0^{i,\bar i,k} \ne 0 \, \implies
\exists r,s,t \in \N\ ⋺\ \frac{M_0^{i,j,k}}{M_1^{i,j,k}} = \frac{M_0^{r,\bar r,i}M_0^{s,\bar s,j}M_0^{t,\bar t,k}}{M_1^{r,\bar r,i}M_1^{s,\bar s,j}M_1^{t,\bar t,k}}\, .
```

Vi hoppas att för varje given $$k>0$$, $$M_0^{i,\bar i,k}$$ Kan inte vara identisk $$0$$ för alla $$i$$, eftersom det är ett allmänt sant villkor, men falskt för specifika fall som det platta torifallet som omfattas av exemplet nedan. Ett högre sätt att se på detta tillstånd är att notera att ett sådant hopp-kränkande $$k$$ skulle ha $$\bar e^k$$ i kärnan av adjoint-kartan $$[M^{i,\bar i,k}]^*$$. Dessutom är formeln <span class="eqno"></span> för $$z_k$$ kräver båda $$i$$-oberoende och tillräcklighet, för att fastställa grundkartan $$e_0^i \mapsto z_i e_1^i$$ bevarar $$\set{M_0^{i,j,k}}$$.

Vi skissar ett bevis på Corollary 1 (tillräcklighet) under nästa uppsättning formler.

Låt oss dock beräkna några relevanta identiteter så att några orädda framtida forskare kan gräva i den generaliserade gissningen:

```math
\begin{aligned}
\Delta fg &= f\Delta g + g\Delta f - 2 df \cdot dg \implies \\
M^{i,j,k} &= 2 \frac{\bra{de^i\cdot de^j}\ket{e^k}}{\lambda_i +\lambda_j -\lambda_k} \implies \\
\frac{\bra{de^i\cdot de^j}\ket{e^k}}{\bra{e^ie^j}\ket{e^k}} &= \frac{\lambda_i+\lambda_j-\lambda_k}{2}\ \text{ when }M^{i,j,k} \ne 0\ .\\
\inf_{f\in \mathscr H_k^\perp} \frac{||df \cdot df||^2}{||f||^2} &= \lambda_{k+1}\text{ , with }f=\pm e^{k+1}\ .\\
\text {So the quadratic form} \\
Q_k(f,g) :&= \bra{df\cdot dg}\ket{e^k} = \sum_{i,j}\hat{f}(i)\hat{g}(j)\bra{de^i\cdot de^j}\ket{e^k} \\
&= \frac{1}{2}\sum_{i,j}\hat{f}(i)\hat{g}(j)(\lambda_i + \lambda_j - \lambda_k)M^{i,j,k} .\\
\text{Now with }J \text{ real-analytic}\\
Q^J_k(f,g) :&= -\frac{1}{2}\bra{(J(\sqrt{\Delta})fg - fJ(\sqrt{\Delta})g - gJ(\sqrt{\Delta})f}\ket{e^k} \\
&= -\frac{1}{2}(\bra{fg}\ket{J(\sqrt{\Delta}) e^k} - \bra{fJ(\sqrt{\Delta})g + gJ(\sqrt{\Delta})f}\ket{e^k})\\
&= \frac{1}{2}\sum_{i,j}\hat{f}(i)\hat{g}(j)(J(\sqrt{\lambda_i}) + J(\sqrt{\lambda_j}) - J(\sqrt{\lambda_k})M^{i,j,k}\\
\tilde{Q}_k(f,g) :&= -\frac{1}{2}\bra{\sqrt{\Delta} fg - f\sqrt{\Delta}g -g\sqrt{\Delta}f}\ket{e^k} \\
&= \frac{1}{2}\sum_{i,j} \hat{f}(i)\hat{g}(j)(\sqrt{\lambda_i} + \sqrt{\lambda_j} - \sqrt{\lambda_k})M^{i,j,k}\\
df \cdot dg &= \sum_k Q_k(f,g)e^k = -\frac{\Delta fg - f\Delta g - g\Delta f}{2}\\
Q_0(f,f) &= \frac{1}{\sqrt{vol(M)}}\sum_i \hat{f}(i)^2 \lambda_i\\
\sum_{\ell}Q_\ell(f,f)e^\ell &= \frac{1}{2}\sum_{i,j,\ell}\hat{f}(i)\hat{f}(j)(\lambda_i + \lambda_j -\lambda_\ell)M^{i,j,\ell}e^\ell\\
&= \frac{1}{4}\sum_{i,j,\ell}\hat{f}(i)\hat{f}(j)(\lambda_i + \lambda_j -\lambda_\ell)(M^{i,i,\ell} + M^{j,j,\ell} - \bra{(e^i-e^j)^2}\ket{e^\ell})e^\ell\\
 = g^2 &= \sum_{i,j,\ell}\hat{g}(i)\hat{g}(j)M^{i,j,\ell}e^\ell\implies\\
 \frac{1}{2}\sum_{i,j}\hat{f}(i)\hat{f}(j)(\lambda_i + \lambda_j - \lambda_k)M^{i,j,k} &= \sum_{i,j}\hat{g}(i)\hat{g}(j)M^{i,j,k} \\
&= \widehat{g^2}(k). \\
\end{aligned}
```

Anmärkning: för det endimensionella flat-tori fallet nedan, $$\tilde{Q}_k(e^i,e^j) = 0$$ sedan $$\sqrt{\Delta} = \sqrt{-1}\frac{d}{dx}$$ Det är en sann härledning.

## Bevis för korollarier

Now consider the famous associativity relations from Conformal Field Theory:

```math
\begin{aligned}
e^ie^je^k = \sum_\ell\bra{e^ie^j}\ket{\bar{e^k}e^\ell}e^\ell &= \sum_{\ell,r} M^{i,j,r}\bar M^{\bar k,\ell,r}e^\ell\\
&= \sum_{\ell,r} M^{i,k,r}\bar M^{\bar j,\ell,r}e^\ell\ \therefore\\
i = \bar j, \ell = k\text{ and relabeling } \implies \\
\sum_r M^{i,\bar i,r}\bar M^{j,\bar j,r} &= \sum_r |M^{i,j,r}|^2
\end{aligned}
```

Corollary 1 följer av det faktum att $$z_k\in U_1$$ Den är väldefinierad (dvs. $$i$$-invariant av hypoteserna om produkter) och föregående observation att de algebraiska, avgränsade trilinjära operatorer som definieras av $$z_iz_j\bar z_kM_1^{i,j,k}$$ och $$M_0^{i,j,k}$$ är båda associativa, och håller med punktvis funktion multiplikation av rutor av absoluta värden för egenfunktioner, som är tät i $$\mathscr H$$. Upprättar $$\ker\ [M^{i,\bar i,k}]^* = 0$$ är exakt lika, där $$\mathscr V$$ är det stängda Hilbert-utrymmet som genereras av $$\set{|e^i|^2}$$och $$[M^{i,\bar i,k}]:\mathscr V\rightarrow \mathscr H$$ är basändringsidentitetskartan.

De är överens överallt.

Corollary 2-tillräcklighet följer genom att notera att det försvinnande adjoint-map-kärnans tillstånd i Corollary 1 är allmänt sant. Om för något val av $$i,j,k$$, produkten $$M^{i,\bar i,k} \bar M^{j,\bar j,k}$$ Oenighet mellan baser, skulle de vara oense i varje par baser.

Varför? Eftersom generiska grenrör kan antas också ha multiplikation-1-spektra, minskar detta hela symmetrigruppen till $$U_1^\infty$$ där dessa produkter är oföränderliga, motsäger teorem 1. Ytterligare minskning till $$\Z_2^\infty$$ Genom realvärderade baser säkerställs att produkterna är realvärderade. Detta fastställer hypotesens nödvändighet och kompletterar beviset.

Vidare är argumenten i beviset för korollarium 1 giltiga även när grenrör är icke-isospektrala, så vi kan representera grundkartan som en diffeomorfism om och endast om produkterna matchar i det generiska fallet ovan. Isospektralitet blir då likvärdig med denna diffeomorfism är en Riemannian isometri.

Detta kompletterar beviset för korollarierna.

## Exempel

Låt $$\set{\lambda_i} \subset \R^n$$ vara indexerad, rangordna $$n$$ Gitter av Lie Algebra vikter för kvoten utrymme representation av $$\frak{g}=\Reals^n$$ som översättningsinvariant (dvs. konstant) vektorfält på sig själv, när $$\R^n$$ ses också som $$\frak{g}$$'s associerade Lie Group över en torus definierad av $$\Reals^n/A\Z^n, A \in GL(n,\Reals)$$. Dessa vikter definierar integrerade hissar av 1-former över torus som integrerar till linjära funktioner. $$\bra{x} \lambda_i\rangle,\space x\in\Reals^n$$ som sin Liegrupp (som täcker torus). Dessa linjära funktioner kan sedan skalas om enhetligt (genom $$2\pi \sqrt{-1}$$) och exponentierade för att bilda multiplikativa tecken som härstammar till att bilda en ortonormal bas av $$L^2(\Reals^n/A\Z^n,dx)$$, med Lebesgue (Haar) mått $$dx$$.

Dessutom diagonaliserar denna grund samtidigt den platta torus Laplacian **eftersom** Lappland är bilden av ett symmetriskt, negativt bestämt kvadratiskt Casimir-element under denna (konstant koefficient linjär differentialoperator) kvotmellanrumsrepresentation av den universella omslutande algebra. Därför är dess egenvärden i konstant proportion (av $$4\pi^2$$) till Casimir-element-bestämd längd-kvadrat av varje karaktärs vikt i gitter.

Vi ser för närvarande ovanstående grund

```math
\set{e^{2\pi\sqrt{-1}\langle{x}|\lambda_i\rangle}/\sqrt{|\det A|}}_{i=0}^\infty
```
att vara vår teorem-tillämpliga Fourier-bas av ortonormala (multiplikativ karaktär) egenfunktioner (av denna kvotrepresentation av det (negativa) Euklidiska Casimir-elementet) som direkt motsvarar $$\set{\lambda_i}$$. Med våra hypoteser måste vi ha $$i < j \implies \lVert\lambda_i\rVert \leq \lVert\lambda_j\rVert$$ (med den euklidiska normen på vikterna).

Nu kan vi beräkna

```math
M^{i,j,k} = \begin{cases}
1/\sqrt{|\det A|} & \lambda_i + \lambda_j - \lambda_k = 0 \\
0 & \text{otherwise}
\end{cases}
```

Som denna ekvation <span class="eqno"></span> beror bara på vikten gitter själv, det är orthonormal-basis-index invariant. Vidare är det *bara *invariant under linjära omvandlingar på viktgitter $$(A^{-1})^t\Z^n = \set{\lambda_i}$$Så bara en $$L^2$$ ortonormal egenfunktionskarta **som induceras från en volymbevarande inverterbar linjär karta mellan två sådana indexerade, rangordnade $$n$$ viktgitter** kommer att hålla "algebraisk/topologisk" indexerad datamängd $$\set{M^{i,j,k}}$$ Ovariant.

För att kunna tillämpa vår [Satsen](#theorem)Det är viktigt att en sådan linjär karta $$B$$ vara $$B\in SO(n,\Reals)$$ på vikten gitter, eftersom den inducerade $$L^2$$ Basmappning för egenfunktion

```math
\set{e^{2\pi\sqrt{-1}\langle x| B\lambda_i\rangle}/\sqrt{|\det A|}}_{i=0}^\infty
```

måste också bevara "analytisk" varianter &mdash; Casimir-element-inducerad figur $$4\pi^2\lVert\lambda_i\rVert^2$$ för varje indexerad vikt, dvs. de individuella egenvärdena i Lappland.

Som Milnors duett exemplifierar, att ha en karta som bevarar längden på gittervikterna är inte tillräckligt för att härleda kartan är i $$SO(n,\Reals)$$Vi måste också veta att kartan bevarar gitter vikt vinklar. Men detta är en följd av de formler som utvecklats i ekvation (18):

```math
-4\pi^2\bra{\lambda_i}\ket{\lambda_j}e^ie^j = de^i\cdot de^j = 2\pi^2\sum_k (\lVert\lambda_i\rVert^2 + \lVert\lambda_j\rVert^2 - \lVert\lambda_k\rVert^2)M^{i,j,k}e^k = 2\pi^2(\lVert\lambda_i\rVert^2 + \lVert\lambda_j\rVert^2 - \lVert\lambda_i + \lambda_j\rVert^2)e^ie^j\ .
```

Det fina med denna analys är att vi har bevisat att det inte finns någon **linjär** karta mellan galler som bevarar egenvärdena utan att kartan induceras av en Riemannian isometri på tori &mdash; Som en följd av teorin, inte för att de explicita beräkningarna är enkla polariseringsidentiteter.

Detta representationsteoretiska konto [[AK01]](#AK01) är exakt likvärdig med den tidigare utvecklingen av *lattice kongruens* [[NRR22]](#NRR22) Traditionellt används för att avgränsa isometri klasser av platt tori. Faktum är att matrisen införlivar en sådan linjär karta $$B\in SO(n,\Reals)$$, som beskrivs i föregående stycke, **är **den kontravariant Riemannian isometri mellan tori, som tillhandahålls genom tillämpning av *Gelfand-Naimark-Segal Representation Theorem *under [Bevis](#proof-of-theorem) från vår [Satsen](#theorem).

## Bekräftelser

Den ursprungliga forskningen finansierades delvis av en nådig James Simons Research Award 1995-1996, och det generösa stödet från en Alfred P. Sloan Dissertation Fellowship 1996-1997 vid universitetet vid Stony Brook.

Författaren vill också tacka Tanya Christiansen, Carolyn Gordon, Hamid Hezari, Harish Seshadri, och särskilt Leon Takhtajan för deras tekniska hjälp och översyn vid utarbetandet av detta manuskript för publicering.

<!-- $Date$ $Author$ $Revision$ -->
