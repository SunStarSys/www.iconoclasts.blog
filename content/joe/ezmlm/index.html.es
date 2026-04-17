{% extends "main.html"|append:lang %}
{% block content %}
<div class="page-header"><div style="text-align:right; padding-top: 10px">{{ breadcrumbs|safe }}&nbsp;&nbsp;<a href="javascript:void(location.href='https://cms.sunstarsys.com/redirect?uri='+escape(location.href))"><img src="/images/edit.png" /></a></div>
  <h1>{{ headers.title }}</h1></div>
<div class="jumbotron">
{% filter markdown %}
### Diseño

Los archivos ejecutables deben estar en `depósito/`y un paralelismo `lib/` dir para
pull_header.pm.  Si usted tiene un `Nº servicio` cliente a mano, la forma más sencilla
para recuperar este árbol "in situ" es a través de:

```shell
	% svn co https://vcs.sunstarsys.com/repos/svn/public/cms-sites/www.sunstarsys.com/trunk/content/essays/ezmlm
```

{% endfilter %}

{{ content|markdown }}
</div>
{% endblock %}
