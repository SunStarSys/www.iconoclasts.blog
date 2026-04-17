\documentclass{article}
\usepackage[hidelinks]{hyperref}
\usepackage[type={CC},modifier={by-nc-nd},версия={4.0}]{doclicense}
\usepackage[margin=1in]{geometry}

\newenvironment{subproof}[1][\proofname]{%
  \renewcommand{\qedsymbol}{$\blacksquare$}%
    \begin{proof}[#1]%
    }{%
    \end{proof}%
}

% пакетов AMS

\usepackage{amsmath}
\usepackage{amsthm}
\usepackage{amssymb}
% современных, utf8 удобных опций (полностью несовместимых с amscd):
\PassOptionsToPackage{partial=upright}{unicode-math}
\usepackage{fontsetup}
\usepackage{tikz-cd}

\usepackage[style=алфавитный]{biblatex}
\addbibresource{/content/joe/stochastic-trace-formula.bib.en}
% полезных макросов математической физики
\usepackage{braket}
\usepackage{физика}
Юникод, %
\usepackage[utf8]{inputenc}

% метаданных
\title{Стохастическая формула трассировки для закрытых, отрицательно изогнутых коллекторов}
\date{2024\\May}
\author{Джо Шефер\\\href{mailto://Joe\%20Schaefer\%20<joe@sunstarsys.com>}{joe@sunstarsys.com}}

% Теорема, Лемма и т.д.
\theoremstyle{plain}
\newtheorem{theorem}{Theorem}Теорема
\newtheorem{corollary}[theorem]{Corollary}
\newtheorem{lemma}[теория]{Lemma}
\newtheorem{claim}{Claim}[теория]
\newtheorem{axiom}[теория]{Axiom}
\newtheorem{conject}[theorem]{Conjecture}
\newtheorem{fact}[theorem]{Fact}
\newtheorem{hypothesis}[theorem]{Hypothesis}
\newtheorem{assumption}[теорема]{допущение}
\newtheorem{proposition}[теория]{Proposition}
\newtheorem{criterion}[theorem]{Criterion}
\theoremstyle{definition}
\newtheorem{definition}[теорема]{Definition}
\newtheorem{example}[теорема]{Example}
\newtheorem{remark}[theorem]{Remark}
\newtheorem{problem}[theorem]{Problem}
\newtheorem{principle}[теорема]{Принцип}

\начать{document}
\maketitle

\таблица контента

Мой \textit{1997 Ph.D. thesis} как запись блога.

\section{Существует только один n-мерный показатель Wiener}

\section{Piecewise Linear Approximations to Brownian Motion} (Полное линейное приближение к Брауновскому движению).

\section{Карта разработки DM}

\section{Формула Кэмерона-Мартина}

\section{Тепловые ядра как радоно-никодимовые производные Weiner Measure

\section{Notation}

$M$ – это отрицательно изогнутый $\dim=n$ закрытый риманский коллектор с метрическим $g$, метрическим соединением $\nabla$ и (неотрицательным) оператором Лаплас-Белтрами $\Delta_M$.  Пусть $k_{-t\Delta/2}(x,y)$ представляет собой тепловое ядро на $M$.

Следовательно, $k_{-t\Delta/2}(x,x) = dDM_*\mu/\sqrt{g}dx$ является производным Радон-Никодима от n-мерного измерения Wiener $\mu$, ограниченного возвратом пространства непрерывного цикла $\Omega_t(M)\vert_x$, через обратную карту разработки Weiner с сохранением показателей $DM$. *Примечание:* $DM^{-1}\Omega_t\vert_x$ не является пространством цикла.

$\Omega_t^0$ – это пространство непрерывных сокращаемых циклов в $M$.

$\Omega_t[\gamma]$ – это пространство непрерывных циклов на $M$ гомотопических к закрытым геодезическим $\gamma$. Пусть $\gamma_0$ будет его примитивным циклом.

$DM^{-1}\Omega_t^0[\gamma]$ является предварительным представлением непрерывных сокращаемых циклов в $M$, списанных как смещающие однотопные к $\gamma(s) = DM(\frac{s\ell(\gamma)}{t}\vec{e}^1), 0\leq s \leq t$. Подумайте о Гороциклических координатах -- каждое волокно как геометрический предел периодических геодезических сфер $S_{\gamma_0(s)}^{n-1}(k\ell(\gamma_0)), 0\leq s \leq t, k\rightarrow\infty$, векторизованное в Нормальном пакете более $\gamma_0$. Наши ограничения кривизны подразумевают, что Гороциклические координаты для каждого $\gamma_0$ существуют как плавная координатная карта, совместимая с $DM$, для $\Omega_t^0[\gamma]$.

Теперь $\vec{x}(\tau)+\ell(\gamma)\vec{e}^1$ – это конечная точка \textit{undeveloped} offset \textit{kinked geodesic} гомотопическая до $\gamma: DM(\vec{x}(\tau) + \frac{s\ell(\gamma)}{t}\vec{e}^1), 0\leq s \leq t$. Кривая является периодической с периодом $\ell(\gamma_0)$, и она пересматривает свою изломанную начальную точку $DM(\vec{x}(\tau))$ в момент $t$, что делает вычисление ее производного вперед $J=\lim_{s\uparrow t}DM^\prime\vert_{DM(\vec{x}(\tau) + \frac{\ell(\gamma)s}{t}\vec{e}^1)}$ трактуемым как линейный автоматизм $T_{DM(\vec{x}(\tau))}M$. Важно отметить, что $J_{DM(\vec{x}(\tau)+\ell(\gamma)\vec{e}^1)}$ может быть построено с использованием \textbf{Jacobi Fields}, так как $DM$ \textbf{is} (итерационная) экспоненциальная карта вдоль любой серии подключенных прямых линий в $\mathbb{R}^n$. Мы изучим $ 1/2 \int_0^t \bra{dX}\ket{dX}_s$, с решением

\begin{equation} – начало
\begin{aligned} – начало
X_t &amp;= X_0 + \int_0^t \sqrt{J}_{X_t} dB_t  \\
\end{aligned}
\end{equation}

$Z_{-\Delta/2}(t):= \int_M k_{-t\Delta/2}(x,x) \sqrt{g}dx = \sum_{j=0}^\infty e^{-\lambda_i t/2}$ является трассировкой теплового ядра.

Наконец, давайте определим следующее из их производных Радон-Никодим:

\begin{equation} – начало
\begin{aligned} – начало
DM_*\mu(\Omega_t) и:= \int_M DM_*\mu(\Omega_t\vert_x \sqrt{g}dx)\\
DM_*\mu(\Omega^0_t) &amp;:= \int_M DM_*\mu(\Omega^0_t\vert_x \sqrt{g}dx)\\
DM_*\mu(\Omega_t[\gamma]) &amp;:= \int_M DM_*\mu(\Omega_t[\gamma]\vert_x \sqrt{g}dx) \\
\end{aligned}
\end{equation}

\section{Формула точного трассировки}

\begin{equation} – начало
\begin{aligned} – начало
Z_{-\Delta/2}(t) = DM_*\mu(\Omega_t) &amp;= DM_*\mu(\Omega^0_t) + \sum_{\set{\gamma}} DM_*\mu(\Omega_t[\gamma]) \\
DM_*\mu(\Omega_t^0) &amp;\approx_{t\rightarrow 0} (2\pi t)^{-n/2}(vol(M) + t/6\int_M К(x)\sqrt{g} dx + O(t^2))\space \small\text{by McKean-Singer}\\
DM_*\mu(\Omega_t[\gamma]) &amp;= e^{-\ell(\gamma)^2/2t}\int_M DM_*\mu(e^{\bra{J_BB_t}\ket{B_t}} _t \Omega_t^0[\gamma]\vert_x\sqrt{g}dx)\space\small \text{ by Кэмерон-Мартен}\\
&amp;= e^{-\ell(\gamma)^2/2t}\int_{T_{\gamma_0}M} E(e^{J_B}_{t} | \Omega_t^0[\gamma]\vert_{x(\tau)})dx^1(\tau)\dots dx^n(\tau) d\tau\\
\frac{dDM_*\mu(e^{-\ell(\gamma)x^1(t)}\Omega^0_t[\gamma])}{dx^1(\tau)\dots dx^n(\tau)d\tau}\vert_{\vec{y(\tau)}}&amp;\approx_{t\rightarrow 0} \frac{e^{-\bra{|I-J_{DM(\vec{x}(\tau),\vec{y}(\tau))}\vec{x}(\tau)}\ket{\vec{x}(\tau)}/2t}}{(2 \pi t)^{(n+1)/2}(1+O(t^2))\small \text{ Semi-classical limit}\
\text{Гороциклические координаты}: z(\tau) – x(\tau) &amp;= x + \ell(\gamma)\vec{e}^1\implies\\
\int_{M/S^1\oplus S^1}k_t(x,z) dx &amp;=\lim_{j\rightarrow\infty}\frac{e^{-\ell(\gamma)^2/2t}}{\sqrt{2\pi t}}E(e^{\bra{J_{X^j_t}\vec{x}}\ket{\vec{x}})\\
&amp;=\lim_{j\rightarrow\infty}\frac{e^{-\ell(\gamma)^2/2t}}{\sqrt{2\pi t}}\int_{M^j/S^1\oplus S^1}\frac{1}{\sqrt{2\pi t}^{jn}\det|I-J_{X^j}|}e^{-\ell(X^j)^2/2t}X^{j}\\
\end{aligned}
\end{equation}

\section{Approximation and the Selberg Trace Formula} (Утверждение и формула трассировки Сельберга).

В $\dim = 2$ постоянная кривизна $-\kappa^2$ поверхностный корпус,

\begin{equation} – начало
\begin{aligned} – начало
\sqrt{J_{\vec{x}, \vec{y}}dRB&amp;=
\begin{pmatrix}
e^{\kappa d(\vec{x},\vec{y})/2} &amp;&amp; 0\\
0 &amp;&amp; e^{-\kappa d(\vec{x},\vec{y})/2}\\
\end{pmatrix}
\implies&amp;\\
\bra{\sqrt{J}dRB}\ket{\sqrt{J}dRB} &amp;= e^{\kappa \ell(B)}dRB_1^2 - e^{-\kappa \ell(B)}dRB_2^2\\
\int_0^t \bra{\sqrt{ J}dB}\ket{\sqrt{ J}dB} &amp;= e^{\kappa\ell(\gamma)} - e^{-\kappa\ell(\gamma)}\\
\det I-J_{\gamma} &amp;= (e^{\kappa\ell(\gamma)/2}- e^{-\kappa\ell(\gamma)/2})^2
\end{aligned}
\end{equation}

которая является константой свыше $(\vec{x},\tau)$, поэтому приближение $\approx_{t\rightarrow 0}$ строки в уравнении (2) становится \textit{exact}:

\begin{equation} – начало
\begin{aligned} – начало
DM_*\mu(\Omega_t[\gamma]) &amp;= \frac{e^{-\ell(\gamma)^2/2t}\ell(\gamma_0)}{\sqrt{2 \pi t}(e^{\kappa\ell(\gamma)/2} -e^{-\kappa\ell(\gamma)/2})}\\
\gamma(t) = \gamma_0(kt)\implies \\
&amp;=\frac{e^{-k^2\ell(\gamma_0)^2/2t}\ell(\gamma_0)}{2\sqrt{2\pi t}\sinh k\kappa\ell(\gamma_0)/2)\\
\end{aligned}
\end{equation}

В случае гиперболического многообразия $\dim=3$ мы используем сложные координаты $(z,\bar{z})$ в обычном наборе для записи

\begin{equation} – начало
\begin{aligned} – начало
J_{DM(\vec{x}+(\tau+\ell(\gamma))\vec{e}^1)} &amp;=
\begin{pmatrix}
e^{\kappa\ell(\gamma)} &amp;&amp; 0 и 0\\
0 &amp;&amp; e^{-\kappa\ell(\gamma)+i\theta(\gamma)} &amp;&amp; 0 \\
0 &amp;&amp; 0 &amp;&amp; e^{-\kappa\ell(\gamma)-i\theta(\gamma)} \\
\end{pmatrix}\\
\implies&amp; \\
\det I-{\perp_{\gamma_0}^k &amp;= |1-e^{-k(\kappa\ell(\gamma_0)-i\theta(\gamma_0))}|^2
\end{aligned}
\end{equation}
и так как $z=x^2+ix^3 \implies d\bar{z}\wedge dz= (dx^2-idx^3)\wedge(dx^2+idx^3) = 2idx^2\wedge dx^3$, аппроксимация в уравнении (2) снова становится точной:

\begin{equation} – начало
\begin{aligned} – начало
\kappa &amp;= 1 \implies \\
DM_*\mu(\Omega_t[\gamma])
&amp;=\frac{e^{-k^2\ell(\gamma_0)^2/2t}\ell(\gamma_0)}{2\sqrt{2\pi т (1-e^{-k\ell(\gamma_0)})}|e^{k\ell(\gamma_0)/2}-e^{-k(\ell(\gamma_0)/2-i\theta(\gamma_0))}|}\\
\end{aligned}
\end{equation}

\doclicenseThis
\nразрыв
\printbibliography

\end{document}
