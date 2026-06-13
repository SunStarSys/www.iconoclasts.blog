---
categories: Математика
dependencies: '*.md.ru'
keywords: мера weiner, поверхностиriemann, вероятность, геометрия
status: архивированный
title: Стохастическая формула трассировки для закрытых, отрицательно изогнутых коллекторов
---

<div class="right">

![Гиперболический сот](stochastic-trace-formula.page/hyperbolic-honeycomb.png)

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

{# lede #}Мой *1997 Ph.D. тезис* как запись в блоге.{# lede #}

## Есть только один n-Dimensional Wiener Measure $$\mu$$

## Кусочно линейные приближения к броуновскому движению

## Карта развития DM

## Формула Кэмерона-Мартина

## Тепловые ядра как радоно-никодимовые производные измерения Weiner

## Обозначение

$$M$$ является отрицательно изогнутым $$\dim=n$$ закрытый риманский коллектор с метрикой $$g$$, метрическое соединение $$\nabla$$, и (неотрицательный) оператор Лаплас-Белтрами $$\Delta_M$$. Пусть $$k_{-t\Delta/2}(x,y)$$ представляет тепловое ядро на $$M$$.

поэтому $$k_{-t\Delta/2}(x,x) = dDM_*\mu/\sqrt{g}dx$$ является производным Радон-Никодима n-мерного измерения Wiener $$\mu$$, ограничено откатом пространства непрерывного цикла $$\Omega_t(M)\vert_x$$, через обратную карту развития Weiner $$DM$$. *Примечание:* $$DM^{-1}\Omega_t\vert_x$$ Это вообще не пространство цикла.

$$\Omega_t^0$$ это пространство непрерывных сокращаемых циклов на $$M$$.

$$\Omega_t[\gamma]$$ является пространством непрерывных циклов на $$M$$ гомотопический к закрытому геодезическому $$\gamma$$. Пусть $$\gamma_0$$ Это будет его примитивный цикл.

$$DM^{-1}\Omega_t^0[\gamma]$$ является предварительным представлением непрерывных сокращаемых циклов на $$M$$ записано как смещает гомотопический к $$\gamma(s) = DM(\frac{s\ell(\gamma)}{t}\vec{e}^1), 0\leq s \leq t$$. Гороциклические координаты &mdash; каждое волокно как геометрический предел периодических геодезических сфер $$S_{\gamma_0(s)}^{n-1}(k\ell(\gamma_0)), 0\leq s \leq t, k\rightarrow\infty$$, векторизованный в нормальном наборе $$\gamma_0$$. Наши ограничения кривизны подразумевают Гороциклические координаты для каждого $$\gamma_0$$ существует как гладкая, $$DM$$-совместимая координатная карта для $$\Omega_t^0[\gamma]$$.
в горизонтальных координатах, $$\det{g(\vec{x})} = 1$$:

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
Соединение 1-форма $$\alpha := Adx + Bdy$$ удовлетворяет
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

**ВНИМАНИЕ** Поэтому, когда $$h=h(y)$$, параллельное транспортное уравнение уменьшается до $$\dot{\vec{c}}(t) = -\alpha(\dot{\gamma}(t))\vec{c}(t) = -\partial_y(h\ dx/dt + h^2/2\ dy/dt)\vec{c}(t)$$. Конечно, это закрытое решение

```math
\vec{c}(t) = exp(-((h+\beta y)\ dx/dt + (h^2/2 + (\beta y)^2/2 + \beta y h) \ dy/dt)|_{x_0,y_0}^{x_t,y_t})\vec{c}(0)
```

которая является функцией транспортной кривой $$\gamma$$конечные точки **одно**. Этот факт подразумевает, что карта разработки сохраняет циклы.

$$Z_{-\Delta/2}(t) := \int_M k_{-t\Delta/2}(x,x) \sqrt{g}dx = \sum_{j=0}^\infty e^{-\lambda_i t/2}$$ Это след теплового ядра.

Finally let us define the following from their Radon-Nicodym derivatives:

```math
\begin{aligned}
DM_*\mu(\Omega_t) &:= \int_M DM_*\mu(\Omega_t\vert_x \sqrt{g}dx)\\
DM_*\mu(\Omega^0_t) &:= \int_M DM_*\mu(\Omega^0_t\vert_x \sqrt{g}dx)\\
DM_*\mu(\Omega_t[\gamma]) &:= \int_M DM_*\mu(\Omega_t[\gamma]\vert_x \sqrt{g}dx) \\
\end{aligned}
```

Формула стохастического трассировки ##

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
## Пример и формула трассировки Сельберга

В $$\dim = 2$$ постоянная кривизна $$K = -\kappa^2$$ случай,

```math
\begin{aligned}

\det |I-J_\gamma| &= (e^{\kappa\ell(\gamma)} - 1)(1 - e^{-\kappa\ell(\gamma)}) = 2 \sinh \kappa\ell(\gamma)/2\\

\gamma(t) = \gamma_0(kt)\implies \\

DM_*\mu(\Omega_t[\gamma])&=\frac{e^{-k^2\ell(\gamma_0)^2/2t}\ell(\gamma_0)}{2\sqrt{2\pi t}\sinh k\kappa\ell(\gamma_0)/2}\\
\end{aligned}
```

В $$\dim=3$$ гиперболический многообразие случай, мы используем сложные координаты $$(z,\bar{z})$$ на обычном пакете для записи

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
и после $$z=x^2+ix^3 \implies d\bar{z}\wedge dz= (dx^2-idx^3)\wedge(dx^2+idx^3) = 2idx^2\wedge dx^3$$, аппроксимация в уравнении (2) снова становится точной:

```math
\begin{aligned}
\kappa &= 1 \implies \\

DM_*\mu(\Omega_t[\gamma])
&=\frac{e^{-k^2\ell(\gamma_0)^2/2t}\ell(\gamma_0)}{2\sqrt{2\pi t (1-e^{-k\ell(\gamma_0)})}|e^{k\ell(\gamma_0)/2}-e^{-k(\ell(\gamma_0)/2-i\theta(\gamma_0))}|}\\

\end{aligned}
```

<!-- $Date$ $Author$ $Revision$ -->
