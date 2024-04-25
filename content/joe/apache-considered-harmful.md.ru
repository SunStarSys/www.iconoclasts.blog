---
archived: ~
categories: Апачи (Перл)
dependencies: '*.md.ru'
keywords: apache,httpd,mod_apreq2,libapreq2,mod_perl
status: подтверждено=19662
published: ~
title: Apache HTTPd Devs Считается вредным
---

<div class="right">

![скрытый и пернатый](apache-considered-harmful.page/feather.png).

</div>

## Фон

В течение последних 25 лет я был ведущим разработчиком подпроекта `apreq` в рамках [Apache HTTPd Server](https://httpd.apache.org) Родительский проект. Оригинальная идея `libapreq`, как безопасный / эффективный [отправка HTML-формы](https://www.w3.org/TR/2014/REC-html5-20141028/forms.html) и [Cookie](https://datatracker.ietf.org/doc/html/rfc6265).

В то время я мечтал превратить библиотеку в общую, не связанную с перлом библиотеку C, которая поддерживала бы привязки языков с других языков программирования, поэтому я настаивал на том, чтобы проект был [homed](https://httpd.apache.org/apreq) под зонтиком HTTPd вместо [Apache-Perl](https://perl.apache.org/).

С появлением «httpd-2». X, совершенно новая архитектура »I/O Filter« возникла из ядра httpd, а также полное отделение »APR« от самого ядра в качестве более общей среды выполнения переносимости, подобной POSIX, для проектов типа »C«, таких как »Subversion». Фактически, libapreq2 более тесно связан с проектом Apache APR в этом духе, и его API Perl отражает это в рамках его разработки APR::Request.  Он имеет встроенный режим *CGI* для автономной работы, вне среды выполнения httpd, что делает тестирование блока легким.

Тем не менее ключевым компонентом apreq2 всегда был модуль mod_apreq2, который был впервые задуман Bill Wrowe в начале 2000-х годов.  То, что он разработал во время сеанса мозгового штурма со мной (очно), было единой библиотекой синтаксического анализатора, внутренней для «httpd», которая ** делила ** отправленный запрос * тело * с каждым ключевым модулем заинтересованных сторон во время выполнения.  Это означало предоставление разборных данных модулям, подключенным к ядру обработки запросов *до*, *в течение*, и *после* выполнения обработчика содержимого. Он также должен был работать для подзапросов, независимо от того, потребляет ли обработчик контента проанализированные данные, или потребляет и повторно анализирует само тело необработанного запроса.

Я объяснял цели проектирования несколько раз на протяжении многих лет, даже в 2012 году на [dev@httpd](https://lists.apache.org/list.html?dev@httpd.apache.org:2012-04).

## Сбор облаков штормов

Хотя это видение было очень успешным, с языковыми связями, доступными для нескольких языков, таких как [`Perl`](https://perl.apache.org/), [`ФП`](https://github.com/php/php-src/blob/master/main/rfc1867.c),  [`TCL`](https://tcl.apache.org/), [`Р`](https://github.com/jeffreyhorner/rapache)и т. д., с 2010 года он оказался трагическим для [существующего сообщества пользователей](https://webtechsurvey.com/technology/smod_apreq2).

Что случилось? [Филип Голлуччи](https://projects.apache.org/committee.html?httpd#:~:text=Philip%20M.%20Gollucci)Мой коллега Перл/FreeBSD в то время начал агитировать за то, что мы продвигаем проект, который будет выпущен из самого сервера HTTPd. Что {{commentAA.headers.title}}Филипп тогда не очень хорошо знал, насколько полностью [пивиш, вапид и территориальный](https://www.mail-archive.com/dev@httpd.apache.org/msg77781.html) Эта команда стала{# lede #}, что означало бы необходимость сотрудничать с ними непосредственно на [пользовательские решения](https://www.mail-archive.com/dev@httpd.apache.org/msg77806.html).

В 2012 году Филипп получил то, что хотел, и я перестал сопротивляться, поэтому он [скрыто](https://svn.apache.org/viewvc?view=revision&revision=1201372).

## Выпадение

[В 2018 году](https://www.mail-archive.com/search?l=modperl@perl.apache.org&q=subject:%22Re%5C%3A+New+release+of+libapreq2%22&o=newest&f=1).

В 2020 году или около того, группа безопасности Гугла воспользовалась альфа-релизом httpd 2.5, испугав свою 8-летнюю копию `apreq2`. Они нашли несколько горячих точек, которые нуждались в ремонте.

Вместо того, чтобы быть любезным, чтобы обратиться к Филиппу, [Иссак Голдстенд](https://projects.apache.org/committee.html?httpd#:~:text=Issac%20Goldstand), [Макс Келлерман](https://projects.apache.org/committee.html?httpd#:~:text=Max%20Kellermann).

Но переворот был освобождением 2022 года [2.17](https://www.google.com/search?q=libapreq2-2.17), в котором новичок разработчик [целесообразно ввел фатальную ошибку в кодовую базу](http://svn.apache.org/viewvc?view=revision&revision=1895107), разрыв [девятнадцатилетний регрессионный тест](http://svn.apache.org/viewvc/httpd/apreq/trunk/library/t/parsers.c?r1=161816&r2=164254&pathrev=1895107).

## Посмертное

Если вы задаетесь вопросом, как что-то с разбитым регрессионным тестом заканчивается на [CPAN](https://cpan-digger.perlmaven.com/dist/libapreq2)Вы должны посмотреть, как [RELENG](https://httpd.apache.org/dev/release.html).

Длинная история, [они прокомментировали тест](http://svn.apache.org/viewvc?view=revision&revision=1903489) и отправил его в любом случае, и назвал его безопасным выпуском, который [исправил уязвимость каждый предыдущий выпуск был восприимчив к](https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1018191).

<div class="right">

![Логотип супермена](apache-considered-harmful.page/superman.jpg).

</div>

Почему я забочусь сейчас? Потому что я сосатель [пользователи обращаются за ответами](https://www.mail-archive.com/dev@httpd.apache.org/msg77426.html).

Это отстой, но я сожалею, что мои дни ношения мыса Супермена в Апаче закончились около десяти лет назад.

<!-- $Date$ $Author$ $Revision$ -->
