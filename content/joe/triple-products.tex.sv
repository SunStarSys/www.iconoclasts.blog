\dokumentklass{article}
\usepackage[hidelinks]{hyperref}
\usepackage[type={CC},modifier={by-nc-nd},version={4.0}]{doclicense}
\usepackage{fontspec}
\usepackage[scr=rsfs]{mathalpha}

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

% modern, utf8 vänlig
\PassOptionsToPackage{partial=upright}{unicode-math}
\usepackage{fontsetup}
\usepackage{tikz-cd}

\usepackage[style=alphabetic]{biblatex}
\addbibresource{content/joe/triple-products.bib.en}

% användbara matematiska makron
\usepackage{braket}
\usepackage{physics}

% metadata
\title{Trippelprodukter av egenfunktioner och spektral geometri}
\date{2026\\February}
\författare{Joe Schaefer\\Ordförande, SunStar Systems\\ \href{mailto://Joe\%20Schaefer,\%20Ph.D.\%20<joe@sunstarsys.com>}{joe@sunstarsys.com}}

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

\starta{abstract}
Med hjälp av elementära tekniker från geometrisk analys, partiella differentialekvationer och abeliska $ C ^ *$ Algebror, avslöjar vi en roman, men ändå bekant, global geometrisk invariant - nämligen den indexerade uppsättningen integraler av trippelprodukter av egenfunktioner hos Laplace-Beltrami-operatören, för att exakt karakterisera vilka isospektrala slutna Riemannian-mångfalder är isometriska.

\noindent\textbf{Keywords:} spektrum, Fourier, harmoniska, trippelprodukter, Lappland, egenfunktioner, funktionella, inversa problem, representationsteori
\sluta{abstract}

\tableofcontent

\sektion{Introduction}
\label{sec:intro}

För en stängd Riemannian mångfald $ (M,g) $, som karakteriserar sin klass av icke-isometriska, isospektrala grenrör är en typ av omvänd problem \cite{DH11} i spektral geometri. Man skulle kunna spekulera i att denna klass alltid skulle vara tom. Den akademiska litteraturen är emellertid rik med årtionden gamla konstruktioner av specifika parningar av motexempel: som börjar 1964 med John Milnors 16-dimensionella par av icke-isometriska, isospektrala platta tori \cite{JM64}, och fortsätter \cite{CS92} mot den generiska dimensionella karaktäriseringen av platt tori i Alexander Schiemann 1993 doktorsavhandling \cite{AS94} - fyll med en datorstödd sökning efter det kritiska $\dim = 3$ fallet.  En modern undersökning av hela den platta tori-historiken visas i \cite{NRR22}.

Längs vägen var insiktsfulla utlöpare till mer sofistikerade, icke-euklidiska symmetriska täckutrymmen; konstruera sådana isospektrala, icke-isometriska "duetter" som involverar icke-triviala kurvaturtensorer (och deras spektrumbestämda Euler-egenskaper i dimension 2 \cite{MS67).) Ett utmärkt exempel på denna insats var Toshikazu Sunadas uppfinning 1985 \cite{TS85} av ett allmänt syfte som täcker rymdramverket, som han sedan distribuerade i samma arbete för att konstruera hyperboliska duetter i dimensionerna 2 och 3.

För inhomogena riemanniska mätvärden upptäckte Carolyn Gordon duetter som inte ens lokalt är isometriska \cit{CG93}.

Arbetet fortsätter inom många relaterade områden \cite{DH11}, såsom bestämning av topologiska egenskaper hos klassen av isospektrala, icke-isometriska grenrör i allmänhet (tom \cite{ST80}, ändlig \cite{AS94}, styv \cite{GK80}}, och kompakt \cite{GZ97}) som en delmängd av olika modulutrymmen i Riemannian mätvärden.

Vad vi erbjuder i den här artikeln är ett nytt perspektiv på ett välbekant verktyg: indexerade Fourier-koefficienter av parvisa produkter av egenfunktioner som en diskret "algebraisk / topologisk invariant" för att komplettera den befintliga, diskreta "analytisk invariant" - det icke-negativa spektrumet av Laplace-Beltrami-operatorn (här kallad (icke-negativ) \textit{Laplacian}) på $\mathscr H = L^2(M,g) $.  Tillsammans observerar vi paret ger en "diskret global geometrisk representation" av isometriklasserna av isospektrala, slutna Riemannianförgreningsrör.

\undersektion{Results}
\label{subsec:res}

\börja{theorem}
\label{thm}

Med tanke på en (icke-minskande på egenvärden) ortonormal grund av egenfunktioner $\set{e^i}_{i=0}^{\infty}$ för (icke-negativa) Lappland $\Delta_M$ på $L^2(M,g)$ i samband med en stängd Riemannmångfald $(M,g)$, definiera

\starta{equation}
M^{i,j,k} := \int_M e^i e^j \bar{e^k} \sqrt{g} dx = \bra{e^i e^j}\ket{e^k}
\slut{equation}

För att vara isometrisk till $ (M,g) $ är det ett nödvändigt och tillräckligt villkor för att ett annat isospektralt stängt Riemannmångfald ska ha en ortonormal grund för egenfunktioner (för dess Lappland) att båda bevarar de associerade egenvärdena och har en oföränderlig $\set{M^{i,j,k}}$ under varje grund.
\slut{theorem}

\textit{Symmetry} spelar en viktig roll i beräkningshanterliga fall \cite{TF17} \cite{LS18} \cite{PS94}, vilket är lämpligt illustrerat i vårt platta tori-exempel~\ref{sec:ex} nedan. Styrkan i vårt tillvägagångssätt är dock kanske bäst uppenbar när det gäller mångfalder med det minsta antalet Riemanniska symmetrier, vilket är det generiska fallet som ofta sammanfaller med att egenvärdena är unika (dvs. utan icke-trivial mångfald.) I detta fall erbjuder vi följande

\starta{conjecture}
\label{conj}
Om varje egenvärde har multiplicitet $1$, givet ett par egenvärde som bevarar ortormala baser som beskrivs i teoremens hypotes, är grenrör isometriska om och endast om $\set{M^{i,j,k}}$ för en grund överensstämmer, upp till absolut värde i de enskilda termerna, med den andra grunden.
\sluta{förmodan}

Motivationen för studien av $\set{M^{i,j,k}}$ är löst härledd från studien av rollen för den bilinjära multiplikationsoperatorn $Y:V\otimes V\rightarrow V((z))$ i definitionen av en Vertex Operator Algebra \cite{FBZ04} associerad med en kiral konform fältteori. Här $V$ är Vector Space of States och $V((z))$ är utrymmet för formella Laurent-serien i $z$ med koefficienter i $V$. Eftersom $V$ ofta kommer utrustad som ett Hilbert Space med en traditionell Fourier-serie ortonormal grund, indexering $Y$ med hjälp av Fourier-baselementen på $V$ är bara lite mer involverad än $M^{i,j,k}$-fallet studerat här, men ganska liknande i anda. En detaljerad jämförelse ligger dock utanför artikelns tillämpningsområde.

Om vi tänker på kartan
\starta{equation}
(M, g, \set{e^i}) \mapsto \set{\lambda_i, M^{i,j,k}}\ ,
\slut{equation}

Detta papper fastställer injicerbarhet av denna karta för slutna Riemannian grenrör (upp till Riemannian isometry i dess domän). Ytterligare resultat som tillämpar dessa tekniker för att beskriva sin bild (och invers), inom vissa moduli utrymmen av mätvärden, är bara att komma igång \cit{AA25}.  Där tacklar Anshul Adve rigoröst enhetstangensutrymmen av kompakta, hyperboliska 2-omlopp, med samma \textit{structure constants} från Conformal Field Theory.

Dessa resultat visades först under ett liknande namntal av författaren vid \textbf{MSRI} 1997, men de visas här i publicerad form för första gången.

\sektion{Preliminaries}
\label{sec:pre}

Nu med $M,g,e^i,M^{i,j,k}$ som i hypoteserna om Theorem~\ref{thm}, för $f \in C^\infty(M)$ och $i \geq 0$ notera att \textit{Fourier koefficienter}

\starta{equation}
\label{eqn:Fourier}
\starta{aligned}
\hat{f}(i) &amp;:= \int_M f(x)\bar{e^i}(x)\sqrt{g(x)}dx \\
\förenklar \\
f(x)        &amp;= \sum_{i=0}^{\infty}\hat{f}(i)e^i(x)\,,
\slut{aligned}
\slut{equation}

eftersom $f$ är unikt representabel som sin snabbt konvergerande \textit{Fourier Series} ($\Delta_M$-specifika Sobolev Embeddings \cite{MT13} \cite{RS75}, tillsammans med Weyls asymptotiska lag \cite{HW11}, antyder att termerna i summan är $o(i^{-n})$ enhetligt i $x$ \cite{LH68}, $\forall n\in\mathbb{N}$.) Sedan ser vi att för $f_1, f_2 \in C^\infty(M)$ är Fourier-koefficienterna för den punktvisa produkten $f_1 f_2 \in C^\infty(M)$

\starta{equation}
\starta{aligned}
\widehat{f_1 f_2}(k) &amp;= \sum_{i,j}^\infty\hat{f_1}(i)\hat{f_2}(j)M^{i,j,k} \\
\förenklar \\
f_1f_2(x) &amp;= \sum_{i,j,k}\hat{f_1}(i)\hat{f_2}(j)M^{i,j,k}e^k(x) \\
f_1 &amp;= f^p_2,\, p > 2 \implies \\
\sum_{k}\hat{f_1}(k)e^k(x) &amp;= \sum_{i_1,i_2,\ldots,i_{2p-1}}\hat{f_2}(i_1)\hat{f_2}(i_2)\hat{f_2}(i_4)\hat {f_2}(i_6)\ldots\hat{f_2}(i_{2p-2})M^{i_1,i_2,i_3}M^{i_3,i_4,i_5}\ldots M^{i_{2p-3},i_{2p-{4}}e}}
\slut{aligned}
\slut{equation}

