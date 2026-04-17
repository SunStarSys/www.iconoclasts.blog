---
archived: ~
categories: Matematik, dynamik
dependencies: '*.md.sv'
keywords: dynamik, mekanik, kvant, klassisk, värmekärna, dödande fält, feynman kac,
  cameron martin
published: ~
status: röran
title: Dynamik, klassisk och kvantum
---

<div class="right">

![QM](dynamics.page/dynamics).

</div>

{# lede #}En differentialgeometer's tillvägagångssätt{# lede #}

Prerequisites:

1. Förståelse för Stokes' Satsen om differentialexteriörtensoralgebror $$n$$-dimensionella grenrör $$M$$.

2. Exponering för grundläggande Riemannian Geometry, esp i lokala koordinater, inklusive Einstein / PAIN Notation.

3. Intresset för mjuka och stokastiska dynamiska system inklusive Brownian Motion och Martingale teori.

[TOC]

## Klassisk dynamik

### Hamilton-Jacobi / Lagrange-formalism

### Mekaniken för Cotangent Bundles

Definiera den släta **Hamiltonian** $$\mathcal H:T_q^{\*}M\oplus\Reals\rightarrow\Reals$$ som $$\mathcal H(p,q,t)$$.

#### Låt $$\theta := p\ dq - \mathcal H(p,q,t)\ dt\in T^\*(T^\*M\oplus\Reals)$$.

Definiera $$\mathcal S_\mathcal H(\gamma) := \int_\gamma \theta$$ för smidig $$\gamma:[0,t]\rightarrow T^{\*}M\oplus\Reals$$.

Om två sådana kurvor $$\gamma_1, \gamma_2$$ ha exakt samma gränsslutpunkter, definiera **subtraktion** genom invers sammansättning, så $$\gamma_1 - \gamma_2$$ är en sluten slinga som definieras genom traversering $$\gamma_1$$ framåtriktad, och $$\gamma_2$$ Omvänt. Låt $$S$$ vara en 2-dimensonal yta som avgränsas av denna slutna slinga: $$\gamma_1 - \gamma_2 = \partial S$$. Så

```math
\begin{aligned}
\mathcal S_\mathcal H(\gamma_1) - \mathcal S_\mathcal H(\gamma_2) &= \int_{\gamma_1 - \gamma_2}\theta \\
&= \int_{\partial S}\theta\\
&= \int_S d\theta
\end{aligned}
```
Från Stokes' Sats

Oavsett om en sådan yta $$S$$ Det finns faktiskt, för handlingen $$\mathcal S_\mathcal H$$ att endast vara beroende av slutpunkterna för $$\gamma$$Vi måste ha första ordningens villkor som $$d\theta$$ dö $$\gamma$$.

#### Låt $$\omega_\mathcal H := d\theta = dp\wedge dq - d\mathcal H \wedge dt\in\bigwedge^2T^\*(T^\*M\oplus\Reals)$$.

```math
\begin{aligned}
\omega_\mathcal H|_\gamma &= \dot{p}\ dt\wedge dq + \dot{q}\ dp\wedge dt - \frac{\partial \mathcal H}{\partial p}dp\wedge dt - \frac{\partial \mathcal H}{\partial q}dq\wedge dt \\
        &= (-\dot{p}_i - \frac{\partial \mathcal H}{\partial q^i}) dq^i \wedge dt+  (\dot{q}^i - \frac{\partial \mathcal H}{\partial p_i}) dp_i\wedge dt
\end{aligned}
```

#### $$\therefore \omega_\mathcal H|_\gamma = 0 \iff \gamma(t)$$ - Lokala sevärdheter i Hamilton-Jacobi Equations
```math
\begin{aligned}
\dot p &= -\frac{\partial \mathcal H}{\partial q} \\
\dot q &= \ \ \ \frac{\partial \mathcal H}{\partial p}
\end{aligned}
```

$$\iff \gamma:[0,t]\rightarrow T^*M\oplus\R  $$ är en *stationär kurva* för åtgärden $$\mathcal S_\mathcal H(\gamma)=\int_\gamma \theta$$.

#### Legendre Transform
När $$\mathcal H$$ är konvex i $$p$$, $$\forall \dot{q} \in T_q M\ \exists !\ p=p_{max}(\dot q)$$  nöjd $$\dot{q} = \frac{\partial \mathcal H}{\partial p}(p_{max},q,t)$$. Definierar (involutivt) Legendre Transform $$\mathcal L$$ av $$\mathcal H$$:
```math
\begin{aligned}
\mathcal{L}(\dot q,q,t) &:= \max_p p\dot{q} - \mathcal H(p,q,t) \\&= p_{max}(\dot q)\dot q - \mathcal H(p_{max}(\dot q),q,t) \\
\mathcal S_\mathcal{L}(\pi(\gamma)) &= \int_{\pi(\gamma)} \mathcal{L}(\dot q, q, t)\ dt
\end{aligned}
```
är den *Lagrangiska representationen av åtgärden *, där $$\pi: T^*M\oplus\Reals \rightarrow M\oplus\Reals$$ är den (glömliga) fiberprojektionsoperatören $$(p,q,t)\mapsto (q,t)$$.

#### Principen om minsta åtgärd

Principen om minsta åtgärd hävdar helt enkelt att naturens klassiska dynamik själv tenderar att välja banor som minimerar $$\mathcal S_\mathcal{L}$$.

I allmänhet är detta påstående **falskt**. Men de fasta kurvorna för $$\mathcal S_\mathcal H$$ är alltid intressant att upptäcka, och de är identiska med kurvorna som lämnar $$\mathcal S_\mathcal{L}$$ stationär.  Lokalt **differentialekvationerna för dessa stationära banor är identiska**, och så vidare $$\mathcal S_\mathcal H = \mathcal S_\mathcal{L}$$ på dessa kurvor.  I den lagrangiska formuleringen är dessa kovarianta ekvationer kända som **Euler-Lagrange ekvationer**. $$(d\mathcal{L}\wedge dt)|_{\pi(\gamma)} = 0:$$

```math
\frac{\partial \mathcal L}{\partial q} = \frac{d}{dt}\frac{\partial \mathcal L}{\partial \dot q}
```

som är en andra ordningens ODE i $$t \mapsto q(t)$$, så har $$2\dim M+1$$ inledande villkor $$(\dot q_0, q_0, t_0)$$Precis som med Hamilton-Jacobi-ekvationerna. Genom Picard-Lindelöfs sats har dessa ekvationer lokala unika lösningar när de inramas som ett värdeproblem.

En intressant aspekt av $$\mathcal S_\mathcal L(\pi\circ\gamma)$$ uppenbarar sig när vi unikt kan definiera $$\pi\circ\gamma$$ implicit baserat på slutpunkterna $$(q_0, t_0)$$ och $$(q_f, t_f)$$, så vi måste *omvandla detta gränsvärdesproblem till ett initialvärdesproblem*. Med andra ord måste vi lösa för en $$\dot q_0$$ som kommer att nå målet $$(q_f, t_f)$$ med en (unik?) stationär kurva $$\pi\circ\gamma$$ som löser Euler-Lagrange-ekvationerna. På så sätt kan vi tänka på $$\mathcal S = \mathcal S(q_0,t_0, q_f, t_f)$$ som en **övergångsfunktion**, förutsatt att den inte beror på valet av stationär $$\pi\circ\gamma$$och en sådan $$\gamma$$ Det finns faktiskt i Solution Space av släta kurvor som förbinder de två övergångspunkterna.  Lokalt är detta en tillämpning av den implicita funktionssatsen, men globalt kan det finnas topologiska hinder för att konstruera sådana. $$\gamma$$.

Låt'ta ett steg tillbaka och definiera något enklare: en unik "vågrät" lyftkraft $$\mathcal A=\dot q\oplus \pi^{-1}:T_{q} M\oplus \Reals \rightarrow T_{q}^{\*}M\oplus \Reals$$ genom tilldelning

```math
(\dot q, q,t)\mapsto (p_{max}(\dot q), q, t)\ .
```
Nu har vi, för **något** "beräknad" slät kurva (inte bara stationära) $$\tilde\gamma:[0,t]\rightarrow M\oplus\R$$:

```math
\begin{aligned}

\mathcal S_\mathcal{L}(\tilde\gamma) &= \mathcal S_\mathcal H(\mathcal A\circ \tilde\gamma) \ .
\end{aligned}
```

Note: konvexitetsbegränsningen på $$\mathcal H$$ säkerställer att det finns en unik $$p_{max}(0)$$ på någon sådan stationär kurva wiith $$\dot q = 0$$. Nätet av detta är de stationära kurvorna $$\gamma$$ *inte har ihållande rörelse som ingår i en fiber av *$$\pi^{-1}$$, så utan förlust av allmängiltighet anser vi helt enkelt icke-stationära $$\tilde \gamma$$ och lyft dem med $$\mathcal A$$ som en lämplig kurvklass för "integrera över" senare.

#### Kvadratisk formmagi, del 1

När $$\mathcal H(p,q,t)$$'s $$p$$-beroende (aka Kinetic Energy-komponenten) är en icke-degenererad, symmetrisk kvadratisk form, vi kan representera det som en pseudo-Riemannian metriska $$[g^{ij}]: M\oplus\Reals\rightarrow TM\odot TM$$ med omvänd $$[g_{ij}]: M\oplus\Reals\rightarrow T^{\*}M\odot T^{\*}M$$. Legendre Transform i lokala koordinater relaterar dem så här:

```math
\begin{aligned}
\mathcal H^\mathcal V(p,q,t) &= \frac{1}{2}\ g^{ij}(q,t)\ p_ip_j + \mathcal V(q,t) \implies\\
\mathcal{L}^\mathcal V(q,\dot q, t) &= \frac{1}{2}\ g_{ij}(q,t)\dot{q}^i\dot{q}^j - \mathcal V(q,t)\ .
\end{aligned}
```

Levi-Civita-anslutningen's Christoffel Symboler för $$g$$ Definieras helt enkelt av Koszul-formeln

```math
\begin{aligned}
\Gamma^k_{ij} &= \frac{1}{2} g^{ka}(\partial_i g_{ja} + \partial_j g_{ia} - \partial_a g_{ij})\\
\Gamma_k^{ij} &= \frac{1}{2}g_{ka}(\partial^ig^{ja} + \partial^j g^{ia} - \partial^ag^{ij}).

\end{aligned}
```
med $$\partial_i := \frac{\partial}{\partial q^i}$$ och $$\partial^i := g^{ij}\partial_j$$. Associerat kovariantderivat $$\nabla$$ i lokala koordinater är
```math
\begin{aligned}
\nabla_{a^i\partial_i} b^j\partial_j &=d b^j(a^i\partial_i)\partial_j + \Gamma_{ij}^k a^ib ^j\partial_k\ ,\text{ or}\\
\nabla_{\partial_i}\partial_j &= \Gamma_{ij}^k\partial_k \text{ , and contravariantly}\\
\nabla_{\partial^i}\partial^j &= \Gamma^{ij}_k\partial^k \text{, so} \\
\nabla &= d + \Gamma
\end{aligned}
```

för alla tensorfält. I synnerhet $$\Gamma$$ är symmetrisk i $$(i, j)$$och  $$\nabla [g_{ij}] = \nabla [g^{ij}] = 0$$.

Riemann-Christoffel Curvature Tensor är

```math
\mathcal R^{\rho }{}_{\sigma \mu \nu }=\partial _{\mu }\Gamma ^{\rho }{}_{\nu \sigma }-\partial _{\nu }\Gamma ^{\rho }{}_{\mu \sigma }+\Gamma ^{\rho }{}_{\mu \lambda }\Gamma ^{\lambda }{}_{\nu \sigma }-\Gamma ^{\rho }{}_{\nu \lambda }\Gamma ^{\lambda }{}_{\mu \sigma }
```

##### Förskjutningsmultiplikatorer på $$\mathcal H$$ Oändliga översättningar på $$\mathcal L$$

Vidare, om $$\mathcal H = \mathcal H\_B$$ har en extra fältkomponent för hastighet $$\mathcal B(q,t)\in T_qM$$, dvs en linjär funktion på $$p\in T^{\*}_qM$$, kan vi **slutföra kvadraten** och beräkna om $$\mathcal{L}_B$$ när det gäller $$\mathcal L$$:

```math
\begin{aligned}
\mathcal H_\mathcal B(p,q,t) &= \mathcal H + \mathcal Bp \implies\\
\mathcal L_\mathcal B(\dot q,q,t) &=\max_p p(\dot q - \mathcal B) - \mathcal H\\
&\ \begin{equation}
\tag{A}= \mathcal{L}(q,\dot{q}-\mathcal B, t)\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ 
\end{equation}\\
\mathcal H_\mathcal B &= \frac{1}{2}\ g^{ij}p_ip_j + p\mathcal B + \mathcal V \implies\\
\mathcal L_\mathcal B &\ \begin{equation}\tag{B}= \mathcal L - g_{ij}\mathcal B^i\dot q^j + \frac{1}{2}\ g_{ij}\mathcal B^i\mathcal B^j\ \ \ \ \ \ \end{equation}
\end{aligned}
```

Här ser vi sambandet mellan Lagrange Multiplikatorn $$\mathcal B$$ på $$\mathcal H$$ och dess ekvivalenta uttryck som en infinitesimal drift på $$\mathcal L$$. Vi kommer att kontextualisera $$\mathcal B$$ på en mängd användbara sätt i resten. **Båda uttrycken $$(A)$$ och $$(B)$$ för $$\mathcal{L}_\mathcal B$$ i ekvation <span class="eqno"></span> är kritiska**.

##### Den horisontella höjningen $$\mathcal A$$

Sedan $$\frac{\partial \mathcal H}{\partial p_i}(p,q,t) = g^{ij}p_j \implies \frac{\partial^2\mathcal H}{\partial p_i \partial p_j} = g^{ij}$$, kan vi beräkna den horisontella lyft uttryckligen

```math
\begin{aligned}
{p_{max}}_i &= g_{ij}\dot q^j = \frac{\partial \mathcal L}{\partial \dot q_i}\implies \\
\mathcal A(\dot q, q, t) &= ([g] \dot q, q, t)\ .
\end{aligned}
```

När $$g^{ij}$$ är positiv, så är dess invers, vilket innebär den kinetiska energikomponenten av $$\mathcal S_\mathcal L(\tilde\gamma) = \mathcal S_\mathcal H(\mathcal A\circ\tilde\gamma)$$ är lokalt **minimerad** på stationära kurvor som involverar verkliga riemanniska mätvärden.

Med ekvation (12) $$(A), (B)$$Euler-Lagrange ekvationerna för $$\mathcal L^\mathcal V_\mathcal B$$ bli:

```math
\begin{aligned}

\frac{1}{2}\partial_i g_{jk}(\dot q^j-\mathcal B^j)(\dot q^k -\mathcal B^k)-\partial_i \mathcal V &= \frac{d}{dt}g_{ij}(q,t)(\dot q^j - \mathcal B^j) = {\dot p^\mathcal B_{max}}_i\ ,\\

- \partial^i \mathcal V &= \frac{1}{2} (\partial^i   g_{jk})(\dot q^j-\mathcal B^j) (\dot q^k-\mathcal B^k) - g_{jk}(\partial^i\mathcal B^j)(\dot q^k - \mathcal B^k) + \frac{d}{dt} (\dot q^i - B^i) + g^{ij}\frac{\partial g_{jk}}{\partial t}(\dot q^k -\mathcal B^k)\\

-\nabla\mathcal V(q,t)&\begin{equation}\tag{C}=\nabla_{\dot q-\mathcal B} (\dot q - \mathcal B) -\partial_t \mathcal B +(\partial_t [\log g])(\dot q-\mathcal B) \ .\ \ \ \ \ \ \ \ \ \end{equation}
\end{aligned}
```

Det här är Newton'Lagen om rörelse** $$F/m = a$$ med $$\partial_t := \frac{\partial}{\partial t}$$ Omfattas av potentiell energi $$\mathcal V$$ och hastighetsfält $$\mathcal B$$, i en tidsberoende inställning.

### Symplektisk geometri

En symplektisk mångfald $$N$$ är en abtraktion av styrkegallen $$T^\*(M\oplus \Reals)$$, med en stängd, icke-degenererad 2-form $$\omega \in \bigwedge^2T^\*N$$. $$N$$-isomorfismer i denna kategori bevara $$\omega$$.

Kräver $$d\omega = 0$$ är ett lokalt hållbarhetstillstånd för en potentiell $$\theta$$ nöjd $$d\theta = \omega$$Det kan finnas topologiska begränsningar på $$\omega$$'global heltalbarhet.

Vad vi bryr oss om dynamiken är åtgärden $$\mathcal S(\gamma) = \int_\gamma \theta$$, så vi fokuserar på cotangent buntar i den här artikeln. Här en lämplig $$\theta$$ är trivialt att klassificera i termer av en funktion $$\mathcal H$$ på $$N$$. En Wick-Rotated $$\theta$$ om det universella omslaget till $$N$$ kan ibland vara finvärderad med integduglighetsförhållanden på sin *fas* (dvs. tänk på $$\theta$$ som har värden i ett komplext radband över $$N$$, och fokusera på sin imaginära del), för att ge konsekventa värden för $$e^\mathcal S$$ som går ner till $$N$$.

#### Den naturliga symplektiska volymformen $$\omega^n/n!$$

#### Poisson Bracket och Lie

## Kvantdynamik

Om klassisk dynamik handlar om att hitta kurvor som uppfyller principen om minsta åtgärd, handlar Quantum Dynamics om exponentialen för åtgärden när vi integrerar dess värde över en hel klass av (vanligtvis) icke-stationära kurvor, med en lämplig begränsande uppfattning om en "oändlig dimensionell Lebesgue Mått" $$\mathcal D_{dt}\tilde \gamma$$,

I själva verket är det bara Gaussiska "tillkoppling"

```math
\int_{\set{\tilde \gamma}} e^{-\mathcal S_{\mathcal L_\mathcal B^{\mathcal V}}(\gamma)}\mathcal D_{dt}\tilde \gamma
```

behöver tolkning som *a (komplexvärde) åtgärd på vissa $$\set{\tilde \gamma}$$*, men denna konstruktion, som en serie av alltmer sofistikerade exempel, kommer att vara vårt fokus framöver.  Oavsett vad det visar sig vara, kommer det att vara klart att det faktiska värdet av $$\mathcal S$$ på dessa kurvor kommer att $$\infty$$, för att *avbryta $$\infty$$* från "Normaliserare för tidsdivision" inneboende i $$dt$$ element i $$\mathcal D_{dt}\tilde \gamma$$. Det finns flera val involverade i att konstruera approximationer som påverkar konvergensen av approximationerna, men vi kommer att kringgå dem alla genom att fokusera på den geometriska invarian av trivialt beräkningsbara fall.

### Värdet av åtgärderna

Inte för att sätta en alltför fin punkt på det, men klassisk mekanik definierar åtgärden som ett medel för ett slut.  Den brydde sig aldrig om att komma till någon förståelse för vad dess faktiska värde betyder **.  Vi använder det bara för att kontrollera nödvändiga differentialekvationer så att vi kan tänka oss $$\mathcal S$$ som övergångsfunktion mellan dess slutpunkter via *stationära kurvor*.  Det fasta kravet gav oss möjlighet att tolka  $$\mathcal S$$ som ett väginvariant uttryck, men vi brydde oss aldrig om dess faktiska värde. Det är därför $$\theta \mapsto \theta + df $$ För vissa $$f \in C^\infty(T^\*M)$$ anses vara en mätar-invariant omvandling: de klassiska ekvationerna av rörelse förblir oförändrade $$f$$.

Det gör vi i Quantum Dynamics!

### Naturlig (kovarians) vägintegrerad kvantisering

Genom att fylla i torget och översättningsinvarians av Lebesgue Measure (i en fiber av $$T^\*M$$), kom ihåg att:

```math
\hbar^n\int_{\Reals^n} e^{ p_i\dot q^i\Delta t - \frac{1}{2}\hbar^2 g^{ij}p_ip_j\Delta t}dp_1\dots dp_n = \hbar^n\int_{\Reals^n} e^{-\frac{1}{2}\hbar^2 g^{ij}(p_i - g_{ik}\dot q^k/\hbar)(p_j - g_{jk}\dot q^k/\hbar)\Delta t} dp_1\dots dp_n \cdot e^{\frac{1}{2\hbar^2}g_{ij}\dot q^i\dot q^j\Delta t} =
\frac{e^{\frac{1}{2\hbar^2}g_{ij}\dot q^i\dot q^j\Delta t}}{\sqrt{(2\pi\Delta t)^n \det g^{ij}}}
```
Så de **Feynman Path Integral** uttrycken är moraliskt likvärdiga (ännu formellt oändliga) i det kvadratiska Kinetic Energy-fallet:

```math
\begin{aligned}
\int_{\set{\gamma}} e^{\mathcal S_{\mathcal H^\mathcal V_\mathcal B} (\gamma)} \mathcal D_{dt}\gamma &\approx \int_{\Reals^{2n}} e^{(p\dot q - \mathcal H^\mathcal V_\mathcal B(p,q,t))\Delta t}\omega_0^n/n!\\
&= \frac{1}{\sqrt{(2\pi\Delta t)^n}}\int_{\Reals^n}e^{\mathcal L^{\mathcal V}_\mathcal B(\dot q, q, t)\Delta t}\sqrt{\det g_{ij}}\  dq^1...dq^n\\
&\approx \int_{\set{\tilde \gamma}} e^{\mathcal S_{\mathcal L^{\mathcal V}_\mathcal B}(\tilde \gamma)} \mathcal D_{dt}\tilde \gamma \ .
 \end{aligned}
```

Därför med en **Wick rotation och en vektor omskalning av Planck konstant** $$\hbar = h/2\pi$$, skicka $$dt\mapsto \hbar/i\ dt, \ p\mapsto \hbar p, \ \dot q\mapsto \dot q/\hbar,\  \mathcal B\mapsto \mathcal B/\hbar$$:

```math
\begin{aligned}
\int_{\set{\gamma}}e^{\hbar/i\ \mathcal S_{\mathcal H_{\mathcal B/\hbar}^{\mathcal V}(\hbar p, q, t)}(\gamma)}\mathcal D_{\hbar/i\ dt}\gamma &\approx \int_{\set{\tilde\gamma}} e^{\hbar/i \ \mathcal S_{\mathcal L_{\mathcal B/\hbar}^{\mathcal V}(\dot q/\hbar,q, t)}(\tilde \gamma)}\mathcal D_{\hbar/i\ dt}\tilde\gamma\\
&= \int_{\set{\tilde \gamma}}e^{-\frac{i}{\hbar}\mathcal S_{\mathcal L^{\hbar^2 \mathcal V}_{\mathcal B}(\dot q, q, t)}(\tilde \gamma)}\mathcal D_{\hbar/i\ dt}\tilde\gamma\ .

\end{aligned}
```

Så när vi vill approximera den högra sidan av ekvationen <span class="eqno"></span> använda metoden för stationär fas (dvs. den halvklassiska gränsen) $$\hbar\downarrow 0$$), måste vi komma ihåg att lösa Euler-Lagrange ekvationer (14) $$(C)$$ med $$\mathcal V \mapsto \hbar^2 \mathcal V\approx 0$$.

