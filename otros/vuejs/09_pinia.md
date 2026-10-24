
# El problema del estado compartido {#problema-estado-compartido}

En una aplicación Vue, cada componente puede mantener sus propios datos reactivos mediante [ref()]{.verbatim} o [reactive()]{.verbatim}. Esta solución funciona bien cuando los datos solo se utilizan dentro de un componente.

Sin embargo, en una aplicación real es habitual que varios componentes necesiten acceder a la misma información. Por ejemplo, una aplicación de comercio electrónico puede tener:

- Un componente que muestra el catálogo de productos.
- Un componente que muestra los detalles de un producto.
- Un componente que muestra el número de productos del carrito.
- Un componente que muestra el contenido del carrito.
- Un componente que permite consultar el perfil del usuario.

Todos estos componentes pueden necesitar consultar o modificar datos compartidos, como el carrito de la compra o la información del usuario autenticado.

## El problema de la comunicación entre componentes {#problema-comunicación-entre-componentes}

Vue permite comunicar componentes mediante [props]{.verbatim} y eventos personalizados. No obstante, cuando los componentes están muy separados en la jerarquía, puede ser necesario transmitir datos a través de varios componentes intermedios.

Imaginemos la siguiente estructura de componentes en un proyecto: 

::: {.mycode size=footnotesize}
[Estructura de componentes]{.title}

``` text
App.vue
├── Cabecera.vue
│   └── CarritoResumen.vue
└── Principal.vue
    └── Productos.vue
        └── Producto.vue
```
:::

Si el componente [Producto.vue]{.configfile} permite añadir productos al carrito y [CarritoResumen.vue]{.configfile} debe mostrar el número de unidades, ambos componentes necesitan compartir información.

Sin una solución de estado compartido, podríamos tener que transmitir datos y eventos a través de varios componentes intermedios, aunque estos no utilicen directamente la información. Esta situación puede hacer que el código resulte difícil de mantener.

Este problema suele denominarse *prop drilling*: transmitir propiedades a través de varios niveles de componentes hasta llegar al componente que realmente las necesita.

## Posibles soluciones {#posibles-soluciones}

Existen varias formas de compartir información en Vue:

- **Props y eventos:** adecuados cuando la comunicación entre componentes es sencilla.
<!-- 
 FIXME: no se habla de nada hasta ahora de provide() e inject
- **[provide()]{.verbatim} e [inject()]{.verbatim}:** permiten compartir datos entre un componente y sus descendientes sin transmitirlos manualmente por todos los niveles intermedios.
-->
- **Un estado reactivo compartido:** permite centralizar determinados datos en un módulo JavaScript.
- **Pinia:** proporciona una solución estructurada para gestionar el estado compartido de una aplicación.

