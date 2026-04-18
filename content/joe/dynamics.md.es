---
archived: ~
categories: Matemáticas, Dinámica
dependencies: '*.md.es'
keywords: dinámica, mecánica, cuántica, clásica, núcleo de calor, campo de matanza,
  feynman kac, cameron martin
published: ~
status: desorden
title: Dinámica, clásica y cuántica
---

<div class="right">

![QM](dynamics.page/dynamics)

</div>

{# lede #}Geometría diferencial'enfoque ss{# lede #}

Prerequisites:

1. Familiaridad con Stokes' Teorema sobre álgebras de tensores exteriores diferenciales de $$n$$colectores dimensionales $$M$$.

2. Exposición a la Geometría Riemanniana básica, especialmente en coordenadas locales, incluyendo la Notación Einstein/PAIN.

3. Interés en los Sistemas Dinámicos Suaves y Estocásticos, incluyendo Brownian Motion y Martingale Theory.

[TOC]

## Dinámica clásica

### Hamilton-Jacobi / Formalismo de Lagrange

### La mecánica de los paquetes de Cotangent

Definir el suave **Hamiltoniano** $$\mathcal H:T_q^{\*}M\oplus\Reals\rightarrow\Reals$$ como $$\mathcal H(p,q,t)$$.

#### Permitir $$\theta := p\ dq - \mathcal H(p,q,t)\ dt\in T^\*(T^\*M\oplus\Reals)$$.

Definir $$\mathcal S_\mathcal H(\gamma) := \int_\gamma \theta$$ para facilitar $$\gamma:[0,t]\rightarrow T^{\*}M\oplus\Reals$$.

Si dos de estas curvas $$\gamma_1, \gamma_2$$ tienen exactamente los mismos puntos finales de límite, defina **resta** por composición inversa, por lo que $$\gamma_1 - \gamma_2$$ es un bucle cerrado definido por el recorrido $$\gamma_1$$ hacia adelante, y $$\gamma_2$$ a la inversa. Permitir $$S$$ ser cualquier superficie de 2 dimensiones delimitada por este circuito cerrado: $$\gamma_1 - \gamma_2 = \partial S$$. Así

```math
\begin{aligned}
\mathcal S_\mathcal H(\gamma_1) - \mathcal S_\mathcal H(\gamma_2) &= \int_{\gamma_1 - \gamma_2}\theta \\
&= \int_{\partial S}\theta\\
&= \int_S d\theta
\end{aligned}
```
por Stokes' Teorema.

Independientemente de si tal superficie $$S$$ existe, pues la acción $$\mathcal S_\mathcal H$$ depender únicamente de los puntos finales de $$\gamma$$, tenemos que tener necesariamente la condición de primer orden que $$d\theta$$ desaparecer en $$\gamma$$.

#### Permitir $$\omega_\mathcal H := d\theta = dp\wedge dq - d\mathcal H \wedge dt\in\bigwedge^2T^\*(T^\*M\oplus\Reals)$$.

```math
\begin{aligned}
\omega_\mathcal H|_\gamma &= \dot{p}\ dt\wedge dq + \dot{q}\ dp\wedge dt - \frac{\partial \mathcal H}{\partial p}dp\wedge dt - \frac{\partial \mathcal H}{\partial q}dq\wedge dt \\
        &= (-\dot{p}_i - \frac{\partial \mathcal H}{\partial q^i}) dq^i \wedge dt+  (\dot{q}^i - \frac{\partial \mathcal H}{\partial p_i}) dp_i\wedge dt
\end{aligned}
```

#### $$\therefore \omega_\mathcal H|_\gamma = 0 \iff \gamma(t)$$ satisface las ecuaciones de Hamilton-Jacobi
```math
\begin{aligned}
\dot p &= -\frac{\partial \mathcal H}{\partial q} \\
\dot q &= \ \ \ \frac{\partial \mathcal H}{\partial p}
\end{aligned}
```

$$\iff \gamma:[0,t]\rightarrow T^*M\oplus\R  $$ es una curva *estacionaria* para la acción $$\mathcal S_\mathcal H(\gamma)=\int_\gamma \theta$$.

#### Transformación de leyenda
Cuándo $$\mathcal H$$ es convexa en $$p$$, $$\forall \dot{q} \in T_q M\ \exists !\ p=p_{max}(\dot q)$$  satisfactorio $$\dot{q} = \frac{\partial \mathcal H}{\partial p}(p_{max},q,t)$$. Esto define la (involutiva) transformación Legendre $$\mathcal L$$ de $$\mathcal H$$:
```math
\begin{aligned}
\mathcal{L}(\dot q,q,t) &:= \max_p p\dot{q} - \mathcal H(p,q,t) \\&= p_{max}(\dot q)\dot q - \mathcal H(p_{max}(\dot q),q,t) \\
\mathcal S_\mathcal{L}(\pi(\gamma)) &= \int_{\pi(\gamma)} \mathcal{L}(\dot q, q, t)\ dt
\end{aligned}
```
es la *representación de la Acción*, donde $$\pi: T^*M\oplus\Reals \rightarrow M\oplus\Reals$$ es el (olvidable) operador de proyección de fibra $$(p,q,t)\mapsto (q,t)$$.

#### Principio de la menor acción

El principio de la acción mínima simplemente afirma que la dinámica clásica de la naturaleza misma tiende a seleccionar trayectorias que minimicen $$\mathcal S_\mathcal{L}$$.

En general, esta reclamación es **falsa**. Pero las curvas fijas de $$\mathcal S_\mathcal H$$ Siempre son interesantes de descubrir, y son idénticas a las curvas que dejan $$\mathcal S_\mathcal{L}$$ inmóvil.  Localmente, **las ecuaciones diferenciales para esas trayectorias estacionarias son idénticas**, y así $$\mathcal S_\mathcal H = \mathcal S_\mathcal{L}$$ en esas curvas.  En la Formulación Lagrangiana, estas ecuaciones covariantes se conocen como las **Ecuaciones Euler-Lagrange** $$(d\mathcal{L}\wedge dt)|_{\pi(\gamma)} = 0:$$

```math
\frac{\partial \mathcal L}{\partial q} = \frac{d}{dt}\frac{\partial \mathcal L}{\partial \dot q}
```

que es un ODE de segundo orden en $$t \mapsto q(t)$$así ha $$2\dim M+1$$ condiciones iniciales $$(\dot q_0, q_0, t_0)$$Igual que con la contravariante Hamilton-Jacobi Equations. Por el Teorema de Picard-Lindelöf, estas ecuaciones tienen soluciones locales únicas cuando se enmarcan como un problema de valor incial.

Sin embargo, un aspecto interesante de $$\mathcal S_\mathcal L(\pi\circ\gamma)$$ se revela cuando podemos definir de forma única $$\pi\circ\gamma$$ basadas implícitamente en los puntos finales $$(q_0, t_0)$$ y $$(q_f, t_f)$$, por lo que necesitamos *transformar este problema de valor límite en un problema de valor inicial*. En otras palabras, debemos resolver por un $$\dot q_0$$ que alcanzará el objetivo $$(q_f, t_f)$$ con una curva estacionaria (única) $$\pi\circ\gamma$$ que resuelve las ecuaciones de Euler-Lagrange. De esta manera podemos pensar en $$\mathcal S = \mathcal S(q_0,t_0, q_f, t_f)$$ como una **función de transición**, suponiendo que no dependa de la elección de $$\pi\circ\gamma$$, y tal $$\gamma$$ En realidad existe en el Espacio de Solución de curvas lisas que conectan el par de puntos de transición.  A nivel local, esta es una aplicación del Teorema de la Función Implícita, pero a nivel mundial, puede haber obstrucciones topológicas para construir cualquiera de estas funciones. $$\gamma$$.

Permitir'dar un paso atrás y definir algo más simple: un "horizontal" elevación $$\mathcal A=\dot q\oplus \pi^{-1}:T_{q} M\oplus \Reals \rightarrow T_{q}^{\*}M\oplus \Reals$$ mediante asignación

```math
(\dot q, q,t)\mapsto (p_{max}(\dot q), q, t)\ .
```
Ahora tenemos, para **cualquiera** "proyectado" Curva suave (no solo las estacionarias) $$\tilde\gamma:[0,t]\rightarrow M\oplus\R$$:

```math
\begin{aligned}

\mathcal S_\mathcal{L}(\tilde\gamma) &= \mathcal S_\mathcal H(\mathcal A\circ \tilde\gamma) \ .
\end{aligned}
```

Note: la convexidad de $$\mathcal H$$ garantiza que haya un único $$p_{max}(0)$$ en cualquier curva estacionaria $$\dot q = 0$$. La red de esto es que las curvas estacionarias $$\gamma$$ *no tienen movimiento sostenido contenido dentro de una fibra de *$$\pi^{-1}$$, por lo que sin pérdida de generalidad simplemente consideramos no estacionario $$\tilde \gamma$$ y elevarlos con $$\mathcal A$$ como una clase adecuada de curvas para "integrar en" más adelante.

#### Forma cuadrática mágica, parte 1

Cuándo $$\mathcal H(p,q,t)$$'s $$p$$La dependencia (también conocida como el componente de energía cinética) es una forma cuadrática simétrica no degenerada, podemos representarla como una métrica pseudo-riemanniana. $$[g^{ij}]: M\oplus\Reals\rightarrow TM\odot TM$$ con inversa $$[g_{ij}]: M\oplus\Reals\rightarrow T^{\*}M\odot T^{\*}M$$. La Transformación Legendre en coordenadas locales las relaciona así:

```math
\begin{aligned}
\mathcal H^\mathcal V(p,q,t) &= \frac{1}{2}\ g^{ij}(q,t)\ p_ip_j + \mathcal V(q,t) \implies\\
\mathcal{L}^\mathcal V(q,\dot q, t) &= \frac{1}{2}\ g_{ij}(q,t)\dot{q}^i\dot{q}^j - \mathcal V(q,t)\ .
\end{aligned}
```

La conexión Levi-Civita'Símbolos de Christoffel para $$g$$ son simplemente definidos por la Fórmula Koszul

```math
\begin{aligned}
\Gamma^k_{ij} &= \frac{1}{2} g^{ka}(\partial_i g_{ja} + \partial_j g_{ia} - \partial_a g_{ij})\\
\Gamma_k^{ij} &= \frac{1}{2}g_{ka}(\partial^ig^{ja} + \partial^j g^{ia} - \partial^ag^{ij}).

\end{aligned}
```
con $$\partial_i := \frac{\partial}{\partial q^i}$$ y $$\partial^i := g^{ij}\partial_j$$. Derivado de covariante asociado $$\nabla$$ en coordenadas locales es
```math
\begin{aligned}
\nabla_{a^i\partial_i} b^j\partial_j &=d b^j(a^i\partial_i)\partial_j + \Gamma_{ij}^k a^ib ^j\partial_k\ ,\text{ or}\\
\nabla_{\partial_i}\partial_j &= \Gamma_{ij}^k\partial_k \text{ , and contravariantly}\\
\nabla_{\partial^i}\partial^j &= \Gamma^{ij}_k\partial^k \text{, so} \\
\nabla &= d + \Gamma
\end{aligned}
```

para todos los campos tensores. En particular $$\Gamma$$ es simétrico en $$(i, j)$$; y  $$\nabla [g_{ij}] = \nabla [g^{ij}] = 0$$.

Anecdóticamente, el Tensor de Curvatura Riemann-Christoffel es

```math
\mathcal R^{\rho }{}_{\sigma \mu \nu }=\partial _{\mu }\Gamma ^{\rho }{}_{\nu \sigma }-\partial _{\nu }\Gamma ^{\rho }{}_{\mu \sigma }+\Gamma ^{\rho }{}_{\mu \lambda }\Gamma ^{\lambda }{}_{\nu \sigma }-\Gamma ^{\rho }{}_{\nu \lambda }\Gamma ^{\lambda }{}_{\mu \sigma }
```

##### Multiplicadores de Lagrange en $$\mathcal H$$ como traducciones infinitesimales en $$\mathcal L$$

Además, si $$\mathcal H = \mathcal H\_B$$ tiene un componente de campo de velocidad adicional $$\mathcal B(q,t)\in T_qM$$, es decir, una función lineal sobre $$p\in T^{\*}_qM$$, podemos **completar el cuadrado** y volver a calcular $$\mathcal{L}_B$$ en términos de $$\mathcal L$$:

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

Aquí vemos la conexión entre el Multiplicador Lagrange $$\mathcal B$$ activado $$\mathcal H$$ y su expresión equivalente como una deriva infinitesimal en $$\mathcal L$$. contextualizaremos $$\mathcal B$$ en una variedad de formas útiles en el resto. **Ambas expresiones $$(A)$$ y $$(B)$$ para $$\mathcal{L}_\mathcal B$$ en ecuación <span class="eqno"></span> son críticos**.

##### La elevación horizontal $$\mathcal A$$

Desde $$\frac{\partial \mathcal H}{\partial p_i}(p,q,t) = g^{ij}p_j \implies \frac{\partial^2\mathcal H}{\partial p_i \partial p_j} = g^{ij}$$, podemos calcular la elevación horizontal explícitamente

```math
\begin{aligned}
{p_{max}}_i &= g_{ij}\dot q^j = \frac{\partial \mathcal L}{\partial \dot q_i}\implies \\
\mathcal A(\dot q, q, t) &= ([g] \dot q, q, t)\ .
\end{aligned}
```

Cuándo $$g^{ij}$$ es positiva-definida, también lo es su inversa, lo que implica el componente energético cinético de $$\mathcal S_\mathcal L(\tilde\gamma) = \mathcal S_\mathcal H(\mathcal A\circ\tilde\gamma)$$ se **minimiza** localmente en curvas estacionarias que implican métricas reales de Riemann.

Por ecuación (12) $$(A), (B)$$, las ecuaciones de Euler-Lagrange para $$\mathcal L^\mathcal V_\mathcal B$$ convertirse en:

```math
\begin{aligned}

\frac{1}{2}\partial_i g_{jk}(\dot q^j-\mathcal B^j)(\dot q^k -\mathcal B^k)-\partial_i \mathcal V &= \frac{d}{dt}g_{ij}(q,t)(\dot q^j - \mathcal B^j) = {\dot p^\mathcal B_{max}}_i\ ,\\

- \partial^i \mathcal V &= \frac{1}{2} (\partial^i   g_{jk})(\dot q^j-\mathcal B^j) (\dot q^k-\mathcal B^k) - g_{jk}(\partial^i\mathcal B^j)(\dot q^k - \mathcal B^k) + \frac{d}{dt} (\dot q^i - B^i) + g^{ij}\frac{\partial g_{jk}}{\partial t}(\dot q^k -\mathcal B^k)\\

-\nabla\mathcal V(q,t)&\begin{equation}\tag{C}=\nabla_{\dot q-\mathcal B} (\dot q - \mathcal B) -\partial_t \mathcal B +(\partial_t [\log g])(\dot q-\mathcal B) \ .\ \ \ \ \ \ \ \ \ \end{equation}
\end{aligned}
```

Estos son exactamente **Newton'Leyes del Movimiento** $$F/m = a$$ con $$\partial_t := \frac{\partial}{\partial t}$$ sujeto a una energía potencial $$\mathcal V$$ y campo de velocidad $$\mathcal B$$, en un entorno dependiente del tiempo.

### Geometría sintética

Un colector simbólico $$N$$ es una reducción del haz contangente $$T^\*(M\oplus \Reals)$$, con un formato 2 cerrado y no degenerado $$\omega \in \bigwedge^2T^\*N$$. $$N$$-isomorfismos en esta categoría preservar $$\omega$$.

Necesario $$d\omega = 0$$ es una condición de integración local para un potencial $$\theta$$ satisfactorio $$d\theta = \omega$$, pero puede haber limitaciones topológicas en $$\omega$$'integrabilidad global.

Lo que nos importa para la dinámica es la acción $$\mathcal S(\gamma) = \int_\gamma \theta$$, por lo que nos centramos en paquetes cotangentes en este artículo. Aquí, una adecuada $$\theta$$ es trivial clasificar en términos de una función $$\mathcal H$$ activado $$N$$. Por supuesto, un Wick-rotated $$\theta$$ sobre la cobertura universal de $$N$$ A veces se puede perfeccionar con las condiciones de integrabilidad en su *fase *(es decir, pensar en $$\theta$$ como tener valores en un paquete de líneas complejas $$N$$, y centrarse en su parte imaginaria), con el fin de proporcionar valores consistentes de $$e^\mathcal S$$ que descienden a $$N$$.

#### La forma natural del volumen sintético $$\omega^n/n!$$

#### Grupos de Bracket y Lie de Poisson

## Dinámica cuántica

Si la Dinámica Clásica trata de encontrar curvas que satisfagan el Principio de la Acción Menor, la Dinámica Cuántica trata sobre lo exponencial de la Acción a medida que integramos su valor en toda una clase de curvas (típicamente) no estacionarias, con una noción limitante adecuada de una "Medida de Lebesgue dimensional infinita" $$\mathcal D_{dt}\tilde \gamma$$,

En realidad, sólo el gaussiano "acoplamiento"

```math
\int_{\set{\tilde \gamma}} e^{-\mathcal S_{\mathcal L_\mathcal B^{\mathcal V}}(\gamma)}\mathcal D_{dt}\tilde \gamma
```

necesita interpretación como* una medida (de valor complejo) en algunos $$\set{\tilde \gamma}$$*, pero esta construcción, como una serie de ejemplos cada vez más sofisticados, será nuestro enfoque en el futuro.  Cualquiera que sea el resultado, estará claro que el valor real de $$\mathcal S$$ en esas curvas será $$\infty$$, para *cancelar la $$\infty$$* del "Normalizador de división de tiempo" inherente a la $$dt$$ elementos de $$\mathcal D_{dt}\tilde \gamma$$. Hay varias opciones involucradas en la construcción de las aproximaciones que impactan en la convergencia de las aproximaciones, pero las eludiremos todas al enfocarnos en la invarianza geométrica de los casos trivialmente computables.

### El valor de la acción importa

No para ponerle un punto demasiado fino, pero la mecánica clásica define la acción como un medio para un fin.  Nunca se preocupó por llegar a ningún entendimiento de lo que su valor real **significa**.  Solo lo usamos para construir las ecuaciones diferenciales necesarias para que podamos pensar en $$\mathcal S$$ como función de transición entre sus puntos finales a través de curvas estacionarias*.  El requisito estacionario nos permitió interpretar  $$\mathcal S$$ como una expresión invariante del camino, pero nunca nos preocupamos por su valor real. Por eso $$\theta \mapsto \theta + df $$ para algunos $$f \in C^\infty(T^\*M)$$ Se considera una transformación invariante del indicador: las ecuaciones clásicas del movimiento permanecen sin cambios por $$f$$.

¡Lo hacemos en la dinámica cuántica!

### Cuantización Integral de Ruta Natural (Covariante).

Al completar el cuadrado y la invarianza de traducción de la Medida de Lebesgue (en una fibra de $$T^\*M$$), recuerde que:

```math
\hbar^n\int_{\Reals^n} e^{ p_i\dot q^i\Delta t - \frac{1}{2}\hbar^2 g^{ij}p_ip_j\Delta t}dp_1\dots dp_n = \hbar^n\int_{\Reals^n} e^{-\frac{1}{2}\hbar^2 g^{ij}(p_i - g_{ik}\dot q^k/\hbar)(p_j - g_{jk}\dot q^k/\hbar)\Delta t} dp_1\dots dp_n \cdot e^{\frac{1}{2\hbar^2}g_{ij}\dot q^i\dot q^j\Delta t} =
\frac{e^{\frac{1}{2\hbar^2}g_{ij}\dot q^i\dot q^j\Delta t}}{\sqrt{(2\pi\Delta t)^n \det g^{ij}}}
```
Por lo tanto, las expresiones **Feynman Path Integral** son moralmente equivalentes (aunque formalmente infinitas) en el caso de energía cinética cuadrática:

```math
\begin{aligned}
\int_{\set{\gamma}} e^{\mathcal S_{\mathcal H^\mathcal V_\mathcal B} (\gamma)} \mathcal D_{dt}\gamma &\approx \int_{\Reals^{2n}} e^{(p\dot q - \mathcal H^\mathcal V_\mathcal B(p,q,t))\Delta t}\omega_0^n/n!\\
&= \frac{1}{\sqrt{(2\pi\Delta t)^n}}\int_{\Reals^n}e^{\mathcal L^{\mathcal V}_\mathcal B(\dot q, q, t)\Delta t}\sqrt{\det g_{ij}}\  dq^1...dq^n\\
&\approx \int_{\set{\tilde \gamma}} e^{\mathcal S_{\mathcal L^{\mathcal V}_\mathcal B}(\tilde \gamma)} \mathcal D_{dt}\tilde \gamma \ .
 \end{aligned}
```

Por lo tanto, con una **rotación de mecha y una escala de vectores por la constante de Planck** $$\hbar = h/2\pi$$, envío $$dt\mapsto \hbar/i\ dt, \ p\mapsto \hbar p, \ \dot q\mapsto \dot q/\hbar,\  \mathcal B\mapsto \mathcal B/\hbar$$:

```math
\begin{aligned}
\int_{\set{\gamma}}e^{\hbar/i\ \mathcal S_{\mathcal H_{\mathcal B/\hbar}^{\mathcal V}(\hbar p, q, t)}(\gamma)}\mathcal D_{\hbar/i\ dt}\gamma &\approx \int_{\set{\tilde\gamma}} e^{\hbar/i \ \mathcal S_{\mathcal L_{\mathcal B/\hbar}^{\mathcal V}(\dot q/\hbar,q, t)}(\tilde \gamma)}\mathcal D_{\hbar/i\ dt}\tilde\gamma\\
&= \int_{\set{\tilde \gamma}}e^{-\frac{i}{\hbar}\mathcal S_{\mathcal L^{\hbar^2 \mathcal V}_{\mathcal B}(\dot q, q, t)}(\tilde \gamma)}\mathcal D_{\hbar/i\ dt}\tilde\gamma\ .

\end{aligned}
```

Así que cuando queremos aproximarnos al lado derecho de la ecuación <span class="eqno"></span> utilizando el método de la fase estacionaria (también conocido como el límite semi-clásico) $$\hbar\downarrow 0$$), debemos recordar resolver las ecuaciones de Euler-Lagrange (14) $$(C)$$ con $$\mathcal V \mapsto \hbar^2 \mathcal V\approx 0$$.

