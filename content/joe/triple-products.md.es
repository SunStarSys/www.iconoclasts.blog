---
archived: ~
categories: Matemáticas
dependencies: '*.md.es'
keywords: teoría espectral, geometría riemanniana, problemas inversos, física matemática,
  análisis armónico, teoría de la representación
published: https://dx.doi.org/10.2139/ssrn.4793533
status: verificado=26976
title: Triple producto de funciones propias y geometría espectral
---

<div class="right">
  <img src="../images/lawson6-pod.png" style="width:200px">
  <p style="width:200px;text-align:center;line-height:20px">
  La superficie mínima de Lawson ξ<sub>6,1</sub> proyectada estereográficamente de S<sup>3</sup> a R<sup>3</sup>
  </p>
</div>

[TOC]

## Autor

Joe Schaefer

## Resumen

Uso de técnicas elementales de Análisis Geométrico, Ecuaciones Diferenciales Parciales y Abelian $$C^*$$ Algebras, {# lede #}Descubrimos una invariante geométrica global novedosa pero familiar{# lede #} &mdash; a saber **el conjunto indexado de integrales de productos triples de funciones propias del operador Laplace-Beltrami**, para caracterizar con precisión qué colectores isoespectrales cerrados de Riemannian son isométricos.

## Introducción

Para un colector Riemanniano cerrado $$(M,g)$$, caracterizando su **clase** de colectores isoespectrales no isométricos, es un tipo de problema inverso [[DH11]](#DH11) en Geometría Espectral. Naïvely uno podría especular que esta clase siempre estaría *vacía*. Sin embargo, la literatura académica es rica en construcciones de décadas de antigüedad de pares específicos de contraejemplos: comenzando en 1964 con el par de 16 dimensiones de John Milnor de tori plano isospectral no isométrico. [[JM64]](#JM64), y continuar [[CS92]](#CS92) hacia la caracterización dimensional genérica del tori plano en la tesis doctoral de Alexander Schiemann de 1993 [[AS94]](#AS94) &mdash; repleto de una búsqueda asistida por computadora para el crítico $$\dim = 3$$ caso.  Un estudio moderno de la historia completa del tori plano aparece en [[NRR22]](#NRR22).

A lo largo del camino se produjeron avances perspicaces en espacios de cobertura simétrica no euclidiana más sofisticados; construyendo tales "debates" isoespectrales y no isométricos que involucran tensores de curvatura no triviales (y sus características Euler determinadas por el espectro en la dimensión 2) [[MS67]](#MS67)Un buen ejemplo de este esfuerzo fue Toshikazu Sunada en 1985. [[TS85]](#TS85) La invención de un marco espacial de cobertura de propósito general, que luego desplegó en el mismo trabajo para construir dúos hiperbólicos en las dimensiones 2 y 3.

Para las métricas Riemannian inhomogéneas, Carolyn Gordon descubrió dúos que ni siquiera son isométricos localmente. [[CG93]](#CG93).

El trabajo continúa en muchas áreas relacionadas [[DH11]](#DH11), como la determinación de las características topológicas de la clase de colectores isoespectrales, no isométricos en general (vacío) [[ST80]](#ST80), finito [[AS94]](#AS94), rígido [[GK80]](#GK80), y compacto [[GZ97]](#GZ97)) como un subconjunto de diferentes espacios modulares de las métricas de Riemannian.

Lo que ofrecemos en este artículo es una nueva perspectiva sobre una herramienta familiar: coeficientes de Fourier indexados de productos pareados de funciones propias como una discreta "invariante algebraica/topológica" para complementar la discreta "invariante analítica" existente. &mdash; el espectro no negativo del *operador Laplace-Beltrami* (en lo sucesivo denominado el **Laplaciano**) en $$ℋ = L^2(M,g)$$. Combinados, observamos que el par proporciona una "representación geométrica global discreta" de las clases de isometría de los colectores isoespectrales y cerrados de Riemann.

### Resultados

<br>

<div class="card border-dark">
  <div class="card-header">

#### Teorema

</div>
  <div class="card-body">

Dada una (no decreciente en los valores propios) base ortonormal de las funciones propias $$\set{e^i}_{i=0}^{\infty}$$ para el laplaciano (no negativo) $$\Delta_M$$ activado $$L^2(M,g)$$ asociado a un múltiple Riemanniano cerrado $$(M,g)$$, definir

```math

M^{i,j,k} := \int_M e^i e^j \bar{e^k} \sqrt{g} dx = \bra{e^i e^j}\ket{e^k}

```

Para ser isométrico a $$(M,g)$$, es una condición *necesaria y suficiente* para otro **isoespectral** cerrado múltiple riemanniano para tener una base ortonormal de funciones propias (para su laplaciano) que tanto preserva los valores propios asociados y posee una invariante $$\set{M^{i,j,k}}$$ bajo cada base.

</div>
</div>

<br>

*Simetría* juega un papel importante en casos computacionalmente tracables [[TF17]](#TF17) [[LS18]](#LS18) [[PS94]](#PS94), que se ilustra acertadamente en nuestro tori plano [Ejemplo](#example) abajo. Sin embargo, la fuerza de nuestro enfoque tal vez se haga más evidente en el caso de los colectores con el menor número de simetrías de Riemann, que es el caso genérico que a menudo coincide con los valores propios que son * únicos * (es decir, sin multiplicidad no trivial). En este caso, ofrecemos los siguientes

<br>

<div class="card border-dark">
  <div class="card-header">

#### Conjetura

</div>
  <div class="card-body">

Si cada valor propio tiene multiplicidad $$1$$, dado un par de bases ortormales preservantes de valor propio como se describe en la hipótesis del Teorema, los colectores son isométricos si y solo si el $$\set{M^{i,j,k}}$$ para una base está de acuerdo, hasta el valor absoluto en términos individuales, con la otra base.

</div>
</div>

<br>

La motivación para el estudio de $$\set{M^{i,j,k}}$$ se deriva libremente del estudio del rol del **operador de multiplicación bilineal** $$Y:V\otimes V\rightarrow V((z))$$ en la definición de álgebra de operador de vértice [[FBZ04]](#FBZ04) Teoría de Campo Conformal Chiral. Aquí $$V$$ es el espacio vectorial de los Estados y $$V((z))$$ es el espacio de la serie formal Laurent en $$z$$ con coeficientes en $$V$$. Desde $$V$$ A menudo viene equipado como un espacio Hilbert con una base ortopédica tradicional de la serie Fourier, indexación $$Y$$ utilizando los elementos básicos de Fourier de $$V$$ está un poco más involucrado que $$M^{i,j,k}$$ caso estudiado aquí, pero bastante similar en espíritu. Sin embargo, una comparación detallada está fuera del alcance de este artículo.

Estos resultados se demostraron por primera vez durante una charla similar titulada por el autor en **MSRI** en 1997, pero aparecen aquí en forma publicada por primera vez.

## Preliminares

Ahora con $$M,g,e^i,M^{i,j,k}$$ como antes, porque $$f \in C^\infty(M)$$ y $$i \geq 0$$ Tenga en cuenta que los **coeficientes más cuantiosos**

```math
\begin{aligned}

\hat{f}(i) &:= \int_M f(x)\bar{e^i}(x)\sqrt{g(x)}dx \\

\implies \\

f(x)        &= \sum_{i=0}^{\infty}\hat{f}(i)e^i(x).

\end{aligned}

```

desde $$f$$ es representable de forma única, ya que su **Serie Cuádruple** que converge rápidamente ($$\Delta_M$$-Incrustaciones específicas de Sobolev [[MT13]](#MT13) [[RS75]](#RS75), junto con la Ley Asintótica de Weyl [[HW11]](#HW11), implica que los términos de la suma son $$o(i^{-n})$$ *de manera uniforme en $$x$$* [[LH68]](#LH68), $$\forall n\in\N$$.) Entonces vemos que para $$f_1, f_2 \in C^\infty(M)$$, los coeficientes de Fourier del producto en sentido puntual $$f_1 f_2 \in C^\infty(M)$$ son

```math
\begin{aligned}

\widehat{f_1 f_2}(k) &= \sum_{i,j}^\infty\hat{f_1}(i)\hat{f_2}(j)M^{i,j,k} \\

\implies \\

f_1f_2(x) &= \sum_{i,j,k}\hat{f_1}(i)\hat{f_2}(j)M^{i,j,k}e^k(x) \\

f_1 = f^p_2,\space p \space \in \N \implies \\

\sum_{k}\hat{f_1}(k)e^k(x) &= \sum_{i_1,...,i_p, k}\hat{f_2}(i_1)...\hat{f_2}(i_p)M^{i_1,i_2,i_3}M^{i_2,i_3,i_4}...M^{i_{p-1},i_p,k}e^k(x).

\end{aligned}
```

y así, *críticamente*, cualquier polinomio multivariante $$\weierp \in \Complex[z_1,...,z_l]$$ (en funciones fluidas) **commite** con cualquier preservación del espectro $$\Delta$$-eigenfunction Orthonormal base mapa $$\vec{F}$$ que preserva $$\set{M^{i,j,k}}$$:

```math
\begin{CD}
  C^\infty(M,\space\Complex^l) @>\weierp >> C^\infty(M)\\
   @V\underbrace{\vec{F}\oplus\dots\oplus \vec{F}}_{l\space\text{times}}VV @VV\vec{F}V\\
  C^\infty(N,\space\Complex^l) @>>\weierp > C^\infty(N)
\end{CD}
```

Además, si $$A\subset M$$ es medible con borel, luego los resultados anteriores se mantienen en sentido de punto para la función *característica de $$A$$* en todas partes, excepto a lo largo de la frontera de $$A$$: si $$f = f^2$$ y $$A:=\set{x\in M|f(x)=1}$$,

```math
\sum_{i}\hat{f}(i)e^i(x) = \sum_{i,j,k}\hat{f}(i)\hat{f}(j)M^{i,j,k}e^k(x) = \begin{cases}
1 & x \in \mathring{A} \\
0 & x \in \mathring{A^\complement}\end{cases}
```

y por singularidad, tenemos la siguiente identidad

```math
\begin{aligned}
\hat{f}(k) &= \sum_{i,j}\hat{f}(i)\hat{f}(j)M^{i,j,k}\space\space \forall k\geq 0 \\
\iff f&=f^2 \space a.e.
\end{aligned}
```

Esto implica que cualquier mapa base como el anterior lleva funciones características (como miembros de $$L^2(M,g)\subset L^1(M,g)$$) a las funciones características de una manera que preserva la medida.

El punto de estos cálculos es enfatizar el hecho de que $$\set{M^{i,j,k}}$$ **caracteriza** el análisis armónico del operador de multiplicación por puntos en $$C^\infty(M)$$, que es una densa subalgebra del Abeliano $$C^*$$ álgebra $$C(M)$$por el teorema de Stone-Weierstrass.

Para la rápida convergencia de estas sumas anteriores que implican $$M^{i,j,k}$$, tenga en cuenta que los productos de las funciones propias son suaves, por lo que estos coeficientes de Fourier decaen como arriba (en cada índice). Para más detalles, vea el trabajo de Emmett Wyman en 2022 con estos coeficientes en relación con la desigualdad del triángulo en los valores propios. [[EW22]](#EW22).

Nota: siempre podemos asumir
```math
\begin{aligned}
e^0 &= M^{0,0,0} = 1/\sqrt{vol(M)} \\
\implies \\
M^{0,j,k} &= M^{j,0,k} = \delta_{j-k}\space/\sqrt{vol(M)}
\end{aligned}
```

donde $$\delta_i$$ Es el delta de Kronecker. Desde $$vol(M)$$ es una invariante espectral [[HW11]](#HW11), esta información ya está disponible a partir de consideraciones de isoespectralidad.

## Prueba de Teorema

Por necesidad, dejemos que $$F:(N,h)\rightarrow (M,g)$$ ser una isometría entre colectores Riemannianos cerrados, y dejar que el objetivo ortodonormal base de funciones propias en $$L^2(N,h)$$ ser el retroceso a través de $$F$$ de la base ortopédica $$\set{e^i}$$ activado $$(M,g)$$ anterior. Desde

```math
\begin{aligned}
M^{i,j,k} &= \int_M e^i e^j \bar{e^k}\sqrt{g}dy \\
          &= \int_N e^i(F(x)) e^j(F(x))\bar{e^k}(F(x))\sqrt{h}dx

\end{aligned}
```

acabamos con el argumento de la necesidad porque $$\Delta_N(f\circ F) = (\Delta_M f) \circ F,\ \ \forall f\in C^\infty(M)$$.

Para suficiencia, ahora consideramos el mapa lineal, bijetivo de la base de la función propia ortopédica $$\vec{F}$$ desde $$C^\infty(M)$$ a $$C^\infty(N)$$ y observar que a partir de los cálculos en el [Preliminares](#preliminaries) arriba, $$\vec{F}$$ conserva los productos en sentido puntual para funciones suaves (y conserva las funciones características cuando se amplía a $$L^2(M,g)$$) por la premisa de que $$\set{M^{i,j,k}}$$ es invariante bajo este mapa.

### Lemma

$$\vec{F}: C^\infty(M)\rightarrow C^\infty(N)$$ Conserva la norma uniforme.

### Prueba de Lemma

Permitir $$\set{a_i}$$ ser una división fluida de la unidad en $$M$$.

```math
\begin{aligned}
1 &= \sum_i a_i(x) \\
       &= \sum_{i,j} \hat{a_i}(j)e^j(x) \\
	   &= \sum_j e^j(x)\sum_i \hat{a_i}(j)
\end{aligned}
```

Así pues, $$\sum_i\hat{a_i}(j) = \delta_j\sqrt{vol(M)}$$ (Kronecker delta).

Por el teorema de convergencia dominado,

```math
\lim_{p\rightarrow\infty}
\sum_j\hat{a^p_j}(k) = \int_{\dot{\bigcup}_j\set{a_j=1}}\bar{e^k}(x)\sqrt{g}dx
```

que es una función característica de la medida positiva en cada subconjunto separado $$\set{x\in M | a_j(x) = 1}$$. Esto significa que el Lemma está probado para cada $$a_j$$, ya que la función característica limitante de un conjunto con medida positiva se conserva, y por lo tanto tiene norma uniforme 1, como todos $$a_j^p,\space \vec{F}(a_j^p)=\vec{F}(a_j)^p,\space p\in\N$$, por Diagrama (4).

Sin pérdida de generalidad, podemos aplicar el resultado de caso especial mostrado para la partición suave de la unidad $$\lbrace|f|/\lVert f \rVert_\infty, 1 - |f|/\lVert f\rVert_\infty\rbrace$$, donde $$ \set{x\in M|\space|f(x)| = \lVert f \rVert_\infty}$$ tiene una medida positiva, y el Lemma está probado en su totalidad.

Desde $$\set {\bar e^i}$$ base válida de Fourier para $$L^2(M,g)$$, está claro de la ecuación $$(2)$$ que $$\vec F(\bar f) = \bar{\vec F}(f)$$. Esto significa que en un denso conjunto de $$C(M)$$ (y $$C(N)$$), hemos establecido $$\vec{F}$$ como un isomorfismo de Abelian $$C^*$$ álgebras, y por lo tanto se puede extender a un isomorfismo de $$C(M)$$ y $$C(N)$$ en la misma categoría.

Ahora aplicamos el Teorema de Representación de Gelfand-Naimark (en forma de functor contravariante) para Abelian $$C^*$$ álgebras [[JC19]](#JC19) representar este isomorfismo por un homeomorfismo $$F$$ entre $$N$$ y $$M$$. Dado que es bijetivo en funciones lisas, también debe ser suave.

Como esto ahora diffeomorfismo $$F$$ conserva los valores propios y las funciones propias (por hipótesis sobre $$\vec{F}(f) = f\circ F$$), debe preservar el laplaciano en las funciones lisas. Por lo tanto, también debe preservar los símbolos principales de estos mismos operadores elípticos [[MT13]](#MT13). Los símbolos principales del laplaciano son simplemente otro medio de expresar la métrica riemanniana en los colectores en cuestión.

Esto completa la prueba del teorema.

### Discusión de Conjetura

Con $$\set{M_0^{i,j,k}}$$ y $$\set{M_1^{i,j,k}}$$ representando los dos conjuntos de productos triples para las bases $$\set{e_0^i}$$ y $$\set{e_1^i}$$, dejar $$z_i \in \set{-1,1}$$ ser el $$\Z_2^\infty$$ acción sobre tal $$\R$$-base ortodonormal valorada $$\set{e_1^i}$$. Por lo tanto, tenemos que elegir $$z_i$$ para que $$\set{z_ie_1^i}$$ rendimientos $$\set{M_1^{i,j,k}} = \set{z_i z_j z_kM_0^{i,j,k}}$$.

Observamos necesariamente que

```math
z_k = M_0^{i,i,k} / M_1^{i,i,k} \,\, \forall i,k\in\N,\, ⋺ M_0^{i,i,k} \ne 0 \,.
```

Podemos esperar que para cualquier $$k$$, $$M_0^{i,i,k}$$ no puede ser idéntico $$0$$ para todos $$i$$. En el primer rubor, esto no parece imposible si $$M$$ tiene un grupo de simetría "even/odd", y $$e^k$$ Es extraño, pero la esperanza es verdadera para el caso de toros planos a continuación (que no satisface la multiplicidad uniforme del valor propio = 1 condición). Además, la Fórmula (11) para $$z_k$$ requiere tanto $$i$$-independencia y suficiencia, para establecer el mapa base $$e_0^i \mapsto z_i e_1^i$$ conserva $$\set{M_0^{i,j,k}}$$. Todos estos aspectos siguen siendo desconocidos.

Sin embargo, vamos a calcular algunas identidades relevantes para que un futuro investigador intrépido pueda profundizar en esta conjetura:

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
Nota: para el caso de tori plano unidimensional que figura a continuación, $$\tilde{Q}_k(e^i,e^j) = 0$$ desde $$\sqrt{\Delta} = \sqrt{-1}\frac{d}{dx}$$ es una verdadera derivación.

## Ejemplo

Permitir $$\set{\lambda_i} \subset \R^n$$ ser un rango indexado $$n$$ rejilla de pesos de álgebra de mentira para la representación del espacio cociente de $$\frak{g}=\Reals^n$$ como campos vectoriales invariantes de traducción (es decir, constantes) en sí mismos, cuando $$\R^n$$ también se considera que $$\frak{g}$$Grupo de mentiras asociado a un toro definido por $$\Reals^n/A\Z^n, A \in GL(n,\Reals)$$. Estos pesos definen ascensores integrables de 1 forma sobre el toro que se integran a los funcionales lineales $$\bra{x} \lambda_i\rangle,\space x\in\Reals^n$$ como su grupo de mentiras (cubriendo el toro). Estas funciones lineales pueden entonces ser redimensionadas uniformemente (por $$2\pi \sqrt{-1}$$) y exponenciados para formar caracteres multiplicativos que descienden para formar una base ortonormal de $$L^2(\Reals^n/A\Z^n,dx)$$, con la medida Lebesgue (Haar) $$dx$$.

Además, esta base diagonaliza simultáneamente el laplaciano del toro plano **porque** el laplaciano es la imagen de un elemento cuadrático Casimir simétrico, negativo-definido bajo esta (operador diferencial lineal de coeficiente constante) representación espacial cociente del álgebra envolvente universal. Por lo tanto, sus valores propios están en constante proporción (de $$4\pi^2$$) al Casimir-elemento-determinado-longitud-cuadrado del peso de cada personaje en la red.

Consideramos actualmente la base anterior

```math
\set{e^{2\pi\sqrt{-1}\langle{x}|\lambda_i\rangle}/\sqrt{|\det A|}}_{i=0}^\infty
```
ser nuestra base de Fourier aplicable al teorema de las funciones propias ortonormales (carácter multiplicativo) (de esta representación del cociente del elemento (negativo) Casimir euclidiano) que corresponde directamente a $$\set{\lambda_i}$$. Por las hipótesis de nuestro Teorema, debemos tener $$i < j \implies \lVert\lambda_i\rVert \leq \lVert\lambda_j\rVert$$ (con la norma euclidiana sobre los pesos).

Ahora podemos calcular

```math
M^{i,j,k} = \begin{cases}
1/\sqrt{|\det A|} & \lambda_i + \lambda_j - \lambda_k = 0 \\
0 & \text{otherwise}
\end{cases}
```

Como esta ecuación <span class="eqno"></span> es *solamente* invariante bajo transformaciones lineales en el enrejado de peso $$(A^{-1})^t\Z^n = \set{\lambda_i}$$, sólo un $$L^2$$ Ortodonormal eigenfunción mapa base ** que se induce de un volumen de conservación de mapa lineal invertible entre dos tales indexados, rango $$n$$ las celosías de peso** mantendrán el conjunto de datos indexado "algebraico/topológico" $$\set{M^{i,j,k}}$$ invariante.

Sin embargo, para aplicar nuestra [Teorema](#theorem), es esencial que tal mapa lineal $$B$$ ser $$B\in SO(n,\Reals)$$ en la red del peso, porque la inducida $$L^2$$ mapa base de autofunción

```math
\set{e^{2\pi\sqrt{-1}\langle x| B\lambda_i\rangle}/\sqrt{|\det A|}}_{i=0}^\infty
```

debe preservar también las invariantes "analíticas" &mdash; la figura inducida por el elemento Casimir $$4\pi^2\lVert\lambda_i\rVert^2$$ para cada peso indexado, es decir, los valores propios individuales del laplaciano del tori plano.

Esta representación-cuenta teórica [[AK01]](#AK01) Es exactamente equivalente al desarrollo previo de *congruencia de la celosía* [[NRR22]](#NRR22) tradicionalmente utilizado para delinear clases de isometría de tori plano. De hecho, la matriz transpone tal mapa lineal $$B\in SO(n,\Reals)$$, como se describe en el párrafo anterior, **es** la isometría de Riemannian contravariante entre el tori, según lo proporcionado por la aplicación del *Teorema de Representación de Gelfand-Naimark* durante el [Prueba](#proof-of-theorem) de nuestro [Teorema](#theorem).

## Reconocimientos

La investigación original fue financiada en parte por un gracioso James Simons Research Award en 1995-1996, y el generoso apoyo de un Alfred P. Sloan Dissertation Fellowship en 1996-1997 en la Universidad de Stony Brook.

El autor también desea agradecer a Tanya Christiansen, Carolyn Gordon, Hamid Hezari, Harish Seshadri, y especialmente a Leon Takhtajan por su asistencia técnica y revisión en la preparación de este manuscrito para su publicación.

<!-- $Date$ $Author$ $Revision$ -->
