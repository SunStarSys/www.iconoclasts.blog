---
categories: ~
dependencies: '*.md.sv'
keywords: heyoka, ikonoklast
status: verifierad=42579
title: Joes slumpartade tankar
---


<div class="right">

[![Heyoka](index.page/me)](https://en.wikipedia.org/wiki/Heyoka)

</div>

## Välkommen! [:fa-calendar:](https://calendly.com/joe-sunstarsys/30min)

{# lede #}Vi övar [Öppen vetenskap](triple-products) här{# lede #}.

## Om mig

Jag är en [INTERN-A](https://www.16personalities.com/intj-personality) typ av person som vårdar de eklektiska, onormala, atypiska aspekterna av livet. Jag behärskar [Wing Chun](https://www.youtube.com/watch?v=Qexxe6ANG2o) i högstadiet, [Fysisk matematik](https://www.math.stonybrook.edu/~leontak/#:~:text=joseph%20schaefer) vid universitetet och [Optimeringsteknik](https://www.linkedin.com/in/joesuf4) i min yrkeskarriär.

### Privatliv

Gift med den mest fantastiska kvinnan på jorden, vars kärlek till mig välsignade oss båda med en dyrbar dotter.  Vi bor i södra Florida och driver tillsammans min S-CORP <https://sunstarsys.com>, som tillhandahåller infrastrukturmaskinvara och -programvara för den här webbplatsen.

### Delia Frees, för mig

Är du bekant med den roll som Heyók ⁇ a spelar i indiansk kultur? Du, min kära, är min egen personliga Heyók ⁇ a.

![Grok Heyoka](index.page/heyoka-grok)

Jag har skapat <https://iconoclasts.blog> för att tillgodose släkt sprit på nätet; som behöver en offentlig, censurfri, långformig uppsatsskrivande gemenskap &mdash; Att dela och interagera med varandras mest politiskt obekväma, avantgardistiska idéer.

Om det låter som du, snälla [beställ en demonstration i dag](/contact)!

-----

### Planera

```mermaid
gantt
    title {{projects.headers.title|safe}}
    dateFormat {{projects.headers.dateformat|safe}}
{% for p,q in projects.content %}
    section {{p}}
{% for k,v in q %}
    {{k|safe}} :{{v|safe}}
{% endfor %}
{% endfor %}
```

-----

```mermaid
pie
     title 2026 Q2 Budget Priorities
	"Marknadsföring och reklam" : 60
    "Utveckling" : 20
    "Åtgärder" : 20
```

-----

### Sandlåda: SSI Mindmap

```mermaid
{% filter code:"mermaid"|grep:"mindmap"|slice:0|safe %}
{% ssi `/joe/wikis.md.sv` %}
{% endfilter %}
```

-----

### Sandlåda: SSI Asymptote vektorgrafik

```asy
{% filter code:"asy"|slice:0|safe %}
{% ssi `/joe/stochastic-trace-formula.md.en` %}
{% endfilter %}
```

-----

### Sandlåda: SSI-genererad tabell &mdash; {{table.headers.title}}

| {{table.csv_headers|join:" | "}} |
|---|---|---|---|
{% for row in table.content %}| {{row.r_type|safe}} | {{row.perl_equivalent|safe}} | {{row.pdl_equivalent|safe}} | {{row.notes|safe}} |
{% endfor %}| extra | roligt | nedan | linje |

-----

### Sandlåda: Mermaid wardley-beta diagram

```mermaid
wardley-beta
  title Jamstack Wiki Value Chain
  anchor Business [0.95, 0.35]
  component Cloud Hosting [0.80, 0.80]
  component Agentic AI [0.50, 0.15]
  component Jamstack Wiki [0.60, 0.55]
  component Markdown Editor [0.70, 0.85]
  component Version Control [0.30, 0.45]
  component SSG [0.40, 0.80]
  Business -> Jamstack Wiki
  Agentic AI -> Jamstack Wiki
  Jamstack Wiki -> Cloud Hosting
  Jamstack Wiki -> Markdown Editor
  Version Control -> Jamstack Wiki
  SSG -> Jamstack Wiki
  evolve Version Control 0.80
  evolve Agentic AI 0.55
  note "Standardized Version Control allows Agentic AI to evolve faster" [0.2, 0.49]
```

<!-- $Date$ $Author$ $Revision$ -->