och så, kritiskt, någon flervariabel polynom $\wp \in \mathbb{C}[z_1,\ldots,z_l]$ (på släta funktioner) pendlar med någon spektrumbevarande $\Delta$-eigenfunktion ortonormal baskarta $\vec{F}$ som bevarar $\set{M^{i,j,k}}$:

\starta{equation}
\label{fig}
\starta{tikzcd}
  C^\infty(M,\space\mathbb{C}^l)\arrow[swap]{d}{\underbrace{\vec{F}\oplus\dots\oplus \vec{F}}_{l\,\text{times}}} \arrow{r}{\wp} &amp; C^\infty(M) \arrow{d}{\vec{F}}\\%
  C^\infty(N,\space\mathbb{C}^l) \arrow{r}{\wp} &amp; C^\infty(N)
\end{tikzcd}
\slut{equation}

Dessutom, om $A\subset M$ är Borel-mätbar, då resultaten ovan hålla punktvis för den karakteristiska funktionen av $A$ överallt utom längs gränsen för $A$: om $f = f^2$ och $A:=\set{x\in M|f(x)=1}$,

\starta{equation}
\sum_{i}\hat{f}(i)e^i(x) = \sum_{i,j,k}\hat{f}(i)\hat{f}(j)M^{i,j,k}e^k(x) = \begin{cases}
1 &amp; x \i \mathring{A} \\
0 &amp; x \i \mathring{A^\complement}\end{cases}\,,
\slut{equation}

