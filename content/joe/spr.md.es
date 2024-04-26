---
archived: ~
categories: TI, seguridad, rendimiento, fiabilidad
dependencies: '*.md.es'
keywords: infosec, appsec, rendimiento, escalabilidad, alta disponibilidad, fiabilidad
published: ~
status: borrador
title: Seguridad de la información, rendimiento de las aplicaciones y fiabilidad
---

{# lede #}La ingeniería de software "no funcional" gira en torno a tres cuestiones clave: seguridad, rendimiento y fiabilidad (**SPR**){# lede #}; mientras que la ingeniería de software "funcional" implica el ciclo de vida normal de desarrollo de software basado en funciones. Una adecuada [NIST 800-160v1r1](https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-160v1r1.pdf).

Algunas empresas han obtenido un valor increíble al dividir el desarrollo funcional de software no funcional en dos jerarquías independientes en la parte de ingeniería del organigrama. Puede encontrar arquitectos de **SPR** como yo para dirigir un equipo de este tipo de **SPR**, con una combinación flexible de roles subordinados en evolución:

1. **Ingeniería crítica del sistema** (centrada en la creación y supervisión de métricas de observabilidad, herramientas de rastreo dinámico y construcción de tiempo de ejecución compatible, y análisis de perfiles de espectro completo para el desarrollo de soluciones de rendimiento/seguridad de alto impacto),

2. **Ingeniería de carro** (se centra en el procesamiento de volcados de rastreo de pila tanto en el desarrollo como en la producción, y en obtener los problemas técnicos subyacentes informados al equipo de desarrollo adecuado para su resolución),

3. **Ingeniería de aseguramiento de calidad** (centrada en la creación de software de prueba específico de SPR e informes asociados),

4. **Ingeniería de calidad de datos** (centrada en ofrecer una infraestructura automatizada de generación de informes, procesamiento y visualización para la actividad de triaje y control de calidad).

Crear un equipo de **SPR** dedicado implica algunos desafíos organizativos. En el nivel de gestión, debe haber aceptación de que los expertos en rendimiento/seguridad de **SPR** tengan algunas expectativas razonables de que sus recomendaciones, y los parches de software enviados y probados con éxito, se incorporen de manera oportuna en la base de código de producción. Para generar las relaciones de trabajo efectivas necesarias entre los equipos de ingeniería funcionales y no funcionales, los ingenieros de rendimiento deben estar parcialmente integrados en los equipos de desarrollo de productos funcionales como pares, con privilegios de revisión/confirmación basados en pares en las bases de código.

Al contar con un equipo dedicado de **SPR**, la dirección puede liberar a los ingenieros de productos (realizando el desarrollo funcional) de tener que crear/gestionar/probar simulaciones de sus entornos de producción que sean adecuadas para el trabajo de rendimiento/escala/seguridad/durabilidad/fiabilidad. Muchos equipos simplemente no tienen los ciclos para gastar en esto, a pesar de la importancia de ajustar el tamaño de sus activos en la nube y los tiempos de ejecución de software dependientes para adaptarse a un rápido crecimiento.

También hay una especialización considerable en términos de herramientas de observación y técnicas de rastreo basadas en núcleo, que los buenos ingenieros de sistemas se someten a mantener en la cima de su campo. Es difícil contratar estas habilidades auxiliares cuando se busca talento de calidad para los ingenieros tradicionales de productos/pila completa y/o científicos de datos basados en la agilidad.

Un software sólido, seguro, escalable, rentable y de buen rendimiento está al alcance de cualquier equipo de ingeniería pequeño o mediano con las inversiones adecuadas en **SPR**. [Ponte en contacto](/contact).


<!-- $Date: 2024-04-08 17:03:24 +0000 (Mon, 08 Apr 2024) $ $Author: joe $ $Revision: 22019 $ -->
