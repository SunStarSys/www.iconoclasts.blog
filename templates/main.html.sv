<!DOCTYPE html>
<html lang="{{ lang|cut:"." }}">
<head>
    <meta charset="utf-8">
    <meta content="IE=edge" http-equiv="X-UA-Compatible">
    <meta content="width=device-width, initial-scale=1" name="viewport">
    <meta content="SunStar Systems" name="description">
    <meta content="Joe Schaefer" name="author">
    <meta content="{%for k in headers.keywords%}{{k}},{%endfor%}{{ facts.keywords }}" name="keywords">
    <meta content="black" name="theme-color">
	<meta content="/images/iconoclast.jpg" property="og:image">
    <title>{% block title %}{{ headers.title|safe }} - {{ facts.title|safe }}{% endblock %}</title>
	{% if permalink %}
	<link href="https://{{website}}{{path|dirname}}/{{path|basename:0}}.html{{lang}}" rel="bookmark">
	{% endif %}
    <link href="/css/bootstrap.min.css" media="screen" rel="stylesheet">
    <link href="/css/katex.min.css" media="screen" rel="stylesheet">
    <link href="/css/mermaid.min.css" media="screen" rel="stylesheet">
    <link href="/fontawesome/css/all.min.css" media="screen" rel="stylesheet">
    <link href="/editor.md/css/editormd.min.css" media="screen" rel="stylesheet">
    <link href="/editor.md/lib/codemirror/codemirror.min.css" media="screen" rel="stylesheet">
    <link href="/editor.md/lib/codemirror/theme/pastel-on-dark.css" media="screen" rel="stylesheet">
	<link href="/editor.md/lib/codemirror/theme/solarized.css" media="screen" rel="stylesheet">
	<link href="/css/local.css" media="screen" rel="stylesheet">
    <link href="/images/favicon.png" rel="icon">
    <script src="/js/bootstrap"></script>
	<script src="/editor.md/js/jquery.min.js"></script>
    {% block header %}{% endblock %}
    {% block analytics %}
    {% include "analytics.html" %}
    {% endblock %}
</head>

<body>
  <header class="container-xxl navbar navbar-expand-lg fixed-top" style="border-bottom:solid #aaa 1px; background-color: #fff;">
    <div class="container-fluid">
	  <a class="navbar-brand" href="https://{{website}}/index.html{{lang}}"><img alt="Ikonoklast" src="/images/iconoclast"></a>
      <button aria-controls="navbarResponsive" aria-expanded="false" aria-label="Växla navigering" class="navbar-toggler" data-bs-target="#navbarResponsive" data-bs-toggle="collapse" type="button">
          <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav">
          <li class="nav-item{% if path|starts_with:"/bloggers.md" %}
            active
            {% endif %}"><a class="nav-link text" href="/bloggers.html{{lang}}">Ikonoklast</a></li>
          <li class="nav-item{% if path|starts_with:"/contact.md" %}
             active
             {% endif %}"><a class="nav-link" href="/contact.html{{lang}}">Kontakt</a></li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" id="products" role="button">Produkter... <span class="caret"></span></a>
            <ul aria-labelledby="products" class="dropdown-menu me-auto mb-2 mb-lg-0">
              <li class="dropdown-item"><a class="nav-link text-dark" href="https://www.sunstarsys.com/orion/index.html{{ lang }}">Orion&trade; Wiki för företag</a></li>
              <li class="dropdown-item"><a class="nav-link text-dark" href="https://www.sunstarsys.com/orion/plans.html{{ lang }}">Orions prisplaner</a></li>
            </ul>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" id="more" role="button">Mer... <span class="caret"></span></a>
            <ul aria-labelledby="more" class="dropdown-menu me-auto mb-2 mb-lg-0">
              <li class="dropdown-item">
                <a class="nav-link text-dark" href="https://vcs.sunstarsys.com/viewvc/public/cms-sites/{{website}}/trunk/">Webbplatskälla</a>
              </li>
              <li class="dropdown-item divider"></li>
              <li class="dropdown-header text-dark">Platskartor</li>
              <li class="dropdown-item"><a class="nav-link text-dark" href="/sitemap.html.en">Engelska</a></li>
              <li class="dropdown-item"><a class="nav-link text-dark" href="/sitemap.html.es">Spanska</a></li>
              <li class="dropdown-item"><a class="nav-link text-dark" href="/sitemap.html.de">tyska</a></li>
              <li class="dropdown-item"><a class="nav-link text-dark" href="/sitemap.html.fr">Franska</a></li>
              <li class="dropdown-item"><a class="nav-link text-dark" href="/sitemap.html.ru">ryska</a></li>
              <li class="dropdown-item"><a class="nav-link text-dark" href="/sitemap.html.he">hebreiska</a></li>
              <li class="dropdown-item"><a class="nav-link text-dark" href="/sitemap.html.sv">Svenska</a></li>
              <li class="dropdown-item divider"></li>
              <li class="dropdown-header text-dark">Taxonomier</li>
              <li class="dropdown-item"><a class="nav-link text-dark" href="/categories/index.html{{lang}}">Kategorier</a></li>
              <li class="dropdown-item"><a class="nav-link text-dark" href="/archives/index.html{{lang}}">Arkiv</a></li>
            </ul>
          </li>
          <li class="nav-item{% if path|starts_with:"/powered-by.md" %}
            active
            {% endif %}"><a class="nav-link" href="/powered-by.html{{lang}}">Levereras av...</a>
          </li>
        </ul>
		</div>
        <form action="/dynamic/search{% ifequal path|dirname "/" %}{% else %}{{ path|dirname
            }}{% endifequal %}/" class="d-flex form-inline right" id="search" method="GET">
          <input name="lang" type="hidden" value="{{ lang }}">
          <input name="markdown_search" type="hidden" value="1">
          <input class="form-control me-2" name="regex" placeholder="PCRE Rekursiv sökning" type="text" value="{{ regex }}" />&nbsp;<button class="btn btn-outline-danger" name="submit" type="submit" value="1"><i class="fa fa-search"></i></button>
	    </form>
  </div>
