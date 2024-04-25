---
archived: ~
categories: IT, Perl, Mail, Verktyg
dependencies: '*.md.sv'
keywords: ezmlm-idx,BATV,DMARC,SRS
published: ~
status: arkiverad
title: Utskickslistor
---

## ezmlm-idx

Min erfarenhet av e-postlisteprogram kretsar kring [qmail](http://cr.yp.to/qmail.html) och [ezmlm-idx](http://untroubled.org/ezmlm/). Med några små skript kunde jag stödja ett brett utbud av nya användningsfall som inte stöds av själva "ezmlm-idx".  De funktioner som är allmänt användbara utanför [The Apache Software Foundation](http://www.apache.org) läggs ut nedanför.  För att använda dessa filer följ denna [layout](ezmlm/).

### BATV och SRS

[bin/sender-demunger](ezmlm/bin/sender-demunger.pl).

[BATV](http://en.wikipedia.org/wiki/Bounce_Address_Tag_Validation) och [SRS](http://en.wikipedia.org/wiki/Sender_Rewriting_Scheme).

Båda specifikationerna handlar om att tillhandahålla tillfälliga adresser till kuvertdelen "MAIL FROM", som bäddar in den ursprungliga adressen på ett enkelt dechiffrerbart sätt.  Men {# lede #}dessa tillfälliga adresser är anathema till "ezmlm-idx" abonnemang och modereringssystem{# lede #}

<div class="alert alert-info">
   <div class="alert-header">NOTERA</div>
   <div class="alert-body">
Enligt versionsinformationen, sedan version 7.0.0, bör ezmlm-idx ha stöd för BATV och SRS inbyggda. I vilket fall som helst kommer avsändare-demunger verkligen inte att skada bara i fall :-).
   </div>
</div>

### MARC

Se [bin/ezmlm-dmarc-filter.pl](ezmlm/bin/ezmlm-dmarc-filter.pl) och [bin/ezmlm-sekable-stdin.pl](ezmlm/bin/ezmlm-seekable-stdin.pl) och [lib/pull_header.pm](ezmlm/lib/pull_header.pm).

```shell
    |/path/to/bin/ezmlm-dmarc-filter.pl '<#D#>/dmarc' | /path/to/bin/ezmlm-seekable-stdin.pl /path/to/bin/sender-demunger.pl <#B#>/ezmlm-gate -rY '<#D#>' '<#D#>' '<#D#>/digest' '<#D#>/allow' '<#D#>/mod'
    |/path/to/bin/ezmlm-dmarc-filter.pl '<#D#>/dmarc' | /path/to/bin/sender-demunger.pl <#B#>/ezmlm-store '<#D#>'
    |/path/to/bin/ezmlm-dmarc-filter.pl '<#D#>/dmarc' | <#B#>/ezmlm-send -r '<#D#>'
```

Detta förutsätter att du vidrör en fil med namnet dmarc i alla listkataloger där du vill aktivera filtret.  Du kan konfigurera `.ezmlmrc` för att göra detta genom att lägga till följande block i den filen:

```shell
	</-dmarc#FXT/>
	</dmarc#f/>
	</dmarc#t/>
	</dmarc#x/>
```
De enda listkonfigurationerna som körs i fel ordning för `DMARC` är de med `-f`, `-t` eller `-x` inställt. Ovanstående konfiguration kommer att justeras för detta.

Om du inte har hållit jämna steg med tiden, finns det en ny rörelse på gång för att introducera stark [DMARC](http://en.wikipedia.org/wiki/DMARC) policyer som avvisar meddelanden som underkänns [DKIM](http://en.wikipedia.org/wiki/DomainKeys_Identified_Mail).

$Datum$
