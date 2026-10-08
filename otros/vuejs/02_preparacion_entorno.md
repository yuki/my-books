
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

Los proyectos JavaScript gestionados mediante npm utilizan normalmente un archivo denominado [package.json]{.configfile} que contiene información sobre el proyecto y, entre otras cosas, sus dependencias (con versión incluida) y los comandos disponibles.


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
    // ...
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

En el fichero se puede comprobar que para distintas dependencias aparece al lado una versión, que puede contener distintos caracteres. Existe una [documentación](https://semver.org/) sobre ello, pero en la siguiente tabla se resumen:


| Valor | Descripción |
| :-- | :----------------------- |
| [~version]{.verbatim} | Aproximadamente equivalente a la versión indicada; solo acepta nuevas versiones **patch**. Las versiones *patch* añaden «correcciones de errores compatibles hacia atrás» e incrementan el tercer dígito. Por ejemplo [~1.2.3]{.verbatim} incluye cualquier versión entre la [1.2.3]{.verbatim} y la [1.3.0]{.verbatim}. |
| [\^version]{.verbatim} | Compatible con la versión indicada; acepta nuevas versiones *minor* y *patch*. Las versiones *minor* añaden «nuevas funcionalidades compatibles hacia atrás», incrementan el dígito intermedio y reinician el último dígito a cero. Por ejemplo [\^3.5.40]{.verbatim} aceptaría hasta versiones menores a [4.0.0]{.verbatim} |
| [version]{.verbatim} | Debe coincidir exactamente con la versión indicada. |
| [>version]{.verbatim} | Debe ser superior a la versión indicada. |
| [>=version]{.verbatim} | Debe ser igual o superior a la versión indicada. |
| [<version]{.verbatim} | Debe ser inferior a la versión indicada. |
| [<=version]{.verbatim} | Debe ser igual o inferior a la versión indicada. |
| [1.2.x]{.verbatim} | Acepta 1.2.0, 1.2.1, etc., pero no 1.3.0. |
| [*]{.verbatim} | Coincide con cualquier versión. |
| [latest]{.verbatim} | Obtiene la última versión publicada. |


Table: {tablename=yukitblrcol colspec=X[1]X[4]}


## Instalación {#nodejs-instalación}

En la página web de [descarga de Node.js](https://nodejs.org/es/download/) podemos ver cómo instalar Node para distintas plataformas, de distintas formas, y podemos elegir distintas versiones y con distintos gestores de paquetes.

Es importante destacar que Node cuenta con tres tipos de versiones:

- **current**: es la versión más nueva actualmente.
- **LTS**: versión *long time support* o soporte a largo plazo.
- **EOL**: son las versiones *end of life*, cuya vida a finalizado y debería ser necesario actualizar de versión.

Uno de los métodos de instalación de Node más habituales es mediante [nvm]{.commandbox} o [Node Version Manager](https://www.nvmnode.com/), ya que permite tener distintas versiones instaladas en el mismo equipo.

En cambio, para este libro se ha decidido hacer uso de [mise]{.commandbox}, que está explicado en el [anexo adjunto]().


::: exercisebox
Instala [mise]{.commandbox} y realiza las siguientes tareas:

- Instala la última versión de Node.js
- Instala la versión LTS de Node.js
- Aprende a cambiar entre versiones
:::


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

A la hora de crear un proyecto Vue es habitual hacer uso de una herramienta para crear el "esqueleto" de la aplicación, de esta manera nos generará los ficheros principales necesarios y la jerarquía de directorios habitual.

Podemos usar Vue con un proyecto ya existente, y de esta manera ir añadiendo pequeños módulos a la aplicación, pero se va a explicar cómo crear un proyecto desde cero:


::: mycode
[Crear proyecto Vue]{.title}

``` console
ruben@archy:~$ npm create vue@latest
```
:::

Este comando nos hará distintas preguntas para así poder añadir distintas características extra a las opciones por defecto:

- **Nombre del proyecto**: nos creará un directorio con este nombre, y será el nombre de la aplicación.
- **Añadir TypeScript**: por defecto Vue se programa con JavaScript, por lo que si queremos añadir la opción de poder usar TypeScript, debemos seleccionar esta opción.
- **Soporte JSX**: añade soporte para "JavaScript XML", un sistema creado por [React](https://legacy.reactjs.org/docs/introducing-jsx.html).
- **Router**: el sistema de enrutado para crear *Single Page Applications*.
- **Pinia**: permite tener mejor control sobre estados. Es el sustituto de [Vuex](https://vuex.vuejs.org/) de versiones anteriores.
- **Vitest**: sistema de testing unitario.
- ***End-to-end testing***: permite testear una aplicación de varias páginas que usa peticiones de red.
- **Linter**: para analizar el código fuente a medida que escribimos.
- ***Prettier***: para formatear nuestro código.
- Características experimentales: podemos añadir nuevas características que no son estables.
- Añadir código de ejemplo.

De momento vamos a seleccionar **NO** menos a ***Linter*** y ***Prettier***.


## Instalar dependencias {#instalar-dependencias}

Tal como se ha dicho previamente, gracias a Node.js vamos a poder desarrollar y mediante [npm]{.verbatim} controlar las distintas dependencias de nuestro proyecto, ya que es un gestor de paquetes.

Tras crear el proyecto en el paso anterior, se nos ha generado distintos ficheros, entre los que se encuentra [package.json]{.configfile} que contiene las dependencias que necesita nuestro proyecto.

::: warnbox
Todavía no hemos instalado las dependencias.
:::

Para que podamos desarrollar en nuestro proyecto, y posteriormente ponerlo en producción, necesitamos instalar las dependencias que aparecen en el fichero. Para ello debemos entrar al directorio de nuestro proyecto e instalar las dependencias:

::: mycode
[Instalar dependencias]{.title}

``` console
ruben@archy:~$ cd vue-project
ruben@archy:~/vue-project/ $ npm install
```
:::

[npm]{.verbatim} leerá la información de [package.json]{.configfile} e instalará las dependencias que ahí aparecen y la versión correspondiente.  Estas dependencias se instalan dentro del directorio [node_modules]{.configdir} en nuestro proyecto. Este directorio puede ocupar bastante espacio y contiene código que normalmente no debemos modificar directamente.

::: errorbox
El directorio [node_modules]{.configdir} está excluido del proyecto GIT, y no debería ser incluido nunca.
:::


## Estructura del proyecto {#estructura-proyecto}

Una vez creado el proyecto e instalado las dependencias encontraremos diferentes archivos y directorios. No todos los proyectos tendrán exactamente la misma estructura, ya que podemos modificarla según nuestras necesidades, pero en todos ellos nos encontraremos con lo siguiente:

- [index.html]{.configfile}: Aunque Vue permite construir la interfaz mediante componentes, sigue existiendo un documento HTML inicial. La parte importante de este documento será similar al siguiente, que es donde se monta la aplicación:

  ::: mycode
  [Elemento de montaje]{.title}

  ``` html
<div id="app"></div>
  ```
  :::

- [node_modules]{.configdir}: directorio donde se guardan las dependencias instaladas. Este directorio puede ocupar bastante espacio y contiene código que normalmente no debemos modificar directamente.
- [package-lock.json]{.configfile}: tras realizar la instalación de dependencias este fichero **registra las versiones concretas de las dependencias instaladas** y de sus dependencias internas. Su objetivo principal es conseguir que diferentes instalaciones del mismo proyecto utilicen versiones compatibles y reproducibles de los paquetes.
- [public]{.configdir}: puede utilizarse para almacenar recursos estáticos que deban estar disponibles directamente. Estos recursos no tienen por qué pasar por el mismo proceso que los recursos gestionados dentro de [src]{.configdir}.
- [src]{.configdir}: este directorio contiene el código fuente de nuestra aplicación, lo que lo hace el directorio más importante del proyecto. En él encontraremos los componentes Vue, los archivos JavaScript, las hojas de estilo y otros recursos utilizados por nuestra aplicación.
  - [App.vue]{.configfile}: suele actuar como componente principal de la aplicación. Más adelante veremos que [App.vue]{.configfile} no tiene por qué contener toda la aplicación. Su función será normalmente coordinar otros componentes.
  - [assets]{.configdir}: se utiliza habitualmente para recursos que forman parte del código de la aplicación como imágenes, hojas de estilo generales u otros recursos estáticos. A diferencia de [public]{configdir}, estos recursos pueden ser procesados por las herramientas de construcción.
  - [components]{.configdir}: se utiliza normalmente para almacenar componentes Vue reutilizables. No es obligatorio utilizar exactamente esta estructura, pero es una organización habitual. Podemos organizar también en subcarpetas si son componentes para formularios, productos, tablas, ...
  - [views]{.configdir}: una aplicación web puede tener distintas "vistas" (login, vista de productos, configuración, ...) que pueden contener distintos componentes.
  - [main.js]{.configfile}: es el punto de entrada habitual de una aplicación Vue. Es el archivo desde el que se crea la aplicación y se monta en el documento HTML. Primero importa el CSS, después [createApp]{.verbatim} desde Vue, y por último el componente raíz [App.vue]{.verbatim}. El último paso es crear la aplicación y la monta sobre el elemento HTML cuyo identificador es [app]{.verbatim}.

    ::: mycode
    [Fichero main.js]{.title}

    ```python
    import './assets/main.css'

    import { createApp } from 'vue'
    import App from './App.vue'

    createApp(App).mount('#app')
    ```
    :::

    Este código realiza varias operaciones:
      - Importa el código CSS global.
      - importa [createApp]{.verbatim} desde Vue.


## Servidor de desarrollo {#servidor-desarrollo}

Una vez creado el proyecto podemos iniciar el servidor mediante:

::: {.mycode size=footnotesize}
[Arrancar servidor de desarrollo]{.title}

``` console
ruben@archy:~$ npm run dev
  VITE v8.3.0  ready in 303 ms
  ⇒  Local:   http://localhost:5173/
  ⇒  Network: use --host to expose
  ⇒  Vue DevTools: Open http://localhost:5173/__devtools__/ as a separate window
  ⇒  Vue DevTools: Press Alt(⌥)+Shift(⇧)+D in App to toggle the Vue DevTools
  ⇒  press h + enter to show help
```
:::

Este comando ejecuta uno de los scripts definidos en [package.json]{.configfile}. En el proyecto que acabamos crear, debido a las opciones seleccionadas, tenemos las siguientes opciones:

::: mycode
[Scripts en la configuración]{.title}

``` json
  "scripts": {
    "dev": "vite",
    "build": "vite build",
    "preview": "vite preview",
    "lint": "run-s \"lint:*\"",
    "lint:oxlint": "oxlint . --fix",
    "lint:eslint": "eslint . --fix --cache",
    "format": "prettier --write --experimental-cli src/"
  },
```
:::

Al ejecutar [npm run dev]{.commandbox} podemos ver que el comando que ejecuta por debajo es [vite]{.verbatim}, y viendo la salida del comando nos indica que que tenemos dos URLs a las que poder acceder:

- [http://localhost:5173/](http://localhost:5173/): es la dirección *localhost* y el puerto por defecto donde vamos a poder ver nuestra aplicación.
- [http://localhost:5173/__devtools__/](http://localhost:5173/__devtools__/): si abrimos esta URL en una nueva ventana podemos acceder a las herramientas de desarrollo.

Gracias a [vite]{.verbatim} como servidor de desarrollo, **mientras esté funcionando**, podremos modificar nuestros archivos y comprobar los cambios desde el navegador.

::: infobox
Con el servidor arrancado, si modificamos los ficheros aparecen los cambios en el navegador.
:::

Esto permite desarrollar de forma mucho más rápida que teniendo que detener y volver a iniciar manualmente todo el proceso después de cada modificación.

Es importante entender que el servidor lo estamos ejecutando "a mano", no es un servicio de nuestro sistema operativo, por lo que si reiniciamos (o incluso cerramos sesión), tendremos que volver a arrancar el servicio.

::: warnbox
Si reiniciamos nuestro equipo tendremos que volver a levantar el servidor.
:::


## Vue DevTools {#vue-devtools}

Además de las herramientas generales del navegador, Vue dispone de una herramienta específica denominada **Vue DevTools**, que permite inspeccionar aplicaciones Vue y proporciona información específica sobre sus componentes y estado reactivo. Entre otras posibilidades, permite:

- Examinar el árbol de componentes.
- Seleccionar componentes.
- Inspeccionar sus datos.
- Analizar props.
- Analizar eventos.
- Inspeccionar el estado.
- Facilitar la depuración.

La herramienta resulta especialmente útil cuando las aplicaciones comienzan a tener muchos componentes.

![Vue DeveloperTools](img/vuejs/developertools.png){framed=true width="75%"}


## Desarrollo con Visual Studio Code {#desarrollo-vscode}

Al crear el proyecto el asistente automático ha creado un directorio [.vscode]{.configdir} que es el utilizado para añadir configuración propia para el IDE Visual Studio Code.

Este directorio no es obligatorio, y se podría llegar a borrar, pero nos añade información si usamos este editor. En el directorio nos encontramos con dos ficheros:

- [extensions.json]{.configfile}: configuración de extensiones recomendadas. Al abrir por primera vez el proyecto, si no tenemos las extensiones instaladas el editor nos preguntará si queremos instalarlas.
- [settings.json]{.configfile}: Son configuraciones propias del editor para los proyectos. Por ejemplo, mezcla varios ficheros de configuración en la jerarquía como si [package.json]{.configfile} fuese un directorio.

::: infobox
Podemos usar cualquier otro editor, pero la integración con VSCode viene por defecto.
:::


::: exercisebox
[[01](https://github.com/yuki/ejercicios/tree/main/daw/dec/vue/01)]{.solution}

Crea un proyecto Vue con las opciones indicadas arriba y realiza las siguientes tareas:

1. Instala las dependencias.
2. Levanta el servidor
3. Cambia el título del HTML
4. Busca el fichero [App.vue]{.configfile} y analiza las distintas partes de las que consta.
5. Modifica el fichero de [App.vue]{.configfile} y comprueba el cambio.
6. Modifica el componente [HelloWorld.vue]{.configfile} y comprueba el cambio.
:::

::: exercisebox
[[02](https://github.com/yuki/ejercicios/tree/main/daw/dec/vue/02)]{.solution}

Crea un proyecto Vue con las opciones indicadas arriba, pero sin código de ejemplo. Será el que usemos más adelante.
:::


