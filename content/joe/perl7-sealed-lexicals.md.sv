---
archived: ~
categories: Perl, Orion, Prestanda, Apache
dependencies: '*.md.sv'
keywords: perl,dylan,statisk,metod,lookup,kompilera,förseglad,apache,mod_perl,prestanda
published: ~
status: arkiverad
title: 'Perl 7 Funktionsbegäran: förseglade subs för typangivna lexikaler'
---

<div class="right">

![solstjärnaendast](../images/sunstarstaronly.png)

</div>

## Problemet

{# lede #}Uppslagningen av OO-exekveringsmetod för Perl 5 har 50 % högre prestandakostnader än ett direkt, namngivet subrutinanrop{# lede #}.

## Den första lösningen: Doug MacEacherns metoduppslagsoptimeringar

Doug var skaparen av mod_perl projektet tillbaka i mitten av 90s, så uppenbarligen skriva högpresterande Perl var hans  forté. Ett av hans många bidrag till [p5p](https://lists.perl.org/list/perl5-porters.html) skulle halvera prestandapåföljden för OO-metodens uppslagskostnader med en metod + <code> &#64;Hierarkicache för ISA</code> för att göra uppslagning av objektmetod vid exekvering för mod_perl-objekt som `Apache2::RequestRec` så effektiv som möjligt.  Men det tar oss bara halvvägs dit.

Detta är inte ett problem med samtal till `C-struktur` get-set-åtkomstmetoder &mdash; Den gemensamma situationen med många mod_perl API:er. Perls exekveringsmetod - straffavgift för anropssökning på httpd `struktur request_rec *`, som mod_perl exponerar via `Apache2::RequestRec` modulen, är i samma storleksordning som det fullständiga utförandet av samtalet.  För mod_perl backade webbplatser som gör miljontals XS-metodanrop en sekund, är detta ett fruktansvärt slöseri med värdefulla CPU-cykler.

Vad [Doug söker](https://www.perl.com/pub/2000/06/dougpatch.html/) var ett sätt att tala om för Perl 5 att utföra metodsökning vid kompilering, hur det gör med namngivna subrutinanrop.  Varje gång Doug försökte, slog han vägspärrar av antingen social eller teknisk natur.  Kanske är det dags att göra ett nytt pass på denna idé med tillkomsten av Perl 7.

## [Referensskript]({{snippetA.pretty_uri}}).

[snippet:repo=SunStarSys/sealed:path=t/bench.pl:lang=perl]

## Riktmärkesresultat

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

## Föreslagen lösning perl 7: `:förseglad` underrutiner för typangivna lexikaliska

Exempelkod:

```perl
use v5.38;
use Apache2::RequestRec;

sub handler :Sealed (Apache2::RequestRec $r) {
  $r->content_type("text/html"); #compile time method lookup
}
```

## Produktionskvalitet, Robust Perl v5.28+ Prototyp: sealed.pm {{facts.releases.sealed.tag}} (på CPAN).

Kompileringsinstruktioner för perl 5.30+ finns i `sealed.pm` podden ska du köra mod_perl2 med ithreads och httpd-2.4 w/ event mpm, och inte segfault vid **any**-skalan.  Testad den `Solaris 11.4` och `Ubuntu 22.04` på amd64.

För skojs skull, prova detta [apa]({{snippetB.pretty_uri}}) till `ModPerl::RegistryCooker`:

[snippet:repo=SunStarSys/sealed:path=lib/ModPerl/RegistryCookerSealed.pm:lang=apache:lines=87-92]

Det möjliggör effekterna av `underhanterare: förseglad {script go here}` på alla dina `ModPerl::Register` Skript, ungefär som [denna](https://github.com/SunStarSys/sealed/blob/master/enquiry.pl).

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

Se <https://github.com/SunStarSys/sealed/blob/master/lib/sealed.pm>. Sök efter `t/bench.pl` i den överordnade katalogen.

Detta gör det möjligt för Perl 5 att göra provkodens `content_type` metod-lookup vid kompileringstid, utan att orsaka några back-compat problem eller aggrieved CPAN kodare, eftersom denna funktion skulle rikta applikationsutvecklare. Ej ärftliga OO-modulförfattare.

Denna Perlish idé är gratis stulen från [Dylan](https://jim.studt.net/dirm/interim-5.html).  [Läs detta](https://www.complang.tuwien.ac.at/gergo/papers/load_attr.pdf) för CPython-insatsen för över ett decennium sedan.

<!-- $Date$ $Author$ $Revision$ -->
