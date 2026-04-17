\documentclass{% templatetag openbrace %}статья}
\usepackage[ссылки]{% templatetag openbrace %}гиперссылка
\usepackage[type=<тип пакета>{% templatetag openbrace %}CC,модификатор={% templatetag openbrace %}{{license}}версия={% templatetag openbrace %}4.0}]{% templatetag openbrace %}doclicense}
\usepackage[margin=1in]{% templatetag openbrace %}геометрия

\новая среда{% templatetag openbrace %}subproof}[1][\proofname]{% templatetag openbrace %}%
  \renewкоманда{% templatetag openbrace %}\qedsymbol}{% templatetag openbrace %}$\blacksquare$}%
    \начать{% templatetag openbrace %}proof}[#1]%
    }{% templatetag openbrace %}%
    \end{% templatetag openbrace %}доказательство (%)
}

% пакетов AMS

\упаковка{% templatetag openbrace %}amsmath}
\упаковка{% templatetag openbrace %}амстм
\упаковка{% templatetag openbrace %}амссимба
% современных, utf8 удобных опций (полностью несовместимых с amscd):
\PassOptionsToPackage{% templatetag openbrace %}частичное = вертикальное{% templatetag openbrace %}Юникод-математика
\упаковка{% templatetag openbrace %}шрифт
\упаковка{% templatetag openbrace %}tikz-cd}

\usepackage[style=алфавитный]{% templatetag openbrace %}библейский
\addibresource{% templatetag openbrace %}{{path|dirname}}/{{path|basename:0}}Биб.{{lang}}}
% полезных макросов математической физики
\упаковка{% templatetag openbrace %}бракет
\упаковка{% templatetag openbrace %}физика
Юникод, %
\usepackage[utf8]{% templatetag openbrace %}входные данные

% метаданных
\tзаголовок{% templatetag openbrace %}{{headers.title|lower|capfirst}}}
\дата{% templatetag openbrace %}{{time|date:"Y"}}\\{{time|date:"F"}}}
\агент{% templatetag openbrace %}{{author}}\\\ссылка{% templatetag openbrace %}mailto://{{author|urlencode|md2tex}}\%20<{{email}}>}{% templatetag openbrace %}{{email}}}}

% Теорема, Лемма и т.д.
\теоретический стиль{% templatetag openbrace %}одноцветный
\newtheorem{% templatetag openbrace %}теорема{% templatetag openbrace %}Теорема
\newtheorem{% templatetag openbrace %}[теорема]{% templatetag openbrace %}Королларий
\newtheorem{% templatetag openbrace %}lemma}[теорема]{% templatetag openbrace %}Лемма
\newtheorem{% templatetag openbrace %}заявка{% templatetag openbrace %}Претензия[теорема]
\newtheorem{% templatetag openbrace %}axiom}[теорема]{% templatetag openbrace %}Аксиома
\newtheorem{% templatetag openbrace %}предположение [теорема]{% templatetag openbrace %}Гипотеза
\newtheorem{% templatetag openbrace %}Факт [теорема]{% templatetag openbrace %}Факт
\newtheorem{% templatetag openbrace %}гипотеза [теорема]{% templatetag openbrace %}Гипотеза
\newtheorem{% templatetag openbrace %}предположение}[теорема]{% templatetag openbrace %}Допущение
\newtheorem{% templatetag openbrace %}Предложение}[теория]{% templatetag openbrace %}Предложение
\newtheorem{% templatetag openbrace %}критерий[теорем]{% templatetag openbrace %}Критерий
\теоретический стиль{% templatetag openbrace %}определение}
\newtheorem{% templatetag openbrace %}Определение}[теорема]{% templatetag openbrace %}Определение
\newtheorem{% templatetag openbrace %}пример}[теорем]{% templatetag openbrace %}Пример
\newtheorem{% templatetag openbrace %}комментарий)[теорема]{% templatetag openbrace %}Комментарий
\newtheorem{% templatetag openbrace %}Проблема}[теорема]{% templatetag openbrace %}Проблема
\newtheorem{% templatetag openbrace %}принцип)[теорема]{% templatetag openbrace %}Принцип

\начать{% templatetag openbrace %}документ
\maketitle

{{content|md2tex}}

\doclicenseThis
\nразрыв
\printbibliography

\end{% templatetag openbrace %}документ