och genom unikhet har vi följande identitet

\starta{equation}
\starta{aligned}
\hat{f}(k) &amp;= \sum_{i,j}\hat{f}(i)\hat{f}(j)M^{i,j,k}\,,\, \forall k\geq 0 \\
\iff f&amp;=f^2 \, dvs.
\slut{aligned}
\slut{equation}

Detta innebär att alla sådana baskartor som ovan har karakteristiska funktioner (som medlemmar i $L^2(M,g)\subset L^1(M,g)$) till karakteristiska funktioner på ett måttbevarande sätt.

Poängen med dessa beräkningar är att betona det faktum att $\set{M^{i,j,k}}$ karakteriserar Harmonic Analysis av den punktvisa multiplikationsoperatorn på $C^\infty(M)$, vilket är en tät subalgebra av den abeliska $C^*$ algebra $C(M)$, av Stone-Weierstrass-satsen.

För den snabba konvergensen av dessa ovan summor som involverar $M^{i,j,k}$, observera att produkter av egenfunktioner är släta, så dessa Fourier koefficienter förfaller som ovan (i varje index). Mer information finns i Emmett Wymans arbete under 2022 med dessa koefficienter när det gäller triangeln ojämlikhet på egenvärden \cit{EW22}.

Obs: Vi kan alltid anta