### Schrödingers kvantifiering

```math
\begin{aligned}
\mathcal H(p,q) &\ = \mathcal T(p,q) + \mathcal V(q)\ \text {, where } \mathcal T = \frac{1}{2}g^{ij}(q)p_ip_j \implies \\

e^{-it/\hbar \hat{\mathcal H}}\ket{\psi} &:= e^{-it/\hbar(-\frac{\hbar^2}{2} \Delta_M + \mathcal V)} \ket{\psi} \implies \\

i\hbar \frac{d}{dt}\ket{\psi} &\ = -\frac{\hbar ^2}{2}\Delta_M \ket{\psi} + \mathcal V\ket{\psi}

\end{aligned}
```
($$\Delta_M$$ är Laplace-Beltrami Operatör för $$g$$) som linjära differentialoperatorer. Lösningen är **analytisk** i $$t$$ på det övre halvplanet, och $$dt\mapsto i/\hbar\ dt,\ p\mapsto p/\hbar $$ är dess Wick-unrotated diffusion ekvation:

```math
\frac{d}{dt}e^{-t\hat{\mathcal H}}\ket{\psi} = (\frac{1}{2}\Delta_M - \mathcal V) e^{-t\hat{\mathcal H}}\ket{\psi} \ .

```

Detta är en form som är mottaglig för provvägsbaserad stokastisk analys, och ger oss ett meningsfullt sätt att anpassa Feynman Path-Integrals med den analytiska fortsättningen av lösningar till elliptiska diffusions ekvationer till hela sitt högra halvplan.  Vi kommer att ha en väldefinierad "måtteoretisk" analytisk karta från höger halvplan till en uppsättning avgränsade linjära operatorer på $$\mathscr H = L^2(M,g)$$och Schrödingerekvationen's Unitär Evolution-operator är dess gränsvärde på den imaginära linjen $$it\hbar\ ,t\in\Reals$$. Även om det hjälper att förstå von-Neumann's Spectral Theorem for the harmonic decomposition of closed, unbounded self-adjoint operator (liksom $$\Delta_M$$) på $$\mathscr H$$, det'Krävs inte för resten av denna artikel.

