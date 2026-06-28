---
categories: Orión
dependencies: '*.md.es'
keywords: Orión, Hugo, SSG
status: verificado=46702
title: Orión vs. Hugo
---

<div class="right">

![Hugo SSG](ssg.page/hugo-logo-wide)

</div>

[TOC]#sidebar

@sunstarsys/status/2070917650042040818

## Prefacio

Entiendo que las comparaciones tecnológicas son un tabú religioso en muchos círculos.  El punto principal que estoy tratando de transmitir es que mientras [Orión](https://www.sunstarsys.com/orion/) Se factura como una wiki de Enterprise Jamstack, tiene muchos casos de uso viables fuera de ese dominio de problemas específico.

Sin embargo, la esencia de este artículo es representar el SSG con licencia Apache de Orion como *un mejor SSG que Hugo para usted y sus equipos de ingeniería de software*.  Tiene más potencia, más rendimiento, más funciones básicas y mucho más fácil de personalizar. Además, es [bien documentados](https://www.sunstarsys.com/orion/api/) y tiene un potencial ilimitado para los verdaderos usuarios de poder por ahí, al igual que usted!

## @SunStarSys/orión

- NKOTB

- Opinión con curva de aprendizaje gradual

## @GoHugoIo/hugo

- Popular

- Temas y extensiones robustos de terceros

- Opinión con curva de aprendizaje pronunciada

## Juegos de funciones comunes

- Apache con licencia

- Alto rendimiento (máxima velocidad de procesamiento de documentos a ~1K documentos por segundo)[^1]

- Gestión de dependencias en caché

- Modelo de seguridad sofisticado

## Orión como Hugo++

1. {# lede #}(Configurable) Potencia completa de las plantillas de Django dentro de las fuentes de Markdown{# lede #}

2. Flujo de control robusto, construcciones de bucle y filtros Django

3. Acceso completo a los documentos adjuntos de YAML/CSV como estructuras de datos

4. Gráficos vectoriales activados para WebGL[^2]

5. Operaciones de vectores de agregación en datos de tabla mediante `PDL`

6. `ssi` omite cabeceras de archivo

7. [Negociación de contenido / MultiViews](https://httpd.apache.org/docs/current/content-negotiation.html)

8. Fácil de usar

9. Compilaciones incrementales reales y flexibles

10. ACL por archivo/directorio (también conocida como ACL detallada), incluidos los controles de la pila de software y la configuración de la compilación

11. :editormd-logo: Sólido [$$\KaTeX$$](markdown-is-not-latex#h2-embrace-and-extend-redux) Soporte

12. Búsqueda PCRE integrada

### Casos de uso del editor de CMS de Orion

<center>

![Editor X](ssg.page/screenshot)

</center>

1. Linting de carga de documentos basado en el tipo MIME (Marcado, Perl, YAML, CSV, $$\LaTeX$$)

2. Validación/titulación automática de enlaces

3. Presentación preliminar en tiempo real para `@`-enlaces cortos (p. ej. :fa-x-twitter: tweets)

4. Finalización de HTML/tabulación eléctrica

5. Multilingüe con funcionalidad de traducción de IA OOTB &mdash; incluyendo chino, hebreo y árabe

6. $$\text{Markdown }\rightarrow\LaTeX$$ conversor de artículos con plantilla

### Construcciones incrementales de Orion

#### O(N) frente a O(1)

Si quieres que los autores y editores de tu wiki estén contentos con tu sistema de creación, tiene que admitir las creaciones incrementales como una función de primer orden, y *no un truco de marketing abordado como una idea posterior*.

¡Lo que significa que quieres Orión!

#### El caché de dependencia primitiva de Hugo (es decir, Gilding the Lilly)

Niveles cómicamente absurdos de puffery sin sentido en diagramas arquitectónicos muy detallados que evitan hábilmente declarar a los elepantes en la habitación...

> https://deepwiki.com/gohugoio/hugo/3.6-dependency-tracking-and-caching

Esto es lo que esa página no dice sobre la gestión de la dependencia de Hugo:

- inflexible, generado internamente [**DAG**](https://en.wikipedia.org/wiki/Directed_acyclic_graph) basado en diseños de árbol de nodo/hoja/paquete

- nunca se escribe en el disco

##### Hugo no rastreado `readFile` llama a break incremental build support

Vamos a examinar el elefante en la habitación en este artículo:

> https://mbuege.com/2025/09/04/hugo-include-shortcode/

```mermaid
treeView-beta
    arquetipos/
    activos/
    contenido/
      incluye/
        dummy.md :::resaltar ## dependencia sin seguimiento en Hugo
      publicaciones/
        2025-01-01-post1.md  ## puede utilizar "incluir" códigos cortos
        2025-01-02-post2.md  ## ...
    datos/
    i18n/
    diseños/
      códigos cortos/
        include.html  ## utiliza readFile() sobre un argumento aprobado
    estático/
    temas/
```

*Hugo no realiza un seguimiento de las dependencias de contenido que surgen de los códigos cortos, y hace suposiciones rígidas de DAG sobre las dependencias de contenido que realiza un seguimiento.*

##### Orión está completamente rastreado `ssi` llamadas

```mermaid
treeView-beta
tronco/
   contenido/
     foo/
	   fileA.md.en :::resaltar ## destino incluir archivo
	 barra/
	   fileB.md.en ## `ssi` incluye porciones seleccionadas de fileA.md.en
   cgi-bin/
   lib/
   plantillas/
```

*Orion pistas nativas `fileB.md.en`dependencia de `fileA.md.en` y la reconstruirá siempre que `fileA.md.en` se modifica; y las dependencias se pueden configurar suplementariamente por documento, no simplemente asumidas por la estructura jerárquica.*

El gráfico de dependencias de Orion es **casi nunca un DAG**. Y es **un componente esencial de la construcción**, no solo una optimización a medio respaldo de la forma en que lo es con Hugo.

Por ejemplo, el origen de Markdown de esta página web tiene un `Dependencies: *.md{{lang}}` encabezado (puede verlo en la captura de pantalla anterior del Editor, o haciendo clic en la [:fa-github: origen](https://github.com/SunStarSys/www.iconoclasts.blog/blob/trunk/content/joe/ssg.md{{lang}}) enlace donde se muestra el título y la información del autor) que utiliza Orion para generar los elementos bajo el "Índice" encabezado en el pie de página de la página.
Todos los archivos de este directorio están configurados de manera similar para hacer referencias cruzadas entre sí.

<span class="text-success">DAG es una simplificación excesiva de los requisitos de dependencia de contenido en casos de uso reales.</span>

[![no es un DAG](../images/deps.svg{{lang}})](dependencies)

### Control de versiones

#### ACL de Git y Detalladas

**Imposible** en cualquier DVCS como `git` &mdash; El acceso de lectura al repositorio implica el acceso a su totalidad, incluyendo el historial completo.  Ditto para el acceso push: es todo o nada, que es un factor decisivo en un contexto wiki donde los diferentes usuarios del repositorio requieren controles de acceso/autorización de escritura de archivos/directorios granulares.

#### Subversión

**Integración por usuario** trivial con git/GitHub mediante la `git-svn` puente incluido como una extensión de complemento por cada `git` distribución.

## Notas al pie

[^1]. Para una comparación de manzanas a manzanas, porté un subconjunto de <https://www.openoffice.org> `JBake` árbol fuente @apache/openoffice-org a Hugo y lo comparó con un simple `hyde` tema que acaba de acabar con el `body` innerHTML fuera del `.html` fuentes (renombradas como `.md` archivos con html incrustado) a'la

```html
{%templatetag openvariable %} define "main" -{% templatetag closevariable %}
<div class="post">
  <h1>{% templatetag openvariable %} .Title {% templatetag closevariable %}</h1>
  <time datetime={% templatetag openvariable %} .Date.Format "2006-01-02T15:04:05Z0700" {% templatetag closevariable %} class="post-date">{% templatetag openvariable %} .Date.Format "Mon, Jan 2, 2006" {% templatetag closevariable %}</time>
  {% templatetag openvariable %} $matches := findRESubmatch `(?s)<body[^>]*>(.*?)</body>` .Content {% templatetag closevariable %}
  {% templatetag openvariable %} range $matches {% templatetag closevariable %}{% templatetag openvariable %} index . 1 | safeHTML {% templatetag closevariable %}{% templatetag openvariable %} end {% templatetag closevariable %}
</div>
{% templatetag openvariable %} if .Site.Config.Services.Disqus.Shortname -{% templatetag closevariable %}
<h2>Comments</h2>
{% templatetag openvariable %} template "_internal/disqus.html" . {% templatetag closevariable %}
{% templatetag openvariable %}- end {% templatetag closevariable %}
{% templatetag openvariable %}- end {% templatetag closevariable %}
```

Y aquí está el `hugo.toml` archivo:
```text
baseURL = 'https://openoffice.org/'
languageCode = 'en-us'
title = 'My New Hugo Site'
theme = "hyde"
[markup]
  [markup.goldmark]
    [markup.goldmark.renderer]
      unsafe = true
```

Normalmente, se tarda entre 8 y 12 segundos (a veces hasta 30s) en procesar 10K dichos archivos.  En comparación con la creación de @SunStarSys/orion `./test.sh ooo` que [Construye consistentemente sobre 20K tales archivos en aproximadamente 2-3x el tiempo](https://github.com/SunStarSys/orion/actions/runs/28297700630/job/83840391681#:~:text=44556), parece que hay una **paridad de rendimiento** entre ellos en sitios web menos complejos pero muy grandes como <https://www.OpenOffice.org>.

Sin embargo, [Orión](https://www.sunstarsys.com/orion/) es capaz de mucho más si necesita una verdadera flexibilidad y un soporte de compilación incremental correcto, porque **creemos que sabe lo que funciona mejor para su sitio, a diferencia del resto de la comunidad de SSG sobrecargada alrededor de Hugo.**

[^2]. Soporte completo para cercados `asy` Bloques de Markdown con fuentes codificadas en @vectorgraphics/asymptote .

<!-- $Date$ $Author$ $Revision$ -->