### Cuantificación de Schrödinger

```math
\begin{aligned}
\mathcal H(p,q) &\ = \mathcal T(p,q) + \mathcal V(q)\ \text {, where } \mathcal T = \frac{1}{2}g^{ij}(q)p_ip_j \implies \\

e^{-it/\hbar \hat{\mathcal H}}\ket{\psi} &:= e^{-it/\hbar(-\frac{\hbar^2}{2} \Delta_M + \mathcal V)} \ket{\psi} \implies \\

i\hbar \frac{d}{dt}\ket{\psi} &\ = -\frac{\hbar ^2}{2}\Delta_M \ket{\psi} + \mathcal V\ket{\psi}

\end{aligned}
```
($$\Delta_M$$ es el operador de Laplace-Beltrami para $$g$$) como operadores diferenciales lineales. El punto es que la solución es **analítica** en $$t$$ en el medio plano superior, y $$dt\mapsto i/\hbar\ dt,\ p\mapsto p/\hbar $$ es su ecuación de difusión sin rotación Wick:

```math
\frac{d}{dt}e^{-t\hat{\mathcal H}}\ket{\psi} = (\frac{1}{2}\Delta_M - \mathcal V) e^{-t\hat{\mathcal H}}\ket{\psi} \ .

```

Esta es una forma susceptible al Análisis Estocástico basado en senderos de muestreo, y nos da una manera significativa de alinear los integrales de senderos de Feynman con la continuación analítica de soluciones a ecuaciones de difusión elíptica a todo su medio plano derecho.  En esencia, tendremos una "medida teórica" mapa analítico desde el medio plano derecho a un conjunto de operadores lineales delimitados en $$\mathscr H = L^2(M,g)$$y la ecuación de Schrödinger'El operador de la evolución unitaria es su valor límite en la línea imaginaria $$it\hbar\ ,t\in\Reals$$. Mientras que ayuda a entender von-Neumann'Teorema espectral para la descomposición armónica de los operadores de autoconjuntos cerrados y sin límites (como $$\Delta_M$$) el $$\mathscr H$$que'No es necesario para el resto de este artículo.

