---
archived: ~
categories: Перл, Орион, Производительность, Апач
dependencies: '*.md.ru'
keywords: perl,dylan,static,метод,поиск,компиляция,запечатанный,apache,mod_perl,производительность
published: ~
status: архивированный
title: 'Запрос функции Perl 7: запечатанные под для типизированных лексикалов'
---

<div class="right">

![солнцезвездатолько](../images/sunstarstaronly.png).

</div>

## Проблема

{# lede #}Накладные расходы на производительность метода OO Perl 5 на 50% больше, чем на прямой вызов подпрограммы с именем{# lede #}.

## Исходное решение: оптимизация поиска метода Дага МакЭачерна

Даг был создателем проекта mod_perl еще в середине 90s, поэтому очевидно, что написание высокой производительности Перл было его форте. Один из его многочисленных вкладов в [p5p](https://lists.perl.org/list/perl5-porters.html) сократить накладные расходы на поиск метода OO вдвое, используя метод + <code> &#64;Кэш иерархии</code> ISA для поиска метода объекта времени выполнения для объектов mod_perl, таких как `Apache2::RequestRec` максимально упрощенным.  Но это только на полпути.

Это не пустяковая проблема с вызовами к `Структура C` методы получения &mdash; общая ситуация со многими API mod_perl. Штраф за поиск вызова метода времени выполнения Perl для httpd `Структура request_rec *`, который mod_perl предоставляет через `Apache2::RequestRec` модуль, находится на том же порядке величины полного выполнения вызова.  Для сайтов, поддерживаемых mod_perl и использующих миллионы методов XS, это ужасная трата драгоценных циклов процессора.

Что [Даг ищет](https://www.perl.com/pub/2000/06/dougpatch.html/) Это был способ сказать Perl 5, чтобы выполнить поиск метода во время компиляции, как это происходит с именованными вызовами подпрограммы.  Каждый раз, когда Даг пытался, он сталкивался с препятствиями социального или технического характера.  Возможно, пришло время сделать еще один шаг к этой идее с появлением Perl 7.

## [Базовый сценарий]({{snippetA.pretty_uri}}).

[snippet:repo=SunStarSys/sealed:path=t/bench.pl:lang=perl]

## Базовые результаты

```perl
1..3
sealed: compiling main->foo lookup.
sub sealed :sealed {
    use warnings;
    use strict;
    $y->foo:compiled;
}
sealed: compiling Benchmark->cmpthese lookup.
sealed: compiling Foo->foo lookup.
sealed: compiling main->foo lookup.
sealed: compiling Foo->bar lookup.
sealed: tweak() aborted: sealed: invalid lookup: Foo->bar - did you forget to 'use Foo' first?
sub __ANON__ :sealed {
    use warnings;
    use strict;
    my Foo $b = $a;
    $inner->foo($b->foo:compiled($inner->bar, $inner, $bench->cmpthese:compiled));
    $a = $inner;
    $a->foo:compiled;
    $b->bar;
}
sealed: compiling main->bar lookup.
sub also_sealed :sealed {
    use warnings;
    use strict;
    my main $a = shift();
    if ($a) {
        my Benchmark $bench = 'Benchmark';
        my $inner = $a;
        return sub {
            my Foo $b = $a;
            $inner->foo($b->foo:compiled($inner->bar, $inner, $bench->cmpthese:compiled));
            $a = $inner;
            $a->foo:compiled;
            $b->bar;
        }
        ;
    }
    $a->bar:compiled;
}
sealed: compiling main->_foo lookup.
sub reentrant :sealed {
    use warnings;
    use strict;
    my main $b = shift();
    (local our(@Q)) = 1;
    my $c = $b->_foo:compiled;
}
sealed: compiling main->foo lookup.
sealed: compiling main->bar lookup.
sealed: compiling main->reentrant lookup.
sub sealed2 :sealed {
    use warnings;
    use strict;
    my main $obj = 'main';
    foreach $_ (1 .. 3) {
        $obj->foo:compiled;
        $obj->bar:compiled;
        $obj->reentrant:compiled;
    }
}
sealed: compiling main->reentrant lookup.
sealed: compiling main->bar lookup.
sub _foo :sealed {
    package Foo;
    use warnings;
    use strict;
    my main $x = shift();
    $n++ ? $x->bar:compiled : $x->reentrant:compiled;
}
ok 1
             Rate  class method   anon   func sealed
class  16129032/s     --    -4%   -26%   -33%   -36%
method 16806723/s     4%     --   -23%   -30%   -34%
anon   21739130/s    35%    29%     --   -10%   -14%
func   24096386/s    49%    43%    11%     --    -5%
sealed 25316456/s    57%    51%    16%     5%     --
ok 2
           Rate method sealed
method 546448/s     --   -17%
sealed 662252/s    21%     --
ok 3
```

## Предлагаемое решение Perl 7: `:запечатанный` подпрограммы для типизированных лексикалов

Образец кода:

```perl
use v5.38;
use Apache2::RequestRec;

sub handler :Sealed (Apache2::RequestRec $r) {
  $r->content_type("text/html"); #compile time method lookup
}
```

## Качество продукции, надежный прототип Perl v5.28+: sealed.pm {{facts.releases.sealed.tag}} (на CPAN).

Инструкции по компиляции для перла 5.30+ доступны в `sealed.pm` pod, если вы хотите запустить mod_perl2 с ithreads и httpd-2.4 w/ event mpm, а не segfault в **любом** масштабе.  Протестировано `Солярис 11.4` и `Убунту 22.04` на amd64.

Для удовольствия попробуйте это [патч для обезьяны]({{snippetB.pretty_uri}}) по `ModPerl::RegistryCooker`:

[snippet:repo=SunStarSys/sealed:path=lib/ModPerl/RegistryCookerSealed.pm:lang=apache:lines=86-92]

Это позволяет воздействовать на `обработчик под:запечатанный {script go here}` на всех ваших `ModPerl::Реестр` Сценарии, что-то вроде [этот](https://github.com/SunStarSys/sealed/blob/master/enquiry.pl).

```shell
~/src/cms% h2load -n 100000 -c 1000 -m 100 -t 10 http://localhost/perl-script/enquiry.pl\?lang=.es
starting benchmark...
spawning thread #0: 100 total client(s). 10000 total requests
spawning thread #1: 100 total client(s). 10000 total requests
spawning thread #2: 100 total client(s). 10000 total requests
spawning thread #3: 100 total client(s). 10000 total requests
spawning thread #4: 100 total client(s). 10000 total requests
spawning thread #5: 100 total client(s). 10000 total requests
spawning thread #6: 100 total client(s). 10000 total requests
spawning thread #7: 100 total client(s). 10000 total requests
spawning thread #8: 100 total client(s). 10000 total requests
spawning thread #9: 100 total client(s). 10000 total requests
Application protocol: h2c
progress: 10% done
progress: 20% done
progress: 30% done
progress: 40% done
progress: 50% done
progress: 60% done
progress: 70% done
progress: 80% done
progress: 90% done
progress: 100% done

finished in 13.07s, 7652.14 req/s, 11.83MB/s
requests: 100000 total, 100000 started, 100000 done, 100000 succeeded, 0 failed, 0 errored, 0 timeout
status codes: 100000 2xx, 0 3xx, 0 4xx, 0 5xx
traffic: 154.61MB (162119955) total, 566.39KB (579980) headers (space savings 95.47%), 152.30MB (159700000) data
                       min         max         mean         sd        +/- sd
time for request:     5.74ms      12.77s       6.39s       3.61s    58.14%
time for connect:      304us    293.01ms     70.17ms     76.83ms    74.80%
time to 1st byte:     7.86ms       7.87s       3.33s       1.82s    50.40%
req/s           :       7.71      248.17       19.60       28.07    92.70%
```

См. <https://github.com/SunStarSys/sealed/blob/master/lib/sealed.pm>. Искать `т/bench.pl` в родительском каталоге.

Это позволит Perl 5 выполнять примеры кода `content_type` метод-поиск во время компиляции, не вызывая каких-либо проблем с бэк-компатом или поврежденных CPAN-кодеров, поскольку эта функция будет ориентирована на разработчиков приложений. Не наследуемые авторы ОО-модулей.

Эта идея безвозмездно украдена из [Дилан](https://jim.studt.net/dirm/interim-5.html).  [Прочитать](https://www.complang.tuwien.ac.at/gergo/papers/load_attr.pdf) для усилий CPython более десяти лет назад.

<!-- $Date$ $Author$ $Revision$ -->
