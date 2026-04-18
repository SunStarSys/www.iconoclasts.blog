---
archived: ~
categories: Математика, динамика
dependencies: '*.md.ru'
keywords: динамика, механика, квантовый, классический, тепловое ядро, убивающее поле,
  фейнман кач, Кэмерон Мартин
published: ~
status: беспорядок
title: Динамика, классика и квант
---

<div class="right">

![QM –](dynamics.page/dynamics)

</div>

{# lede #}Дифференциальный геометр'подход{# lede #}

Prerequisites:

1. Знакомство со Stokes' Теорема о дифференциальных наружных тензорных алгебрах $$n$$-размерные многообразия $$M$$.

2. Воздействие базовой риманновской геометрии, esp в локальных координатах, включая нотацию Эйнштейна / PAIN.

3. Интерес к гладким и стохастическим динамическим системам, включая броуновское движение и теорию Мартингейла.

[TOC]

## Классическая динамика

### Гамильтон-Якоби / Лагранжский формализм

### Механика котангентных пучков

Определить гладкий **Гамильтон** $$\mathcal H:T_q^{\*}M\oplus\Reals\rightarrow\Reals$$ как $$\mathcal H(p,q,t)$$.

#### Пусть $$\theta := p\ dq - \mathcal H(p,q,t)\ dt\in T^\*(T^\*M\oplus\Reals)$$.

Определение $$\mathcal S_\mathcal H(\gamma) := \int_\gamma \theta$$ для гладкого $$\gamma:[0,t]\rightarrow T^{\*}M\oplus\Reals$$.

Если две такие кривые $$\gamma_1, \gamma_2$$ имеют одинаковые конечные точки границы, определяют **вычитание** по обратному составу, поэтому $$\gamma_1 - \gamma_2$$ представляет собой замкнутый цикл, определенный путем обхода $$\gamma_1$$ в прямом направлении, и $$\gamma_2$$ в обратном направлении. Пусть $$S$$ быть любой 2-размерной поверхностью, ограниченной этой замкнутой петлей: $$\gamma_1 - \gamma_2 = \partial S$$. Так

```math
\begin{aligned}
\mathcal S_\mathcal H(\gamma_1) - \mathcal S_\mathcal H(\gamma_2) &= \int_{\gamma_1 - \gamma_2}\theta \\
&= \int_{\partial S}\theta\\
&= \int_S d\theta
\end{aligned}
```
по Стоукс' Теорема.

Независимо от того, является ли такая поверхность $$S$$ на самом деле существует, для действия $$\mathcal S_\mathcal H$$ зависеть только от конечных точек $$\gamma$$, мы обязательно должны иметь условие первого порядка, что $$d\theta$$ исчезает на $$\gamma$$.

#### Пусть $$\omega_\mathcal H := d\theta = dp\wedge dq - d\mathcal H \wedge dt\in\bigwedge^2T^\*(T^\*M\oplus\Reals)$$.

```math
\begin{aligned}
\omega_\mathcal H|_\gamma &= \dot{p}\ dt\wedge dq + \dot{q}\ dp\wedge dt - \frac{\partial \mathcal H}{\partial p}dp\wedge dt - \frac{\partial \mathcal H}{\partial q}dq\wedge dt \\
        &= (-\dot{p}_i - \frac{\partial \mathcal H}{\partial q^i}) dq^i \wedge dt+  (\dot{q}^i - \frac{\partial \mathcal H}{\partial p_i}) dp_i\wedge dt
\end{aligned}
```

#### $$\therefore \omega_\mathcal H|_\gamma = 0 \iff \gamma(t)$$ удовлетворяет уравнениям Гамильтона-Якоби
```math
\begin{aligned}
\dot p &= -\frac{\partial \mathcal H}{\partial q} \\
\dot q &= \ \ \ \frac{\partial \mathcal H}{\partial p}
\end{aligned}
```

$$\iff \gamma:[0,t]\rightarrow T^*M\oplus\R  $$ *стационарная кривая* для действия $$\mathcal S_\mathcal H(\gamma)=\int_\gamma \theta$$.

#### Преобразование легенды
Когда $$\mathcal H$$ выпуклый в $$p$$, $$\forall \dot{q} \in T_q M\ \exists !\ p=p_{max}(\dot q)$$  удовлетворительный $$\dot{q} = \frac{\partial \mathcal H}{\partial p}(p_{max},q,t)$$. Это определяет (вспомогательное) преобразование легенды $$\mathcal L$$ из $$\mathcal H$$:
```math
\begin{aligned}
\mathcal{L}(\dot q,q,t) &:= \max_p p\dot{q} - \mathcal H(p,q,t) \\&= p_{max}(\dot q)\dot q - \mathcal H(p_{max}(\dot q),q,t) \\
\mathcal S_\mathcal{L}(\pi(\gamma)) &= \int_{\pi(\gamma)} \mathcal{L}(\dot q, q, t)\ dt
\end{aligned}
```
*Лагранжское представление Действия*, где $$\pi: T^*M\oplus\Reals \rightarrow M\oplus\Reals$$ является (забытым) оператором проекции волокна $$(p,q,t)\mapsto (q,t)$$.

#### Принцип наименьшего действия

Принцип наименьшего действия просто утверждает, что классическая динамика природы сама стремится выбирать траектории, которые сводят к минимуму. $$\mathcal S_\mathcal{L}$$.

В целом это утверждение является **ложным**. Но установленные стационарные кривые $$\mathcal S_\mathcal H$$ всегда интересно узнать, и они идентичны кривым, которые уходят $$\mathcal S_\mathcal{L}$$ Стационарный.  На местном уровне **дифференциальные уравнения для этих стационарных траекторий идентичны**, и так далее. $$\mathcal S_\mathcal H = \mathcal S_\mathcal{L}$$ на этих кривых.  В формуле Лагранжа эти ковариантные уравнения известны как **Уравнения Эйлера-Лагранжа**. $$(d\mathcal{L}\wedge dt)|_{\pi(\gamma)} = 0:$$

```math
\frac{\partial \mathcal L}{\partial q} = \frac{d}{dt}\frac{\partial \mathcal L}{\partial \dot q}
```

который является ODE второго порядка в $$t \mapsto q(t)$$, так и есть $$2\dim M+1$$ начальные условия $$(\dot q_0, q_0, t_0)$$Как и в случае с контравариантными уравнениями Гамильтона-Якоби. Теорема Пикарда-Линделёфа, эти уравнения имеют локально уникальные решения, когда обрамлены как задача с интиальными ценностями.

Однако интересный аспект $$\mathcal S_\mathcal L(\pi\circ\gamma)$$ показывает себя, когда мы можем однозначно определить $$\pi\circ\gamma$$ неявно на основе конечных точек $$(q_0, t_0)$$ и $$(q_f, t_f)$$, поэтому мы должны *преобразовать эту проблему граничного значения в проблему начального значения*. Иными словами, мы должны решить для $$\dot q_0$$ которые попадут в цель $$(q_f, t_f)$$ с (уникальной?) стационарной кривой $$\pi\circ\gamma$$ который решает уравнения Эйлера-Лагранжа. Таким образом, мы можем думать о $$\mathcal S = \mathcal S(q_0,t_0, q_f, t_f)$$ как **переходная функция**, при условии, что она не зависит от выбора стационарного $$\pi\circ\gamma$$, и такой $$\gamma$$ фактически существует в пространстве решений плавных кривых, соединяющих пару точек перехода.  Локально это применение теоремы неявной функции, но во всем мире могут быть топологические препятствия для построения любого такого $$\gamma$$.

Пусть'сделать шаг назад и определить что-то более простое: уникальный "горизонтальный" лифт $$\mathcal A=\dot q\oplus \pi^{-1}:T_{q} M\oplus \Reals \rightarrow T_{q}^{\*}M\oplus \Reals$$ путем назначения

```math
(\dot q, q,t)\mapsto (p_{max}(\dot q), q, t)\ .
```
Теперь у нас есть для **любого** "прогнозируемый" гладкая кривая (не только стационарная) $$\tilde\gamma:[0,t]\rightarrow M\oplus\R$$:

```math
\begin{aligned}

\mathcal S_\mathcal{L}(\tilde\gamma) &= \mathcal S_\mathcal H(\mathcal A\circ \tilde\gamma) \ .
\end{aligned}
```

Note: ограничение выпуклости на $$\mathcal H$$ обеспечивает уникальность $$p_{max}(0)$$ на любой такой стационарной кривой $$\dot q = 0$$. Сеть состоит в том, что стационарные кривые $$\gamma$$ *не имеют устойчивое движение, содержащееся в волокне *$$\pi^{-1}$$Таким образом, без потери общности мы просто считаем нестационарным $$\tilde \gamma$$ Поднимите их с $$\mathcal A$$ как подходящий класс кривых для "интегрировать по" позже.

#### Квадратичная форма магия, часть 1

Когда $$\mathcal H(p,q,t)$$'с $$p$$-зависимость (также известная как компонент кинетической энергии) является недегенеративной, симметричной квадратичной формой, мы можем представить ее как псевдо-риманскую метрику. $$[g^{ij}]: M\oplus\Reals\rightarrow TM\odot TM$$ с обратной $$[g_{ij}]: M\oplus\Reals\rightarrow T^{\*}M\odot T^{\*}M$$. Легендарная трансформация в локальных координатах связывает их так:

```math
\begin{aligned}
\mathcal H^\mathcal V(p,q,t) &= \frac{1}{2}\ g^{ij}(q,t)\ p_ip_j + \mathcal V(q,t) \implies\\
\mathcal{L}^\mathcal V(q,\dot q, t) &= \frac{1}{2}\ g_{ij}(q,t)\dot{q}^i\dot{q}^j - \mathcal V(q,t)\ .
\end{aligned}
```

Связь Леви-Чивиты'Символы Кристоффеля для $$g$$ Они определяются формулой Кошуля.

```math
\begin{aligned}
\Gamma^k_{ij} &= \frac{1}{2} g^{ka}(\partial_i g_{ja} + \partial_j g_{ia} - \partial_a g_{ij})\\
\Gamma_k^{ij} &= \frac{1}{2}g_{ka}(\partial^ig^{ja} + \partial^j g^{ia} - \partial^ag^{ij}).

\end{aligned}
```
со $$\partial_i := \frac{\partial}{\partial q^i}$$ и $$\partial^i := g^{ij}\partial_j$$. Связанный ковариантный производный $$\nabla$$ в локальных координатах
```math
\begin{aligned}
\nabla_{a^i\partial_i} b^j\partial_j &=d b^j(a^i\partial_i)\partial_j + \Gamma_{ij}^k a^ib ^j\partial_k\ ,\text{ or}\\
\nabla_{\partial_i}\partial_j &= \Gamma_{ij}^k\partial_k \text{ , and contravariantly}\\
\nabla_{\partial^i}\partial^j &= \Gamma^{ij}_k\partial^k \text{, so} \\
\nabla &= d + \Gamma
\end{aligned}
```

для всех тензорных полей. В частности $$\Gamma$$ симметрично в $$(i, j)$$; и  $$\nabla [g_{ij}] = \nabla [g^{ij}] = 0$$.

Анекдотально, тензор кривизны Римана-Кристоффеля

```math
\mathcal R^{\rho }{}_{\sigma \mu \nu }=\partial _{\mu }\Gamma ^{\rho }{}_{\nu \sigma }-\partial _{\nu }\Gamma ^{\rho }{}_{\mu \sigma }+\Gamma ^{\rho }{}_{\mu \lambda }\Gamma ^{\lambda }{}_{\nu \sigma }-\Gamma ^{\rho }{}_{\nu \lambda }\Gamma ^{\lambda }{}_{\mu \sigma }
```

##### Множители задержки на $$\mathcal H$$ как бесконечно малые переводы на $$\mathcal L$$

Кроме того, если $$\mathcal H = \mathcal H\_B$$ имеет дополнительный компонент поля скорости $$\mathcal B(q,t)\in T_qM$$, то есть линейный функционал на $$p\in T^{\*}_qM$$, мы можем **завершить квадрат** и пересчитать $$\mathcal{L}_B$$ в терминах $$\mathcal L$$:

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

Здесь мы видим связь между множителем Лагранжа $$\mathcal B$$ включено $$\mathcal H$$ и его эквивалентное выражение как бесконечно малый дрейф $$\mathcal L$$. Мы будем контекстуализировать $$\mathcal B$$ в различных полезных способах в остальной части. **Оба выражения $$(A)$$ и $$(B)$$ для $$\mathcal{L}_\mathcal B$$ в уравнении <span class="eqno"></span> критические**.

##### Горизонтальный подъем $$\mathcal A$$

С $$\frac{\partial \mathcal H}{\partial p_i}(p,q,t) = g^{ij}p_j \implies \frac{\partial^2\mathcal H}{\partial p_i \partial p_j} = g^{ij}$$, мы можем вычислить горизонтальный подъем явно

```math
\begin{aligned}
{p_{max}}_i &= g_{ij}\dot q^j = \frac{\partial \mathcal L}{\partial \dot q_i}\implies \\
\mathcal A(\dot q, q, t) &= ([g] \dot q, q, t)\ .
\end{aligned}
```

Когда $$g^{ij}$$ является положительно-определенным, так же как и его обратное, что подразумевает компонент кинетической энергии $$\mathcal S_\mathcal L(\tilde\gamma) = \mathcal S_\mathcal H(\mathcal A\circ\tilde\gamma)$$ локально **минимизировано** на стационарных кривых, включающих истинные метрики Римана.

По уравнению (12) $$(A), (B)$$, уравнения Эйлера-Лагранжа для $$\mathcal L^\mathcal V_\mathcal B$$ стать:

```math
\begin{aligned}

\frac{1}{2}\partial_i g_{jk}(\dot q^j-\mathcal B^j)(\dot q^k -\mathcal B^k)-\partial_i \mathcal V &= \frac{d}{dt}g_{ij}(q,t)(\dot q^j - \mathcal B^j) = {\dot p^\mathcal B_{max}}_i\ ,\\

- \partial^i \mathcal V &= \frac{1}{2} (\partial^i   g_{jk})(\dot q^j-\mathcal B^j) (\dot q^k-\mathcal B^k) - g_{jk}(\partial^i\mathcal B^j)(\dot q^k - \mathcal B^k) + \frac{d}{dt} (\dot q^i - B^i) + g^{ij}\frac{\partial g_{jk}}{\partial t}(\dot q^k -\mathcal B^k)\\

-\nabla\mathcal V(q,t)&\begin{equation}\tag{C}=\nabla_{\dot q-\mathcal B} (\dot q - \mathcal B) -\partial_t \mathcal B +(\partial_t [\log g])(\dot q-\mathcal B) \ .\ \ \ \ \ \ \ \ \ \end{equation}
\end{aligned}
```

Это точно **Ньютон'Законы движения** $$F/m = a$$ со $$\partial_t := \frac{\partial}{\partial t}$$ Потенциальная энергия $$\mathcal V$$ и поле скорости $$\mathcal B$$, в зависимости от времени.

### Симплектическая геометрия

Симплектический манифольд $$N$$ является абстракцией контагентного пучка $$T^\*(M\oplus \Reals)$$, с закрытой, не генерируемой 2-формой $$\omega \in \bigwedge^2T^\*N$$. $$N$$-изоморфизмы в этой категории сохраняются $$\omega$$.

Требуется $$d\omega = 0$$ является локальным условием интеграции для потенциала $$\theta$$ удовлетворительный $$d\theta = \omega$$, но могут быть топологические ограничения $$\omega$$'глобальная интегрируемость.

Что мы заботимся о динамике, так это действие $$\mathcal S(\gamma) = \int_\gamma \theta$$Итак, мы сосредоточимся на котангентных связках в этой статье. Здесь уместно $$\theta$$ тривиально классифицировать в терминах функции $$\mathcal H$$ включено $$N$$. Безусловно, поворотный $$\theta$$ на универсальном покрытии $$N$$ иногда может быть утонченным с условиями интегрируемости на его *фазе* (т.е. думать о $$\theta$$ как имеющие значения в комплексном наборе $$N$$и сосредоточиться на своей воображаемой части), чтобы обеспечить последовательные ценности $$e^\mathcal S$$ который спускается $$N$$.

#### Естественная симплектическая объемная форма $$\omega^n/n!$$

#### Пуассон Кронштейн и группы лжи

## Квантовая динамика

Если классическая динамика заключается в нахождении кривых, удовлетворяющих принципу наименьшего действия, то квантовая динамика – это экспоненциальное действие, поскольку мы интегрируем его значение по всему классу (обычно) нестационарных кривых с подходящим ограничивающим понятием. "бесконечное измерение Лебега" $$\mathcal D_{dt}\tilde \gamma$$,

На самом деле, только гауссовы "муфта"

```math
\int_{\set{\tilde \gamma}} e^{-\mathcal S_{\mathcal L_\mathcal B^{\mathcal V}}(\gamma)}\mathcal D_{dt}\tilde \gamma
```

требует интерпретации как *a (сложное значение) меры для некоторых $$\set{\tilde \gamma}$$*, но эта конструкция, как серия все более сложных примеров, будет нашим фокусом в будущем.  Что бы ни случилось, будет ясно, что реальная стоимость $$\mathcal S$$ На этих кривых будет $$\infty$$, чтобы *отменить $$\infty$$* из "Нормализатор деления времени" присущей $$dt$$ элементы $$\mathcal D_{dt}\tilde \gamma$$. Существует несколько вариантов построения аппроксимаций, влияющих на сближение аппроксимаций, но мы обойдем их все, сосредоточившись на геометрической инвариантности тривиально вычисляемых случаев.

### Ценность действий

Не ставить слишком тонкую точку на нем, но классическая механика определяет действие как средство к концу.  Он никогда не заботился о том, чтобы прийти к какому-либо пониманию того, что его фактическая ценность **значима**.  Мы просто используем его для построения необходимых дифференциальных уравнений, чтобы мы могли думать о $$\mathcal S$$ как функция перехода между конечными точками через *стационарные кривые*.  Стационарное требование позволило нам интерпретировать  $$\mathcal S$$ как путь-инвариантное выражение, но мы никогда не заботились о его действительной ценности. Вот почему $$\theta \mapsto \theta + df $$ для некоторых $$f \in C^\infty(T^\*M)$$ рассматривается как инвариантное преобразование: классические уравнения движения остаются неизменными $$f$$.

Мы делаем это в Quantum Dynamics!

### Естественный (ковариантный) интегральный путь

Завершая квадрат и перевод инвариантности Мера Лебега (в волокне $$T^\*M$$), помните, что:

```math
\hbar^n\int_{\Reals^n} e^{ p_i\dot q^i\Delta t - \frac{1}{2}\hbar^2 g^{ij}p_ip_j\Delta t}dp_1\dots dp_n = \hbar^n\int_{\Reals^n} e^{-\frac{1}{2}\hbar^2 g^{ij}(p_i - g_{ik}\dot q^k/\hbar)(p_j - g_{jk}\dot q^k/\hbar)\Delta t} dp_1\dots dp_n \cdot e^{\frac{1}{2\hbar^2}g_{ij}\dot q^i\dot q^j\Delta t} =
\frac{e^{\frac{1}{2\hbar^2}g_{ij}\dot q^i\dot q^j\Delta t}}{\sqrt{(2\pi\Delta t)^n \det g^{ij}}}
```
Таким образом, выражения **Feynman Path Integral** являются морально эквивалентными (но формально бесконечными) в квадратном случае кинетической энергии:

```math
\begin{aligned}
\int_{\set{\gamma}} e^{\mathcal S_{\mathcal H^\mathcal V_\mathcal B} (\gamma)} \mathcal D_{dt}\gamma &\approx \int_{\Reals^{2n}} e^{(p\dot q - \mathcal H^\mathcal V_\mathcal B(p,q,t))\Delta t}\omega_0^n/n!\\
&= \frac{1}{\sqrt{(2\pi\Delta t)^n}}\int_{\Reals^n}e^{\mathcal L^{\mathcal V}_\mathcal B(\dot q, q, t)\Delta t}\sqrt{\det g_{ij}}\  dq^1...dq^n\\
&\approx \int_{\set{\tilde \gamma}} e^{\mathcal S_{\mathcal L^{\mathcal V}_\mathcal B}(\tilde \gamma)} \mathcal D_{dt}\tilde \gamma \ .
 \end{aligned}
```

Следовательно, с вращением **Wick и векторным изменением постоянной Планка** $$\hbar = h/2\pi$$, отправка $$dt\mapsto \hbar/i\ dt, \ p\mapsto \hbar p, \ \dot q\mapsto \dot q/\hbar,\  \mathcal B\mapsto \mathcal B/\hbar$$:

```math
\begin{aligned}
\int_{\set{\gamma}}e^{\hbar/i\ \mathcal S_{\mathcal H_{\mathcal B/\hbar}^{\mathcal V}(\hbar p, q, t)}(\gamma)}\mathcal D_{\hbar/i\ dt}\gamma &\approx \int_{\set{\tilde\gamma}} e^{\hbar/i \ \mathcal S_{\mathcal L_{\mathcal B/\hbar}^{\mathcal V}(\dot q/\hbar,q, t)}(\tilde \gamma)}\mathcal D_{\hbar/i\ dt}\tilde\gamma\\
&= \int_{\set{\tilde \gamma}}e^{-\frac{i}{\hbar}\mathcal S_{\mathcal L^{\hbar^2 \mathcal V}_{\mathcal B}(\dot q, q, t)}(\tilde \gamma)}\mathcal D_{\hbar/i\ dt}\tilde\gamma\ .

\end{aligned}
```

Поэтому, когда мы хотим приблизиться к правой стороне уравнения <span class="eqno"></span> с использованием метода стационарной фазы (он же полуклассический предел) $$\hbar\downarrow 0$$), мы должны помнить, чтобы решить уравнения Эйлера-Лагранжа (14) $$(C)$$ со $$\mathcal V \mapsto \hbar^2 \mathcal V\approx 0$$.