En otras palabras, basta con estudiar la dinámica de la Ecuación (17), una vez que hayamos aclarado las sutilezas que intervienen en una definición explícita de su sugerente camino de expresión integral.

En lugar de reinventar el cálculo semimartingale de Itô/Stratonovich/Malliavin SDE de tela entera, vamos a proceder con una serie de ejemplos simples (métricos planos) que nos llevarán a la teoría general.

Al final del día, queremos que la Cuantización Feynman Path-Integral coincida con la Cuantización de Schrödinger, o al menos para comprender la **desviación**. En particular, necesitamos la aproximación semiclásica para generar la PDE de Schrödinger. $$o(t)$$ como $$t\downarrow 0$$.

Como resultado, todavía hay controversia sobre el $$\mathcal V$$ término cuando la métrica no es plana. Exploramos este asunto en su totalidad a continuación, ya que se refiere a las fórmulas de suma conocidas (como Selberg) para métricas no planas.

### Fórmula de Feynman-Kac

Con $$V \in C^\infty(M)$$, por la Fórmula Baker-Campbell-Hausdorff:
```math
e^{-it/\hbar -\Delta^\hbar_M/2} e^{-it/\hbar V} = e^{-it/\hbar(-\Delta^\hbar_M /2 + V - it/4\hbar [\Delta^\hbar_M,V] + O(t^2))}
```

