---
archived: ~
categories: Matemáticas
dependencies: '*.md.es'
keywords: teoría espectral, geometría riemanniana, problemas inversos, física matemática,
  análisis armónico, teoría de la representación
published: https://dx.doi.org/10.2139/ssrn.4793533
status: verificado=22843
title: Triple productos de autofunciones y geometría espectral
---

<div class="right">
  <img src="../images/lawson6-pod.png" style="width:200px">
  <p style="width:200px;text-align:center;line-height:20px">
  La superficie mínima de Lawson Î3⁄4<sub>6,1</sub> estereográficamente proyectada de S<sup>3</sup> a R<sup>3</sup>
  </p>
</div>

[TOC]

No de autores

Joe Schaefer

## Resumen

Uso de técnicas elementales de análisis geométrico, ecuaciones diferenciales parciales y abeliano $$C^*$$ Algebras, {# lede #}descubrimos una invariante geométrica global novedosa pero familiar{# lede #} &mdash;

## Introducción

Para un colector Riemannian cerrado $$(M,g)$$, caracterizando su **clase** de colectores isospectrales no isométricos, es un tipo de problema inverso [[DH11]](#DH11) en geometría espectral. Uno podría especular que esta clase siempre estaría vacía. Sin embargo, la literatura académica es rica en construcciones de décadas de pares específicos de contraejemplos: a partir de 1964 con el par de 16 dimensiones de tori plano isospectral no isométrico de John Milnor. [[JM64]](#JM64)y continuando [[CS92]](#CS92) hacia la caracterización dimensional genérica de tori plano en la tesis doctoral de Alexander Schiemann de 1993 [[AS94]](#AS94) &mdash; repleto de una búsqueda asistida por computadora para la crítica $$\dim = 3$$ caso.  Un estudio moderno de la historia completa del tori plano aparece en [[NRR22]](#NRR22).

A lo largo del camino fueron reveladoras ramificaciones en espacios de cobertura simétrica más sofisticados y no euclidianos; la construcción de tales "duetas" isospectrales y no isométricos que involucran tensores de curvatura no triviales (y sus características de Euler determinadas por el espectro en la dimensión 2) [[MS67]](#MS67)Un ejemplo de este esfuerzo fue Toshikazu Sunada en 1985. [[TS85]](#TS85).

Para métricas riemannianas inhomogéneas, Carolyn Gordon descubrió dúos que ni siquiera son isométricos localmente. [[CG93]](#CG93).

Continúa el trabajo en muchas áreas relacionadas [[DH11]](#DH11), como determinar las características topológicas de la clase de colectores isospectrales, no isométricos en general (vacío) [[ST80]](#ST80), finito [[AS94]](#AS94), rígido [[GK80]](#GK80)y compacto [[GZ97]](#GZ97).

Lo que ofrecemos en este artículo es una nueva perspectiva sobre una herramienta familiar: los coeficientes de Fourier indexados de productos pareados de funciones propias como una discreta "invariante algebraica/topológica" para complementar la existente, discreta "invariante analítica" &mdash; el espectro no negativo del operador *Laplace-Beltrami* (en lo sucesivo denominado **Laplaciano**) en $$L^2(M,g)$$

### resultados

<br>

<div class="card border-dark">
  <div class="card-header">

#### Teorema

  </div>
  <div class="card-body">

Dada una (no disminución de los valores propios) base ortonormal de las funciones propias $$\set{e^i}_{i=0}^{\infty}$$ para el laplaciano (no negativo) $$\Delta_M$$ activado $$L^2(M,g)$$ asociado a un múltiple Riemannian cerrado $$(M,g)$$

```math

M^{i,j,k} := \int_M e^i e^j \bar{e^k} \sqrt{g} dx

```

Para ser isométrico $$(M,g)$$, es una condición *necesaria y suficiente* para que otro **iosospectral** cerrara el múltiple riemanniano para tener una base ortonormal de autofunciones (para su laplaciano) que tanto preserva los autovalores asociados como posee un invariante $$\set{M^{i,j,k}}$$

  </div>
</div>

<br>

* La simetría* juega un papel importante en los casos manejables computacionalmente [[TF17]](#TF17) [[LS18]](#LS18) [[PS94]](#PS94), que se ilustra acertadamente en nuestro tori plano [Ejemplo](#example).

<br>

<div class="card border-dark">
  <div class="card-header">

#### Conjetura

  </div>
  <div class="card-body">

Si cada valor propio tiene multiplicidad $$1$$, dado un par de bases ortodormales preservadoras de autovalor como se describe en la hipótesis del teorema, los colectores son isométricos si y solo si el $$\set{M^{i,j,k}}$$

  </div>
</div>

<br>

La motivación para el estudio de $$\set{M^{i,j,k}}$$ se deriva vagamente del estudio del rol del **operador de multiplicación lineal** $$Y:V\otimes V\rightarrow V((z))$$ en la definición de un álgebra de operador de vértice [[FBZ04]](#FBZ04) asociado con una Teoría de Campo Conformal Chiral. Aquí $$V$$ es el espacio vectorial de los Estados y $$V((z))$$ es el espacio de la serie formal Laurent en $$z$$ con coeficientes en $$V$$. Desde $$V$$ a menudo viene equipado como un espacio de Hilbert con una base ortopédica tradicional de la serie Fourier, indexando $$Y$$ utilizando los elementos básicos de Fourier de $$V$$ sólo está ligeramente más implicado que $$M^{i,j,k}$$

Estos resultados se demostraron por primera vez durante una charla similar titulada por el autor en **MSRI** en 1997, pero aparecen aquí en forma publicada por primera vez.

No de preliminares

Ahora con $$M,g,e^i,M^{i,j,k}$$ como se ha indicado anteriormente, ya que $$f \in C^\infty(M)$$ y $$i \geq 0$$

```math
\begin{aligned}

\hat{f}(i) &:= \int_M f(x)\bar{e^i}(x)\sqrt{g(x)}dx \\

\implies \\

f(x)        &= \sum_{i=0}^{\infty}\hat{f}(i)e^i(x).

\end{aligned}

```

desde $$f$$ es singularmente representable como su rápida convergencia **Fourier Series** ($$\Delta_M$$-incrustaciones específicas de Sobolev [[MT13]](#MT13) [[RS75]](#RS75)junto con la Ley Asintótica de Weyl [[HW11]](#HW11), implican que los términos de la suma son $$o(i^{-n})$$ * uniformemente en $$x$$* [[LH68]](#LH68), $$\forall n\in\N$$.) Entonces vemos que para $$f_1, f_2 \in C^\infty(M)$$, los coeficientes de Fourier del producto en sentido puntual $$f_1 f_2 \in C^\infty(M)$$

```math
\begin{aligned}

\widehat{f_1 f_2}(k) &= \sum_{i,j}^\infty\hat{f_1}(i)\hat{f_2}(j)M^{i,j,k} \\

\implies \\

f_1f_2(x) &= \sum_{i,j,k}\hat{f_1}(i)\hat{f_2}(j)M^{i,j,k}e^k(x) \\

f_1 = f^p_2,\space p \space \in \N \implies \\

\sum_{k}\hat{f_1}(k)e^k(x) &= \sum_{i_1,...,i_p, k}\hat{f_2}(i_1)...\hat{f_2}(i_p)M^{i_1,i_2,i_3}M^{i_2,i_3,i_4}...M^{i_{p-1},i_p,k}e^k(x).

\end{aligned}
```

y así, *críticamente*, cualquier polinomio multivariante $$\weierp \in \Complex[z_1,...,z_l]$$ (en funciones fluidas) **se conmuta** con cualquier preservación del espectro $$\Delta$$-eigenfunction mapa de base ortonormal $$F$$ que preserva $$\set{M^{i,j,k}}$$

```math
\begin{CD}
  C^\infty(M,\space\Complex^l) @>\weierp >> C^\infty(M)\\
   @V\underbrace{F\oplus\dots\oplus F}_{l\space\text{times}}VV @VVFV\\
  C^\infty(N,\space\Complex^l) @>>\weierp > C^\infty(N)
\end{CD}
```

Además, si $$A\subset M$$ es medible por Borel, entonces los resultados anteriores mantienen la función *característica de $$A$$* en todas partes excepto a lo largo del límite de $$A$$: si $$f = f^2$$ y $$A:=\set{x\in M|f(x)=1}$$

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

Esto implica que cualquier mapa de base como el anterior tiene funciones características (como miembros de $$L^2(M,g)\subset L^1(M,g)$$

El objetivo de estos cálculos es enfatizar el hecho de que $$\set{M^{i,j,k}}$$ **caracteriza** el análisis armónico del operador de multiplicación pointwise en $$C^\infty(M)$$, que es un denso subalgebra de los abelianos $$C^*$$ Álgebra $$C(M)$$

Para la rápida convergencia de estas sumas que implican $$M^{i,j,k}$$, tenga en cuenta que los productos de las funciones propias son suaves, por lo que estos coeficientes de Fourier decaen como arriba (en cada índice). Para más detalles, vea el trabajo de Emmett Wyman en 2022 con estos coeficientes en relación con la desigualdad del triángulo en los valores propios. [[EW22]](#EW22).

Nota: siempre podemos asumir
```math
\begin{aligned}
e^0 &= M^{0,0,0} = 1/\sqrt{vol(M)} \\
\implies \\
M^{0,j,k} &= M^{j,0,k} = \delta_{j-k}\space/\sqrt{vol(M)}
\end{aligned}
```

donde $$\delta_i$$ es el delta de Kronecker. Desde $$vol(M)$$ es una invariable espectral [[HW11]](#HW11).

## Prueba del teorema

Por necesidad, que $$F:(N,h)\rightarrow (M,g)$$ ser una isometría entre los colectores Riemannian cerrados, y dejar que la base ortonormal objetivo de las funciones propias en $$L^2(N,h)$$ ser el retroceso mediante $$F$$ de la base ortonormal $$\set{e^i}$$ activado $$(M,g)$$

```math
\begin{aligned}
M^{i,j,k} &= \int_M e^i e^j \bar{e^k}\sqrt{g}dy \\
          &= \int_N e^i(F(x)) e^j(F(x))\bar{e^k}(F(x))\sqrt{h}dx

\end{aligned}
```

hemos terminado con el argumento de la necesidad.

Para la suficiencia, ahora consideramos el mapa de bases ortopédicas lineales y bijetivas $$F$$ desde $$C^\infty(M)$$ a $$C^\infty(N)$$ y señalar que a partir de los cálculos de [Preliminar](#preliminaries) arriba, $$F$$ conserva los productos en sentido puntual para funciones suaves (y conserva las funciones características cuando se amplía a $$L^2(M,g)$$) por la premisa de que $$\set{M^{i,j,k}}$$

### Lemma

$$F: C^\infty(M)\rightarrow C^\infty(N)$$ mantiene la norma uniforme.

### Prueba de Lemma

Vamos $$\set{a_i}$$ ser una división suave de la unidad en $$M$$

```math
\begin{aligned}
1 &= \sum_i a_i(x) \\
       &= \sum_{i,j} \hat{a_i}(j)e^j(x) \\
	   &= \sum_j e^j(x)\sum_i \hat{a_i}(j)
\end{aligned}
```

Así $$\sum_i\hat{a_i}(j) = \delta_j\sqrt{vol(M)}$$

Por el teorema de convergencia dominado,

```math
\lim_{p\rightarrow\infty}
\sum_j\hat{a^p_j}(k) = \int_{\dot{\bigcup}_j\set{a_j=1}}\bar{e^k}(x)\sqrt{g}dx
```

que es una función característica de la medida positiva en cada subconjunto separado $$\set{x\in M | a_j(x) = 1}$$. Esto significa que el Lemma está probado para cada $$a_j$$, ya que se conserva la función característica limitante de un conjunto con medida positiva, y por lo tanto tiene norma uniforme 1, al igual que todas las $$a_j^p,\space F(a_j^p)=F(a_j)^p,\space p\in\N$$

Sin pérdida de generalidad, podemos aplicar el resultado de caso especial mostrado para la división suave de la unidad $$\lbrace|f|/\lVert f \rVert_\infty, 1 - |f|/\lVert f\rVert_\infty\rbrace$$, donde $$ \set{x\in M|\space|f(x)| = \lVert f \rVert_\infty}$$

Esto significa que en un denso conjunto de $$C(M)$$ (y $$C(N)$$), hemos establecido $$F$$ como un isomorfismo de Abelian $$C^*$$ álgebras, y por lo tanto puede extenderse a un isomorfismo de $$C(M)$$ y $$C(N)$$

Ahora aplicamos el teorema de representación de Gelfand-Naimark (en forma de funtor contravariante) para Abelian $$C^*$$ álgebras [[JC19]](#JC19) representar este isomorfismo por un homeomorfismo entre $$N$$ y $$M$$

Como este ahora diffeomorfismo preserva los valores propios y las funciones propias (por hipótesis sobre $$F$$), debe preservar el laplaciano en funciones suaves. Por lo tanto, también debe preservar los símbolos principales de estos mismos operadores elípticos. [[MT13]](#MT13).

Esto completa la prueba del teorema.

### Discusión de la Conjetura

Con $$\set{M_0^{i,j,k}}$$ y $$\set{M_1^{i,j,k}}$$ representando los dos conjuntos de triple producto para las bases $$\set{e_0^i}$$ y $$\set{e_1^i}$$, dejar $$z_i \in \set{-1,1}$$ ser el $$\Z_2^\infty$$ acción sobre tal $$\R$$-base ortopédica valorada $$\set{e_1^i}$$. Por lo tanto, tenemos que elegir $$z_i$$ para que $$\set{z_ie_1^i}$$ rendimiento $$\set{M_1^{i,j,k}} = \set{z_i z_j z_kM_0^{i,j,k}}$$

Observamos necesariamente que

```math
z_k = M_0^{i,i,k} / M_1^{i,i,k} \,\, \forall i,k\in\N,\, ⋺ M_0^{i,i,k} \ne 0 \,.
```

Desde para cualquier $$k$$, $$M_0^{i,i,k}$$ no puede ser idéntico $$0$$ para todos $$i$$, esta fórmula para $$z_k$$ requiere tanto $$i$$-independencia y suficiencia, para establecer el mapa base $$e_0^i \mapsto z_i e_1^i$$ conservas $$\set{M_0^{i,j,k}}$$

Ejemplo ##

Vamos $$\set{\lambda_i} \subset \R^n$$ ser una clasificación indexada $$n$$ enrejado de los pesos de Lie Algebra para la representación espacial cociente de $$\frak{g}=\Reals^n$$ como campos vectoriales invariantes de traducción (es decir, constantes) en sí mismos, cuando $$\R^n$$ también se considera $$\frak{g}$$Grupo de Lie asociado sobre un toro definido por $$\Reals^n/A\Z^n, A \in GL(n,\Reals)$$. Estos pesos definen ascensores integrables de 1 forma sobre el toro que se integran a los funcionales lineales. $$\bra{x} \lambda_i\rangle,\space x\in\Reals^n$$ como su grupo de mentiras (que cubre el toro). Estas funciones lineales pueden entonces ser reescaladas uniformemente (por $$2\pi \sqrt{-1}$$) y exponenciados para formar caracteres multiplicativos que descienden para formar una base ortonormal de $$L^2(\Reals^n/A\Z^n,dx)$$, con la medida Lebesgue (Haar) $$dx$$

Además, esta base diagonaliza simultáneamente el laplaciano del toro plano **porque** el laplaciano es la imagen de un elemento cuadrático cuadrático simétrico, negativo-definido de Casimir bajo esta (operador diferencial lineal de coeficiente constante) representación del espacio cociente del álgebra envolvente universal. Por lo tanto, sus valores propios están en proporción constante (de $$4\pi^2$$

Actualmente vemos la base anterior

```math
\set{e^{2\pi\sqrt{-1}\langle{x}|\lambda_i\rangle}/\sqrt{|\det A|}}_{i=0}^\infty
```
ser nuestra base teórico-aplicable de Fourier de funciones propias ortonormales (carácter multiplicativo) (de esta representación cociente del elemento (negativo) euclidiano Casimir) directamente correspondiente a $$\set{\lambda_i}$$. Por las hipótesis de nuestro teorema, debemos tener $$i < j \implies \lVert\lambda_i\rVert \leq \lVert\lambda_j\rVert$$

Ahora podemos calcular

```math
M^{i,j,k} = \begin{cases}
1/\sqrt{|\det A|} & \lambda_i + \lambda_j - \lambda_k = 0 \\
0 & \text{otherwise}
\end{cases}
```

Como esta ecuación <span class="eqno"></span> es lineal en la red de peso $$(A^{-1})^t\Z^n = \set{\lambda_i}$$, sólo un $$L^2$$ mapa de base de función propia ortonormal ** que se induce a partir de un mapa lineal invertible que preserva el volumen entre dos de tales indexados, rango $$n$$ las celosías de peso** mantendrán el conjunto de datos indexado "algebraico/topológico" $$\set{M^{i,j,k}}$$

Sin embargo, para aplicar nuestra [Teorema](#theorem), es esencial que este mapa lineal $$B$$ ser $$B\in O(n,\Reals)$$ en la celosía de peso, porque el $$L^2$$

```math
\set{e^{2\pi\sqrt{-1}\langle x| B\lambda_i\rangle}/\sqrt{|\det A|}}_{i=0}^\infty
```

también deben preservar las invariantes "analíticas" &mdash; figura inducida por el elemento Casimir $$4\pi^2\lVert\lambda_i\rVert^2$$

Esta cuenta teórica de representación [[AK01]](#AK01) es exactamente equivalente al desarrollo previo de *congruencia de látex* [[NRR22]](#NRR22) se utiliza de forma comercial para delinear las clases de isometría de tori plano. De hecho, la matriz transpone tal mapa lineal $$B\in O(n,\Reals)$$, tal como se describe en el párrafo anterior, **es** la isometría contravariante de Riemann entre el tori, según lo dispuesto por la aplicación del *Teorema de Representación de Gelfand-Naimark* durante el [Prueba](#proof-of-theorem) de nuestros [Teorema](#theorem).

No de acuses de recibo

La investigación original fue financiada en parte por un gracioso Premio de Investigación James Simons en 1995-1996, y el generoso apoyo de un Alfred P. Sloan Dissertation Fellowship en 1996-1997 en la Universidad de Stony Brook.

El autor también desea agradecer a Tanya Christiansen, Carolyn Gordon, Hamid Hezari, Harish Seshadri, y especialmente a Leon Takhtajan por su asistencia técnica y revisión en la preparación de este manuscrito para su publicación.

<!-- $Date$ $Author$ $Revision$ -->
