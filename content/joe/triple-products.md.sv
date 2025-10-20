---
archived: ~
categories: Matematik
dependencies: '*.md.sv'
keywords: spektralteori, riemanngeometri, inversa problem, matematisk fysik, harmonisk
  analys, representationsteori
published: https://dx.doi.org/10.2139/ssrn.4793533
status: verifierad=27161
title: Trippelprodukter av Eigenfunctions och Spectral Geometry
---

<div class="right">
  <img src="../images/lawson6-pod.png" style="width:200px">
  <p style="width:200px;text-align:center;line-height:20px">
  Lawsons minimala yta <sub>6,1</sub> projiceras stereografiskt från S<sup>3</sup> till R<sup>3</sup>
  </p>
</div>

[TOC]

## Författare

Joe Schaefer

## Sammandrag

Använda elementära tekniker från geometrisk analys, partiella differentialekvationer och abelska $$C^*$$ Algebror, {# lede #}Vi avslöjar en roman, men ändå bekant, global geometrisk invariant{# lede #} &mdash; nämligen ** den indexerade uppsättningen integraler av tredubbla produkter av egenfunktioner hos Laplace-Beltrami-operatören**, för att exakt karakterisera vilka isospektrala slutna Riemanniska grenrör som är isometriska.

## Introduktion

För en sluten riemannmångfald $$(M,g)$$, som karakteriserar dess **klass** av icke-isometriska, isospektrala grenrör är en typ av inverterat problem [[DH11]](#DH11) i spektral geometri. Man kan spekulera i att denna klass alltid skulle vara *tom*. Den akademiska litteraturen är dock rik på årtionden gamla konstruktioner av specifika parningar av motexempel: från 1964 med John Milnors 16-dimensionella par icke-isometriska, isospektrala platta tori [[JM64]](#JM64)och fortsätter [[CS92]](#CS92) mot den generiska dimensionella karaktäriseringen av platt tori i Alexander Schiemann doktorsavhandling från 1993 [[AS94]](#AS94) &mdash; fyll i med en datorstödd sökning efter den kritiska $$\dim = 3$$ ärende.  En modern undersökning av hela den platta tori-historien visas i [[NRR22]](#NRR22).

Längs vägen var insiktsfulla avskjutningar i mer sofistikerade, icke-euklidiska symmetriska täckningsutrymmen; konstruera sådana isospektrala, icke-isometriska "duetter" som involverar icke-privata krökningssensorer (och deras spektrumbestämda Eulers egenskaper i dimension 2 [[MS67]](#MS67).) Ett utmärkt exempel på denna insats var Toshikazu Sunadas 1985 [[TS85]](#TS85) Uppfinning av en allmän täckningsram, som han sedan använde i samma arbete för att konstruera hyperboliska duetter i dimensionerna 2 och 3.

För inhomogena Riemannian-mått upptäckte Carolyn Gordon duetter som inte ens är lokalt isometriska. [[CG93]](#CG93).

Arbetet fortsätter inom många relaterade områden [[DH11]](#DH11), såsom bestämning av topologiska egenskaper hos klassen av isospektrala, icke-isometriska grenrör i allmänhet (tom [[ST80]](#ST80), ändlig [[AS94]](#AS94), styv [[GK80]](#GK80)och kompakt [[GZ97]](#GZ97)) som en delmängd av olika moduli-utrymmen av Riemannian-mått.

Vad vi erbjuder i den här artikeln är ett nytt perspektiv på ett välbekant verktyg: indexerade Fourier-koefficienter av parvisa produkter av egenfunktioner som en diskret "algebraisk / topologisk invariant" för att komplettera den befintliga, diskreta "analytisk invariant" &mdash; det icke-negativa spektrumet hos operatören *Laplace-Beltrami* (nedan kallad "Laplacian**") på $$ℋ = L^2(M,g)$$. Kombinerat observerar vi paret ger en "diskret global geometrisk representation" av isometriklasserna av isospektrala, stängda Riemannian-mångfalder.

### resultat

<br>

<div class="card border-dark">
  <div class="card-header">

#### Satsen

</div>
  <div class="card-body">

Med tanke på en (icke-minskande på egenvärdena) ortonormal grund av egenfunktioner $$\set{e^i}_{i=0}^{\infty}$$ för (icke-negativa) Lappland $$\Delta_M$$ på $$L^2(M,g)$$ i samband med en stängd Riemannian mångfald $$(M,g)$$, definiera

```math

M^{i,j,k} := \int_M e^i e^j \bar{e^k} \sqrt{g} dx = \bra{e^i e^j}\ket{e^k}

```

Att vara isometrisk till $$(M,g)$$, det är ett *nödvändigt och tillräckligt tillstånd * för en annan ** isospektral** stängd Riemannian mångfald för att ha en ortonormal grund av egenfunktioner (för dess laplacian) som både bevarar de tillhörande egenvärdena och har en oföränderlig $$\set{M^{i,j,k}}$$ under varje grund.

</div>
</div>

<br>

*Symmetri* spelar en viktig roll i beräkningshanterbara fall [[TF17]](#TF17) [[LS18]](#LS18) [[PS94]](#PS94), som är lämpligt illustrerad i vår platta tori [Exempel](#example) nedanför. Men styrkan i vårt tillvägagångssätt är kanske bäst uppenbar i fallet med mångfald med det minsta antalet Riemannian symmetrier, vilket är det generiska fallet som ofta sammanfaller med att egenvärdena är * unika * (dvs utan icke-trivial mångfald.) I detta fall erbjuder vi följande

<br>

<div class="card border-dark">
  <div class="card-header">

### Förmodan

</div>
  <div class="card-body">

Om varje egenvärde har mångfald $$1$$Med tanke på ett par egenvärdesbevarande ortormala baser som beskrivs i teoremens hypotes är mångfaldarna isometriska om och endast om $$\set{M^{i,j,k}}$$ för den ena grunden överens med den andra grunden, upp till absolut värde i enskilda termer.

</div>
</div>

<br>

Motivationen för studien av $$\set{M^{i,j,k}}$$ är löst härledd från studien av den roll som **bilinär multiplikationsoperator** $$Y:V\otimes V\rightarrow V((z))$$ i definitionen av en Vertex Operator Algebra [[FBZ04]](#FBZ04) i samband med en chiral konform fältteori. Här $$V$$ är statens vektorrum och $$V((z))$$ är utrymmet för formella Laurent-serien i $$z$$ med koefficienter i $$V$$. Sedan $$V$$ ofta kommer utrustad som en Hilbert Space med en traditionell Fourier-serie ortonormal grund, indexering $$Y$$ använda Fourier-baselementen i $$V$$ är bara något mer involverad än $$M^{i,j,k}$$ fall studerat här, men ganska lika i anden. En detaljerad jämförelse är dock inte möjlig för denna artikel.

Om vi betraktar kartan

```math
(M, g, \set{e^i}) \mapsto \set{\lambda_i, M^{i,j,k}}\ ,
```

denna uppsats fastställer bijektiviteten av denna karta för stängda Riemannian mångfald (upp till Riemannian isometry i dess domän). Ytterligare resultat som tillämpar dessa tekniker för att beskriva dess bild (och invers), inom utvalda moduli-utrymmen av mätvärden, är bara att komma igång [[AA25]](#AA25). Där tar Anshul Adve noggrant itu med enhetens tangentutrymmen av kompakta, hyperboliska 2-orbifoldar med hjälp av samma **strukturkonstanter** från Conformal Field Theory.

Dessa resultat visades först under ett liknande tal av författaren på ** MRT** 1997, men de visas här i publicerad form för första gången.

## Preliminära

Nu med $$M,g,e^i,M^{i,j,k}$$ som ovan, för $$f \in C^\infty(M)$$ och $$i \geq 0$$ Observera att **Fourier-koefficienter**

```math
\begin{aligned}

\hat{f}(i) &:= \int_M f(x)\bar{e^i}(x)\sqrt{g(x)}dx \\

\implies \\

f(x)        &= \sum_{i=0}^{\infty}\hat{f}(i)e^i(x).

\end{aligned}

```

sedan $$f$$ är unikt representabel eftersom dess snabbt konvergerande **Fourier-serien** ($$\Delta_M$$-specifika Sobolev Embeddings [[MT13]](#MT13) [[RS75]](#RS75)tillsammans med Weyls asymptotiska lag [[HW11]](#HW11)innebär att villkoren i summan är $$o(i^{-n})$$ * Likformigt i $$x$$* [[LH68]](#LH68), $$\forall n\in\N$$Då ser vi att för $$f_1, f_2 \in C^\infty(M)$$, Fourierkoefficienter för den punktvisa produkten $$f_1 f_2 \in C^\infty(M)$$ är

```math
\begin{aligned}

\widehat{f_1 f_2}(k) &= \sum_{i,j}^\infty\hat{f_1}(i)\hat{f_2}(j)M^{i,j,k} \\

\implies \\

f_1f_2(x) &= \sum_{i,j,k}\hat{f_1}(i)\hat{f_2}(j)M^{i,j,k}e^k(x) \\

f_1 = f^p_2,\space p \space \in \N \implies \\

\sum_{k}\hat{f_1}(k)e^k(x) &= \sum_{i_1,...,i_p, k}\hat{f_2}(i_1)...\hat{f_2}(i_p)M^{i_1,i_2,i_3}M^{i_2,i_3,i_4}...M^{i_{p-1},i_p,k}e^k(x).

\end{aligned}
```

och så, *kritiskt*, alla multivariat polynom $$\weierp \in \Complex[z_1,...,z_l]$$ (på smidiga funktioner) ** pendlar** med alla spektrumbevarande $$\Delta$$-Egenfunktion ortonormal bas karta $$\vec{F}$$ som bevarar $$\set{M^{i,j,k}}$$:

```math
\begin{CD}
  C^\infty(M,\space\Complex^l) @>\weierp >> C^\infty(M)\\
   @V\underbrace{\vec{F}\oplus\dots\oplus \vec{F}}_{l\space\text{times}}VV @VV\vec{F}V\\
  C^\infty(N,\space\Complex^l) @>>\weierp > C^\infty(N)
\end{CD}
```

Om $$A\subset M$$ är Borel-mätbar, då resultaten ovan hålla pointwise för *karakteristisk funktion av $$A$$* överallt utom längs gränsen till $$A$$: om $$f = f^2$$ och $$A:=\set{x\in M|f(x)=1}$$,

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

Detta innebär att en sådan baskarta som ovan har karakteristiska funktioner (som medlemmar av $$L^2(M,g)\subset L^1(M,g)$$) till karakteristiska funktioner på ett måttbevarande sätt.

Poängen med dessa beräkningar är att betona det faktum att $$\set{M^{i,j,k}}$$ **karakteriserar** den harmoniska analysen av den punktvisa multiplikationsoperatorn på $$C^\infty(M)$$som är en tät subalgebra av den abelska $$C^*$$ algebra $$C(M)$$av Stone-Weierstrass sats.

För den snabba konvergensen av ovanstående belopp som omfattar $$M^{i,j,k}$$, notera att produkter av egenfunktioner är jämna, så dessa Fourier-koefficienter sönderfaller som ovan (i varje index). För mer information, se Emmett Wymans arbete 2022 med dessa koefficienter när det gäller triangel ojämlikhet på egenvärdena. [[EW22]](#EW22).

Anmärkning: Vi kan alltid anta
```math
\begin{aligned}
e^0 &= M^{0,0,0} = 1/\sqrt{vol(M)} \\
\implies \\
M^{0,j,k} &= M^{j,0,k} = \delta_{j-k}\space/\sqrt{vol(M)}
\end{aligned}
```

där $$\delta_i$$ är Kronecker delta. Sedan $$vol(M)$$ är en spektral invariant [[HW11]](#HW11), denna information är redan tillgänglig från isospektralitetshänsyn.

## Teorembevis

Av nödvändighet, låt $$F:(N,h)\rightarrow (M,g)$$ vara en isometri mellan slutna riemanniska grenrör och låta målet ortonormal grund av egenfunktioner på $$L^2(N,h)$$ vara pullback via $$F$$ den ortonormala grunden $$\set{e^i}$$ på $$(M,g)$$ ovanför. Sedan

```math
\begin{aligned}
M^{i,j,k} &= \int_M e^i e^j \bar{e^k}\sqrt{g}dy \\
          &= \int_N e^i(F(x)) e^j(F(x))\bar{e^k}(F(x))\sqrt{h}dx

\end{aligned}
```

Det är nödvändigt att argumentera för att $$\Delta_N(f\circ F) = (\Delta_M f) \circ F,\ \ \forall f\in C^\infty(M)$$.

För tillräcklighet överväger vi nu den linjära, bijektiva ortonormala eigenfunktionsbaskartan $$\vec{F}$$ från $$C^\infty(M)$$ till $$C^\infty(N)$$ Observera att beräkningarna i [Preliminära](#preliminaries) ovanför, $$\vec{F}$$ bevarar punktvisa produkter för smidiga funktioner (och bevarar karakteristiska funktioner när de utökas till $$L^2(M,g)$$) enligt förutsättningen att $$\set{M^{i,j,k}}$$ är invariant under denna karta.

### Lemma

$$\vec{F}: C^\infty(M)\rightarrow C^\infty(N)$$ Bevarar den enhetliga normen.

### Bevis på Lemma

Låt $$\set{a_i}$$ vara en jämn delning av enhet på $$M$$.

```math
\begin{aligned}
1 &= \sum_i a_i(x) \\
       &= \sum_{i,j} \hat{a_i}(j)e^j(x) \\
	   &= \sum_j e^j(x)\sum_i \hat{a_i}(j)
\end{aligned}
```

Således $$\sum_i\hat{a_i}(j) = \delta_j\sqrt{vol(M)}$$ (Kronecker delta).

genom den dominerade konvergensatsen,

```math
\lim_{p\rightarrow\infty}
\sum_j\hat{a^p_j}(k) = \int_{\dot{\bigcup}_j\set{a_j=1}}\bar{e^k}(x)\sqrt{g}dx
```

som är en karakteristisk funktion av positivt mått på varje delad delmängd $$\set{x\in M | a_j(x) = 1}$$. Detta innebär att Lemma bevisas för varje $$a_j$$, eftersom den begränsande karakteristiska funktionen hos ett set med positivt mått bevaras, och därmed har enhetlig norm 1, liksom alla $$a_j^p,\space \vec{F}(a_j^p)=\vec{F}(a_j)^p,\space p\in\N$$enligt diagram (5).

Utan förlust av allmängiltighet kan vi tillämpa det speciella fallresultat som visas för den smidiga uppdelningen av enhet $$\lbrace|f|/\lVert f \rVert_\infty, 1 - |f|/\lVert f\rVert_\infty\rbrace$$, där $$ \set{x\in M|\space|f(x)| = \lVert f \rVert_\infty}$$ har ett positivt mått, och Lemma är bevisat i sin helhet.

Sedan $$\set {\bar e^i}$$ Det är också en fourier bas för $$L^2(M,g)$$Det framgår av Ekvation (3) att $$\vec F(\bar f) = \bar{\vec F}(f)$$. Detta innebär att på en $$C(M)$$ (och $$C(N)$$), vi har upprättat $$\vec{F}$$ som en isomorfism av Abelian $$C^*$$ algebror, och därmed kan utvidgas till en isomorfism av $$C(M)$$ och $$C(N)$$ i samma kategori.

Nu tillämpar vi Gelfand-Naimark representationssatsen (i kontravariant functor form) för Abelian $$C^*$$ algebra [[JC19]](#JC19) att representera denna isomorfism av en homeomorfism $$F$$ mellan $$N$$ och $$M$$. Eftersom det är bijektivt på smidiga funktioner måste det också vara smidigt.

Som nu är diffeomorphism $$F$$ bevarar egenvärden och egenfunktioner (genom hypotes om $$\vec{F}(f) = f\circ F$$), det måste bevara Laplacian på smidiga funktioner. Därför måste den också bevara de viktigaste symbolerna för dessa samma elliptiska operatörer. [[MT13]](#MT13). De viktigaste symbolerna för Laplacian är helt enkelt ett annat sätt att uttrycka Riemannian metriska på de olika grenarna i fråga.

Detta kompletterar teoremens bevis.

### Diskussion om gissning

Med $$\set{M_0^{i,j,k}}$$ och $$\set{M_1^{i,j,k}}$$ som representerar de två treproduktuppsättningarna för baserna $$\set{e_0^i}$$ och $$\set{e_1^i}$$, låt $$z_i \in \set{-1,1}$$ vara $$\Z_2^\infty$$ åtgärder för en sådan $$\R$$-värderad ortonormal grund $$\set{e_1^i}$$. Därför måste vi välja $$z_i$$ så att $$\set{z_ie_1^i}$$ avkastning $$\set{M_1^{i,j,k}} = \set{z_i z_j z_kM_0^{i,j,k}}$$.

Vi ser med nödvändighet att

```math
z_k = M_0^{i,i,k} / M_1^{i,i,k} \,\, \forall i,k\in\N,\, ⋺ M_0^{i,i,k} \ne 0 \,.
```

Vi hoppas att för varje given $$k$$, $$M_0^{i,i,k}$$ kan inte vara identiskt $$0$$ för alla $$i$$. Vid första rodnad verkar det inte omöjligt om $$M$$ har en "jämn/odd" symmetrigrupp, och $$e^k$$ är udda, men hoppet gäller för flat-torifallet nedan (som inte uppfyller den enhetliga egenvärdesmultiplikiteten = 1 villkor). Formeln (11) för $$z_k$$ kräver båda $$i$$-oberoende, och tillräcklig, för att fastställa baskartan $$e_0^i \mapsto z_i e_1^i$$ konserver $$\set{M_0^{i,j,k}}$$. Alla dessa aspekter förblir okända.

Låt oss dock beräkna några relevanta identiteter så att några oförskämda framtida forskare kan gräva i denna gissning:

```math
\begin{aligned}
\Delta fg &= f\Delta g + g\Delta f - 2 df \cdot dg \implies \\
M^{i,j,k} &= 2 \frac{\bra{de^i\cdot de^j}\ket{e^k}}{\lambda_i +\lambda_j -\lambda_k}\\
\text{Now by polarization}\\
M^{i,j,k} &= \frac{\bra{(e^i+e^j)^2 - (e^i - e^j)^2}\ket{e^k}}{4} = \frac{M^{i,i,k} + M^{j,j,k} - \bra{(e^i-e^j)^2}\ket{e^k}}{2},\\
\text {and so the quadratic form} \\
Q_k(f,g) :&= \bra{df\cdot dg}\ket{e^k} = \sum_{i,j}\hat{f}(i)\hat{g}(j)\bra{de^i\cdot de^j}\ket{e^k} \\
&= \frac{1}{2}\sum_{i,j}\hat{f}(i)\hat{g}(j)(\lambda_i + \lambda_j - \lambda_k)M^{i,j,k} .\ \\
\text{Now with }J \text{ real-analytic}\\
Q^J_k(f,g) :&= -\frac{1}{2}\bra{(J(\sqrt{\Delta})fg - fJ(\sqrt{\Delta})g - gJ(\sqrt{\Delta})f}\ket{e^k} \\
&= -\frac{1}{2}(\bra{fg}\ket{J(\sqrt{\Delta}) e^k} - \bra{fJ(\sqrt{\Delta})g + gJ(\sqrt{\Delta})f}\ket{e^k})\\
&= \frac{1}{2}\sum_{i,j}\hat{f}(i)\hat{g}(j)(J(\sqrt{\lambda_i}) + J(\sqrt{\lambda_j}) - J(\sqrt{\lambda_k})M^{i,j,k}\\
\tilde{Q}_k(f,g) :&= -\frac{1}{2}\bra{\sqrt{\Delta} fg - f\sqrt{\Delta}g -g\sqrt{\Delta}f}\ket{e^k} \\
&= \frac{1}{2}\sum_{i,j} \hat{f}(i)\hat{g}(j)(\sqrt{\lambda_i} + \sqrt{\lambda_j} - \sqrt{\lambda_k})M^{i,j,k}\\
df \cdot dg &= \sum_k Q_k(f,g)e^k = -\frac{\Delta fg - f\Delta g - g\Delta f}{2}\\
Q_0(f,f) &= \frac{1}{\sqrt{vol(M)}}\sum_i \hat{f}(i)^2 \lambda_i\\
df\cdot df = \sum_kQ_k(f,f)e^k &= \frac{1}{2}\sum_{i,j,k}\hat{f}(i)\hat{f}(j)(\lambda_i + \lambda_j -\lambda_k)M^{i,j,k}e^k\\
&= \frac{1}{4}\sum_{i,j,k}\hat{f}(i)\hat{f}(j)(\lambda_i + \lambda_j -\lambda_k)(M^{i,i,k} + M^{j,j,k} - \bra{(e^i-e^j)^2}\ket{e^k})e^k\\
 = g^2 &= \sum_{i,j,k}\hat{g}(i)\hat{g}(j)M^{i,j,k}e^k \implies\\
 \frac{1}{2}\sum_{i,j}\hat{f}(i)\hat{f}(j)(\lambda_i + \lambda_j - \lambda_k)M^{i,j,k} &= \sum_{i,j}\hat{g}(i)\hat{g}(j)M^{i,j,k} \\
&= \widehat{g^2}(k). \\
\end{aligned}
```
Anmärkning: för det endimensionella flat-torifallet nedan, $$\tilde{Q}_k(e^i,e^j) = 0$$ sedan $$\sqrt{\Delta} = \sqrt{-1}\frac{d}{dx}$$ Det är en sann härledning.

## Exempel

Låt $$\set{\lambda_i} \subset \R^n$$ vara indexerad, rangordna $$n$$ lattice av Lie Algebra vikter för kvotutrymme representation av $$\frak{g}=\Reals^n$$ som översättningsinvariant (dvs. konstant) vektorfält på sig själv, när $$\R^n$$ ses också som $$\frak{g}$$'s associerade Lie Group över en torus definierad av $$\Reals^n/A\Z^n, A \in GL(n,\Reals)$$. Dessa vikter definierar icke-hållbara lyft av 1-former över torusen som integrerar med linjära funktioner $$\bra{x} \lambda_i\rangle,\space x\in\Reals^n$$ som dess lögngrupp (som täcker torusen). Dessa linjära funktioner kan sedan likformigt skalas om (genom $$2\pi \sqrt{-1}$$) och exponentierad för att bilda multiplikativa tecken som nedstiger till att bilda en ortonormal bas av $$L^2(\Reals^n/A\Z^n,dx)$$med måttet Lebesgue (Haar) $$dx$$.

Dessutom diagonaliserar denna bas samtidigt den platta torus Laplacian ** eftersom** Laplacian är bilden av en symmetrisk, negativ-definit kvadratisk Casimir element under denna (konstant koefficient linjär differential operator) kvotutrymme representation av den universella omslutande algebra. Därför är dess egenvärden i konstant proportion (av $$4\pi^2$$) till Casimir-element-bestämda längd-kvadrat av varje karaktärs vikt i gitter.

Vi ser för närvarande ovanstående

```math
\set{e^{2\pi\sqrt{-1}\langle{x}|\lambda_i\rangle}/\sqrt{|\det A|}}_{i=0}^\infty
```
att vara vår teorem-tillämpliga Fourier-bas av ortonormala (multiplikativa) egenfunktioner (av denna kvotrepresentation av det (negativa) euklidiska Casimir-elementet) som direkt motsvarar $$\set{\lambda_i}$$. Genom våra hypoteser måste vi ha $$i < j \implies \lVert\lambda_i\rVert \leq \lVert\lambda_j\rVert$$ (med den euklidiska normen på vikterna).

Nu kan vi beräkna

```math
M^{i,j,k} = \begin{cases}
1/\sqrt{|\det A|} & \lambda_i + \lambda_j - \lambda_k = 0 \\
0 & \text{otherwise}
\end{cases}
```

Eftersom denna ekvation <span class="eqno"></span> är *endast * invariant under linjära transformationer på viktgitter $$(A^{-1})^t\Z^n = \set{\lambda_i}$$, endast en $$L^2$$ ortonormal egenfunktionsbaskarta **som induceras från en volymbevarande inverterbar linjär karta mellan två sådana indexerade, rangordnade $$n$$ viktgitter** behåller den "algebraiska/topologiska" indexerade datamängden $$\set{M^{i,j,k}}$$ oföränderlig.

För att kunna tillämpa våra [Satsen](#theorem)Det är viktigt att en sådan linjär karta $$B$$ vara $$B\in SO(n,\Reals)$$ på viktgitter, eftersom den inducerade $$L^2$$ baskarta för egenfunktion

```math
\set{e^{2\pi\sqrt{-1}\langle x| B\lambda_i\rangle}/\sqrt{|\det A|}}_{i=0}^\infty
```

måste också bevara de "analytiska" varianterna &mdash; Casimir-element inducerad figur $$4\pi^2\lVert\lambda_i\rVert^2$$ för varje indexerad vikt, dvs. de individuella egenvärdena för flattoris laplacian.

Detta representationsteoretiska konto [[AK01]](#AK01) är exakt likvärdig med tidigare utveckling av *lattice kongruens* [[NRR22]](#NRR22) traditionellt används för att avgränsa isometriska klasser av platt tori. I själva verket transponerar matrisen en sådan linjär karta $$B\in SO(n,\Reals)$$, som beskrivs i föregående stycke, **är ** den kontravariant Riemannian isometri mellan tori, som tillhandahålls genom tillämpning av *Gelfand-Naimark Representation Theorem * under [Bevis](#proof-of-theorem) av våra [Satsen](#theorem).

Antal bekräftelser

Den ursprungliga forskningen finansierades delvis av ett nådigt James Simons Research Award 1995-1996, och det generösa stödet från en Alfred P. Sloan Dissertation Fellowship 1996-1997 vid universitetet i Stony Brook.

Författaren vill också tacka Tanya Christiansen, Carolyn Gordon, Hamid Hezari, Harish Seshadri och särskilt Leon Takhtajan för deras tekniska hjälp och översyn vid utarbetandet av detta manuskript för publicering.

<!-- $Date$ $Author$ $Revision$ -->
