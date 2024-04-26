---
archived: ~
categories: Апачи (Перл)
dependencies: '*.md.ru'
keywords: apache,httpd,mod_apreq2,libapreq2,mod_perl
published: ~
status: черновик
title: Apache HTTPd Devs Считается вредным
---

<div class="right">

![дегтярные и пернатые](apache-considered-harmful.page/feather.png).

</div>

## Фон

В течение последних 25 лет я был ведущим разработчиком `апорек` подпроектом внутри [Сервер Apache HTTPd](https://httpd.apache.org) Родительский проект. Оригинальная идея `либапрек`как безопасный/производительный [Отправка формы HTML](https://www.w3.org/TR/2014/REC-html5-20141028/forms.html) и [Печенье](https://datatracker.ietf.org/doc/html/rfc6265).

В то время я мечтал превратить библиотеку в общую, не связанную с перлом. `C` библиотека, которая поддерживает привязки языков с других языков программирования, поэтому я настаивал на том, чтобы проект был [домашнее](https://httpd.apache.org/apreq) под зонтиком HTTPd вместо [Апач-Перл](https://perl.apache.org/).

С приходом `httpd-2. X`совершенно новый `Фильтр ввода-вывода` архитектура возникла из `httpd` а также полное разделение `APR` от самого ядра как более общее назначение POSIX-подобная среда выполнения для `C` проекты как `Подрывная деятельность`. На самом деле, `libapreq2` более тесно связан с `Апачи APR` Проект в этом духе, и его Perl API отражает это как часть его `APR::Запрос` наращивание.  Он имеет встроенный режим *CGI* для автономной работы, вне `httpd`

Однако ключевой компонент `apreq2` всегда был `mod_apreq2` Модуль Apache, который был впервые задуман `Билл Воу` в начале 2000-х.  То, что он разработал, во время мозгового штурма со мной (очно), было единой библиотекой парсеров, внутренней для `httpd`

Я объяснял цели дизайна несколько раз за эти годы, даже в 2012 году [разработка@httpd](https://lists.apache.org/list.html?dev@httpd.apache.org:2012-04).

## Сбор облаков штормов

Хотя это видение было очень успешным, с языковыми связями, доступными для нескольких языков, таких как [`Перл`](https://perl.apache.org/), [`ЛДС`](https://github.com/php/php-src/blob/master/main/rfc1867.c),  [`TCL`](https://tcl.apache.org/), [`R`](https://github.com/jeffreyhorner/rapache)и т. д., с 2010 года он оказался трагическим для [существующее сообщество пользователей](https://webtechsurvey.com/technology/smod_apreq2) <a class="border border-warning text-muted reference-link" href="#commentAA" id="commentAA-link" title="{{commentAA.headers.title}}">состоящий из всех </a>не только членов `Перл`

Что случилось? [Филип Голлуччи](https://projects.apache.org/committee.html?httpd#:~:text=Philip%20M.%20Gollucci)Мой коллега Перл/FreeBSD в то время начал агитировать за то, что мы продвигаем проект, который будет выпущен из самого сервера HTTPd. Что {# lede #}Филипп не очень хорошо знал тогда, как совершенно [павлин, вапид и территориальный](https://www.mail-archive.com/dev@httpd.apache.org/msg77781.html) Эта команда стала{# lede #}Это означало бы, что с ними придется сотрудничать напрямую. [решения для пользователей](https://www.mail-archive.com/dev@httpd.apache.org/msg77806.html).

В 2012 году Филипп получил то, что хотел, и я перестал сопротивляться, поэтому он [разветвленный](https://svn.apache.org/viewvc?view=revision&revision=1201372) существующий проект и скопировал `C`

## Выпадение

[В 2018 году](https://www.mail-archive.com/search?l=modperl@perl.apache.org&q=subject:%22Re%5C%3A+New+release+of+libapreq2%22&o=newest&f=1).

В 2020 году или около того, команда безопасности Гугла воспользовалась альфа-релизом httpd 2.5, испугав свою 8-летнюю копию `apreq2`

Вместо того, чтобы быть любезным, чтобы обратиться к Филиппу, [Иссак Голдштанд](https://projects.apache.org/committee.html?httpd#:~:text=Issac%20Goldstand), [Макс Келлерман](https://projects.apache.org/committee.html?httpd#:~:text=Max%20Kellermann) (@MaxKellermann), я (@joesuf4) или кто-либо другой, участвующий в развитии `libapreq2`

Но государственный переворот был освобождением 2022 года [2.17](https://www.google.com/search?q=libapreq2-2.17), где новичок разработчик [намеренно ввел фатальную ошибку в кодовую базу](http://svn.apache.org/viewvc?view=revision&revision=1895107), разрыв [девятнадцатилетний регрессионный тест](http://svn.apache.org/viewvc/httpd/apreq/trunk/library/t/parsers.c?r1=161816&r2=164254&pathrev=1895107).

## Посмертное

Если вы задаетесь вопросом, как что-то с разбитым регрессионным тестом заканчивается [CPAN](https://cpan-digger.perlmaven.com/dist/libapreq2)Вам придется посмотреть, как [РЕЛЕНГ](https://httpd.apache.org/dev/release.html).

Короткая история, [Они прокомментировали тест](http://svn.apache.org/viewvc?view=revision&revision=1903489) и отправил его в любом случае и назвал его безопасным выпуском, который [исправлена уязвимость каждого предыдущего выпуска](https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1018191).

<div class="right">

![Логотип Superman](apache-considered-harmful.page/superman.jpg).

</div>

Почему мне всё равно? Потому что я сосатель [пользователи обращаются за ответами](https://www.mail-archive.com/dev@httpd.apache.org/msg77426.html).

Это отстой, но я сожалею, что мои дни ношения мыса Супермена в Апаче закончились около десяти лет назад.

<!-- $Date$ $Author$ $Revision$ -->