### Квантование Шредингера

```math
\begin{aligned}
\mathcal H(p,q) &\ = \mathcal T(p,q) + \mathcal V(q)\ \text {, where } \mathcal T = \frac{1}{2}g^{ij}(q)p_ip_j \implies \\

e^{-it/\hbar \hat{\mathcal H}}\ket{\psi} &:= e^{-it/\hbar(-\frac{\hbar^2}{2} \Delta_M + \mathcal V)} \ket{\psi} \implies \\

i\hbar \frac{d}{dt}\ket{\psi} &\ = -\frac{\hbar ^2}{2}\Delta_M \ket{\psi} + \mathcal V\ket{\psi}

\end{aligned}
```
($$\Delta_M$$ является оператором Лаплас-Белтрами для $$g$$) как линейные дифференциальные операторы. Дело в том, что решение **аналитическое** в $$t$$ на верхней полуплоскости, и $$dt\mapsto i/\hbar\ dt,\ p\mapsto p/\hbar $$ Это его уравнение Wick-неповоротной диффузии:

```math
\frac{d}{dt}e^{-t\hat{\mathcal H}}\ket{\psi} = (\frac{1}{2}\Delta_M - \mathcal V) e^{-t\hat{\mathcal H}}\ket{\psi} \ .

```

Это форма, поддающаяся стохастическому анализу на основе выборочных путей, и дает нам осмысленный способ согласования пути Фейнмана с аналитическим продолжением решений уравнений эллиптической диффузии со всей правой половиной плоскости.  По сути, мы будем иметь четко определенные "меро-теоретический" аналитическая карта из правой половины плоскости в набор ограниченных линейных операторов на $$\mathscr H = L^2(M,g)$$, и уравнение Шредингера'Оператор Единичной Эволюции – это его граничное значение на воображаемой линии. $$it\hbar\ ,t\in\Reals$$. Это помогает понять фон-Нейман'Спектральная теорема гармонического разложения закрытых, неограниченных самосопряженных операторов (например, $$\Delta_M$$) $$\mathscr H$$,'не требуется для остальной части этой статьи.

