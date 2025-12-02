
# Introducción {#introducción-angular}

**[Angular](https://angular.dev/)** es un *framework front-end* desarrollado por **Google** para construir **aplicaciones web modernas, escalables y mantenibles**. Utiliza **TypeScript** como lenguaje principal y está basado en una arquitectura por **componentes**, lo que permite dividir la aplicación en piezas reutilizables y fáciles de gestionar.

Una de las ventajas de usar Angular es la creación de **SPA** (*single-page applications*). Las SPA permiten que el usuario interactúe con la aplicación reescribiendo partes de la web actual con datos obtenidos del servidor. De esta manera, permite construir interfaces dinámicas y estructuradas.


## Historia {#historia-angular}

Es importante conocer un poco la historia de Angular, ya que originalmente, la primera versión se llamaba AngularJS debido a que estaba basado en Javascript. 

| Año | Versión | Características destacadas |
|------|---------|----------------------------|
| 2010 | AngularJS (1.x) | Basado en JavaScript y patrón MVC |
| 2016 | Angular 2 | Reescritura completa, TypeScript |
| 2016-2023 | Angular 4 → 15 | Mejora del rendimiento y CLI |
| 2024 | Angular 16-17 | Standalone Components, Signals |
| 2025 | **Angular 20** | Mejoras de rendimiento y nuevas sintaxis |

Table: {tablename=yukitblr colspec=XX[2]X[4]}

Tal como se puede ver, desde la versión 2 se reescribió para hacer uso de TypeScript.

## Arquitectura básica de Angular {#arquitectura-básica-angular}
Una aplicación Angular se compone principalmente de:

- **Componentes** ([Component]{.verbatim}): representan las pantallas o partes visuales. En la [documentación oficial](https://angular.dev/guide/components) existe mucha información acerca de cómo funcionan, por lo que es recomendable ir a ella para ver todos los detalles.
- **Servicios** ([Service]{.verbatim}): contienen la lógica o manipulan datos.
- **Plantillas (*templates*)**: definen el HTML de cada componente.
- **Rutas (*Routing*)**: gestionan la navegación entre páginas.

Estos elementos trabajan juntos siguiendo el patrón **MVC** (Modelo - Vista - Controlador) adaptado al entorno web.

En las últimas versiones de Angular los componentes por defecto son *standalone* (facilita la migración a otras aplicaciones) mientras que anteriormente eran de tipo **NgModule**.


# Cómo desarrollar en Angular {#como-desarrollar-angular}

Para poder desarrollar una aplicación con Angular necesitamos tener instalado:

- [Node.js](https://nodejs.org/): es un entorno de ejecución que nos permite ejecutar código JavaScript fuera de un navegador. Muy conocido en entornos de desarrollo web gracias al gestor de paquetes [npm](https://en.wikipedia.org/wiki/Npm).
- **Angular CLI**: Es la herramienta oficial de Angular, que cuenta con un interfaz de línea de comandos que nos va a permitir crear el esqueleto de una aplicación a través de un asistente.


## Instalar Node {#instalar-node}

Desde la web para [descargar](https://nodejs.org/en/download) Node, tenemos distintas opciones a elegir:

![Opciones de descargas](img/angular/download_options.png){width=80%}

- **Versión**: Node.js cuenta con distintas versiones, que varían en su ciclo de vida y de mantenimiento. Algunas de las versiones son nombradas como **LTS** (*Long Term Support*, con soporte a largo plazo), ideales para usar en servidores.
- **Sistema operativo**: Debemos elegir el sistema donde queremos realizar la instalación.
- **Sistema de instalación**: Dependiendo del sistema operativo, podemos elegir distintas maneras de instalar Node. Podemos destacar:
  - **[NVM](https://github.com/nvm-sh/nvm)**: *node versión manager*, es un gestor de versiones de Node. Nos permite tener distintas versiones instaladas en el mismo equipo, por lo que es ideal si desarrollamos con él.
  - **Docker**: para desarrollar usando imágenes Docker.
  - **[Brew](https://brew.sh/)**: Es un gestor para instalar aplicaciones en MacOS, para no tener que ir a cada web para descargarlos. También nos facilita poder actualizarlas desde el propio gestor.
  - **[Chocolatey](https://chocolatey.org/)**: Es un gestor para poder instalar aplicaciones en Windows desde la línea de comandos.
- **Gestor de paquetes**: Junto con Node se pueden instalar distintos gestores de paquetes, que después usaremos durante el desarrollo de nuestras aplicaciones.
  - **[npm](https://en.wikipedia.org/wiki/Npm)**: es el gestor de paquetes utilizado por defecto con Node.js. Originalmente creado por Isaac Z. Schlueter, hoy en día está bajo el amparo de Github.
  - **[yarn](https://en.wikipedia.org/wiki/Yarn_(package_manager))**: la alternativa más extendida a *npm*, creado en una colaboración entre Facebook, Google y otras compañías.

Aparte de estos sistemas más "modernos", en la propia web se puede descargar un instalador clásico para cada sistema.


## Instalar Angular CLI {#instalar-angular-cli}

Tras instalar Node, vamos a instalar el cliente de consola de Angular. Para ello usaremos el gestor de paquetes **npm**:

::: {.mycode}
[Instalar Angular CLI]{.title}

``` console
ruben@vega:~$ npm install -g @angular/cli

ruben@vega:~$ npm -g ls
/home/ruben/.nvm/versions/node/v24.8.0/lib
├── @angular/cli@20.3.6
└── npm@11.6.0

ruben@vega:~$ ng version
Angular CLI: 20.3.6
Node: 24.8.0
Package Manager: npm 11.6.0
OS: linux x64
```
:::

De esta manera tenemos instalado, **de manera global**, el CLI de Angular, por lo que ya podremos crear nuestra primera aplicación.


## Desarrollar con Docker {#desarrollar-con-docker}

Para no depender del sistema operativo, y poder realizar cambios de versiones en cualquier momento, se va a explicar cómo desarrollar usando Docker y Visual Studio Code como IDE (en inglés *Integrated Development Environment*, o entorno integrado de desarrollo).

Si estamos en un entorno Windows, se recomienda realizar lo siguiente desde un **WSL**, teniendo en cuenta [el rendimiento de los sistemas de ficheros](https://yuki.github.io/my-books/docker.html#rendimiento-de-los-sistemas-de-ficheros-en-wsl).


::: {.mycode}
[Crear contenedor para desarrollo]{.title}

``` console
ruben@vega:~$ docker run  -it --name angular -p 4200:4200 \
--entrypoint /bin/bash -v "$(pwd):/workdir" --workdir /workdir node:24
root@a1d346824085:/workdir#
```
:::

Los parámetros explicados:

- [-p 4200:4200]{.verbatim}: por defecto es el puerto que se usa con Angular.
- [\-\-entrypoint /bin/bash]{.verbatim}: por defecto, la imagen ejecuta como *entrypoint* el comando [node]{.commandbox}, y de esta manera lo sobreescribimos para usar [/bin/bash]{.commandbox} al entrar en el contenedor.
- [-v "$(pwd):/workdir"]{.verbatim}: para enlazar el directorio en el que estamos como volumen persistente de datos, y configurado en la ruta [/workdir]{.configdir} dentro del contenedor.
- [\-\-workdir /workdir]{.verbatim}: el directorio que usamos al entrar en el contenedor.

Para poder desarrollar con Visual Studio Code dentro del contenedor vamos a necesitar la extensión [remote development](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack). Una vez instalada, nos aparecerá un nuevo icono en el lateral del IDE y podremos ver los contenedores que tenemos arrancados:

![](img/angular/vscode_container.png){width=50% framed=true}

Con esta extensión podemos conectarnos al contenedor, se nos abrirá una nueva ventana del IDE, y desde ahí podremos abrir el directorio [/workdir]{.verbatim} que está dentro del contenedor.

::: errorbox
Trabajar dentro de un contenedor no nos permitirá usar el emulador de Android/iOS de manera sencilla.
:::


# Crear primera aplicación {#crear-aplicación}

Vamos a crear una primera aplicación para ver cómo funciona el asistente de generación del proyecto:

::: {.mycode}
[Crear aplicación]{.title}

``` console
ruben@vega:~$ ng new pruebas
```
:::

Nos realiza las siguientes preguntas:

- **Formato de hojas de estilo**: A la hora de desarrollar con Angular podemos hacer uso de distintos formatos en los que queremos escribir nuestros estilos:
  - **CSS**: El sistema de hojas de estilo en cascada ([CSS](https://developer.mozilla.org/es/docs/Web/CSS)) tradicional en el desarrollo web.
  - **[Sass](https://en.wikipedia.org/wiki/Sass_(style_sheet_language)) (SCSS)**: Del inglés *syntactically awesome style sheets*, es un lenguaje pre-procesado que tras ser interpretado genera CSS. Nació en 2006 para cubrir carencias que tenía CSS como variables, reutilización de código...
  - **Sass (Indented)**: Es una variante del caso anterior utilizando un metalenguaje.
  - **Less**: Otro sistema pre-procesado para generar hojas de estilo, que nació en 2009 como alternativa a Sass.
- **Habilitar SSR y SSG**: Por defecto no se habilita. Se recomienda leer los siguientes enlaces para decidir si activar estas opciones o no:
  - **SSR**: *[Server-Side Rendering](https://angular.dev/guide/routing/rendering-strategies#server-side-rendering-ssr)* permite generar HTML en el lado del servidor para la petición inicial de una ruta, de esta manera permite contenido dinámico para bueno SEO.
  - **SSG**: *[Static Site Generation](https://angular.dev/guide/routing/rendering-strategies#static-site-generation-ssg-prerendering)* pre-renderiza las páginas en HTML estáticos cuando se "compila" el proyecto. El servidor envía HTML pre-compilado para la carga inicial de la página
- Crear aplicación ***zoneless*** sin **zone.js**: Por defecto la respuesta es "no". Zone.js usa eventos y tareas *async* como indicadores para cuando los estados de la aplicación puedan ser modificados.
- Uso de **utilidades de Inteligencia Artificial** en el proyecto: con la expansión de la IA, al generar un nuevo proyecto podemos hacer que se [configure para distintos LLM](https://angular.dev/ai/develop-with-ai).


Para no tener que responder a estas preguntas el CLI nos permite añadir parámetros y valores al crear el proyecto. Se puede ver con [ng new \-\-help]{.commandbox}.


## Estructura del proyecto {#angular-estructura-proyecto}

Una vez creado el proyecto podremos comprobar cómo se ha creado una estructura de directorios y ficheros donde estará nuestra aplicación. Es interesante comprobar cómo también nos ha generado un repositorio [GIT](https://git-scm.com/) con el primer commit ya generado.

Dentro de la estructura generada podemos destacar:

- [angular.json]{.configfile}: Es el fichero de configuración de nuestra aplicación. A pesar de no entender algunos aspectos de la configuración es conveniente echar un ojo, ya que otros son auto-explicativos.
- [node_modules]{.configdir}: El directorio donde se guardan las dependencias que necesita nuestro proyecto. Este directorio está ignorado en GIT.
- [package.json]{.configfile}: Es el fichero que contiene qué dependencias necesita nuestro proyecto, indicando la versión, si es para desarrollo o producción, y los scripts necesarios para ejecutar/"compilar"/testear nuestra aplicación.
- [public]{.configdir}: Es el directorio donde podemos guardar *assets* públicos.
- [src]{.configdir}: El directorio donde se va a guardar el código de nuestra aplicación. Vamos a detallar algunos de los ficheros que hay dentro de este directorio.
  - [index.html]{.configfile}: Es la plantilla principal del HTML que se va a generar alrededor de nuestra aplicación. 
  - [styles.scss]{.configfile}: Son los estilos generales de nuestra aplicación. Más adelante hablaremos de ello.
  - [app]{.configdir}: Es el directorio donde van a estar los componentes y el código de nuestra aplicación. En el siguiente tema se detallará más.
    - [app.routes.ts]{.configfile}: Es el fichero de rutas a las que se puede acceder en nuestra aplicación. Más adelante se explicará cómo funcionan las rutas.


## Ejecutar aplicación {#angular-ejecutar-aplicación}

Para ejecutar el proyecto recién creado, entramos al directorio y ejecutamos [ng serve]{.commandbox}:

::: {.mycode}
[Ejecutar aplicación]{.title}

``` console
ruben@vega:~/pruebas $ ng serve --host 0.0.0.0
Initial chunk files | Names         | Raw size
main.js             | main          | 47.75 kB | 
styles.css          | styles        | 96 bytes | 
polyfills.js        | polyfills     | 95 bytes | 

                    | Initial total | 47.94 kB

Application bundle generation complete. 
[1.336 seconds] - 2025-10-23T16:19:11.364Z

Watch mode enabled. Watching for file changes...
NOTE: Raw file sizes do not reflect development server 
per-request transformations.
  -  Local:   http://localhost:4200/
  -  Network: http://172.17.0.2:4200/
  -  press h + enter to show help
```
:::

Si abrimos nuestro navegador en la dirección indicada [http://localhost:4200](http://localhost:4200/), veremos lo siguiente:

![](img/angular/angular_app_base.png){width=70% framed=true}


# Continuar desarrollo de una aplicación {#angular-producción}

Si queremos continuar el desarrollo de una aplicación en otro equipo, o un proyecto creado hace tiempo que tenemos en GitHub, es necesario crear un entorno de desarrollo es similar a lo visto anteriormente, con matices.

Para crear un nuevo entorno, los pasos a dar serían los siguientes:

1. Descargar código fuente del proyecto
2. Asegurar que tenemos instalado el Angular/Cli
3. Instalar dependencias dentro del directorio del proyecto

::: {.mycode}
[Instalar dependencias]{.title}

``` console
root@025c365f282c:/workdir/proyecto# npm install 
```
:::

4. Ejecutar aplicación 

Tal como se puede ver, la única diferencia respecto a crear un proyecto nuevo es el punto de instalar las dependencias, ya que sin estas nuestra aplicación no podrá funcionar.


# Poner en producción {#angular-producción}

Cuando necesitemos [poner nuestra aplicación en producción](https://angular.dev/tools/cli/deployment) Angular tiene un asistente que nos permite realizar el despliegue en distintos servicios como [Firebase](https://firebase.google.com/), [GitHub Pages](https://pages.github.com/) o [Amazon S3](https://aws.amazon.com/es/s3/?nc2=h_ql_prod_st_s3).

Es importante entender cuáles son los pasos que hay que realizar para poner nuestra aplicación en producción:

1. **Construir los ficheros de la aplicación**: El código TypeScript, junto con las vistas HTML y su CSS, se transpila y genera los ficheros finales necesarios de nuestra aplicación. Estos ficheros son estáticos.
    - Este proceso se puede realizar también con el comando [ng build]{.commandbox} cuando queramos.
2. **Desplegar aplicación**: Es necesario desplegar los ficheros detrás de un servidor web. Se puede realizar de dos maneras:
    - Usar una **plataforma** (Firebase, GitHub Pages, Amazon S3, ...) donde desplegar nuestra aplicación. Para ello se debe añadir la dependencia necesaria y usar el asistente [ng deploy]{.commandbox} para desplegar la aplicación.
    - Usar un **servidor web propio**. Para ello debemos seguir las [recomendaciones necesarias](https://angular.dev/tools/cli/deployment#server-configuration) para configurar nuestro servidor.


