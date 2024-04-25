---
archived: ~
categories: Orion, Arkitektur, ZFS
dependencies: '*.md.sv'
keywords: information,topologi,hypermedia,rest,arkitektur,hateoas
published: ~
status: skiss
title: Informationsarkitektur
---

<div class="right">

![Informationsarkitektur](ia.page/ia.jpg).

</div>

[TOC]

## Introduktion

Informationsarkitektur **organiserar** och **anordningar** {# lede #}hela skalan av teknik som är relevant för design, presentation, relationer och arkitektoniska begränsningar som täcker varje URL du tjänar{# lede #}

## Användbarhet, upptäckt och länktopologi: den stora bilden

## Kontrasterande arvtagare med taggad sökning

### Radikalt omstrukturera Wikisökning

### Mänskliga gränssnittsmål

#### Kraftfull syntax


#### Hashtaggade sökningar är nyckelordsspecifika i stället för generiska ordsökningar

#### Enkel expansion

#### Motor för filtrering av interaktiva resultat

Se avsnittet HATEOAS för en översikt.

#### Inbyggd prestandaskalning till dokumentträd på 100 kbyte

#### Omfattbar resultatordning/prioritering

##### Kontextuella resultat för säkerhet per användare (ACL).

#### träffar som länkats direkt till målspecifika dokumentplatser

#### Live, RealTime Results (aka No Stale Indexed Corpus).

### Kundinförandemål

##### Leverabel som "application/json" på begäran

Alternativ:

- skicka "as_json=1" i frågesträngen
- ställ in "Accept: application/json" i begärandehuvuden

#### Styling kontrolleras semantiskt av kundinstallationen av filen `/content/css/boostrap.min.css`

#### `search.html` Mallen kan åsidosättas av kundinstallationen av filen `/templates/search.html`

Den härledda mallen #### `main.html` kan åsidosättas av kundinstallationen av filen `/templates/main.html`

## REST, HATEOAS och innehållsförhandling

## Vackra webbadresser &mdash;

## Strukturerat, framtidssäkrat MultiMedia-innehåll

### GitHub Smaksatt nedsättning med $$\KaTeX$$

### YAML-huvuden för MetaData

### Ett Turing Complete Programming Language Ain't Data - det hör inte till dina innehållskällor

### Värdet för aktivering av mallförbearbetning för innehåll

- Infogade databearbetningsmotorer

  - inbäddade, "säkra" json-litteraler i inbyggda filer
  - skapande av nedsättningstabell för byggtid

#### Långsamt utvecklande, centraliserad konfiguration av Wikifakta

- URL:er för företagstjänst
- platser och versionsnummer för programvaruartefakter

### Rollen för `ssi` Taggar i din MultiMedia-strategi

## Åtkomstkontroller för innehåll, från ett enda sanningskälleperspektiv

- `walk_content_tree()` i `path.pm`
  - akl
  - beroenden
- `acl.yml`

## SunStar Systems' Orion&trade;

1. zfs-kloner
2. zfs skicka/registrera

## StageMaster: Experiment med ren motor på klientsidan

## GitOps skapa arbetsflöden

1. Frontend
2. Serverdel
3. Dokumentation

<!-- $Date$ $Author$ $Revision$ -->
