
# Historia de JavaScript {#historia-javascript}

Actualmente, [JavaScript](https://en.wikipedia.org/wiki/JavaScript) es el lenguaje de programación más utilizado para desarrollar aplicaciones web. Está presente en prácticamente todas las páginas de Internet y es capaz de ejecutarse tanto en navegadores web como en servidores y otros entornos.

Creado en 1995 por la empresa [Netscape](https://en.wikipedia.org/wiki/Netscape) JavaScript no nació con el objetivo de desarrollar aplicaciones complejas. Su propósito inicial era mucho más modesto: añadir pequeñas funcionalidades a páginas HTML estáticas.

Con el paso del tiempo, el lenguaje ha evolucionado hasta convertirse en una plataforma completa para desarrollar aplicaciones web, aplicaciones de escritorio, aplicaciones móviles e incluso programas para servidores.

El nombre **JavaScript** fue elegido principalmente por motivos comerciales, aprovechando la enorme popularidad que Java estaba adquiriendo en aquella época. A pesar del nombre, **JavaScript y Java son lenguajes completamente diferentes**. Comparten una sintaxis superficial parecida, pero tienen objetivos, características y formas de ejecución distintas.

Durante la segunda mitad de los años 90 comenzó la denominada **[guerra de los navegadores](https://es.wikipedia.org/wiki/Guerra_de_navegadores)**. Cada fabricante añadía nuevas características a JavaScript sin seguir un estándar común. Como consecuencia:

- El mismo programa podía funcionar en un navegador y fallar en otro.
- Los desarrolladores debían escribir código específico para cada navegador.
- El mantenimiento de las aplicaciones era complicado.

::: infobox
Esta situación hizo evidente la necesidad de crear un estándar.
:::

## La estandarización del lenguaje {#estandarización-javascript}

En 1997 la organización **ECMA International** publicó la primera especificación oficial del lenguaje que recibió el nombre de **[ECMAScript](https://en.wikipedia.org/wiki/ECMAScript)**. A partir de ese momento, los navegadores comenzaron a implementar el mismo estándar, reduciendo progresivamente las diferencias entre ellos. Actualmente todos los navegadores modernos implementan las especificaciones publicadas por ECMAScript.

## JavaScript fuera del navegador {#javascript-fuera-navegador}

Aunque JavaScript nació como un lenguaje para navegadores, actualmente puede ejecutarse en muchos otros entornos. Algunos ejemplos son:

- Servidores web mediante [Node.js](https://nodejs.org/es).
- Aplicaciones de escritorio.
- Aplicaciones móviles.
- Herramientas de automatización.
- Scripts de administración.
- Dispositivos IoT.

Esto ha convertido a JavaScript en uno de los lenguajes más versátiles de la actualidad.

# ECMAScript {#introducción-ecmascript}

Cuando hablamos de JavaScript es habitual utilizar indistintamente los términos **JavaScript** y **ECMAScript**. Sin embargo, no significan exactamente lo mismo.

- **ECMAScript** es la **especificación o estándar** que define cómo debe funcionar el lenguaje. La especificación se puede leer en [ECMAScript® 2026 Language Specification](https://262.ecma-international.org/).
- **JavaScript** es la implementación de ese estándar realizada por los diferentes motores de ejecución.

Cuando usamos un navegador web estaremos haciendo uso del motor de ejecución (*[JavaScript Engine](https://en.wikipedia.org/wiki/List_of_JavaScript_engines)*) que tenga implementado:

- [SpiderMonkey](https://en.wikipedia.org/wiki/SpiderMonkey): creao  por la fundación Mozilla y utilizado en Firefox y derivados, pero también en [MongoDB](https://en.wikipedia.org/wiki/MongoDB) y en el entorno de escritorio [GNOME](https://en.wikipedia.org/wiki/GNOME).
- [V8](https://en.wikipedia.org/wiki/V8_(JavaScript_engine)): creado por Google en 2008 para ser usado en Chrome. También se usa en entorno servidor, principalmente en [Node.js](https://nodejs.org/) y en las aplicaciones basadas en [Electron](https://en.wikipedia.org/wiki/Electron_(software_framework)).
- [JavaScriptCore](https://en.wikipedia.org/wiki/WebKit#JavaScriptCore): utilizado en Safari.

Dentro de ECMA existe un comité denominado **TC39**, responsable de estudiar, diseñar y aprobar las nuevas características del lenguaje. Entre sus funciones destacan:

- Proponer nuevas funcionalidades.
- Analizar su viabilidad.
- Debatir posibles mejoras.
- Aprobar las modificaciones del estándar.

El objetivo es garantizar que JavaScript evolucione de forma ordenada y compatible con versiones anteriores. 

## Evolución {#evolución-ecmascript}

En 2009 apareció una nueva versión del lenguaje denominada **ECMAScript 5 (ES5)**. Esta versión mejoró considerablemente la estabilidad y la compatibilidad entre navegadores. Sin embargo, el cambio más importante llegó en 2015 con la publicación de **ECMAScript 2015 (ES6)**, que transformó el lenguaje.

Desde 2015, cada año se publican nuevas versiones del estándar incorporando pequeñas mejoras y nuevas funcionalidades. En la Wikipedia se puede ver [el historial de versiones](https://en.wikipedia.org/wiki/ECMAScript_version_history).


## Línea temporal

| Año  | Acontecimiento |
|:----:|:---------------|
| 1991 | Nace la World Wide Web. |
| 1995 | Brendan Eich crea JavaScript para Netscape Navigator. |
| 1997 | Se publica la primera especificación ECMAScript. |
| 1999 | ECMAScript 3 se convierte en el estándar dominante durante varios años. |
| 2005 | Se populariza AJAX y comienzan a aparecer aplicaciones web más dinámicas. |
| 2006 | jQuery simplifica el desarrollo con JavaScript. |
| 2009 | Se publica ECMAScript 5. Mejoras en  los objetos, modo "estricto", mejoras en JSON, ... |
| 2015 | ECMAScript 2015 (ES6) introduce una profunda modernización del lenguaje. Variables [let]{.verbatim} y [const]{.verbatim}, clases, módulos, promesas, parámetros por defecto... |
| 2016-Actualidad | Publicación anual de nuevas versiones de ECMAScript. |

Table: {tablename=yukitblr colspec=X[-1]X[l]}

## Compatibilidad entre navegadores {#compatibilidad}

Debido a la evolución del lenguaje, los motores de ejecución y navegadores no tienen por qué estar siempre a la última, o pueden priorizar las distintas nuevas características. Para consultar las compatibilidades de los navegadores podemos usar las siguientes webs:

![Compatibilidad de [fetch](https://developer.mozilla.org/es/docs/Web/API/Window/fetch) en MDN](img/dec/compatibilidad.png){width=90%}

- [Mozilla Developer Network](https://developer.mozilla.org/es/): La documentación oficial más utilizada por los desarrolladores.
- [ECMAScript Compatibility Table](https://compat-table.github.io/compat-table/es2016plus/): Para consultar la compatibilidad de las características del lenguaje JavaScript.
- [Can I use](https://caniuse.com): para consultar HTML, CSS, APIs del navegador, ...

# Características de JavaScript {#características-javascript}

JavaScript es un **lenguaje interpretado**. Esto significa que el código fuente no necesita compilarse previamente para ejecutarse. Cuando el navegador carga una página web, interpreta y ejecuta el código JavaScript.

Actualmente, los motores JavaScript modernos utilizan técnicas mucho más avanzadas, como la **compilación Just-In-Time (JIT)**, que traducen parte del código a lenguaje máquina mientras el programa se está ejecutando para mejorar el rendimiento.

Una de las mayores ventajas de JavaScript es que puede ejecutarse en diferentes sistemas operativos sin modificar el código,  siempre que haya un motor JavaScript en el SO.

JavaScript es un **lenguaje de tipado dinámico**. Esto significa que una variable puede almacenar distintos tipos de datos a lo largo de la ejecución del programa. Y es **tipado débil**, ya que el propio lenguaje realiza conversiones automáticas entre distintos tipos de datos cuando lo considera necesario. Estas conversiones automáticas facilitan algunas operaciones, pero también pueden generar resultados inesperados si no se tiene cuidado.

:::  warnbox
Es recomendable realizar conversiones explícitas cuando sea necesario
:::

Permite desarrollar programas utilizando **programación orientada a objetos**, aunque se implementa de forma diferente a otros lenguajes como Java o C#.

Una característica interesante es que las funciones son tratadas como cualquier otro valor, lo que permite:

- Almacenarse en variables.
- Enviarse como parámetros.
- Devolverse desde otras funciones.
- Formar parte de objetos.

Esta característica resulta fundamental para comprender conceptos como los eventos, los temporizadores o la programación asíncrona.

Como otros  lenguajes interpretados, incorpora un sistema de **recolección automática de memoria** (*Garbage Collector*). El programador no necesita liberar manualmente la memoria utilizada por los objetos que ya no son necesarios. El motor JavaScript detecta automáticamente qué recursos ya no están siendo utilizados y los libera. Esto reduce considerablemente la posibilidad de producir errores relacionados con la gestión de memoria.

Una de las características más importantes de JavaScript moderno es su capacidad para trabajar de forma asíncrona. Esto permite ejecutar determinadas tareas sin bloquear el resto del programa. Por ejemplo:

- Descargar datos de Internet.
- Esperar la respuesta de un servidor.
- Leer archivos.
- Ejecutar temporizadores.

Gracias a ello, las aplicaciones web pueden seguir respondiendo a las acciones del usuario mientras esperan la finalización de otras operaciones.




## Seguridad y limitaciones {#seguridad-limitaciones}

JavaScript fue diseñado para ejecutarse en el navegador del usuario, por lo que se ejecuta en el ordenador o dispositivo del usuario y no en el servidor. Esta característica ofrece ciertas ventajas, como una mayor interactividad y una respuesta más rápida de las aplicaciones. Sin embargo, también plantea importantes retos relacionados con la seguridad.

Los navegadores modernos implementan medidas para impedir que una página web pueda acceder libremente al ordenador del usuario o interferir con otras páginas abiertas.

## Entorno aislado (*Sandbox*) {#entorno-aislado}

Una de las principales medidas de seguridad consiste en ejecutar el código JavaScript dentro de un **entorno aislado**, conocido como *sandbox* (caja de arena). El *sandbox* limita las acciones que puede realizar un programa JavaScript, evitando que tenga acceso directo al sistema operativo. Gracias a este mecanismo, una página web no puede, por ejemplo:

- Leer cualquier archivo del disco duro.
- Modificar archivos del sistema.
- Instalar programas.
- Ejecutar aplicaciones del sistema operativo.
- Acceder libremente a la información de otras aplicaciones.
- Acceder al hardware directamente. Antes de acceder a recursos (cámara, microfono, ubicación, ...) pedirá autorización al usuario.

Estas restricciones protegen al usuario frente a posibles páginas maliciosas.

## Política del mismo origen (*Same-Origin Policy*) {#sop}

Una medida de seguridad muy importante es la **[Política del mismo origen (*Same-Origin Policy*)](https://en.wikipedia.org/wiki/Same-origin_policy)**. Esta política impide que una página web pueda acceder libremente a la información de otra página perteneciente a un sitio diferente. Si el usuario tiene abiertas simultáneamente dos páginas distintas, el código de una de ellas no podrá acceder al contenido de la otra.

## Restricciones en las peticiones HTTP {#cors}

Las aplicaciones web suelen comunicarse con servidores mediante peticiones HTTP. Sin embargo, los navegadores también aplican restricciones a estas comunicaciones. Cuando una aplicación intenta acceder a un servidor diferente al que ha servido la página, el servidor remoto debe autorizar expresamente dicha comunicación mediante una técnica denominada **[CORS (Cross-Origin Resource Sharing)](https://en.wikipedia.org/wiki/Cross-origin_resource_sharing)**.

Si el servidor no está configurado para permitir el acceso, el navegador bloqueará la petición. Esta medida evita que páginas maliciosas accedan a servicios web sin autorización.

## El código JavaScript es visible {#codigo-visible}

A diferencia de otros lenguajes utilizados en el servidor, el código JavaScript llega al navegador del usuario. Cualquier persona puede visualizarlo utilizando las herramientas de desarrollo del navegador, y por lo tanto incluso modificarlo. Por este motivo:

- No deben incluirse contraseñas.
- No deben almacenarse claves privadas.
- No deben incorporarse datos confidenciales.
- No deben implementarse mecanismos de seguridad basados únicamente en código JavaScript.

Todo el código enviado al navegador debe considerarse público, aunque existen herramientas para ofuscarlo.

### La validación debe realizarse también en el servidor {#validaciones-servidor}

Una aplicación puede utilizar JavaScript para comprobar que un formulario está correctamente cumplimentado: validar e-mail, asegurar que un campo está rellenado, ...

Teniendo en cuenta el punto anterior, estas comprobaciones **no son suficientes** ya que el usuario podría desactivar el  JavaScript, o modificar el propio código, o modificar las peticiones realizadas al servidor. Por ello, **todas las validaciones importantes deben repetirse siempre en el servidor**.

::: errorbox
Todas las validaciones importantes deben repetirse siempre en el servidor
:::

La validación realizada en JavaScript mejora la experiencia del usuario, pero nunca debe sustituir a la validación del lado del servidor.

::: warnbox
La validación realizada en JavaScript mejora la experiencia del usuario, pero nunca debe sustituir a la validación del lado del servidor.
:::
