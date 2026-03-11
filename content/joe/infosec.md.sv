---
archived: ~
categories: Säkerhet, IT, Perl
dependencies: '*.md.sv'
keywords: infosec,zerotrust,taint,dynamisk, data
published: ~
status: arkiverad
title: Informationssäkerhet, primer
---

[TOC]

#### Vad är det primära målet med InfoSec?

*För att säkerställa att alla förändringar vid kontextgränser är välreglerade.*

Till exempel uppfyller varje **systemanrop** på en UNIX-plattform detta villkor när det gäller säkerhetsmodellen för UNIX-användare/gruppprocess+filsystem. Den litterala definitionen av en **kontextväxel**, som anges av **systemanrop**, innefattar sanitetskontroll av API-användning på kärnans sida av anropet.

När det gäller SaaS leverans, {# lede #}alla data som kommer från ett UNIX **systemanrop** vid exekvering ska behandlas som **tainted**{# lede #} och valideras vid ingående punkter i applikationens tillgängliga processminne. Dessa ingående punkter bör beaktas **inom kontextgränser** för sådana applikationsdata. Lämplig lagstadgad validering bör vitlista strängmönster (via **regex** vanligtvis); **tainted**-data som rensar godkännandelistan och dess beroende data kan skickas säkert utgående från applikationens processminne via ett annat **systemanrop**. Dessa **systemanrop** utgående punkter är också **infosekskontextgränser**; vad som utgör säkra godkännandelistmönster för ingående trafik **tainted**-data informeras av dessa specifika API:er för utgående trafik. Över SSDLC kommer dessa utgående punkter att utvecklas, liksom motsvarande vitlistor.

UNIX säkerhetsmodell ensam aldrig gjort bestämmelser för nätverks klient / server applikationsutveckling, eftersom historiskt BSD socket API som föregick uppkomsten av Network Computing i 90s (Sun Microsystems) uppfanns över ett decennium efter UNIX föddes (med sin OS-baserade multiuser säkerhetsmodell fullt formad vid födseln). <!-- ####### --Hotell i Kerberos](https://web.mit.edu/kerberos/) var ett steg i rätt riktning, men lämnar mycket att önska i ett SaaS sammanhang.

Säker schemaläggning av CPU:er för att utföra arbete på kärnnivå för vissa "auktoriserade användare/grupp/rollkontext" som inte är kopplade till den underliggande processens UNIX-användar-/gruppkontext har alltid legat utanför UNIX-modellen. Många infosec initiativ misslyckas med att erkänna detta regleringsansvar tillhör applikationer ensam; låt inte din vara en!

Om det inte är klart vid denna tidpunkt, DevOps / SRE-team triaging SaaS säkerhetsincidenter (**CAI**) på Linux bör bekanta sig med [överst](fun-with-htop)'s [stänga` Gränssnitt via `s` nyckel! Bättre att behärska `stänga` som fristående. (För kännedom: Jag har statiska kompileringar av dessa binärer på github som kan levereras till K8s containrar eller noder, inklusive via SSH / SSM-leverans, på <https://github.com/joesuf4/home/tree/wsl/bin>).

#### Hur är det praktiskt när det gäller initiativ med nolltillit?

`Zero-Trust Arkitektur](https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-207.pdf) har inga nätverksspecifika infosekkontextgränser.

Även om det kan finnas VPN / Firewall-kontexter i verkligheten är ingen av dessa detaljer relevanta för InfoSec inom ett Zero-Trust-ramverk. Med andra ord kan sådana nätverkstopologisäkerhetsinitiativ öka Zero-Trust-initiativ, men de förlitar sig aldrig på ett Zero-Trust-initiativ på basserverns säkerhetsnivå upp genom applikationsnivån.

MIT Kerberos och Active Directory är till exempel Zero-Trust-kompatibla.

<!-- $Date$ $Author$ $Revision$ -->