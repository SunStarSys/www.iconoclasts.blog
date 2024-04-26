---
archived: ~
categories: Perl, Apache, TI, Correo, Herramientas
dependencies: '*.md.es'
keywords: qpsmtpd,Apache::Qpsmtpd,earlytalker,anti-spam,sendmail,postfix,exim
published: ~
status: archivado
title: Sobre el problema del spam...
---

Como escribí sobre [otro lugar](/clients/apache), una de las mejores herramientas de código abierto disponibles para el arsenal de herramientas anti-spam de un administrador de correo es [qpsmtpd](http://en.wikipedia.org/wiki/Qpsmtpd), que es simplemente un servidor de correo entrante frontend que necesita un servidor de correo totalmente funcional como `qmail`, `correo`, `eximir`, o `prefijo` para la entrega saliente.  Qué `qpsmtpd` es muy similar a lo que `httpd` para los servidores web: introduce ganchos personalizables en cada fase del `SMTP`

{# lede #}El mejor plugin para `qpsmtpd`aunque es difícil entender por qué{# lede #}, es el `maduro` plugin.  Qué `maduro` se pone `qpsmtpd` para dormir durante un tiempo configurable, escuchando en el zócalo (a través de `seleccionar(2)`) para comunicaciones "tempranas" no conformes con RFC procedentes del otro extremo del socket (`qpsmtpd` normalmente bifurca un servidor para cada conexión entrante, por lo que es solo ese proceso de niño durmiendo en `seleccionar(2)`

¿Por qué una herramienta tan simple es tan poderosa en el arsenal del administrador?  Porque introduce retrasos obligatorios para cada conexión de correo, que como resultado golpea a la mayoría de los spammers donde pueden medirlo, en términos de atar a su agente de entrega de correo de tratar con el resto de su cola.  Es importante darse cuenta de que los spammers están dirigiendo un negocio, muchos de los cuales no tienen ningún interés directo en el contenido de lo que entregan. Se les paga por administrar una red sofisticada, y típicamente ilegal, de agentes de envío, y proporcionarán servicios de entrega para cualquier cliente con el dinero en efectivo para cubrir su uso más beneficios.  Muchos de ellos ganan ingresos anuales muy por encima de los míos o los tuyos :-).

Hay enfoques más sofisticados para estar seguro, como solo retrasar los mensajes de remitentes "no confiables", pero puedes ir mucho más lejos que eso si tu servidor tiene ese tipo de conocimiento disponible.  Pero en términos de golpe por el dinero, corriendo `maduro`

<!-- $Date: 2023-01-29 20:02:19 +0000 (Sun, 29 Jan 2023) $ $Author: joe $ $Revision: 12483 $ -->

@joe=
