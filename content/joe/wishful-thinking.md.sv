---
categories: Apache, säkerhet
dependencies: '*.md.sv'
keywords: confluence,jira,atlassian,säkerhet
status: verifierad=46122
title: Atlassian anses vara skadlig
---

<div class="right">

![Tarred och Presenterade](wishful-thinking.page/confluence)

</div>

Det finns två perspektiv på saker som denna sida av [senaste 10 åren av avslöjade sårbarheter i Atlassian programvara](https://atlassian.com/trust/security/advisories):

1. att det visar på ett ansvarsfullt öppet offentliggörande och är ett bra marknadsföringsmaterial för försäljning,

2. {# lede #}Det är en lång historia av abject arkitektoniska fel i stor skala{# lede #}.

Jag är i det senare lägret.[^1]

-----

## Fotnoter

[^1]. I sista meningen i vårt lags berömda postmortem 2010

https://infra.apache.org/blog/apache_org_04_09_2010 [^2]

Vi säger (parafraserade)

Vi hoppas att andra kommer att lära av våra misstag.

I efterhand var vårt hopp helt klart felplacerat:

https://cybersecuritynews.com/atlassians-model-context-protocol/

Men, [Orion](https://sunstarsys.com/orion)'s förfader, Apache CMS, föddes sex månader efter att postmortem publicerades.  I så fall informerade dessa lektioner designen från smärtan av levande erfarenhet.

[^2]. Blogginlägget till Atlassians inept postmortem om denna incident har redigerats från internet. I grund och botten misslyckades de bara med att behålla 301 efter några år, så här slutade det:

https://www.atlassian.com/blog/news/2010/04/oh_man_what_a_day_an_update_on_our_security_breach

Så mycket för permalänkprioriteringar för megacorporations som ser säkerhetsincidenter som PR-höjningsmöjligheter.

För posten är SHA-\* en *hashningsalgoritm*, inte en *krypteringsalgoritm*, än mindre en **kryptografiskt säker hashningsalgoritm** (som att säga `bcrypt` eller `crypt-md5`). Du vill inte bli tillsagd av din leverantör av SaaS att dina lösenord är *krypterade* eftersom en hackare kan få dekrypteringsnyckeln och läsa dem i klartext.

Du vill verkligen inte att de ska försäkra dig om att de är säkra när hackaren har SHA-\ *hashes av dem, eftersom SHA-\* är utformad för att vara tillräckligt högpresterande för att utsätta dina lösenord för en beräkningskanalerbar brute force sökning / gissningsalgoritm mot hash själv. Du vill att din leverantör ska tala om för dig att dina lösenord har hashats via `bcrypt` med minst 5 rundor i sin konfiguration - utformad för att besegra brute force gissning och uppdaterbar till hårdvaruspecifikationerna i tiderna.

Och ändå bör de rekommendera dig att ändra dem, eftersom det är det ansvariga att göra.

Det är absurt att läsa Mike Cannon-Brooke's drivel som skickas till kunder om säkerheten hos deras SHA-\ *hash av kundlösenord stulna av hackarna om du kan bry dig om att förstå kulspetspengarna i Apache postmortem om lösenordssäkerhet.

Dessutom, varje dag deras Incident Response Team sov över helgen, en annan F / OSS org blev hackad av den SliceHost rutan. Vi meddelade deras team på fredagen om våra resultat efter kontorstid i Sydney, och istället för att berätta för sina kunder läser de säkerhets-e-post off-timmar och blev därför inte hackad på söndag PST-tid, de fnissade och sa att de upptäckte hacket själva &mdash; Fångad helt ovetande.

RedHat, CodeHaus och JBoss var tre av de tillfälliga offren hackade medan Atlassian IR-teamet sov, men det fanns flera andra.

<!-- $Date$ $Author$ $Revision$ -->