\starta{equation}
\starta{aligned}
e^0 &amp;= M^{0,0,0} = 1/\sqrt{vol(M)} \\
\förenklar \\
M^{0,j,k} &amp;= M^{j,0,k} = \delta_{j-k}\space/\sqrt{vol(M)}\,,
\slut{aligned}
\slut{equation}

där $\delta_i$ är Kronecker delta. Eftersom $vol(M)$ är en spektral invariant \cite{HW11}, är denna information redan tillgänglig från isospektralitet överväganden.

\sektion{Bevis på sats~\ref{thm}}
\label{sec:proof}

\starta{proof}
Av nödvändighet, låt $F:(N,h)\rightarrow (M,g)$ vara en isometri mellan stängda Riemannian mångfald, och låt målet ortonormal grund av egenfunktioner på $L^2(N,h)$ vara pull-back via $F$ av den ortonormala basen $\set{e^i}$ på $(M,g)$ ovan. Sedan

\starta{equation}
\starta{aligned}
M^{i,j,k} &amp;= \int_M e^i e^j \bar{e^k}\sqrt{g}dy \\
          &amp;= \int_N e^i(F(x)) e^j(F(x))\bar{e^k}(F(x))\sqrt{h}dx\,,
\slut{aligned}
\slut{equation}

Vi är gjorda med nödvändighetsargumentet eftersom $\Delta_N(f\circ F) = (\Delta_M f) \circ F,\ \ \forall f\in C^\infty(M)$.

För tillräcklighet tar vi nu hänsyn till den linjära, bijektiva ortonormala eigenfunktionsbasmappningen $\vec{F}$ från $C^\infty(M)$ till $C^\infty(N)$ och observera att från beräkningarna i Section~\ref{sec:pre} ovan, $\vec{F}$ bevarar punktvisa produkter för smidiga funktioner (och bevarar karakteristiska funktioner när de utökas till $L^2(M,g)$) med antagandet att $\set{M^{i,j,k}}$ är invariant under den här kartan.

\börja{lemma}
\label{lma}
$\vec{F}: C^\infty(M)\rightarrow C^\infty(N)$ bevarar den enhetliga normen.
\slut{lemma}

\begin{subproof}[Bevis på Lemma~\ref{lma}]
Låt $\set{a_i}$ vara en smidig partition av enhet på $M$.

\starta{equation}
\starta{aligned}
1 &amp;= \sum_i a_i(x) \\
       &amp;= \sum_{i,j} \hat{a_i}(j)e^j(x) \\
	   &amp;= \sum_j e^j(x)\sum_i \hat{a_i}(j)
\slut{aligned}
\slut{equation}

Således $\sum_i\hat{a_i}(j) = \delta_j\sqrt{vol(M)}$ (Kronecker delta).

genom den dominerade konvergenssatsen,
\starta{equation}
\lim_{p\rightarrow\infty}
\sum_j\hat{a^p_j}(k) = \int_{\dot{\bigcup}_j\set{a_j=1}}\bar{e^k}(x)\sqrt{g}dx\,,
\slut{equation}