Med andra ord är det tillräckligt att studera ekvationens dynamik (17), när vi har klargjort subtiliteterna som är involverade i en explicit definition av dess suggestiva vägintegrerade uttryck.

I stället för att återuppfinna Itô/Stratonovich/Malliavin SDE semimartingale-kalkylen av hel duk, kommer vi att gå vidare med en serie enkla (plattmetriska) exempel som kommer att föra oss in i den allmänna teorin.

I slutet av dagen kommer vi att vilja att Feynman Path-Integral Quantization matchar Schrödinger Quantization, eller åtminstone för att förstå **avvikelsen**. I synnerhet behöver vi den semiklassiska metoden för att generera Schrödinger PDE till $$o(t)$$ som $$t\downarrow 0$$.

Som det visar sig finns det fortfarande kontroverser över $$\mathcal V$$ term när mätvärdet inte är platt. Vi utforskar denna fråga i sin helhet nedan, eftersom det gäller kända (Selberg liknande) summeringsformler för icke-plattmått.

### Formel för Feynman-Kac

Med $$V \in C^\infty(M)$$Författare: Baker-Campbell-Hausdorff Formula
```math
e^{-it/\hbar -\Delta^\hbar_M/2} e^{-it/\hbar V} = e^{-it/\hbar(-\Delta^\hbar_M /2 + V - it/4\hbar [\Delta^\hbar_M,V] + O(t^2))}
```

