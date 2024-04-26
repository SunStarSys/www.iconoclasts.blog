---
archived: ~
categories: TI
dependencies: '*.md.es'
keywords: devops
published: ~
status: archivado
title: Movimiento DevOps
---

[TOC]

## ¡Más que simplemente dar acceso root a los desarrolladores!

O ni siquiera eso. {# lede #}La gran idea detrás del "movimiento" no es simplemente dar a los desarrolladores más cuerda{# lede #}

La gestión de restricciones es clave para el proceso.  Al identificar primero todos y cada uno de los cuellos de botella del sistema, puede volver a centrar sus esfuerzos en optimizar esos recursos para que funcionen al máximo.  Las optimizaciones más allá de esas áreas casi siempre no valen la pena &mdash;

## Desarrollo basado en troncos

Fomentar los cambios incrementales con procesos automatizados de prueba, promoción y lanzamiento en una cadencia programada es una excelente manera de hacer que la pelota ruede, pero una gran parte del control de calidad en los despliegues de SaaS/PaaS implica la adopción *[desarrollo basado en troncos](https://trunkbaseddevelopment.com).

En esencia, el multiverso de largo plazo `git`

```text
        Surgery on a patient must result
		in good outcomes (at all times) for
        that patient, not just for siblings
		or future generations.
```

### Pipelines de integración y despliegue continuos

El desarrollo basado en troncos es la base de todos los pipelines de control de cambios automatizados que han crecido en las últimas dos décadas.

## El código es ley (desarrollo + infraestructura + configuración).

Un poco de perspectiva histórica primero; el punchline sigue estos cuatro párrafos.  El hilo común aquí es que Apache casi siempre ha estado por delante de su tiempo.

De vuelta en el pre-[CFEngine](https://cfengine.com).

El flujo de trabajo era menos que ideal: además de crear nuestros propios árboles de puertos FreeBSD con parches locales en paquetes desplegables (binarios) desde cero, el personal tuvo que ejercer una *disciplina* difícil de aplicar al desplegar cambios en la producción, al comprometerse primero con el control de versiones, conectarse al servidor de destino, actualizar su finalización de compra y, potencialmente, reiniciar el servicio. &mdash;

Hoy en día, mantienen todo en un `git`- árbol de origen de títeres respaldado, y aprovisionar/desplegar/configurar directamente en la nube utilizando paquetes genéricos de Ubuntu, que es un enfoque algo moderno de su trabajo de operaciones de TI, ya que está programado `git`

Por otro lado, una iniciativa pionera de CI en The ASF (para proyectos reales de TLP de software Apache) fue [Gump de Apache](https://gump.apache.org/).

Este es *el punto en pocas palabras*: todos sus orígenes (desarrollo, infraestructura y configuración) pertenecen al control de versiones (no necesariamente compartiendo el mismo repositorio) que puede revisar todo el personal de devops, y forma parte de su conjunto completo de pipelines de automatización de pruebas entre revisiones de parches y despliegues de producción.  Un estudio del estado del arte, donde los cambios son probados / aprovisionados / desplegados bajo demanda en los ajustes de IaC/CaC, está en el sitio web de mi amigo y visionario Paul Hammant [aquí](https://paulhammant.com/2014/08/27/provisioning-deployment-and-app-config-cycles/).

## Virtualización frente a contenedorización: a [Mascotas vs. ganado](http://cloudscaling.com/blog/cloud-computing/the-history-of-pets-vs-cattle/).

Los sistemas de contenedor como Docker son tecnologías de virtualización personalizables y desplegables que se suelen utilizar para soportar un marco de cluster de aplicación de arquitectura (MSA) MicroService como Kubernetes. Recoge dónde se quedaron los sistemas de virtualización, intercambiando soporte ilimitado de sistemas operativos por máquina virtual (totalmente) aislados para máquinas virtuales basadas en el núcleo Linux que tienen una personalización e integración considerablemente más programables con el host Linux principal en el que se ejecutan.  Además, se pueden reconstruir y *cargar* en un servicio de distribución central (como un artefacto) para su reutilización a gran escala en varias cadenas de dependencias y despliegues de servidores ejecutables raw.

### Escala vertical frente a horizontal

Los contenedores reconfigurables descargables desde un servidor central permiten posibilidades difíciles de realizar con la tecnología básica de virtualización: no está bloqueado en los límites de hardware de ningún servidor para escalar sus servicios para satisfacer la demanda.  En otras palabras, el escalado horizontal mediante el despliegue del mismo contenedor en recopilaciones de hosts, **bajo demanda**, es una función de primera clase alcanzable de inmediato de los marcos de MSA basados en Docker.  Al igual que el despliegue de docenas de contenedores más que núcleos de CPU en el *mismo* host.

## Medir, frenar y controlar los esfuerzos de extinción de incendios, tanto reales como prácticos

Una de las otras cosas clave a reconocer es distinguir entre el trabajo *planificado* y *no planificado* en cualquiera de sus métricas de seguimiento de productividad y cómo se asignan los recursos a esas tareas.  El trabajo no planificado equivale a **lucha contra incendios**, y si se gasta demasiado tiempo (más de ~20%) en estas tareas, el trabajo planificado, que es la verdadera necesidad de negocio para la empresa, se retrasa.

Los cuellos de botella en el sistema rara vez pueden hacer frente al trabajo no planificado, por lo que es importante tener suficientes recursos adicionales para manejar el aumento de la carga y la consiguiente acumulación.

Una de las principales lecciones de retroceso de la COVID-19 a principios de 2020, como capacidad hospitalaria en términos de TI, es que hay algo como ser *demasiado delgado*, al menos cuando se trata de personal devops (el hardware es otra historia).  La planificación de contingencias para un día lluvioso, ya sea con personal "redundante" o iniciativas de capacitación cruzada, combinadas con ejercicios preparatorios regulares, no solo mantiene al médico alejado, sino que en realidad es **misión crítica**.

## Cómo llegar al programa

En el nivel de gestión, una perspectiva de gestión del cambio global entre los desarrolladores y los cambios de operaciones es vital. Ambos equipos deben ser conscientes de los cambios de los demás. Idealmente, con detalles de planificación disponibles en el camino.  **Pueden suceder grandes cosas** cuando los equipos son una combinación saludable de desarrolladores y personal de operaciones, en una cultura de trabajo colaborativo basada en datos y transparente.

La filosofía de la inclusión de múltiples partes interesadas en la creación, y **evolución**, de un producto de trabajo tangible tiene implicaciones mucho más allá de los equipos de *dev* y *ops* que comparten el control y la responsabilidad de un esfuerzo de ingeniería de servidores. Esta lección se repite en todo el mundo corporativo moderno, a medida que nuevos dominios para la expresión humana creativa toman forma en el sector empresarial, así como en la reinvención de viejas formas de hacer negocios juntos.


<!-- $Date$ $Author$ $Revision$ -->