La Fórmula Feynman-Kac sigue la formulación integral del camino para Brownian Motion en el espacio euclidiano. El resultado de esto es que podemos centrarnos en la $$\mathcal V = 0$$ caso, así que vamos a seguir adelante.

#### La Isometría de Transporte Paralelo $$\hat\Gamma$$

Toma cualquier vector en $$v \in T_qM$$. Transporte paralelo $$\hat\Gamma_t(\gamma)v \in T_{\gamma(t)}M$$ es el vector que obtiene resolviendo el ODE lineal de primer orden:

```math
\begin{aligned}
v(0) &= v \\
\nabla_{\dot \gamma(t)}\dot v &= 0
\end{aligned}
```

En particular $$\nabla_{\dot \gamma}\hat\Gamma_t(\gamma) = 0$$y el tensor de curvatura $$\mathcal R(X,Y) = [\nabla_X,\nabla_Y] - \nabla_{[X,Y]}$$ mide la dependencia de primer orden de $$\hat \Gamma$$ sobre la elección de la curva $$\gamma$$ conectar los puntos finales. $$\mathcal R = 0 \iff \hat\Gamma_t$$ no depende de $$\gamma$$.

En otras palabras, si tratamos de descomponer el transporte paralelo como movimiento infintesimal a lo largo de $$\mathcal B^\perp$$ seguido de un movimiento infintitesimal a lo largo de $$\mathcal B$$, las ecuaciones serían:
```math
\begin{aligned}
\hat\Gamma(\gamma) &= \hat\Gamma(\gamma|_\mathcal B)\hat\Gamma(\gamma|_{\mathcal B^\perp}) - \frac{1}{2}\mathcal R(\dot{\gamma}|_\mathcal B, \dot{\gamma}|_{\mathcal B^\perp})dt + O(dt^2) \ \\
\nabla_{\dot \gamma}\hat\Gamma(\gamma) &= \nabla_{\dot \gamma|_\mathcal B}\hat\Gamma(\gamma|_{\mathcal B^\perp}) + \nabla_{\dot \gamma|{\mathcal B^\perp}}\hat\Gamma(\gamma|_{\mathcal B})  - \frac{1}{2}\mathcal R(\dot\gamma|_\mathcal B,\dot{\gamma}|_{\mathcal B^\perp}) = 0
\end{aligned}
```

