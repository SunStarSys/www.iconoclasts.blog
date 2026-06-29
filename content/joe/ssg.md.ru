---
categories: Орион
dependencies: '*.md.ru'
keywords: Орион, Хуго, ССГ
status: проверено=46797
title: Орион против Хьюго
---

<div class="right">

![Гуго ССГ](ssg.page/hugo-logo-wide)

</div>

[TOC]#sidebar

@sunstarsys/status/2070917650042040818

## Предисловие

Я понимаю, что технические сравнения являются религиозным табу во многих кругах.  Главное, что я пытаюсь донести, это то, что [Орион](https://www.sunstarsys.com/orion/) оплачивается как корпоративный Jamstack Wiki, он имеет много жизнеспособных сценариев использования вне этого конкретного домена проблемы.

Тем не менее, суть этой статьи заключается в том, чтобы представить Orion's Apache-Licensed SSG как *лучший SSG, чем Hugo для вас и ваших команд разработчиков программного обеспечения*.  Он обладает большей мощностью, большей производительностью, большим количеством основных функций и намного проще в настройке. Плюс это [хорошо документированный](https://www.sunstarsys.com/orion/api/) и имеет неограниченный потенциал для истинных сильных пользователей там, как и вы!

## @SunStarSys/orion

- НКОТБ

- Мнение с постепенной кривой обучения

## @GoHugoIo/хуго

- Популярные

- Надежные сторонние темы и расширения

- Мнение с крутой кривой обучения

## Общие наборы характеристик

- Апач лицензирован

- Высокая производительность (максимальная скорость обработки документов при ~1K документов в секунду)[^1]

- Управление зависимостями в кэше

- Сложная модель безопасности

## Орион как Hugo++

1. {# lede #}(Настраиваемый) Полная мощность шаблонов Django в источниках разметки{# lede #}

2. Надежный поток управления, фор-петлевые конструкции и фильтры Django

3. Полный доступ к прикрепленным документам YAML/CSV в виде структур данных

4. Векторная графика с поддержкой WebGL[^2]

5. Агрегирование векторных операций в данных таблицы с помощью `PDL`

6. `ssi` пропускает заголовки файлов

7. [Торги по контенту / MultiViews](https://httpd.apache.org/docs/current/content-negotiation.html)

8. Простота использования

9. Гибкие, реальные инкрементные сборки

10. ACL для каждого файла/каталога, включая элементы управления стеком программного обеспечения сборки и самой конфигурацией

11. :editormd-logo: Надежный [$$\KaTeX$$](markdown-is-not-latex#h2-embrace-and-extend-redux) Поддержка

12. Интегрированный поиск PCRE

### Примеры использования редактора CMS Orion

<center>

![Редактор X](ssg.page/screenshot)

</center>

1. Загрузка документа на основе MIME-типа (Markdown, Perl, YAML, CSV, $$\LaTeX$$)

2. Автоматическая проверка/заголовок ссылки

3. Представление предварительного просмотра в реальном времени для `@`-короткие ссылки (например :fa-x-twitter: твиты)

4. Завершение HTML/вкладки электроэнергии

5. Многоязычная функциональность перевода с ИИ OOTB &mdash; включая китайский, иврит и арабский

6. $$\text{Markdown }\rightarrow\LaTeX$$ шаблонный конвертер статей

### Построения приращения Orion

#### O(N) в сравнении с O(1)

Если вы хотите, чтобы авторы и редакторы вашей вики были довольны вашей системой сборки, она должна поддерживать инкрементные сборки в качестве функции первого заказа, а не маркетинговый трюк, на который обращают внимание как на задний ход*.

Это означает, что вы хотите Orion!

#### Кэш примитивной зависимости Гюго (Gilding the Lilly)

Комически абсурдные уровни бессмысленной пышности в очень подробных архитектурных схемах, которые ловко избегают указывать слонов в комнате...

> https://deepwiki.com/gohugoio/hugo/3.6-dependency-tracking-and-caching

Вот что эта страница не говорит об управлении зависимостями Hugo:

- негибкий, внутренний [**DAG**](https://en.wikipedia.org/wiki/Directed_acyclic_graph) на основе макетов дерева узлов/листов/наборов

- никогда не записывается на диск

##### Хьюго не отслежено `readFile` вызовы прерывают поддержку инкрементальной сборки

Давайте рассмотрим слона в комнате в этой статье:

> https://mbuege.com/2025/09/04/hugo-include-shortcode/

```mermaid
treeView-beta
    архетипы/
    активы/
    содержание/
      включает/
        dummy.md :::highlight ## неотслеживаемая зависимость в Hugo
      сообщения/
        2025-01-01-post1.md  ## может использовать "включать" короткие коды
        2025-01-02-post2.md  ## ...
    данные/
    i18n/
    макеты/
      короткие коды/
        include.html  ## использует readFile() по переданному аргументу
    статический/
    темы/
```

*Hugo не отслеживает зависимости контента, возникающие из коротких кодов, и делает жесткие допущения DAG о зависимостях контента, которые он отслеживает.*

##### Орион полностью отслеживается `ssi` вызовы

```mermaid
treeView-beta
багажник/
   содержание/
     фу/
	   fileA.md.en :::highlight ## цель включает файл
	 бар/
	   fileB.md.en ## `ssi` включает выбранные части файлаA.md.en
   cgi-bin/
   либ/
   шаблоны/
```

*Нативные треки Ориона `fileB.md.en`Зависимость от `fileA.md.en` и будет восстанавливать его, когда `fileA.md.en` изменяется; и зависимости дополнительно настраиваются для каждого документа, а не просто предполагаются иерархической структурой.

График зависимостей Ориона **почти никогда не является DAG**. И это **необходимый компонент сборки**, а не просто полузащищенная оптимизация, как это происходит с Hugo.

Например, источник разметки этой веб-страницы сам имеет `Dependencies: *.md{{lang}}` заголовок (вы можете увидеть его на приведенном выше снимке экрана редактора или нажав на [:fa-github: источник](https://github.com/SunStarSys/www.iconoclasts.blog/blob/trunk/content/joe/ssg.md{{lang}}#L4) ссылка, где отображается заголовок и информация об авторе), которая используется Orion для создания элементов под "Индекс" верхний колонтитул страницы.
Все файлы в этом каталоге аналогично настроены для перекрестных ссылок друг на друга!

<span class="text-success">DAG – это грубое упрощение требований к зависимости контента в реальных сценариях использования.</span>

[![не DAG](../images/deps.svg{{lang}})](dependencies)

### Контроль версий

#### Git и Fine-Grained ACL

**Невозможно** в любом DVCS, как `git` &mdash; доступ для чтения к репозиторию подразумевает доступ ко всей его целостности, включая полную историю.  Ditto для push-доступа: это все или ничего, что является нарушителем сделки в вики-контексте, где разные пользователи репозитория требуют детализированного файла / каталога авторизации записи / контроля доступа.

#### Подвержение

Тривиальная интеграция **per-user** с git/GitHub через `git-svn` мост, упакованный как расширение дополнения каждым `git` распределение.

## Сноски

[^1]. Для сравнения яблок с яблоками я портил подмножество <https://www.openoffice.org> `JBake` исходное дерево @apache/openoffice-org в Hugo и сравнение его с простым `hyde` Тема, которая только что выбрала `body` innerHTML из `.html` источники (переименованные как `.md` файлы со встроенным html) a'la

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

А вот и `hugo.toml` файл:
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

Обычно потребовалось 10-25 секунд (иногда до 40s), чтобы обработать 11K таких файлов и значительный корпус статических активов, даже при перестройке с полностью заполненным кэшем файловой системы.

```shell
/src/hugo-test/myblog(1)% hugo                                                                                                  74GB💾 1:04PM master✔✗
Start building sites …
hugo v0.154.5+extended linux/amd64 BuildDate=2026-01-13T19:59:22Z VendorInfo=ubuntu:0.154.5-1

│  EN
──────────────────┼───────
 Pages            │ 11020
 Paginator pages  │     0
 Non-page files   │     2
 Static files     │ 15979
 Processed images │     0
 Aliases          │     0
 Cleaned          │     0

Total in 18730 ms
19s ~/src/hugo-test/myblog% hugo                                                                                                     72GB💾 1:05PM master✔✗
Start building sites …
hugo v0.154.5+extended linux/amd64 BuildDate=2026-01-13T19:59:22Z VendorInfo=ubuntu:0.154.5-1

│  EN
──────────────────┼───────
 Pages            │ 11020
 Paginator pages  │     0
 Non-page files   │     2
 Static files     │ 15979
 Processed images │     0
 Aliases          │     0
 Cleaned          │     0

Total in 24974 ms

```

По сравнению с сборкой @SunStarSys/orion `./test.sh ooo` который [последовательно строит над 20K такие файлы, с тем же корпусом статических активов (что Orion gzip сжимает автоматически, в отличие от Hugo), примерно в то же время](https://github.com/SunStarSys/orion/actions/runs/28391229484/job/84118579251#:~:text=44556), кажется, между ними есть **паритет производительности** на наименее сложных, но очень больших веб-сайтах, таких как <https://www.OpenOffice.org>.

Однако [Орион](https://www.sunstarsys.com/orion/) способен на гораздо больше, если вам нужна истинная гибкость и правильная инкрементальная поддержка сборки, потому что **мы думаем, что вы знаете, что лучше всего работает для вашего сайта, в отличие от остального перегруженного сообщества SSG вокруг Hugo.**

[^2]. Полная поддержка огороженного `asy` блоки разметки с источниками, закодированными в @vectorgraphics/asymptote .

<!-- $Date$ $Author$ $Revision$ -->
