---
archived: ~
categories: Orion, arquitectura, ZFS
dependencies: '*.md.es'
keywords: información,topología,hipermedia,resto,arquitectura,hateoas
published: ~
status: borrador
title: Arquitectura de la Información
---

<div class="right">

![Arquitectura de la Información](ia.page/ia.jpg).

</div>

[TOC]

## Introducción

Arquitectura de la información **organiza** y **organiza** {# lede #}toda la gama de tecnologías relevantes para el diseño, la presentación, las relaciones y las restricciones arquitectónicas que cubren cada URL que sirve{# lede #}

## Usabilidad, descubrimiento y topología de enlaces: la imagen general

## Contraste de Jerarquías con Búsqueda Etiquetada

### Investigación radical de la búsqueda wiki

#### Objetivos de interfaz humana

##### Sintaxis potente


##### Las búsquedas con etiquetas son específicas de palabras clave en lugar de búsquedas de palabras genéricas

##### Ampliación de ámbito sencilla

Motor de filtración de resultados interactivos #####

Consulte la sección sobre HATEOAS para obtener una descripción general.

##### Escala de rendimiento integrada a árboles de documentos de 100 K

##### Indicación/priorización de resultados comprensibles

##### Resultados contextualizados de seguridad por usuario (ACL).

##### se enlaza directamente a ubicaciones de documentos específicas de destino

##### Live, RealTime Resultados (también conocido como No hay corpus indexado desactualizado).

#### Objetivos de adopción del cliente

##### Entregable como "aplicación/json" tras solicitud

Opciones:

- pasar "as_json=1" en la cadena de consulta


El estilo de ##### es controlado semánticamente por la instalación del cliente `/content/css/boostrap.min.css`

##### `search.html` La instalación del cliente puede sustituir la plantilla `/templates/search.html`

##### `main.html` La instalación del cliente puede sustituir la plantilla derivada `/templates/main.html`

## REST, HATEOAS y Negociación de Contenido

## Hermosas URL &mdash;

## Contenido MultiMedia estructurado y preparado para el futuro

### GitHub Rebaja con sabor con $$\KaTeX$$

### encabezados de YAML para MetaData

#### Un lenguaje de programación completo Turing no es datos - no pertenece a sus fuentes de contenido

### El valor de habilitar el preprocesamiento de plantillas en el contenido

- Motores de procesamiento de datos en línea

  - incrustado, "seguro" literales json en archivos construidos


#### Configuración centralizada y de evolución lenta de los hechos de Wiki

- URL de servicio corporativo


### El papel de `ssi`

## Controles de acceso sobre contenido, desde una única perspectiva de verdad

- `walk_content_tree()` en `path.pm`
  - acls
  - dependencias
- `acl.yml`

## SunStar Orión de sistemas&trade;

1. clones zfs


## StageMaster: Experimentación con Pure Client-Side State Engine

## GitOps flujos de trabajo de creación

1. Frontend
2. Backend


<!-- $Date: 2024-03-11 03:02:57 +0000 (Mon, 11 Mar 2024) $ $Author: joe $ $Revision: 19680 $ -->