Feynman-Kac-formeln följer från den vägintegrerade formuleringen för Brownian Motion i euklidiskt utrymme. Resultatet är att vi kan fokusera på $$\mathcal V = 0$$ fall, så vi går framåt.

#### Parallell transport isometri $$\hat\Gamma$$

Ta någon vektor i $$v \in T_qM$$. Parallell transport $$\hat\Gamma_t(\gamma)v \in T_{\gamma(t)}M$$ är den vektor du får genom att lösa den linjära första ordningens ODE:

```math
\begin{aligned}
v(0) &= v \\
\nabla_{\dot \gamma(t)}\dot v &= 0
\end{aligned}
```

Särskilt $$\nabla_{\dot \gamma}\hat\Gamma_t(\gamma) = 0$$och kröknings tensorn $$\mathcal R(X,Y) = [\nabla_X,\nabla_Y] - \nabla_{[X,Y]}$$ mäter den första ordningens beroende av $$\hat \Gamma$$ om valet av kurva $$\gamma$$ Kopplar samman slutpunkterna. $$\mathcal R = 0 \iff \hat\Gamma_t$$ är inte beroende av $$\gamma$$.

Med andra ord, om vi försökte sönderdela parallell transport som oändlig rörelse längs $$\mathcal B^\perp$$ följt av oändlig rörelse längs $$\mathcal B$$ekvationerna skulle bli:
```math
\begin{aligned}
\hat\Gamma(\gamma) &= \hat\Gamma(\gamma|_\mathcal B)\hat\Gamma(\gamma|_{\mathcal B^\perp}) - \frac{1}{2}\mathcal R(\dot{\gamma}|_\mathcal B, \dot{\gamma}|_{\mathcal B^\perp})dt + O(dt^2) \ \\
\nabla_{\dot \gamma}\hat\Gamma(\gamma) &= \nabla_{\dot \gamma|_\mathcal B}\hat\Gamma(\gamma|_{\mathcal B^\perp}) + \nabla_{\dot \gamma|{\mathcal B^\perp}}\hat\Gamma(\gamma|_{\mathcal B})  - \frac{1}{2}\mathcal R(\dot\gamma|_\mathcal B,\dot{\gamma}|_{\mathcal B^\perp}) = 0
\end{aligned}
```

