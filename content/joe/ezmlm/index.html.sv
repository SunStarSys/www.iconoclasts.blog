{% extends "main.html"|append:lang %}
{% block content %}
<div class="page-header"><div style="text-align:right; padding-top: 10px">{{ breadcrumbs|safe }}&nbsp;&nbsp;<a href="javascript:void(location.href='https://cms.sunstarsys.com/redirect?uri='+escape(location.href))"><img src="/images/edit.png" /></a></div>
  <h1>{{ headers.title }}</h1></div>
<div class="jumbotron">
{% filter markdown %}
### Layout

De körbara filerna ska vara i `lagerplats/`och en parallell `lib/` dir för
pull_header.pm.  Om du har en `tjänst` klient behändig, det enklaste sättet
för att hämta det här trädet "plats" är via:

```shell
	% svn co https://vcs.sunstarsys.com/repos/svn/public/cms-sites/www.sunstarsys.com/trunk/content/essays/ezmlm
```

{% endfilter %}

{{ content|markdown }}
</div>
{% endblock %}