</header>

{% block alert %}
  {% if alert %}
  <div class="alert alert-dismissible alert-info container">
    <button type="button" class="btn-close" data-bs-toggle="modal" data-bs-target="#date-filter-modal"></button>
    {{ alert|markdown }}
  </div>
  {% endif %}
{% endblock %}

<div class="container theme-showcase" id="content">
  {% block content %}
  <div class="breadcrumbs">
      {{ breadcrumbs|safe }}&nbsp;&nbsp;<a href="javascript:void(location.href='https://cms.sunstarsys.com/redirect?uri='+escape(location.href))">
        <img alt="Ikonen Redigera" src="/images/edit.png" />
      </a>
  </div>
  <h1>{{ headers.title|safe }}</h1>
  <div class="jumbotron">{{ content|markdown }}</div>
  {% endblock %}

  <footer>{% block footer %}{% endblock footer %}</footer><!--
  <script src="/editor.md/js/raphael.min.js"></script>
  <script src="/editor.md/js/underscore.min.js"></script>
  <script src="/editor.md/js/flowchart.min.js"></script>
  <script src="/editor.md/js/jquery.flowchart.min.js"></script>
  <script src="/editor.md/js/sequence-diagram.min.js"></script> -->
  <script src="/editor.md/js/d3.min.js"></script>
  <script src="/editor.md/js/wasm/index.min.js"></script>
  <script src="/editor.md/js/d3-graphviz.js"></script>
  <script src="/editor.md/js/mermaid.min.js"></script>
  <script src="/editor.md/lib/codemirror/codemirror.min.js"></script>
  <script src="/editor.md/lib/codemirror/addons.min.js"></script>
  <script src="/editor.md/lib/codemirror/modes.min.js"></script>
  <script src="/editor.md/lib/copy-tex.js"></script>
  <script blocking="render" type="text/javascript">
    if (typeof(editormd) === "undefined") {
        //mermaid.registerExternalDiagrams([window["mermaid-mindmap"]]);
        mermaid.initialize({theme: "light", startOnLoad: true, securityLevel: "loose"});
        //$(".flowchart").flowChart();
        //$(".sequence-diagram").sequenceDiagram();
        for (const e of $("body").find(".graphviz").toArray()) {
            d3.select(e).graphviz({useWorker: false}).renderDot($(e).text());
            e.innerHTML = ""
        }
        $("body").find("pre").parent().addClass("editormd-preview-theme-light");
        CodeMirror.colorize();
    }
    if (document.cookie.indexOf("gdpr_analytics=1") == -1 &&
    document.cookie.indexOf("gdpr_decline=1") == -1) {
        for (const h1 of document.getElementsByTagName("h1")) {
            var html = `<div id="analytics"><br><div class="card border-warning">
<div class="card-header">
  <h3 class="card-title text-dark">This Site Uses Cookies for Analytics.</h4>
</div>
<div class="card-body">
<p class="card-text">
<small class="text-dark">Please choose your Analytics preference:</small><br>
  <button type="button" class="btn btn-outline-warning text-dark" data-bs-toggle="modal" data-bs-target="#date-filter-modal"
  onClick="document.cookie='gdpr_analytics=1; path=/; max-age=8640000';
  $('#analytics').css('display', 'none');true">I Consent.</button> &nbsp;
  <button type="button" class="btn btn-outline-danger text-dark" data-bs-toggle="modal" data-bs-target="#date-filter-modal"
  onClick="document.cookie='gdpr_decline=1; path=/; max-age=864000';
  $('#analytics').css('display', 'none');true">I
  Decline.</button><br><small class="text-dark">Should you elect to
  Decline, we will not ask again for the next 10 days.</small>
</p>
</div>
</div>
</div>`;
            h1.insertAdjacentHTML('beforeend', html);
        }
    }
    else if (document.cookie.indexOf("gdpr_decline=1") == -1) {
        document.cookie = 'gdpr_analytics=1; path=/; max-age=8640000';
    }
  </script>
  <script async type="module">
    if (document.cookie.indexOf("can_search") >= 0 && Notification.permission !== "denied") {
		var permission = Notification.permission;
		if (permission !== "granted") {
            Notification.requestPermission().then((result) => {
              permission = result;
            });
        }
        if (permission === "granted") {
		   var revision;
           var m = document.cookie.match(/last=([0-9]+)/);
           if (m)
			 revision = m[1];
           const response = await fetch("/dynamic/search/?regex=notify="+revision+";lang={{lang}};markdown_search=1;as_json=1",
                           {credentials: 'same-origin'});
           try {
              const json = await response.json();
              for (const e of json.log) {
                  var msg = e[3] + "\n";
                  for (const [key, val] of Object.entries(e[1])) {
                      msg += val.action + " " + key.replace(/^.*\//, "") + "\n";
				  }
				  var n = new Notification(e[2],
     			    {
					  body: msg,
					  tag: e[0],
					  icon: "/images/favicon",
					  image: "/images/iconoclast",
				    }
			  	  );
			      n.addEventListener("click", () => {window.open("https://{{website}}/dynamic/search/?regex=diff="+e[0]+";lang={{lang}};markdown_search=1") }, { capture: true });
			  }
		   }
           catch (e) {
              alert(e);
		   }
        }
	}
  </script>
  {% block javascript %}{% endblock %}
</div>
</body>
</html>