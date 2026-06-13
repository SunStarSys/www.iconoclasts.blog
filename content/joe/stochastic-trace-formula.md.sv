---
categories: Matematik
dependencies: '*.md.sv'
keywords: weiner-mått,riemann-ytor, sannolikhet, geometri
status: arkiverad
title: Stokastisk spårningsformel för stängda, negativt böjda grenrör
---

<div class="right">

![Hyperbolisk bikake](stochastic-trace-formula.page/hyperbolic-honeycomb.png)

</div>

[TOC]#sidebar

```asy
// tubular trefoil knot -*- asy -*-

import tube;
import graph3;
import palette;

size(0, 8cm);
currentlight=White;
real redPortion = 143 / 256;
real greenPortion = 153 / 256;
real bluePortion = 251 / 156;
pen periwinklePen =  redPortion *red + greenPortion* green + bluePortion *blue;
// currentlight.background = periwinklePen;
currentprojection=perspective(1,1,1,up=-Y);

int e=1;
real x(real t) {return cos(t)+2*cos(2t);}
real y(real t) {return sin(t)-2*sin(2t);}
real z(real t) {return 2*e*sin(3t);}

path3 p=scale3(2)*graph(x,y,z,0,2pi,50,operator ..)&cycle;

pen[] pens=Gradient(6,red,blue,purple);
pens.push(yellow);
for (int i=pens.length-2; i >= 0 ; --i)
  pens.push(pens[i]);

path sec=scale(0.25)*texpath("$\pi$")[0];

coloredpath colorsec=coloredpath(sec, pens,colortype=coloredNodes);

draw(tube(p,colorsec),render(merge=true));

```