som är en karakteristisk funktion av positivt mått på varje delmängd $\set{x\in M | a_j(x) = 1}$. Det betyder att Lemma är bevisat för varje $a_j$, eftersom den begränsande egenskapsfunktionen för en uppsättning med positivt mått bevaras och därför har en enhetlig norm 1, liksom alla $a_j^p,\, \vec{F}(a_j^p)=\vec{F}(a_j)^p,\, p\in\mathbb{N}$, genom Diagram~\ref{fig}.

Utan förlust av allmängiltighet kan vi tillämpa specialfallets resultat som visas för  den smidiga partitionen av enheten $\lbrace|f|/\lVert f \rVert_\infty, 1 - |f|/\lVert f\rVert_\infty\rbrace$, där $ \set{x\in M|\space|f(x)| = \lVert f \rVert_\infty}$ har ett positivt mått och Lemma har bevisats i sin helhet.

\end{subproof}

Eftersom $\set {\bar e^i}$ också är en Fourier-bas för $L^2(M,g)$ är det tydligt från Equation~\ref{eqn:Fourier} att $\vec F(\bar f) = \bar{\vec F}(f)$. Detta innebär att på en tät uppsättning $C(M)$ (och $C(N)$), har vi etablerat $\vec{F}$ som en isomorfism av Abelian $C^*$ algebror, och därmed kan utökas till en isomorfism av $C(M)$ och $C(N)$ i samma kategori.

Nu tillämpar vi Gelfand-Naimark Representation Theorem (i kontravariant functor form) för unital Abelian $C^*$ algebror \cite{JC19} för att representera denna isomorfism $\vec{F}$ av en homeomorfism $F$ mellan $N$ och $M$. Eftersom $\vec{F}$ är bijektiv på släta funktioner, måste även $F$ vara slät.

Eftersom detta nu diffeomorfism bevarar egenvärden och egenfunktioner (genom hypotes på $\vec{F}(f) = f \circ F$), måste det bevara Lappland på släta funktioner. Därför måste $F$ också bevara de viktigaste symbolerna för samma elliptiska operatorer \cit{MT13}. De viktigaste symbolerna i Lappland är helt enkelt ett annat sätt att uttrycka Riemannian metriska på de mångfaldiga i fråga.

Detta kompletterar teoremens bevis.

\end{proof}

\undersektion{Diskussion av gissning~\ref{conj}}
\label{subsec:conj}

Med $\set{M_0^{i,j,k}}$ och $\set{M_1^{i,j,k}}$ som representerar de två trippelproduktuppsättningarna för baserna $\set{e_0^i}$ och $\set{e_1^i}$, låt $z_i \in \set{-1,1}$ vara $\mathbb{Z}_2^\infty$-åtgärden på en sådan $\mathbb{R}$-värderad ortogonormal basis $\set{e_1^i}$. Därför måste vi välja $z_i$ så att $\set{z_ie_1^i}$ ger $\set{M_1^{i,j,k}} = \set{z_i z_j z_kM_0^{i,j,k}}$.

Varför är detta fallet? I allmänhet är symmetrigruppen som verkar på utrymmet för möjliga ortonormala baser av egenfunktioner utrymmet för Unitary Operators $U: \mathscr H\rightarrow\mathscr H$ som pendlar med projektioner $P_{\mathcal V_\lambda}$ på de finitdimensionella eigenspaces $\mathcal V_{\lambda}$ som är associerade med varje enskilt egenvärde $\lambda$ i Lappland. Därför

\starta{equation}
\starta{aligned}
P_{\mathcal V_{\lambda}}U(e^i) = UP_{\mathcal V_{\lambda}}(e^i),\\ \therefore U(e^i) &amp;= \sum_{\lambda_i = \lambda_j}u_{ij}e^j \implies \\
M_U^{i,j,k} := \int_M U(e^i)U(e^j)\bar U(\bar e^k)\sqrt g dx &amp;= \sum_{\lambda_r = \lambda_i,\lambda_s=\lambda_j,\lambda_t=\lambda_k} u_{ir}u_{js}\bar u_{tk} M^{r,s,t}
\slut{aligned}
\slut{equation}

