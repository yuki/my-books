
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


