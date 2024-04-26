---
archived: ~
categories: Salud, Matemáticas, Dinámica
dependencies: '*.md.es'
keywords: exponencial, poder, covid-19, epidemia, pandemia
published: ~
status: archivado
title: Crecimiento exponencial y COVID-19
---

Permítanme tratar de darles un análisis cualitativo de lo que es geométricamente el gráfico de una función exponencial (también conocido como potencia), y cómo se aplica a la epidemia de covid-19 que barre el planeta.  No es una lectura larga y compleja, así que {# lede #}tómese su tiempo con **la sección de matemáticas** &mdash; Es importante ser un consumidor educado de estadísticas relevantes para la pandemia actual{# lede #}. Un fondo en primer año [cálculo](https://en.wikipedia.org/wiki/Calculus).

### Las matemáticas

Al principio, los valores de la función exponencial son microscópicamente pequeños y apenas aumentan con el tiempo (en el `eje x`

![Marzo 2020 COVID-19](../images/covid-march-2020-e.png).

Para ilustrar esto por analogía: imagine lo rápido que iría ahora si la velocidad de su automóvil siempre estuviera atada, por una constante de proporcionalidad, al kilometraje en su odómetro. Bajo este hipotético, por cada intervalo fijo de tiempo que pasa, tanto la velocidad de su automóvil como la distancia total recorrida *multiplica* por la misma cantidad fija (más grande que uno). De hecho, es [tortugas hasta el final](https://en.wikipedia.org/wiki/Turtles_all_the_way_down): la aceleración de su coche, sacudida, etc. (es decir, todo [derivados](https://en.wikipedia.org/wiki/Derivative).

En [escala logarítmica](https://en.wikipedia.org/wiki/Logarithmic_scale) para el `eje Y`, los gráficos de dichas funciones de alimentación aparecen como **líneas rectas**.  El par de gráficos a continuación tienen líneas de crecimiento paralelas (que agregué en negro a estas [worldómetros](https://www.worldometers.info/coronavirus/) fuentes), y reflejan los mismos totales *mundial* que el par anterior. Si representamos estas "líneas" en `log y = mx + b` forma, el `m`-valores (`pendientes`) estaría de acuerdo; sólo `b`-valores (`log y-intercepts`) difieren.  El punto clave aquí es centrar la atención en la **invariante** `pendiente`, no la variada `interceptaciones`, para cualquier conjunto de estadísticas de pandemia por edad, demográficas o por región geográfica, o combinaciones de las mismas.  Multiplicando `ln 10 = 2,302585...` con el `pendiente` Aquí se produce la constante de proporcionalidad fundamental que equipara los valores de las funciones exponenciales representadas con sus tasas de cambio *instantáneas*.  En otras palabras, centrándose en los porcentajes relativos entre diferentes estadísticas, como [condicional](https://en.wikipedia.org/wiki/Conditional_expectation) tasas de mortalidad, es *falta el punto*: eso es una conversación sobre el `b`valores, no el `m`

Para ser claros, la diferencia en `b`-valores es más acerca de las diferencias de tiempo en `eje x` que las diferencias en `y`-valores; en términos de ecuaciones: `log y = mx + b = m(x + b/m)` es una traducción implícita de la línea `y = mx`, `b` unidades en el `eje Y`o equivalente `b/m` unidades en el `eje x` (en la dirección opuesta).   **Cualquier** tipo de estadística relativa (como Ratio de Fallecimiento de Caso) se puede capturar en términos de traducciones de tiempo, una vez `m` Se conoce (y no es cero).  De nuevo, la estadística *crítica* es `m`

![Escala logarítmica de COVID-19 de marzo de 2020](../images/covid-march-2020.png).

### La pandemia de COVID-19 en los Estados Unidos

El `duplicación del período de 5 días` del total de la población infectada en Nueva York esta semana, así como el `Duplicación del período de 3 días`


![Escala logarítmica estadounidense de COVID-19 de marzo de 2020](../images/covid-us-march-2020.png).

![Marzo 2020 COVID-19 EE.UU. Muertes escala logarítmica](../images/covid-us-march-2020-deaths.png).

Estas son las "buenas noticias": las epidemias solo siguen funciones exponenciales para la parte inicial del brote. Eventualmente, la tasa de cambio se aplanará y será negativa, lo que indica un nivel decreciente de la población total que está actualmente enferma.

La mala noticia es que el [OMS](https://www.who.int/emergencies/diseases/novel-coronavirus-2019).

### Caída

No es vudú hacer que una epidemia comience a alejarse de [crecimiento exponencial](https://en.wikipedia.org/wiki/Exponential_growth).

Lo que los epidemiólogos están tratando de lograr es iniciar ese proceso lo antes posible.  Cada día perdido significa una pérdida de vida acelerada, un mayor impulso de casos graves y un mayor riesgo de abrumar totalmente el sistema de atención médica a medida que el gráfico cresta.

Inevitablemente, el aplanamiento ocurrirá. Si no es por la sabiduría social humana, entonces es porque el virus no puede reinfectar a las víctimas pasadas <sup>2</sup>, y simplemente infecta a la mayoría de la población antes de salir y persistir para infectar a los recién nacidos, o simplemente desaparecer por completo.

#### Notas al pie (24 de septiembre de 2020).

1. Estoy siendo intencionalmente vago sobre el intervalo de tiempo real para la tasa de cambio, pero realmente no importa el valor de verdad de la declaración.  Diferentes intervalos de tiempo producen diferentes constantes de proporcionalidad, pero esas constantes solo dependen del tamaño del intervalo de tiempo, no del instante medido del tiempo (en los puntos finales) ellos mismos.

2. El jurado todavía está fuera de esto.  Dependiendo de las cepas que se encuentren en estado salvaje, combinadas con la gravedad de la enfermedad que contrae un paciente, la reinfección puede ser posible, al menos algunas veces.

<!-- $Date: 2023-01-30 20:55:15 +0000 (Mon, 30 Jan 2023) $ $Author: joe $ $Revision: 12627 $ -->
