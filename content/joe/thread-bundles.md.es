---
archived: ~
categories: ~
dependencies: '*.md.es'
keywords: POSIX, pthread, C, mutex
published: ~
status: verificado=26807
title: Paquetes de subprocesos
---

[TOC]#sidebar

<div class="right">

![Paquete de subprocesos generado por IA](thread-bundles.page/thread-bundle)

</div>

## {# lede #} Threads POSIX {# lede #}

Este año tuve la tarea de portar nuestra función de máxima probabilidad de una sola versión roscada a una multithread, basada en la premisa arquitectónica de que la parte más lenta de ese código es donde la lógica de optimización real gira sobre un índice de ID de grupo de modelado, que por diseño, cada iteración a través del bucle debe ser independiente del resto.

Problema divertido cuando el bucle

1. no reinicializa las variables automáticas dependientes,
2. modifica varios punteros globales indexados por ID de grupo de modelado (`jG`),
3. necesita urgentemente variables thread_local para separar segmentos de memoria global dedicados al cálculo (sobre una base por ID).

1 y 3 fueron sencillos. Con 2 descubrí un algoritmo inteligente que involucraba el concepto de `THREAD_BUNDLE`, que es un bloque por subproceso de ID de grupo de modelado en serie.

Al garantizar `THREAD_BUNDLE` Es al menos tan grande como un tamaño de página de memoria dividido por el tamaño de los punteros individuales en 2, podemos asegurarnos de que diferentes subprocesos operen de forma independiente. [`páginas`](https://en.wikipedia.org/wiki/Page_%28computer_memory%29) En la memoria virtual, por lo que podemos evitar los bloqueos de mutex en esas escrituras de memoria. (Asumiendo que los hilos procesan sus `THREAD_BUNDLE` aproximadamente a la misma velocidad).

Además, finalmente eliminé la dependencia de la "misma velocidad" dividiendo el bucle en pares / pares impares, lo que garantiza al menos una memoria. `página` separa el activo `THREAD_BUNDLE` bucles.

## Bucles principales

```clike
  /* EVEN */
  for (jG = minG; jG <= numG; jG += 2*THREAD_BUNDLE)
  {
    pthread_t ptid; 3 refs
    arg_t* arg = mal (sizeof(*arg), "arg_t"); 12 refs

#define SET_ARG(foo) arg->foo = (foo) 30 refs

SET_ARG(jG);
    ...

#undef SET_ARG

// rsim_mlf_thread loops over the index bundle
	// from jG to MIN(numG, jG + THREAD_BUNDLE - minG), doing
	// stuff with global data structures also indexed by jG

pthread_create (&ptid, NULL, rsim_mlf_thread, arg);
    PUSH_STACK_ELT(thread_stack, ptid, pthread_t);
  }

{
    pthread_t * ptid; 3 refs
    while (POP_STACK_PTR(thread_stack, ptid, pthread_t) != NULL)
    {
      arg_t* arg; 6 refs
      pthread_join(*ptid, (void**)&arg);
      ...
  }

/* ODD */
  for (jG = THREAD_BUNDLE + minG; jG <= numG; jG += 2*THREAD_BUNDLE)
  {
    pthread_t ptid; 3 refs
    arg_t* arg = mal (sizeof(*arg), "arg_t"); 12 refs
    ...
```

<!-- $Date$ $Author$ $Revision$ -->