[Pinia](https://pinia.vuejs.org/) facilita la organización de los datos, las operaciones que los modifican y la lógica que varios componentes necesitan utilizar.


# Estado local frente a estado global {#estado-local-frente-a-global}

El **estado** de una aplicación es el conjunto de datos que pueden cambiar durante su ejecución y que determinan qué información se muestra o cómo se comporta la interfaz. En Vue podemos distinguir entre **estado local** y **estado global**.

## Estado local {#estado-local}

El estado local pertenece a un componente y se utiliza principalmente dentro de él. Por ejemplo, el estado que indica si un menú desplegable está abierto o cerrado no suele necesitar compartirse con otros componentes.

::: {.mycode size=footnotesize}
[Componente estado local]{.title}

``` vue
<script setup>
import { ref } from 'vue'
const menuAbierto = ref(false)

function alternarMenu() {
  menuAbierto.value = !menuAbierto.value
}
</script>
<template>
  <button @click="alternarMenu">
    {{ menuAbierto ? 'Cerrar menú' : 'Abrir menú' }}
  </button>

  <nav v-if="menuAbierto">
    <a href="/">Inicio</a>
    <a href="/contacto">Contacto</a>
  </nav>
</template>
```
:::

En este caso, [menuAbierto]{.verbatim} solo tiene sentido dentro del componente. No sería necesario almacenarlo en un estado global.

## Estado global {#estado-global}

El estado global contiene información que debe estar disponible para varios componentes independientes. Algunos ejemplos son:

- El usuario que ha iniciado sesión.
- El contenido del carrito de la compra.
- Las preferencias de visualización.
- Los filtros que deben compartirse entre distintas vistas.
- Los datos que varios componentes necesitan consultar y modificar.

Cuando diferentes componentes utilizan los mismos datos, conviene centralizar su gestión para evitar duplicaciones y mantener un comportamiento coherente.

### ¿Qué información debe almacenarse en un estado global? {#información-estado-global}

No es necesario convertir todos los datos de una aplicación en estado global. Hacerlo puede complicar innecesariamente el proyecto. Como criterio general:

- Si los datos solo afectan a un componente, utiliza estado local.
- Si varios componentes próximos necesitan comunicarse, utiliza props y eventos cuando resulte suficiente.
- Si componentes independientes necesitan compartir y modificar los mismos datos, considera utilizar un estado global.
- Si los datos deben conservarse después de recargar la página, necesitarás además algún mecanismo de persistencia.

Es importante recordar que **estado global no significa almacenamiento permanente**. El estado global permite compartir datos durante la ejecución de la aplicación, pero no garantiza que se conserven al recargar la página.


# Pinia {#pinia}

[Pinia](https://pinia.vuejs.org/) es una biblioteca de gestión del estado diseñada para aplicaciones Vue. Pinia permite definir almacenes de estado, denominados *stores*, que centralizan los datos y la lógica relacionada con ellos. 

Cada store puede contener:

- **State:** los datos reactivos que se desean compartir.
- **Getters:** propiedades calculadas a partir del estado.
- **Actions:** funciones que permiten modificar el estado y ejecutar operaciones relacionadas con él.

::: infobox
Es la solución recomendada actualmente para organizar el estado compartido en proyectos Vue modernos.
:::

Por ejemplo, una aplicación podría tener un store para el usuario ([src/stores/usuario.js]{.configfile}), otro para los productos ([src/stores/productos.js]{.configfile}) y otro para el carrito de la compra ([src/stores/carrito.js]{.configfile}).

La carpeta [stores]{.configdir} es una convención habitual para organizar los almacenes de Pinia. No es obligatoria, pero ayuda a mantener una estructura clara.

Podemos destacar las siguientes ventajas:

- Centraliza el estado compartido.
- Permite reutilizar la misma información desde distintos componentes.
- Mantiene la reactividad de los datos.
- Facilita la separación entre la interfaz y la lógica de negocio.
- Permite definir operaciones síncronas y asíncronas.
- Se integra con las herramientas de desarrollo de Vue.
- Facilita las pruebas y el mantenimiento de aplicaciones grandes.


::: warnbox
Pinia no sustituye a la reactividad de Vue: se apoya en ella para que los componentes se actualicen cuando cambia el estado compartido.
:::


## Instalación y configuración {#instalación-configuración}

Si el proyecto se ha creado con una versión moderna de Vue mediante Vite, podemos instalar Pinia utilizando [npm]{.verbatim}. Desde el directorio del proyecto, ejecutamos:

::: mycode
[Instalar pinia]{.title}

``` console
ruben@archy:~/proyecto/ $ npm install pinia
```
:::

A continuación, debemos registrar Pinia en la aplicación. En un proyecto Vue creado con Vite, el archivo de entrada suele ser [src/main.js]{.configfile}.

::: mycode
[Instalar pinia]{.title}

``` javascript
import { createApp } from 'vue'
import { createPinia } from 'pinia'
import App from './App.vue'

const app = createApp(App)
app.use(createPinia())
app.mount('#app')
```
:::

La función [createPinia()]{.verbatim} crea la instancia de Pinia. Mediante [app.use()]{.verbatim} registramos esa instancia en la aplicación Vue para que los componentes puedan acceder a los stores.

Es importante registrar Pinia antes de montar la aplicación con [app.mount()]{.verbatim}. Una vez realizada esta configuración, podremos crear y utilizar almacenes de estado desde los componentes.

## Creación de un store {#creación-store}

Un *store* es un almacén que agrupa datos reactivos y operaciones relacionadas con una determinada responsabilidad de la aplicación. Para crear un store, utilizamos la función [defineStore()]{.verbatim} que proporciona Pinia.

Como primer ejemplo, vamos a crear un contador compartido dentro del fichero [src/stores/contador.js]{.configfile}



::: mycode
[Crear *store*]{.title}

``` javascript
import { defineStore } from 'pinia'

export const useContadorStore = defineStore('contador', {
  state: () => ({
    contador: 0
  }),

  getters: {
    doble: (state) => state.contador * 2
  },

  actions: {
    incrementar() {
      this.contador++
    },
    decrementar() {
      this.contador--
    },
    reiniciar() {
      this.contador = 0
    }
  }
})
```
:::

Por convención, el nombre de la función que permite acceder al store suele comenzar por [use]{.verbatim} y terminar en [Store]{.verbatim}, en el ejemplo [useContadorStore]{.verbatim}.

La llamada a [defineStore()]{.verbatim} recibe dos argumentos:

- El primer argumento es un identificador único para el almacén. En este caso, utilizamos ['contador']{.verbatim}.
- El segundo argumento contiene la **configuración**. En este ejemplo aparecen los tres elementos principales de un store: **[state]{.verbatim}**, **[getters]{.verbatim}** y **[actions]{.verbatim}** que veremos a continuación.


## State {#pinia-state}

El [state]{.verbatim} contiene los datos reactivos del store. Puede incluir números, cadenas, booleanos, arrays u objetos. En el ejemplo anterior, el estado inicial es:

::: mycode
[Valor por defecto de *state*]{.title}

``` javascript
state: () => ({
  contador: 0
})
```
:::

Pinia utiliza una función que devuelve el estado inicial. Esto permite crear el estado de forma controlada y evita compartir accidentalmente el mismo objeto inicial entre distintas instancias de una aplicación.

### Acceder al estado {#pinia-state-acceder}

Desde un componente podemos acceder a los datos del store mediante la instancia obtenida con [useContadorStore()]{.verbatim}.

::: mycode
[Acceder a *state*]{.title}

``` vue
<script setup>
import { useContadorStore } from '@/stores/contador'
const contadorStore = useContadorStore()
</script>
<template>
  <p>Contador: {{ contadorStore.contador }}</p>
  <p>Doble: {{ contadorStore.doble }}</p>
</template>
```
:::

La plantilla muestra el valor de [contador]{.verbatim} y el valor calculado [doble]{.verbatim}.

No es necesario utilizar [.value]{.verbatim} al acceder a las propiedades del store. Pinia expone los valores del almacén de forma que podemos utilizarlos directamente.

### Modificar el estado {#pinia-state-modificar}

Podemos modificar una propiedad del estado directamente o a través de una acción del *store*:

:::::::::::::: {.columns}
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[Modificar propiedad]{.title}

``` javascript
contadorStore.contador = 10
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[Modificar usando *action*]{.title}

``` javascript
contadorStore.incrementar()
```
:::

:::
::::::::::::::



Ambas operaciones actualizan el estado reactivo pero cuando una modificación representa una operación de negocio **suele ser preferible centralizarla en una acción**.

Por ejemplo, una operación como añadir un producto al carrito puede implicar actualizar cantidades, comprobar límites y calcular importes. Mantener esa lógica en el store facilita su reutilización y mantenimiento.

### Reactividad compartida  {#pinia-state-reactividad}

Si dos componentes utilizan el mismo store, los dos observan los cambios que se produzcan en el estado. 

Imaginemos que [Cabecera.vue]{.configfile} muestra el contador y [Principal.vue]{.configfile} contiene un botón para incrementarlo. Si ambos utilizan [useContadorStore()]{.verbatim}, al incrementar el contador desde [Principal.vue]{.configfile}, el valor mostrado en [Cabecera.vue]{.configfile} también se actualizará automáticamente.

::: infobox
No es necesario transmitir el nuevo valor mediante props ni emitir un evento entre ambos componentes.
:::

### Reiniciar el estado {#pinia-reiniciar-estado}

En los stores definidos mediante la sintaxis de opciones, como el ejemplo anterior, Pinia proporciona el método [$reset()]{.verbatim}.

::: mycode
[Reiniciar el estado]{.title}

``` javascript
contadorStore.$reset()
```
:::

Este método restaura el estado inicial definido en [state]{.verbatim}. Es útil cuando queremos reiniciar un formulario, vaciar un estado temporal o devolver un almacén a sus valores iniciales.


## Getters {#pinia-getters}

Los [getters]{.verbatim} permiten obtener valores calculados a partir del estado del store. Su función es similar a la de las propiedades computadas creadas mediante [computed()]{.verbatim} en un componente. En el ejemplo anterior se ha definido:

::: mycode
[Definir *getter*]{.title}

``` javascript
getters: {
  doble: (state) => state.contador * 2
}
```
:::

El getter [doble]{.verbatim} devuelve el doble del contador.

### ¿Por qué utilizar getters? {#pinia-getter-porqué}

Podríamos calcular el doble del contador directamente en la plantilla, dado que es una operación sencilla y podría ser una solución perfectamente válida. Sin embargo, si el cálculo se utiliza en varios componentes o resulta más complejo, es preferible definirlo una sola vez.

Por ejemplo, en una tienda podríamos tener un getter que calcule el número total de unidades del carrito:

::: mycode
[Definir *getter*]{.title}

``` javascript
getters: {
  totalUnidades: (state) => {
    return state.productos.reduce(
      (total, producto) => total + producto.cantidad,
      0
    )
  }
}
```
:::

Este getter recorre el array de productos y suma sus cantidades. Si cambia el contenido del carrito, el resultado se actualizará de forma reactiva.


### Getters que dependen de otros getters {#pinia-getter-dependiente}

Un getter también puede utilizar otros getters del mismo store. Para ello, podemos utilizar [this]{.verbatim}.

::: mycode
[Definir *getter*]{.title}

``` javascript
getters: {
  doble: (state) => state.contador * 2,

  triple() {
    return this.contador * 3
  },
  sumaDobleYTriple() {
    return this.doble + this.triple
  }
}
```
:::

Cuando necesitamos utilizar [this]{.verbatim} para acceder a otros elementos del store, debemos emplear una función normal en lugar de una función flecha.

::: warnbox
Los getters deben utilizarse para calcular valores derivados, no para modificar el estado.
:::


## Actions {#pinia-actions}

Las [actions]{.verbatim} son funciones que encapsulan operaciones relacionadas con el estado del store. Pueden modificar datos, aplicar reglas de negocio o ejecutar operaciones asíncronas, como realizar una petición a una API.

En el ejemplo del contador anterior se han definido tres acciones:

::: mycode
[Definir *actions*]{.title}

``` javascript
actions: {
  incrementar() {
    this.contador++
  },
  decrementar() {
    this.contador--
  },
  reiniciar() {
    this.contador = 0
  }
}
```
:::

Dentro de una acción, [this]{.verbatim} hace referencia al store. Por eso podemos acceder a sus propiedades y modificarlas directamente.

### Ejecutar acciones desde un componente {#ejecutar-acciones-componente}

A la hora de ejecutar las acciones desde un componente, primero debemos importarlo para después poder acceder a sus acciones y estados:

::: mycode
[Uso de *actions* en componente]{.title}

``` vue
<script setup>
import { useContadorStore } from '@/stores/contador'
const contadorStore = useContadorStore()
</script>
<template>
  <p>Contador: {{ contadorStore.contador }}</p>
  <button @click="contadorStore.decrementar()">-1</button>
  <button @click="contadorStore.incrementar()">+1</button>
  <button @click="contadorStore.reiniciar()">Reiniciar</button>
</template>
```
:::

El componente se limita a mostrar los datos y llamar a las operaciones correspondientes. **La lógica de modificación permanece en el store**.

Esta separación facilita la reutilización: otro componente podría llamar a [incrementar()]{.verbatim} sin tener que volver a implementar su lógica.

:::infobox
La lógica de modificación permanece en el store aunque se use en el componente.
:::

### Actions con parámetros {#pinia-actions-parámetro}

Las acciones pueden recibir argumentos. Por ejemplo, podemos añadir una acción que permita incrementar el contador en una cantidad determinada:

:::::::::::::: {.columns}
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[*action* con parámetro]{.title}

``` javascript
actions: {
  incrementarEn(cantidad) {
    this.contador += cantidad
  }
}
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[Uso del *action*]{.title}

``` javascript
contadorStore.incrementarEn(5)
```
:::

:::
::::::::::::::


El contador aumentará en cinco unidades.

### Actions asíncronas {#pinia-actions-asíncronas}

Las acciones también pueden realizar operaciones asíncronas. Esto resulta especialmente útil cuando el store necesita obtener o enviar información a una API.

::: mycode
[*action* asíncrona]{.title}

``` javascript
actions: {
  async cargarDatos() {
    const respuesta = await fetch('/api/datos')
    if (!respuesta.ok) {
      throw new Error('No se han podido cargar los datos')
    }
    const datos = await respuesta.json()
    this.datos = datos
  }
}
```
:::

Para utilizar este ejemplo, habría que declarar previamente la propiedad [datos]{.verbatim} dentro del estado inicial. Las acciones asíncronas pueden utilizar [async]{.verbatim} y [await]{.verbatim}, igual que cualquier otra función JavaScript.

Más adelante se verá cómo combinar estas acciones con estados de carga y gestión de errores.


## Uso de stores desde componentes {#uso-store-componente}

Se puede utilizar el store del contador desde varios componentes independientes.


:::::::::::::: {.columns}
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[Cabecera.vue]{.title}

``` vue
<script setup>
import { useContadorStore } 
  from '@/stores/contador'
const contStore=useContadorStore()
</script>
<template>
  <header>
    <h1>Mi aplicación</h1>
    <p>Contador: 
      {{ contStore.contador }}</p>
  </header>
</template>
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[Principal.vue]{.title}

``` vue
<script setup>
import { useContadorStore } 
  from '@/stores/contador'
const contStore=useContadorStore()
</script>
<template>
  <main>
    <h2>Panel de control</h2>

    <button 
      @click="contStore.incrementar()">
      Incrementar
    </button>

    <button 
      @click="contStore.decrementar()">
      Decrementar
    </button>
  </main>
</template>
```
:::

:::
::::::::::::::


Si ambos componentes forman parte de la misma aplicación Vue y utilizan el mismo store, los cambios realizados en [Principal.vue]{.configfile} se reflejarán en [Cabecera.vue]{.configfile}.

Esto es precisamente lo que buscamos con el estado global: **distintos componentes pueden trabajar con la misma información sin tener que comunicarse directamente entre sí**.


## Desestructuración y reactividad {#desestructuración-reactividad}

JavaScript permite extraer propiedades de un objeto mediante la desestructuración. Sin embargo, al desestructurar directamente una propiedad reactiva de un store de Pinia, la variable resultante deja de estar conectada de la misma manera con la propiedad original.

En consecuencia, no debe utilizarse esta técnica para extraer directamente el estado o los getters cuando necesitamos conservar su reactividad. Pinia proporciona [storeToRefs()]{.verbatim} para resolver este problema.

::: {.mycode size=footnotesize}
[Uso de storeToRefs()]{.title}

``` vue
<script setup>
import { storeToRefs } from 'pinia'
import { useContadorStore } from '@/stores/contador'

const contadorStore = useContadorStore()

const { contador, doble } = storeToRefs(contadorStore)
</script>

<template>
  <p>Contador: {{ contador }}</p>
  <p>Doble: {{ doble }}</p>

  <button @click="contadorStore.incrementar()">
    Incrementar
  </button>
</template>
```
:::

[storeToRefs()]{.verbatim} crea referencias reactivas a las propiedades del estado y a los getters del store.

**Las acciones se pueden desestructurar directamente**, porque las funciones no necesitan convertirse en referencias reactivas:

::: mycode
[Desestructurar acciones]{.title}

``` javascript
const { incrementar, decrementar } = contadorStore
```
:::

No obstante, también es perfectamente válido acceder a ellas mediante [contadorStore.incrementar()]{.verbatim}.

::: errorbox
- Utilizar [storeToRefs()]{.verbatim} para desestructurar estado y getters.
- Para las acciones, se puede utilizar directamente el store o desestructurarlas.
:::



# Persistencia del estado {#persistencia-estado}

Hasta ahora, los datos de Pinia se mantienen mientras la aplicación está en ejecución. Si el usuario recarga la página, el estado vuelve a sus valores iniciales, salvo que hayamos implementado algún mecanismo de persistencia.

Para conservar determinados datos entre recargas, podemos utilizar mecanismos de almacenamiento del navegador, como [localStorage]{.verbatim}, que permite guardar datos en el navegador como pares de clave-valor. Los valores se almacenan como cadenas, por lo que los objetos JavaScript deben convertirse a JSON antes de guardarlos ([JSON.stringify()]{.verbatim}) y reconstruirse después ([JSON.parse()]{.verbatim}).


## Persistir un store de Pinia

Pinia no guarda automáticamente el estado en [localStorage]{.verbatim}. Una forma sencilla de implementar la persistencia es guardar el estado cuando cambia y recuperarlo al crear el store. Por ejemplo, podemos adaptar un store de preferencias:

::: {.mycode size=footnotesize}
[Store para preferencias]{.title}

``` javascript
import { defineStore } from 'pinia'

function obtenerPreferenciasIniciales() {
  const guardadas = localStorage.getItem('preferencias')

  if (guardadas) {
    try {
      return JSON.parse(guardadas)
    } catch {
      localStorage.removeItem('preferencias')
    }
  }

  return {
    tema: 'claro',
    idioma: 'es'
  }
}

export const usePreferenciasStore = defineStore('preferencias', {
  state: () => obtenerPreferenciasIniciales(),

  actions: {
    cambiarTema(tema) {
      this.tema = tema
    },

    cambiarIdioma(idioma) {
      this.idioma = idioma
    }
  }
})
```
:::

Para guardar los cambios, podemos observar el store desde un módulo que se ejecute una vez durante la inicialización de la aplicación. Por ejemplo, creamos [src/plugins/persistencia.js]{.configfile}:


::: {.mycode size=footnotesize}
[Store para preferencias]{.title}

``` javascript
import { usePreferenciasStore } from '@/stores/preferencias'

export function configurarPersistencia(pinia) {
  const preferenciasStore = usePreferenciasStore(pinia)

  preferenciasStore.$subscribe((_mutation, state) => {
    localStorage.setItem(
      'preferencias',
      JSON.stringify(state)
    )
  })
}
```
:::

Después, modificamos [src/main.js]{.configfile}:

::: {.mycode size=footnotesize}
[Modificar main.js]{.title}

``` javascript
import { createApp } from 'vue'
import { createPinia } from 'pinia'
import App from './App.vue'
import { configurarPersistencia } from './plugins/persistencia'

const app = createApp(App)
const pinia = createPinia()

app.use(pinia)

configurarPersistencia(pinia)

app.mount('#app')
```
:::

En este ejemplo, [$subscribe()]{.verbatim} permite reaccionar a los cambios del estado del store y guardar sus datos en [localStorage]{.verbatim}.

La función [configurarPersistencia()]{.verbatim} recibe la instancia de Pinia para poder acceder al store correspondiente antes de montar la aplicación.

Esta implementación es un ejemplo didáctico. En proyectos reales también debemos valorar qué propiedades conviene guardar, cómo manejar datos inválidos y cómo evitar que información obsoleta o incompatible se recupere después de una actualización.

## Precauciones de seguridad {#precauciones-seguridad}

No debemos guardar contraseñas, tokens sensibles ni información privada en [localStorage]{.verbatim} por el simple hecho de querer conservar el estado. Los datos almacenados allí son accesibles desde JavaScript que se ejecuta en el mismo origen y pueden quedar expuestos si existe una vulnerabilidad de tipo [XSS](https://es.wikipedia.org/wiki/Cross-site_scripting).

::: errorbox
La persistencia del estado de la interfaz no sustituye a la persistencia de datos en el servidor. Si una aplicación necesita conservar pedidos, usuarios o productos, normalmente debe utilizar una API y una base de datos.
:::


# Pinia frente a otras soluciones de estado {#pinia-vs-otras}

Pinia es una solución muy útil, pero no es la única forma de compartir información en Vue. La elección depende de la complejidad de la aplicación y de las necesidades de cada dato.

## Comparación de alternativas {#pinia-comparativa-alternativas}

Hasta ahora hemos visto distintas soluciones para compartir estados e información entre componentes. Cada una de estas soluciones tiene un uso específico, o más adecuado, dependiendo de las necesidades que tenga la aplicación, o dónde se va a usar dicha información.

| Solución | Cuándo utilizarla |
|:---|:---|
| [ref()]{.verbatim} o [reactive()]{.verbatim} local | Datos utilizados por un único componente. |
| Props y eventos | Comunicación directa entre componentes relacionados. |
| [provide()]{.verbatim} e [inject()]{.verbatim} | Compartir datos entre un componente y sus descendientes. |
| Estado reactivo compartido | Compartir una estructura reactiva sencilla entre varios módulos. |
| Pinia | Gestionar estado compartido de forma organizada en una aplicación. |

Table: Soluciones y usos {tablename=yukitblr colspec=X[1,l]X[2,l]}


## Pinia frente a Vuex {#pinia-vs-vuex}

[Vuex](https://vuex.vuejs.org/) fue durante años la biblioteca habitual para gestionar el estado global en aplicaciones Vue. Pinia es la solución recomendada actualmente para nuevos proyectos Vue.

Entre las diferencias prácticas más importantes destacan:

- Pinia tiene una API más sencilla y directa.
- No requiere definir mutations como elemento separado.
- Las acciones pueden modificar directamente el estado.
- Se integra con la Composition API y la Options API.
- Facilita la organización de aplicaciones mediante varios stores.

Aunque existen diferencias entre ambas bibliotecas, las dos buscan resolver el mismo problema: gestionar de forma centralizada el estado compartido.

## ¿Debemos utilizar Pinia siempre? {#usar-siempre-pinia}

Siempre hay que tener en cuenta el tipo de aplicación que se está desarrollando. Una aplicación pequeña puede funcionar perfectamente con estado local, props y eventos.

Pinia resulta especialmente útil cuando distintos componentes necesitan compartir datos, cuando la lógica de modificación es compleja o cuando queremos centralizar operaciones asíncronas y reglas de negocio.

La decisión debe basarse en la estructura real de la aplicación, no en la idea de que todo dato debe estar obligatoriamente en un store.

