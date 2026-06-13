---
archived: ~
categories: Matematik
dependencies: '*.md.sv'
keywords: spektralteori, riemannisk geometri, inversa problem, matematisk fysik, harmonisk
  analys, representationsteori, strukturkonstanter, konform fältteori
published: https://dx.doi.org/10.2139/ssrn.4793533
status: verifierad=27570
title: Trippelprodukter av Eigenfunktioner och spektral geometri
---

<div class="right">
  <img src="../images/lawson6-pod.png" style="width:200px">
  <p style="width:200px;text-align:center;line-height:20px">
  Lawsons minimala yta <sub>6,1</sub> stereografiskt projicerad från S<sup>3</sup> till R<sup>3</sup>
  </p>
</div>

[TOC]#sidebar

## Författare

Joe Schaefer

## Sammandrag

Använda elementära tekniker från geometrisk analys, partiella differentialekvationer och abeliska $$C^*$$ Algebror, {# lede #}Vi avslöjar en roman, men ändå bekant, global geometrisk invariant{# lede #} &mdash; nämligen **den indexerade uppsättningen integraler av tredubbla produkter av egenfunktioner hos Laplace-Beltrami-operatören**, för att exakt karakterisera vilka isospektrala slutna Riemanniska grenrör som är isometriska.

## Introduktion

För en stängd Riemannian mångfald $$(M,g)$$, som karakteriserar sin ** klass** av icke-isometriska, isospektrala grenrör är en typ av omvänd problem [[DH11]](#DH11) i spektral geometri. Naiv man kan spekulera i att denna klass alltid skulle vara *tom*. Men den akademiska litteraturen är rik med decennier gamla konstruktioner av specifika parningar av motexempel: börjar 1964 med John Milnors 16-dimensionella par icke-isometriska, isospektrala platta tori [[JM64]](#JM64)och fortsätter [[CS92]](#CS92) mot den generiska dimensionella karaktäriseringen av platt tori i Alexander Schiemanns doktorsavhandling från 1993 [[AS94]](#AS94) &mdash; Fyll i med en datorstödd sökning efter den kritiska $$\dim = 3$$ ärende  En modern undersökning av hela platt tori historia visas i [[NRR22]](#NRR22).

Längs vägen var insiktsfulla utlöpare till mer sofistikerade, icke-euklidiska symmetriska täckutrymmen; konstruera sådana isospektrala, icke-isometriska "duetter" som involverar icke-triviala krökningstensorer (och deras spektrumbestämda Euler-egenskaper i dimension 2 [[MS67]](#MS67)Ett utmärkt exempel på denna insats var Toshikazu Sunadas 1985. [[TS85]](#TS85) Uppfinning av ett allmänt syfte som täcker rymdramverk, som han sedan distribuerade i samma arbete för att bygga hyperboliska duetter i dimensionerna 2 och 3.

För inhomogena riemanniska mätvärden upptäckte Carolyn Gordon duetter som inte ens lokalt isometriska [[CG93]](#CG93).

Arbetet fortsätter inom många närliggande områden [[DH11]](#DH11), såsom bestämning av topologiska egenskaper hos klassen av isospektrala, icke-isometriska grenrör i allmänhet (tomt) [[ST80]](#ST80), ändlig [[AS94]](#AS94), styv [[GK80]](#GK80)och kompakt [[GZ97]](#GZ97)) som en delmängd av olika modulutrymmen för Riemannian-mätvärden.

Vad vi erbjuder i den här artikeln är ett nytt perspektiv på ett välbekant verktyg: indexerade Fourier-koefficienter för parvisa produkter av egenfunktioner som en diskret "algebraisk / topologisk invariant" för att komplettera den befintliga, diskreta "analytisk invariant" &mdash; det icke-negativa spektrumet hos *Laplace-Beltrami-operatören* (här kallad **Laplacian**) på $$ℋ = L^2(M,g)$$. Tillsammans observerar vi paret ger en "diskret global geometrisk representation" av isometriklasserna av isospektrala, slutna Riemannianförgreningsrör.

### resultat

<br>

<div class="card border-dark">
  <div class="card-header">

#### sats

</div>
  <div class="card-body">

Med tanke på en (icke-minskande på egenvärdena) ortonormal grund av egenfunktioner $$\set{e^i}_{i=0}^{\infty}$$ för (icke-negativa) Lappland $$\Delta_M$$ på $$L^2(M,g)$$ förknippas med en sluten Riemannian mångfald $$(M,g)$$, definiera

```math

M^{i,j,k} := \int_M e^i e^j \bar{e^k} \sqrt{g} dx = \bra{e^i e^j}\ket{e^k}

```

Att vara isometrisk för $$(M,g)$$, det är ett *nödvändigt och tillräckligt villkor* för en annan **isospektral ** stängt Riemannian mångfald för att ha en ortonormal grund för egenfunktioner (för sin Lappland) att båda bevarar tillhörande egenvärden och har en oföränderlig $$\set{M^{i,j,k}}$$ under varje grund.

</div>
</div>

<br>

*Symmetri* spelar en viktig roll i beräkningsrelaterade fall [[TF17]](#TF17) [[LS18]](#LS18) [[PS94]](#PS94), som är lämpligt illustrerad i vår platta tori [Exempel](#example) nedan. Styrkan i vårt tillvägagångssätt är dock kanske bäst uppenbar när det gäller mångfalder med det minsta antalet Riemanniska symmetrier, vilket är det generiska fallet som ofta sammanfaller med att egenvärdena är *unika * (dvs. utan icke-trivial mångfald.) I detta fall erbjuder vi följande

<br>

<div class="card border-dark">
  <div class="card-header">

### Förmodan

</div>
  <div class="card-body">

Om varje egenvärde har mångfald $$1$$Med tanke på ett par egenvärde som bevarar ortormala baser som beskrivs i teoremens hypotes är grenrör isometriska om och endast om $$\set{M^{i,j,k}}$$ för den ena grunden överensstämmer, upp till absolutvärdet i de enskilda termerna, med den andra grunden.

</div>
</div>

<br>

Motivationen för studiet av $$\set{M^{i,j,k}}$$ är löst härledd från studien av den **bilineära multiplikationsoperatorns roll** $$Y:V\otimes V\rightarrow V((z))$$ i definitionen av en Vertex-operatoralgebra [[FBZ04]](#FBZ04) Det är en Chiral Conformal Field Theory. Här $$V$$ är vektorrummet av stater och $$V((z))$$ är den formella Laurent-serien i $$z$$ med koefficienter i $$V$$. Sedan $$V$$ ofta kommer utrustad som en Hilbert Space med en traditionell Fourier-serie ortonormal grund, indexering $$Y$$ använda Fourier-grundelementen för $$V$$ är bara lite mer involverad än $$M^{i,j,k}$$ Fallet studerades här, men ganska lika i anden. En detaljerad jämförelse ligger dock utanför artikelns tillämpningsområde.

Om vi tänker på kartan

```math
(M, g, \set{e^i}) \mapsto \set{\lambda_i, M^{i,j,k}}\ ,
```

Detta papper fastställer injicerbarhet av denna karta för slutna Riemannian grenrör (upp till Riemannian isometry i dess domän). Ytterligare resultat som tillämpar dessa tekniker för att beskriva sin bild (och invers), inom vissa moduli utrymmen av mätvärden, är bara att komma igång [[AA25]](#AA25). Där tacklar Anshul Adve rigoröst enhetstangensutrymmen av kompakta, hyperboliska 2-omkretsar med samma **strukturkonstanter** från Conformal Field Theory.

Dessa resultat visades först under ett liknande tal av författaren vid **MSRI ** 1997, men de visas här i publicerad form för första gången.

## Preliminära

Nu med $$M,g,e^i,M^{i,j,k}$$ som ovan, för $$f \in C^\infty(M)$$ och $$i \geq 0$$ Observera att **Fourier koefficienter**

```math
\begin{aligned}

\hat{f}(i) &:= \int_M f(x)\bar{e^i}(x)\sqrt{g(x)}dx \\

\implies \\

f(x)        &= \sum_{i=0}^{\infty}\hat{f}(i)e^i(x).

\end{aligned}

```

sedan $$f$$ är unikt representabel som dess snabbt konvergerande ** Fourier Series** ($$\Delta_M$$-Specifika Sobolev Embeddings [[MT13]](#MT13) [[RS75]](#RS75)tillsammans med Weyls asymptotiska lag [[HW11]](#HW11), innebär att villkoren i summan är $$o(i^{-n})$$ * Enhetligt i $$x$$* [[LH68]](#LH68), $$\forall n\in\N$$Då ser vi det för $$f_1, f_2 \in C^\infty(M)$$, den punktvisa produktens fourierkoefficienter $$f_1 f_2 \in C^\infty(M)$$ är

```math
\begin{aligned}

\widehat{f_1 f_2}(k) &= \sum_{i,j}^\infty\hat{f_1}(i)\hat{f_2}(j)M^{i,j,k} \\

\implies \\

f_1f_2(x) &= \sum_{i,j,k}\hat{f_1}(i)\hat{f_2}(j)M^{i,j,k}e^k(x) \\

f_1 = f^p_2,\space p > 2 \implies \\

\sum_{k}\hat{f_1}(k)e^k(x) &= \sum_{i_1,i_2,...,i_{2p-1}}\hat{f_2}(i_1)\hat{f_2}(i_2)\hat{f_2}(i_4)\hat {f_2}(i_6)...\hat{f_2}(i_{2p-2})M^{i_1,i_2,i_3}M^{i_3,i_4,i_5}...M^{i_{2p-3},i_{2p-2},i_{2p-1}}e^{i_{2p-1}}(x).

\end{aligned}
```

och så, *kritiskt*, alla multivariata polynom $$\weierp \in \Complex[z_1,...,z_l]$$ (på släta funktioner) ** pendlar** med alla spektrumbevarande funktioner $$\Delta$$-egenfunktion ortonormal grundkarta $$\vec{F}$$ som bevarar $$\set{M^{i,j,k}}$$:

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

Obs: Vi kan alltid anta
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

### Bevis på Lemma

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

som är en karakteristisk funktion av positivt mått på varje delmängd $$\set{x\in M | a_j(x) = 1}$$. Detta innebär att Lemma är bevisat för varje $$a_j$$, eftersom den begränsande karakteristiska funktionen hos en uppsättning med positiv åtgärd bevaras, och därmed har enhetlig norm 1, liksom alla $$a_j^p,\space \vec{F}(a_j^p)=\vec{F}(a_j)^p,\space p\in\N$$, genom diagram (5).

Utan förlust av allmängiltighet kan vi tillämpa specialfallets resultat som visas för den smidiga uppdelningen av enhet $$\lbrace|f|/\lVert f \rVert_\infty, 1 - |f|/\lVert f\rVert_\infty\rbrace$$, där $$ \set{x\in M|\space|f(x)| = \lVert f \rVert_\infty}$$ har positiva mått, och Lemma bevisas i sin helhet.

Sedan $$\set {\bar e^i}$$ Det är också en Fourier-bas för $$L^2(M,g)$$Det framgår av ekvationen (3) att $$\vec F(\bar f) = \bar{\vec F}(f)$$. Detta innebär att på en tät uppsättning $$C(M)$$ (och $$C(N)$$), vi har etablerat $$\vec{F}$$ som en isomorfism av Abelian $$C^*$$ algebror, och därmed kan utvidgas till en isomorfism av $$C(M)$$ och $$C(N)$$ i samma kategori.

Nu tillämpar vi Gelfand-Naimarks representationsteorem (i kontravariant functorform) för unital Abelian $$C^*$$ algebror [[JC19]](#JC19) att representera denna isomorfism genom en homeomorfism $$F$$ mellan $$N$$ och $$M$$. Eftersom det är bijektiv på släta funktioner, måste det också vara smidigt.

Som det är nu diffeomorfism $$F$$ bevarar egenvärden och egenfunktioner (genom hypotes om $$\vec{F}(f) = f\circ F$$Det måste bevara Lappland på smidiga funktioner. Därför måste den också bevara de viktigaste symbolerna för samma elliptiska operatorer. [[MT13]](#MT13). De viktigaste symbolerna i Lappland är helt enkelt ett annat sätt att uttrycka Riemannian metriska på de mångfaldiga i fråga.

Detta kompletterar teoremens bevis.

### Diskussion om förmodan

Med $$\set{M_0^{i,j,k}}$$ och $$\set{M_1^{i,j,k}}$$ representerar de två trippelproduktseten för baserna $$\set{e_0^i}$$ och $$\set{e_1^i}$$, låt $$z_i \in \set{-1,1}$$ vara $$\Z_2^\infty$$ åtgärder mot en sådan $$\R$$-värderad ortonormal grund $$\set{e_1^i}$$. Därför måste vi välja $$z_i$$ så att $$\set{z_ie_1^i}$$ avkastning $$\set{M_1^{i,j,k}} = \set{z_i z_j z_kM_0^{i,j,k}}$$.

Varför är detta fallet? I allmänhet är den symmetrigrupp som verkar på utrymmet för möjliga ortonormala baser av egenfunktioner utrymmet för enhetsoperatorer. $$U: \mathscr H\rightarrow\mathscr H$$ som pendlar med prognoser $$P_{\mathcal V_\lambda}$$ på de finita dimensionella åttondelar $$\mathcal V_{\lambda}$$ för varje enskilt egenvärde $$\lambda$$ från Lappland. Därför

```math
\begin{aligned}
P_{\mathcal V_{\lambda}}U(e^i) = UP_{\mathcal V_{\lambda}}(e^i),\ \therefore U(e^i) &= \sum_{\lambda_i = \lambda_j}u_{ij}e^j \implies \\
M_U^{i,j,k} := \int_M U(e^i)U(e^j)\bar U(\bar e^k)\sqrt g dx &= \sum_{\lambda_r = \lambda_i,\lambda_s=\lambda_j,\lambda_t=\lambda_k} u_{ir}u_{js}\bar u_{tk} M^{r,s,t}
\end{aligned}
```

är bilden av $$M^{i,j,k}$$ under $$U$$'s basåtgärd $$e^i \mapsto U(e^i)$$.

Nu under förutsättningarna för gissningen, var och en av $$\mathcal V_\lambda$$ är ett dimensionellt vektorrum över $$\Complex$$, men det betyder också att de är endimensionella vektorrum över $$\Reals$$och så är hela den multiplikativa symmetrigruppen $$O(1,\Reals)^\infty=\Z_2^\infty$$.

Utan multiplikationsbegränsningen skulle hypotesens tillhörande förutsättning "om överensstämmelse i absoluta värden" helt enkelt bli "bevarande av den ordnade uppsättningen av singulära värden för $$\set{M^{i,j,k}}$$ (räknat med mångfald), när det ses som en samling kartor från $$\mathcal V_{\lambda_i} \rightarrow Hom(\mathcal V_{\lambda_j}, \mathcal V_{\lambda_k}^*)$$", som är en robust uppsättning enhetsinvarianter.  Vi är betydligt mindre övertygade om att denna generaliserade gissning är sann, eftersom det kan vara möjligt att producera ett motexempel via explicit Sunada-konstruktion.

Att komma tillbaka till den ursprungliga gissningen, observerar vi att beviset innebär att fastställa denna implikation:

```math
z_k = M_0^{i,i,k} / M_1^{i,i,k} \,\, \forall i,k\in\N,\, ⋺ M_0^{i,i,k} \ne 0 \, \implies
\exists r,s,t \in \N\ ⋺\ \frac{M_0^{i,j,k}}{M_1^{i,j,k}} = \frac{M_0^{r,r,i}M_0^{s,s,j}M_0^{t,t,k}}{M_1^{r,r,i}M_1^{s,s,j}M_1^{t,t,k}}\, .
```

Vi hoppas att för varje given $$k$$, $$M_0^{i,i,k}$$ Kan inte vara identisk $$0$$ för alla $$i$$. Formeln <span class="eqno"></span> för $$z_k$$ kräver båda $$i$$-oberoende och tillräcklighet, för att fastställa grundkartan $$e_0^i \mapsto z_i e_1^i$$ bevarar $$\set{M_0^{i,j,k}}$$. Alla dessa aspekter är fortfarande okända.

Låt oss dock beräkna några relevanta identiteter så att några orädda framtida forskare kan gräva i denna gissning:

```math
\begin{aligned}
\Delta fg &= f\Delta g + g\Delta f - 2 df \cdot dg \implies \\
M^{i,j,k} &= 2 \frac{\bra{de^i\cdot de^j}\ket{e^k}}{\lambda_i +\lambda_j -\lambda_k} \implies \\
\frac{\bra{de^i\cdot de^j}\ket{e^k}}{\bra{e^ie^j}\ket{e^k}} &= \frac{\lambda_i+\lambda_j-\lambda_k}{2}\ \text{ when }M^{i,j,k} \ne 0\ .\\ 
\inf_{f\in \mathscr H_k^\perp} \frac{||df \cdot df||^2}{||f||^2} &= \lambda_{k+1}\text{ , with }f=\pm e^{k+1}\ .\\

\text {and so the quadratic form} \\
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

## Exempel

Låt $$\set{\lambda_i} \subset \R^n$$ vara indexerad, rangordna $$n$$ Gitter av Lie Algebra vikter för kvoten utrymme representation av $$\frak{g}=\Reals^n$$ som översättningsinvariant (dvs. konstant) vektorfält på sig själv, när $$\R^n$$ ses också som $$\frak{g}$$'s associerade Lie Group över en torus definierad av $$\Reals^n/A\Z^n, A \in GL(n,\Reals)$$. Dessa vikter definierar integrerade hissar av 1-former över torus som integrerar till linjära funktioner. $$\bra{x} \lambda_i\rangle,\space x\in\Reals^n$$ som sin Liegrupp (som täcker torus). Dessa linjära funktioner kan sedan skalas om enhetligt (genom $$2\pi \sqrt{-1}$$) och exponentierade för att bilda multiplikativa tecken som härstammar till att bilda en ortonormal bas av $$L^2(\Reals^n/A\Z^n,dx)$$, med Lebesgue (Haar) mått $$dx$$.

Dessutom diagonaliserar denna grund samtidigt den platta torus Laplacian ** eftersom ** Lappland är bilden av ett symmetriskt, negativt bestämt kvadratiskt Casimir-element under denna (konstant koefficient linjär differentialoperator) kvotmellanrumsrepresentation av den universella omslutande algebra. Därför är dess egenvärden i konstant proportion (av $$4\pi^2$$) till Casimir-element-bestämd längd-kvadrat av varje karaktärs vikt i gitter.

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

Eftersom denna ekvation <span class="eqno"></span> är *bara* invariant under linjära omvandlingar på viktgitter $$(A^{-1})^t\Z^n = \set{\lambda_i}$$, endast ett $$L^2$$ ortonormal egenfunktionskarta **som induceras från en volymbevarande inverterbar linjär karta mellan två sådana indexerade, rangordnade $$n$$ viktgitter** behåller den indexerade datamängden "algebraisk/topologisk" $$\set{M^{i,j,k}}$$ Ovariant.

För att kunna tillämpa vår [Satsen](#theorem)Det är viktigt att en sådan linjär karta $$B$$ vara $$B\in SO(n,\Reals)$$ på vikten gitter, eftersom den inducerade $$L^2$$ Basmappning för egenfunktion

```math
\set{e^{2\pi\sqrt{-1}\langle x| B\lambda_i\rangle}/\sqrt{|\det A|}}_{i=0}^\infty
```

måste också bevara de "analytiska" invarianterna &mdash; Casimir-element-inducerad figur $$4\pi^2\lVert\lambda_i\rVert^2$$ för varje indexerad vikt, dvs. de individuella egenvärdena i Lappland.

Detta representationsteoretiska konto [[AK01]](#AK01) är exakt likvärdig med den tidigare utvecklingen av *lattice kongruens* [[NRR22]](#NRR22) Traditionellt används för att avgränsa isometri klasser av platt tori. Faktum är att matrisen införlivar en sådan linjär karta $$B\in SO(n,\Reals)$$, som beskrivs i föregående stycke, **är ** den kontravariant Riemannian isometri mellan tori, som tillhandahålls genom tillämpning av *Gelfand-Naimark Representation Theorem * under [Bevis](#proof-of-theorem) från vår [Satsen](#theorem).

Antal bekräftelser

Den ursprungliga forskningen finansierades delvis av en nådig James Simons Research Award 1995-1996, och det generösa stödet från en Alfred P. Sloan Dissertation Fellowship 1996-1997 vid universitetet vid Stony Brook.

Författaren vill också tacka Tanya Christiansen, Carolyn Gordon, Hamid Hezari, Harish Seshadri, och särskilt Leon Takhtajan för deras tekniska hjälp och översyn vid utarbetandet av detta manuskript för publicering.

<!-- $Date$ $Author$ $Revision$ -->
