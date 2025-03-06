---
archived: ~
categories: Salud, Matemáticas, Dinámica
dependencies: '*.md.es'
keywords: exponencial, poder, covid-19, epidemia, pandemia, SARS
published: ~
status: archivado
title: Crecimiento exponencial y COVID-19
---

Permítanme tratar de darles un análisis cualitativo de lo que el gráfico de una función exponencial (también conocido como poder) es geométricamente, y cómo se aplica a la epidemia de covid-19 que barre el planeta.  No es una lectura larga y compleja, así que {# lede #}tómese su tiempo con la sección **matemática** &mdash; Es importante ser un consumidor educado de estadísticas relevantes para la pandemia actual{# lede #}. Un fondo en el primer año [cálculo](https://en.wikipedia.org/wiki/Calculus).

### Las matemáticas

Al principio, los valores de la función exponencial son microscópicamente pequeños, y apenas aumentan con el tiempo (en el `eje x`

![Marzo de 2020 COVID-19](../images/covid-march-2020-e.png).

Para ilustrar esto por analogía: imagina lo rápido que irías ahora si la velocidad de tu coche estuviera siempre atada, por una constante de proporcionalidad, al kilometraje en su odómetro. Bajo esta hipótesis, por cada intervalo de tiempo fijo que pasa, tanto la velocidad de su automóvil como la distancia total recorrida *multiplica* por la misma cantidad fija (mayor que uno). De hecho, es [tortugas hasta el final](https://en.wikipedia.org/wiki/Turtles_all_the_way_down): la aceleración de su coche, sacudida, etc. (es decir, todo [derivados](https://en.wikipedia.org/wiki/Derivative).

En un [escala logarítmica](https://en.wikipedia.org/wiki/Logarithmic_scale) para el `eje Y`, los gráficos de dichas funciones de potencia aparecen como **líneas rectas**.  El par de gráficos a continuación tienen líneas de crecimiento paralelas (que añadí en negro a estas [worldómetros](https://www.worldometers.info/coronavirus/) fuentes), y reflejan los mismos totales *mundial* que el par anterior. Si representamos estas "líneas" en `log y = mx + b` forma, el `m`-valores (`pendientes`) estaría de acuerdo; sólo el `b`-valores (`log y-intercepts`) difieren.  El punto clave aquí es centrar la atención en la **invariante** `pendiente`, no los diversos `intercepta`, para cualquier conjunto de estadísticas de pandemia por edad, demográfica o por región geográfica, o combinaciones de las mismas.  Multiplicación `ln 10 = 2,302585...` con el `pendiente` Aquí se obtiene la constante de proporcionalidad fundamental que iguala los valores de las funciones exponenciales representadas con sus tasas de cambio *instantáneas*.  En otras palabras, centrarse en los porcentajes relativos entre diferentes estadísticas, como [condicional](https://en.wikipedia.org/wiki/Conditional_expectation) tasas de mortalidad, está *perdiendo el punto*: esa es una conversación sobre el `b`-valores, no el `m`

Para ser claros, la diferencia en `b`-valores es más acerca de las diferencias de tiempo en `eje x` que las diferencias en `y`-valores; en términos de ecuaciones: `log y = mx + b = m(x + b/m)` es una traducción implícita de la línea `y = mx`, `b` unidades a lo largo de `eje Y`o equivalente `b/m` unidades a lo largo de `eje x` (en la dirección opuesta).   **Cualquier** tipo de estadística relativa (como tasa de letalidad de caso) se puede capturar en términos de traducciones de tiempo, una vez `m` es conocido (y no es cero).  De nuevo, la estadística *crítica* es `m`

![Escala logarítmica de la COVID-19 de marzo de 2020](../images/covid-march-2020.png).

### La pandemia de COVID-19 en Estados Unidos

El `Duplicación del período de 5 días` del total de la población infectada en Nueva York esta semana, así como `Duplicación del período de 3 días`

![Escala logarítmica de EE. UU. de COVID-19 de marzo de 2020](../images/covid-us-march-2020.png).

![Escala logarítmica de muertes por COVID-19 en EE. UU. de marzo de 2020](../images/covid-us-march-2020-deaths.png).

Estas son las buenas noticias: las epidemias solo siguen funciones exponenciales para la parte inicial del brote. Finalmente, la tasa de cambio se aplanará y será negativa, lo que indica un nivel decreciente de la población total que actualmente está enferma.

La "mala noticia" es que [QUIÉN](https://www.who.int/emergencies/diseases/novel-coronavirus-2019).

### Fallo

No es vudú causar que una epidemia comience a alejarse de [crecimiento exponencial](https://en.wikipedia.org/wiki/Exponential_growth).

Lo que los epidemiólogos están tratando de lograr es iniciar ese proceso tan pronto como sea posible.  Cada día perdido significa una pérdida acelerada de vidas, un mayor impulso de casos graves y un mayor riesgo de abrumar totalmente el sistema de atención médica a medida que se levanta el gráfico.

Inevitablemente, el aplanamiento sucederá. Si no es debido a la sabiduría social humana, entonces es porque el virus no puede reinfectar a las víctimas pasadas <sup>2</sup>, y simplemente infecta a la mayoría de la población antes de petering y persistir para infectar a los recién nacidos, o simplemente desaparecer por completo.

#### Notas a pie de página (24 de septiembre de 2020).

1. Estoy siendo intencionalmente vago sobre el *intervalo de tiempo* real para la tasa de cambio, pero realmente no importa el valor verdadero de la declaración.  Diferentes intervalos de tiempo producen constantes de proporcionalidad diferentes, pero esas constantes solo dependen del tamaño del intervalo de tiempo, no de los instantáneos medidos del tiempo (en los puntos finales) en sí mismos.

2. El jurado todavía está en esto.  Dependiendo de qué cepas estén en estado salvaje, combinado con la gravedad de la enfermedad que contrae un paciente, la reinfección puede ser posible, al menos una parte del tiempo.

#### Postmortem

Este artículo fue escrito a finales de marzo de 2020, cuando se sabía poco sobre los orígenes de la COVID que no eran pura propaganda de los NIH y los CDC.

Avanzó rápidamente al segundo mandato de Trump, y ahora está claro que hubo una conspiración masiva y concertada en el mundo occidental para engañar al planeta: sobre el verdadero origen de la COVID y el papel del gobierno de Estados Unidos en la creación del virus asociado.

Es muy claro en este punto que [SARS2 era un germen artificial](https://jimhaslam.substack.com/); que la mayor parte de la comunidad médica académica sigue siendo cómplice en tergiversar ese hecho al público; y que el público está ahora listo para quemar toda la ciencia.&trade;

¿Cómo sabemos con certeza?

Brevemente, toda la casa de tarjetas que rodeaban a SARS2 como zoonosis fue colocada por una sola [papel de mala calidad](https://www.science.org/doi/full/10.1126/science.abp8337) con afirmaciones que simplemente no pueden ser apoyadas por el propio cuerpo de trabajo. Pero si no fuera por el [esfuerzos incansables de desacreditación](https://pubpeer.com/publications/3FB983CC74C0A93394568A373167CE#28).

Angus publicó recientemente un [arXiv preimpresión](https://arxiv.org/abs/2502.20076) que ponen el asunto en reposo. Puede encontrar un [Exposición maravillosa de la relevancia de su artículo por el Dr. Michael Weissman](https://michaelweissman.substack.com/p/explanation-of-and-comments-on-mccowans).

QED.

Esperemos que la rendición de cuentas interna llegue al FBI, CDC, NIH, DoD, DARPA, CIA y la NSF antes de que todo se vaporice en disgusto.

<!-- $Date: 2025-03-06 11:07:32 -0500 (Thu, 06 Mar 2025) $ $Author: joe $ $Revision: 25590 $ -->