är bilden av $M^{i,j,k}$ under $U$s basåtgärd $e^i \mapsto U(e^i)$.

Nu under förutsättningarna för gissningen är var och en av $\mathcal V_\lambda$ ett dimensionellt vektorrum över $\mathbb{C}$, men det betyder också att de är ett dimensionellt vektorrum över $\mathbb{R}$, och så är den fullständiga multiplikativa symmetrigruppen $O(1,\mathbb{R})^\infty=\mathbb{Z}_2^\infty$.

Utan multiplikationsbegränsningen skulle hypotesens associerade förutsättning "om överensstämmelse i absoluta värden" därför bli "bevarande av den ordnade uppsättningen singulära värden för $\set{M^{i,j,k}}$, räknat med multiplicitet, när de visas som en samling kartor från $\mathcal V_{\lambda_i} \rightarrow Hom(\mathcal V_{\lambda_j}, \mathcal V_{\lambda_k}^*)$". Det visar sig att detta är en ganska robust uppsättning av Unitära invarianter. Vi är betydligt mindre övertygade om att denna generaliserade gissning är sann, eftersom det kan vara möjligt att producera ett motexempel via explicit Sunada-konstruktion.

Att komma tillbaka till den ursprungliga gissningen, observerar vi att beviset innebär att fastställa denna implikation:

\starta{equation}
\label{fml}
z_k = M_0^{i,i,k} / M_1^{i,i,k} \,\, \forall i,k\in\mathbb{N},\,  ⁇  M_0^{i,i,k} \ne 0 \, \implies
\exists r,s,t \in \mathbb{N}\  ⁇ \ \frac{M_0^{i,j,k}}{M_1^{i,j,k}} = \frac{M_0^{r,i}M_0^{s,s,j}M_0^{t,k}}{M_1^{r,r,i}M_1^{s,j}M_1^{t,t}}\,.
\slut{equation}

Vi kan hoppas att $M_0^{i,i,k}$ för en given $k$ inte kan vara identiskt $0$ för alla $i$. Vid första rodnad verkar detta inte omöjligt om $M$ har en "jämn/odd" symmetrigrupp och $e^k$ är udda, men hoppet är sant för flat-tori fallet nedan (som inte uppfyller den enhetliga egenvärde multiplicitet = 1 villkor). Dessutom kräver Formel~\ref{fml} för $z_k$ både $i$-oberoende och tillräcklighet för att fastställa basmappningen $e_0^i \mapsto z_i e_1^i$ bevarar $\set{M_0^{i,j,k}}$. Alla dessa aspekter är fortfarande okända.

Låt oss dock beräkna några relevanta identiteter så att några orädda framtida forskare kan gräva i denna gissning:

