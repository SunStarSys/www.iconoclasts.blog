---
archived: ~
categories: ~
dependencies: /*/index.*.es
keywords: ~
published: ~
status: borrador
title: Bloggers
---

{% for d in deps %}
  {% if d.0|starts_with:"/categories" %}
  {% else %}
    {% if d.0|starts_with:"/archives" %}
    {% else %}
- [{{d.1.headers.title}}]({{d.0}}) &mdash; {{d.1.content|lede}} <small><em>activado {{d.1.content|vcs_date}}</em></small>
    {% endif %}
  {% endif %}
{% endfor %}

<!-- $Date$ $Author$ $Revision$ -->
