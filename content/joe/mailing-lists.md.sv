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

Min erfarenhet av e-postlista programvara kretsar kring [qmail](http://cr.yp.to/qmail.html) och [ezmlm-idx](http://untroubled.org/ezmlm/). Med några få små skript kunde jag stödja en mängd nya användningsfall som inte stöds av `ezmlm-idx` själv.  Funktioner som är allmänt användbara utanför [Från Apache Software Foundation](http://www.apache.org) läggs ut nedanför.  Så här använder du dessa filer [layout](ezmlm/).

### BATV och SRS

[lagerplats/avsändare-demonger](ezmlm/bin/sender-demunger.pl) är ett litet wrapper-skript som möjliggör `BATV` och `SBS` `AVSÄNDARE` avsugning för `ezmlm-idx`. Om du vill använda den lägger du bara till den som ett prefix på alla rader i `</editor />` och `</manager />` block inom `.ezmlmrc` och springa `ezmlm-tillverkning -+` på dina listor, eller i en nypa förutsatt att du inte kommer att köra `ezmlm-make` igen i dina listor, redigera `redaktör` och `bas`

[BATV](http://en.wikipedia.org/wiki/Bounce_Address_Tag_Validation) och [SBS](http://en.wikipedia.org/wiki/Sender_Rewriting_Scheme) skapar unika problem för `ezmlm-idx` eftersom det, till skillnad från andra e-postprogram, fungerar på `E-POST FRÅN` del av `SMTP`

Båda specifikationerna kretsar kring att tillhandahålla tillfälliga adresser till `E-POST FRÅN` kuvertdelen, som bäddar in den ursprungliga adressen på ett enkelt dechiffrerbart sätt.  Men {# lede #}dessa tillfälliga adresser är anathema för `ezmlm-idx`'s abonnemang och modereringssystem{# lede #}och `avsändare-demunger.pl`

<div class="alert alert-info">
   <div class="alert-header">NOTERA</div>
   <div class="alert-body">
Enligt versionsinformationen, sedan version 7.0.0, bör ezmlm-idx ha stöd för BATV och SRS inbyggda. I vilket fall som helst kommer avsändare-demunger verkligen inte att skada bara i fall :-).
   </div>
</div>

### MARC

Se [bin/ezmlm-dmarc-filter.pl](ezmlm/bin/ezmlm-dmarc-filter.pl) och [bin/ezmlm-serkable-stdin.pl](ezmlm/bin/ezmlm-seekable-stdin.pl) och [lib/pull_header.pm](ezmlm/lib/pull_header.pm). Om du vill använda dessa skript ändrar du raderna i `</editor />` sektion för `.ezmlmrc` Det där samtalet `ezmlm-gate`, `ezmlm-butik`, eller `skicka ezmlm`

```shell
    |/path/to/bin/ezmlm-dmarc-filter.pl '<#D#>/dmarc' | /path/to/bin/ezmlm-seekable-stdin.pl /path/to/bin/sender-demunger.pl <#B#>/ezmlm-gate -rY '<#D#>' '<#D#>' '<#D#>/digest' '<#D#>/allow' '<#D#>/mod'
    |/path/to/bin/ezmlm-dmarc-filter.pl '<#D#>/dmarc' | /path/to/bin/sender-demunger.pl <#B#>/ezmlm-store '<#D#>'
    |/path/to/bin/ezmlm-dmarc-filter.pl '<#D#>/dmarc' | <#B#>/ezmlm-send -r '<#D#>'
```

Detta förutsätter att du kommer att beröra en fil med namnet `dmarc` i alla listkataloger där du vill aktivera filtret.  Du kan konfigurera `.ezmlmrc`

```shell
	</-dmarc#FXT/>
	</dmarc#f/>
	</dmarc#t/>
	</dmarc#x/>
```
De enda listkonfigurationerna som körs fel i `DMARC` är de med `-f`, `-t` eller `-x`

Om du inte har hållit jämna steg med tiden, finns det en ny rörelse på gång för att introducera starka [DMARC](http://en.wikipedia.org/wiki/DMARC) policyer som avslår meddelanden som inte kan utföras [DKIM](http://en.wikipedia.org/wiki/DomainKeys_Identified_Mail) Underskriftstest. Facebook, Twitter, LinkedIn, Yahoo! och nu har AOL lett denna avgift till nytt territorium, vilket tvingar postlistoperatörer att hantera situationen. Vad `ezmlm-dmarc-filter.pl` gör, och detta är inte den enda möjliga lösningen på problemet, är att släppa `DKIM-signatur` rubrik för en sådan domän och lägg till en `. OGILTIG` suffix till avsändarens `Från` huvudadress  Det har fördelen av att vara en av de enklaste lösningarna som fungerar, så jag erbjuder det här.  Domäner som använder strikt `DMARC` Alla policyer är lämpliga `Svar till` rubriker, så dessa ändringar gjorda av `ezmlm-dmarc-filter.pl`

$Date$
