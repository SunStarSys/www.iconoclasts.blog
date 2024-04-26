---
archived: ~
categories: Herramientas
dependencies: '*.md.es'
keywords: ~
published: ~
status: archivado
title: Diversión con htop
---

<div style="float:right" class="col-lg-5">
	<div class="embed-responsive embed-responsive-16by9">
	 	<iframe class="embed-responsive-item" style="margin-bottom:20px;max-width:560;max-height:315" src="https://www.youtube.com/embed/iEUZJ44mldI" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	</div>
</div>


## {# lede #}Funciones avanzadas de htop en plataformas populares de Unix{# lede #}


- Deltas de `superior`

	- comportamientos interactivos sofisticados
	- esquemas de color temáticos **semánticos**



- Características

	- personalizar la pantalla `C`
	- búsqueda `/` o filtrar `\` procesos ligeros (LWP, también conocidos como pthreads) por nombre
	- filtrar LWP por nombre de usuario `u`
	- alternancia `t` vista de árbol
	- comandos por LWP
		- `s` rastreo de sistema
		- `l` lista de descriptores de archivos abiertos
		- `e` variables de entorno
		- `k`

### Linux

Conjunto de funciones totalmente operativo.

### Puerto OSX

- Activar DTrace (requiere [iniciar en modo de recuperación para desactivar SIP](https://apple.stackexchange.com/questions/208762/now-that-el-capitan-is-rootless-is-there-any-way-to-get-dtrace-working))
- copiar [htop](https://github.com/joesuf4/home/blob/master/bin/dtruss-htop) a `~/bin` y ejecutar para crear `strapón` enlace simbólico
- lanzamiento `htop`

### [Solaris 11](https://github.com/joesuf4/htop/tree/solaris-stable).

- Estadísticas de ZFS ARC
- Nombre de zona/columnas de ID
- Deltas contables de LWP de Solaris
	- PID de dos niveles + LWPID


<!-- $Date: 2023-01-19 22:58:40 +0000 (Thu, 19 Jan 2023) $ $Author: joe $ -->
