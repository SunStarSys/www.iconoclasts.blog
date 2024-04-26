---
archived: ~
categories: Perl, Orion, Rendimiento, Apache
dependencies: '*.md.es'
keywords: perl,dilano,estático,método,lookup,compile,sealed,apache,mod_perl,rendimiento
published: ~
status: borrador
title: 'Perl 7 Solicitud de características: subs sellados para léxicos mecanografiados'
---

<div class="right">
  <img src="../images/sunstarstaronly.png">
</div>

## El problema

{# lede #}La consulta del método de tiempo de ejecución OO de Perl 5 tiene un 50% más de sobrecarga de rendimiento que una llamada de subrutina con nombre directa{# lede #}

## La solución inicial: las optimizaciones de búsqueda de métodos de Doug MacEachern

Doug fue el creador del proyecto mod_perl a mediados de los años 90, por lo que obviamente escribir alto rendimiento Perl fue su fortaleza. Una de sus muchas contribuciones a [p5p](https://lists.perl.org/list/perl5-porters.html) era reducir a la mitad la penalización de rendimiento de la sobrecarga de consulta del método OO, mediante un método + <code> &#64;Caché de jerarquía</code> de ISA para hacer que el método de objeto de tiempo de ejecución busque objetos mod_perl como `Apache2::RequestRec`

Este no es un problema insignificante con las llamadas a `Estructura C` métodos de acceso get-set &mdash; la situación común con muchas API de mod_perl. Penalización de consulta de llamada de método de tiempo de ejecución de Perl en httpd's `estructura request_rec *`, que mod_perl expone a través de `Apache2::RequestRec`

Qué [Doug estaba buscando]

## [Script de referencia]({{snippetA.pretty_uri}}).

[snippet:repo=SunStarSys/sealed:path=t/bench.pl:lang=perl]

## Resultados de referencia

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

## Solución propuesta de Perl 7: `:sellado`

Código de ejemplo:

```perl
use v7.0;
use Apache2::RequestRec;

sub handler :sealed {
  my Apache2::RequestRec $r = shift;
  $r->content_type("text/html"); #compile time method lookup
}
```

## Producción-Calidad, Robusto Perl v5.28+ Prototipo: sealed.pm {{facts.releases.sealed.tag}}

Las instrucciones de compilación para perl 5.30+ están disponibles en el `sealed.pm` pod si desea ejecutar mod_perl2 con ithreads y httpd-2.4 con mpm de evento, y no segfault a **cualquier** escala.  Probado en `Solaris 11.4` y `Ubuntu 22.04`

Por diversión, prueba esto [parche de mono]({{snippetB.pretty_uri}}) para `ModPerl::RegistryCooker`

[snippet:repo=SunStarSys/sealed:path=lib/ModPerl/RegistryCookerSealed.pm:lang=apache:lines=86-92]

Permite los efectos de `submanejador: {script va aquí} sellado` en todos sus `ModPerl::Registro` guiones, algo así como [este]

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

Consulte <https://github.com/SunStarSys/sealed/blob/master/lib/sealed.pm>. Buscar `t/bench.pl`

Esto permitirá a Perl 5 hacer el código de muestra `content_type`

Esta idea perlana es gratuitamente robada de [Dylan](https://jim.studt.net/dirm/interim-5.html).  [Leer esto]

<!-- $Date$ $Author$ $Revision$ -->