{# lede #}Min *1997 Ph.D. avhandling* som blogginlägg.{# lede #}

## Det finns bara ett n-dimensionellt Wiener-mått $$\mu$$

## Piecewise linjära approximationer till Brownian Motion

## Utvecklingsöversikt DM

## Cameron-Martin-formeln

## Värmekärnor som Radon-Nicodym Derivat av Weiner Measure

## Notation

$$M$$ är en negativt böjd $$\dim=n$$ stängd Riemannian grenrör med metrisk $$g$$, mätetalsanslutning $$\nabla$$och (icke-negativ) Laplace-Beltrami-operatör $$\Delta_M$$. Låt $$k_{-t\Delta/2}(x,y)$$ representerar värmekärnan på $$M$$.

därför $$k_{-t\Delta/2}(x,x) = dDM_*\mu/\sqrt{g}dx$$ är Radon-Nicodym-derivatet av n-dimensionell Wiener Measure $$\mu$$, begränsad till utdragning av kontinuerligt looputrymme $$\Omega_t(M)\vert_x$$, via inversen av Weiner-måttbevarande utvecklingskarta $$DM$$. *Obs!* $$DM^{-1}\Omega_t\vert_x$$ Det är inte ett loop space i allmänhet.

$$\Omega_t^0$$ är utrymmet för kontinuerliga kontraktibla slingor på $$M$$.

$$\Omega_t[\gamma]$$ är utrymmet för kontinuerliga loopar på $$M$$ Homotopisk mot den slutna geodetiska $$\gamma$$. Låt $$\gamma_0$$ vara dess primitiva kretslopp.

$$DM^{-1}\Omega_t^0[\gamma]$$ är förebilden för kontinuerliga sammandragbara slingor på $$M$$ Skrivet som förskjutningar homotopic till $$\gamma(s) = DM(\frac{s\ell(\gamma)}{t}\vec{e}^1), 0\leq s \leq t$$. Tänk horocykliska koordinater &mdash; varje fiber som den geometriska gränsen för periodiska geodetiska sfärer $$S_{\gamma_0(s)}^{n-1}(k\ell(\gamma_0)), 0\leq s \leq t, k\rightarrow\infty$$, vektoriserad i det normala paketet över $$\gamma_0$$. Våra krökningsbegränsningar innebär Horocykliska koordinater för varje $$\gamma_0$$ existerar som en slät, $$DM$$-kompatibel koordinatkarta för $$\Omega_t^0[\gamma]$$.
I horocykliska koordinater, $$\det{g(\vec{x})} = 1$$:

```math
\begin{aligned}
ds^2 &= dx\odot dx + h(x,y) dx\odot dy +  (1+h^2(x,y)) dy\odot dy \\
g(x,0) &= 0,\\
\sigma_1 &= dx + h(x,y)dy \\
\sigma_2 &= h(x,y)dx + (1+h^2(x,y))dy \\
\sigma_1 \wedge \sigma_2 &= dx \wedge dy\\
d\sigma_1 &= \frac{\partial h}{\partial x}dx\wedge dy \\
d\sigma_2 &= (-\frac{\partial h}{\partial y}+2h\frac{\partial h}{\partial x}) dx\wedge dy \\

\end{aligned}
```
Så anslutningen 1-form $$\alpha := Adx + Bdy$$ uppfyller
```math
\begin{aligned}
d\sigma_1 &= \alpha \wedge \sigma_1 \\
d\sigma_2 &= \sigma_2 \wedge \alpha \\
\implies \\
A &= \frac{\partial h}{\partial y} - 3h\frac{\partial h}{\partial x} \\
B &= h\frac{\partial h}{\partial y} - (1+3h^2)\frac{\partial h}{\partial x} \\
 \\
K &= \frac{\partial B}{\partial x} - \frac{\partial A}{\partial y} \\
 &= \frac{\partial h}{\partial x}\frac{\partial h}{\partial y} - 6h\frac{\partial h}{\partial x}^2 - (1+3h^2)\frac{\partial^2 h}{\partial x \partial x}
 - \frac{\partial^2 h}{\partial y \partial y} + 2h \frac{\partial^2 h}{\partial x \partial y} ,\\
h &= h(y) \implies \\

\alpha &= \frac{\partial }{\partial y} (hdx +\frac{h^2}{2} dy)\\

K(y) &= -\frac{\partial^2 h}{\partial y \partial y}\ \\
 \text{has Galilean Symmetry:} \\
 h \mapsto h(y,\beta) &= h(y) + \beta y \ .\\
\end{aligned}
```

**VIKTIGT** Därför när $$h=h(y)$$Den parallella transportekvationen minskar till $$\dot{\vec{c}}(t) = -\alpha(\dot{\gamma}(t))\vec{c}(t) = -\partial_y(h\ dx/dt + h^2/2\ dy/dt)\vec{c}(t)$$. Detta har naturligtvis stängt lösningen

```math
\vec{c}(t) = exp(-((h+\beta y)\ dx/dt + (h^2/2 + (\beta y)^2/2 + \beta y h) \ dy/dt)|_{x_0,y_0}^{x_t,y_t})\vec{c}(0)
```

som är en funktion av transportkurvan $$\gamma$$'s slutpunkter **ensam**. Detta innebär att utvecklingskartan bevarar slingor.

$$Z_{-\Delta/2}(t) := \int_M k_{-t\Delta/2}(x,x) \sqrt{g}dx = \sum_{j=0}^\infty e^{-\lambda_i t/2}$$ är spåren av värmekärnan.

Finally let us define the following from their Radon-Nicodym derivatives:

```math
\begin{aligned}
DM_*\mu(\Omega_t) &:= \int_M DM_*\mu(\Omega_t\vert_x \sqrt{g}dx)\\
DM_*\mu(\Omega^0_t) &:= \int_M DM_*\mu(\Omega^0_t\vert_x \sqrt{g}dx)\\
DM_*\mu(\Omega_t[\gamma]) &:= \int_M DM_*\mu(\Omega_t[\gamma]\vert_x \sqrt{g}dx) \\
\end{aligned}
```

## Formel för stokastisk spårning

```math
\begin{aligned}
Z_{-\Delta/2}(t) = DM_*\mu(\Omega_t) &= DM_*\mu(\Omega^0_t) + \sum_{\set{\gamma}} DM_*\mu(\Omega_t[\gamma]) \\

DM_*\mu(\Omega_t^0) &\approx_{t\rightarrow 0} (2\pi t)^{-n/2}(vol(M) + t/6\int_M K(x)\sqrt{g} dx + O(t^2))\space \small\text{by McKean-Singer}\\

DM_*\mu(\Omega_t[\gamma]) &= e^{-\ell(\gamma)^2/2t}\int_M DM_*\mu(e^{\bra{J_BB_t}\ket{B_t}} _t \Omega_t^0[\gamma]\vert_x\sqrt{g}dx)\space\small \text{ by Cameron-Martin}\\

&= e^{-\ell(\gamma)^2/2t}\int_{T_{\gamma_0}M} E(e^{J_B}_{t} | \Omega_t^0[\gamma]\vert_{x(\tau)})dx^1(\tau)\dots dx^n(\tau) d\tau\\
\end{aligned}
```
```math
\begin{aligned}
\text{Horocyclic coordinates}: \\

h&= h(y) \implies \\
&=\frac{\ell(\gamma_0)}{2\pi t}\int_{\Reals}\frac{e^{- (1+h^2(y))\ell(\gamma)^2/2t}}{2\sinh \sqrt{-K(y)}\ell(\gamma)/2}\ell(\gamma) dy\ ,\\

h(y) = y \implies \\
&= \frac{e^{-\ell(\gamma)^2/2t}\ell(\gamma_0)}{2\sqrt{2\pi t}\sinh \sqrt {-K}\ell(\gamma)/2}\int_{\Reals}e^{-y^2\ell(\gamma)^2/2t}{\frac{\ell(\gamma)dy}{\sqrt{2\pi t}}}
\end{aligned}
```
## Approximation och Selbergs spårningsformel

I $$\dim = 2$$ konstant krökning $$K = -\kappa^2$$ ärende

```math
\begin{aligned}

\det |I-J_\gamma| &= (e^{\kappa\ell(\gamma)} - 1)(1 - e^{-\kappa\ell(\gamma)}) = 2 \sinh \kappa\ell(\gamma)/2\\

\gamma(t) = \gamma_0(kt)\implies \\

DM_*\mu(\Omega_t[\gamma])&=\frac{e^{-k^2\ell(\gamma_0)^2/2t}\ell(\gamma_0)}{2\sqrt{2\pi t}\sinh k\kappa\ell(\gamma_0)/2}\\
\end{aligned}
```

I $$\dim=3$$ hyperboliskt manifold fall, vi använder komplexa koordinater $$(z,\bar{z})$$ på det vanliga paketet att skriva

```math
\begin{aligned}
J_{DM(\vec{x}+(\tau+\ell(\gamma))\vec{e}^1)} &=
\begin{pmatrix}
e^{\kappa\ell(\gamma)} && 0 && 0\\
0 && e^{-\kappa\ell(\gamma)+i\theta(\gamma)} && 0 \\
0 && 0 && e^{-\kappa\ell(\gamma)-i\theta(\gamma)} \\
\end{pmatrix}\\

\implies& \\
\det I-{\perp_{\gamma_0}}^k &= |1-e^{-k(\kappa\ell(\gamma_0)-i\theta(\gamma_0))}|^2
\end{aligned}
```
och sedan $$z=x^2+ix^3 \implies d\bar{z}\wedge dz= (dx^2-idx^3)\wedge(dx^2+idx^3) = 2idx^2\wedge dx^3$$, blir approximationen i ekvation (2) igen exakt:

```math
\begin{aligned}
\kappa &= 1 \implies \\

DM_*\mu(\Omega_t[\gamma])
&=\frac{e^{-k^2\ell(\gamma_0)^2/2t}\ell(\gamma_0)}{2\sqrt{2\pi t (1-e^{-k\ell(\gamma_0)})}|e^{k\ell(\gamma_0)/2}-e^{-k(\ell(\gamma_0)/2-i\theta(\gamma_0))}|}\\

\end{aligned}
```

<!-- $Date$ $Author$ $Revision$ -->
