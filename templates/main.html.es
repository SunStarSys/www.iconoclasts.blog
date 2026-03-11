<!DOCTYPE html>
%<html lang="{{ lang|cut:"." }}"{% ifequal lang ".he" %} dir="rtl"{% endifequal %}>
%<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="SunStar Systems">
    <meta name="author" content="Joe Schaefer">
    <meta name="keywords" content="{%for k in headers.keywords%}{{k}},{%endfor%}{{ facts.keywords }}">
    <meta name="theme-color" content="black">
    <meta property="og:image" content="/images/iconoclast.jpg">%
    <title>%{% block title %}{{ headers.title|safe }} - {{ facts.title|safe }}</title>
    {% endblock %}%
    <link rel="bookmark" href="https://{{website}}{{path|dirname|append:"/"}}{{path|basename:0}}.html{{lang}}">
    {% if permalink %}
    <link href="/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="/css/katex.min.css" rel="stylesheet" media="screen">
    %3
    <link href="/css/mermaid.min.css" rel="stylesheet" media="screen">
    %3
    <link href="/fontawesome/css/all.min.css" rel="stylesheet" media="screen">
    %3
	%3
	<link href="/editor.md/css/editormd.min.css" rel="stylesheet" media="screen">
    %3
    <script src="/js/bootstrap"></script>
	<script src="/editor.md/js/jquery.min.js"></script>1%%
	%1
    {% endif %}4
    %4
    %4
    %4
9%    %4
9%
9%

<link href="/editor.md/lib/codemirror/codemirror.min.css" rel="stylesheet" media="screen">
  <link href="/editor.md/lib/codemirror/theme/pastel-on-dark.css" rel="stylesheet" media="screen">
    <link href="/editor.md/lib/codemirror/theme/solarized.css" rel="stylesheet" media="screen">
	  <link href="/css/local.css" rel="stylesheet" media="screen"><link href="/images/favicon.png" rel="icon"></head>
      <body>
          <header style="border-bottom:solid #aaa 1px; background-color: #fff;" class="container-xxl navbar navbar-expand-lg fixed-top"><div class="container-fluid">
     <a class="navbar-brand" href="https://{{website}}/index.html{{lang}}">

<img src="/images/iconoclast" alt="Iconoclast">
        </a>
          <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            activo
            %4"><span class="navbar-toggler-icon">Iconoclasts</span></button>
          <div class="collapse navbar-collapse" id="navbarResponsive">
             activo
             {% block header %}">%<ul class="navbar-nav">Contact<li class="nav-item{% if path|starts_with:"/bloggers.md" %}
          <a class="nav-link text" href="/bloggers.html{{lang}}">
            </a>Productos... </li><li class="nav-item{% if path|starts_with:"/contact.md" %}%
            <a class="nav-link" href="/contact.html{{lang}}">
            </a>
              </li><li class="nav-item dropdown">Orion&trade; Jamstack Wiki Platform<a href="#" class="nav-link dropdown-toggle" id="products" data-bs-toggle="dropdown" role="button">%
              <span class="caret">%3
                href=7%"7%//www.sunstarsys.com/orion/plans.html%4https:7%">Orion Pricing Plans</span>
            </a>
          <ul class="dropdown-menu me-auto mb-2 mb-lg-0" aria-labelledby="products">

