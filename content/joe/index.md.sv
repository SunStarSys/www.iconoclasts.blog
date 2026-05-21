---
categories: ~
dependencies: '*.md.sv'
keywords: heyoka, ikonoklast
status: verifierad=38633
title: Joes slumpartade tankar
---


<div class="right">

[![Heyoka](index.page/me)](https://en.wikipedia.org/wiki/Heyoka)

</div>

## Välkommen!

{# lede #}Vi övar [Öppen vetenskap](triple-products) här{# lede #}.

## Om mig

Jag är en [INTERN-A](https://www.16personalities.com/intj-personality) typ av person som vårdar de eklektiska, onormala, atypiska aspekterna av livet. Jag behärskar [Wing Chun](https://www.youtube.com/watch?v=Qexxe6ANG2o) i högstadiet, [Fysisk matematik](https://www.math.stonybrook.edu/~leontak/#:~:text=joseph%20schaefer) vid universitetet och [Optimeringsteknik](https://www.linkedin.com/in/joesuf4) i min yrkeskarriär.

### Privatliv

Gift med den mest fantastiska kvinnan på jorden, vars kärlek till mig välsignade oss båda med en dyrbar dotter.  Vi bor i södra Florida och driver tillsammans min S-CORP <https://sunstarsys.com>, som tillhandahåller infrastrukturmaskinvara och -programvara för den här webbplatsen.

### Delia Frees, för mig

Är du bekant med den roll som Heyók ⁇ a spelar i indiansk kultur? Du, min kära, är min egen personliga Heyók ⁇ a.

![Grok Heyoka](index.page/heyoka-grok)

Jag har skapat <https://iconoclasts.blog> för att tillgodose släkt sprit på nätet; som behöver en offentlig, censurfri, långformig uppsatsskrivande gemenskap &mdash; Att dela och interagera med varandras mest politiskt obekväma, avantgardistiska idéer.

Om det låter som du, [registrera dig](/contact)!

```mermaid
gantt
    rubrik {{projects.headers.title|safe}}
    dateFormat YYYY-MM-DD
{% for p,q in projects.content %}
    sektion {{p}}
{% for k,v in q %}
    "{{k|safe}}" {{v|safe}}
{% endfor %}
{% endfor %}
```

### TEST: SSI-genererad tabell &mdash; {{table.headers.title}}

| {{table.csv_headers|join:" | "}} |
|---|---|---|---|
{% for row in table.content %}| {{row.r_type}} | {{row.perl_equivalent}} | {{row.pdl_equivalent}} | {{row.notes}} |
{% endfor %}| extra | roligt | nedan | linje |

<!-- $Date$ $Author$ $Revision$ -->
