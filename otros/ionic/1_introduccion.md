
# ¿Qué es Ionic? Historia y características principales {#que-es-ionic}

[Ionic](https://ionicframework.com/) es un *framework* open source que permite crear aplicaciones móviles, de escritorio y web usando tecnologías web estándar: HTML, CSS y JavaScript/[TypeScript](https://es.wikipedia.org/wiki/TypeScript).

La primera versión apareció en 2013 construida sobre AngularJS y Apache Cordova (un *framework* de desarrollo móvil originalmente conocido como **PhoneGap**).

Las versiones más modernas hacen uso de componentes web utilizando [StencilJs](https://stenciljs.com/), pudiendo elegir entre [Angular](https://angular.dev/), [React](https://es.react.dev/) o [Vue](https://vuejs.org/).

Para acceder a las funcionalidades nativas del dispositivo (cámara, GPS, almacenamiento, etc.) hace uso de [Capacitor](https://capacitorjs.com/) (antes Cordova)

Principales características:

- **Multiplataforma**: una sola base de código para Android, iOS y PWA (*[Progressive Web App](https://en.wikipedia.org/wiki/Progressive_web_app)*).
- **Gran biblioteca de componentes** UI listos para usar.
- **Compatible con frameworks modernos** (Angular, React, Vue).
- **Integración con APIs nativas** mediante Capacitor.


# Arquitectura de una aplicación Ionic {#arquitectura-ionic}

Una aplicación Ionic se organiza en torno a:

- **Componentes UI** (*components*): elementos visuales (botones, listas, formularios).
- **Páginas** (*pages*): vistas que representan pantallas de la app.
- **Módulos**: organizan y agrupan páginas y servicios.
- **Servicios**: lógica de negocio y acceso a datos.
- **Capacitor**: puente entre JavaScript y las APIs nativas del dispositivo.

::: infobox
Una *page* es un componente con un HTML más elaborado y con una ruta añadida.
:::

Teniendo en cuenta esto, se pueden crear componentes propios que pueden ser reutilizables en nuestra aplicación, por lo que es importante haber realizado un estudio de cada vista/pantalla que va a tener nuestra aplicación.

Al reutilizar estos componentes, conseguimos:

- Evitar duplicidad en el código.
- Mantenimiento y depuración más sencilla. Se puede modificar un componente sin modificar el resto de la aplicación.
- Al ser componentes autocontenidos, también podemos reutilizarlos entre proyectos.


# Cómo desarrollar con Ionic {#como-desarrollar-ionic}

Para poder desarrollar una aplicación con Ionic necesitamos tener instalado:

- [Node.js](https://nodejs.org/): es un entorno de ejecución que nos permite ejecutar código JavaScript fuera de un navegador. Muy conocido en entornos de desarrollo web gracias al gestor de paquetes [npm](https://en.wikipedia.org/wiki/Npm).
- El *CLI* de Ionic, que lo instalaremos a través del gestor **npm**.
- Para poder compilar aplicaciones Android, necesitaremos tener [Android Studio](https://developer.android.com/studio).
- Para entornos iOS/Apple, es necesario tener un ordenador Mac con [Xcode](https://developer.apple.com/xcode/) y [Cocoapods](https://cocoapods.org/).


## Instalar Node {#instalar-node}

Desde la web para [descargar](https://nodejs.org/en/download) Node, tenemos distintas opciones a elegir:

![Opciones de descargas](img/ionic/download_options.png){width=80%}

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


### Desarrollar con Docker {#desarrollar-con-docker}

Para no depender del sistema operativo, y poder realizar cambios de versiones en cualquier momento, se va a explicar cómo desarrollar usando Docker y Visual Studio Code como IDE (en inglés *Integrated Development Environment*, o entorno integrado de desarrollo).

Si estamos en un entorno Windows, se recomienda realizar lo siguiente desde un **WSL**, teniendo en cuenta [el rendimiento de los sistemas de ficheros](https://yuki.github.io/my-books/docker.html#rendimiento-de-los-sistemas-de-ficheros-en-wsl).


::: {.mycode}
[Crear contenedor para desarrollo]{.title}

``` console
ruben@vega:~$ docker run  -it --name ionic -p 8100:8100 \
--entrypoint /bin/bash -v "$(pwd):/workdir" --workdir /workdir node
root@a1d346824085:/workdir#
```
:::

Los parámetros explicados:

- [-p 8100:8100]{.verbatim}: por defecto es el puerto que se usa con Ionic.
- [--entrypoint /bin/bash]{.verbatim}: por defecto, la imagen ejecuta como *entrypoint* el comando [node]{.commandbox}, y de esta manera lo sobreescribimos para usar [/bin/bash]{.commandbox} al entrar en el contenedor.
- [-v "$(pwd):/workdir"]{.verbatim}: para enlazar el directorio en el que estamos como volumen persistente de datos, y configurado en la ruta [/workdir]{.configdir} dentro del contenedor.
- [--workdir /workdir]{.verbatim}: el directorio que usamos al entrar en el contenedor.

Para poder desarrollar con Visual Studio Code dentro del contenedor vamos a necesitar la extensión [remote development](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack). Una vez instalada, nos aparecerá un nuevo icono en el lateral del IDE y podremos ver los contenedores que tenemos arrancados:

![](img/ionic/vscode_container.png){width=50% framed=true}

Con esta extensión podemos conectarnos al contenedor, se nos abrirá una nueva ventana del IDE, y desde ahí podremos abrir el directorio [/workdir]{.verbatim} que está dentro del contenedor.

::: errorbox
Trabajar dentro de un contenedor no nos permitirá usar el emulador de Android/iOS de manera sencilla.
:::

