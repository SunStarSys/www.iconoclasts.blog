---
categories: Matemáticas
dependencies: '*.md.es'
keywords: medida del weiner, superficies de riemann, probabilidad, geometría
status: archivado
title: Fórmula de rastreo estocástico para manifolds cerrados y con curva negativa
---

<div class="right">

![Panal hiperbólico](stochastic-trace-formula.page/hyperbolic-honeycomb.png)

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

{# lede #}Mi *1997 Ph.D. tesis* como entrada de blog.{# lede #}

## Solo hay una medida Wiener n-dimensional $$\mu$$

## Aproximaciones lineales de trozos al movimiento browniano

## El mapa de desarrollo DM

## La fórmula Cameron-Martin

## Núcleos de calor como derivados del radón-nicodimio de medida Weiner

## Notación

$$M$$ es una curva negativa $$\dim=n$$ Colector Riemanniano cerrado con métrica $$g$$, conexión de métrica $$\nabla$$, y (no negativo) Operador Laplace-Beltrami $$\Delta_M$$. Permitir $$k_{-t\Delta/2}(x,y)$$ representan el núcleo de calor en $$M$$.

Por lo tanto $$k_{-t\Delta/2}(x,x) = dDM_*\mu/\sqrt{g}dx$$ es el derivado radón-nicodimio de la medida Wiener n-dimensional $$\mu$$, restringido a la recuperación del espacio de bucle continuo $$\Omega_t(M)\vert_x$$, a través del inverso del mapa de desarrollo conservador de medidas de Weiner $$DM$$. *Nota:* $$DM^{-1}\Omega_t\vert_x$$ no es un espacio de bucle en general.

$$\Omega_t^0$$ es el espacio de los bucles contractibles continuos en $$M$$.

$$\Omega_t[\gamma]$$ es el espacio de bucles continuos en $$M$$ homotópico a la geodésica cerrada $$\gamma$$. Permitir $$\gamma_0$$ sea su primitivo bucle.

$$DM^{-1}\Omega_t^0[\gamma]$$ es la preimagen de los bucles contractibles continuos en $$M$$ como compensaciones homotópicas a $$\gamma(s) = DM(\frac{s\ell(\gamma)}{t}\vec{e}^1), 0\leq s \leq t$$. Piense en coordenadas horocíclicas &mdash; Cada fibra como el límite geométrico de las esferas geodésicas periódicas $$S_{\gamma_0(s)}^{n-1}(k\ell(\gamma_0)), 0\leq s \leq t, k\rightarrow\infty$$, vectorizado en el paquete normal sobre $$\gamma_0$$. Nuestras limitaciones de curvatura implican coordenadas horocíclicas para cada $$\gamma_0$$ existan como suaves, $$DM$$-Mapa de coordenadas compatible para $$\Omega_t^0[\gamma]$$.
En coordenadas horocíclicas, $$\det{g(\vec{x})} = 1$$:

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
Así que la conexión 1-formulario $$\alpha := Adx + Bdy$$ satisface
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

**IMPORTANTE** Por lo tanto, cuando $$h=h(y)$$, la ecuación de transporte paralelo reduce a $$\dot{\vec{c}}(t) = -\alpha(\dot{\gamma}(t))\vec{c}(t) = -\partial_y(h\ dx/dt + h^2/2\ dy/dt)\vec{c}(t)$$. Por supuesto, esto ha cerrado la solución

```math
\vec{c}(t) = exp(-((h+\beta y)\ dx/dt + (h^2/2 + (\beta y)^2/2 + \beta y h) \ dy/dt)|_{x_0,y_0}^{x_t,y_t})\vec{c}(0)
```

función de la curva de transporte $$\gamma$$los puntos finales **independientes**. Este hecho implica que el mapa de desarrollo conserva los bucles.

$$Z_{-\Delta/2}(t) := \int_M k_{-t\Delta/2}(x,x) \sqrt{g}dx = \sum_{j=0}^\infty e^{-\lambda_i t/2}$$ es el rastro del núcleo de calor.

Finally let us define the following from their Radon-Nicodym derivatives:

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
## Aproximación y la fórmula Selberg Trace

En el $$\dim = 2$$ curvatura constante $$K = -\kappa^2$$ caso,

```math
\begin{aligned}

\det |I-J_\gamma| &= (e^{\kappa\ell(\gamma)} - 1)(1 - e^{-\kappa\ell(\gamma)}) = 2 \sinh \kappa\ell(\gamma)/2\\

\gamma(t) = \gamma_0(kt)\implies \\

DM_*\mu(\Omega_t[\gamma])&=\frac{e^{-k^2\ell(\gamma_0)^2/2t}\ell(\gamma_0)}{2\sqrt{2\pi t}\sinh k\kappa\ell(\gamma_0)/2}\\
\end{aligned}
```

En el $$\dim=3$$ caso múltiple hiperbólico, utilizamos coordenadas complejas $$(z,\bar{z})$$ en el paquete normal para escribir

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
y desde $$z=x^2+ix^3 \implies d\bar{z}\wedge dz= (dx^2-idx^3)\wedge(dx^2+idx^3) = 2idx^2\wedge dx^3$$, la aproximación en la ecuación (2) vuelve a ser exacta:

```math
\begin{aligned}
\kappa &= 1 \implies \\

DM_*\mu(\Omega_t[\gamma])
&=\frac{e^{-k^2\ell(\gamma_0)^2/2t}\ell(\gamma_0)}{2\sqrt{2\pi t (1-e^{-k\ell(\gamma_0)})}|e^{k\ell(\gamma_0)/2}-e^{-k(\ell(\gamma_0)/2-i\theta(\gamma_0))}|}\\

\end{aligned}
```

<!-- $Date$ $Author$ $Revision$ -->
