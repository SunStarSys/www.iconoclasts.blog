\clasededocumento{artículo}
\usepackage[hidelinks]{hyperref}
\usepackage[tipo={CC},modificador={by-nc-nd},versión={4.0}]{doclicense}
\usepackage{fontspec}
\usepackage[scr=rsfs]{mathalpha}

\usepackage[margen=1in]{geometry}

\newenvironment{subproof}[1][\proofname]{%
  \renewcommand{\qedsymbol}{$\blacksquare$}%
  \comenzar{proof}[#1]%
}{%
  \end{proof}%
}

% de paquetes de AMS
\usepackage{amsmath}
\usepackage{amsthm}
\usepackage{amssymb}

% moderno, utf8 amigable
\PassOptionsToPackage{partial=upright}{unicode-math}
\usepackage{fontsetup}
\usepackage{tikz-cd}

\usepackage[estilo=alfabético]{biblatex}
\addbibresource{content/joe/triple-products.bib.en}

% de macros matemáticas-física útiles
\usepackage{braket}
\usepackage{physics}

% de metadatos
\title{Triple Productos de Autofunciones y Geometría Espectral}
\date{2026\\February}
\author{Joe Schaefer\\Presidente, SunStar Systems\\ \href{mailto://Joe\%20Schaefer,\%20Ph.D.\%20<joe@sunstarsys.com>}{joe@sunstarsys.com}}

% Teorema, Lema, etc.
\theoremstyle{plain}
\nteorema{teorema}{teorema}
\newtheorem{corollary}[theorem]{Corollary}
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{claim}{Claim}[theorem]
\newtheorem{axiom}[theorem]{Axiom}
\newtheorem{conjecture}[theorem]{Conjecture}
\nnewtheorem{fact}[theorem]{Fact}
\nteorema{hipótesis}[teorema]{hipótesis}
\newtheorem{assumption}[theorem]{Assumption}
\newtheorem{proposition}[theorem]{Proposition}
\newtheorem{criterion}[theorem]{Criterion}
\theoremstyle{definition}
\newtheorem{definition}[theorem]{Definition}
\newtheorem{example}[theorem]{Example}
\newtheorem{remark}[theorem]{Remark}
\newtheorem{problem}[theorem]{Problem}
\nnewtheorem{principle}[theorem]{Principle}

\inicio{document}

\maketitle

\comenzar{abstract}
Utilizando técnicas elementales del Análisis Geométrico, Ecuaciones Diferenciales Parciales y Algebras Abelianas $C^*$, descubrimos una invariante geométrica global novedosa, pero familiar, a saber, el conjunto indexado de integrales de productos triples de funciones propias del operador Laplace-Beltrami, para caracterizar con precisión qué colectores isospectrales cerrados de Riemannian son isométricos.

\noindent\textbf{Keywords:} espectro, Fourier, armónico, productos triples, Laplaciano, funciones propias, funcional, problema inverso, teoría de la representación
\end{abstract}

\tableofcontenido

\sección{Introduction}
\label{sec:intro}

Para un colector Riemanniano cerrado $(M,g)$, que caracteriza su clase de colectores isospectrales no isométricos, es un tipo de Problema Inverso \cite{DH11} en Geometría Espectral. Se podría especular ingenuamente que esta clase siempre estaría vacía. Sin embargo, la literatura académica es rica en construcciones de décadas de antigüedad de pares específicos de contraejemplos: comenzando en 1964 con el par de 16 dimensiones de John Milnor de tori plano no isométrico, isospectral \cite{JM64}, y continuando \cite{CS92} hacia la caracterización dimensional genérica de tori plano en la tesis doctoral de Alexander Schiemann de 1993 \cite{AS94} -- repleto de una búsqueda asistida por computadora para el caso crítico $\dim = 3$.  En \cite{NRR22} aparece un estudio moderno de la historia completa de los tori planos.

A lo largo del camino fueron vástagos perspicaces en espacios de cobertura simétricos más sofisticados, no euclidianos; la construcción de tales "deudores" isospectrales, no isométricos que implican tensores de curvatura no triviales (y sus características de Euler determinadas por el espectro en la dimensión 2 \cite{MS67}.) Un buen ejemplo de este esfuerzo fue la invención de Toshikazu Sunada en 1985 \cite{TS85} de un marco espacial de uso general, que luego desplegó en el mismo trabajo para construir dúos hiperbólicos en las dimensiones 2 y 3.

Para las métricas riemannianas no homogéneas, Carolyn Gordon descubrió dúos que ni siquiera son localmente isométricos \cite{CG93}.

El trabajo continúa en muchas áreas relacionadas \cite{DH11}, como la determinación de las características topológicas de la clase de colectores isospectrales, no isométricos en general (vacío \cite{ST80}, finito \cite{AS94}, rígido \cite{GK80} y compacto \cite{GZ97}) como un subconjunto de diferentes espacios de módulos de métricas de Riemann.

Lo que ofrecemos en este artículo es una nueva perspectiva sobre una herramienta familiar: coeficientes de Fourier indexados de pares de productos de funciones propias como un discreto "algebraico / topológico invariante" para complementar el existente, discreto "invariante analítico" - el espectro no negativo del operador Laplace-Beltrami (en este caso conocido como el (no negativo) \textit{Laplacian}) en $\mathscr H = L^2(M,g)$.  Combinado, observamos que el par proporciona una "representación geométrica global discreta" de las clases de isometría de los colectores isospectrales y cerrados de Riemann.

\subsección{Results}
\label{subsec:res}

\principio{teorem}
\etiqueta{thm}

Dada una (no disminución en los valores propios) base ortonormal de las funciones propias $\set{e^i}_{i=0}^{\infty}$ para el (no negativo) Laplaciano $\Delta_M$ en $L^2(M,g)$ asociado a un colector Riemanniano cerrado $(M,g)$, defina

\principio{ecuación}
M^{i,j,k} := \int_M e^i e^j \bar{e^k} \sqrt{g} dx = \bra{e^i e^j}\ket{e^k}
\end{ecuation}

Para ser isométrico a $(M,g)$, es una condición necesaria y suficiente para que otro colector isospectral Riemanniano cerrado tenga una base ortonormal de funciones propias (para su Laplaciano) que tanto preserva los valores propios asociados y posee una invariante $\set{M^{i,j,k}}$ bajo cada base.
\end{theorem}

\textit{Symmetry} desempeña un papel importante en los casos computacionalmente rastreables \cite{TF17} \cite{LS18} \cite{PS94}, que se ilustra acertadamente en nuestro ejemplo de tori plano ~\ref{sec:ex} a continuación. Sin embargo, la fuerza de nuestro enfoque quizás se haga más evidente en el caso de los colectores con el menor número de simetrías de Riemann, que es el caso genérico que a menudo coincide con los valores propios que son únicos (es decir, sin multiplicidad no trivial). En este caso, ofrecemos lo siguiente:

\comenzar{conjecture}
\etiqueta{conj}
Si cada valor propio tiene multiplicidad $1$, dado un par de bases ortormales preservadoras de valor propio como se describe en la hipótesis del Teorema, los colectores son isométricos si y solo si el $\set{M^{i,j,k}}$ por una base está de acuerdo, hasta el valor absoluto en los términos individuales, con la otra base.
\end{conjecture}

La motivación para el estudio de $\set{M^{i,j,k}}$ se deriva vagamente del estudio del papel del operador de multiplicación bilinear $Y:V\otimes V\rightarrow V(((z))$ en la definición de un álgebra del operador de Vertex \cite{FBZ04} asociado con una teoría de campo conformal quiral. Aquí $V$ es el espacio vectorial de los Estados y $V((z))$ es el espacio de la serie formal Laurent en $z$ con coeficientes en $V$. Dado que $V$ a menudo viene equipado como un espacio de Hilbert con una base ortonormal serie de Fourier tradicional, la indexación de $Y$ utilizando los elementos de base de Fourier de $V$ es sólo un poco más involucrado que el caso $M^{i,j,k}$ estudiado aquí, pero bastante similar en espíritu. Sin embargo, una comparación detallada está fuera del alcance de este artículo.

Si consideramos el mapa
\principio{ecuación}
(M, g, \set{e^i}) \mapsto \set{\lambda_i, M^{i,j,k}}\ ,
\end{ecuation}

Este artículo establece la inyectividad de este mapa para los colectores de Riemann cerrados (hasta la isometría de Riemann en su dominio). Otros resultados que aplican estas técnicas para describir su imagen (e inversa), dentro de espacios selectos de módulos de métricas, solo están empezando a \citar{AA25}.  Allí, Anshul Adve aborda rigurosamente los espacios tangentes unitarios de 2-orbifolds compactos e hiperbólicos, utilizando estas mismas \textit{constantes de estructura} de la Teoría de Campo Conformal.

Estos resultados se demostraron por primera vez durante una charla titulada de manera similar por el autor en \textbf{MSRI} en 1997, pero aparecen aquí en forma publicada por primera vez.

\sección{Preliminaries}
\label{sec:pre}

Ahora con $M,g,e^i,M^{i,j,k}$ como en las hipótesis del teorema~\ref{thm}, para $f \in C^\infty(M)$ y $i \geq 0$, tenga en cuenta que los coeficientes \textit{Fourier}

\principio{ecuación}
\label{eqn:Fourier}
\principio{alineado}
\hat{f}(i) y:= \int_M f(x)\bar{e^i}(x)\sqrt{g(x)}dx \\
\implica \\
f(x)        &amp;= \sum_{i=0}^{\infty}\hat{f}(i)e^i(x)\,,
\end{aligned}
\end{ecuation}

ya que $f$ es representable de forma única ya que su convergencia rápida \textit{Fourier Series} ($\Delta_M$-specific Sobolev Embeddings \cite{MT13} \cite{RS75}, junto con la Ley Asintótica de Weyl \cite{HW11}, implican que los términos en la suma son $o(i^{-n})$ uniformemente en $x$ \cite{LH68}, $\forall n\in\mathbb{N}$.) A continuación, vemos que para $f_1, f_2 \in C^\infty(M)$, los coeficientes de Fourier del producto puntual $f_1 f_2 \in C^\infty(M)$ son

\principio{ecuación}
\principio{alineado}
\widehat{f_1 f_2}(k) &amp;= \sum_{i,j}^\infty\hat{f_1}(i)\hat{f_2}(j)M^{i,j,k} \\
\implica \\
f_1f_2(x) &amp;= \sum_{i,j,k}\hat{f_1}(i)\hat{f_2}(j)M^{i,j,k}e^k(x) \\
f_1 &amp;= f^p_2,\, p > 2 \implica \\
\sum_{k}\hat{f_1}(k)e^k(x) &amp;= \sum_{i_1,i_2,\ldots,i_{2p-1}}\hat{f_2}(i_1)\hat{f_2}(i_2)\hat{f_2}(i_4)\hat {f_2}}(i_6)\ldots\hat{f_2}(i_{2p-2})M^{i_1,i_2,i_3}M^{i_3,i_4,i_5}\ldots M^{i_{2p-3},i_{2p-2},i_{2p-1}}e^{i_{2p-1}}(x)
\end{aligned}
\end{ecuation}

y así, críticamente, cualquier polinomio multivariante $\wp \in \mathbb{C}[z_1,\ldots,z_l]$ (en funciones fluidas) se desplaza con cualquier mapa de base ortonormal $\delta$-eigenfunction $\vec{F}$ que preserva $\set{M^{i,j,k}}$:

\principio{ecuación}
\etiqueta{fig}
\comenzar{tikzcd}
  C^\infty(M,\space\mathbb{C}^l)\arrow[swap]{d}{\underbrace{\vec{F}\oplus\dots\oplus \vec{F}}_{l\,\text{times}}} \arrow{r}{\wp} &amp; C^\infty(M) \arrow{d}{\vec{F}}\\%
  C^\infty(N,\space\mathbb{C}^l) \arrow{r}{\wp} &amp; C^\infty(N)
\fin{tikzcd}
\end{ecuation}

Además, si $A\subjuego M$ es medible por Borel, los resultados anteriores se mantienen de forma puntual para la función característica de $A$ en todas partes, excepto en el límite de $A$: si $f = f^2$ y $A:=\set{x\in M|f(x)=1}$,

\principio{ecuación}
\sum_{i}\hat{f}(i)e^i(x) = \sum_{i,j,k}\hat{f}(i)\hat{f}(j)M^{i,j,k}e^k(x) = \begin{cases}
1 y x \in \mathring{A} \\
0 y x \en \mathring{A^\complement}\end{cases}\,,
\end{ecuation}

y por singularidad, tenemos la siguiente identidad

\principio{ecuación}
\principio{alineado}
\hat{f}(k) &amp;= \sum_{i,j}\hat{f}(i)\hat{f}(j)M^{i,j,k}\,,\, \forall k\geq 0 \\
\iff f&amp;=f^2 \, a.e.
\end{aligned}
\end{ecuation}

Esto implica que cualquier mapa de base como el anterior lleva funciones características (como miembros de $L^2(M,g)\subjuego L^1(M,g)$) a funciones características de una manera de preservación de la medida.

El punto de estos cálculos es enfatizar el hecho de que $\set{M^{i,j,k}}$ caracteriza el Análisis Armónico del operador de multiplicación puntual en $C^\infty(M)$, que es un subálgebra densa del álgebra abeliana $C^*$ $C(M)$, por el teorema de Stone-Weierstrass.

Para la rápida convergencia de estas sumas anteriores que implican $M^{i,j,k}$, tenga en cuenta que los productos de funciones propias son suaves, por lo que estos coeficientes de Fourier decaen como arriba (en cada índice). Para más detalles, véase el trabajo de Emmett Wyman en 2022 con estos coeficientes en relación con la desigualdad del triángulo en los valores propios \cite{EW22}.

Nota: siempre podemos asumir

\principio{ecuación}
\principio{alineado}
e^0 &amp;= M^{0,0,0} = 1/\sqrt{vol(M)} \\
\implica \\
M^{0,j,k} &amp;= M^{j,0,k} = \delta_{j-k}\space/\sqrt{vol(M)}\,,
\end{aligned}
\end{ecuation}

donde $\delta_i$ es el delta de Kronecker. Dado que $vol(M)$ es una invariante espectral \cite{HW11}, esta información ya está disponible a partir de consideraciones de isospectralidad.

\section{Prueba de teorema~\ref{thm}}
\label{sec:proof}

\comenzar{prueba}
Por necesidad, deje que $F:(N,h)\rightarrow (M,g)$ sea una isometría entre colectores Riemannianos cerrados y deje que la base ortonormal de destino de las funciones propias en $L^2(N,h)$ sea la recuperación a través de $F$ de la base ortonormal $\set{e^i}$ en $(M,g)$ arriba. Desde

\principio{ecuación}
\principio{alineado}
M^{i,j,k} &amp;= \int_M e^i e^j \bar{e^k}\sqrt{g}dy \\
          &amp;= \int_N e^i(F(x)) e^j(F(x))\bar{e^k}(F(x))\sqrt{h}dx\,,
\end{aligned}
\end{ecuation}

hemos terminado con el argumento de necesidad porque $\Delta_N(f\circ F) = (\Delta_M f) \circ F,\ \ \forall f\in C^\infty(M)$.

Para la suficiencia, ahora consideramos la asignación de base de autofunción ortonormal lineal, bijetiva $\vec{F}$ de $C^\infty(M)$ a $C^\infty(N)$ y observamos que a partir de los cálculos de la Sección~\ref{sec:pre} anterior, $\vec{F}$ conserva los productos de forma puntual para funciones sin problemas (y conserva las funciones características cuando se amplía a $L^2(M,g)$) por la premisa de que $\set{M^{i,j,k}}$ no varía en este mapa.

\comenzar{lemma}
\label{lma}
$\vec{F}: C^\infty(M)\rightarrow C^\infty(N)$ conserva la norma uniforme.
\end{lemma}

\begin{subproof}[Prueba de Lemma~\ref{lma}]
Deje que $\set{a_i}$ sea una partición de unidad sin problemas en $M$.

\principio{ecuación}
\principio{alineado}
1 &amp;= \sum_i a_i(x) \\
       &amp;= \sum_{i,j} \hat{a_i}(j)e^j(x) \\
	   &amp;= \sum_j e^j(x)\sum_i \hat{a_i}(j)
\end{aligned}
\end{ecuation}

Por lo tanto, $\sum_i\hat{a_i}(j) = \delta_j\sqrt{vol(M)}$ (delta de cronecker).

Por el teorema de convergencia dominado,
\principio{ecuación}
\lim_{p\rightarrow\infty}
\sum_j\hat{a^p_j}(k) = \int_{\dot{\bigcup}_j\set{a_j=1}}\bar{e^k}(x)\sqrt{g}dx\,,
\end{ecuation}

que es una función característica de la medida positiva en cada subconjunto separado $\set{x\in M | a_j(x) = 1}$. Esto significa que el Lemma está probado para cada $a_j$, ya que se conserva la función de característica limitante de un conjunto con medida positiva y, por lo tanto, tiene una norma uniforme 1, al igual que todos los $a_j^p,\, \vec{F}(a_j^p)=\vec{F}(a_j)^p,\, p\in\mathbb{N}$, por Diagrama~\ref{fig}.

Sin pérdida de generalidad, podemos aplicar el resultado de caso especial que se muestra para la partición sin problemas de unidad $\lbrace|f|/\lVert f \rVert_\infty, 1 - |f|/\lVert f\rVert_\infty\rbrace$, donde $ \set{x\in M|\space|f(x)| = \lVert f \rVert_\infty}$ tiene una medida positiva y el Lemma está probado en su totalidad.

\end{subproof}

Dado que $\set {\bar e^i}$ también es una base de Fourier para $L^2(M,g)$, queda claro de la ecuación~\ref{eqn:Fourier} que $\vec F(\bar f) = \bar{\vec F}(f)$. Esto significa que en un conjunto denso de $C(M)$ (y $C(N)$), hemos establecido $\vec{F}$ como un isomorfismo de álgebras Abelianas $C^*$, y por lo tanto se puede extender a un isomorfismo de $C(M)$ y $C(N)$ en la misma categoría.

Ahora aplicamos el Teorema de Representación de Gelfand-Naimark (en forma de functor contravariante) para álgebras de Abeliano unital $C^*$ \cite{JC19} para representar este isomorfismo $\vec{F}$ por un homeomorfismo $F$ entre $N$ y $M$. Dado que $\vec{F}$ es bijetivo en funciones sin problemas, $F$ también debe ser sin problemas.

Como este diffeomorfismo ahora preserva los valores propios y las funciones propias (por hipótesis en $\vec{F}(f) = f \circ F$), debe preservar el Laplaciano en funciones suaves. Por lo tanto, $F$ también debe conservar los símbolos principales de estos mismos operadores elípticos \cite{MT13}. Los símbolos principales del Laplaciano son simplemente otro medio de expresar la métrica Riemanniana en los colectores en cuestión.

Esto completa la prueba del teorema.

\end{proof}

\subsección{Discusión de la Conjetura~\ref{conj}}
\label{subsec:conj}

Con $\set{M_0^{i,j,k}}$ y $\set{M_1^{i,j,k}}$ que representan los dos juegos de productos triples para las bases $\set{e_0^i}$ y $\set{e_1^i}$, permita que $z_i \in \set{-1,1}$ sea la acción $\mathbb{Z}_2^\infty$ en una base ortonormal de valor $\mathbb{R}$ $\set{e_1^i}$. Por lo tanto, debemos seleccionar $z_i$ para que $\set{z_ie_1^i}$ genere $\set{M_1^{i,j,k}} = \set{z_i z_j z_kM_0^{i,j,k}}$.

¿Por qué es este el caso? En general, el grupo de simetría que actúa sobre el espacio de las posibles bases ortonormales de las funciones propias es el espacio de los operadores unitarios $U: \mathscr H\rightarrow\mathscr H$ que se desplazan con las proyecciones $P_{\mathcal V_\lambda}$ en los espacios de origen de dimensión finita $\mathcal V_{\lambda}$ asociados con cada valor propio individual $\lambda$ de laplaciana. Por lo tanto

\principio{ecuación}
\principio{alineado}
P_{\mathcal V_{\lambda}}U(e^i) = UP_{\mathcal V_{\lambda}}(e^i),\ \por lo tanto U(e^i) &amp;= \sum_{\lambda_i = \lambda_j}u_{ij}e^j \implica \\
U^{i,j,k} := \int_M U(e^i)U(e^j)\bar U(\bar e^k)\sqrt g dx &amp;= \sum_{\lambda_r = \lambda_i,\lambda_s=\lambda_j,\lambda_t=\lambda_k} u_{ir}u_{js}\bar u_{tk} M^{r,s,t}
\end{aligned}
\end{ecuation}

es la imagen de $M^{i,j,k}$ en la acción base de $U$ $e^i \mapsto U(e^i)$.

Ahora, en las condiciones de la conjetura, cada uno de los $\mathcal V_\lambda$ son espacios vectoriales unidimensionales sobre $\mathbb{C}$, pero eso también significa que son espacios vectoriales unidimensionales sobre $\mathbb{R}$, por lo que el grupo de simetría multiplicativa completo es $O(1,\mathbb{R})^\infty=\mathbb{Z}_2^\infty$.

Sin la restricción de multiplicidad, el requisito previo asociado de la conjetura "con respecto al acuerdo en valores absolutos" se convertiría, por lo tanto, en "conservación del conjunto ordenado de valores singulares de $\set{M^{i,j,k}}$, contado con multiplicidad, cuando se ve como una recopilación de asignaciones de $\mathcal V_{\lambda_i} \rightarrow Hom(\mathcal V_{\lambda_j}, \mathcal V_{\lambda_k}^*)$". Resulta que este es un conjunto razonablemente robusto de invariantes unitarios. Estamos significativamente menos seguros de que esta conjetura generalizada es cierta, ya que puede ser posible producir un contraejemplo a través de la construcción explícita de Sunada.

Volviendo a la conjetura original, observamos que la prueba implica establecer esta implicación:

\principio{ecuación}
\etiqueta{fml}
z_k = M_0^{i,i,k} / M_1^{i,i,k} \,\, \forall i,k\in\mathbb{N},\,  ⁇  M_0^{i,i,k} \ne 0 \, \implica
\existe r,s,t \in \mathbb{N}\  ⁇ \ \frac{M_0^{i,j,k}}{M_1^{i,j,k}} = \frac{M_0^{r,r,i}M_0^{s,s,j}M_0^{t,t,k}}{M_1^{r,r,i}M_1^{s,s,j}M_1^{t,t,k}}\,
\end{ecuation}

Esperamos que $k$, $M_0^{i,i,k}$ no puedan ser $0$ iguales para todos los $i$. Al principio, esto no parece imposible si $M$ tiene un grupo de simetría "even/odd", y $e^k$ es extraño, pero la esperanza es cierta para el caso flat-tori a continuación (que no satisface la multiplicidad de valor propio uniforme = 1 condición). Además, la fórmula~\ref{fml} para $z_k$ requiere independencia de $i$ y suficiencia para establecer la asignación base $e_0^i \mapsto z_i e_1^i$ conserva $\set{M_0^{i,j,k}}$. Todos estos aspectos siguen siendo desconocidos.

Sin embargo, calculemos algunas identidades relevantes para que algún intrépido futuro investigador pueda profundizar en esta conjetura:

\principio{ecuación}
\principio{alineado}
\Delta fg &amp;= f\Delta g + g\Delta f - 2 df \cdot dg \implies \\
M^{i,j,k} &amp;= 2 \frac{\bra{de^i\cdot de^j}\ket{e^k}}{\lambda_i +\lambda_j -\lambda_k}\\
\text{Ahora por polarización}\\
M^{i,j,k} &amp;= \frac{\bra{(e^i+e^j)^2 - (e^i - e^j)^2}\ket{e^k}}{4} = \frac{M^{i,i,k} + M^{j,j,k} - \bra{(e^i-e^j)^2}\ket{e^k}}{2},\\
\text {y así la forma cuadrática} \\
Q_k(f,g):&amp;= \bra{df\cdot dg}\ket{e^k} = \sum_{i,j}\hat{f}(i)\hat{g}(j)\bra{de^i\cdot de^j}\ket{e^k} \\
&amp;= \frac{1}{2}\sum_{i,j}\hat{f}(i)\hat{g}(j)(\lambda_i + \lambda_j - \lambda_k)M^{i,j,k}.\\
\text{Ahora con}\, J\, \text{real-analytic}\\
Q^J_k(f,g):&amp;= -\frac{1}{2}\bra{(J(\sqrt{\Delta})fg - fJ(\sqrt{\Delta})g - gJ(\sqrt{\Delta})f}\ket{e^k} \\
&amp;= -\frac{1}{2}(\bra{fg}\ket{J(\sqrt{\Delta}) e^k} - \bra{fJ(\sqrt{\Delta})g + gJ(\sqrt{\Delta})f}\ket{e^k})\\\\
&amp;= \frac{1}{2}\sum_{i,j}\hat{f}(i)\hat{g}(j)(J(\sqrt{\lambda_i}) + J(\sqrt{\lambda_j}) - J(\sqrt{\lambda_k})M^{i,j,k}\\
\tilde{Q}_k(f,g):&amp;= -\frac{1}{2}\bra{\sqrt{\Delta} fg - f\sqrt{\Delta}g -g\sqrt{\Delta}f}\ket{e^k} \\
&amp;= \frac{1}{2}\sum_{i,j} \hat{f}(i)\hat{g}(j)(\sqrt{\lambda_i} + \sqrt{\lambda_j} - \sqrt{\lambda_k})M^{i,j,k}\\\
df \cdot dg &amp;= \sum_k Q_k(f,g)e^k = -\frac{\Delta fg - f\Delta g - g\Delta f}{2}\\
Q_0(f,f) &amp;= \frac{1}{\sqrt{vol(M)}}\sum_i \hat{f}(i)^2 \lambda_i\\
df\cdot df = \sum_kQ_k(f,f)e^k &amp;= \frac{1}{2}\sum_{i,j,k}\hat{f}(i)\hat{f}(j)(\lambda_i + \lambda_j -\lambda_k)M^{i,j,k}e^k\\\
&amp;= \frac{1}{4}\sum_{i,j,k}\hat{f}(i)\hat{f}(j)(\lambda_i + \lambda_j -\lambda_k)(M^{i,i,k} + M^{j,j,k} - \bra{(e^i-e^j)^2}\ket{e^k})e^k\\\\
 = g^2 &amp;= \sum_{i,j,k}\hat{g}(i)\hat{g}(j)M^{i,j,k}e^k \implica\\
 \frac{1}{2}\sum_{i,j}\hat{f}(i)\hat{f}(j)(\lambda_i + \lambda_j - \lambda_k)M^{i,j,k} &amp;= \sum_{i,j}\hat{g}(i)\hat{g}(j)M^{i,j,k} \\
&amp;= \widehat{g^2}(k). \\
\end{aligned}
\end{ecuation}

Nota: para el caso de flat-tori unidimensional siguiente, $\tilde{Q}_k(e^i,e^j) = 0$ desde $\sqrt{\Delta} = \sqrt{-1}\frac{d}{dx}$ es una derivación verdadera.

\sección{Ejemplo}
\etiqueta{sec:ex}

Deje que $\set{\lambda_i} \subset \mathbb{R}^n$ sea una red $n$ indexada de pesos de álgebra de mentira para la representación de espacio cociente de $\mathfrak{g}=\mathbb{R}^n$ como campos vectoriales invariantes de traducción (es decir, constantes) en sí mismos, cuando $\mathbb{R}^n$ también se vea como el grupo de mentiras asociado de $\mathfrak{g}$ en un toro definido por $\mathbb{R}^n/A\mathbb{Z}^n, A \in GL(n,\mathbb{R})$. Estos pesos definen elevadores integrables de 1 forma sobre el toro que se integran a los funcionales lineales $\bra{x} \lambda_i\rangle,\, x\in\mathbb{R}^n$ como su Grupo Lie (que cubre el toro). Estos funcionales lineales se pueden escalar uniformemente (en $2\pi \sqrt{-1}$) y exponenciar para formar caracteres multiplicativos que descienden para formar una base ortonormal de $L^2(\mathbb{R}^n/A\mathbb{Z}^n,dx)$, con la medida de Lebesgue (Haar) $dx$.

Además, esta base diagonaliza simultáneamente el Laplaciano del toro plano, porque el Laplaciano es la imagen de un elemento cuadrático simétrico, negativo-definido Casimir bajo este cociente (operador diferencial lineal de coeficiente constante) representación espacial del álgebra envolvente universal. Por lo tanto, sus valores propios están en proporción constante (de $4\pi^2$) al cuadrado de longitud determinada del elemento de Casimir del peso de cada personaje en la red.

Actualmente consideramos la base anterior

\principio{ecuación}
\{e^{2\pi\sqrt{-1}\bra{x}\lambda_i\rangle}/\sqrt{|\det A|}\}_{i=0}^\infty
\end{ecuation}

ser nuestra base de Fourier aplicable al teorema de funciones propias ortonormales (carácter multiplicativo) (de esta representación del cociente del elemento (negativo) Euclidean Casimir) directamente correspondiente a $\set{\lambda_i}$. Por las hipótesis de nuestro teorema, debemos tener $i < j \implies \lVert\lambda_i\rVert\leq \lVert\lambda_j\rVert$ (with the Euclidean norm on the weights).

Ahora podemos calcular

\principio{ecuación}
\etiqueta{eqn:a}
M^{i,j,k} = \inicio{cases}
1/\sqrt{|\det A|} y \lambda_i + \lambda_j - \lambda_k = 0 \\
0 y \text{de lo contrario}
\end{cases}
\end{ecuation}

Como esta ecuación~\ref{eqn:a} solo es invariante en transformaciones lineales en la red de ponderación $(A^{-1})^t\mathbb{Z}^n = \set{\lambda_i}$, solo un mapa de base de función propia ortonormal $L^2$ que se induce a partir de un mapa lineal invertible que preserva el volumen entre dos de dichas redes de peso indexadas, de rango $n$ mantendrá invariante el juego de datos indexado "algebraico/topológico" $\set{M^{i,j,k}}$.

Sin embargo, para aplicar el teorema~\ref{thm}, es esencial que un mapa lineal de este tipo $B$ sea $B\en SO(n,\mathbb{R})$ en la red de ponderación, porque el mapa de base de función propia inducido de $L^2$

\principio{ecuación}
\{e^{2\pi\sqrt{-1}\bra{x}B\lambda_i\rangle}/\sqrt{|\det A|}\}_{i=0}^\infty
\end{ecuation}

También debe conservar las invariantes "analíticas": la cifra inducida por el elemento Casimir $4\pi^2\lVert\lambda_i\rVert^2$ para cada peso indexado, es decir, los valores propios individuales del laplaciano del tori plano.

Esta cuenta teórica de representación \cite{AK01} es exactamente equivalente al desarrollo previo de \textit{lattice congruence} \cite{NRR22} tradicionalmente utilizado para delinear clases de isometría de tori plano. De hecho, la matriz transpone dicho mapa lineal $B\en SO(n,\mathbb{R})$, como se describe en el párrafo anterior, \textbf{is} la contravariante isometría riemanniana entre el tori, según lo proporcionado por
aplicación del \textit{Gelfand-Naimark Representation Theorem} durante la prueba del Teorema~\ref{thm}.

\párrafo{Acuse de recibo}
La investigación original fue financiada en parte por un gracioso Premio de Investigación James Simons en 1995-1996, y el generoso apoyo de un Alfred P. Sloan Dissertation Fellowship en 1996-1997 en la Universidad de Stony Brook.

El autor también desea dar las gracias a Tanya Christiansen, Carolyn Gordon, Hamid Hezari, Harish Seshadri y especialmente a Leon Takhtajan por su asistencia técnica y revisión en la preparación de este manuscrito para su publicación.

\doclicenseThis

\pagebreak

\printbibliografía

\end{document}
