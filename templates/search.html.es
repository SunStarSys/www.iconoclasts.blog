{% extends "main.html"|append:lang %}
{% block title %}{{title|safe}} /{% if filter %}{{filter}}{% else
%}{{regex}}{% endif %}/gi{% endblock %}
{% block headers %}
<link href="/fontawesome/css/all.min.css" media="screen" rel="stylesheet">
<link href="/editor.md/css/editormd.min.css" media="screen" rel="stylesheet">
<link href="/editor.md/lib/codemirror/codemirror.min.css" media="screen" rel="stylesheet">
<link href="/editor.md/lib/codemirror/theme/solarized.css" media="screen" rel="stylesheet">
{% endblock %}
{% block content %}
<h1>{{title|safe}}<span class="text-danger">/</span>{% if filter %}{{filter}}{%
  else %}{{regex}}{% endif %}<span class="text-danger">/gi</span></h1><div class="breadcrumbs">{{ breadcrumbs|safe }}</div>
<div class="container">
  {% for k in specials_re|admit:"a-z=|"|split:"\\|"|dictsort %}
  <a href="./?regex={{k|urlencode}};lang={{lang}};markdown_search={{markdown_search}}"><span class="badge bg-success text-white">{{k}}</span></a>
  &nbsp;
  {% endfor %}
  {% for k in keywords %}
  <a href="./?regex=%23{{k}};lang={{lang}};markdown_search={{markdown_search}}"><span class="badge bg-danger text-white">#{{k}}</span></a>
  &nbsp;
  {% endfor %}
  {% if duration %}
  <script src="/editor.md/js/chart.umd.js"></script>
  <canvas height="800px" id="myChart" width="100%"></canvas>
  {% endif %}
  {% ifequal specials "diff=" %}
  <div class="card text-dark border-success mb-3">
    <div class="card-header">{{meta|vcs_author:r.path_info}}
      <small><em> activado {{ meta|vcs_date:lang }} en {{meta|vcs_time:lang}}</em></small>
	</div>
    <div class="card-body">
      <h3 class="card-title"><a href="/dynamic/search{{path|dirname|append:"/"}}?regex=log={{
      revision }};lang={{lang}};markdown_search={{markdown_search}}">Registro</a></h3>
      <pre>{{ log|safe }}</pre>
  </div>

<pre><code data-lang="diff">{{ diff }}</code></pre>



## &nbsp;Diferencia](./?regex=diff={{ blog }};lang={% else %};markdown_search={% ifequal specials "log=" %}).

  {% for e in log %}

<pre><code data-lang="diff">{{path|dirname|append:"/"}}</code></pre>

  {{e.0}}
  {{lang}}
  {{e.0}}
  {{e.3|vcs_author:r.path_info}}
  {{e.3|vcs_date:lang}}
  <pre class="text-primary">{{e.3|vcs_time:lang}}</pre>
  {% for k, v in e.1 %}
  {{v.action}}
  {% ifequal k|parse_filename:2 ".md" %}
  <form class="form-inline row" method="POST">
      {% ifequal k|dirname|parse_filename:2 ".page" %}
	  <div id="meta"><pre>Coincidencias totales = {{k|dirname|parse_filename:"0,1"|strip_prefix}}, Total de documentos = {{k|parse_filename:"3.."}}. Ordenado por recuento de coincidencias &nbsp; Revisión del documento.</pre></div>
	  <div class="right" id="filter">
	    <div class="d-flex float-end">
    		<input name="hash" type="hidden" value="{{k}}">
	    	<input class="form-control me-2" type="text" name="filter"
             placeholder="Búsqueda recursiva de CPRE" value="{% else %}" />[<button class="btn btn-outline-danger" name="submit" type="submit" value="1"><i class="fa fa-filter fa-emoji" title="Filtro"></i></button>
        </div>
	  </div>
      <div>
        <dl>
          {{k|strip_prefix|parse_filename:"0,1"}}
          <dt>{{k|parse_filename:"3.."}}</dt>
          <input name="files" type="hidden" value="{{k}}" />
          {% endifequal %}
          <dd>{% else %}</dd>
          {% ifequal k|parse_filename:3 ".yml" %}
          {{k|strip_prefix|parse_filename:"0,1"}}
        </dl>
      </div>
      {{k|parse_filename:"3.."}}
  </form>
  {{k}}
</div>
{% else %}

{{k|strip_prefix}}
```yaml
{{yaml|safe}}
```
{{k}}
<script type="text/javascript">
  document.cookie = "can_search=1; path=/; max-age=" + (86400 * 30);
</script>
{% endifequal %}
{% endifequal %}
