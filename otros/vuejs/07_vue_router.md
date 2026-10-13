
# Introducción a las aplicaciones SPA {#introducción-aplicaciones-spa}

En las aplicaciones web tradicionales, cada página suele estar asociada a una URL diferente. Cuando el usuario pulsa un enlace, el navegador solicita una nueva página al servidor y carga el documento correspondiente.

Sin embargo, muchas aplicaciones web modernas utilizan una arquitectura denominada **SPA (*Single Page Application*)**. En este tipo de aplicaciones, gran parte de la navegación se realiza sin recargar completamente el documento HTML. Es decir, carga inicialmente un documento HTML y modifica posteriormente su contenido mediante JavaScript, sin necesidad de solicitar un documento HTML completo cada vez que el usuario cambia de vista.

**[Vue Router](https://router.vuejs.org/)** es la solución oficial de enrutamiento para Vue. **Permite asociar diferentes URL con componentes**, gestionar la navegación y construir aplicaciones con múltiples vistas utilizando Vue 3.


Imaginemos una aplicación de gestión de productos con las siguientes direcciones:

- [/]{.verbatim} página principal.
- [/productos]{.verbatim}: listado de productos.
- [/productos/15]{.verbatim}: detalles del producto con identificador 15.
- [/configuracion]{.verbatim} configuración de la aplicación.

En una aplicación tradicional, cada URL podría corresponder a un documento HTML diferente generado por el servidor. En cambio, en una SPA desarrollada con Vue, el enrutamiento permite relacionar una dirección URL con una vista o un comportamiento de la aplicación.

Siguiendo con el ejemplo anterior, al acceder a [/productos]{.verbatim}, Vue Router puede seleccionar el componente [ListaProductos.vue]{.verbatim} y mostrarlo dentro de la estructura principal de la aplicación. Y cuando el usuario navegue a [/configuracion]{.verbatim}, Vue Router selecciona otro componente sin necesidad de recargar toda la página.


## Ventajas y limitaciones de una SPA {#ventajas-spa}

A la hora de crear una aplicación SPA, podemos destacar las siguientes ventajas:

- La navegación puede resultar más fluida.
- Se pueden reutilizar componentes y estructuras comunes.
- Es posible mantener parte del estado de la aplicación durante la navegación.
- La interfaz puede actualizarse sin recargar el documento completo.
- Facilita la creación de aplicaciones interactivas y complejas.

En lo referente a las limitaciones, se pueden comentar las siguientes:

- El navegador necesita descargar y ejecutar JavaScript.
- Una aplicación mal optimizada puede tardar en mostrar su contenido inicial.
- La navegación directa a una URL puede requerir configuración específica en el servidor.
- El posicionamiento en buscadores depende de la arquitectura y de cómo se genere y entregue el contenido.
- El desarrollador debe gestionar correctamente los estados, las rutas y los errores de navegación.

Una SPA no implica necesariamente que toda la aplicación deba ejecutarse exclusivamente en el navegador. Existen otras arquitecturas, como la generación estática y la representación en servidor, que pueden combinarse con tecnologías del ecosistema Vue.


# Instalación de Vue Router {#instalación-vue-router}

En los proyectos Vue 3 creados con el asistente, podemos elegir si queremos instalar Vue Router como una dependencia del proyecto, por lo que si creamos un proyecto desde cero, los pasos explicados a continuación no serían necesarios.

Si queremos instalarlo en un proyecto existente, desde una terminal, dentro de la carpeta del proyecto, ejecutamos:

::: mycode
[Composition API]{.title}

``` console
ruben@archy:~/proyecto/ $ npm install vue-router
```
:::

Este comando descarga el paquete y lo incorpora a las dependencias del proyecto. Podemos comprobar su incorporación en el archivo [package.json]{.configfile}. Una vez instalado, podremos importar las funciones y los componentes proporcionados por Vue Router.

Entre los elementos más importantes se encuentran:

- [createRouter()]{.verbatim}: crea la instancia del enrutador.
- [createWebHistory()]{.verbatim}: permite utilizar el historial del navegador con URL convencionales.
- [RouterView]{.verbatim}: indica dónde se muestra el componente asociado a la ruta actual.
- [RouterLink]{.verbatim}: crea enlaces de navegación.
- [useRouter()]{.verbatim}: permite acceder al enrutador desde la lógica de un componente.
- [useRoute()]{.verbatim}: permite consultar la ruta actual.

En los siguientes apartados veremos cómo se utiliza cada uno de estos elementos.

## Configuración del router {#configuración-router}

Una práctica habitual consiste en crear una carpeta [router]{.configdir} y guardar en ella la configuración de las rutas. La estructura inicial del proyecto podría quedar de la siguiente manera:

::: mycode
[Estructura del proyecto]{.title}

``` text
src/
├── assets/
├── components/
├── views/
│   ├── InicioView.vue
│   ├── ProductosView.vue
│   └── ConfiguracionView.vue
├── router/
│   └── index.js
├── App.vue
└── main.js
```
:::

La carpeta [views]{.verbatim} suele utilizarse para almacenar los componentes que representan páginas o vistas completas. La carpeta [components]{.verbatim} suele contener componentes reutilizables de menor alcance.

Esta organización es una convención, no una obligación de Vue, pero en un proyecto creado con el asistene es la organización por defecto.


## Crear el archivo de rutas {#crear-archivo-rutas}

El fichero donde se guardan las rutas es [src/router/index.js]{.configfile}, y una configuración básica sería la siguiente (puede ser diferente al generado por el asistente):


::: mycode
[Fichero de rutas]{.title}

``` javascript
import { createRouter, createWebHistory } from 'vue-router'

import InicioView from '../views/InicioView.vue'
import ProductosView from '../views/ProductosView.vue'
import ConfiguracionView from '../views/ConfiguracionView.vue'

const routes = [
  {
    path: '/',
    component: InicioView
  },
  {
    path: '/productos',
    component: ProductosView
  },
  {
    path: '/configuracion',
    component: ConfiguracionView
  }
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

export default router
```
:::

Vamos a analizar las partes principales del fichero:

- **[import]{.verbatim}**: Es necesario importar dos funciones de [vue-router]{.verbatim} que se utilizarán después. Aparte, también se importan las distintas vistas que se pueden acceder a través de distintas URLs.
- **[routes]{.verbatim}**: Es un array de objetos. Cada objeto describe una ruta y el componente que debe mostrarse cuando la URL coincide con ella.
- **[createRouter()]{.verbatim}**: Crea la instancia del enrutador. Recibe un objeto de configuración que contiene, entre otras propiedades, el sistema de historial y las rutas.
- **[createWebHistory()]{.verbatim}**: Permite utilizar URL convencionales, como [/productos]{.verbatim}, en lugar de depender de direcciones con el formato [/#/productos]{.verbatim} (utilizadas en aplicaciones javascript puras para no necesitar recargar la página).
  Este sistema utiliza la API de historial del navegador. Por ello, el servidor debe estar configurado para devolver la aplicación cuando se soliciten directamente las rutas que administra Vue Router.
- **[export default router]{.verbatim}**: Exporta la instancia del enrutador para que pueda incorporarse a la aplicación.


# Incorporar el router a la aplicación {#incorporar-router-aplicación}

Crear la configuración de las rutas no es suficiente. También debemos registrar el enrutador en la aplicación Vue. Para ello modificamos [src/main.js]{.configfile}.

::: mycode
[Fichero de rutas]{.title}

``` javascript
import { createApp } from 'vue'
import App from './App.vue'
import router from './router'

import './assets/main.css'

createApp(App)
  .use(router)
  .mount('#app')
```
:::

La instrucción [.use(router)]{.verbatim} registra Vue Router como un complemento de la aplicación. A partir de ese momento, Vue Router estará disponible para gestionar la navegación y proporcionar sus componentes y funciones.

## Mostrar las vistas mediante [RouterView]{.verbatim} {#mostrar-vistas-mediante-routerview}

Ahora debemos indicar dónde queremos mostrar el componente correspondiente a la ruta actual. Para ello utilizamos [RouterView]{.verbatim} en [App.vue]{.configfile}.

::: mycode
[Fichero App.vue]{.title}

``` vue
<template>
  <header>
    <h1>Mi aplicación Vue</h1>
  </header>

  <main>
    <RouterView />
  </main>
</template>
```
:::

[RouterView]{.verbatim} es un componente de Vue Router. Su función consiste en representar el componente asociado a la ruta actual. Si el navegador se encuentra en [/productos]{.verbatim}, se mostrará [ProductosView]{.verbatim} y cuando se accede a [/configuracion]{.verbatim}, se mostrará [ConfiguracionView]{.verbatim}.

::: infobox
Podemos entender [RouterView]{.verbatim} como el espacio de la interfaz reservado para la vista que corresponde a la URL actual.
:::


# [RouterLink]{.verbatim} {#routerlink}

Para navegar entre las rutas, Vue Router proporciona el componente [RouterLink]{.verbatim}, aunque podríamos utilizar enlaces HTML convencionales. [RouterLink]{.verbatim} está diseñado específicamente para la navegación dentro de una aplicación Vue Router.

Por ejemplo, podemos modificar [App.vue]{.configfile}:

::: mycode
[Fichero App.vue]{.title}

``` vue
<template>
  <header>
    <h1>Mi aplicación Vue</h1>

    <nav>
      <RouterLink to="/">Inicio</RouterLink>
      <RouterLink to="/productos">Productos</RouterLink>
      <RouterLink to="/configuracion">Configuración</RouterLink>
    </nav>
  </header>

  <main>
    <RouterView />
  </main>
</template>
```
:::

Cuando el usuario pulsa uno de estos enlaces, Vue Router actualiza la navegación y muestra la vista correspondiente sin recargar completamente el documento.

## El atributo [to]{.verbatim} {#atributo-to}

El atributo [to]{.verbatim} indica el destino del enlace. 


:::::::::::::: {.columns }
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[Atributo "to"]{.title}

``` vue
<RouterLink to="/productos">
  Ver productos
</RouterLink>
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[Atributo ":to"]{.title}

``` vue
<RouterLink :to="rutaDestino">
  Ir a la sección
</RouterLink>
```
:::

:::
::::::::::::::


También podemos utilizar una expresión JavaScript mediante [:to]{.verbatim}, y de esta manera la variable [rutaDestino]{.verbatim} debe contener una dirección válida o un objeto de localización admitido por Vue Router.


## Estilos para el enlace activo {#estilos-enlace-activo}

Vue Router aplica clases CSS a los enlaces que coinciden con la ruta actual. Entre ellas se encuentran:

- [router-link-active]{.verbatim}: indica que el enlace coincide con la ruta actual según las reglas de coincidencia de Vue Router
- [router-link-exact-active]{.verbatim}: identifica una coincidencia exacta de la ruta, teniendo en cuenta los parámetros relevantes

Podemos utilizar estas clases CSS para destacar el enlace correspondiente a la vista actual:


::: mycode
[Clases CSS]{.title}

``` css
nav {
  display: flex;
  gap: 16px;
}

nav a {
  color: #444;
  text-decoration: none;
}

nav a.router-link-active {
  color: royalblue;
  font-weight: bold;
}

nav a.router-link-exact-active {
  text-decoration: underline;
}
```
:::

De esta forma, el usuario puede identificar en qué sección se encuentra.


# Navegación mediante código {#navegación-mediante-código}

Además de navegar pulsando enlaces, podemos cambiar de ruta desde la lógica JavaScript de un componente. Por ejemplo, después de guardar un formulario podemos redirigir al usuario a la página de productos. Para ello utilizamos [useRouter()]{.verbatim}.


::: mycode
[Navegación mediante código]{.title}

``` vue
<script setup>
import { useRouter } from 'vue-router'

const router = useRouter()

function irAProductos() {
  router.push('/productos')
}
</script>

<template>
  <button @click="irAProductos">
    Ver productos
  </button>
</template>
```
:::

La función [useRouter()]{.verbatim} devuelve la instancia del enrutador asociada a la aplicación. El método [push()]{.verbatim} navega hacia una nueva ubicación y añade una entrada al historial del navegador.


## [push()]{.verbatim} frente a [replace()]{.verbatim}

Vue Router proporciona diferentes métodos para cambiar de ruta.

| Método | Comportamiento |
|---|---|
| [router.push()]{.verbatim} | Navega a una nueva ruta y añade una entrada al historial |
| [router.replace()]{.verbatim} | Sustituye la entrada actual del historial. El usuario no podrá volver mediante el botón del navegador a la ruta que acabamos de sustituir. |
| [router.back()]{.verbatim} | Retrocede a la entrada anterior del historial |
| [router.forward()]{.verbatim} | Avanza a la siguiente entrada del historial |
| [router.go(n)]{.verbatim} | Avanza o retrocede un número de entradas |

Table: {tablename=yukitblr colspec=X[2]X[5,l]}

## Navegación después de una operación

Imaginemos que el usuario crea un producto:

::: mycode
[Navegación mediante código]{.title}

``` javascript
async function guardarProducto() {
  // Guardar el producto mediante una API.

  router.push('/productos')
}
```
:::

En una aplicación real, la navegación debería producirse después de comprobar que el guardado ha terminado correctamente. Si la operación falla, normalmente mostraremos un mensaje de error en lugar de abandonar el formulario.


# Parámetros de ruta {#parámetros-ruta}

Es habitual en aplicaciones de gestión que necesitemos que una ruta incluya información variable. Por ejemplo, cada producto puede tener un identificador diferente y para acceder a ellos se usa la URL [/productos/10]{.verbatim}, donde 10 es el identificador único.

No tendría sentido crear una ruta independiente para cada producto, y por eso Vue Router permite definir parámetros dinámicos. En [src/router/index.js]{.configfile} podemos añadir:

::: mycode
[Añadir ruta con identificador]{.title}

``` javascript
{
  path: '/productos/:id',
  component: ProductoDetalleView
}
```
:::

El fragmento [:id]{.verbatim} indica que la ruta contiene un parámetro dinámico llamado [id]{.verbatim}. 

## Recuperar el parámetro {#recuperar-parámetro}

Para obtener el identificador tenemos que utilizar [useRoute()]{.verbatim} en el componente que lo necesitemos. Por ejemplo, en [ProductoDetalleView.vue]{.verbatim}:

::: mycode
[Recuperar parámetro]{.title}

```vue
<script setup>
import { computed } from 'vue'
import { useRoute } from 'vue-router'

const route = useRoute()

const idProducto = computed(() => route.params.id)
</script>

<template>
  <h1>Detalle del producto</h1>
  <p>Identificador: {{ idProducto }}</p>
</template>
```
:::

Si la URL es [/productos/15]{.verbatim}, el parámetro [route.params.id]{.verbatim} contendrá el valor ["15"]{.verbatim}. Debemos tener en cuenta que los parámetros de ruta suelen recibirse como cadenas de texto. Si necesitamos realizar operaciones numéricas, debemos convertirlos y validar el resultado.

::: mycode
[Recuperar parámetro]{.title}

```javascript
const id = Number(route.params.id)

if (!Number.isInteger(id) || id <= 0) {
  // Gestionar el identificador no válido.
}
```
:::



# Parámetros de consulta {#parámetros-consulta}

Las URL también pueden contener parámetros de consulta, situados después del carácter [?]{.verbatim}, por ejemplo [/productos?categoria=informatica&orden=precio]{.verbatim}. En esta dirección encontramos dos parámetros:

- [categoria]{.verbatim}: tiene el valor "informatica".
- [orden]{.verbatim}: tiene el valor "precio".

Estos parámetros suelen utilizarse para filtros, búsquedas, paginación y ordenación.

A diferencia de los parámetros de ruta, los parámetros de consulta no suelen identificar la estructura principal del recurso, sino opciones relacionadas con la vista.

## Recuperar los parámetros

Podemos utilizar [useRoute()]{.verbatim} para consultar [route.query]{.verbatim}.

::: mycode
[Recuperar parámetro]{.title}

``` vue
<script setup>
import { computed } from 'vue'
import { useRoute } from 'vue-router'

const route = useRoute()

const categoria = computed(() => route.query.categoria)
const orden = computed(() => route.query.orden)
</script>

<template>
  <h1>Productos</h1>

  <p>Categoría: {{ categoria }}</p>
  <p>Orden: {{ orden }}</p>
</template>
```
:::

::: warnbox
Hay que recordar que un parámetro de consulta puede no existir o aparecer varias veces. Por ello, no debemos asumir siempre que su valor será una única cadena.
:::

## Navegar con parámetros de consulta {#navegar-con-parámetros-consulta}

Podemos construir la navegación mediante un objeto:

::: mycode
[Crear URL con parámetros]{.title}

``` javascript
router.push({
  path: '/productos',
  query: {
    categoria: 'informatica',
    orden: 'precio'
  }
})
```
:::

Vue Router generará una URL equivalente a: [/productos?categoria=informatica&orden=precio]{.verbatim}. También podemos combinar la navegación mediante nombre de ruta y parámetros, como veremos más adelante.


## ¿Por qué utilizar parámetros de consulta? {#por-qué-utilizar-parámetros-consulta}

Los parámetros de consulta ofrecen varias ventajas:

- Permiten compartir una búsqueda mediante una URL.
- Facilitan recuperar los filtros al recargar la página.
- Permiten utilizar los botones atrás y adelante del navegador para recuperar estados de navegación.
- Facilitan enlazar directamente a una vista con determinadas opciones.

Si el usuario selecciona una categoría y ordena los productos por precio, reflejar estas opciones en la URL puede hacer que la aplicación resulte más predecible.



# Rutas anidadas {#rutas-anidadas}

Una aplicación puede tener vistas formadas por varias secciones relacionadas. Por ejemplo, una zona de administración podría incluir:

- Una página general.
- Una sección de usuarios.
- Una sección de productos.
- Una sección de configuración.

Todas estas vistas estarían bajo la URL [/administracion]{.verbatim} y pueden compartir una estructura común, como una barra lateral y una cabecera. Las rutas anidadas permiten representar esta organización.

## Definir rutas anidadas {#definir-rutas-anidadas}

Dentro del fichero de rutas podemos crear nuevas rutas, donde **las rutas hijas utilizan rutas relativas**. Por ejemplo, la ruta hija [usuarios]{.verbatim} corresponde a [/administracion/usuarios]{.verbatim}.


::: mycode
[Crear URL con parámetros]{.title}

``` javascript
const routes = [
  {
    path: '/administracion',
    component: AdministracionView,
    children: [
      {
        path: '',
        component: ResumenAdminView
      },
      {
        path: 'usuarios',
        component: UsuariosView
      },
      {
        path: 'productos',
        component: ProductosAdminView
      }
    ]
  }
]
```
:::


La ruta hija con [path: '']{.verbatim} representa la vista predeterminada cuando se accede a [/administracion]{.verbatim}.

## Mostrar las rutas hijas {#mostrar-rutas-hijas}

El componente padre debe incluir un [RouterView]{.verbatim} adicional donde se mostrarán sus vistas hijas. Por ejemplo, en [AdministracionView.vue]{.verbatim}:

::: mycode
[AdministracionView.vue]{.title}

``` vue
<template>
  <div class="administracion">
    <aside>
      <nav>
        <RouterLink to="/administracion">Resumen</RouterLink>
        <RouterLink to="/administracion/usuarios">Usuarios</RouterLink>
        <RouterLink to="/administracion/productos">Productos</RouterLink>
      </nav>
    </aside>

    <main>
      <RouterView />
    </main>
  </div>
</template>
```
:::

El [RouterView]{.verbatim} de [App.vue]{.verbatim} mostrará [AdministracionView]{.verbatim}, y el  [RouterView]{.verbatim} de [AdministracionView.vue]{.verbatim} mostrará la vista hija correspondiente. La estructura resultante puede entenderse así:

::: mycode
[Estructura de las rutas]{.title}

``` text
App.vue
└── RouterView
    └── AdministracionView.vue
        ├── Menú lateral
        └── RouterView
            ├── ResumenAdminView.vue
            ├── UsuariosView.vue
            └── ProductosAdminView.vue
```
:::

Las rutas anidadas son especialmente útiles cuando diferentes páginas comparten una estructura visual.


# Rutas dinámicas y nombres de ruta {#rutas-dinámicas-nombres-rutas}

Hasta ahora hemos navegado utilizando directamente la URL, pero Vue Router permite asignar un nombre a cada ruta. Por ejemplo:

::: mycode
[Rutas con nombre]{.title}

``` javascript
const routes = [
  {
    path: '/',
    name: 'inicio',
    component: InicioView
  },
  {
    path: '/productos',
    name: 'productos',
    component: ProductosView
  },
  {
    path: '/productos/:id',
    name: 'producto-detalle',
    component: ProductoDetalleView
  }
]
```
:::

Los nombres de ruta permiten referirse a una ruta sin tener que escribir manualmente su URL.

## Navegar mediante el nombre {#mavegar-mediante-nombre}

Gracias a añadir nombres a las rutas, podemos utilizar [RouterLink]{.verbatim} de esta manera:


:::::::::::::: {.columns }
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[RouterLink con nombre]{.title}

``` vue
<RouterLink
  :to="{ name: 'productos' }">
  Productos
</RouterLink>
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[Nombre y atributos]{.title}

``` vue
<RouterLink
  :to="{
    name: 'producto-detalle',
    params: { id: 15 }
  }"
>
  Ver producto
</RouterLink>
```
:::

:::
::::::::::::::


Vue Router construirá la URL correspondiente, en el segundo ejemplo de esta manera [/productos/15]{.verbatim}. También podemos utilizar nombres de ruta desde JavaScript:

::: mycode
[Nombre y atributos]{.title}

``` javascript
router.push({
  name: 'producto-detalle',
  params: {
    id: 15
  }
})
```
:::

## Ventajas de utilizar nombres de ruta {#ventajas-nombre-rutas}

Cuando se usan nombres en las rutas podemos destacar las siguientes ventajas:

- Evitan repetir las URL en muchos componentes.
- Facilitan modificar las direcciones sin tener que cambiar todos los enlaces.
- Permiten generar URL a partir de parámetros.
- Hacen más explícita la intención de la navegación.


::: infobox
Cuando una aplicación tiene muchas rutas, utilizar nombres descriptivos suele facilitar el mantenimiento del código.
:::


# Redirecciones y rutas no encontradas {#redirecciones-rutas-no-encontradas}

En una aplicación real, el usuario puede introducir una dirección incorrecta o acceder a una ruta que ya no existe, o también podemos necesitar redirigir una ruta antigua a otra nueva. Vue Router permite definir ambos comportamientos.


## Redirecciones {#redirecciones}

Para generar una redirección tenemos el siguiente ejemplo:

:::::::::::::: {.columns }
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[Redirección]{.title}

``` javascript
const routes = [
  {
    path: '/inicio',
    redirect: '/'
  }
]
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[Redirección con nombre]{.title}

``` javascript
{
  path: '/catalogo',
  redirect: { name: 'productos' }
}
```
:::

:::
::::::::::::::


Cuando el usuario acceda a [/inicio]{.verbatim}, Vue Router lo redirigirá a [/]{.verbatim}. Este tipo de redirecciones son útiles por temas de posicionamiento de buscadorest y cuando cambiamos la organización de las rutas o queremos mantener direcciones antiguas.


## Ruta no encontrada {#ruta-no-encontrada}

Podemos definir una ruta que capture las URL que no coinciden con ninguna de las rutas anteriores. De esta manera, si el usuario intenta entrar en una ruta que no existe se visualizará el componente [NoEncontradaView.vue]{.configfile} en lugar de encontrarse con una pantalla vacía.

:::::::::::::: {.columns }
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[Añadir ruta no encontrada]{.title}

``` javascript
{
  path: '/:pathMatch(.*)*',
  name: 'no-encontrada',
  component: NoEncontradaView
}
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[Componente]{.title}

``` vue
<template>
  <section>
    <h1>404 - Página no encontrada</h1>
    <p>La dirección no existe.</p>

    <RouterLink to="/">
      Volver al inicio
    </RouterLink>
  </section>
</template>
```
:::

:::
::::::::::::::


::: warnbox
Esta ruta debe situarse después de las rutas específicas.
:::


La ruta de Vue Router **no sustituye necesariamente a una respuesta HTTP 404 del servidor**. En una SPA, el servidor puede entregar el documento principal con un estado HTTP satisfactorio y dejar que Vue Router muestre su vista de error. Si necesitamos códigos HTTP específicos, debemos tenerlos en cuenta en la configuración del servidor o en la arquitectura de renderizado.

::: errorbox
La ruta de Vue Router no sustituye a una respuesta HTTP 404 del servidor.
:::


# *Navigation Guards* {#navigation-guards}

Los *[Navigation Guards](https://router.vuejs.org/guide/advanced/navigation-guards.html)*, o guardias de navegación, permiten ejecutar lógica antes, durante o después de determinadas operaciones de navegación. Pueden utilizarse para:

- Comprobar si el usuario ha iniciado sesión.
- Restringir el acceso a determinadas vistas.
- Confirmar que el usuario quiere abandonar un formulario.
- Redirigir a una página cuando no se cumplen ciertas condiciones.

Es importante recordar que las comprobaciones realizadas en el navegador no sustituyen a la autorización en el servidor. Una API debe comprobar por sí misma los permisos necesarios para cada operación protegida.

::: errorbox
Las comprobaciones realizadas en el navegador no sustituyen a la autorización en el servidor.
:::


## Guardia global antes de navegar {#guardia-global-antes-de-empezar}

Vue Router proporciona [beforeEach()]{.verbatim} para registrar una función que se ejecuta [antes de cada navegación](https://router.vuejs.org/guide/advanced/navigation-guards.html#Global-Before-Guards).

::: mycode
[beforeEach]{.title}

``` javascript
router.beforeEach((to, from) => {
  console.log('Ruta de origen:', from.fullPath)
  console.log('Ruta de destino:', to.fullPath)
})
```
:::

Los parámetros representan:

- [to]{.verbatim}: la ruta a la que se intenta navegar.
- [from]{.verbatim}: la ruta desde la que se inicia la navegación.

La función puede permitir la navegación, redirigir al usuario o impedir el cambio de ruta.

### Comprobar una sesión {#comprobar-sesión}

Imaginemos que determinadas vistas solo deben mostrarse a usuarios que hayan iniciado sesión.

Podemos añadir una propiedad [meta]{.verbatim} a las rutas:

::: mycode
[Fichero de rutas]{.title}

``` javascript
{
  path: '/administracion',
  name: 'administracion',
  component: AdministracionView,
  meta: {
    requiereAutenticacion: true
  }
}
```
:::

Después podemos comprobar esa propiedad desde una guardia:

::: mycode
[Comprobar sesión]{.title}

``` javascript
router.beforeEach((to) => {
  const autenticado = comprobarSesion()

  if (to.meta.requiereAutenticacion && !autenticado) {
    return {
      name: 'inicio'
    }
  }
})
```
:::

En este ejemplo, [comprobarSesion()]{.verbatim} representa una función que tendríamos que implementar de acuerdo con el sistema de autenticación de la aplicación. Si el usuario no está autenticado, la guardia devuelve una ubicación alternativa. Si no devuelve una instrucción de redirección ni de cancelación, la navegación puede continuar.

::: errorbox
Este ejemplo ilustra el mecanismo de navegación, no un sistema completo de seguridad. Ocultar una vista en el cliente no impide que alguien invoque directamente una API. El servidor debe verificar la identidad y los permisos en cada operación protegida.
:::

### Redirigir a una página de acceso {#redirigir-a-página-ácceso}

En una aplicación real, lo habitual es disponer de una ruta de acceso:

::: mycode
[Comprobar sesión]{.title}

``` javascript
router.beforeEach((to) => {
  const autenticado = comprobarSesion()

  if (to.meta.requiereAutenticacion && !autenticado) {
    return {
      name: 'login',
      query: {
        redirect: to.fullPath
      }
    }
  }
})
```
:::

El parámetro [redirect]{.verbatim} permite conservar la dirección a la que el usuario quería acceder.

Después de iniciar sesión, la aplicación puede utilizar esa dirección para devolver al usuario a su destino original. Antes de hacerlo, debe validar el destino para evitar redirecciones no deseadas a sitios externos.

## Guardia por ruta {#guardia-por-ruta}

Si necesitamos crear una guardia para una única ruta podemos hacerlo directamente en la configuración de la ruta.

::: mycode
[Guardia en una ruta]{.title}

``` javascript
const routes = [
  // ...
  {
    path: '/users/:id',
    component: UserDetails,
    beforeEnter: (to, from) => {
      // hacer cosas
    },
  },
  // ...
]
```
:::

Es importante entender que [beforeEnter]{.verbatim} sólo funciona al navegar desde una ruta distinta, si cambiamos entre [/users/2]{.verbatim} y [/users/3]{.verbatim} no se disparará la función.


## Guardias en componentes {#guardias-componentes}

Vue Router también ofrece mecanismos de navegación asociados a componentes, como [onBeforeRouteLeave()]{.verbatim} y [onBeforeRouteUpdate()]{.verbatim}. Por ejemplo, podemos evitar que el usuario abandone un formulario con cambios pendientes:

::: mycode
[Comprobar formulario]{.title}

``` vue
<script setup>
import { ref } from 'vue'
import { onBeforeRouteLeave } from 'vue-router'

const modificado = ref(false)

onBeforeRouteLeave(() => {
  if (modificado.value) {
    return window.confirm(
      'Hay cambios sin guardar. ¿Deseas salir?'
    )
  }
})
</script>
```
:::


Si [window.confirm()]{.verbatim} devuelve [false]{.verbatim}, la navegación se cancela.

Este ejemplo es apropiado para aprender el mecanismo, aunque en aplicaciones más completas puede ser preferible implementar un sistema de confirmación propio y coordinarlo con el estado real del formulario.


# Lazy loading de rutas {#lazy-loading-rutas}

En aplicaciones grandes, puede resultar innecesario cargar todos los componentes de todas las rutas al iniciar la aplicación. Vue Router permite utilizar [importaciones dinámicas](https://router.vuejs.org/guide/advanced/lazy-loading.html) para cargar las vistas cuando se necesitan.

Podemos destacar como ventajas las siguientes:

- Puede reducir el tamaño del código JavaScript inicial.
- Permite dividir una aplicación grande en fragmentos.
- Evita descargar inmediatamente el código de vistas que quizá nunca se visiten.
- Facilita organizar aplicaciones con muchas secciones.

No obstante, no siempre es necesario aplicarlo a todos los componentes. **En una aplicación pequeña, la mejora puede ser poco relevante** y una estructura demasiado fragmentada puede añadir complejidad.


Por ejemplo, en lugar de importar directamente una vista en el fichero de rutas:

::: mycode
[Cargar vista]{.title}

``` javascript
import ProductosView from '../views/ProductosView.vue'
import ProductosView from '../views/ConfiguracionView.vue'
```
:::

Podemos definir las rutas de esta manera:

::: mycode
[Cargar vista con promesa]{.title}

``` javascript
const routes = [
  //...
  {
    path: '/productos',
    name: 'productos',
    component: () => import('../views/ProductosView.vue')
  },
  {
    path: '/configuracion',
    name: 'configuracion',
    component: () => import('../views/ConfiguracionView.vue')
  }
]
```
:::

La función devuelve una promesa que permite cargar el componente cuando sea necesario y cada vista puede cargarse cuando el usuario accede a ella. Con Vite, esta técnica permite generar fragmentos de código separados durante la compilación.