#### Halvglasmekanik

##### Semiklassisk asymptotik är en exakt lösning på platta grenrör

Den högra sidan av ekvationen (16) är den exakta formuleringen av värmekärnan för konstant koefficient (in $$q$$ mätetal $$g_{ij}$$. Varje platt grenrör'det universella omslaget är isometriskt till det euklidiska rummet, där $$g_{ij} = \delta_{i-j}$$.

Detta **är** värmekärnan för standard $$n$$-dimensionell Brownsk rörelse.

Låt's klargöra detta, erinra om *övergångsfunktionen* i detta fall: $$\mathcal S_\mathcal L(q_0,t_0, q_f, t_f) = \rho^2(q_0, q_f)/2(t_f - t_i)$$, där $$\rho$$ är det riemanniska avståndet mellan $$q_0$$ och $$q_f$$.
låt $$||q||^2 = q\cdot q$$ vara kvadraten av den euklidiska normen för $$q$$:

```math
\begin{aligned}
RHS^{16}_t(q_0,q_f) &:= \frac{e^{-\mathcal S_\mathcal L(q_0, 0, q_f, t)}}{\sqrt{(2 \pi t)^n}} \sqrt{g(q_f)}\\
\mathcal R=0 \implies \\
&\ = \frac{e^{\frac{-||q_f - q_i||^2}{2t}}}{\sqrt{(2\pi t)^n}} \\
                   &\ = \int_{\Reals ^n}RHS^{16}_{s}(q_i, q)\ RHS^{16}_{t-s}(q, q_f)\ dq^1...dq^n\ \forall s\in (0, t)
\end{aligned}
```

Varför är denna sista ekvation sann?  Låt's titta på bilden från bana utrymme: vi har en rak linje geodesik som förbinder $$q_0$$ till $$q_f$$ i tid $$t$$, och en bruten geodetisk metod som kopplar dem till den mellanliggande brytpunkten som inträffar vid $$s$$. Effektivt integrerar vi ut den en gång brutna geodetiken genom att använda Cameron-Martin-formeln för att representera den raka geodetiken som en $$g$$-invariant vektorfält $$\mathcal B$$. Sedan integrerar vi brytpunktsdeltas från den geodetiska ($$\dot q-\mathcal B$$) med en centrerad Gaussian för $$\Reals^n$$.

Explicit, givet konstant vektorfält $$\mathcal B_t = (q_f - q_0) / t$$En gång bruten euklidisk geodesik är

```math
q(\tau) = \mathcal B_t\tau + q_0 + q\begin{cases}
\tau/s & 0\leq\tau\leq s\\
(t - \tau)/(t-s)& s\leq\tau\leq t
\end{cases}
````
for fixed $$q\in\Reals^n$$ representing the "break point" at $$s$$.

By Equation (12) $$(A)$$ and $$(B)$$:

```math
\begin{aligned}
-\mathcal L(\dot q, q, \tau) &= \begin{equation}\tag{D}-\mathcal L(\dot q(\tau) - \mathcal B_t, q(\tau), \tau) - \mathcal B_t\cdot (\dot q(\tau)-\mathcal B_t) - \frac{1}{2}\mathcal B_t \cdot B_t \ \ \ \ \ \ \ \ \ \end{equation}\\
\implies \\

e^{\mathcal -S_\mathcal L(q_0, q, \tau)} &= e^{-\tau||\mathcal B_t||^2/2}e^{-(\mathcal B_t -q_0)\cdot (q(\tau)-\mathcal B_t\tau - q_0) -\mathcal S_{\mathcal L_{\mathcal B_t}(\dot q,q,\tau)}} \\

&= e ^{-\tau||q_f-q_0||^2/2t^2  - \mathcal S_{\mathcal L(\dot q-\mathcal B, q, \tau)}}e^{-(q_f - q_0)/t\ \cdot q
\begin{cases}
\tau/s & 0\leq\tau\leq s\\
(t-\tau)/(t-s) & s\leq\tau\leq t
\end{cases}
}\\
\implies\\

\frac{1}{\sqrt{((2\pi)^2 s(t-s))^n}}\int_{\Reals^n} e^{-\mathcal S_{\mathcal L}(q_0,q,s)}e^{\mathcal S_{\mathcal L}(q,q_f,t-s)}dq^1...dq^n &= \frac{e^{-(s+t-s)||q_f - q_0||^2/2t^2}}{\sqrt{((2\pi)^2 s(t-s))^n}}
\int_{\Reals^n}e^{-t||q||^2/2s(t-s)} dq^1...dq^n \\
&= \frac{e^{-\rho^2(q_f, q_0)/2t}}{\sqrt{(2\pi t)^n}}\\
&= RHS^{16}_t(q_0,q_f) \ .
\end{aligned}
```

Betydligt har vi byggt $$\mathcal B_t$$ så att $$\dot q - \mathcal B_t$$ representerade en gång bruten geodetisk vid $$s$$ Det började och slutade på $$q_0$$och vi såg att dessa kurvor i huvudsak $$\mathcal N(0,s\wedge t-s)$$ distribuerad. I resten av denna artikel kommer vi att bryta ner $$\Reals^n=<\mathcal B_t>\oplus \mathcal B_t^\perp$$ och integrera ut $$<\mathcal B_t>$$.

#### DeWitt Scalar Curvature Path Integral Defect på Riemann-ytor

Tänk om vi försökte använda "successiva revolutioner" om det halvklassiska uttrycket i ekvation (16) för att konstruera Brownian Motion på en negativt böjd grenrör $$M$$?

Vi'D får något, men det'd vara *nästan* Brownsk rörelse på böjda utrymmen &mdash; Vi måste titta på Feynman-Kac för defekten i sin oändliga generator. Det visar sig att det kommer att finnas ett effektivt potentiellt funktionsfel $$-\frac{1}{6}\bar{\mathcal R}$$, där $$\bar{\mathcal R}$$ är den skalära krökningen vid varje punkt. Detta upptäcktes först av Bryce DeWitt i 1950's, och gjorde berömd i 1972 McKean-Singer papper på kort tid asymptotics av spåren av Heat Kernel, där denna term representerar bidraget till Hessian av *den metriska formen* $$g_{ij}$$ om [normala koordinater](https://en.wikipedia.org/wiki/Normal_coordinates). Men då $$\dim = 2$$ fall, när du lägger till hela den korrigerande potentialen $$\mathcal V = -\frac{1}{6}(\bar{\mathcal R} - \frac{1}{4}\bar{\mathcal R}) = \frac{1}{16}\bar{\mathcal R}$$ till Hamiltonian, som är Dewitt's $$\frac{1}{6}\bar{\mathcal R}$$ volymform term *minus* närvaro av ett dödande fält $$\mathcal B$$'s $$\frac{1}{24}\mathcal{Ric}(\mathcal B/||\mathcal B||, \mathcal B/||\mathcal B||)$$ Denna faktor elimineras från semiklassisk asymptotik av Selberg-liknande spårformler.

Mer exakt, genom att approximera $$1/2\ \nabla\vert_0\sqrt{g} = - 1/6\ \mathcal{Ric}_{ij}q^i\partial^j + o(||q||) \implies 1/2\ \nabla\cdot\nabla\vert_0 \sqrt{g} = -1/6\ \bar{\mathcal R}(0)$$Vi ser att de första derivaten försvinner vid ursprunget, så:

```math
\sqrt{(2\pi t)^n}(\frac{1}{2}\Delta_M-\mathcal V)\vert_0 e^{-\mathcal L(\dot q, q, t)}\sqrt{g(q)} = (\frac{1}{2}\Delta_{\Reals^n}\vert_0 e^{-1/2t\ g_{ij}q^iq^j}) - \mathcal V(0) - \frac{1}{6}\ \bar{\mathcal R}(0)
```

som *är* den ursprungliga Dewitt-termen som han härledde den.  När vi är partiska på kvantisering i närvaro av ett dödande fält $$\mathcal B = \frac{\partial}{\partial x^1}$$ Vi tar en något modifierad potentiell term:

```math
\sqrt{(2\pi t)^{n}}(\frac{1}{2}\Delta_M-\mathcal V)\vert_{x^1,\vec 0} e^{-\mathcal L_\mathcal B(\dot q, q, t)}\frac{1}{det |I-\mathcal J_\mathcal B|} = (\frac{1}{2}\Delta_{\Reals^n}\vert_{x^1,\vec 0}e^{-x^1x^1/2t}) - \mathcal V(x^1, \vec 0) + \frac{1}{8}\mathcal{Ric}_{11}(x^1, \vec 0).
```

#### Den geometriska Cameron-Martin Formeln för $$g$$-invariant (dödande) vektorfält $$\mathcal B$$ (Kvadratisk form magi, del 2).

Anta $$\mathcal B$$ är en $$g$$-invariant (aka) [Dödsfall](https://en.wikipedia.org/wiki/Killing_vector_field)) vektorfält på $$M$$ Resten av denna artikel.

##### Utvecklingskartan $$\tilde \gamma = \mathscr D_q[\tilde c]$$ för $$\tilde c\in C^\infty([0,t],T_qM)$$.

Lös för $$\tilde \gamma$$:
```math
\begin{aligned}
\tilde \gamma(0) &= q \\
\dot {\tilde \gamma} &= \hat\Gamma(\tilde \gamma)\dot{\tilde c}\\
\end{aligned}
```

##### $$\tilde c(\tau)=\int_0^\tau\hat\Gamma_s^{-1}(\tilde\gamma)\dot{\tilde\gamma} ds$$ Inversen av utvecklingskartan

Noether'Satsen garanterar $$d({g^{-1}\mathcal B}) = 0$$, så $$g^{-1}\mathcal B$$ är lokalt integrerbar till $$\hat{\mathcal B}$$och dess lokala nivåuppsättningar är ortogonala för $$\mathcal B = \nabla \hat{\mathcal B}$$. Och eftersom $$\hat \Gamma$$ bevarar måttet, det bevarar $$\mathcal B$$ och $$\mathcal B^\perp$$:

```math
\begin{aligned}
\\
\dot{c}\cdot\mathcal B &= 0 \implies\\
\dot{\gamma}\cdot \mathcal B &= 0 \implies\\
\frac{d\hat{\mathcal B}}{dt} &= 0\ ,
\end{aligned}
```

därför $$\gamma$$ finns i en nivåuppsättning av $$\hat{\mathcal B}$$ alltid $$c$$ är helt innesluten i $$\mathcal B^\perp \subset T_qM$$.
Begränsningar i krökningen av parallelltransportens kommutativitet säkerställer att $$\gamma(t) \ne q$$ i allmänhet. Dessutom,

```math
\begin{aligned}
||\mathcal B_t|| &= \frac{\rho(q_0,q_f)}{t} \implies \\
\tilde{c}(\tau) - c(\tau) &= \frac{t^2}{\rho^2(q_0,q_f)}\mathcal B_t\int_0^\tau \dot{\tilde c} \cdot \mathcal B_t\ ds\\
&= \mathcal B\int_o^\tau\dot{\tilde c}\cdot \mathcal B \ ds\\
&= \mathcal B\cdot \tilde c(\tau)\ \mathcal B\\
&= d\hat{\mathcal B}(\tilde c)\ \mathcal B \ .
\end{aligned}
```

##### Brownsk rörelse på $$M$$ Euclidean Wiener mäter $$\mathscr D^{-1}$$

##### Cameron Martin Formula för värmekärnan $$k^{\hat{\mathcal H}}_t(q_0,q_f)$$ på ett negativt krökt grenrör $$M$$, där $$\hat{\mathcal H} = -\Delta/2 +\mathcal V$$

Låt $$\Omega^\mathcal B_t(q)$$ vara utrymmet för kontinuerliga kurvor på $$M$$ kommer från $$q$$ och slutar vid $$\exp{t\mathcal B}\ q$$och $$\mu_t(\omega)$$ Var Global Wiener åtgärd på $$\omega\in \Omega^\mathcal B_t := \set{\Omega^\mathcal B_t(q): q\in M}$$, med $$E_t^\mathcal B (f|A):=\int_{\Omega^\mathcal B_t} f(\omega) d(\mu_t|A)(\omega)$$ och $$P^\mathcal B_{\mu_t}(A) := \mu_t(A)/\mu_t(\Omega_t^{\mathcal B})\ \forall A\subset\Omega^\mathcal B_t $$ . Sedan ekvation (26) $$(D) \implies$$

```math
\begin{equation}
\tag{E}
k^{\hat{\mathcal H}}_t(q_0,\exp{t\mathcal B_t}\ q_0)\sqrt g(q_0)\ dq = \frac{e^{-\rho^2/2t}}{\sqrt{2 \pi t\det{|I-\mathcal J^{\mathcal B}(q_0)|}}} E^\mathcal B_t({e^{-\int_0^t V(\omega(s))ds\ +\ \int_0^t \bar {\mathcal R}(\omega(s))ds/12\ -\ \int_0^t \mathcal {Ric}(\frac{\mathcal B}{||\mathcal B||},\frac{\mathcal B}{||\mathcal B||})(\omega(s))ds/24}\chi_{\Omega^B_t(q_0)}(\omega)}|d\mathcal B^\perp)d\hat{\mathcal B}(q_0) \ \ \ \ \ \ \
\end{equation}
```

där $$\rho=||t\mathcal B_t||=dist(q_0,q_f)$$, $$\mathcal J^{\mathcal B}(q_0)$$ är den monodroma matrisen som är associerad med folieringen på $$M$$ inducerad av $$\hat{\mathcal B}$$, längs kurvan $$\tilde \gamma(\lambda) = \exp{\lambda\mathcal B_t}\ (q_0)$$, ansluta $$q_0$$ till $$ q_f$$ som $$\lambda$$ går från $$0$$ till $$t$$. $$\mathcal J^{\mathcal B}$$ är inte beroende av $$t$$och krökningsbegränsningen säkerställer $$I-\mathcal J^\mathcal B$$ är alltid icke-degenererad för $$q_0 \neq q_f$$. Ersätter $$\mathcal B$$ med $$-\mathcal B$$ vänder rollerna för $$q_0$$ och $$q_f$$Så tydligt är uttrycket symmetriskt mellan dem som förväntat.

Sedan $$\mathcal R$$ är konstant längs $$\tilde \gamma$$och $$\gamma$$ *är* en geodetisk (upp till lång omomalisering), $$\mathcal J^\mathcal B(q_0)$$ är trivialt beräkningsbar när det gäller **Jacobi Fields** $$\mathcal J(\lambda)$$ längs $$\tilde \gamma$$ som endast är lösningen på konstanta koefficientiska andra ordningens linjära ODE, utvärderade efter att ha utvecklats genom tiden $$\lambda=t$$.

Bevis för denna ekvation <span class="eqno"></span> kommer att vara grist för en preprint artikel, inte denna undersökning, men det är en enkel tillämpning av Feynman-Kac formel *tillämpas på $$\mathcal V = \frac{1}{12}(\bar{\mathcal R} - \frac{1}{2} \mathcal {Ric}(\mathcal B / ||\mathcal B||, \mathcal B/||\mathcal B||)$$, som uttryckligen kan beräknas på båda sidor av ekvationen, eftersom hela beräkningen reduceras till det konstanta krökningsfallet vid den punkten.

En fin korollarium förekommer i det konstanta $$\mathcal {Ric}(\frac{\mathcal B}{||\mathcal B||},\frac{\mathcal B}{||\mathcal B||}) = \bar{\mathcal R} / \dim M$$ negativ Gaussisk krökning $$-\kappa$$ fall, där $$\mathcal B$$ ned till en $$S^1$$ - Läge i Riemann Surface $$M$$:

```math
\begin{aligned}

\det |I - \mathcal J^\mathcal B| = (2 \kappa\sinh(\sqrt{\kappa}\rho/2))^2 \implies \\

\mu_t(\Omega_t^\mathcal B) = \int_{M/S^1\oplus S^1} k^{-\Delta/2}_t(q,\exp{t\mathcal B}\ q) \sqrt g(q)\ dq &= \frac{e^{-\rho^2/2t}}{\sqrt{2\pi t}} \int_{M/S^1\oplus S^1} \frac{1}{2\kappa(q) \sinh \sqrt{\kappa(q)}\rho/2}E^\mathcal B_t(e^{\int_0^t \bar{\mathcal R}(\omega(s))\ ds/16}{\chi_{\Omega^B_t(q)}(\omega)}|d\mathcal B^\perp)d\hat{\mathcal B}(q)\\

&=\frac{e^{-\rho^2/2t\ -\ t\kappa/8}}{\sqrt{2\pi t}\ 2\kappa\sinh \sqrt {\kappa}\rho/2}\ \int_{\mathcal B^\perp\oplus[0,\rho_0]}P^\mathcal B_{\mu_t}(\Omega_t^\mathcal B(d\hat{\mathcal B})|d\mathcal B^\perp), \ \text{ Bayes}\implies\\

&=\frac{e^{-\rho^2/2t\ -\ t\kappa/8}}{\sqrt{2\pi t}\ 2\kappa\sinh \sqrt {\kappa}\rho/2}\ \int_0^{\rho_0} P_{\mu_t}^\mathcal B(\mathcal B^\perp d\hat{\mathcal B}|\Omega_t^\mathcal B(d\hat{\mathcal B}))\frac{P^\mathcal B_{\mu_t}(\Omega_t^\mathcal B(d\hat{\mathcal B}))}{P^\mathcal B_{\mu_t}(\mathcal B^\perp d\hat{\mathcal B})}d\hat{\mathcal B}\\

&=\frac{e^{-\rho^2/2t\ -t\kappa/8}}{\sqrt{2\pi t}\ 2\kappa\sinh \sqrt {\kappa}\rho/2}\ \rho_0\\

\end{aligned}
```

där $$\rho = \min_{q\in M}dist(q, \exp t\mathcal B \ q)$$ är avståndet för den kortaste omloppsbana som färdas under $$S^1$$ åtgärder, och $$\rho_0$$ är det $$\rho$$ dividerat med mångfalden av dess associerade omloppsbana.  I termer av hyperbolisk geometri, $$\mathcal B^\perp$$ är **horocykler** och $$g$$-invariant $$S^1$$ åtgärd under $$\mathcal B$$ Det sägs vara det **horocykliska flödet**.

Tänk på ekvation (32) $$(E)$$ där $$B$$ representerar en rotation $$g$$-invariant symmetri runt en fast punkt $$q_0$$. Sedan med $$\Omega^0_t$$ Uppsättningen kontinuerliga sammandragbara slingor:

```math
\mu_t(\Omega_t^0) = \frac{vol(M)}{2\pi t}\int_0^\infty \frac{e^{-\rho^2/2t\ -t\kappa/8}}{\sqrt{2\pi t}\ \kappa\sinh \sqrt {\kappa}\rho/2}\ \rho d\rho
```

Denna ekvation är analytisk i $$\kappa$$Vi kan se att analytisk fortsättning från $$\kappa \rightarrow -\kappa$$ omvandlar detta uttryck från $$\sinh $$ till $$ \sin $$ i vilket fall vi har rätt ekvation för en *spök 2-sfär *med konstant positiv Gaussisk krökning $$|\kappa|$$.

Med andra ord har vi återskapat den 2-dimensionella Selberg Trace Formula via Sannolikhet och Geometri, ** i stället för den vanliga harmoniska analysen på symmetriska ytor**.

##### Exempel på icke-privat krökning

För smidig realvärdesdiffeomorfism $$h:\Reals\rightarrow\Reals$$ med $$h(0)=0$$, låt $$ds^2 = (1+h^2(y)) dx^2 + 2h(y) dx\odot dy + dy^2$$. Detta mätvärde har en negativ gaussisk krökning $$-(\kappa(y)=\frac{d^2}{dy^2}h^2(y)/2)$$som är konstant när $$h(y)$$ är affin; och $$\det(ds^2)= 1$$. Sedan med $$\hat{\mathcal B}(x,y) = x$$Vi ser att

```math

\mu_t(\Omega_t^\mathcal B) = \frac{e^{-\rho^2/2t}}{2\pi t}\int_{-\infty}^\infty\frac{\rho_0}{2 \sinh \sqrt{\kappa(y)}\rho/2} \int_{\Omega_t^\mathcal B(0,y)}e^{-\int_0^t\kappa(y(s))ds/8}d(\mu_t|\mathcal B^\perp)/dy \ dy

```
Om vi tar $$h(y) := y\sqrt{2y^2/3 + \kappa(0)} \implies \kappa(y) = 4 y^2 + \kappa(0) \gt 0$$, sedan Ekvation (32)  $$(E)$$ förutspår att

```math

\mu_t(\Omega_t^\mathcal B) = \frac{e^{-\rho^2/2t -t\kappa(0)/8}}{\sqrt{2\pi t \cosh t}}\int_0^\infty\frac{\rho_0e^{-y^2/2t}}{\sqrt{2\pi t}\sinh \sqrt{4y^2+\kappa(0)}\rho/2 }\ dy

```

som blåser upp vid $$0$$Som förväntat, om vi också $$\kappa(0) = 0$$. och som $$t\rightarrow 0$$integralen har också rätt asymptotiskt beteende (klumpar runt den konstanta krökningen) $$-\kappa(0)$$ situationen som om motsvarande komponent i Selberg Trace Formula  fungerar som dess halvglasiska gräns som $$t\rightarrow 0$$).

### Observables, Evolution Equation och Lie Algebras

### Radgruppåtgärd i Tjern-Simons

### Anteckningar om den allmänna relativitetsteorin

- den yttre tidsaxeln är konstgjord, eftersom `tid` är inbäddad i geometrin hos den 4-dimensionella grenröret själv.
Det innebär att utvecklingsaktörer'Det är bara den stationära Schrodinger-ekvationen som spelar roll.
- vägen integrerad formulering blåser upp på grund av `-1` Signatur av Lorenzian metriska i den inneboende `tid` riktning. $$\det{g}$$ är negativ, och Fourier Transform på varje cotangent-bundle'fiber är också oändlig i den riktningen, om vi inte använder analytisk fortsättning (aka Wick Rotation på den inneboende `tid`).

<!-- $Date: 2026-03-14 15:24:59 -0700 (Sat, 14 Mar 2026) $ $Author: joe $ $Revision: 29029 $ -->