Другими словами, достаточно изучить динамику уравнения (17), как только мы проясним тонкости, вовлеченные в явное определение его внушающего пути интегрального выражения.

Вместо того, чтобы заново изобретать полумартигальное исчисление Itô/Stratonovich/Malliavin SDE из цельной ткани, мы собираемся перейти к серии простых (плоскометрических) примеров, которые приведут нас к общей теории.

В конце концов, мы хотим, чтобы Путь Фейнмана-Интегральная Квантизация соответствовала Квантизации Шредингера или, по крайней мере, чтобы понять **отклонение**. В частности, нам необходимо полуклассическое приближение для генерации PDE Шредингера. $$o(t)$$ как $$t\downarrow 0$$.

Как выяснилось, по поводу $$\mathcal V$$ термин, когда метрика не плоская. Мы исследуем этот вопрос полностью ниже, поскольку он относится к известным формулам суммирования (Selberg like) для неплоских метрик.

### Формула Фейнмана-Кака

С $$V \in C^\infty(M)$$Формула Бейкера-Кэмпбелла-Хаусдорфа:
```math
e^{-it/\hbar -\Delta^\hbar_M/2} e^{-it/\hbar V} = e^{-it/\hbar(-\Delta^\hbar_M /2 + V - it/4\hbar [\Delta^\hbar_M,V] + O(t^2))}
```

