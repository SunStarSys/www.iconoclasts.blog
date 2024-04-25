---
archived: ~
categories: Перл, Орион, Перформанс, Апач
dependencies: '*.md.ru'
keywords: perl,dylan,static,method,lookup,compile,sealed,apache,mod_perl,performance
published: черновик
status: ~
title: 'Запрос функции Perl 7: запечатанные поддоны для типизированных лексиков'
---

<div class="right">
  <img src="../images/sunstarstaronly.png">
</div>

## Проблема

{# lede #}Поиск метода выполнения OO в Perl 5 на 50% больше накладных расходов на производительность, чем прямой именованный вызов подпрограммы{# lede #}

## Первоначальное решение: оптимизация поиска метода Дага МакЭчерна

Даг был создателем проекта mod_perl еще в середине 90-х годов, поэтому, очевидно, письмо с высокой производительностью Перла было его фортом. Один из его многочисленных вкладов в [p5p](https://lists.perl.org/list/perl5-porters.html) необходимо было вдвое сократить штраф за производительность при поиске метода OO, используя метод + <code> &#64;

Это не мелочная проблема с вызовами методов доступа get-set `C Structure` &mdash;

Что искал Дуг(https://www.perl.com/pub/2000/06/dougpatch.html/).

## [Сценарий тестирования]({{snippetA.pretty_uri}}).

[snippet:repo=SunStarSys/sealed:path=t/bench.pl:lang=perl]

## Результаты базового показателя

```perl
1..3
sealed: compiling main->reentrant lookup.
sealed: compiling main->bar lookup.
sub _foo :sealed {
    package Foo;
    use warnings;
    use strict;
    my main $x = shift();
    $n++ ? $x->bar:compiled : $x->reentrant:compiled;
}
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
Use of uninitialized value in addition (+) at lib/sealed.pm line 137.
sealed: tweak() aborted: sealed: invalid lookup: Foo->bar - did you forget to 'use Foo' first? at lib/sealed.pm line 75.
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

## Предложенное решение Perl 7: подпрограммы `:sealed` для типизированных лексик

Пример кода:

```perl
use v7.0;
use Apache2::RequestRec;

sub handler :sealed {
  my Apache2::RequestRec $r = shift;
  $r->content_type("text/html"); #compile time method lookup
}
```

## Производство-Качество, Надежный Perl v5.28+ Прототип: sealed.pm {{facts.releases.sealed.tag}}

Инструкции по компиляции для perl 5.30+ доступны в отсеке `sealed.pm`, если вы хотите запустить mod_perl2 w/ ithreads и httpd-2.4 w/ event mpm, а не segfault в **любой** шкале.  Протестировано на «Солярис 11.4» и «Убунту 22.04» на amd64.

Для удовольствия, попробуйте это [обезьяна патч]({{snippetB.pretty_uri}}).

[snippet:repo=SunStarSys/sealed:path=lib/ModPerl/RegistryCookerSealed.pm:lang=apache:lines=86-92]

Он включает эффекты `sub handler :Sealed {script go here}` на все ваши скрипты `ModPerl::Registry`, что-то вроде [этого](https://github.com/SunStarSys/sealed/blob/master/enquiry.pl).

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

См. <https://github.com/SunStarSys/sealed/blob/master/lib/sealed.pm>. Найдите t/bench.pl в родительском каталоге.

Это позволит Perl 5 выполнять поиск метода content_type в процессе компиляции, не вызывая проблем с обратной совместимостью или проблем с кодерами CPAN, поскольку эта функция будет ориентирована на разработчиков приложений. Не наследуемые авторы OO-модулей.

Эта перлишская идея безвозмездно украдена у Дилана(https://jim.studt.net/dirm/interim-5.html).  [Читать](https://www.complang.tuwien.ac.at/gergo/papers/load_attr.pdf).

<!-- $Date$ $Author$ $Revision$ -->
