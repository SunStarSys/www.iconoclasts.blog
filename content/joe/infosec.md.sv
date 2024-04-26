---
archived: ~
categories: Säkerhet, IT, Perl
dependencies: '*.md.sv'
keywords: infosec,zerotrust,taint,dynamisk,data
published: ~
status: arkiverad
title: Informationssäkerhet - introduktion
---

[TOC]

#### Vad är det primära målet för InfoSec?

*För att säkerställa att alla förändringar vid kontextgränser är väl reglerade.*

Till exempel uppfyller varje **systemanrop** på en UNIX-plattform detta villkor när det gäller UNIX-säkerhetsmodell för användare/gruppprocess+filesystem. Den litterala definitionen av en **kontextväxel**, vilket anges av **systemanrop**, inbegriper en kontroll av API-användningssäkerheten på kärnans sida av anropet.

När det gäller leverans av SaaS, {# lede #}alla data som kommer från ett exekverings-UNIX **systemanrop** ska behandlas som **behållna**{# lede #}

UNIX säkerhetsmodell ensam gjorde aldrig bestämmelser för nätverksansluten klient / server applikationsutveckling, eftersom historiskt BSD socket API som föregick ökningen av Network Computing på 90-talet (Sun Microsystems) uppfanns över ett decennium efter UNIX föddes (med sin OS-baserade multiuser säkerhetsmodell helt bildad vid födseln). [MIT Kerberos](https://web.mit.edu/kerberos/).

Schemalägga CPU:er på ett säkert sätt för att utföra arbete på kärnnivå för någon "auktoriserad användar-/grupp-/rollkontext" som inte är kopplad till den underliggande processens UNIX-användar-/gruppkontext har alltid legat utanför UNIX-modellen. Många infosec initiativ misslyckas med att erkänna detta regulatoriska ansvar tillhör program ensam; Låt inte din vara en!

Om det inte är klart vid denna tidpunkt, bör DevOps/SRE-team triaging SaaS security (**CAI**) incidenter på Linux bekanta sig med [htop](fun-with-htop)s `stjärt` gränssnitt via `ss` nyckel! Bättre att behärska `stjärt`

#### Hur relaterar detta till Zero-Trust-initiativ, som en praktisk fråga?

[Nolltillförlitlig arkitektur](https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-207.pdf).

Även om det kan finnas VPN/Firewall-kontexter i verkligheten är ingen av dessa detaljer relevanta för InfoSec inom ett Zero-Trust-ramverk. Med andra ord kan sådana nätverkstopologisäkerhetsinitiativ öka Zero-Trust-initiativ, men de förlitar sig aldrig på inom ett Zero-Trust-initiativ på basserverns värdsäkerhetsnivå upp genom applikationsnivån.

MIT Kerberos och Active Directory är till exempel kompatibla med Zero-Trust.

*$Datum: 2023-01-19 22:58:40 +0000 (Thu, 19 Jan 2023) $*