Формула Фейнмана-Кака следует из формулы пути-интеграла для Брауновского движения в евклидовом пространстве. В основе этого лежит то, что мы можем сосредоточиться на $$\mathcal V = 0$$ Так что мы будем двигаться вперед.

#### Параллельная транспортная изометрия $$\hat\Gamma$$

Возьмите любой вектор в $$v \in T_qM$$. Параллельная транспортировка $$\hat\Gamma_t(\gamma)v \in T_{\gamma(t)}M$$ является вектором, который вы получаете, решая линейный ODE первого порядка:

```math
\begin{aligned}
v(0) &= v \\
\nabla_{\dot \gamma(t)}\dot v &= 0
\end{aligned}
```

Примечательно $$\nabla_{\dot \gamma}\hat\Gamma_t(\gamma) = 0$$, и тензор кривизны $$\mathcal R(X,Y) = [\nabla_X,\nabla_Y] - \nabla_{[X,Y]}$$ измеряет зависимость первого порядка от $$\hat \Gamma$$ на выбор кривой $$\gamma$$ подключение конечных точек. $$\mathcal R = 0 \iff \hat\Gamma_t$$ не зависит от $$\gamma$$.

Другими словами, если мы попытаемся разложить параллельный транспорт как бесконечное движение вдоль $$\mathcal B^\perp$$ с бесконечно малым движением вдоль $$\mathcal B$$, уравнения станут:
```math
\begin{aligned}
\hat\Gamma(\gamma) &= \hat\Gamma(\gamma|_\mathcal B)\hat\Gamma(\gamma|_{\mathcal B^\perp}) - \frac{1}{2}\mathcal R(\dot{\gamma}|_\mathcal B, \dot{\gamma}|_{\mathcal B^\perp})dt + O(dt^2) \ \\
\nabla_{\dot \gamma}\hat\Gamma(\gamma) &= \nabla_{\dot \gamma|_\mathcal B}\hat\Gamma(\gamma|_{\mathcal B^\perp}) + \nabla_{\dot \gamma|{\mathcal B^\perp}}\hat\Gamma(\gamma|_{\mathcal B})  - \frac{1}{2}\mathcal R(\dot\gamma|_\mathcal B,\dot{\gamma}|_{\mathcal B^\perp}) = 0
\end{aligned}
```