\starta{equation}
\starta{aligned}
\Delta fg &amp;= f\Delta g + g\Delta f - 2 df \cdot dg \implikationer \\
M^{i,j,k} &amp;= 2 \frac{\bra{de^i\cdot de^j}\ket{e^k}}{\lambda_i +\lambda_j -\lambda_k}\\
\text{Nu genom polarisering}\\
M^{i,j,k} &amp;= \frac{\bra{(e^i+e^j)^2 - (e^i - e^j)^2}\ket{e^k}}{4} = \frac{M^{i,i,k} + M^{j,j,k} - \bra{(e^i-e^j)^2}\ket{e^k}}{2},\\
\text {och så den kvadratiska formen} \\
Q_k(f,g) :&amp;= \bra{df\cdot dg}\ket{e^k} = \sum_{i,j}\hat{f}(i)\hat{g}(j)\bra{de^i\cdot de^j}\ket{e^k} \\
&amp;= \frac{1}{2}\sum_{i,j}\hat{f}(i)\hat{g}(j)(\lambda_i + \lambda_j - \lambda_k)M^{i,j,k}.\\
\text{Now with}\, J\, \text{real-analytic}\\
Q^J_k(f,g) :&amp;= -\frac{1}{2}\bra{(J(\sqrt{\Delta})fg - fJ(\sqrt{\Delta})g - gJ(\sqrt{\Delta})f}\ket{e^k} \\
&amp;= -\frac{1}{2}(\bra{fg}\ket{J(\sqrt{\Delta}) e^k} - \bra{fJ(\sqrt{\Delta})g + gJ(\sqrt{\Delta})f}\ket{e^k})\\
&amp;= \frac{1}{2}\sum_{i,j}\hat{f}(i)\hat{g}(j)(J(\sqrt{\lambda_i}) + J(\sqrt{\lambda_j}) - J(\sqrt{\lambda_k})M^{i,j,k}\\
\tilde{Q}_k(f,g) :&amp;= -\frac{1}{2}\bra{\sqrt{\Delta} fg - f\sqrt{\Delta}g -g\sqrt{\Delta}f}\ket{e^k} \\
&amp;= \frac{1}{2}\sum_{i,j} \hat{f}(i)\hat{g}(j)(\sqrt{\lambda_i} + \sqrt{\lambda_j} - \sqrt{\lambda_k})M^{i,j,k}\\
df \cdot dg &amp;= \sum_k Q_k(f,g)e^k = -\frac{\Delta fg - f\Delta g - g\Delta f}{2}\\
Q_0(f,f) &amp;= \frac{1}{\sqrt{vol(M)}}\sum_i \hat{f}(i)^2 \lambda_i\\
df\cdot df = \sum_kQ_k(f,f)e^k &amp;= \frac{1}{2}\sum_{i,j,k}\hat{f}(i)\hat{f}(j)(\lambda_i + \lambda_j -\lambda_k)M^{i,j,k}e^k\\
&amp;= \frac{1}{4}\sum_{i,j,k}\hat{f}(i)\hat{f}(j)(\lambda_i + \lambda_j -\lambda_k)(M^{i,i,k} + M^{j,j,k} - \bra{(e^i-e^j)^2}\ket{e^k})e^k\\
 = g^2 &amp;= \sum_{i,j,k}\hat{g}(i)\hat{g}(j)M^{i,j,k}e^k \implies\\
 \frac{1}{2}\sum_{i,j}\hat{f}(i)\hat{f}(j)(\lambda_i + \lambda_j - \lambda_k)M^{i,j,k} &amp;= \sum_{i,j}\hat{g}(i)\hat{g}(j)M^{i,j,k} \\
&amp;= \widehat{g^2}(k). \\
\slut{aligned}
\slut{equation}

Obs! för det endimensionella flat-tori-fallet nedan är $\tilde{Q}_k(e^i,e^j) = 0$ sedan $\sqrt{\Delta} = \sqrt{-1}\frac{d}{dx}$ en sann härledning.

\sektion{Example}
\label{sec:ex}

Låt $\set{\lambda_i} \subset \mathbb{R}^n$ vara ett indexerat, rangordna $n$ lattice av Lie Algebra-vikter för kvotutrymmesrepresentationen av $\mathfrak{g}=\mathbb{R}^n$ som översättningsinvariant (dvs konstant) vektorfält på sig själv, när $\mathbb{R}^n$ också ses som $\mathfrak{g}$s associerade Liegrupp över en torus definierad av $\mathbb{R}^n/A\mathbb{Z}^n, A \i GL(n,\mathbb{R})$. Dessa vikter definierar heltalsliftar på 1-former över torus som integreras med linjära funktioner $\bra{x} \lambda_i\rangle,\, x\in\mathbb{R}^n$ som sin Liegrupp (som täcker torus). Dessa linjära funktioner kan sedan skalas om enhetligt (med $2\pi \sqrt{-1}$) och exponentieras för att bilda multiplikativa tecken som stiger ned för att bilda en ortonormal bas på $L^2(\mathbb{R}^n/A\mathbb{Z}^n,dx)$, med Lebesgue (Haar) mått $dx$.

Dessutom diagonaliserar denna grund samtidigt den platta torus Laplacian, eftersom Lappland är bilden av ett symmetriskt, negativ-definit kvadratiskt Casimir-element under denna (konstant koefficient linjär differentialoperator) kvoten rumsrepresentation av den universella omslutande algebra. Därför är dess egenvärden i konstant proportion (av $ 4\pi^ 2 $) till Casimir-element-bestämda längd-kvadrat av varje karaktärs vikt i gitter.

Vi ser för närvarande ovanstående grund

\starta{equation}
\{e^{2\pi\sqrt{-1}\bra{x}\lambda_i\rangle}/\sqrt{|\det A|}\}_{i=0}^\infty
\slut{equation}

att vara vår teorem-tillämpliga Fourier-bas av ortonormala (multiplikativa tecken) egenfunktioner (av denna kvotrepresentation av det (negativa) Euklidiska Casimir-elementet) som direkt motsvarar $\set{\lambda_i}$. Med våra teorems hypoteser måste vi ha $i < j \implies \lVert\lambda_i\rVert\leq \lVert\lambda_j\rVert$ (with the Euclidean norm on the weights).

Nu kan vi beräkna

\starta{equation}
\etikett{eqn:a}
M^{i,j,k} = \börja{cases}
1/\sqrt{|\det A|} &amp; \lambda_i + \lambda_j - \lambda_k = 0 \\
0 &amp; \text{otherwise}
\sluta{fall}
\slut{equation}

Eftersom denna ekvation~\ref{eqn:a} endast är invariant under linjära transformationer på viktgitter $(A^{-1})^t\mathbb{Z}^n = \set{\lambda_i}$, kommer endast en $L^2$ orthonormal eigenfunction baskarta som induceras från en volymbevarande inverterbar linjär karta mellan två sådana indexerade, rank $n$ viktgitter att behålla den "algebraiska/topologiska" indexerade datauppsättningen $\set{M^{i,j,k}}$ invariant.

Men för att tillämpa Theorem~\ref{thm} är det viktigt att en sådan linjär karta $B$ är $B\in SO(n,\mathbb{R})$ på viktgitter, eftersom den inducerade $L^2$ egenfunktionskartan

\starta{equation}
\{e^{2\pi\sqrt{-1}\bra{x}B\lambda_i\rangle}/\sqrt{|\det A|}\}_{i=0}^\infty
\slut{equation}

måste också bevara de "analytiska" invarianterna - den Casimir-element inducerade siffran $4\pi^2\lVert\lambda_i\rVert^2$ för varje indexerad vikt, dvs.\ de individuella egenvärdena i flat-tori's Laplacian.

Detta representationsteoretiska konto \cite{AK01} motsvarar exakt den tidigare utvecklingen av \textit{lattice congruence} \cite{NRR22} som traditionellt används för att avgränsa isometriklasser av platt tori. I själva verket transponerar matrisen en sådan linjär karta $B\i SO(n,\mathbb{R})$, som beskrivs i föregående stycke, \textbf{is} den kontravariant Riemannian isometri mellan tori, som tillhandahålls av
tillämpning av \textit{Gelfand-Naimark Representation Theorem} under beviset på Theorem~\ref{thm}.

\punkt{Bekräftelser}
Den ursprungliga forskningen finansierades delvis av en nådig James Simons Research Award 1995-1996, och det generösa stödet från en Alfred P. Sloan Dissertation Fellowship 1996-1997 vid universitetet vid Stony Brook.

Författaren vill också tacka Tanya Christiansen, Carolyn Gordon, Hamid Hezari, Harish Seshadri, och särskilt Leon Takhtajan för deras tekniska hjälp och översyn vid utarbetandet av detta manuskript för publicering.

\doclicenseThis

\pagebreak

\printbibliografi

\end{document}
