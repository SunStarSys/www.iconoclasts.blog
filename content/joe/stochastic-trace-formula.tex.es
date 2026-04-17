\clasededocumento{artículo}
\usepackage[hidelinks]{hyperref}
\usepackage[tipo={CC},modificador={by-nc-nd},versión={4.0}]{doclicense}
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
% modernas, opciones compatibles con utf8 (totalmente incompatibles con amscd):
\PassOptionsToPackage{partial=upright}{unicode-math}
\usepackage{fontsetup}
\usepackage{tikz-cd}

\usepackage[estilo=alfabético]{biblatex}
\addbibresource{/content/joe/stochastic-trace-formula.bib.en}
% de macros matemáticas-física útiles
\usepackage{braket}
\usepackage{physics}
% Unicode
\usepackage[utf8]{inputenc}

% de metadatos
\title{Fórmula de rastreo estocástico para manifolds cerrados y curvos negativos}
\date{2024\\May}
\author{Joe Schaefer\\\href{mailto://Joe\%20Schaefer\%20<joe@sunstarsys.com>}{joe@sunstarsys.com}}

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

\tableofcontenido

Mi \textit{1997 Ph.D. tesis} como entrada de blog.

\section{Sólo hay una medida n-Dimensional Wiener}

\sección{Aproximaciones lineales de trozos al movimiento browniano}

\section{El mapa de desarrollo DM}

\sección{La fórmula Cameron-Martin}

\sección{Heat Kernels as Radon-Nicodym Derivatives of Weiner Measure} (Núcleos de calor como derivados de radón-nicodimio de Weiner Measure).

\sección{Notation}

$M$ es un colector Riemannian cerrado con curvatura negativa $\dim=n$ con la métrica $g$, la conexión métrica $\nabla$ y (no negativo) el operador Laplace-Beltrami $\Delta_M$.  Deje que $k_{-t\Delta/2}(x,y)$ represente el núcleo de calor en $M$.

Por lo tanto, $k_{-t\Delta/2}(x,x) = dDM_*\mu/\sqrt{g}dx$ es la derivada radon-nicodimia de la medida de exención n-dimensional $\mu$, restringida a la recuperación del espacio de bucle continuo $\Omega_t(M)\vert_x$, a través del inverso de la asignación de desarrollo de conservación de medida Weiner $DM$. *Nota:* $DM^{-1}\Omega_t\vert_x$ no es un espacio de bucle.

$\Omega_t^0$ es el espacio de bucles continuos contratables en $M$.

$\Omega_t[\gamma]$ es el espacio de bucles continuos en la homotópica $M$ a la geodésica cerrada $\gamma$. Deje que $\gamma_0$ sea su bucle primitivo.

$DM^{-1}\Omega_t^0[\gamma]$ es la imagen previa de los bucles continuos contratables en $M$ escritos como compensaciones homotópicas en $\gamma(s) = DM(\frac{s\ell(\gamma)}{t}\vec{e}^1), 0\leq s \leq t$. Piense en coordenadas horocíclicas: cada fibra es el límite geométrico de las esferas geodésicas periódicas $S_{\gamma_0(s)}^{n-1}(k\ell(\gamma_0)), 0\leq s \leq t, k\rightarrow\infty$, vectorizado en el paquete normal por encima de $\gamma_0$. Nuestras restricciones de curvatura implican Coordenadas Horocíclicas para cada $\gamma_0$ existen como un mapa de coordenadas suave y compatible con $DM$ para $\Omega_t^0[\gamma]$.

Ahora $\vec{x}(\tau)+\ell(\gamma)\vec{e}^1$ es el punto final \textit{undeveloped} del "desplazamiento" \textit{kinked geodesic} homotópico a $\gamma: DM(\vec{x}(\tau) + \frac{s\ell(\gamma)}{t}\vec{e}^1), 0\leq s \leq t$. La curva es periódica con el punto $\ell(\gamma_0)$, y revisa su punto de partida retorcido $DM(\vec{x}(\tau))$ a la vez $t$, lo que hace que el cálculo de su derivado hacia adelante $J=\lim_{s\uparrow t}DM^\prime\vert_{DM(\vec{x}(\tau) + \frac{\ell(\gamma)s}{t}\vec{e}^1)}$ pueda capturarse como un automatismo lineal de $T_{DM(\vec{x}(\tau))}M$. Es importante destacar que $J_{DM(\vec{x}(\tau)+\ell(\gamma)\vec{e}^1)}$ se puede construir utilizando \textbf{Jacobi Fields}, ya que $DM$ \textbf{es} el mapa exponencial (establecido) a lo largo de cualquier serie de líneas rectas conectadas en $\mathbb{R}^n$. Estudiaremos $1/2 \int_0^t \bra{dX}\ket{dX}_s$, con la solución

\principio{ecuación}
\principio{alineado}
X_t &amp;= X_0 + \int_0^t \sqrt{J}_{X_t} dB_t  \\
\end{aligned}
\end{ecuation}

$Z_{-\Delta/2}(t):= \int_M k_{-t\Delta/2}(x,x) \sqrt{g}dx = \sum_{j=0}^\infty e^{-\lambda_i t/2}$ es el rastreo del núcleo de calor.

Finalmente definamos lo siguiente a partir de sus derivados radón-nicodimáticos:

\principio{ecuación}
\principio{alineado}
DM_*\mu(\Omega_t) &amp;:= \int_M DM_*\mu(\Omega_t\vert_x \sqrt{g}dx)\\\
DM_*\mu(\Omega^0_t) &amp;:= \int_M DM_*\mu(\Omega^0_t\vert_x \sqrt{g}dx)\\\
DM_*\mu(\Omega_t[\gamma]) &amp;:= \int_M DM_*\mu(\Omega_t[\gamma]\vert_x \sqrt{g}dx) \\
\end{aligned}
\end{ecuation}

\section{Fórmula de rastreo estocástico}

\principio{ecuación}
\principio{alineado}
Z_{-\Delta/2}(t) = DM_*\mu(\Omega_t) &amp;= DM_*\mu(\Omega^0_t) + \sum_{\set{\gamma}} DM_*\mu(\Omega_t[\gamma]) \\\
DM_*\mu(\Omega_t^0) &amp;\approx_{t\rightarrow 0} (2\pi t)^{-n/2}(vol(M) + t/6\int_M K(x)\sqrt{g} dx + O(t^2))\space \small\text{by McKean-Singer}\\\
DM_*\mu(\Omega_t[\gamma]) &amp;= e^{-\ell(\gamma)^2/2t}\int_M DM_*\mu(e^{\bra{J_BB_t}\ket{B_t}} _t \Omega_t^0[\gamma]\vert_x\sqrt{g}dx)\space\small \text{ de Cameron-Martin}\\\
&amp;= e^{-\ell(\gamma)^2/2t}\int_{T_{\gamma_0}M} E(e^{J_B}_{t} | \Omega_t^0[\gamma]\vert_{x(\tau)})dx^1(\tau)\dots dx^n(\tau) d\tau\\\
\frac{dDM_*\mu(e^{-\ell(\gamma)x^1(t)}\Omega^0_t[\gamma])}{dx^1(\tau)\dots dx^n(\tau)d\tau}\vert_{\vec{y(\tau)}}&amp;\approx_{t\rightarrow 0} \frac{e^{-\bra{|I-J_{DM(\vec{x}(\tau),\vec{y}(\tau))}\vec{x}(\tau)}\ket{\vec{x}(\tau)}}/2t}}{(2 \pi t)^{(n+1)/2}}(1+O(t^2))\small \text{ semiclásico limit}\\\
\text{Coordenadas corocíclicas}: z(\tau) - x(\tau) &amp;= x + \ell(\gamma)\vec{e}^1\implies\\
\int_{M/S^1\oplus S^1}k_t(x,z) dx &amp;=\lim_{j\rightarrow\infty}\frac{e^{-\ell(\gamma)^2/2t}}{\sqrt{2\pi t}}E(e^{\bra{J_{X^j_t}\vec{x}}\ket{\vec{x}}})\\\
&amp;=\lim_{j\rightarrow\infty}\frac{e^{-\ell(\gamma)^2/2t}}{\sqrt{2\pi t}}\int_{M^j/S^1\oplus S^1}\frac{1}{\sqrt{2\pi t}^{jn}\det|I-J_{X^j}|}e^{-\ell(X^j)^2/2t}X^{j}\\\\
\end{aligned}
\end{ecuation}

\section{Aproximación y la Fórmula de Rastreo de Selberg}

En la caja de superficie $\dim = 2$ constante curvatura $-\kappa^2$,

\principio{ecuación}
\principio{alineado}
\sqrt{J_{\vec{x}, \vec{y}}}dRB&amp;=
\principio{pmatrix}
e^{\kappa d(\vec{x},\vec{y})/2} &amp;&amp; 0\\
0 &amp;&amp; e^{-\kappa d(\vec{x},\vec{y})/2}\\\
\end{pmatrix}
\implica&amp;\\
\bra{\sqrt{J}dRB}\ket{\sqrt{J}dRB} &amp;= e^{\kappa \ell(B)}dRB_1^2 - e^{-\kappa \ell(B)}dRB_2^2\\\
\int_0^t \bra{\sqrt{ J}dB}\ket{\sqrt{ J}dB} &amp;= e^{\kappa\ell(\gamma)} - e^{-\kappa\ell(\gamma)}\\\
\det I-J_{\gamma} &amp;= (e^{\kappa\ell(\gamma)/2}- e^{-\kappa\ell(\gamma)/2})^2
\end{aligned}
\end{ecuation}

que es constante sobre $(\vec{x},\tau)$, por lo que la línea aproximada de $\approx_{t\rightarrow 0}$ en la ecuación (2) se convierte en \textit{exact}:

\principio{ecuación}
\principio{alineado}
DM_*\mu(\Omega_t[\gamma]) &amp;= \frac{e^{-\ell(\gamma)^2/2t}\ell(\gamma_0)}{\sqrt{2 \pi t}(e^{\kappa\ell(\gamma)/2} -e^{-\kappa\ell(\gamma)/2})}\\\
\gamma(t) = \gamma_0(kt)\implica \\
&amp;=\frac{e^{-k^2\ell(\gamma_0)^2/2t}\ell(\gamma_0)}{2\sqrt{2\pi t}\sinh k\kappa\ell(\gamma_0)/2}\\\
\end{aligned}
\end{ecuation}

En la caja del colector hiperbólico $\dim=3$, usamos coordenadas complejas $(z,\bar{z})$ en el paquete normal para escribir

\principio{ecuación}
\principio{alineado}
J_{DM(\vec{x}+(\tau+\ell(\gamma))\vec{e}^1)} &amp;=
\principio{pmatrix}
e^{\kappa\ell(\gamma)} &amp;&amp; 0 &amp;&amp; 0\\
0 &amp;&amp; e^{-\kappa\ell(\gamma)+i\theta(\gamma)} &amp;&amp; 0 \\
0 &amp;&amp; 0 &amp;&amp; e^{-\kappa\ell(\gamma)-i\theta(\gamma)} \\
\end{pmatrix}\\
\implica&amp; \\
\det I-{\perp_{\gamma_0}}^k &amp;= |1-e^{-k(\kappa\ell(\gamma_0)-i\theta(\gamma_0))}|^2
\end{aligned}
\end{ecuation}
y dado que $z=x^2+ix^3 \implica d\bar{z}\wedge dz= (dx^2-idx^3)\wedge(dx^2+idx^3) = 2idx^2\wedge dx^3$, la aproximación de la ecuación (2) vuelve a ser exacta:

\principio{ecuación}
\principio{alineado}
\kappa &amp;= 1 \implica \\
DM_*\mu(\Omega_t[\gamma])
&amp;=\frac{e^{-k^2\ell(\gamma_0)^2/2t}\ell(\gamma_0)}{2\sqrt{2\pi t (1-e^{-k\ell(\gamma_0)})}|e^{k\ell(\gamma_0)/2}-e^{-k(\ell(\gamma_0)/2-i\theta(\gamma_0))}|}\\\\
\end{aligned}
\end{ecuation}

\doclicenseThis
\pagebreak
\printbibliografía

\end{document}