#### Полуклассическая механика

##### Семиклассические асимптоты являются точным решением на плоских коллекторах

Правая сторона уравнения (16) представляет собой точную формулировку теплового ядра для постоянного коэффициента (в $$q$$ метрики $$g_{ij}$$. Каждый плоский коллектив'универсальная крышка изометрична для евклидового пространства, где $$g_{ij} = \delta_{i-j}$$.

**Это** тепловое ядро для стандарта $$n$$- мерное Браунское движение.

Пусть's уточните это, отзываем *переходную функцию* в данном случае: $$\mathcal S_\mathcal L(q_0,t_0, q_f, t_f) = \rho^2(q_0, q_f)/2(t_f - t_i)$$, где $$\rho$$ Расстояние между Риманом $$q_0$$ и $$q_f$$.
позволить $$||q||^2 = q\cdot q$$ быть квадратом евклидовой нормы $$q$$:

```math
\begin{aligned}
RHS^{16}_t(q_0,q_f) &:= \frac{e^{-\mathcal S_\mathcal L(q_0, 0, q_f, t)}}{\sqrt{(2 \pi t)^n}} \sqrt{g(q_f)}\\
\mathcal R=0 \implies \\
&\ = \frac{e^{\frac{-||q_f - q_i||^2}{2t}}}{\sqrt{(2\pi t)^n}} \\
                   &\ = \int_{\Reals ^n}RHS^{16}_{s}(q_i, q)\ RHS^{16}_{t-s}(q, q_f)\ dq^1...dq^n\ \forall s\in (0, t)
\end{aligned}
```

Почему это последнее уравнение верно?  Пусть'смотреть на изображение из пространства пути: у нас есть прямолинейная геодезическая, которая соединяет $$q_0$$ по $$q_f$$ время $$t$$, и сломанной геодезической, которая соединяет их с промежуточной точкой останова, происходящей в $$s$$. Эффективно мы интегрируем некогда сломанную геодезику, используя формулу Кэмерона-Мартина для представления прямой геодезии как $$g$$-инвариантное векторное поле $$\mathcal B$$. Затем мы интегрируем дельты точки останова из этой геодезической ($$\dot q-\mathcal B$$) с центрированным гауссом для $$\Reals^n$$.

Явно заданное постоянное векторное поле $$\mathcal B_t = (q_f - q_0) / t$$когда-то сломанная евклидовая геодезия

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

Значительно, что мы построили $$\mathcal B_t$$ поэтому $$\dot q - \mathcal B_t$$ представляет собой некогда сломанную геодезическую $$s$$ что началось и закончилось в $$q_0$$, и мы увидели, что эти кривые по существу $$\mathcal N(0,s\wedge t-s)$$ распространяется. В остальной части этой статьи мы разложим $$\Reals^n=<\mathcal B_t>\oplus \mathcal B_t^\perp$$ и интегрировать $$<\mathcal B_t>$$.

#### Интегральный дефект интегрального пути интегральной кривой DeWitt на поверхностях Римана

Что делать, если мы попытались использовать "последовательные преобразования" о полуклассическом выражении в уравнении (16) для построения Брауновского движения на отрицательно изогнутом многообразии $$M$$?

Мы'получить что-то, но это'd быть *почти* Браунское движение на изогнутых пространствах &mdash; Мы должны обратиться к Фейнман-Каку за дефектом в его бесконечно малом генераторе. Оказывается, будет эффективная потенциальная ошибка функции $$-\frac{1}{6}\bar{\mathcal R}$$, где $$\bar{\mathcal R}$$ Это скалярная кривизна в каждой точке. Впервые это было обнаружено Брайсом DeWitt в 1950 году.'s и прославился в 1972 году McKean-Singer бумагой о кратковременной асимптотике следа теплового ядра, где этот термин представляет вклад в гессианскую *метрическую форму* $$g_{ij}$$ в [нормальные координаты](https://en.wikipedia.org/wiki/Normal_coordinates). Однако в то время $$\dim = 2$$ случай, когда вы добавляете полный коррекционный потенциал $$\mathcal V = -\frac{1}{6}(\bar{\mathcal R} - \frac{1}{4}\bar{\mathcal R}) = \frac{1}{16}\bar{\mathcal R}$$ Гамильтониан, который является Девиттом'с $$\frac{1}{6}\bar{\mathcal R}$$ объемный термин форма *минус* наличие поля убийства $$\mathcal B$$'с $$\frac{1}{24}\mathcal{Ric}(\mathcal B/||\mathcal B||, \mathcal B/||\mathcal B||)$$ Вклад, этот фактор исключается из полуклассической асимптотики формул трассы Сельберга.

Точнее, при приближении $$1/2\ \nabla\vert_0\sqrt{g} = - 1/6\ \mathcal{Ric}_{ij}q^i\partial^j + o(||q||) \implies 1/2\ \nabla\cdot\nabla\vert_0 \sqrt{g} = -1/6\ \bar{\mathcal R}(0)$$, мы видим, что первые производные исчезают по происхождению, так что:

```math
\sqrt{(2\pi t)^n}(\frac{1}{2}\Delta_M-\mathcal V)\vert_0 e^{-\mathcal L(\dot q, q, t)}\sqrt{g(q)} = (\frac{1}{2}\Delta_{\Reals^n}\vert_0 e^{-1/2t\ g_{ij}q^iq^j}) - \mathcal V(0) - \frac{1}{6}\ \bar{\mathcal R}(0)
```

который **является первоначальным термином Девитта, как он его получил.  Как мы предвзято относимся к квантованию в присутствии поля убийства $$\mathcal B = \frac{\partial}{\partial x^1}$$ , мы принимаем немного измененный потенциальный термин:

```math
\sqrt{(2\pi t)^{n}}(\frac{1}{2}\Delta_M-\mathcal V)\vert_{x^1,\vec 0} e^{-\mathcal L_\mathcal B(\dot q, q, t)}\frac{1}{det |I-\mathcal J_\mathcal B|} = (\frac{1}{2}\Delta_{\Reals^n}\vert_{x^1,\vec 0}e^{-x^1x^1/2t}) - \mathcal V(x^1, \vec 0) + \frac{1}{8}\mathcal{Ric}_{11}(x^1, \vec 0).
```

#### Геометрическая формула Кэмерона-Мартина для $$g$$-инвариантные (убийственные) векторные поля $$\mathcal B$$ (Часть 2).

Предположить $$\mathcal B$$ является $$g$$-инвариант [Убийство](https://en.wikipedia.org/wiki/Killing_vector_field)) векторное поле включено $$M$$ Для остальной части этой статьи.

##### Карта развития $$\tilde \gamma = \mathscr D_q[\tilde c]$$ для $$\tilde c\in C^\infty([0,t],T_qM)$$.

Решение для $$\tilde \gamma$$:
```math
\begin{aligned}
\tilde \gamma(0) &= q \\
\dot {\tilde \gamma} &= \hat\Gamma(\tilde \gamma)\dot{\tilde c}\\
\end{aligned}
```

##### $$\tilde c(\tau)=\int_0^\tau\hat\Gamma_s^{-1}(\tilde\gamma)\dot{\tilde\gamma} ds$$ как обратная карта развития

Эфир'Теорема обеспечивает $$d({g^{-1}\mathcal B}) = 0$$, так $$g^{-1}\mathcal B$$ локально интегрируется в $$\hat{\mathcal B}$$, и его локальные наборы уровней ортогональны $$\mathcal B = \nabla \hat{\mathcal B}$$. И потому, $$\hat \Gamma$$ сохраняет метрику, сохраняет $$\mathcal B$$ и $$\mathcal B^\perp$$:

```math
\begin{aligned}
\\
\dot{c}\cdot\mathcal B &= 0 \implies\\
\dot{\gamma}\cdot \mathcal B &= 0 \implies\\
\frac{d\hat{\mathcal B}}{dt} &= 0\ ,
\end{aligned}
```

поэтому $$\gamma$$ содержится в наборе уровней $$\hat{\mathcal B}$$ всегда $$c$$ полностью содержится внутри $$\mathcal B^\perp \subset T_qM$$.
Ограничения кривизны на коммутативность параллельного транспорта обеспечивают $$\gamma(t) \ne q$$ в целом. Кроме того,

```math
\begin{aligned}
||\mathcal B_t|| &= \frac{\rho(q_0,q_f)}{t} \implies \\
\tilde{c}(\tau) - c(\tau) &= \frac{t^2}{\rho^2(q_0,q_f)}\mathcal B_t\int_0^\tau \dot{\tilde c} \cdot \mathcal B_t\ ds\\
&= \mathcal B\int_o^\tau\dot{\tilde c}\cdot \mathcal B \ ds\\
&= \mathcal B\cdot \tilde c(\tau)\ \mathcal B\\
&= d\hat{\mathcal B}(\tilde c)\ \mathcal B \ .
\end{aligned}
```

##### Брауновское движение на $$M$$ является евклидовым измерением Wiener на $$\mathscr D^{-1}$$

##### Формула Кэмерона Мартина для теплового ядра $$k^{\hat{\mathcal H}}_t(q_0,q_f)$$ на отрицательно изогнутом коллекторе $$M$$, где $$\hat{\mathcal H} = -\Delta/2 +\mathcal V$$

Пусть $$\Omega^\mathcal B_t(q)$$ быть пространством непрерывных кривых на $$M$$ Источник: $$q$$ и заканчивается в $$\exp{t\mathcal B}\ q$$, и $$\mu_t(\omega)$$ Глобальный показатель Wiener включен $$\omega\in \Omega^\mathcal B_t := \set{\Omega^\mathcal B_t(q): q\in M}$$, с $$E_t^\mathcal B (f|A):=\int_{\Omega^\mathcal B_t} f(\omega) d(\mu_t|A)(\omega)$$ и $$P^\mathcal B_{\mu_t}(A) := \mu_t(A)/\mu_t(\Omega_t^{\mathcal B})\ \forall A\subset\Omega^\mathcal B_t $$ . Тогда уравнение (26) $$(D) \implies$$

```math
\begin{equation}
\tag{E}
k^{\hat{\mathcal H}}_t(q_0,\exp{t\mathcal B_t}\ q_0)\sqrt g(q_0)\ dq = \frac{e^{-\rho^2/2t}}{\sqrt{2 \pi t\det{|I-\mathcal J^{\mathcal B}(q_0)|}}} E^\mathcal B_t({e^{-\int_0^t V(\omega(s))ds\ +\ \int_0^t \bar {\mathcal R}(\omega(s))ds/12\ -\ \int_0^t \mathcal {Ric}(\frac{\mathcal B}{||\mathcal B||},\frac{\mathcal B}{||\mathcal B||})(\omega(s))ds/24}\chi_{\Omega^B_t(q_0)}(\omega)}|d\mathcal B^\perp)d\hat{\mathcal B}(q_0) \ \ \ \ \ \ \
\end{equation}
```

где $$\rho=||t\mathcal B_t||=dist(q_0,q_f)$$, $$\mathcal J^{\mathcal B}(q_0)$$ является монодромной матрицей, связанной с фолиацией $$M$$ вызвано $$\hat{\mathcal B}$$, вдоль кривой $$\tilde \gamma(\lambda) = \exp{\lambda\mathcal B_t}\ (q_0)$$, подключение $$q_0$$ по $$ q_f$$ как $$\lambda$$ из $$0$$ по $$t$$. $$\mathcal J^{\mathcal B}$$ не зависит от $$t$$; и ограничение кривизны обеспечивает $$I-\mathcal J^\mathcal B$$ всегда не генерируется для $$q_0 \neq q_f$$. Замена $$\mathcal B$$ со $$-\mathcal B$$ отменяет роли $$q_0$$ и $$q_f$$так ясно, что выражение симметрично между ними, как и ожидалось.

С $$\mathcal R$$ постоянна вдоль $$\tilde \gamma$$, и $$\gamma$$ * является геодезическим (до переномализации длины), $$\mathcal J^\mathcal B(q_0)$$ является тривиально вычислимым с точки зрения **Jacobi Fields** $$\mathcal J(\lambda)$$ вдоль $$\tilde \gamma$$ которые являются просто решением для постоянного коэффициента второго порядка линейных ОДЭ, оцениваемых после эволюции с течением времени $$\lambda=t$$.

Доказательство этого уравнения <span class="eqno"></span> будет grist для статьи препринта, а не этого опроса, но это простое применение формулы Фейнмана-Кака *применяется к $$\mathcal V = \frac{1}{12}(\bar{\mathcal R} - \frac{1}{2} \mathcal {Ric}(\mathcal B / ||\mathcal B||, \mathcal B/||\mathcal B||)$$, который явным образом вычисляется с обеих сторон уравнения, так как весь расчет сводится к постоянному случаю кривизны в этой точке.

Хорошее следствие происходит в постоянной $$\mathcal {Ric}(\frac{\mathcal B}{||\mathcal B||},\frac{\mathcal B}{||\mathcal B||}) = \bar{\mathcal R} / \dim M$$ отрицательная гауссова кривизна $$-\kappa$$ случай, где $$\mathcal B$$ нисходит в $$S^1$$ действие на поверхности Римана $$M$$:

```math
\begin{aligned}

\det |I - \mathcal J^\mathcal B| = (2 \kappa\sinh(\sqrt{\kappa}\rho/2))^2 \implies \\

\mu_t(\Omega_t^\mathcal B) = \int_{M/S^1\oplus S^1} k^{-\Delta/2}_t(q,\exp{t\mathcal B}\ q) \sqrt g(q)\ dq &= \frac{e^{-\rho^2/2t}}{\sqrt{2\pi t}} \int_{M/S^1\oplus S^1} \frac{1}{2\kappa(q) \sinh \sqrt{\kappa(q)}\rho/2}E^\mathcal B_t(e^{\int_0^t \bar{\mathcal R}(\omega(s))\ ds/16}{\chi_{\Omega^B_t(q)}(\omega)}|d\mathcal B^\perp)d\hat{\mathcal B}(q)\\

&=\frac{e^{-\rho^2/2t\ -\ t\kappa/8}}{\sqrt{2\pi t}\ 2\kappa\sinh \sqrt {\kappa}\rho/2}\ \int_{\mathcal B^\perp\oplus[0,\rho_0]}P^\mathcal B_{\mu_t}(\Omega_t^\mathcal B(d\hat{\mathcal B})|d\mathcal B^\perp), \ \text{ Bayes}\implies\\

&=\frac{e^{-\rho^2/2t\ -\ t\kappa/8}}{\sqrt{2\pi t}\ 2\kappa\sinh \sqrt {\kappa}\rho/2}\ \int_0^{\rho_0} P_{\mu_t}^\mathcal B(\mathcal B^\perp d\hat{\mathcal B}|\Omega_t^\mathcal B(d\hat{\mathcal B}))\frac{P^\mathcal B_{\mu_t}(\Omega_t^\mathcal B(d\hat{\mathcal B}))}{P^\mathcal B_{\mu_t}(\mathcal B^\perp d\hat{\mathcal B})}d\hat{\mathcal B}\\

&=\frac{e^{-\rho^2/2t\ -t\kappa/8}}{\sqrt{2\pi t}\ 2\kappa\sinh \sqrt {\kappa}\rho/2}\ \rho_0\\

\end{aligned}
```

где $$\rho = \min_{q\in M}dist(q, \exp t\mathcal B \ q)$$ Расстояние самой короткой орбиты, пройденной под $$S^1$$ действия, и $$\rho_0$$ это $$\rho$$ делится на множество связанных с ним орбит.  В привычных терминах гиперболической геометрии, $$\mathcal B^\perp$$ **Циклы** и $$g$$-инвариант $$S^1$$ действие под $$\mathcal B$$ Говорят, что это **гороциклический поток**.

Дополнительно рассмотрим уравнение (32) $$(E)$$ где $$B$$ представляет собой ротационную $$g$$-инвариантная симметрия вокруг фиксированной точки $$q_0$$. Затем с $$\Omega^0_t$$ набор непрерывных сокращаемых петель:

```math
\mu_t(\Omega_t^0) = \frac{vol(M)}{2\pi t}\int_0^\infty \frac{e^{-\rho^2/2t\ -t\kappa/8}}{\sqrt{2\pi t}\ \kappa\sinh \sqrt {\kappa}\rho/2}\ \rho d\rho
```

Поскольку это уравнение является аналитическим в $$\kappa$$Мы можем видеть, что аналитическое продолжение $$\kappa \rightarrow -\kappa$$ преобразует это выражение из $$\sinh $$ по $$ \sin $$ в этом случае мы имеем правильное уравнение для *призрачной 2-сферы* с постоянной положительной гауссовой кривизной $$|\kappa|$$.

Другими словами, мы получили 2-мерную формулу трассировки Сельберга с помощью вероятности и геометрии, **вместо обычного Гармонического анализа на симметричных пространствах**.

##### Пример нетривиальной кривизны

Для плавного диффеоморфизма реального значения $$h:\Reals\rightarrow\Reals$$ со $$h(0)=0$$, пусть $$ds^2 = (1+h^2(y)) dx^2 + 2h(y) dx\odot dy + dy^2$$. Эта метрика имеет отрицательную кривизну Гаусса $$-(\kappa(y)=\frac{d^2}{dy^2}h^2(y)/2)$$, которая только постоянна, когда $$h(y)$$ является родственным; и $$\det(ds^2)= 1$$. Затем с $$\hat{\mathcal B}(x,y) = x$$, мы видим

```math

\mu_t(\Omega_t^\mathcal B) = \frac{e^{-\rho^2/2t}}{2\pi t}\int_{-\infty}^\infty\frac{\rho_0}{2 \sinh \sqrt{\kappa(y)}\rho/2} \int_{\Omega_t^\mathcal B(0,y)}e^{-\int_0^t\kappa(y(s))ds/8}d(\mu_t|\mathcal B^\perp)/dy \ dy

```
Если взять $$h(y) := y\sqrt{2y^2/3 + \kappa(0)} \implies \kappa(y) = 4 y^2 + \kappa(0) \gt 0$$, затем уравнение (32)  $$(E)$$ предсказывает, что

```math

\mu_t(\Omega_t^\mathcal B) = \frac{e^{-\rho^2/2t -t\kappa(0)/8}}{\sqrt{2\pi t \cosh t}}\int_0^\infty\frac{\rho_0e^{-y^2/2t}}{\sqrt{2\pi t}\sinh \sqrt{4y^2+\kappa(0)}\rho/2 }\ dy

```

который взрывается в $$0$$Как и ожидалось, если мы $$\kappa(0) = 0$$. Кроме того, как $$t\rightarrow 0$$, интеграл также имеет правильное асимптотическое поведение (скопление вокруг постоянной кривизны) $$-\kappa(0)$$ ситуация, как если бы соответствующий компонент формулы трассировки Сельберга служил ее полуклассическим пределом, как $$t\rightarrow 0$$).

### Наблюдения, уравнение эволюции и Lie Algebras

### Действие линейного пакета Черн-Симонса

### Заметки о динамике общей теории относительности

- внешняя ось времени искусственная, так как `время` встраивается в геометрию самого 4-мерного многообразия.
Это означает, что операторы эволюции'имеет значение; имеет значение только стационарное уравнение Шредингера.
- интегральная формулировка пути взрывается из-за `-1` подпись Лоренцианской метрики в `время` направление. $$\det{g}$$ является отрицательным, и преобразование Фурье на каждом котангентном пучке's-волокно также бесконечно в этом направлении, если мы не используем аналитическое продолжение (также известное как вращение Вика на внутреннем `время`).

<!-- $Date$ $Author$ $Revision$ -->
