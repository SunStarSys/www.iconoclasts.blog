---
archived: ~
categories: Математика
dependencies: '*.md.ru'
keywords: измеритель утяжелителя, поверхности римана, вероятность, геометрия
published: черновик
status: ~
title: Стохастическая формула трассировки для закрытых, отрицательно изогнутых коллекторов
---

<div class="right">

![Гиперболический сот](stochastic-trace-formula.page/hyperbolic-honeycomb.png).

</div>

[Оглавление]

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

{# lede #}Мой *1997 Ph.D. тезис* как запись в блоге.{# lede #}

## Есть только одна n-мерная мера Wiener $$\mu$$

## Линейные приближения к Брауновскому движению

## Карта развития DM

## Формула Кэмерона-Мартина

## Тепловые ядра как производные Радона-Никодима от измерения Вайнера

Система обозначений ##

$$M$$ является отрицательно изогнутым $$\dim=n$$ замкнутый риманский многообразие с метрикой $$g$$, метрическое соединение $$\nabla$$, и (неотрицательный) оператор Laplace-Beltrami $$\Delta_M$$. Отпустить $$k_{-t\Delta/2}(x,y)$$ представлять ядро тепла на $$M$$

поэтому $$k_{-t\Delta/2}(x,x) = dDM_*\mu/\sqrt{g}dx$$ Радон-Никодим является производной n-мерного измерения Винера $$\mu$$, ограничено откатом непрерывного пространства петли $$\Omega_t(M)\vert_x$$, через обратную к карте разработки мер-сохранения Вайнера $$DM$$. *Примечание.* $$DM^{-1}\Omega_t\vert_x$$

$$\Omega_t^0$$ является пространством непрерывных контрактных петель на $$M$$

$$\Omega_t[\gamma]$$ является пространством непрерывных циклов $$M$$ гомотопический к замкнутому геодезическому $$\gamma$$. Отпустить $$\gamma_0$$

$$DM^{-1}\Omega_t^0[\gamma]$$ является предпосылкой непрерывных контрактных петель на $$M$$ списано как смещение гомотопического на $$\gamma(s) = DM(\frac{s\ell(\gamma)}{t}\vec{e}^1), 0\leq s \leq t$$. Гороциклические координаты &mdash; каждое волокно как геометрический предел периодических геодезических сфер $$S_{\gamma_0(s)}^{n-1}(k\ell(\gamma_0)), 0\leq s \leq t, k\rightarrow\infty$$, векторизованный в нормальном наборе $$\gamma_0$$. Наши ограничения кривизны подразумевают Гороциклические координаты для каждого $$\gamma_0$$ как гладкий, $$DM$$-совместимая карта координат для $$\Omega_t^0[\gamma]$$

Сейчас $$\vec{x}(\tau)+\ell(\gamma)\vec{e}^1$$ *неразработанная* конечная точка «смещение» *извращенная геодезическая* гомотопическая к $$\gamma: DM(\vec{x}(\tau) + \frac{s\ell(\gamma)}{t}\vec{e}^1), 0\leq s \leq t$$. Кривая периодична с периодом $$\ell(\gamma_0)$$и возвращает свою извращенную отправную точку $$DM(\vec{x}(\tau))$$ время $$t$$, вычисление его опережающего производного $$J=\lim_{s\uparrow t}DM^\prime\vert_{DM(\vec{x}(\tau) + \frac{\ell(\gamma)s}{t}\vec{e}^1)}$$ как линейный автоморфизм $$T_{DM(\vec{x}(\tau))}M$$. Важно, $$J_{DM(\vec{x}(\tau)+\ell(\gamma)\vec{e}^1)}$$ может быть построен с использованием **Jacobi Fields**, так как $$DM$$ ** это (играемая) экспоненциальная карта вдоль любой серии связанных прямых линий в $$\Reals^n$$. Мы будем учиться $$ 1/2 \int_0^t \bra{dX}\ket{dX}_s$$

```math
\begin{aligned}
X_t &= X_0 + \int_0^t \sqrt{J}_{X_t} dB_t  \\

\end{aligned}
```

$$Z_{-\Delta/2}(t) := \int_M k_{-t\Delta/2}(x,x) \sqrt{g}dx = \sum_{j=0}^\infty e^{-\lambda_i t/2}$$ – это отслеживание ядра тепла.

Наконец, давайте определим следующее из их производных Радон-Никодим:

```math
\begin{aligned}
DM_*\mu(\Omega_t) &:= \int_M DM_*\mu(\Omega_t\vert_x \sqrt{g}dx)\\
DM_*\mu(\Omega^0_t) &:= \int_M DM_*\mu(\Omega^0_t\vert_x \sqrt{g}dx)\\
DM_*\mu(\Omega_t[\gamma]) &:= \int_M DM_*\mu(\Omega_t[\gamma]\vert_x \sqrt{g}dx) \\
\end{aligned}
```

## Стохастическая формула трассировки

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

## Приближение и формула трассировки Сельберга

В $$\dim = 2$$ постоянная кривизна $$-\kappa^2$$

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

который является постоянным $$(\vec{x},\tau)$$Таким образом, приближение $$\approx_{t\rightarrow 0}$$

```math
\begin{aligned}

DM_*\mu(\Omega_t[\gamma]) &= \frac{e^{-\ell(\gamma)^2/2t}\ell(\gamma_0)}{\sqrt{2 \pi t}(e^{\kappa\ell(\gamma)/2} -e^{-\kappa\ell(\gamma)/2})}\\

\gamma(t) = \gamma_0(kt)\implies \\

&=\frac{e^{-k^2\ell(\gamma_0)^2/2t}\ell(\gamma_0)}{2\sqrt{2\pi t}\sinh k\kappa\ell(\gamma_0)/2}\\
\end{aligned}
```

В $$\dim=3$$ гиперболический многообразный корпус, мы используем сложные координаты $$(z,\bar{z})$$

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
и с $$z=x^2+ix^3 \implies d\bar{z}\wedge dz= (dx^2-idx^3)\wedge(dx^2+idx^3) = 2idx^2\wedge dx^3$$

```math
\begin{aligned}
\kappa &= 1 \implies \\

DM_*\mu(\Omega_t[\gamma])
&=\frac{e^{-k^2\ell(\gamma_0)^2/2t}\ell(\gamma_0)}{2\sqrt{2\pi t (1-e^{-k\ell(\gamma_0)})}|e^{k\ell(\gamma_0)/2}-e^{-k(\ell(\gamma_0)/2-i\theta(\gamma_0))}|}\\

\end{aligned}
```

<!-- $Date$ $Author$ $Revision$ -->
