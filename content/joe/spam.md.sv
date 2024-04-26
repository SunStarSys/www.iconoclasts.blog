---
archived: ~
categories: Perl, Apache, IT, Mail, Verktyg
dependencies: '*.md.sv'
keywords: qpsmtpd,Apache::Qpsmtpd,earlytalker,anti-spam,sendmail,postfix,exim
published: ~
status: arkiverad
title: Om skräppostproblemet...
---

Som jag skrev om [någon annanstans](/clients/apache), ett av de bästa verktygen för öppen källkod som finns tillgängliga för en e-postadministratörs arsenal av skräppostverktyg är [qpsmtpd](http://en.wikipedia.org/wiki/Qpsmtpd), som bara är en server för inkommande e-post på klientsidan som behöver en fullt fungerande e-postserver som `qmail`, `skicka e-post`, `brädd`, eller `postfix` för utgående leverans.  Vad `qpsmtpd` är väldigt likt det som `httpd` gjorde för webbservrar: det introducerar anpassningsbara krokar i varje fas av `SMTP`

{# lede #}Bästa plugin för `qpsmtpd`Även om det är svårt att förstå varför{# lede #}, är `fetknopp` plugin.  Vad `fetknopp` sätts `qpsmtpd` att sova under en konfigurerbar tid, lyssna på uttaget (via `välj(2)`) för icke-RFC-kompatibel "tidig" kommunikation som kommer från den andra änden av uttaget (`qpsmtpd` Gafflar vanligtvis en server för varje inkommande anslutning så det är bara den barnprocessen som sover i `välj(2)`

Varför är ett så enkelt verktyg så kraftfullt i admins arsenal?  Eftersom det introducerar obligatoriska förseningar för varje e-postanslutning, som det visar sig träffar de flesta spammare där de kan mäta det, när det gäller att binda upp sin e-postleverantör från att hantera resten av deras kö.  Det är viktigt att förstå att spammare driver företag, av vilka många inte har något direkt intresse av innehållet i vad de levererar. De får betalt för att hantera ett sofistikerat, och typiskt olagligt, (zombie) nätverk av sändande agenter, och kommer att tillhandahålla leveranstjänster för alla kunder med kontanter för att täcka dess användning plus vinster.  Många av dem gör årliga inkomster långt över min eller din :-).

Det finns mer sofistikerade tillvägagångssätt för att vara säker, som att bara fördröja meddelanden från "otrustade" avsändare, men du kan gå mycket längre än så om din server har den typen av kunskap tillgänglig för den.  Men när det gäller bang för buck, kör `fetknopp`

<!-- $Date$ $Author$ $Revision$ -->

@joe=
