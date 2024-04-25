---
archived: ~
categories: ИТ, Perl, почта, инструменты
dependencies: '*.md.ru'
keywords: ezmlm-idx, BATV, DMARC, SRS
published: архивировано
status: ~
title: Списки рассылки
---

## ezmlm-idx

Мой опыт работы с программой рассылки вращается вокруг [qmail](http://cr.yp.to/qmail.html) и [ezmlm-idx](http://untroubled.org/ezmlm/). С помощью нескольких небольших сценариев я смог поддержать широкий спектр новых сценариев использования, не поддерживаемых самим ezmlm-idx.  Функции, которые в целом полезны за пределами [The Apache Software Foundation](http://www.apache.org) Выложены ниже.  Чтобы использовать эти файлы, следуйте этому [макету](ezmlm/).

### BATV и SRS

[bin/sender-demunger](ezmlm/bin/sender-demunger.pl).

[БАТВ](http://en.wikipedia.org/wiki/Bounce_Address_Tag_Validation) и [SRS](http://en.wikipedia.org/wiki/Sender_Rewriting_Scheme).

Обе спецификации вращаются вокруг предоставления временных адресов в конвертную часть MAIL FROM, которая позволяет легко расшифровать исходный адрес.  Но {# lede #}Эти временные адреса являются анафемой для подписных и модерационных систем `ezmlm-idx`{# lede #}

<div class="alert alert-info">
   <div class="alert-header">Примечание</div>
   <div class="alert-body">
Согласно примечаниям к выпуску, начиная с версии 7.0.0, ezmlm-idx должен иметь поддержку встроенных BATV и SRS. В любом случае отправитель-демунгер действительно не повредит на всякий случай :-).
   </div>
</div>

### МАРКО

См. [bin/ezmlm-dmarc-filter.pl](ezmlm/bin/ezmlm-dmarc-filter.pl) и [bin/ezmlm-seekable-stdin.pl](ezmlm/bin/ezmlm-seekable-stdin.pl) и [lib/pull_header.pm](ezmlm/lib/pull_header.pm).

```shell
    |/path/to/bin/ezmlm-dmarc-filter.pl '<#D#>/dmarc' | /path/to/bin/ezmlm-seekable-stdin.pl /path/to/bin/sender-demunger.pl <#B#>/ezmlm-gate -rY '<#D#>' '<#D#>' '<#D#>/digest' '<#D#>/allow' '<#D#>/mod'
    |/path/to/bin/ezmlm-dmarc-filter.pl '<#D#>/dmarc' | /path/to/bin/sender-demunger.pl <#B#>/ezmlm-store '<#D#>'
    |/path/to/bin/ezmlm-dmarc-filter.pl '<#D#>/dmarc' | <#B#>/ezmlm-send -r '<#D#>'
```

Предполагается, что вы коснетесь файла с именем dmarc в любых каталогах списков, в которых вы хотите включить фильтр.  Вы можете настроить `.ezmlmrc` для этого, добавив следующий блок в этот файл:

```shell
	</-dmarc#FXT/>
	</dmarc#f/>
	</dmarc#t/>
	</dmarc#x/>
```
Единственными конфигурациями списков, запущенными в нарушение DMARC, являются конфигурации с заданными значениями `-f', `-t` или `-x`. Приведенная выше конфигурация адаптируется для этого.

Если вы не успели за временем, есть недавнее движение, чтобы ввести сильный [DMARC](http://en.wikipedia.org/wiki/DMARC) политики, отклоняющие сообщения с ошибками [DKIM](http://en.wikipedia.org/wiki/DomainKeys_Identified_Mail).

$Дата$