#### Mecánica semiclásica

##### Los asintóticos semiclásicos son una solución exacta en los colectores planos

El lado derecho de la ecuación (16) es la formulación precisa del núcleo de calor para un coeficiente constante (en $$q$$ métricas $$g_{ij}$$. Cada colector plano'la cubierta universal es isométrica al espacio euclidiano, donde $$g_{ij} = \delta_{i-j}$$.

**Es** el núcleo de calor estándar $$n$$-Dimensional Brownian Motion.

Permitir's aclarar esto, recuerde la *función de transición* en este caso: $$\mathcal S_\mathcal L(q_0,t_0, q_f, t_f) = \rho^2(q_0, q_f)/2(t_f - t_i)$$donde $$\rho$$ es la distancia de Riemann entre $$q_0$$ y $$q_f$$.
dejar $$||q||^2 = q\cdot q$$ ser la plaza de la norma euclidiana de $$q$$:

```math
\begin{aligned}
RHS^{16}_t(q_0,q_f) &:= \frac{e^{-\mathcal S_\mathcal L(q_0, 0, q_f, t)}}{\sqrt{(2 \pi t)^n}} \sqrt{g(q_f)}\\
\mathcal R=0 \implies \\
&\ = \frac{e^{\frac{-||q_f - q_i||^2}{2t}}}{\sqrt{(2\pi t)^n}} \\
                   &\ = \int_{\Reals ^n}RHS^{16}_{s}(q_i, q)\ RHS^{16}_{t-s}(q, q_f)\ dq^1...dq^n\ \forall s\in (0, t)
\end{aligned}
```

¿Por qué esta última ecuación es verdadera?  Permitir'mire la imagen desde el espacio del camino: tenemos una geodésica de línea recta que conecta $$q_0$$ a $$q_f$$ a tiempo $$t$$, y una geodésica rota que los conecta con el punto de ruptura intermedio que se produce en $$s$$. Efectivamente estamos integrando la geodésica una vez rota mediante el uso de la Fórmula Cameron-Martin para representar la geodésica de línea recta como un $$g$$- campo vectorial invariante $$\mathcal B$$. Luego integramos los deltas de punto de ruptura de esa geodésica ($$\dot q-\mathcal B$$) con un gaussiano centrado para $$\Reals^n$$.

Explícitamente, dado campo vectorial constante $$\mathcal B_t = (q_f - q_0) / t$$, geodésica euclidiana una vez interrumpida son

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

Significativamente, construimos $$\mathcal B_t$$ para que $$\dot q - \mathcal B_t$$ representó una geodésica una vez rota en $$s$$ que comenzó y terminó en $$q_0$$y vimos que esas curvas son esencialmente $$\mathcal N(0,s\wedge t-s)$$ distribuidos. En el resto de este artículo, vamos a descomponer $$\Reals^n=<\mathcal B_t>\oplus \mathcal B_t^\perp$$ e integrar $$<\mathcal B_t>$$.

#### El defecto integral del sendero de curvatura escalar DeWitt en las superficies de Riemann

¿Y si tratáramos de utilizar "sucesivas convoluciones" en la expresión semi-clásica en la ecuación (16) para construir el movimiento browniano en un colector negativamente curvado $$M$$?

Nosotros'd conseguir algo, pero'd ser *casi* Brownian Movimiento en espacios curvos &mdash; Necesitamos mirar a Feynman-Kac por el defecto en su generador infinitesimal. Resulta que habrá un error de función potencial efectivo $$-\frac{1}{6}\bar{\mathcal R}$$donde $$\bar{\mathcal R}$$ Es la curvatura escalar en cada punto. Esto fue descubierto por primera vez por Bryce DeWitt en 1950.'s, y hecho famoso en el papel McKean-Singer de 1972 sobre las asintóticas de corto tiempo de la traza del núcleo de calor, donde este término representa la contribución al Hessiano de *la forma métrica *$$g_{ij}$$ en [coordenadas normales](https://en.wikipedia.org/wiki/Normal_coordinates). Sin embargo, entonces $$\dim = 2$$ caso, cuando se añade todo el potencial correctivo $$\mathcal V = -\frac{1}{6}(\bar{\mathcal R} - \frac{1}{4}\bar{\mathcal R}) = \frac{1}{16}\bar{\mathcal R}$$ al hamiltoniano, que es Dewitt's $$\frac{1}{6}\bar{\mathcal R}$$ Término de forma de volumen *menos* la presencia de un campo de matanza $$\mathcal B$$'s $$\frac{1}{24}\mathcal{Ric}(\mathcal B/||\mathcal B||, \mathcal B/||\mathcal B||)$$ Este factor se elimina de la asintótica semiclásica de Selberg-like Trace Formulae.

Más precisamente, aproximando $$1/2\ \nabla\vert_0\sqrt{g} = - 1/6\ \mathcal{Ric}_{ij}q^i\partial^j + o(||q||) \implies 1/2\ \nabla\cdot\nabla\vert_0 \sqrt{g} = -1/6\ \bar{\mathcal R}(0)$$, vemos que los primeros derivados desaparecen en el origen, por lo que:

```math
\sqrt{(2\pi t)^n}(\frac{1}{2}\Delta_M-\mathcal V)\vert_0 e^{-\mathcal L(\dot q, q, t)}\sqrt{g(q)} = (\frac{1}{2}\Delta_{\Reals^n}\vert_0 e^{-1/2t\ g_{ij}q^iq^j}) - \mathcal V(0) - \frac{1}{6}\ \bar{\mathcal R}(0)
```

que es el término original de Dewitt tal como lo derivó.  Como estamos sesgando en la cuantificación en la presencia de un campo de matanza $$\mathcal B = \frac{\partial}{\partial x^1}$$ , tomamos un término potencial ligeramente modificado:

```math
\sqrt{(2\pi t)^{n}}(\frac{1}{2}\Delta_M-\mathcal V)\vert_{x^1,\vec 0} e^{-\mathcal L_\mathcal B(\dot q, q, t)}\frac{1}{det |I-\mathcal J_\mathcal B|} = (\frac{1}{2}\Delta_{\Reals^n}\vert_{x^1,\vec 0}e^{-x^1x^1/2t}) - \mathcal V(x^1, \vec 0) + \frac{1}{8}\mathcal{Ric}_{11}(x^1, \vec 0).
```

#### La fórmula geométrica de Cameron-Martin para $$g$$-invariante (matando) campos vectoriales $$\mathcal B$$ (también conocido como forma cuadrática mágica, parte 2).

Asumir $$\mathcal B$$ es un $$g$$-invariante (aka [Matando](https://en.wikipedia.org/wiki/Killing_vector_field)) campo vectorial en $$M$$ para el resto de este artículo.

##### Mapa de desarrollo $$\tilde \gamma = \mathscr D_q[\tilde c]$$ para $$\tilde c\in C^\infty([0,t],T_qM)$$.

Resolver para $$\tilde \gamma$$:
```math
\begin{aligned}
\tilde \gamma(0) &= q \\
\dot {\tilde \gamma} &= \hat\Gamma(\tilde \gamma)\dot{\tilde c}\\
\end{aligned}
```

##### $$\tilde c(\tau)=\int_0^\tau\hat\Gamma_s^{-1}(\tilde\gamma)\dot{\tilde\gamma} ds$$ como el inverso del mapa de desarrollo

Noether'El teorema asegura $$d({g^{-1}\mathcal B}) = 0$$, así que $$g^{-1}\mathcal B$$ localmente integrables para $$\hat{\mathcal B}$$, y sus conjuntos de nivel local son ortogonales para $$\mathcal B = \nabla \hat{\mathcal B}$$. Y porque $$\hat \Gamma$$ preserva la métrica, preserva $$\mathcal B$$ y $$\mathcal B^\perp$$:

```math
\begin{aligned}
\\
\dot{c}\cdot\mathcal B &= 0 \implies\\
\dot{\gamma}\cdot \mathcal B &= 0 \implies\\
\frac{d\hat{\mathcal B}}{dt} &= 0\ ,
\end{aligned}
```

así $$\gamma$$ contiene un conjunto de niveles de $$\hat{\mathcal B}$$ siempre que $$c$$ está totalmente contenido en $$\mathcal B^\perp \subset T_qM$$.
Las limitaciones de curvatura en la conmutatividad del transporte paralelo garantizan que $$\gamma(t) \ne q$$ en general. Además,

```math
\begin{aligned}
||\mathcal B_t|| &= \frac{\rho(q_0,q_f)}{t} \implies \\
\tilde{c}(\tau) - c(\tau) &= \frac{t^2}{\rho^2(q_0,q_f)}\mathcal B_t\int_0^\tau \dot{\tilde c} \cdot \mathcal B_t\ ds\\
&= \mathcal B\int_o^\tau\dot{\tilde c}\cdot \mathcal B \ ds\\
&= \mathcal B\cdot \tilde c(\tau)\ \mathcal B\\
&= d\hat{\mathcal B}(\tilde c)\ \mathcal B \ .
\end{aligned}
```

##### Brownian Motion en $$M$$ es la medida Euclidean Wiener sobre $$\mathscr D^{-1}$$

##### La fórmula Cameron Martin para el kernel de calor $$k^{\hat{\mathcal H}}_t(q_0,q_f)$$ en una variedad de curvas negativas $$M$$donde $$\hat{\mathcal H} = -\Delta/2 +\mathcal V$$

Permitir $$\Omega^\mathcal B_t(q)$$ ser el espacio de curvas continuas en $$M$$ originario de $$q$$ y terminando en $$\exp{t\mathcal B}\ q$$y $$\mu_t(\omega)$$ sea una medida global de Wiener sobre $$\omega\in \Omega^\mathcal B_t := \set{\Omega^\mathcal B_t(q): q\in M}$$, con $$E_t^\mathcal B (f|A):=\int_{\Omega^\mathcal B_t} f(\omega) d(\mu_t|A)(\omega)$$ y $$P^\mathcal B_{\mu_t}(A) := \mu_t(A)/\mu_t(\Omega_t^{\mathcal B})\ \forall A\subset\Omega^\mathcal B_t $$ . Ecuación (26) $$(D) \implies$$

```math
\begin{equation}
\tag{E}
k^{\hat{\mathcal H}}_t(q_0,\exp{t\mathcal B_t}\ q_0)\sqrt g(q_0)\ dq = \frac{e^{-\rho^2/2t}}{\sqrt{2 \pi t\det{|I-\mathcal J^{\mathcal B}(q_0)|}}} E^\mathcal B_t({e^{-\int_0^t V(\omega(s))ds\ +\ \int_0^t \bar {\mathcal R}(\omega(s))ds/12\ -\ \int_0^t \mathcal {Ric}(\frac{\mathcal B}{||\mathcal B||},\frac{\mathcal B}{||\mathcal B||})(\omega(s))ds/24}\chi_{\Omega^B_t(q_0)}(\omega)}|d\mathcal B^\perp)d\hat{\mathcal B}(q_0) \ \ \ \ \ \ \
\end{equation}
```

donde $$\rho=||t\mathcal B_t||=dist(q_0,q_f)$$, $$\mathcal J^{\mathcal B}(q_0)$$ es la matriz de monodromía asociada a la foliación en $$M$$ inducido por $$\hat{\mathcal B}$$, a lo largo de la curva $$\tilde \gamma(\lambda) = \exp{\lambda\mathcal B_t}\ (q_0)$$, conexión $$q_0$$ a $$ q_f$$ como $$\lambda$$ va desde $$0$$ a $$t$$. $$\mathcal J^{\mathcal B}$$ no depende de $$t$$; y la restricción de curvatura asegura $$I-\mathcal J^\mathcal B$$ siempre no es degenerado para $$q_0 \neq q_f$$. Sustituyendo $$\mathcal B$$ con $$-\mathcal B$$ revierte los roles de $$q_0$$ y $$q_f$$, así que claramente la expresión es simétrica entre ellos como se esperaba.

Desde $$\mathcal R$$ es constante a lo largo de $$\tilde \gamma$$y $$\gamma$$ *es* una geodésica (hasta la renomalización de la longitud), $$\mathcal J^\mathcal B(q_0)$$ es trivialmente computable en términos de **Campos Jacobi** $$\mathcal J(\lambda)$$ en $$\tilde \gamma$$ que son meramente la solución al coeficiente constante de las EOD lineales de segundo orden, evaluadas después de evolucionar a través del tiempo $$\lambda=t$$.

Prueba de esta ecuación <span class="eqno"></span> será grist para un artículo de preimpresión, no esta encuesta, pero es una aplicación directa de la fórmula Feynman-Kac *aplicada a $$\mathcal V = \frac{1}{12}(\bar{\mathcal R} - \frac{1}{2} \mathcal {Ric}(\mathcal B / ||\mathcal B||, \mathcal B/||\mathcal B||)$$, que es explícitamente computable en ambos lados de la ecuación, ya que todo el cálculo se reduce al caso de curvatura constante en ese punto.

Un buen corolario ocurre en la constante $$\mathcal {Ric}(\frac{\mathcal B}{||\mathcal B||},\frac{\mathcal B}{||\mathcal B||}) = \bar{\mathcal R} / \dim M$$ curvatura gaussiana negativa $$-\kappa$$ caso, donde $$\mathcal B$$ desciende a un $$S^1$$ acción en una superficie de Riemann $$M$$:

```math
\begin{aligned}

\det |I - \mathcal J^\mathcal B| = (2 \kappa\sinh(\sqrt{\kappa}\rho/2))^2 \implies \\

\mu_t(\Omega_t^\mathcal B) = \int_{M/S^1\oplus S^1} k^{-\Delta/2}_t(q,\exp{t\mathcal B}\ q) \sqrt g(q)\ dq &= \frac{e^{-\rho^2/2t}}{\sqrt{2\pi t}} \int_{M/S^1\oplus S^1} \frac{1}{2\kappa(q) \sinh \sqrt{\kappa(q)}\rho/2}E^\mathcal B_t(e^{\int_0^t \bar{\mathcal R}(\omega(s))\ ds/16}{\chi_{\Omega^B_t(q)}(\omega)}|d\mathcal B^\perp)d\hat{\mathcal B}(q)\\

&=\frac{e^{-\rho^2/2t\ -\ t\kappa/8}}{\sqrt{2\pi t}\ 2\kappa\sinh \sqrt {\kappa}\rho/2}\ \int_{\mathcal B^\perp\oplus[0,\rho_0]}P^\mathcal B_{\mu_t}(\Omega_t^\mathcal B(d\hat{\mathcal B})|d\mathcal B^\perp), \ \text{ Bayes}\implies\\

&=\frac{e^{-\rho^2/2t\ -\ t\kappa/8}}{\sqrt{2\pi t}\ 2\kappa\sinh \sqrt {\kappa}\rho/2}\ \int_0^{\rho_0} P_{\mu_t}^\mathcal B(\mathcal B^\perp d\hat{\mathcal B}|\Omega_t^\mathcal B(d\hat{\mathcal B}))\frac{P^\mathcal B_{\mu_t}(\Omega_t^\mathcal B(d\hat{\mathcal B}))}{P^\mathcal B_{\mu_t}(\mathcal B^\perp d\hat{\mathcal B})}d\hat{\mathcal B}\\

&=\frac{e^{-\rho^2/2t\ -t\kappa/8}}{\sqrt{2\pi t}\ 2\kappa\sinh \sqrt {\kappa}\rho/2}\ \rho_0\\

\end{aligned}
```

donde $$\rho = \min_{q\in M}dist(q, \exp t\mathcal B \ q)$$ es la distancia de la órbita más corta recorrida bajo el $$S^1$$ acción, y $$\rho_0$$ es que $$\rho$$ dividida por la multiplicidad de su órbita asociada.  En términos familiares de geometría hiperbólica, $$\mathcal B^\perp$$ son **horociclos** y el $$g$$-invariante $$S^1$$ acción bajo $$\mathcal B$$ Se dice que es el **flujo hormonal**.

Además, considere la ecuación (32) $$(E)$$ donde $$B$$ representa una rotación $$g$$-simetría invariante alrededor de un punto fijo $$q_0$$. Luego con $$\Omega^0_t$$ el conjunto de bucles contractibles continuos:

```math
\mu_t(\Omega_t^0) = \frac{vol(M)}{2\pi t}\int_0^\infty \frac{e^{-\rho^2/2t\ -t\kappa/8}}{\sqrt{2\pi t}\ \kappa\sinh \sqrt {\kappa}\rho/2}\ \rho d\rho
```

Como esta ecuación es analítica en $$\kappa$$, podemos ver que la continuación analítica de $$\kappa \rightarrow -\kappa$$ transforma esta expresión de $$\sinh $$ a $$ \sin $$ en cuyo caso tenemos la ecuación correcta para una *esfera fantasma 2* con curvatura gaussiana positiva constante $$|\kappa|$$.

En otras palabras, hemos vuelto a derivar la Fórmula de Rastreo Selberg de 2 dimensiones a través de la Probabilidad y la Geometría, **en lugar del Análisis Armónico habitual en Espacios Simétricos**.

##### Ejemplo de curvatura no trivial

Para un diffeomorfismo suave de valor real $$h:\Reals\rightarrow\Reals$$ con $$h(0)=0$$, vamos $$ds^2 = (1+h^2(y)) dx^2 + 2h(y) dx\odot dy + dy^2$$. Esta métrica tiene curvatura gaussiana negativa $$-(\kappa(y)=\frac{d^2}{dy^2}h^2(y)/2)$$que sólo es constante cuando $$h(y)$$ es afín; y $$\det(ds^2)= 1$$. Luego con $$\hat{\mathcal B}(x,y) = x$$, vemos que

```math

\mu_t(\Omega_t^\mathcal B) = \frac{e^{-\rho^2/2t}}{2\pi t}\int_{-\infty}^\infty\frac{\rho_0}{2 \sinh \sqrt{\kappa(y)}\rho/2} \int_{\Omega_t^\mathcal B(0,y)}e^{-\int_0^t\kappa(y(s))ds/8}d(\mu_t|\mathcal B^\perp)/dy \ dy

```
Si tomamos $$h(y) := y\sqrt{2y^2/3 + \kappa(0)} \implies \kappa(y) = 4 y^2 + \kappa(0) \gt 0$$, luego Ecuación (32)  $$(E)$$ predice que

```math

\mu_t(\Omega_t^\mathcal B) = \frac{e^{-\rho^2/2t -t\kappa(0)/8}}{\sqrt{2\pi t \cosh t}}\int_0^\infty\frac{\rho_0e^{-y^2/2t}}{\sqrt{2\pi t}\sinh \sqrt{4y^2+\kappa(0)}\rho/2 }\ dy

```

que explota en $$0$$, como se esperaba, si también tomamos $$\kappa(0) = 0$$. Además, como $$t\rightarrow 0$$, la integral también tiene el comportamiento asintótico adecuado (que se aglutina alrededor de la curvatura constante $$-\kappa(0)$$ situación como si el componente correspondiente de la Selberg Trace Formula  estuviera sirviendo como su límite semiclásico como $$t\rightarrow 0$$).

### Observables, ecuación de evolución y álgebras de mentira

### Acción de grupo de líneas de Chern-Simons

### Notas sobre la dinámica de la relatividad general

- el eje de tiempo externo es artificial, ya que `hora` está incrustado en la geometría del propio colector de 4 dimensiones.
Esto significa que los operadores de evolución son'Solo importa la ecuación estacionaria de Schrodinger.
- el camino de la formulación integral explota debido a la `-1` firma de la métrica lorenziana en la intrínseca `hora` dirección. $$\det{g}$$ es negativo, y la transformación de Fourier  en cada grupo cotangente'La fibra s también es infinita en esa dirección, a menos que utilicemos la continuación analítica (también conocida como rotación de mecha en la intrínseca). `hora`).

<!-- $Date$ $Author$ $Revision$ -->
