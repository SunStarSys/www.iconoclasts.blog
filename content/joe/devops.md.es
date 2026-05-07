---
categories: TI
dependencies: '*.md.es'
keywords: devol
status: archivado
title: El movimiento DevOps
---

[TOC]

## ¡Más que simplemente dar a los desarrolladores acceso root!

O ni siquiera eso. {# lede #}La gran idea detrás de la "movimiento" no es simplemente dar a los desarrolladores más cuerda{# lede #}; se trata de garantizar mejores líneas de comunicación entre los *desarrolladores* y los *operaciones* equipos de la empresa.  Gran parte de esto no es nuevo, de hecho se trata de un refrito del movimiento de la *kaizen *?   dentro de las cadenas de suministro industriales tradicionales (esp. automóviles) durante el siglo anterior.  Los tableros Kanban son solo el último refrito de tableros de ojos de pájaro (que se duplican como gestores de inventario de flujo de trabajo) que cubre el esfuerzo diario colectivo para enviar productos de calidad que deleitan tanto a los clientes como a los socios comerciales.

La gestión de restricciones es clave para el proceso.  Al identificar primero todos y cada uno de los cuellos de botella del sistema, puede reenfocar sus esfuerzos en la optimización de esos recursos para lograr el máximo efecto.  Las optimizaciones más allá de esas áreas casi siempre no valen la pena &mdash; el flujo de trabajo seguirá estando limitado por esos recursos.

## Desarrollo basado en canales

Fomentar los cambios incrementales con procesos automatizados de prueba, promoción y lanzamiento con una cadencia programada es una excelente manera de poner en marcha el proceso, pero una gran parte del control de calidad en los despliegues de SaaS/PaaS implica adoptar *[desarrollo basado en troncos](https://trunkbaseddevelopment.com)* y su rama por conceptos de abstracción.  (Por favor, visite el enlace para una discusión exhaustiva de las características y desventajas).

En esencia, el multiverso de largo plazo `git` Las ramas crean la ficción psicológica de que la fusión combinada de todo ese trabajo de desarrollo local (¡y prueba!) conducirá a un todo que es al menos tan grande como la suma de sus partes.  La experiencia es el mejor juez, lo que indica que se deben diseñar conjuntos de nuevas funciones extensas *incrementalmente*, *in-situ*, en el código fuente de la sucursal de producción / liberación existente.  Básicamente, usted diseña sus estrategias de desarrollo dentro de las limitaciones de la física del mundo biológico, que dice:

```text
        Surgery on a patient must result
		in good outcomes (at all times) for
        that patient, not just for siblings
		or future generations.
```

### pipelines de integración y despliegue continuos

Trunk Based Development es la base de todos los consecuentes pipelines de control de cambios automatizados que han crecido en las últimas dos décadas.

## Código es ley (desarrollo + infraestructura + configuración)

Un poco de perspectiva histórica primero; el punchline sigue estos cuatro párrafos.  El hilo común aquí es que Apache casi siempre ha estado por delante de su tiempo.

De vuelta en la pre-[CFEngine](https://cfengine.com) días, Apache Software Foundation mantuvo todos sus archivos de configuración de TI y scripts de soporte en CVS, y posteriormente Subversion.  Además, cada servicio que ejecutamos tenía un "libro de ejecución" para guiar a los administradores con sus tareas de mantenimiento prácticas.

El flujo de trabajo fue menos de lo ideal: además de crear nuestros propios árboles de puertos FreeBSD con parches locales en paquetes desplegables (binarios) desde cero, el personal tuvo que ejercer una *disciplina* difícil de aplicar al desplegar cambios en la producción, comprometiéndose primero al control de versiones, iniciar sesión en el servidor de destino, actualizar su finalización de compra y potencialmente reiniciar el servicio &mdash; Todo este trabajo repetitivo realizado a mano. En realidad, la mayoría de las veces los administradores de sistemas hackearon directamente en el servidor de destino y se comprometieron desde la finalización de la compra de ese servidor, arriesgando muchos conflictos de fusión en el camino a medida que el árbol se re-actualizaba (ya sea entonces, o en algún momento en el camino por acciones futuras ejecutadas por algún otro miembro del personal). Un flujo de trabajo bastante menos que transparente, con dudosa seguridad de gestión de contraseñas, para un equipo de operaciones colaborativo.

Hoy en día, lo mantienen todo en un `git`- árbol fuente de títeres respaldado, y aprovisionar/desplegar/configurar directamente en la nube utilizando paquetes genéricos de Ubuntu, que es un enfoque algo moderno para su trabajo de operaciones de TI, ya que está programado `git` Los tirones del maestro de marionetas eventualmente desplegarán actualizaciones a medida que los agentes de marionetas regresen.  Pero la integración y el despliegue continuos es un trabajo en curso, incluso hasta el día de hoy.

Por otro lado, una iniciativa temprana e innovadora similar a la CI en The ASF (para proyectos reales de TLP de software Apache) fue [Apache Gump](https://gump.apache.org/), que fue la creación de colegas brillantes como Sam Ruby y compañía.  Lo que hizo Gump fue comprobar periódicamente, construir y probar HEAD (incluyendo HEAD de todos los deps) del tronco de cada base de código en el repositorio de Subversion (pero se remonta a CVS) para cada proyecto que podría descubrir con éxito cómo construir (que era en general limitado a los proyectos de Java originalmente). Los informes se enviaron automáticamente a cada comunidad de desarrollo y se archivaron para la posteridad.  Esta perspicaz actividad de **automatización de tareas** continúa (con git) hasta el día de hoy.  **Cualquier comunidad de desarrollo de tamaño empresarial que no ejecute su propio servidor de Gump está 20y detrás del estado de la técnica en The ASF (IMO; no me inicies en las dependencias de módulos de software con respaldo de versión de código abierto en /trunk|master/ ...).**

Este es el punto en pocas palabras: todos sus orígenes (desarrollo, infraestructura y configuración) pertenecen al control de versiones (no necesariamente comparten el mismo repositorio) que puede revisar todo el personal de devops y forman parte de su juego completo de pipelines de automatización de pruebas entre revisiones de parches y despliegues de producción.  Una encuesta sobre el estado de la técnica, donde los cambios se prueban/aprovisionan/desplegan bajo demanda en la configuración de IaC/CaC, está en el sitio web de mi amigo y visionario Paul Hammant [aquí](https://paulhammant.com/2014/08/27/provisioning-deployment-and-app-config-cycles/). ¡Echa un vistazo!

## Virtualización frente a contenedorización

A [Mascotas vs. Ganado](http://cloudscaling.com/blog/cloud-computing/the-history-of-pets-vs-cattle/) Redux.

Los sistemas de contenedor como Docker son tecnologías de virtualización personalizables y que se pueden volver a desplegar que se suelen utilizar para soportar un marco de cluster de aplicación de arquitectura (MSA) MicroService como Kubernetes. Recogen donde los sistemas de virtualización lo dejaron, intercambiando soporte ilimitado de (totalmente) sistemas operativos por VM aislados para máquinas virtuales basadas en Linux-kernel que tienen una personalización e integración considerablemente más programables con el host de Linux principal en el que se ejecutan.  Además, se pueden volver a crear y *cargar* en un servicio de distribución central (como el artefacto) para su reutilización a gran escala en varias cadenas de dependencias y despliegues de servidores ejecutables raw.

### Escala vertical frente a horizontal

Los contenedores reconfigurables descargables desde un servidor central permiten posibilidades difíciles de realizar con la tecnología de virtualización básica: no está atado a los límites de hardware de ningún servidor para escalar sus servicios para satisfacer la demanda.  En otras palabras, la escala horizontal mediante el despliegue del mismo contenedor en recopilaciones de hosts, **a demanda**, es una característica de primera clase inmediatamente alcanzable de los marcos de MSA basados en Docker.  Al igual que el despliegue de docenas más de contenedores que núcleos de CPU en el *mismo* host.

## Medir, frenar y controlar los esfuerzos de lucha contra incendios, tanto reales como prácticos

Una de las otras cosas clave a reconocer es distinguir entre el trabajo *planificado* y *no planificado* en cualquiera de sus métricas de seguimiento de la productividad y cómo se asignan los recursos a esas tareas.  El trabajo no planificado equivale a **lucha contra incendios** y, si se dedica demasiado tiempo (más de ~20 %) a estas tareas, el trabajo planificado, que es la verdadera necesidad empresarial de la empresa, se atrasa.

Los cuellos de botella en el sistema rara vez pueden hacer frente al trabajo no planificado, por lo que es importante tener suficientes recursos adicionales para manejar el aumento de la carga y el consiguiente retraso.

Una de las principales lecciones de retroceso de la COVID-19 a principios de 2020, como capacidad hospitalaria en términos de TI, es que hay tal cosa como ser *demasiado eficiente*, al menos cuando se trata de personal de devops (el hardware es otra historia).  Planificación de contingencias para un día lluvioso, ya sea con "redundante" El personal o las iniciativas de capacitación cruzada, combinadas con ejercicios preparatorios regulares, no solo mantienen alejado al médico, sino que en realidad son **críticos para la misión**.

## Cómo llegar al programa

A nivel de gestión, una perspectiva global de gestión del cambio entre los desarrolladores y los cambios de operaciones es vital. Ambos equipos deben ser conscientes de los cambios del otro. Lo ideal es que los detalles de planificación estén disponibles en el camino.  **Pueden pasar grandes cosas** cuando los equipos son una combinación saludable de desarrolladores y personal de operaciones, en una cultura de trabajo colaborativo transparente basada en datos.

La filosofía de inclusión de múltiples partes interesadas en la creación, y la **evolución**, de un producto de trabajo tangible tiene implicaciones mucho más allá de los equipos *dev* y *ops* que comparten el control y la responsabilidad de un esfuerzo de ingeniería de servidores. Esta lección se repite en todo el mundo corporativo moderno, a medida que se forman nuevos dominios para la expresión humana creativa en el sector empresarial, así como en la reinvención de viejas formas de hacer negocios juntos.

<!-- $Date$ Autor: joe $ $ Revisión: 36743 $ -->
