\dokumentklass{% templatetag openbrace %}artikel}
\usepackage[hidelinks]{% templatetag openbrace %}hyperref}
\usepackage[type={% templatetag openbrace %}CC, modifierare={% templatetag openbrace %}{{license}}},version={% templatetag openbrace %}4.0}]{% templatetag openbrace %}doclicense}
\usepackage[margin=1in]{% templatetag openbrace %}geometri

\ny miljö{% templatetag openbrace %}subproof}[1][\proofname]{% templatetag openbrace %}%
  \förnya kommando{% templatetag openbrace %}\qedsymbol}{% templatetag openbrace %}$\blacksquare$} %
    \starta{% templatetag openbrace %}proof}[#1]%
    }{% templatetag openbrace %}%
    \end{% templatetag openbrace %}bevis}%
}

% AMS-paket

\använda paket{% templatetag openbrace %}amsmath
\använda paket{% templatetag openbrace %}amsthm
\använda paket{% templatetag openbrace %}amssymb
% moderna, utf8 vänliga alternativ (helt inkompatibel med amscd):
\PassOptionsToPackage{% templatetag openbrace %}partiell=upright}{% templatetag openbrace %}unicode-sökväg}
\använda paket{% templatetag openbrace %}teckensnittsuppsättning
\använda paket{% templatetag openbrace %}tikz-cd}

\usepackage[style=alphabetic]{% templatetag openbrace %}biblatex
\addbibresource{% templatetag openbrace %}{{path|dirname}}/{{path|basename:0}}.bib.{{lang}}}
% användbara matematiska makron
\använda paket{% templatetag openbrace %}parentes
\använda paket{% templatetag openbrace %}fysik}
% Unicode
\usepackage[utf8]{% templatetag openbrace %}indata

% metadata
\rubrik{% templatetag openbrace %}{{headers.title|lower|capfirst}}}
\datum{% templatetag openbrace %}{{time|date:"Y"}}\\{{time|date:"F"}}}
\författare{% templatetag openbrace %}{{author}}\\\href{% templatetag openbrace %}postadress://{{author|urlencode|md2tex}}\%20<{{email}}>}{% templatetag openbrace %}{{email}}}}

% sats, lemma osv.
\theoremstyle{% templatetag openbrace %}enfärgad
\newtheore{% templatetag openbrace %}sats{% templatetag openbrace %}Satsen
\newtheore{% templatetag openbrace %}corollary}[sats]{% templatetag openbrace %}Korollarium}
\newtheore{% templatetag openbrace %}lemma}[sats]{% templatetag openbrace %}Lemma
\newtheore{% templatetag openbrace %}anspråk}{% templatetag openbrace %}Claim}[sats]
\newtheore{% templatetag openbrace %}axiom}[sats]{% templatetag openbrace %}Axiom
\newtheore{% templatetag openbrace %}förmodan}[sats]{% templatetag openbrace %}Förmodan}
\newtheore{% templatetag openbrace %}fact}[sats]{% templatetag openbrace %}Fakta}
\newtheore{% templatetag openbrace %}hypotesen{% templatetag openbrace %}Hypotes}
\newtheore{% templatetag openbrace %}antagande}[sats]{% templatetag openbrace %}Antagande
\newtheore{% templatetag openbrace %}sats}[sats]{% templatetag openbrace %}Förslag}
\newtheore{% templatetag openbrace %}kriterium}[sats]{% templatetag openbrace %}Kriterium
\theoremstyle{% templatetag openbrace %}definition}
\newtheore{% templatetag openbrace %}definition}[sats]{% templatetag openbrace %}Definition
\newtheore{% templatetag openbrace %}exempel}[sats]{% templatetag openbrace %}Exempel}
\newtheore{% templatetag openbrace %}anmärkning}[sats]{% templatetag openbrace %}Anmärkning}
\newtheore{% templatetag openbrace %}problem}[sats]{% templatetag openbrace %}Problem}
\newtheore{% templatetag openbrace %}princip}[sats]{% templatetag openbrace %}Princip

\starta{% templatetag openbrace %}dokument}
\maketitle

{{content|md2tex}}

\doclicenseThis
\pagebreak
\printbibliografi

\end{% templatetag openbrace %}dokument}
