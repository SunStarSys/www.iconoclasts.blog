---
archived: ~
categories: TI, Perl, Correo, Herramientas
dependencies: '*.md.es'
keywords: ezmlm-idx,BATV,DMARC,SRS
published: ~
status: archivado
title: Listas de correo
---

## ezmlm-idx

Mi experiencia con el software de lista de correo gira en torno a [qmail](http://cr.yp.to/qmail.html) y [ezmlm-idx](http://untroubled.org/ezmlm/). Con unos pocos scripts pequeños, pude soportar una amplia variedad de casos de uso nuevos que no están soportados de forma inherente por `ezmlm-idx` sí mismo.  Las características que son genéricamente útiles fuera de [La Fundación de Software Apache](http://www.apache.org) se exponen a continuación.  Para utilizar estos archivos siga este [diseño](ezmlm/).

### BATV y SRS

[bin/sender-demunger](ezmlm/bin/sender-demunger.pl) es un pequeño script de envoltorio que permite `BATV` y `SRS` `REMITENTE` desmoronamiento para `ezmlm-idx`. Para utilizarlo simplemente lo agrega como prefijo a todas las líneas de su `</editor />` y `</manager />` bloques dentro de `en fr` y ejecutar `ezmlm-make -+` en sus listas, o en una pizca suponiendo que no va a ejecutar `ezmlm-make` de nuevo en sus listas, edite el `editor` y `mánager`

[BATV](http://en.wikipedia.org/wiki/Bounce_Address_Tag_Validation) y [SRS](http://en.wikipedia.org/wiki/Sender_Rewriting_Scheme) plantean problemas únicos para `ezmlm-idx` porque a diferencia de otro software de lista de correo que opera en `CORREO DE` parte del `SMTP`

Ambas especificaciones giran en torno a proporcionar direcciones temporales a la `CORREO DE` parte del sobre, que incrusta la dirección original de una manera fácilmente descifrable.  Pero {# lede #}estas direcciones temporales son un anatema para `ezmlm-idx`sistemas de suscripción y moderación{# lede #}, y `remitente-demunger.pl`

<div class="alert alert-info">
   <div class="alert-header">NOTA</div>
   <div class="alert-body">
Según las notas de la versión, desde la versión 7.0.0, ezmlm-idx debe tener compatibilidad con BATV y SRS incorporados. En cualquier caso, el émbolo del remitente realmente no hará daño por si acaso :-).
   </div>
</div>

### MARCADO

Ver [bin/ezmlm-dmarc-filter.pl](ezmlm/bin/ezmlm-dmarc-filter.pl) y [bin/ezmlm-seekable-stdin.pl](ezmlm/bin/ezmlm-seekable-stdin.pl) y [lib/pull_header.pm](ezmlm/lib/pull_header.pm). Para utilizar estos scripts, cambie las líneas de su `</editor />` sección de `en fr` ese llamado `ezmlm-puerta`, `tienda de ezmlm`, o `ezmlm-enviar`

```shell
    |/path/to/bin/ezmlm-dmarc-filter.pl '<#D#>/dmarc' | /path/to/bin/ezmlm-seekable-stdin.pl /path/to/bin/sender-demunger.pl <#B#>/ezmlm-gate -rY '<#D#>' '<#D#>' '<#D#>/digest' '<#D#>/allow' '<#D#>/mod'
    |/path/to/bin/ezmlm-dmarc-filter.pl '<#D#>/dmarc' | /path/to/bin/sender-demunger.pl <#B#>/ezmlm-store '<#D#>'
    |/path/to/bin/ezmlm-dmarc-filter.pl '<#D#>/dmarc' | <#B#>/ezmlm-send -r '<#D#>'
```

Asume que tocará un archivo con el nombre `dmarc` en cualquier directorio de lista en el que desee activar el filtro.  Puede configurar `en _ fr`

```shell
	</-dmarc#FXT/>
	</dmarc#f/>
	</dmarc#t/>
	</dmarc#x/>
```
La única lista de configuraciones que se ejecutan en conflicto con `DMARC` son aquellos con `-f`, `-t` o `-x`

En caso de que no se haya mantenido al día con los tiempos, hay un movimiento reciente en marcha para introducir fuertes [DMARC](http://en.wikipedia.org/wiki/DMARC) políticas que rechazan mensajes que fallan [DKIM](http://en.wikipedia.org/wiki/DomainKeys_Identified_Mail) pruebas de firma. Facebook, Twitter, LinkedIn, Yahoo! y ahora AOL han liderado esta carga en un nuevo territorio, obligando a los operadores de listas de correo a lidiar con la situación. ¿Qué `ezmlm-dmarc-filter.pl` si, y esta no es la única solución posible al problema, es `Firma de DKIM` encabezado para cualquier dominio de este tipo, y agregue un `. NO VÁLIDO` sufijo al remitente `Desde` dirección de cabecera.  Tiene la ventaja de ser una de las soluciones más sencillas que funciona, así que lo estoy ofreciendo aquí.  Hasta ahora, los dominios que implementan estrictos `DMARC` todas las políticas proporcionan `Responder a` encabezados, por lo que estos cambios realizados por `ezmlm-dmarc-filter.pl`

$Fecha: 2023-01-19 22:58:40 +0000 (Jue, 19 Ene 2023) $
