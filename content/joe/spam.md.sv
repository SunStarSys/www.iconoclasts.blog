---
archived: ~
categories: Perl, Apache, IT, Mail, Verktyg
dependencies: '*.md.sv'
keywords: qpsmtpd,Apache::Qpsmtpd,earlytalker,anti-spam,sendmail,postfix,exim
published: ~
status: arkiverad
title: Om skräppostproblemet...
---

Som jag skrev om [på annat håll](/clients/apache), ett av de bästa verktygen för öppen källkod som finns tillgängliga för en e-postadministratörs arsenal av antispamverktyg är [qpsmtpd](http://en.wikipedia.org/wiki/Qpsmtpd).

{# lede #}Den enda bästa plugin för `qpsmtpd`, även om det är svårt att förstå varför{# lede #}

Varför är ett så enkelt verktyg så kraftfullt i admins arsenal?  Eftersom det introducerar obligatoriska förseningar för varje e-postanslutning, som det visar sig träffar de flesta spammare där de kan mäta det, när det gäller att binda upp sin e-postleverantör från att hantera resten av deras kö.  Det är viktigt att förstå att spammare driver företag, av vilka många inte har något direkt intresse av innehållet i vad de levererar. De får betalt för att hantera ett sofistikerat, och typiskt olagligt, (zombie) nätverk av sändande agenter, och kommer att tillhandahålla leveranstjänster för alla kunder med kontanter för att täcka dess användning plus vinster.  Många av dem gör årliga inkomster långt över min eller din :-).

Det finns mer sofistikerade tillvägagångssätt för att vara säker, som att bara fördröja meddelanden från "otrustade" avsändare, men du kan gå mycket längre än så om din server har den typen av kunskap tillgänglig för den.  Men när det gäller bang för pengarna, kör "earlytalker" med en betydande fördröjning på upp till 30 sekunder kommer att driva spammare från dina servrar för gott.  Löfte.

<!-- $Date$ $Author$ $Revision$ -->

@joe=
