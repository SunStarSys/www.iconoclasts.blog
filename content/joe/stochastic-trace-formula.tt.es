\clase de documento{% templatetag openbrace %}artículo}
\usepackage[hidelinks]{% templatetag openbrace %}hiperref}
\usepackage[tipo={% templatetag openbrace %}CC},modificador={% templatetag openbrace %}{{license}}},versión={% templatetag openbrace %}4.0}]{% templatetag openbrace %}doclicense}
\usepackage[margen=1in]{% templatetag openbrace %}geometría}

\nnnentorno{% templatetag openbrace %}subproof}[1][\nombreprueba]{% templatetag openbrace %}%
  \renewcommand{% templatetag openbrace %}\qedsymbol}{% templatetag openbrace %}$\blacksquare$}%
    \ncomenzar{% templatetag openbrace %}prueba}[#1]%
    }{% templatetag openbrace %}%
    \final{% templatetag openbrace %}prueba}%
}

% de paquetes de AMS

\usarpaquete{% templatetag openbrace %}amsmath}
\usarpaquete{% templatetag openbrace %}amsthm
\usarpaquete{% templatetag openbrace %}amssymb
% modernas, opciones compatibles con utf8 (totalmente incompatibles con amscd):
\PassOptionsToPackage{% templatetag openbrace %}parcial=derecha}{% templatetag openbrace %}unicode-math}
\usarpaquete{% templatetag openbrace %}fontsetup}
\usarpaquete{% templatetag openbrace %}tikz-cd}

\usepackage[estilo=alfabético]{% templatetag openbrace %}biblatex}
\addbibresource{% templatetag openbrace %}{{path|dirname}}/{{path|basename:0}}.bib.{{lang}}}
% de macros matemáticas-física útiles
\usarpaquete{% templatetag openbrace %}braket}
\usarpaquete{% templatetag openbrace %}física}
% Unicode
\paquete de uso[utf8]{% templatetag openbrace %}inputenc}

% de metadatos
\título{% templatetag openbrace %}{{headers.title|lower|capfirst}}}
\fecha{% templatetag openbrace %}{{time|date:"Y"}}\\{{time|date:"F"}}}
\autor{% templatetag openbrace %}{{author}}\\\href{% templatetag openbrace %}mailto://{{author|urlencode|md2tex}}\%20<{{email}}>}{% templatetag openbrace %}{{email}}}}

% Teorema, Lema, etc.
\theoremstyle{% templatetag openbrace %}simple}
\nteorema{% templatetag openbrace %}teorema}{% templatetag openbrace %}Teorema
\nteorema{% templatetag openbrace %}corolario}[teorema]{% templatetag openbrace %}Corolario}
\nteorema{% templatetag openbrace %}lemma}[teorema]{% templatetag openbrace %}Lemma
\nteorema{% templatetag openbrace %}reclamar}{% templatetag openbrace %}Reclamación}[teorema]
\nteorema{% templatetag openbrace %}axioma}[teorema]{% templatetag openbrace %}Axioma}
\nteorema{% templatetag openbrace %}conjetura}[teorema]{% templatetag openbrace %}Conjetura}
\nteorema{% templatetag openbrace %}[teorema]{% templatetag openbrace %}Hecho}
\nteorema{% templatetag openbrace %}hipótesis}[teorema]{% templatetag openbrace %}Hipótesis}
\nteorema{% templatetag openbrace %}suposición}[teorema]{% templatetag openbrace %}Asunción}
\nteorema{% templatetag openbrace %}proposición}[teorema]{% templatetag openbrace %}Propuesta}
\nteorema{% templatetag openbrace %}criterio}[teorema]{% templatetag openbrace %}Criterio}
\theoremstyle{% templatetag openbrace %}definición}
\nteorema{% templatetag openbrace %}definición}[teorema]{% templatetag openbrace %}Definición}
\nteorema{% templatetag openbrace %}ejemplo}[teorema]{% templatetag openbrace %}Ejemplo}
\nteorema{% templatetag openbrace %}comentario}[teorema]{% templatetag openbrace %}Observación}
\nteorema{% templatetag openbrace %}problema}[teorema]{% templatetag openbrace %}Problema}
\nteorema{% templatetag openbrace %}principio}[teorema]{% templatetag openbrace %}Principio}

\ncomenzar{% templatetag openbrace %}documento}
\maketitle

{{content|md2tex}}

\doclicenseThis
\pagebreak
\printbibliografía

\final{% templatetag openbrace %}documento}
