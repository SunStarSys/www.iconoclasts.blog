---
categories: Инструменты
dependencies: '*.md.ru'
keywords: ~
status: архивированный
title: Веселье с вершиной
---

<div style="float:right" class="col-lg-5">
	<div class="embed-responsive embed-responsive-16by9">
	 	<iframe class="embed-responsive-item" style="margin-bottom:20px;max-width:560;max-height:315" src="https://www.youtube.com/embed/iEUZJ44mldI" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	</div>
</div>

## {# lede #}Расширенные функции htop на популярных платформах Unix{# lede #}

- Дельты от `top`

- сложное интерактивное поведение
	- тематические, **семантические** цветовые схемы
	- работает на уровне потока POSIX, а не только на полных процессах

- Особенности

- настроить отображение `C`
	- поиск `/` или фильтр `\` легкие процессы (LWP, aka pthreads) по названию
	- фильтр LWP по имени пользователя `u`
	- переключение `t` представление дерева
	- команды per-LWP
		- `s` трассировка системы
		- `l` список дескрипторов открытых файлов
		- `e` переменные среды
		- `k` посылать сигнал с убийством

### Линукс

Полностью работоспособный набор функций OOTB.

### Порт OSX

- Включить DTrace (требуется) [загрузка в режим восстановления для отключения SIP](https://apple.stackexchange.com/questions/208762/now-that-el-capitan-is-rootless-is-there-any-way-to-get-dtrace-working))
- копия [дрозд сверху](https://github.com/joesuf4/home/blob/master/bin/dtruss-htop) по `~/bin` и выполнить для создания `strace` симв.
- запуск `htop` как корень

### [Солярис 11](https://github.com/joesuf4/htop/tree/solaris-stable) / FreeBSD Порты

- Статистика ZFS ARC
- Столбцы имени зоны/идентификатора
- Solaris LWP Бухгалтерские дельты
	- двухуровневый PID + LWPID
	- не предоставляет полных аргументов команды, просто имя команды

<!-- $Date$ $Author$ -->

<!-- $Date$ $Author$ $Revision$ -->
