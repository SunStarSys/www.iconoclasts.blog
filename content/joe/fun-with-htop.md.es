---
categories: Herramientas
dependencies: '*.md.es'
keywords: ~
status: archivado
title: Diversión con htop
---

<div style="float:right" class="col-lg-5">
	<div class="embed-responsive embed-responsive-16by9">
	 	<iframe class="embed-responsive-item" style="margin-bottom:20px;max-width:560;max-height:315" src="https://www.youtube.com/embed/iEUZJ44mldI" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	</div>
</div>

## {# lede #}Funciones avanzadas de htop en plataformas populares de Unix{# lede #}

- Deltas de `top`

- comportamientos interactivos sofisticados
	- esquemas de color temáticos **semánticos**
	- opera a nivel de thread POSIX, no solo procesos completos

- Características

- personalizar visualización `C`
	- buscar `/` o filtrar `\` procesos ligeros (LWP, también conocidos como pthreads) por nombre
	- filtrar LWP por nombre de usuario `u`
	- alternar `t` vista de árbol
	- comandos por LWP
		- `s` rastreo del sistema
		- `l` lista de descriptores de archivos abiertos
		- `e` variables de entorno
		- `k` enviar una señal con matar

### Código

Juego de funciones totalmente operativo OOTB.

### Puerto OSX

- Activar DTrace (requiere [iniciar en modo de recuperación para desactivar SIP](https://apple.stackexchange.com/questions/208762/now-that-el-capitan-is-rootless-is-there-any-way-to-get-dtrace-working))
- copiar [dtruss-htop](https://github.com/joesuf4/home/blob/master/bin/dtruss-htop) a `~/bin` y ejecutar para crear `strace` enlace simbólico
- lanzamiento `htop` como raíz

### [Solaris 11](https://github.com/joesuf4/htop/tree/solaris-stable) / FreeBSD Puertos

- Estadísticas de ARC de ZFS
- Columnas de nombre/ID de zona
- Solaris LWP - Deltas de contabilidad
	- PID de dos niveles + LWPID
	- no proporciona argumentos de comando completos, solo nombre de comando

<!-- $Date$ $Author$ -->

<!-- $Date$ $Author$ $Revision$ -->
