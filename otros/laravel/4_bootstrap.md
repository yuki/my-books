
# Instalar dependencias {#instalar-dependencias}

Laravel tenía soporte nativo de Bootstrap, pero decidió sustituirlo por [Tailwind](https://tailwindcss.com/). Eso no quita que podamos usar Bootstrap, pero necesitaremos realizar la instalación de dependencias.

::: mycode
[Para usar Bootstrap con Laravel]{.title}
``` console
root@1b29e46c10ae:/var/www/html# composer require laravel/ui --dev
root@1b29e46c10ae:/var/www/html# php artisan ui bootstrap --auth
root@1b29e46c10ae:/var/www/html# npm install
root@1b29e46c10ae:/var/www/html# npm run build
```
:::

A continuación se detalla qué hace cada comando:

-   [composer require laravel/ui \-\-dev]{.commandbox}: [Composer](https://getcomposer.org/) es el gestor de dependencias utilizado por PHP. Lo que se está indicando es que se necesita como dependencia el paquete "laravel/ui" durante el desarrollo.

-   [php artisan ui bootstrap \-\-auth]{.commandbox}: Se indica qué *framework* para el interfaz se va a utilizar. Aparte, con el parámetro "--auth" se le indica que genera las plantillas para la autenticación.

-   [npm install]{.commandbox}: instala las dependencias indicadas en el primer comando.

-   [npm run build]{.commandbox}: ejecuta la acción "build" indicada en el fichero [package.json]{.configfile}. En este caso "compila" los javascripts y los css que se van a utilizar. Más adelante hablamos de ello.

De esta manera no sólo hemos instalado las dependencias necesarias para hacer uso de Bootstrap, si no que también nos ha generado unas vistas para el sistema de autenticación en [resources/views/auth]{.configdir} y una plantilla general para la aplicación.

# Plantilla general {#plantilla-general}

Anteriormente se ha mencionado que Blade es un sistema de plantillas para Laravel. Esto significa que es capaz de generar unos componentes de vistas que a su vez incorporan otras vistas, de esta manera generando plantillas que se pueden reutilizar ahorrando código y simplificando la aplicación.

Con lo realizado previamente se ha generado una plantilla general en el fichero [resources/views/layouts/app.blade.php]{.configfile}, que se puede dividir en dos apartados:

-   **Cabecera "nav"**: es la cabecera de la aplicación. Aparece el nombre de la aplicación y a la derecha tiene enlaces para hacer login o registrarse en la aplicación con el sistema de autenticación.

-   [@yield('content')]{.inlineconsole}: este apartado será sustituido por la vista desde la que se llame a esta plantilla.

De esta manera, en todas las vistas de la aplicación que llamemos a la plantilla, no tendremos que escribir el código de la cabecera. Lógicamente, **es posible añadir nuevos apartados a esta vista** para cumplir con el objetivo final de la aplicación.

## Cómo usar la plantilla {#cómo-usar-la-plantilla}

Para poder hacer uso de la plantilla, debemos indicarlo en las correspondientes vistas. Como ejemplo, se va a utilizar la vista creada en el capítulo anterior, la que muestra por pantalla los *posts* del blog.

La vista modificada quedaría:

::: mycode
[Vista "show.blade.php" modificada usando la plantilla]{.title}
``` html+smarty
@extends('layouts.app')

@section('content')
<div class="container">
  <h1>{{$post->titulo}}</h1>
  <p>Creado el {{$post->created_at}}</p>
  <p>{{$post->texto}}</p>
</div>
@endsection
```
:::

Tal como se puede ver, lo primero que se indica es que esta vista "extiende" de una plantilla concreta. Después se indica la sección de la plantilla que va a ser sustituida por el contenido que aparece entre "\@section" y "\@endsection", que en este caso es la que corresponde al [@yield('content')]{.inlineconsole} que hemos visto previamente.

# Modificación de rutas {#modificación-de-rutas}

Aparte de lo visto hasta ahora, por haber activado el sistema de autenticación, se nos han generado nuevas rutas. Estas rutas las podemos ver a través del siguiente comando, o mirando el fichero de rutas:

::: mycode
[Mirando todas las rutas creadas]{.title}
``` console
root@1b29e46c10ae:/var/www/html# php artisan route:list
```
:::

# Añadir CSS o Javascript propio {#añadir-css-o-javascript-propio}

Si miramos la plantilla general [resources/views/layouts/app.blade.php]{.configfile} que se nos ha creado, podemos ver que en la cabecera hay un apartado de scripts:

::: mycode
[Plantilla "resources/views/layouts/app.blade.php"]{.title}
``` html+smarty
<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
  <head>
  <!-- ... -->
  <!-- Scripts -->
  @vite(['resources/sass/app.scss', 'resources/js/app.js'])
</head>
```
:::

En las nuevas versiones de Laravel se hace uso de [Vite](https://vitejs.dev/), que es un sistema que "compila" el css y el javascript para minimizarlo. Esta configuración de la plantilla en el HTML generado queda como unos links de CSS y Javascript al directorio [public/]{.configdir}.

::: infobox
Vite es un sistema que "minimiza" el CSS y Javascript que necesitamos.
:::

El problema es que si realizamos cualquier modificación del CSS o Javascript, tendríamos que "compilar" para poder ver el efecto. Para evitar esto, Vite puede levantar un pequeño servicio que nos mostrará los cambios en tiempo real.

## Configuración de Vite {#configuración-de-vite}

La configuración de Vite por defecto hace uso del sistema [Sass](https://es.wikipedia.org/wiki/Sass), que es un metalenguaje para escribir CSS pero que nos permite el uso de variables, anidamientos estilo herencia, \... Dado que vamos a querer usar CSS, podemos hacer un "include" del fichero [resources/css/app.css]{.configfile} en la configuración [resources/sass/app.sass]{.configfile}:

::: mycode
[Configurando "resources/sass/app.sass"]{.title}
``` sass
// Fonts
@import url('https://fonts.bunny.net/css?family=Nunito');
// Variables
@import 'variables';
// Bootstrap
@import 'bootstrap/scss/bootstrap';
// Custom CSS
@import '../css/app.css';
```
:::

## Estilos propios sobre Bootstrap {#estilos-propios-sobre-bootstrap}

Los estilos de Bootstrap están creados para que por defecto siempre prevalezcan sobre el resto de estilos, y por cómo funciona el [sistema en cascada de CSS](https://css-tricks.com/specifics-on-css-specificity/), lo debemos tener en cuenta para añadir nuestros estilos.

No es buena idea hacer uso del sistema "!important" en CSS, por lo que para añadir más puntuación a nuestros estilos, la idea es añadir al "\<body\>" de nuestro HTML un ID y después en nuestra hoja de estilos hacer uso de ese ID para cada elemento que queramos modificar el estilo.

Por lo tanto, la plantilla general [resources/views/layouts/app.blade.php]{.configfile} podría quedar tal que:

::: mycode
[Plantilla "resources/views/layouts/app.blade.php"]{.title}
``` html+smarty
...
<body id="mis-estilos">
    ...
</body>
...
```
:::

Y en el fichero [resources/css/app.css]{.configfile}, donde pondremos nuestros estilos, deberían ir precedidos del ID. Por ejemplo, para tener un color propio en los elementos "h1":

::: mycode
[Fichero "resources/css/app.css"]{.title}
```css
#mis-estilos h1{
    color: red;
}
```
:::

Ahora sólo queda levantar el servicio Vite o realizar la compilación para que surja efecto el cambio.

## Cómo usar Vite {#cómo-usar-vite}

Para hacer funcionar los CSS o Javascript propios que hemos podido añadir en los ficheros [resources/css/app.css]{.configfile} o [resources/js/app.js]{.configfile} se puede hacer de dos maneras:

-   **Levantando un servicio**: los cambios se verán automáticamente a medida que los realizamos.

    ::: errorbox
    Este sistema sólo se debería usar durante el desarrollo de la aplicación.
    :::

-   **Generando** los ficheros finales: el método que minimiza y "compila" los ficheros y los deja en el directorio [public/build]{.configdir}.

Por defecto, haremos uso de la primera opción durante el desarrollo, mientras que el segundo método es para la puesta en producción, por lo que es importante recordar ejecutar el comando que veremos más adelante.

### Servicio Vite {#servicio-vite}

Durante el desarrollo el mejor método es hacer uso del servicio Vite, que podemos levantar dentro del contenedor. Este método levantará el servicio en el puerto 5173 y modificará la plantilla para que haga uso de ello.

Para levantar el servicio, desde la raiz de la aplicación, se ejecutará:

::: mycode
[Levantar servicio Vite]{.title}
``` console
root@1b29e46c10ae:/var/www/html# npm run dev
> dev
> vite

VITE v5.4.10  ready in 178 ms
->  Local:   http://localhost:5173/
->  Network: http://192.168.144.2:5173/
->  press h to show help

LARAVEL v11.29.0  plugin v1.0.5
->  APP_URL: http://localhost
```
:::

Si miramos el código del HTML generado en la plantilla, veremos cómo se hace referencia a ese puerto:

::: {.mycode size=small}
[Código HTML de la web]{.title}
``` HTML
<!-- Scripts -->
<script type="module" src="http://localhost:5173/@vite/client"></script>
<link rel="stylesheet" href="http://localhost:5173/resources/sass/app.scss" />
<script type="module" src="http://localhost:5173/resources/js/app.js">
</script>
```
:::

### Generar ficheros para producción {#generar-ficheros-para-producción}

El comando que vamos a especificar a continuación ya lo hemos ejecutado durante la puesta en marcha de Bootstrap, al inicio de este capítulo:

::: mycode
[Levantar servicio Vite]{.title}
```console
root@1b29e46c10ae:/var/www/html# npm run build
> build
> vite build

vite v5.4.10 building for production...
✓ 111 modules transformed.
public/build/manifest.json              0.26 kB │ gzip:  0.14 kB
public/build/assets/app-48669401.css  225.72 kB │ gzip: 30.77 kB
public/build/assets/app-c75e0372.js   111.35 kB │ gzip: 36.20 kB
✓ built in 3.58s
```
:::

Tal como se puede ver, este comando ha realizado la generación de los assets dentro del directorio [public/build]{.configdir} que son utilizados en la plantilla, que se puede ver al inspeccionar el código HTML generado.

