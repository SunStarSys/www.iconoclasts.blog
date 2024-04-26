---
archived: ~
categories: Matemáticas
dependencies: '*.md.es'
keywords: medida weiner, superficies riemann,probabilidad,geometría
published: ~
status: borrador
title: Fórmula de rastreo estocástico para colectores cerrados y curvados negativamente
---

<div class="right">

![Panal hiperbólico](stochastic-trace-formula.page/hyperbolic-honeycomb.png).

</div>

[TOC]

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
pen periwinklePen =  redPortion * red + greenPortion * green + bluePortion * blue;
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

{# lede #}Mi *1997 Ph.D. tesis* como entrada de blog.{# lede #}

## Solo hay una medida Wiener n-dimensional $$\mu$$

## Aproximaciones lineales a los movimientos brownianos

## El mapa de desarrollo DM

## La fórmula de Cameron-Martin

Núcleos de calor como derivados de radón-nicodimio de medida Weiner

## Notación

$$M$$ es una curva negativa $$\dim=n$$ múltiple de Riemannian cerrado con métrica $$g$$, conexión métrica $$\nabla$$, y (no negativo) Operador Laplace-Beltrami $$\Delta_M$$. Vamos $$k_{-t\Delta/2}(x,y)$$ representan el núcleo de calor en $$M$$

Por lo tanto $$k_{-t\Delta/2}(x,x) = dDM_*\mu/\sqrt{g}dx$$ es el derivado radonicodimico de la medida n-dimensional de Wiener $$\mu$$, restringido a la recuperación del espacio de bucle continuo $$\Omega_t(M)\vert_x$$, a través del inverso del mapa de desarrollo de conservación de medidas de Weiner $$DM$$. *Nota:* $$DM^{-1}\Omega_t\vert_x$$

$$\Omega_t^0$$ es el espacio de bucles contractibles continuos en $$M$$

$$\Omega_t[\gamma]$$ es el espacio de bucles continuos en $$M$$ homotópico al geodésico cerrado $$\gamma$$. Vamos $$\gamma_0$$

$$DM^{-1}\Omega_t^0[\gamma]$$ es la preimagen de los bucles contractibles continuos en $$M$$ escrito como compensaciones homotípicas a $$\gamma(s) = DM(\frac{s\ell(\gamma)}{t}\vec{e}^1), 0\leq s \leq t$$. Pensar coordenadas horocíclicas &mdash; cada fibra como límite geométrico de esferas geodésicas periódicas $$S_{\gamma_0(s)}^{n-1}(k\ell(\gamma_0)), 0\leq s \leq t, k\rightarrow\infty$$, vectorizado en el paquete normal $$\gamma_0$$. Nuestras restricciones de curvatura implican Coordenadas Horocíclicas para cada $$\gamma_0$$ existan como suaves, $$DM$$- mapa de coordenadas compatible para $$\Omega_t^0[\gamma]$$

Ahora $$\vec{x}(\tau)+\ell(\gamma)\vec{e}^1$$ es el punto final *desarrollado* de la "compensación" *geodésica arrugada* homotópica a $$\gamma: DM(\vec{x}(\tau) + \frac{s\ell(\gamma)}{t}\vec{e}^1), 0\leq s \leq t$$. La curva es periódica con el período $$\ell(\gamma_0)$$, y revisita su punto de partida torcido $$DM(\vec{x}(\tau))$$ en el momento $$t$$, haciendo el cálculo de su derivado hacia adelante $$J=\lim_{s\uparrow t}DM^\prime\vert_{DM(\vec{x}(\tau) + \frac{\ell(\gamma)s}{t}\vec{e}^1)}$$ como un automorfismo lineal de $$T_{DM(\vec{x}(\tau))}M$$. Es importante, $$J_{DM(\vec{x}(\tau)+\ell(\gamma)\vec{e}^1)}$$ puede construirse utilizando **Campos Jacobi**, ya que $$DM$$ **es** el mapa exponencial (iterado) a lo largo de cualquier serie de líneas rectas conectadas en $$\Reals^n$$. Estudiaremos $$ 1/2 \int_0^t \bra{dX}\ket{dX}_s$$

```math
\begin{aligned}
X_t &= X_0 + \int_0^t \sqrt{J}_{X_t} dB_t  \\

\end{aligned}
```

$$Z_{-\Delta/2}(t) := \int_M k_{-t\Delta/2}(x,x) \sqrt{g}dx = \sum_{j=0}^\infty e^{-\lambda_i t/2}$$ es el rastreo del núcleo de calor.

Finalmente definamos lo siguiente de sus derivados radón-nicodimicos:

```math
\begin{aligned}
DM_*\mu(\Omega_t) &:= \int_M DM_*\mu(\Omega_t\vert_x \sqrt{g}dx)\\
DM_*\mu(\Omega^0_t) &:= \int_M DM_*\mu(\Omega^0_t\vert_x \sqrt{g}dx)\\
DM_*\mu(\Omega_t[\gamma]) &:= \int_M DM_*\mu(\Omega_t[\gamma]\vert_x \sqrt{g}dx) \\
\end{aligned}
```

## Fórmula de rastreo estocástico

```math
\begin{aligned}
Z_{-\Delta/2}(t) = DM_*\mu(\Omega_t) &= DM_*\mu(\Omega^0_t) + \sum_{\set{\gamma}} DM_*\mu(\Omega_t[\gamma]) \\

DM_*\mu(\Omega_t^0) &\approx_{t\rightarrow 0} (2\pi t)^{-n/2}(vol(M) + t/6\int_M K(x)\sqrt{g} dx + O(t^2))\space \small\text{by McKean-Singer}\\

DM_*\mu(\Omega_t[\gamma]) &= e^{-\ell(\gamma)^2/2t}\int_M DM_*\mu(e^{\bra{J_BB_t}\ket{B_t}} _t \Omega_t^0[\gamma]\vert_x\sqrt{g}dx)\space\small \text{ by Cameron-Martin}\\

&= e^{-\ell(\gamma)^2/2t}\int_{T_{\gamma_0}M} E(e^{J_B}_{t} | \Omega_t^0[\gamma]\vert_{x(\tau)})dx^1(\tau)\dots dx^n(\tau) d\tau\\

\frac{dDM_*\mu(e^{-\ell(\gamma)x^1(t)}\Omega^0_t[\gamma])}{dx^1(\tau)\dots dx^n(\tau)d\tau}\vert_{\vec{y(\tau)}}&\approx_{t\rightarrow 0} \frac{e^{-\bra{|I-J_{DM(\vec{x}(\tau),\vec{y}(\tau))}\vec{x}(\tau)}\ket{\vec{x}(\tau)}/2t}}{(2 \pi t)^{(n+1)/2}}(1+O(t^2))\small \text{ semi-classical limit}\\

\text{Horocyclic coordinates}: z(\tau) - x(\tau) &= x + \ell(\gamma)\vec{e}^1\implies\\

\int_{M/S^1\oplus S^1}k_t(x,z) dx &=\lim_{j\rightarrow\infty}\frac{e^{-\ell(\gamma)^2/2t}}{\sqrt{2\pi t}}E(e^{\bra{J_{X^j_t}\vec{x}}\ket{\vec{x}}})\\

&=\lim_{j\rightarrow\infty}\frac{e^{-\ell(\gamma)^2/2t}}{\sqrt{2\pi t}}\int_{M^j/S^1\oplus S^1}\frac{1}{\sqrt{2\pi t}^{jn}\det|I-J_{X^j}|}e^{-\ell(X^j)^2/2t}X^{j}\\

\end{aligned}
```

## Aproximación y la Fórmula Selberg Trace

En el $$\dim = 2$$ curvatura constante $$-\kappa^2$$

```math
\begin{aligned}
\sqrt{J_{\vec{x}, \vec{y}}}dRB&=
\begin{pmatrix}
e^{\kappa d(\vec{x},\vec{y})/2} && 0\\
0 && e^{-\kappa d(\vec{x},\vec{y})/2}\\
\end{pmatrix}
\implies&\\
\bra{\sqrt{J}dRB}\ket{\sqrt{J}dRB} &= e^{\kappa \ell(B)}dRB_1^2 - e^{-\kappa \ell(B)}dRB_2^2\\

\int_0^t \bra{\sqrt{ J}dB}\ket{\sqrt{ J}dB} &= e^{\kappa\ell(\gamma)} - e^{-\kappa\ell(\gamma)}\\

\det I-J_{\gamma} &= (e^{\kappa\ell(\gamma)/2}- e^{-\kappa\ell(\gamma)/2})^2
\end{aligned}
```

constante sobre $$(\vec{x},\tau)$$, por lo que la aproximación $$\approx_{t\rightarrow 0}$$

```math
\begin{aligned}

DM_*\mu(\Omega_t[\gamma]) &= \frac{e^{-\ell(\gamma)^2/2t}\ell(\gamma_0)}{\sqrt{2 \pi t}(e^{\kappa\ell(\gamma)/2} -e^{-\kappa\ell(\gamma)/2})}\\

\gamma(t) = \gamma_0(kt)\implies \\

&=\frac{e^{-k^2\ell(\gamma_0)^2/2t}\ell(\gamma_0)}{2\sqrt{2\pi t}\sinh k\kappa\ell(\gamma_0)/2}\\
\end{aligned}
```

En el $$\dim=3$$ caso múltiple hiperbólico, utilizamos coordenadas complejas $$(z,\bar{z})$$

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
y desde $$z=x^2+ix^3 \implies d\bar{z}\wedge dz= (dx^2-idx^3)\wedge(dx^2+idx^3) = 2idx^2\wedge dx^3$$

```math
\begin{aligned}
\kappa &= 1 \implies \\

DM_*\mu(\Omega_t[\gamma])
&=\frac{e^{-k^2\ell(\gamma_0)^2/2t}\ell(\gamma_0)}{2\sqrt{2\pi t (1-e^{-k\ell(\gamma_0)})}|e^{k\ell(\gamma_0)/2}-e^{-k(\ell(\gamma_0)/2-i\theta(\gamma_0))}|}\\

\end{aligned}
```

<!-- $Date: 2024-04-12 16:58:35 +0000 (Fri, 12 Apr 2024) $ $Author: joe $ $Revision: 22121 $ -->
