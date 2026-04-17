{% extends "main.html"|append:lang %}
{% block content %}
<div class="page-header"><div style="text-align:right; padding-top: 10px">{{ breadcrumbs|safe }}&nbsp;&nbsp;<a href="javascript:void(location.href='https://cms.sunstarsys.com/redirect?uri='+escape(location.href))"><img src="/images/edit.png" /></a></div>
  <h1>{{ headers.title }}</h1></div>
<div class="jumbotron">
{% filter markdown %}
### Макет

Исполняемые файлы должны находиться в `ячейка/`и параллель `либ/` каталог для
pull_header.pm.  Если у вас есть `СВН` клиент удобный, самый простой способ
чтобы получить это дерево "на месте" через:

```shell
	% svn co https://vcs.sunstarsys.com/repos/svn/public/cms-sites/www.sunstarsys.com/trunk/content/essays/ezmlm
```

{% endfilter %}

{{ content|markdown }}
</div>
{% endblock %}
