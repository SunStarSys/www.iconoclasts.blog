\dokumentklass{article}
\usepackage[hidelinks]{hyperref}
\usepackage[type={CC},modifier={by-nc-nd},version={4.0}]{doclicense}
\usepackage[margin=1in]{geometry}

\newenvironment{subproof}[1][\proofname]{%
  \renewcommand{\qedsymbol}{$\blacksquare$}%
    \begin{proof}[#1]%
    }{%
    \end{proof}%
}

% AMS-paket

\usepackage{amsmath}
\usepackage{amsthm}
\usepackage{amssymb}
% moderna, utf8 vänliga alternativ (helt inkompatibel med amscd):
\PassOptionsToPackage{partial=upright}{unicode-math}
\usepackage{fontsetup}
\usepackage{tikz-cd}

\usepackage[style=alphabetic]{biblatex}
\addbibresource{/content/joe/stochastic-trace-formula.bib.en}
% användbara matematiska makron
\usepackage{braket}
\usepackage{physics}
% Unicode
\usepackage[utf8]{inputenc}

% metadata
\title{Stochastic trace formula för slutna, negativt böjda grenrör}
\date{2024\\May}
\författare{Joe Schaefer\\href{mailto://Joe\%20Schaefer\%20<joe@sunstarsys.com>}{joe@sunstarsys.com}}

% sats, lemma osv.
\theoremstyle{plain}
\newtheorem{theorem}{Theorem}
\newtheorem{corollary}[sats]{Corollary}
\newtheorem{lemma}[sats]{Lemma}
\newtheorem{claim}{Claim}[sats]
\newtheorem{axiom}[sats]{Axiom}
\newtheorem{conjecture}[sats]{Conjecture}
\newtheorem{fact}[sats]{Fact}
\newtheorem{hypothesis}[sats]{Hypothesis}
\newtheorem{assumption}[sats]{Assumption}
\newtheorem{proposition}[sats]{Proposition}
\newtheorem{criterion}[sats]{kriterier
\theoremstyle{definition}
\newtheorem{definition}[sats]{Definition}
\newtheorem{example}[sats]{Example}
\newtheorem{remark}[sats]{Remark}
\newtheorem{problem}[sats]{Problem}
\newtheorem{principle}[sats]{Principle}

\starta{document}
\maketitle

\tableofcontent

Min \textit{1997 Ph.D. avhandling} som blogginlägg.

\sektion{Det finns bara ett n-dimensionellt Wienermått}

\sektion{Piecewise linjära approximationer till Brownian Motion}

\sektion{The Development Map DM}

Bild från Cameron-Martin Formula

\sektion{Värmekärnor som Radon-Nicodym Derivat av Weiner Measure}

\sektion{Notation}

$M$ är en negativt böjd $\dim=n$ stängd Riemannmångfald med metriska $g$, metriska anslutningen $\nabla$ och (icke-negativa) Laplace-Beltrami Operator $\Delta_M$.  Låt $k_{-t\Delta/2}(x,y)$ representera värmekärnan på $M$.

Därför $k_{-t\Delta/2}(x,x) = dDM_*\mu/\sqrt{g}dx$ är Radon-Nicodym-derivatet av det n-dimensionella Wiener-måttet $\mu$, begränsat till tillbakadragandet av det kontinuerliga looputrymmet $\Omega_t(M)\vert_x$, via inversen av Weiner-måttbevarande utvecklingsmappningen $DM$. *Obs!* $DM^{-1}\Omega_t\vert_x$ är inte ett looputrymme.

$\Omega_t^0$ är utrymmet för kontinuerliga, avtalbara slingor på $M$.

$\Omega_t[\gamma]$ är utrymmet för kontinuerliga slingor på $M$ homotopic till den stängda geodetiska $\gamma$. Låt $\gamma_0$ vara dess primitiva slinga.

$DM^{-1}\Omega_t^0[\gamma]$ är förebilden av kontinuerliga avtalbara slingor på $M$ som skrivs som förskjutningar av homotop till $\gamma(s) = DM(\frac{s\ell(\gamma)}{t}\vec{e}^1), 0\leq s \leq t$. Tänk Horocykliska koordinater - varje fiber som den geometriska gränsen för periodiska geodetiska sfärer $S_{\gamma_0(s)}^{n-1}(k\ell(\gamma_0)), 0\leq s \leq t, k\rightarrow\infty$, vektoriserad i det normala paketet över $\gamma_0$. Våra krökningsbegränsningar innebär att Horocykliska koordinater för varje $\gamma_0$ finns som en smidig, $DM$-kompatibel koordinatkarta för $\Omega_t^0[\gamma]$.

Nu $\vec{x}(\tau)+\ell(\gamma)\vec{e}^1$ är slutpunkten för \textit{undeveloped} för "offset" \textit{kinked geodesic} homotopisk till $\gamma: DM(\vec{x}(\tau) + \frac{s\ell(\gamma)}{t}\vec{e}^1), 0\leq s \leq t$. Kurvan är periodisk med perioden $\ell(\gamma_0)$, och den återgår till sin kinkade startpunkt $DM(\vec{x}(\tau))$ vid tiden $t$, vilket gör beräkningen av dess framåt härledda $J=\lim_{s\uparrow t}DM^\prime\vert_{DM(\vec{x}(\tau) + \frac{\ell(\gamma)s}{t}\vec{e}^1)}$ kanaliserbar som en linjär automatisorfism på $T_{DM(\vec{x}(\tau))}M$. Viktigt är att $J_{DM(\vec{x}(\tau)+\ell(\gamma)\vec{e}^1)}$ kan konstrueras med \textbf{Jacobi Fields}, eftersom $DM$ \textbf{is} den (itererade) exponentiella kartan längs någon serie anslutna raka linjer i $\mathbb{R}^n$. Vi kommer att undersöka 1/2 $ \int_0^t \bra{dX}\ket{dX}_s$, med lösningen

\starta{equation}
\starta{aligned}
X_t &amp;= X_0 + \int_0^t \sqrt{J}_{X_t} dB_t  \\
\slut{aligned}
\slut{equation}

$Z_{-\Delta/2}(t) := \int_M k_{-t\Delta/2}(x,x) \sqrt{g}dx = \sum_{j=0}^\infty e^{-\lambda_i t/2}$ är spåren av värmekärnan.

Låt oss slutligen definiera följande från deras Radon-Nicodym derivat:

\starta{equation}
\starta{aligned}
DM_*\mu(\Omega_t) &amp;:= \int_M DM_*\mu(\Omega_t\vert_x \sqrt{g}dx)\\
DM_*\mu(\Omega^0_t) &amp;:= \int_M DM_*\mu(\Omega^0_t\vert_x \sqrt{g}dx)\\
DM_*\mu(\Omega_t[\gamma]) &amp;:= \int_M DM_*\mu(\Omega_t[\gamma]\vert_x \sqrt{g}dx) \\
\slut{aligned}
\slut{equation}

\sektion{formel för tochastisk spårning}

\starta{equation}
\starta{aligned}
Z_{-\Delta/2}(t) = DM_*\mu(\Omega_t) &amp;= DM_*\mu(\Omega^0_t) + \sum_{\set{\gamma}} DM_*\mu(\Omega_t[\gamma]) \\
DM_*\mu(\Omega_t^0) &amp;\approx_{t\rightarrow 0} (2\pi t)^{-n/2}(vol(M) + t/6\int_M K(x)\sqrt{g} dx + O(t^2))\space \small\text{by McKean-Singer}\\
DM_*\mu(\Omega_t[\gamma]) &amp;= e^{-\ell(\gamma)^2/2t}\int_M DM_*\mu(e^{\bra{J_BB_t}\ket{B_t}} _t \Omega_t^0[\gamma]\vert_x\sqrt{g}dx)\space\small \text{ by Cameron-Martin}\\
&amp;= e^{-\ell(\gamma)^2/2t}\int_{T_{\gamma_0}M} E(e^{J_B}_{t} | \Omega_t^0[\gamma]\vert_{x(\tau)})dx^1(\tau)\dots dx^n(\tau) d\tau\\
\frac{dDM_*\mu(e^{-\ell(\gamma)x^1(t)}\Omega^0_t[\gamma])}{dx^1(\tau)\dots dx^n(\tau)d\tau}\vert_{\vec{y(\tau)}}&amp;\approx_{t\rightarrow 0} \frac{e^{-\bra{|I-J_{DM(\vec{x}(\tau),\vec{y}(\tau))}\vec{x}(\tau)}\ket{\vec{x}(\tau)}/2t}}{(2 \pi t)^{(n+1)/2}}(1+O(t^2))\liten \text{ semi-klassisk gräns}\\\
\text{Horocykliska koordinater}: z(\tau) - x(\tau) &amp;= x + \ell(\gamma)\vec{e}^1\implies\\
\int_{M/S^1\oplus S^1}k_t(x,z) dx &amp;=\lim_{j\rightarrow\infty}\frac{e^{-\ell(\gamma)^2/2t}}{\sqrt{2\pi t}}E(e^{\bra{J_{X^j_t}\vec{x}}\ket{\vec{x}}})\\
&amp;=\lim_{j\rightarrow\infty}\frac{e^{-\ell(\gamma)^2/2t}}{\sqrt{2\pi t}}\int_{M^j/S^1\oplus S^1}\frac{1}{\sqrt{2\pi t}^{jn}\det|I-J_{X^j}|}e^{-\ell(X^j)^2/2t}X^{j}\\
\slut{aligned}
\slut{equation}

\sektion{Approximation och Selberg Trace Formula}

I $\dim = 2$ konstant krökning $-\kappa^2$ yta fall,

\starta{equation}
\starta{aligned}
\sqrt{J_{\vec{x}, \vec{y}}}dRB&amp;=
\starta{pmatrix}
e^{\kappa d(\vec{x},\vec{y})/2} &amp;&amp; 0\\
0 &amp;&amp; e^{-\kappa d(\vec{x},\vec{y})/2}\\
\slut{pmatrix}
\förenklar&amp;\\
\bra{\sqrt{J}dRB}\ket{\sqrt{J}dRB} &amp;= e^{\kappa \ell(B)}dRB_1^2 - e^{-\kappa \ell(B)}dRB_2^2\\
\int_0^t \bra{\sqrt{ J}dB}\ket{\sqrt{ J}dB} &amp;= e^{\kappa\ell(\gamma)} - e^{-\kappa\ell(\gamma)}\\
\det I-J_{\gamma} &amp;= (e^{\kappa\ell(\gamma)/2}- e^{-\kappa\ell(\gamma)/2})^2
\slut{aligned}
\slut{equation}

som är konstant över $(\vec{x},\tau)$, så approximationen $\approx_{t\rightarrow 0}$ rad i formel (2) blir \textit{exact}:

\starta{equation}
\starta{aligned}
DM_*\mu(\Omega_t[\gamma]) &amp;= \frac{e^{-\ell(\gamma)^2/2t}\ell(\gamma_0)}{\sqrt{2 \pi t}(e^{\kappa\ell(\gamma)/2} -e^{-\kappa\ell(\gamma)/2})}\\
\gamma(t) = \gamma_0(kt)\implies \\
&amp;=\frac{e^{-k^2\ell(\gamma_0)^2/2t}\ell(\gamma_0)}{2\sqrt{2\pi t}\sinh k\kappa\ell(\gamma_0)/2}\\
\slut{aligned}
\slut{equation}

I $\dim=3$ hyperbolic manifold fall använder vi komplexa koordinater $(z,\bar{z})$ på det normala paketet för att skriva

\starta{equation}
\starta{aligned}
J_{DM(\vec{x}+(\tau+\ell(\gamma))\vec{e}^1)} &amp;=
\starta{pmatrix}
e^{\kappa\ell(\gamma)} &amp;&amp; 0 &amp;&amp; 0\\
0 &amp;&amp; e^{-\kappa\ell(\gamma)+i\theta(\gamma)} &amp;&amp; 0 \\
0 &amp;&amp; 0 &amp;&amp; e^{-\kappa\ell(\gamma)-i\theta(\gamma)} \\
\slut{pmatrix}\\
\implikationer&amp; \\
\det I-{\perp_{\gamma_0}}^k &amp;= |1-e^{-k(\kappa\ell(\gamma_0)-i\theta(\gamma_0))}|^2
\slut{aligned}
\slut{equation}
och sedan $z=x^2+ix^3 \implies d\bar{z}\wedge dz= (dx^2-idx^3)\wedge(dx^2+idx^3) = 2idx^2\wedge dx^3$ blir approximationen i ekvation (2) igen exakt:

\starta{equation}
\starta{aligned}
\kappa &amp;= 1 \implikationer \\
DM_*\mu(\Omega_t[\gamma])
&amp;=\frac{e^{-k^2\ell(\gamma_0)^2/2t}\ell(\gamma_0)}{2\sqrt{2\pi t (1-e^{-k\ell(\gamma_0)})}|e^{k\ell(\gamma_0)/2}-e^{-k(\ell(\gamma_0)/2-i\theta(\gamma_0))}|}\\
\slut{aligned}
\slut{equation}

\doclicenseThis
\pagebreak
\printbibliografi

\end{document}
