---
categories: Matemáticas
dependencies: '*.md.es'
keywords: Teoría espectral, geometría riemanniana, problemas inversos, física matemática,
  análisis armónico, teoría de la representación, constantes de estructura, teoría
  de campo conformal
status: verificado=51912
title: Triple producto de autofunciones y geometría espectral
---

<div class="right">
  <img src="../images/lawson6-pod.png" style="width:200px">
  <p style="width:200px;text-align:center;line-height:20px">
  La superficie mínima de Lawson<sub>6,1</sub> proyectada estereográficamente desde S<sup>3</sup> a R<sup>3</sup>
  </p>
</div>

[TOC]#sidebar

## Autor

Joe Schaefer

## Dedicación

Hasta otoño

## Resumen

Uso de técnicas elementales del Análisis Geométrico, Ecuaciones Diferenciales Parciales y Abeliano $$C^*$$ Algebras, {# lede #}Descubrimos una novela, pero familiar, global geométrica discriminante{# lede #} &mdash; es decir, **el conjunto indexado de integrales de productos triples de funciones propias del operador Laplace-Beltrami**, para caracterizar con precisión qué colectores Riemannianos cerrados isospectrales son isométricos.

## Introducción

Por un colector Riemanniano cerrado $$(M,g)$$, caracterizando su **clase** de colectores isospectrales no isométricos, es un tipo de problema inverso [[DH11]](#DH11) en geometría espectral. Se podría especular ingenuamente que esta clase siempre estaría vacía. Sin embargo, la literatura académica es rica en construcciones de décadas de antigüedad de pares específicos de contraejemplos: a partir de 1964 con el par de tori plano isospectral no isométrico de 16 dimensiones de John Milnor. [[JM64]](#JM64)y continuando [[CS92]](#CS92) hacia la caracterización dimensional genérica de tori plano en la tesis doctoral de Alexander Schiemann de 1993 [[AS94]](#AS94) &mdash; repleto de una búsqueda asistida por computadora para el crítico $$\dim = 3$$ caso.  Un estudio moderno de la historia completa de los tori planos aparece en [[NRR22]](#NRR22).

A lo largo del camino fueron vástagos perspicaces en espacios de cobertura simétricos más sofisticados, no euclidianos; construyendo tales espacios isospectrales, no isométricos. "vencimientos" que implican tensores de curvatura no triviales (y sus características de Euler determinadas por el espectro en la dimensión 2 [[MS67]](#MS67)Un buen ejemplo de este esfuerzo fue el de Toshikazu Sunada en 1985. [[TS85]](#TS85) Invención de un marco espacial de uso general, que luego desplegó en el mismo trabajo para construir dúos hiperbólicos en las dimensiones 2 y 3.

Para las métricas riemannianas no homogéneas, Carolyn Gordon descubrió dúos que ni siquiera son isométricos localmente. [[CG93]](#CG93).

El trabajo continúa en muchas áreas relacionadas [[DH11]](#DH11), como la determinación de las características topológicas de la clase de colectores isospectrales, no isométricos en general (vacío [[ST80]](#ST80), finito [[AS94]](#AS94), rígido [[GK80]](#GK80)y compacto [[GZ97]](#GZ97)) como un subconjunto de diferentes espacios modulares de métricas riemannianas.

What we offer in this article is a new perspective on a familiar tool: Coeficientes de Fourier indexados de productos pareados de funciones propias como un "discriminante algebraico/topológico" complementar la actual y discreta "invariante analítica" &mdash; el espectro no negativo del *operador Laplace-Beltrami* (en lo sucesivo denominado el **laplaciano**) en $$ℋ = L^2(M,g)$$. Combinado, observamos que el par proporciona un "representación geométrica global discreta" de las clases de isometría de los colectores isospectrales, Riemannianos cerrados.

### Resultados

<br>

<div class="card border-dark">
  <div class="card-header">

#### Teorema

</div>
  <div class="card-body">

Dada una base ortonormal (no decreciente en los valores propios) de las funciones propias $$\set{e^i}_{i=0}^{\infty}$$ para los laplacianos (no negativos) $$\Delta_M$$ activado $$L^2(M,g)$$ asociado a un colector Riemanniano cerrado $$(M,g)$$, definir

```math

M^{i,j,k} := \int_M e^i e^j \bar{e^k} \sqrt{g} dx = \bra{e^i e^j}\ket{e^k}

```

Ser isométrico para $$(M,g)$$, es una condición *necesaria y suficiente* para que otro colector riemanniano cerrado **isospectral** tenga una base ortonormal de funciones propias (por su laplaciano) que tanto preserva los valores propios asociados como posee una invariante $$\set{M^{i,j,k}}$$ bajo cada base.

</div>
</div>

<br>

Es importante reconocer $$M^{i,j,k}$$ no es una variable de base: hay una acción unitaria natural de cambio de base sobre ella discutida en detalle después de la prueba de este Teorema. La discusión incorpora ciertos conjuntos de valores singulares invariantes de base que uno podría formar una conjetura general alrededor, que afirma que ese conjunto ordenado de valores singulares caracteriza completamente el conjunto de colectores isospectrales.

Independientemente de la suficiencia de la mitad de la conjetura general, la necesidad siempre es el caso. Esto significa que estas colecciones de valores singulares están definidas por $$M^{i,j,k}$$ y asociados a cada triple espacio son un nuevo conjunto de **invariantes** de Riemann.

El arduo trabajo que se avecina para futuras investigaciones consiste en localizar tales pares de bases, o en determinar que tales pares no pueden existir en absoluto, simplemente examinando las propiedades de la $$M^{i,j,k}$$ en pruebas. Pero este artículo pone ese frente y centro objetivo: buscamos reducir las cuestiones de geometría analítica de la Teoría Espectral a preguntas de álgebra lineal computacionalmente trazables sobre productos de funciones propias.

*La simetría* juega un papel importante en los casos computacionalmente trazables [[TF17]](#TF17) [[LS18]](#LS18) [[PS94]](#PS94), que se ilustra adecuadamente en nuestro tori plano [Ejemplo](#example) abajo. Sin embargo, la fuerza de nuestro enfoque tal vez se haga más evidente en el caso de los colectores con el menor número de simetrías de Riemann, que es el caso genérico. En este caso, ofrecemos lo siguiente:

<br>

<div class="card border-dark">
  <div class="card-header">

#### Corolario 1

</div>
  <div class="card-body">

(Diagonal Litmus Test) Dados un par de valores propios que preservan las bases ortonormales como se describe en la hipótesis del Teorema, los colectores son isométricos si para cada elección de $$i,j,k$$, el producto $$M^{i,\bar i,k}\bar M^{j,\bar j,k}$$ está de acuerdo en ambas bases; y si el espacio vectorial $$\set{|e^i|^2}$$ es densa en $$\mathscr H$$. Aquí $$\bar j$$ representa la propia función $$\bar e^j$$ en los cálculos integrales de triple producto.

Además, si definimos $$\mathscr V$$ como el espacio de Hilbert generado por $$\set{|e^i|^2}$$, $$\mathscr V = \mathscr H$$ si un solo si el mapa adjunto
```math
[M^{i,\bar i, k}]^*:\mathscr H \rightarrow \mathscr V
```
es inyectable.
</div>
</div>

&nbsp;

<div class="card border-dark">
  <div class="card-header">

#### Corolario 2

</div>
  <div class="card-body">

Genéricamente, los colectores isospectrales son isométricos si y solo si los productos definidos en el Corolario 1 están de acuerdo como valores reales.

</div>
</div>

<br>

La motivación para el estudio de $$\set{M^{i,j,k}}$$ se deriva libremente del estudio del papel del **operador de multiplicación bilinear** $$Y:V\otimes V\rightarrow V((z))$$ en la definición de álgebra de operador de Vertex [[FBZ04]](#FBZ04) Teoría de Campo Conformal Chiral. Aquí $$V$$ es el espacio vectorial de los Estados y $$V((z))$$ es el espacio de la serie formal Laurent en $$z$$ con coeficientes en $$V$$. Desde $$V$$ A menudo viene equipado como un espacio de Hilbert con una serie tradicional de Fourier base ortonormal, indexación $$Y$$ utilizando los elementos básicos de Fourier de $$V$$ está un poco más implicada que la $$M^{i,j,k}$$ caso estudiado aquí, pero bastante similar en espíritu. Sin embargo, una comparación detallada está fuera del alcance de este artículo.

Si consideramos el mapa

```math
(M, g, \set{e^i}) \mapsto \set{\lambda_i, M^{i,j,k}}\ ,
```

Este artículo establece la inyectividad de este mapa para los colectores de Riemann cerrados (hasta la isometría de Riemann en su dominio). Otros resultados que aplican estas técnicas para describir su imagen (e inversa), dentro de espacios selectos de módulos de métricas, apenas están comenzando [[AA25]](#AA25). Allí, Anshul Adve aborda rigurosamente los espacios tangentes unitarios de 2-orbifolds compactos e hiperbólicos utilizando estas mismas **constantes de estructura** de la Teoría de Campo Conformal.

Algunas imágenes pueden ser útiles aquí. Si solucionamos $$(M,g)$$ y mirar las órbitas de $$\set{M^{i,j,k}}$$ bajo transformaciones unitarias de cambio de base que preservan el espectro en $$\set{e^i}$$, vemos que las órbitas de diferentes isospectrales $$(M,g)$$ Los pares particionan la imagen de este mapa a lo largo de las clases de isometría.

Finalmente, demostramos que el caso genérico métrico de Riemann se caracteriza por completo por el estudio de la "diagonal" $$\set{\lambda_i, M^{i,\bar i,k}}$$.

Estos resultados se demostraron por primera vez durante una charla titulada de manera similar por el autor en **MSRI** en 1997, pero aparecen aquí en forma publicada por primera vez.

## Preliminares

Ahora con $$M,g,e^i,M^{i,j,k}$$ como arriba, pues $$f \in C^\infty(M)$$ y $$i \geq 0$$ Tenga en cuenta que los **coeficientes de Fourier**

```math
\begin{aligned}

\hat{f}(i) &:= \int_M f(x)\bar{e^i}(x)\sqrt{g(x)}dx \\

\implies \\

f(x)        &= \sum_{i=0}^{\infty}\hat{f}(i)e^i(x)

\end{aligned}

```

desde $$f$$ es representable de forma única, ya que su convergencia rápida **Serie Fourier** ($$\Delta_M$$-incrustaciones específicas de Sobolev [[MT13]](#MT13) [[RS75]](#RS75)junto con la Ley Asintótica de Weyl [[HW11]](#HW11)los términos de la suma son $$o(i^{-n})$$ *uniforme en $$x$$* [[LH68]](#LH68), $$\forall n\in\N$$.) Entonces vemos que para $$f_1, f_2 \in C^\infty(M)$$, los coeficientes de Fourier del producto puntual $$f_1 f_2 \in C^\infty(M)$$ son

```math
\begin{aligned}

\widehat{f_1 f_2}(k) &= \sum_{i,j}^\infty\hat{f_1}(i)\hat{f_2}(j)M^{i,j,k} \\

\implies \\

f_1f_2(x) &= \sum_{i,j,k}\hat{f_1}(i)\hat{f_2}(j)M^{i,j,k}e^k(x) \\

f_1 = f^p_2,\space p > 2 \implies \\

\sum_{k}\hat{f_1}(k)e^k(x) &= \sum_{i_1,i_2,...,i_{2p-1}}\hat{f_2}(i_1)\hat{f_2}(i_2)\hat{f_2}(i_4)\hat {f_2}(i_6)...\hat{f_2}(i_{2p-2})M^{i_1,i_2,i_3}M^{i_3,i_4,i_5}...M^{i_{2p-3},i_{2p-2},i_{2p-1}}e^{i_{2p-1}}(x)

\end{aligned}
```

y así, *críticamente*, cualquier polinomio multivariante $$\weierp \in \Complex[z_1,...,z_l]$$ (en funciones lisas) **comuta** con cualquier preservación del espectro $$\Delta$$-eigenfunction orthonormal base mapa $$\vec{F}$$ que preserva $$\set{M^{i,j,k}}$$:

```math
\begin{CD}
  C^\infty(M,\space\Complex^l) @>\weierp >> C^\infty(M)\\
   @V\underbrace{\vec{F}\oplus\dots\oplus \vec{F}}_{l\space\text{times}}VV @VV\vec{F}V\\
  C^\infty(N,\space\Complex^l) @>>\weierp > C^\infty(N)
\end{CD}
```

Además, si $$A\subset M$$ es medible por Borel, luego los resultados anteriores se mantienen en el sentido de la función *característica de $$A$$* en todas partes excepto a lo largo del límite de $$A$$: si $$f = f^2$$ y $$A:=\set{x\in M|f(x)=1}$$,

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

Esto implica que cualquier mapa de base como el anterior lleva funciones características (como miembros de $$L^2(M,g)\subset L^1(M,g)$$) a las funciones características de una manera que preserva la medida.

El punto de estos cálculos es enfatizar el hecho de que $$\set{M^{i,j,k}}$$ **caracteriza** el análisis armónico del operador de multiplicación puntual en $$C^\infty(M)$$, que es una densa subalgebra del Abeliano $$C^*$$ álgebra $$C(M)$$por el teorema Stone-Weierstrass.

Para la rápida convergencia de estas sumas que implican $$M^{i,j,k}$$, tenga en cuenta que los productos de funciones propias son lisos, por lo que estos coeficientes de Fourier decaen como se indica anteriormente (en cada índice). Para más detalles, véase el trabajo de Emmett Wyman en 2022 con estos coeficientes en relación con la desigualdad del triángulo en los valores propios. [[EW22]](#EW22).

Note: siempre podemos asumir
```math
\begin{aligned}
e^0 &= M^{0,0,0} = 1/\sqrt{vol(M)} \\
\implies \\
M^{0,j,k} &= M^{j,0,k} = \delta_{j-k}\space/\sqrt{vol(M)}
\end{aligned}
```

donde $$\delta_i$$ Es el delta de Kronecker. Desde $$vol(M)$$ es una invariante espectral [[HW11]](#HW11), esta información ya está disponible a partir de consideraciones de isospectralidad.

## Prueba de teorema

Por necesidad, que $$F:(N,h)\rightarrow (M,g)$$ ser una isometría entre múltiples Riemannianos cerrados, y dejar que la base ortonormal objetivo de las funciones propias en $$L^2(N,h)$$ ser el retroceso mediante $$F$$ de la base ortonormal $$\set{e^i}$$ activado $$(M,g)$$ arriba. Desde

```math
\begin{aligned}
M^{i,j,k} &= \int_M e^i e^j \bar{e^k}\sqrt{g}dy \\
          &= \int_N e^i(F(x)) e^j(F(x))\bar{e^k}(F(x))\sqrt{h}dx

\end{aligned}
```

terminamos con el argumento de la necesidad porque $$\Delta_N(f\circ F) = (\Delta_M f) \circ F,\ \ \forall f\in C^\infty(M)$$.

Para la suficiencia, ahora consideramos el mapa lineal, bijetivo de la función propia ortonormal $$\vec{F}$$ desde $$C^\infty(M)$$ a $$C^\infty(N)$$ y tenga en cuenta que a partir de los cálculos [Preliminares](#preliminaries) arriba, $$\vec{F}$$ Preserva los productos de sentido común para funciones suaves (y preserva las funciones características cuando se extienden a $$L^2(M,g)$$) con la premisa de que $$\set{M^{i,j,k}}$$ invariante en este mapa.

### Lemma

$$\vec{F}: C^\infty(M)\rightarrow C^\infty(N)$$ Preserva la norma uniforme.

### Prueba de Lemma

Permitir $$\set{a_i}$$ ser una partición fluida de la unidad en $$M$$.

```math
\begin{aligned}
1 &= \sum_i a_i(x) \\
       &= \sum_{i,j} \hat{a_i}(j)e^j(x) \\
	   &= \sum_j e^j(x)\sum_i \hat{a_i}(j)
\end{aligned}
```

Así pues, $$\sum_i\hat{a_i}(j) = \delta_j\sqrt{vol(M)}$$ (delta de Kronecker).

Por el teorema de convergencia dominado,

```math
\lim_{p\rightarrow\infty}
\sum_j\hat{a^p_j}(k) = \int_{\dot{\bigcup}_j\set{a_j=1}}\bar{e^k}(x)\sqrt{g}dx
```

que es una función característica de la medida positiva en cada subconjunto separado $$\set{x\in M | a_j(x) = 1}$$. Esto significa que el Lemma está probado para cada $$a_j$$, ya que se conserva la función característica limitante de un conjunto con medida positiva, y por lo tanto tiene una norma uniforme 1, como todos los $$a_j^p,\space \vec{F}(a_j^p)=\vec{F}(a_j)^p,\space p\in\N$$, por Diagrama (6).

Sin pérdida de generalidad, podemos aplicar el resultado de caso especial mostrado para la partición suave de la unidad $$\lbrace|f|/\lVert f \rVert_\infty, 1 - |f|/\lVert f\rVert_\infty\rbrace$$donde $$ \set{x\in M|\space|f(x)| = \lVert f \rVert_\infty}$$ tiene una medida positiva, y el Lemma está probado en su totalidad.

Desde $$\set {\bar e^i}$$ constituye también una base de Fourier para $$L^2(M,g)$$, queda claro en la ecuación (4) que $$\vec F(\bar f) = \bar{\vec F}(f)$$. Esto significa que en un conjunto denso de $$C(M)$$ (y $$C(N)$$), hemos establecido $$\vec{F}$$ como un isomorfismo de Abeliano $$C^*$$ álgebras, y por lo tanto puede extenderse a un isomorfismo de $$C(M)$$ y $$C(N)$$ en la misma categoría.

Ahora aplicamos el Teorema de Representación Segal de Gelfand-Naimark (en forma de functor contravariante) para unital Abelian $$C^*$$ álgebras [[JC19]](#JC19) para representar este isomorfismo por un homeomorfismo $$F$$ celebrado entre $$N$$ y $$M$$. Dado que es bijetivo en funciones lisas, también debe ser suave.

Como ahora el diffeomorfismo $$F$$ preserva los valores propios y las funciones propias (por hipótesis sobre $$\vec{F}(f) = f\circ F$$), debe preservar al laplaciano en funciones suaves. Por lo tanto, también debe preservar los símbolos principales de estos mismos operadores elípticos. [[MT13]](#MT13). Los símbolos principales del Laplaciano son simplemente otro medio de expresar la métrica Riemanniana en los colectores en cuestión.

Esto completa la prueba del teorema.

### Discusión de Corolarios

Con $$\set{M_0^{i,j,k}}$$ y $$\set{M_1^{i,j,k}}$$ que representan los dos conjuntos de productos triples para las bases $$\set{e_0^i}$$ y $$\set{e_1^i}$$, vamos $$z_i \in U_1$$ ser el $$U_1^\infty$$ acción sobre una base ortonormal $$\set{e_1^i}$$. Así pues, elegiremos $$z_i$$ para que $$\set{z_ie_1^i}$$ rendimientos $$\set{M_0^{i,j,k}} = \set{z_i z_j \bar z_kM_1^{i,j,k}}$$.

¿Por qué es este el caso? En general, el grupo de simetría que actúa sobre el espacio de posibles bases ortonormales de funciones propias es el espacio de Operadores Unitarios. $$U: \mathscr H\rightarrow\mathscr H$$ que viajan con proyecciones $$P_{\mathscr V_\lambda}$$ en los espacios de ocho dimensiones finitas $$\mathscr V_{\lambda}$$ asociado a cada valor propio individual $$\lambda$$ de los laplacianos. Por lo tanto

```math
\begin{aligned}
P_{\mathscr V_{\lambda}}U(e^i) = UP_{\mathscr V_{\lambda}}(e^i),\ \therefore U(e^i) &= \sum_{\lambda_i = \lambda_j}u_{ij}e^j \implies \\
M_U^{i,j,k} := \int_M U(e^i)U(e^j)\bar U(\bar e^k)\sqrt g dx &= \sum_{\lambda_r = \lambda_i,\lambda_s=\lambda_j,\lambda_t=\lambda_k} u_{ir}u_{js}\bar u_{tk} M^{r,s,t}
\end{aligned}
```

es la imagen de $$M^{i,j,k}$$ bajo $$U$$acción de base $$e^i \mapsto U(e^i)$$.

Bajo las condiciones del Corolario 2, cada uno de los $$\mathscr V_\lambda$$ son espacios vectoriales unidimensionales sobre $$\Complex$$, pero eso también significa que son espacios vectoriales unidimensionales sobre $$\Reals$$, por lo que el grupo de simetría multiplicativa completa es $$O(1,\Reals)^\infty=\Z_2^\infty$$.

En términos más generales, el requisito previo asociado "sobre el acuerdo en los valores de los productos" serían simplemente "Preservación del conjunto ordenado de valores singulares (contados con multiplicidad) de los mapas lineales desde $$\mathscr V_{\lambda_i} \rightarrow Hom(\mathscr V_{\lambda_j}, \mathscr V_{\lambda_k})$$ definido por $$\set{M^{i,j,k}}$$." Aquí el producto interior en $$A,B \in Hom(\mathscr V_{\lambda_i}, \mathscr V_{\lambda_j})$$ es $$tr (B^*A)$$. Por definición, estos valores singulares son invariantes bajo sumas directas de transformaciones unitarias en $$\mathscr V_\lambda$$.

En el caso del espectro multiplicidad-1, el conjunto completo de valores singulares es simplemente el conjunto de valores absolutos de $$M^{i,j,k}$$ que, todavía conjeturamos, caracteriza completamente las clases de isometría de tales colectores isospectrales. Véase la Ecuación (22) para la relación clave entre esta conjetura y el Corolario 2. Lo que falta es el argumento de suficiencia de que si los valores absolutos están de acuerdo, los colectores son isométricos; lo que requiere un argumento para eliminar las posibles cancelaciones de cambio de signos entre las bases en los sumandos de la ecuación LHS (22).

Estamos significativamente menos seguros de que la conjetura general es cierta (fuera del caso del espectro de multiplicidad-1), ya que puede ser posible producir un contraejemplo (de suficiencia) a través de la construcción explícita de Sunada.

Si la notación del índice está ocultando la situación, tal vez esta descripción independiente de la base ayudará.  Tomar $$v_{\lambda} \in \mathscr V_{\lambda}$$ y considerar la expresión

$$
P_{\mathscr V_\gamma}(v_\alfa v_\beta).
$$

Recuerde que cada $$\mathscr V_\lambda$$ es un espacio euclidiano complejo dimensional finito. Todos $$M^{i,j,k}$$ es proporcionar coordenadas básicas de esta expresión independiente de la base. Desde $$1 = \oplus_\lambda P_{\mathscr V_\lambda}$$Lo que dice el Teorema es que la expresión anterior es **idéntica** entre los colectores si y solo si los colectores son isométricos; lo que debería venir como un shock para literalmente nadie. La mitad de la suficiencia de estas conjeturas son en gran medida problemas combinatorios que implican la reconstrucción de estas expresiones puramente a partir de su descomposición de valor singular.

Sin embargo, estas invariantes de base pueden resultar útiles para descifrar casos más complejos que implican demostrar que dos colectores isospectrales **no son isométricos**, mostrando que sus valores singulares no son idénticos entre las dos bases en cuestión.

#### Aside

La teoría de la representación de un grupo de mentiras compacto $$G$$ saca al laplaciano explícito de la ecuación y los estudios $$G$$-invariante (bajo acción izquierda o derecha) *irreducible* descomposiciones $$P_{\mathscr V_\lambda}$$ de $$L^2(G,dg)$$ (aquí) $$dg$$ es la medida normalizada de probabilidad de Haar en $$G$$) como $$\oplus_\lambda P_{\mathscr V_\lambda}$$y honra su interacción en la expresión anterior como los artefactos esenciales de la Teoría de la Mentira, como se aborda en el Teorema de Peter-Weyl [[AK01]](#AK01). Las geometrías Riemannianas compatibles son generadas por opciones convenientes de elementos Casimir cuadráticos que se encuentran en el centro del álgebra envolvente universal, que son de menos importancia que la propia descomposición irreductible. **Su descomposición espectral** es un (menos conveniente) reensamblaje de esos componentes irreductibles, ya que el elemento Casimir asociado es constante en cada componente irreductible.

Wigner $$3j$$ símbolos para $$SU(2)$$ constituyen un buen ejemplo para seguir estudiando &mdash; Apliquemos nuestra construcción general a ella como un colector de grupo. Cada representación unitaria irreductible de dimensiones finitas de $$SU(2)$$ está etiquetado por medio entero no negativo $$j = 0, \tfrac12, 1, \tfrac32, \dots  $$. Escribimos $$\mathscr  V_j  $$ para el $$ (2j+1)  $$Espacio dimensional en el que actúa esta representación. Una base ortonormal estándar de $$\mathscr  V_j $$ es la base magnética $$  \ket{j\ m}$$ con $$m = -j,-j+1,\dots,j.$$

La ecuación

```math
\begin{pmatrix}
j_1 & j_2 & j_3 \\
m_1 & m_2 & m_3
\end{pmatrix}
:=(-1)^{j_1-j_2-m_3}\frac{1}{\sqrt{2j_3+1}}C^{j_3\ -m_3}_{j_1\ m_1,j_2\ m_2}
```
expresa el $$3j$$ Definición del símbolo en términos de los coeficientes Clebsch-Gordan $$C^{j\ m}_{j_1\ m_1\,j_2\ m_2}:=\bra{j_1\ m_1,j_2\ m_2}\ket{j\ m}$$, que tienen expresiones de forma cerrada como la fórmula de Racah que sustenta las bibliotecas modernas de software numérico [[JF16]](#JF16).

A $$3j$$ símbolo desaparece a menos que $$m_1+m_2+m_3=0$$las desigualdades del triángulo $$|j_1-j_2|\le j_3\le j_1+j_2$$ mantener, y $$j_1+j_2+j_3$$ es un entero.

Desde el punto de vista del grupo compacto $$SU(2)$$, el $$3j$$ Los símbolos son precisamente los operadores que se entrelazan (bien normalizados y por fases) que se dan cuenta del subespacio invariante único (hasta la escala) del producto de triple tensor. $$\mathscr V_{j_1}\otimes \mathscr V_{j_2}\otimes \mathscr V_{j_3}$$ Cuando el producto contiene la representación trivial. Por lo tanto, son las constantes naturales de la "estructura" para la fusión de tres representaciones irreducibles al singlete.

Esto es exactamente análogo al papel jugado por las integrales de triple producto. $$M^{i,j,k}$$ en un colector riemanniano: son las constantes de la estructura del producto puntual de las funciones propias cuando ese producto se expande de nuevo en la base propia. En el grupo $$SU(2)$$ propias, esas integrales reducen al $$3j$$-símbolos.

Para ingeniar, dejar $$D^{j}_{m n}(g)$$ ser el Wigner estándar $$D$$-funciones (coeficientes de matriz de la irrep de espín) $$j$$). Con respecto a la medida de probabilidad Haar normalizada $$dg$$ tiene la fórmula exacta [[VK88]](#VK88)

```math
\int_{SU(2)}
D^{j_1}_{m_1 n_1}(g)\,
D^{j_2}_{m_2 n_2}(g)\,
\overline{D^{j_3}_{m_3 n_3}(g)}\,dg
=
\begin{pmatrix}
j_1 & j_2 & j_3 \\
m_1 & m_2 & -m_3
\end{pmatrix}
\begin{pmatrix}
j_1 & j_2 & j_3 \\
n_1 & n_2 & -n_3
\end{pmatrix}
\times
(-1)^{m_3+n_3}.
```

(La convención general de la fase se puede ajustar por los factores habituales de Condon-Shortley; el punto esencial es que los factores integrales en un producto de dos reales $$3j$$-símbolos.) Cuando los índices $$i,j,k$$ del papel sobre una base ortonormal completa de coeficientes de matriz ordenados aumentando $$j$$ (y luego por índices magnéticos) $$m,n$$), las cantidades $$M^{i,j,k}$$ son precisamente los números que aparecen en el lado derecho de arriba.

El teorema de Peter-Weyl proporciona una base ortonormal completa de $$L^2(SU(2),dg)$$ dados por los coeficientes de matriz renormalizados:

$$e^{j,m,n}(g):=\sqrt{2j+1}\ D^{j}_{mn}(g),$$

donde los índices se extienden

$$j=0,\tfrac12,1,\tfrac32,\dots,\ m,n=-j,-j+1,\dots,j.$$

Combining the two equations one obtains the explicit expression:

```math
\begin{aligned}
M^{(j_1 m_1 n_1),(j_2 m_2 n_2),(j_3 m_3 n_3)}
&=
\sqrt{(2j_1+1)(2j_2+1)(2j_3+1)}\\
&\ \times
\begin{pmatrix}
j_1 & j_2 & j_3 \\
m_1 & m_2 & -m_3
\end{pmatrix}
\begin{pmatrix}
j_1 & j_2 & j_3 \\
n_1 & n_2 & -n_3
\end{pmatrix}
(-1)^{m_3+n_3}.
\end{aligned}
```

Para los grupos de mentiras abelianos compactos, estos componentes irreductibles son todos unidimensionales, por lo que su situación es completamente similar a la descomposición espectral de la multiplicidad 1 de los laplacianos anteriores.  Más sobre esto en el ejemplo a continuación.

Volviendo al Corolario 1, observamos que la prueba implica establecer esta implicación:

```math
z_k = M_0^{i,\bar i,k} / M_1^{i,\bar i,k} \,\, \forall i,k\in\N,\, ⋺ M_0^{i,\bar i,k} \ne 0 \, \implies
\exists r,s,t \in \N\ ⋺\ \frac{M_0^{i,j,k}}{M_1^{i,j,k}} = \frac{M_0^{r,\bar r,i}M_0^{s,\bar s,j}\bar M_0^{t,\bar t,k}}{M_1^{r,\bar r,i}M_1^{s,\bar s,j}\bar M_1^{t,\bar t,k}}\, .
```

Podemos esperar que por cualquier $$k>0$$, $$M_0^{i,\bar i,k}$$ no puede ser idéntico $$0$$ para todos $$i$$, ya que es una condición genéricamente verdadera, pero falsa para casos específicos como el caso de tori plano cubierto en el ejemplo a continuación. Una forma más alta de ver esta condición es notar que tal esperanza viola $$k$$ habría $$\bar e^k$$ en el núcleo del mapa adjunto $$[M^{i,\bar i,k}]^*$$. Además, la fórmula <span class="eqno"></span> para $$z_k$$ requiere tanto $$i$$-independencia, y suficiencia, para establecer el mapa base $$e_0^i \mapsto z_i e_1^i$$ conserva $$\set{M_0^{i,j,k}}$$.

Esbozamos una prueba de Corolario 1 (suficiencia) por debajo del siguiente conjunto de fórmulas.

Sin embargo, calculemos algunas identidades relevantes para que algunos futuros investigadores intrépidos puedan profundizar en la conjetura generalizada. Aquí $$v\cdot w$$ es el producto interior Riemannian en el paquete cotangent:

```math
\begin{aligned}
\Delta fg &= f\Delta g + g\Delta f - 2 df \cdot dg \implies \\
M^{i,j,k} &= 2 \frac{\bra{de^i\cdot de^j}\ket{e^k}}{\lambda_i +\lambda_j -\lambda_k} \implies \\
\frac{\bra{de^i\cdot de^j}\ket{e^k}}{\bra{e^ie^j}\ket{e^k}} &= \frac{\lambda_i+\lambda_j-\lambda_k}{2}\ \text{ when }M^{i,j,k} \ne 0\ .\\
\text {So the quadratic form} \\
Q_k(f,g) :&= \bra{df\cdot dg}\ket{e^k} = \sum_{i,j}\hat{f}(i)\hat{g}(j)\bra{de^i\cdot de^j}\ket{e^k} \\
&= \frac{1}{2}\sum_{i,j}\hat{f}(i)\hat{g}(j)(\lambda_i + \lambda_j - \lambda_k)M^{i,j,k}\\
df \cdot dg &= \sum_k Q_k(f,g)e^k = -\frac{\Delta fg - f\Delta g - g\Delta f}{2}.\\
\text{Now with }J \text{ real-analytic}\\
Q^J_k(f,g) :&= -\frac{1}{2}\bra{(J(\sqrt{\Delta})fg - fJ(\sqrt{\Delta})g - gJ(\sqrt{\Delta})f}\ket{e^k} \\
&= -\frac{1}{2}(\bra{fg}\ket{J(\sqrt{\Delta}) e^k} - \bra{fJ(\sqrt{\Delta})g + gJ(\sqrt{\Delta})f}\ket{e^k})\\
&= \frac{1}{2}\sum_{i,j}\hat{f}(i)\hat{g}(j)(J(\sqrt{\lambda_i}) + J(\sqrt{\lambda_j}) - J(\sqrt{\lambda_k})M^{i,j,k}\\
\tilde{Q}_k(f,g) :&= -\frac{1}{2}\bra{\sqrt{\Delta} fg - f\sqrt{\Delta}g -g\sqrt{\Delta}f}\ket{e^k} \\
&= \frac{1}{2}\sum_{i,j} \hat{f}(i)\hat{g}(j)(\sqrt{\lambda_i} + \sqrt{\lambda_j} - \sqrt{\lambda_k})M^{i,j,k}\\
\end{aligned}
```

Nota: para el estuche de torsión plana unidimensional a continuación, $$\tilde{Q}_k(e^i,e^j) = 0$$ desde $$\sqrt{\Delta} = \sqrt{-1}\frac{d}{dx}$$ es una verdadera derivación.

## Prueba de corolarios

Now consider the famous associativity relations from Conformal Field Theory:

```math
\begin{aligned}
e^ie^je^k = \sum_\ell\bra{e^ie^j}\ket{\bar{e^k}e^\ell}e^\ell &= \sum_{\ell,r} M^{i,j,r}\bar M^{\bar k,\ell,r}e^\ell\\
&= \sum_{\ell,r} M^{i,k,r}\bar M^{\bar j,\ell,r}e^\ell\ \therefore\\
i = \bar j, \ell = k\text{ and relabeling } \implies \\
\sum_r M^{i,\bar i,r}\bar M^{j,\bar j,r} &= \sum_r |M^{i,j,r}|^2
\end{aligned}
```

Corolario 1 se deriva del hecho de que $$z_k\in U_1$$ está bien definido (es decir, $$i$$-invariante por las hipótesis sobre los productos), y la observación previa de que los operadores algebraicos, delimitados trilineales definidos por $$z_iz_j\bar z_kM_1^{i,j,k}$$ y $$M_0^{i,j,k}$$ ambos asociativos, y están de acuerdo con la multiplicación de la función puntual por cuadrados de valores absolutos de funciones propias, que es densa en $$\mathscr H$$. Establecimiento $$\ker\ [M^{i,\bar i,k}]^* = 0$$ es exactamente equivalente, donde $$\mathscr V$$ es el espacio cerrado de Hilbert generado por $$\set{|e^i|^2}$$y $$[M^{i,\bar i,k}]:\mathscr V\rightarrow \mathscr H$$ es el mapa de identidad de cambio de base.

Así que están de acuerdo en todas partes.

La suficiencia del Corolario 2 sigue observando que la condición del núcleo del mapa adjunto que desaparece en el Corolario 1 es genéricamente cierta. Y si por alguna elección de $$i,j,k$$, el producto $$M^{i,\bar i,k} \bar M^{j,\bar j,k}$$ En desacuerdo entre bases, estarían en desacuerdo en cada par de bases.

¿Por qué? Dado que se puede presumir que los colectores genéricos también tienen espectros de multiplicidad 1, esto reduce el grupo de simetría completo a $$U_1^\infty$$ donde estos productos son invariantes, contradiciendo el Teorema 1. Reducción ulterior de $$\Z_2^\infty$$ a través de bases de valor real garantiza que los productos sean de valor real. Esto establece la necesidad de la hipótesis, y completa la prueba.

Además, los argumentos de la prueba del Corolario 1 son válidos incluso cuando los colectores no son isospectrales, por lo que podemos representar el mapa base como un diffeomorfismo si y solo si los productos coinciden en el caso genérico anterior. La isospectralidad entonces se convierte en equivalente a este diffeomorfismo siendo una isometría riemanniana.

Esto completa la prueba de los Corolarios.

## Ejemplo

Permitir $$\set{\lambda_i} \subset \R^n$$ ser una clasificación indexada $$n$$ enrejado de Lie Algebra pesos para el cociente espacio representación de $$\frak{g}=\Reals^n$$ como campos vectoriales invariantes de traducción (es decir, constantes) en sí mismos, cuando $$\R^n$$ también se considera $$\frak{g}$$el Grupo Lie asociado sobre un toro definido por $$\Reals^n/A\Z^n, A \in GL(n,\Reals)$$. Estos pesos definen elevadores integrables de 1 forma sobre el toro que se integran a los funcionales lineales. $$\bra{x} \lambda_i\rangle,\space x\in\Reals^n$$ como su grupo de mentiras (que cubre el toro). Estas funciones lineales se pueden volver a escalar uniformemente (por $$2\pi \sqrt{-1}$$) y exponenciado para formar caracteres multiplicativos que descienden para formar una base ortonormal de $$L^2(\Reals^n/A\Z^n,dx)$$, con la medida Lebesgue (Haar) $$dx$$.

Además, esta base diagonaliza simultáneamente el Laplaciano del toro plano **porque** el Laplaciano es la imagen de un elemento cuadrático simétrico, negativo-definido Casimir bajo este cociente (coeficiente de operador diferencial lineal constante) representación espacial del álgebra envolvente universal. Por lo tanto, sus valores propios están en proporción constante (de $$4\pi^2$$) al casimir-elemento-determinado-longitud-cuadrado del peso de cada personaje en la red.

Actualmente consideramos la base anterior

```math
\set{e^{2\pi\sqrt{-1}\langle{x}|\lambda_i\rangle}/\sqrt{|\det A|}}_{i=0}^\infty
```
ser nuestra base de Fourier aplicable al teorema de funciones propias ortonormales (carácter multiplicativo) (de esta representación cociente del elemento (negativo) Euclidiano Casimir) directamente correspondiente a $$\set{\lambda_i}$$. Por las hipótesis de nuestro teorema, debemos tener $$i < j \implies \lVert\lambda_i\rVert \leq \lVert\lambda_j\rVert$$ (con la norma euclidiana sobre los pesos).

Ahora podemos calcular

```math
M^{i,j,k} = \begin{cases}
1/\sqrt{|\det A|} & \lambda_i + \lambda_j - \lambda_k = 0 \\
0 & \text{otherwise}
\end{cases}
```

Como esta ecuación <span class="eqno"></span> sólo depende de la red de peso en sí, es ortonormal-basis-índice invariante. Además, es *solo *invariante bajo transformaciones lineales en la red de pesas $$(A^{-1})^t\Z^n = \set{\lambda_i}$$, así que sólo $$L^2$$ mapa de base de funciones propias ortonormales **que se induce a partir de un mapa lineal invertible que preserva el volumen entre dos de dichos rangos indexados $$n$$ cerraduras de peso** mantendrá "algebraico/topológico" juego de datos indexados $$\set{M^{i,j,k}}$$ invariante.

Sin embargo, para aplicar nuestra [Teorema](#theorem)Es esencial que este mapa lineal $$B$$ ser $$B\in SO(n,\Reals)$$ en la red de pesas, porque el $$L^2$$ mapa de la base de la función propia

```math
\set{e^{2\pi\sqrt{-1}\langle x| B\lambda_i\rangle}/\sqrt{|\det A|}}_{i=0}^\infty
```

debe preservar también "analítico" invariables &mdash; la cifra inducida por el elemento Casimir $$4\pi^2\lVert\lambda_i\rVert^2$$ para cada peso indexado, es decir, los valores propios individuales del laplaciano de flat-tori.

Como ejemplifica el dúo de Milnor, tener un mapa que preserve las longitudes de los pesos de la celosía no es suficiente para deducir que el mapa está en $$SO(n,\Reals)$$; también debemos saber que el mapa conserva los ángulos de peso de celosía. Pero esto es una consecuencia de las fórmulas desarrolladas en Ecuación (21):

```math
-4\pi^2\bra{\lambda_i}\ket{\lambda_j}e^ie^j = de^i\cdot de^j = 2\pi^2\sum_k (\lVert\lambda_i\rVert^2 + \lVert\lambda_j\rVert^2 - \lVert\lambda_k\rVert^2)M^{i,j,k}e^k = 2\pi^2(\lVert\lambda_i\rVert^2 + \lVert\lambda_j\rVert^2 - \lVert\lambda_i + \lambda_j\rVert^2)e^ie^j\ .
```

Lo bueno de este análisis es que hemos demostrado que no hay un mapa **lineal** entre las celosías que preserva los valores propios sin que el mapa sea inducido por una isometría riemanniana en el tori. &mdash; Como consecuencia del Teorema, no porque los cálculos explícitos involucrados sean identidades de polarización simples.

Esta representación-cuenta teórica [[AK01]](#AK01) es exactamente equivalente al desarrollo previo de *congruencia de la rejilla* [[NRR22]](#NRR22) tradicionalmente utilizado para delinear clases de isometría de tori plano. De hecho, la matriz transpone tal mapa lineal $$B\in SO(n,\Reals)$$, como se describe en el párrafo anterior, **es** la contravariante isometría Riemanniana entre los tori, según lo dispuesto por la aplicación del *Teorema de Representación Segal de Gelfand-Naimark* durante el [Prueba](#proof-of-theorem) de nuestra [Teorema](#theorem).

## Reconocimientos

La investigación original fue financiada en parte por un gracioso Premio de Investigación James Simons en 1995-1996, y el generoso apoyo de un Alfred P. Sloan Dissertation Fellowship en 1996-1997 en la Universidad de Stony Brook.

El autor también desea dar las gracias a Tanya Christiansen, Carolyn Gordon, Hamid Hezari, Harish Seshadri y especialmente a Leon Takhtajan por su asistencia técnica y revisión en la preparación de este manuscrito para su publicación.

<!-- $Date$ $Author$ $Revision$ -->
