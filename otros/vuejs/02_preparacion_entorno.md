
# Introducción {#entorno-introducción}

Para desarrollar aplicaciones con Vue 3 necesitaremos algunas herramientas que se ejecutan fuera del navegador. La principal es **Node.js**.


# Node.js y npm {#nodejs-npm}

[Node.js](https://nodejs.org/)  es un entorno de ejecución que permite ejecutar JavaScript fuera de un navegador. Tradicionalmente, JavaScript se ejecutaba principalmente dentro del navegador. Node.js permite utilizar JavaScript también para desarrollar herramientas que se ejecutan en el sistema operativo.

En un proyecto Vue, Node.js no se utiliza normalmente para ejecutar la aplicación que verá el usuario. Su función principal durante el desarrollo es proporcionar el entorno necesario para ejecutar las herramientas que permiten:

- Crear proyectos.
- Instalar dependencias.
- Ejecutar el servidor de desarrollo.
- Compilar la aplicación.
- Ejecutar herramientas de testing.
- Automatizar tareas.

La aplicación Vue terminará ejecutándose en el navegador del usuario, mientras que Node.js nos ayudará a construir y preparar esa aplicación.


::: infobox
La aplicación Vue terminará ejecutándose en el navegador del usuario, mientras que Node.js nos ayudará a construir y preparar esa aplicación.
:::

Al instalar Node.js se incluye habitualmente **npm (Node Package Manager)**. [npm]{.verbatim} es un gestor de paquetes que permite instalar y administrar las dependencias de nuestros proyectos JavaScript.

Los proyectos JavaScript gestionados mediante npm utilizan normalmente un archivo denominado [package.json]{.configfile} que contiene información sobre el proyecto y, entre otras cosas, sus dependencias y los comandos disponibles.


::: mycode
[Ejemplo de package.json]{.title}

``` json
{
  "name": "prueba-vue",
  "version": "0.0.1",
  "private": true,
  "type": "module",
  "scripts": {
    "dev": "vite",
    "build": "vite build"
  },
  "dependencies": {
    "vue": "^3.5.40"
  },
  "devDependencies": {
    //...
  },
  "engines": {
    "node": "^22.18.0 || >=24.12.0"
  }
}
```
:::

## Instalación {#nodejs-instalación}

En la página web de [descarga de Node.js](https://nodejs.org/es/download/) podemos ver cómo instalar Node para distintas plataformas, de distintas formas, y podemos elegir distintas versiones y con distintos gestores de paquetes.

Es importante destacar que Node cuenta con tres tipos de versiones:

- **current**: es la versión más nueva actualmente.
- **LTS**: versión *long time support* o soporte a largo plazo.
- **EOL**: son las versiones *end of life*, cuya vida a finalizado y debería ser necesario actualizar de versión.

Uno de los métodos de instalación de Node más habituales es mediante [nvm]{.verbatim} o [Node Version Manager](https://www.nvmnode.com/), ya que permite tener distintas versiones instaladas en el mismo equipo.

En cambio, para este libro se ha decidido hacer uso de [mise]{.verbatim}, que está explicado en el [anexo adjunto]().


# Vite{#vite}

Para crear aplicaciones Vue modernas utilizaremos **[Vite](https://vite.dev/)**. Vite es una herramienta de desarrollo frontend que proporciona, entre otras funciones:

- Servidor de desarrollo.
- Recarga rápida durante el desarrollo.
- Compilación para producción.
- Integración con Vue.
- Gestión de módulos y recursos.

Una de sus características más importantes es que proporciona un entorno de desarrollo muy rápido.

## Servidor de desarrollo {#vite-servidor-desarrollo}

Durante el desarrollo gracias a Vite podemos ejecutar un servidor local. Habitualmente accederemos al servidor a través de la dirección local [http://localhost:5173/](http://localhost:5173/)


El número de puerto puede variar dependiendo de la configuración y de si el puerto está disponible. Este servidor permite abrir nuestra aplicación en el navegador mientras estamos desarrollándola.

Cuando modificamos el código, Vite puede detectar los cambios y actualizar rápidamente la aplicación que estamos visualizando.


## Desarrollo frente a producción {#desarrollo-frente-producción}

Debemos distinguir entre el entorno de desarrollo y el resultado final que desplegaremos.

- **Durante el desarrollo**: Generamos el código fuente, Vite hace de servidor de desarrollo y lo vemos a través de nuestro navegador.
- **Para producción**: Generamos el código fuente, usamos Vite para generar archivos optimizados (unifica ficheros CSS, JS, minimiza...), debemos subir el código generado a un servidor web (Apache, Neginx, ...) y lo visualizamos a través del navegador.

La aplicación que finalmente recibe **el usuario no necesita el servidor de desarrollo de Vite**.

::: errorbox
No debemos usar el servidor de Vite para producción.
:::

# Crear proyecto Vue {#crear-proyecto-vue}



