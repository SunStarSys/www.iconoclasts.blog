---
archived: ~
categories: Инструменты
dependencies: '*.md.ru'
keywords: архивировано
published: ~
status: ~
title: Развлечения с htop
---

<div style="float:right" class="col-lg-5">
	<div class="embed-responsive embed-responsive-16by9">
	 	<iframe class="embed-responsive-item" style="margin-bottom:20px;max-width:560;max-height:315" src="https://www.youtube.com/embed/iEUZJ44mldI" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	</div>
</div>


## {# lede #}Расширенные возможности htop на популярных платформах Unix{# lede #}


- Дельты от `top`

	- сложное интерактивное поведение
	- тематические, **семантические** цветовые схемы
	- работает на уровне потока POSIX, а не только полных процессов


- Особенности

	- настроить отображение `C`
	- поиск `/` или фильтр `\` легких процессов (LWP, aka pthreads) по названию
	- фильтр LWP по имени пользователя `u`
	- переключение вида дерева `t`
	- команды per-LWP
		- трассировка системы `s`
		- `l` список открытых дескрипторов файлов
		- переменные среды e
		- k посылает сигнал с убийством

### Линукс

Полный набор функциональных возможностей OOTB.

### Порт OSX

- Включить DTrace (для отключения SIP требуется [загрузка в режим восстановления](https://apple.stackexchange.com/questions/208762/now-that-el-capitan-is-rootless-is-there-any-way-to-get-dtrace-working))
- копия [dtruss-htop](https://github.com/joesuf4/home/blob/master/bin/dtruss-htop).

### [Солярис 11](https://github.com/joesuf4/htop/tree/solaris-stable).

- Статистика ZFS ARC
- Столбцы «Имя зоны/идентификатор»
- Дельта учета LWP Solaris
	- двухуровневый PID + LWPID
	- не предоставляет полные аргументы команды, только имя команды

<!-- $Date$ $Author$ -->
