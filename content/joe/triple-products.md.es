---
categories: Matemáticas
dependencies: '*.md.es'
keywords: teoría espectral, geometría riemanniana, problemas inversos, física matemática,
  análisis armónico, teoría de la representación
status: published
title: Triple productos de autofunciones y geometría espectral
---

<div class="right">
  <img src="../images/lawson6-pod.png" style="width:200px">
  <p style="width:200px;text-align:center;line-height:20px">
  La superficie mínima de Lawson ξ<sub>6,1</sub> estereográficamente proyectada de S<sup>3</sup> a R<sup>3</sup>
  </p>
</div>

[TOC]

## No de autores

Joe Schaefer

## Resumen

Uso de técnicas elementales de análisis geométrico, ecuaciones diferenciales parciales y álgebras abelianas $$C^*$$, {# lede #}descubrimos una invariante geométrica global novedosa pero familiar{# lede #}.

## Introducción

Para un colector Riemannian cerrado $$(M,g)$$, caracterizando su **clase** de colectores no isométricos, isospectrales es un tipo de problema inverso [[DH11]](#DH11) en geometría espectral. Uno podría especular que esta clase siempre estaría vacía. Sin embargo, la literatura académica es rica en construcciones de décadas de pares específicos de contraejemplos: a partir de 1964 con el par de 16 dimensiones de tori no isométrico, plano isospectral de John Milnor [[JM64]](#JM64), y continuar con [[CS92]](#CS92) hacia la caracterización dimensional genérica de tori plano en la tesis doctoral de Alexander Schiemann de 1993 [[AS94]](#AS94) - repleto de una búsqueda asistida por ordenador para el crítico $$\dim = 3$$ caso.  Un estudio moderno de la historia completa del tori plano aparece en [[NRR22]](#NRR22).

A lo largo del camino fueron perspicaces ramificaciones en espacios de cobertura simétrica más sofisticados y no euclidianos; la construcción de tales "duetas" isospectrales y no isométricos que involucran tensores de curvatura no triviales (y sus características de Euler determinadas por el espectro en la dimensión 2 [[MS67]](#MS67).) Un ejemplo de este esfuerzo fue Toshikazu Sunada de 1985 [[TS85]](#TS85).

Para métricas riemannianas inhomogéneas, Carolyn Gordon descubrió duetos que ni siquiera son isométricos localmente [[CG93]](#CG93).

Continúa el trabajo en muchas áreas relacionadas [[DH11]](#DH11), como determinar las características topológicas de la clase de colectores isospectrales, no isométricos en general (vacío [[ST80]](#ST80), finito [[AS94]](#AS94), rígido [[GK80]](#GK80), y [[GZ97]] compacto(#GZ97).

Lo que ofrecemos en este artículo es una nueva perspectiva sobre una herramienta familiar: coeficientes indexados de Fourier de productos pareados de funciones propias como un discreto "invariante algebraico / topológico" para complementar el existente, discreto "invariante analítico" - el espectro no negativo del operador *Laplace-Beltrami* (en lo sucesivo denominado el **Laplaciano**) en $$L^2(M,g)$$.  En combinación, observamos que el par proporciona una "representación geométrica global discreta" de las clases de isometría de colectores isospectrales y Riemannianos cerrados.

### resultados

<br>

<div class="card border-dark">
  <div class="card-header">

#### Teorema

  </div>
  <div class="card-body">

Dada una (no disminución en los valores propios) base ortonormal de las funciones propias $$\set{e^i}_{i=0}^{\infty}$$ para el (no negativo) Laplaciano $$\Delta_M$$ en $$L^2(M,g)$$ asociado con un colector Riemannian cerrado $$(M,g)$$, definir

```math

M^{i,j,k} := \int_M e^i e^j \bar{e^k} \sqrt{g} dx

```

Para ser isométrico a $$(M,g)$$, es una condición *necesaria y suficiente* para que otro **iosospectral** cerrara el colector de Riemannian para tener una base ortonormal de funciones propias (por su laplaciano) que ambos preservan los valores propios asociados y poseen un invariante $$\set{M^{i,j,k}}$$ bajo cada base.

  </div>
</div>

<br>

*La simetría* juega un papel importante en los casos de tracción computacional [[TF17]](#TF17) [[LS18]](#LS18) [[PS94]](#PS94), que se ilustra acertadamente en nuestro tori plano [Ejemplo](#Example).

<br>

<div class="card border-dark">
  <div class="card-header">

#### Conjetura

  </div>
  <div class="card-body">

Si cada valor propio tiene multiplicidad $$1$$, dado un par de bases ortodormales preservadoras de valor propio como se describe en la hipótesis del teorema, los colectores son isométricos si y solo si el $$\set{M^{i,j,k}}$$ por una base está de acuerdo, hasta el valor absoluto en los términos individuales, con la otra base.

  </div>
</div>

<br>

La motivación para el estudio de $$\set{M^{i,j,k}}$$ se deriva vagamente del estudio del papel del **operador de multiplicación lineal** $$Y:V\otimes V\rightarrow V((z))$$ en la definición de un álgebra de operador de vértice [[FBZ04]](#FBZ04).

Estos resultados se demostraron por primera vez durante una charla similar titulada por el autor en **MSRI** en 1997, pero aparecen aquí en forma publicada por primera vez.

## No de preliminares

Ahora con $$M,g,e^i,M^{i,j,k}$$ como arriba, para $$f \in C^\infty(M)$$ y $$i \geq 0$$ tenga en cuenta que los **coeficientes de Fourier**

```math
\begin{aligned}

\hat{f}(i) &:= \int_M f(x)\bar{e^i}(x)\sqrt{g(x)}dx \\

\implies \\

f(x)        &= \sum_{i=0}^{\infty}\hat{f}(i)e^i(x)

\end{aligned}

```

ya que $$f$$ es única y representable como su rápida convergencia **Serie Fourier** ($$\Delta_M$$Incrustaciones de Sobolev específicas de [[MT13]](#MT13) [[RS75]](#RS75), junto con la Ley Asintótica de Weyl [[HW11]](#HW11), implican que los términos en la suma son $$o(i^{-n})$$ *uniformemente en $$x$$* [[LH68]](#LH68)).

```math
\begin{aligned}

\widehat{f_1 f_2}(k) &= \sum_{i,j}^\infty\hat{f_1}(i)\hat{f_2}(j)M^{i,j,k} \\

\implies \\

f_1f_2(x) &= \sum_{i,j,k}\hat{f_1}(i)\hat{f_2}(j)M^{i,j,k}e^k(x) \\

f_1 = f^p_2,\space p \space \in \N \implies \\

\sum_{k}\hat{f_1}(k)e^k(x) &= \sum_{i_1,...,i_p, k}\hat{f_2}(i_1)...\hat{f_2}(i_p)M^{i_1,i_2,i_3}M^{i_2,i_3,i_4}...M^{i_{p-1},i_p,k}e^k(x)

\end{aligned}
```

y así, *críticamente*, cualquier polinomio multivariante $$\weierp \in \Complex[z_1,...,z_l]$$ (en funciones lisas) **commutes** con cualquier mapa de base ortonormal de preservación de espectro $$\Delta$$-eigenfunction $$F$$ que conserva $$\set{M^{i,j,k}}$$:

```math
\begin{CD}
  C^\infty(M,\space\Complex^l) @>\weierp >> C^\infty(M)\\
   @V\underbrace{F\oplus\dots\oplus F}_{l\space\text{times}}VV @VVFV\\
  C^\infty(N,\space\Complex^l) @>>\weierp > C^\infty(N)
\end{CD}
```

Además, si $$A\subset M$$ es medible por Borel, los resultados anteriores mantienen la función característica de $$A$$* en todas partes, excepto a lo largo del límite de $$A$$: si $$f = f^2$$ y $$A:=\set{x\in M|f(x)=1}$$,

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

Esto implica que cualquier mapa base como el anterior lleva funciones características (como miembros de $$L^2(M,g)\subset L^1(M,g)$$) a funciones características de una manera que preserva la medida.

El punto de estos cálculos es enfatizar el hecho de que $$\set{M^{i,j,k}}$$ **caracteriza** el análisis armónico del operador de multiplicación en sentido de puntos en $$C^\infty(M)$$, que es un subalgebra densa del álgebra abeliana $$C^*$$ $$C(M)$$, por el teorema de Stone-Weierstrass.

Para la rápida convergencia de estas sumas anteriores que implican $$M^{i,j,k}$$, tenga en cuenta que los productos de las funciones propias son suaves, por lo que estos coeficientes de Fourier decaen como arriba (en cada índice). Para más detalles, vea el trabajo de Emmett Wyman en 2022 con estos coeficientes en relación con la desigualdad del triángulo en los valores propios [[EW22]](#EW22).

Nota: siempre podemos asumir
```math
\begin{aligned}
e^0 &= M^{0,0,0} = 1/\sqrt{vol(M)} \\
\implies \\
M^{0,j,k} &= M^{j,0,k} = \delta_{j-k}\space/\sqrt{vol(M)}
\end{aligned}
```

donde $$\delta_i$$ es el delta de Kronecker. Dado que $$vol(M)$$ es un invariante espectral [[HW11]](#HW11)

## Prueba del teorema

Por necesidad, deje que $$F:(N,h)\rightarrow (M,g)$$ sea una isometría entre los colectores Riemannian cerrados, y deje que la base ortonormal objetivo de las funciones propias en $$L^2(N,h)$$ sea el retroceso a través de $$F$$ de la base ortonormal $$\set{e^i}$$ en $$(M,g)$$ arriba. Desde

```math
\begin{aligned}
M^{i,j,k} &= \int_M e^i e^j \bar{e^k}\sqrt{g}dy \\
          &= \int_N e^i(F(x)) e^j(F(x))\bar{e^k}(F(x))\sqrt{h}dx

\end{aligned}
```

hemos terminado con el argumento de la necesidad.

Para suficiencia, ahora consideramos el mapa de bases ortonormales lineales y bijetivas de función propia $$F$$ de $$C^\infty(M)$$ a $$C^\infty(N)$$ y observamos que de los cálculos en los [Preliminarios](#Preliminarios).

### Lemma

$$F: C^\infty(M)\rightarrow C^\infty(N)$$ conserva la norma uniforme.

### Prueba de Lemma

Deje que $$\set{a_i}$$ sea una partición de unidad sin problemas en $$M$$.

```math
\begin{aligned}
1 &= \sum_i a_i(x) \\
       &= \sum_{i,j} \hat{a_i}(j)e^j(x) \\
	   &= \sum_j e^j(x)\sum_i \hat{a_i}(j)
\end{aligned}
```

Thus $$\sum_i\hat{a_i}(j) = \delta_j\sqrt{vol(M)}$$ (Kronecker delta).

Por el teorema de convergencia dominado,

```math
\lim_{p\rightarrow\infty}
\sum_j\hat{a^p_j}(k) = \int_{\dot{\bigcup}_j\set{a_j=1}}\bar{e^k}(x)\sqrt{g}dx
```

que es una función característica de medida positiva en cada subconjunto separado $$\set{x\in M | a_j(x) = 1}$$. Esto significa que el Lemma está probado para cada $$a_j$$, ya que la función característica limitante de un conjunto con medida positiva se conserva, y por lo tanto tiene una norma uniforme 1, al igual que todos los $$a_j^p,\space F(a_j^p)=F(a_j)^p,\space p\in\N$$, por Diagrama (4).

Sin pérdida de generalidad, podemos aplicar el resultado de caso especial que se muestra para la partición sin problemas de unidad $$\lbrace|f|/\lVert f \rVert_\infty, 1 - |f|/\lVert f\rVert_\infty\rbrace$$, donde $$ \set{x\in M|\space|f(x)| = \lVert f \rVert_\infty}$$ tiene una medida positiva, y el Lemma está probado en su totalidad.

Esto significa que en un denso conjunto de $$C(M)$$ (y $$C(N)$$), hemos establecido $$F$$ como un isomorfismo de álgebras abelianas $$C^*$$, y por lo tanto se puede ampliar a un isomorfismo de $$C(M)$$ y $$C(N)$$ en la misma categoría.

Ahora aplicamos el teorema de representación de Gelfand-Naimark (en forma de funtor contravariante) para álgebras abelianas $$C^*$$ [[JC19]](#JC19).

Como este diffeomorfismo conserva los valores propios y las funciones propias (por hipótesis en $$F$$), debe preservar el laplaciano en funciones suaves. Por lo tanto, también debe preservar los símbolos principales de estos mismos operadores elípticos [[MT13]](#MT13).

Esto completa la prueba del teorema.

### Discusión de la Conjetura

Con $$\set{M_0^{i,j,k}}$$ y $$\set{M_1^{i,j,k}}$$ que representan los dos juegos de triple producto para las bases $$\set{e_0^i}$$ y $$\set{e_1^i}$$, deje que $$z_i \in \set{-1,1}$$ sea la acción $$\Z_2^\infty$$ sobre una base ortonormal con valor $$\R$$ $$\set{e_1^i}$$. Thus, we need to choose $$z_i$$ so that $$\set{z_ie_1^i}$$ yields $$\set{M_1^{i,j,k}} = \set{z_i z_j z_kM_0^{i,j,k}}$$.

Observamos necesariamente que

```math
z_k = M_0^{i,i,k} / M_1^{i,i,k} \,\, \forall i,k\in\N,\, ⋺ M_0^{i,i,k} \ne 0 \,.
```

Dado que para cualquier $$k$$ dado, $$M_0^{i,i,k}$$ no puede ser idéntico $$0$$ para todos $$i$$, esta fórmula para $$z_k$$ requiere tanto $$i$$-independencia, y suficiencia, para establecer el mapa base $$e_0^i \mapsto z_i e_1^i$$ conserva $$\set{M_0^{i,j,k}}$$. Estos aspectos siguen siendo desconocidos.

## Ejemplo

Deje que $$\set{\lambda_i} \subset \R^n$$ sea un enrejado indexado, clasifique $$n$$ de pesos de álgebra de Lie para la representación de espacio cociente de $$\frak{g}=\Reals^n$$ como invariante de traducción (es decir, constante) campos vectoriales en sí mismo, cuando $$\R^n$$ también se ve como Grupo de Lie asociado de $$\frak{g}$$ sobre un torus definido por $$\Reals^n/A\Z^n, A \in GL(n,\Reals)$$. Estos pesos definen ascensores integrables de 1 forma sobre el toro que se integran a los funcionales lineales $$\bra{x} \lambda_i\rangle,\space x\in\Reals^n$$ como su Grupo de Lie (cubriendo el toro). Estas funciones lineales se pueden reajustar uniformemente (por $$2\pi \sqrt{-1}$$) y exponenciarse para formar caracteres multiplicativos que descienden para formar una base ortodóncica de $$L^2(\Reals^n/A\Z^n,dx)$$, con la medida Lebesgue (Haar) $$dx$$.

Además, esta base diagonaliza simultáneamente el laplaciano del toro plano **porque** el laplaciano es la imagen de un elemento cuadrático cuadrático simétrico, negativo-definido de Casimir bajo esta (operador diferencial lineal de coeficiente constante) representación del espacio cociente del álgebra envolvente universal. Por lo tanto, sus valores propios están en proporción constante (de $$4\pi^2$$) al Casimir-elemento-determinado-longitud-cuadrado del peso de cada personaje en la red.

Actualmente vemos la base anterior

```math
\set{e^{2\pi\sqrt{-1}\langle{x}|\lambda_i\rangle}/\sqrt{|\det A|}}_{i=0}^\infty
```
ser nuestra base teórica Fourier de autofunciones ortonormales (carácter multiplicativo) (de esta representación de cociente del elemento Casimir euclidiano (negativo) directamente correspondiente a $$\set{\lambda_i}$$. Por las hipótesis de nuestro teorema, debemos tener $$i < j \implies \lVert\lambda_i\rVert \leq \lVert\lambda_j\rVert$$ (con la norma euclidiana sobre los pesos).

Ahora podemos calcular

```math
M^{i,j,k} = \begin{cases}
1/\sqrt{|\det A|} & \lambda_i + \lambda_j - \lambda_k = 0 \\
0 & \text{otherwise}
\end{cases}
```

Dado que esta ecuación <span class="eqno"></span> es lineal en la celosía de peso $$(A^{-1})^t\Z^n = \set{\lambda_i}$$, solo un mapa de base de función propia ortonormal $$L^2$$ ** que se induce desde un mapa lineal invertible que preserva el volumen entre dos de dichas celosías de peso indexadas, de rango $$n$$** mantendrá el conjunto de datos indexado "algebraico/topológico" $$\set{M^{i,j,k}}$$ invariante.

Sin embargo, con el fin de aplicar nuestro [teorema](#Teorema)

```math
\set{e^{2\pi\sqrt{-1}\langle x| B\lambda_i\rangle}/\sqrt{|\det A|}}_{i=0}^\infty
```

debe conservar también las invariantes "analíticas": la figura inducida por el elemento Casimir $$4\pi^2\lVert\lambda_i\rVert^2$$ por cada peso indexado, es decir, los valores propios individuales del laplaciano del tori plano.

Esta cuenta teórica de representación [[AK01]](#AK01) es exactamente equivalente al desarrollo previo de *lattice congruence* [[NRR22]](#NRR22) se utiliza de forma comercial para delinear las clases de isometría de tori plano. De hecho, la matriz transpone tal mapa lineal $$B\in O(n,\Reals)$$, como se describe en el párrafo anterior, **es** la isometría contravariante de Riemannian entre el tori, según lo dispuesto por la aplicación del *Teorema de Representación de Gelfand-Naimark* durante la [Prueba](#Pruba%20del%20Teorema) de nuestro [teórico](#Teorema).

## No de acuses de recibo

La investigación original fue financiada en parte por un gracioso Premio de Investigación James Simons en 1995-1996, y el generoso apoyo de un Alfred P. Sloan Dissertation Fellowship en 1996-1997 en la Universidad de Stony Brook.

El autor también desea agradecer a Tanya Christiansen, Carolyn Gordon, Hamid Hezari, Harish Seshadri, y especialmente a Leon Takhtajan por su asistencia técnica y revisión en la preparación de este manuscrito para su publicación.

<!-- $Date$ $Author$ $Revision$ -->