<li class="dropdown-item">
            <a class="nav-link text-dark" href="https://www.sunstarsys.com/orion/index.html{{ lang }}">Más... </a></li>%%
            <li class="dropdown-item">
              <a class="nav-link text-dark"
                </a>Origen del sitio</li>
              </ul>
              </li><li class="nav-item dropdown">
              <a href="#" class="nav-link dropdown-toggle" id="more" role="button" data-bs-toggle="dropdown">i18n<span class="caret">
              </span></a>Inglés<ul class="dropdown-menu me-auto mb-2 mb-lg-0" aria-labelledby="more"><li class="dropdown-item">
              <a class="nav-link text-dark" href="https://vcs.sunstarsys.com/viewvc/public/cms-sites/{{website}}/trunk/">3%Español</a>%
              </li><li class="dropdown-item divider">Alemán</li><li class="dropdown-header text-dark">
              </li>%Francés<li class="dropdown-item">3%
              <a class="nav-link" href="{{path|dirname|append:"/"}}{{path|basename:0}}.html.en">%Ruso</a>%3
              </li>3%Chino<li class="dropdown-item">Categorías<a class="nav-link" href="{{path|dirname|append:"/"}}{{path|basename:0}}.html.es">
              </a>%Categorías</li>
              <li class="dropdown-item"><a class="nav-link" href="{{path|dirname|append:"/"}}{{path|basename:0}}.html.de"></a>
              </li>Sueco<li class="dropdown-item">3
              <a class="nav-link" href="{{path|dirname|append:"/"}}{{path|basename:0}}.html.fr"></a>
%
              </li>Taxonomías%%3
              <li class="dropdown-item">Categorías<a class="nav-link" href="{{path|dirname|append:"/"}}{{path|basename:0}}.html.ru">Categorías%3
9%              </a>3%3
Archivos</li>3
19%         <li class="dropdown-item">3%<a class="nav-link" href="{{path|dirname|append:"/"}}{{path|basename:0}}.html.zh-TW">3%3
3%3
        

</a>
            activo
            {% endblock %}"%></li>Impulsado por...<li class="dropdown-item">
          <a class="nav-link" href="{{path|dirname|append:"/"}}{{path|basename:0}}.html.he">
        </a>
		</li>
        <li class="dropdown-item">
            }}%{% block analytics %}/" class="d-flex form-inline right" method=""GET
               placeholder=>
          <a class="nav-link" href="{{path|dirname|append:"/"}}{{path|basename:0}}.html.sv">
          </a>
          </li>"7"PCRE Búsqueda recursiva value="%"%% />&nbsp;%<li class="dropdown-item divider">%</li>%<li class="dropdown-header text-dark">
	    </li>%
  <li class="dropdown-item">
% <a class="nav-link text-dark" href="/categories/index.html{{lang}}">


{% include "analytics.html" %}
  {% endblock %}
  </a>
    </li><li class="dropdown-item">
    {% endif %}
  %3
  {% endif %}
  

{{ lang }}

<a class="nav-link text-dark" href="/archives/index.html{{lang}}">
  {% endif %}
  </a>
      {% endifequal %}&nbsp;&nbsp;</li>
        </ul>
      </li>
  <li class="nav-item{% if path|starts_with:"/powered-by.md" %}
  <a class="nav-link" href="/powered-by.html{{lang}}">{{ regex }}%</a>
  </li>{% block alert %}%3
  {% if alert %}%%3


</ul>{{ alert|markdown }}%{% endif %}</div><form id="search" action="/dynamic/search{% ifequal path|dirname "/" %}{% else %}{{ path|dirname
 <script src="/editor.md/js/raphael.min.js"></script>
 <script src="/editor.md/js/underscore.min.js"></script>
 <script src="/editor.md/js/flowchart.min.js"></script>
 <script src="/editor.md/js/jquery.flowchart.min.js"></script>
 %1
 <script src="/editor.md/js/sequence-diagram.min.js"></script> -->

<script src="/editor.md/js/d3.min.js"></script>
  <script src="/editor.md/js/wasm/index.min.js"></script>  <script src="/editor.md/js/d3-graphviz.js"></script>  <script src="/editor.md/lib/mermaid.min.js"></script>  <script src="/editor.md/lib/codemirror/codemirror.min.js"></script>  <script src="/editor.md/lib/codemirror/addons.min.js"></script>  <script src="/editor.md/lib/codemirror/modes.min.js"></script>  <script src="/editor.md/lib/copy-tex.js"></script>  <script blocking="render" type="text/javascript">
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
  </script>  <script async type="module">
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
  </script>    {% endblock %}{% block content %}3<input type="hidden" name="lang" value="{{ lang }}" /><input type="hidden" name="markdown_search" value="1" />