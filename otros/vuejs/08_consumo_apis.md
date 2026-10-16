
# Introducción {#introducción-api}

Hasta ahora hemos aprendido a crear componentes Vue, gestionar la reactividad, comunicar componentes entre sí y organizar una aplicación mediante Vue Router.

Sin embargo, muchas aplicaciones necesitan trabajar con información que no está almacenada directamente en el código del navegador. Por ejemplo, una tienda necesita consultar sus productos, una aplicación educativa necesita recuperar los datos del alumnado y un sistema de gestión necesita guardar los cambios realizados por sus usuarios.

Para resolver estas situaciones, las aplicaciones Vue suelen comunicarse con un servidor mediante una API.

# Aplicaciones Vue y APIs REST {#aplicaciones-vue-api-rest}

Una API (*Application Programming Interface*) es una interfaz que permite que diferentes programas se comuniquen entre sí. En el desarrollo web, una API puede permitir que una aplicación cliente solicite información o envíe datos a un servidor.

Por ejemplo, una aplicación de gestión de productos podría utilizar las siguientes operaciones:

| Operación | Método HTTP | URL de ejemplo |
|---|---|---|
| Obtener todos los productos | [GET]{.verbatim} | [/api/productos]{.verbatim} |
| Obtener un producto | [GET]{.verbatim} | [/api/productos/15]{.verbatim} |
| Crear un producto | [POST]{.verbatim} | [/api/productos]{.verbatim} |
| Sustituir un producto completo | [PUT]{.verbatim} | [/api/productos/15]{.verbatim} |
| Modificar parcialmente un producto | [PATCH]{.verbatim} | [/api/productos/15]{.verbatim} |
| Eliminar un producto | [DELETE]{.verbatim} | [/api/productos/15]{.verbatim} |

Estas direcciones son ejemplos. Para que las peticiones funcionen, debe existir un servidor que implemente los correspondientes endpoints.

## ¿Qué es una API REST?

[REST](https://en.wikipedia.org/wiki/REST) es un estilo arquitectónico utilizado para diseñar servicios que trabajan con recursos mediante HTTP. En una API REST, los recursos se identifican habitualmente mediante URL y se utilizan los métodos HTTP para expresar las operaciones que se quieren realizar.

Por ejemplo, [/api/productos/15]{.verbatim} puede identificar un producto concreto. El método [GET]{.verbatim} solicita información, mientras que [DELETE]{.verbatim} solicita eliminar el recurso identificado por esa URL.

REST no obliga a que todas las API utilicen exactamente las mismas convenciones, pero las operaciones CRUD suelen seguir este esquema:

- **Create**: crear recursos.
- **Read**: consultar recursos.
- **Update**: actualizar recursos.
- **Delete**: eliminar recursos.

## Arquitectura cliente-servidor {#arquitectura-cliente-servidor}

En una aplicación Vue, el navegador actúa como cliente. El servidor recibe las peticiones, realiza las operaciones necesarias y devuelve una respuesta con los datos correspondientes.

Vue se encarga de representar la información y reaccionar a sus cambios. La API es la que proporciona o almacena los datos en el servidor.

Aunque podemos mantener datos temporales en el navegador, eso no significa que estén guardados permanentemente en el servidor.


# [fetch()]{.verbatim} desde Vue {#fetch-desde-vue}

JavaScript proporciona la función [fetch()]{.verbatim} para realizar peticiones HTTP, que devuelve una promesa que se resuelve cuando se obtiene una respuesta HTTP. Después podemos leer el cuerpo de esa respuesta y transformarlo, por ejemplo, en un objeto JavaScript mediante [response.json()]{.verbatim}.

Un detalle importante es que [fetch()]{.verbatim} no rechaza automáticamente la promesa cuando el servidor responde con estados como [404]{.verbatim} o [500]{.verbatim}. Debemos comprobar la propiedad [response.ok]{.verbatim} para detectar las respuestas HTTP que indican un error.

## Primera petición

Podemos realizar una petición desde un componente Vue:

::: mycode
[Realizar petición a API]{.title}

``` vue
<script setup>
import { ref, onMounted } from 'vue'

const mensaje = ref('Cargando información...')

onMounted(async () => {
  try {
    const respuesta = await fetch('/api/mensaje')

    if (!respuesta.ok) {
      throw new Error('No se pudo obtener el mensaje')
    }

    const datos = await respuesta.json()

    mensaje.value = datos.mensaje
  } catch (error) {
    mensaje.value = error.message
  }
})
</script>

<template>
  <p>{{ mensaje }}</p>
</template>
```
:::

En este ejemplo utilizamos varias herramientas que ya conocemos.

- [ref()]{.verbatim} crea una referencia reactiva para almacenar el mensaje.
- [onMounted()]{.verbatim} ejecuta una función cuando el componente se ha montado.
- [fetch()]{.verbatim} realiza la petición HTTP.
- [await]{.verbatim} permite esperar el resultado de una promesa dentro de una función [async]{.verbatim}.
- [response.ok]{.verbatim} permite comprobar si la respuesta HTTP indica éxito.
- [response.json()]{.verbatim} interpreta el cuerpo de la respuesta como JSON.
- La asignación a [mensaje.value]{.verbatim} actualiza la interfaz gracias a la reactividad de Vue.

El ejemplo presupone que [/api/mensaje]{.verbatim} devuelve una respuesta JSON similar a esta:

::: {.mycode size=footnotesize}
[Respuesta de la API]{.title}
```json
{
  "mensaje": "Bienvenido a la aplicación"
}
```
:::


Si la API no existe o no devuelve el formato esperado, tendremos que gestionar el error correspondiente.

## ¿Por qué utilizamos [onMounted()]{.verbatim}?

Cuando un componente se muestra, normalmente queremos iniciar la carga de los datos necesarios para representarlo. El hook [onMounted()]{.verbatim} permite ejecutar código cuando el componente ya se ha montado.

Por ejemplo, podemos cargar el listado de productos al acceder a la vista:

::: mycode
[Respuesta de la API]{.title}
``` javascript
onMounted(() => {
  cargarProductos()
})
```
:::

La función [cargarProductos()]{.verbatim} contendrá la lógica necesaria para realizar la petición.

No todas las peticiones deben ejecutarse en [onMounted()]{.verbatim}. Algunas deben producirse cuando el usuario pulsa un botón, envía un formulario o cambia un filtro. La ubicación de la petición depende del comportamiento que necesitemos implementar.


# Peticiones GET {#peticiones-get}

El método HTTP [GET]{.verbatim} se utiliza habitualmente para consultar información del servidor. 
Supongamos una API que devuelve un listado de productos mediante una respuesta JSON como la siguiente:

::: {.mycode size=footnotesize}
[Respuesta de la API]{.title}
```json
[
  {
    "id": 1,
    "nombre": "Teclado",
    "precio": 29.99
  },
  {
    "id": 2,
    "nombre": "Ratón",
    "precio": 14.5
  }
]
```
:::

Podemos representar esos productos en una lista utilizando Vue, para ello tenemos el siguiente componente:


:::::::::::::: {.columns columnsep=0.5cm}
::: {.column width="47%"}

::: {.mycode size=footnotesize}
[Parte script]{.title}

``` vue
<script setup>
import { ref, onMounted } from 'vue'

const productos = ref([])
const cargando = ref(false)
const error = ref('')

async function cargarProductos() {
  cargando.value = true
  error.value = ''

  try {
    const respuesta = 
        await fetch('/api/productos')

    if (!respuesta.ok) {
      throw new Error(
        `Error: ${respuesta.status}`
      )
    }

    productos.value = 
        await respuesta.json()
  } catch (err) {
    error.value = err.message
  } finally {
    cargando.value = false
  }
}

onMounted(cargarProductos)
</script>
```
:::

:::
::: {.column width="53%" }

::: {.mycode size=footnotesize}
[Plantilla]{.title}

``` vue
<template>
  <section>
    <h1>Productos</h1>

    <p v-if="cargando">
      Cargando productos...
    </p>

    <p v-else-if="error">
      Error al cargar: {{ error }}
    </p>

    <p v-else-if="productos.length === 0">
      No hay productos disponibles.
    </p>

    <ul v-else>
      <li
        v-for="producto in productos"
        :key="producto.id"
      >
        {{ producto.nombre }}:
        {{ producto.precio }} €
      </li>
    </ul>

    <button @click="cargarProductos">
      Recargar productos
    </button>
  </section>
</template>
```
:::

:::
::::::::::::::



En este componente tenemos tres estados principales:

- [cargando]{.verbatim}: indica si se está realizando la petición.
- [error]{.verbatim}: contiene un mensaje cuando se produce un error.
- [productos]{.verbatim}: almacena los datos recibidos.

Vue utiliza estos valores para decidir qué parte de la plantilla debe mostrar.

## ¿Por qué utilizamos [finally]{.verbatim}? {#por-que-utilizar-finally}

El bloque [finally]{.verbatim} se ejecuta tanto si la operación termina correctamente como si se produce un error, y por eso es adecuado para desactivar el indicador de carga:

::: mycode
[Uso de "finally"]{.title}
``` javascript
finally {
  cargando.value = false
}
```
:::

Si no restableciéramos este valor cuando se produce un error, la interfaz podría quedarse mostrando indefinidamente el mensaje de carga.

## Evitar peticiones innecesarias {#evitar-peticiones-innecesarias}

Si el usuario pulsa repetidamente el botón de recarga, podrían iniciarse varias peticiones simultáneas. En aplicaciones reales podemos deshabilitar temporalmente el botón:

::: mycode
[Botón que se deshabilita]{.title}
``` vue
<button @click="cargarProductos" :disabled="cargando" >
  Recargar productos
</button>
```
:::

También debemos tener en cuenta que una petición iniciada anteriormente podría terminar después que otra más reciente. En determinados escenarios necesitaremos cancelar peticiones o controlar qué respuesta debe actualizar el estado.


# Peticiones POST, PUT, PATCH y DELETE {#peticiones-post-put-patch-delete}

Además de consultar información, una aplicación suele necesitar crear, modificar y eliminar recursos. Para ello utilizamos diferentes métodos HTTP.

## Crear un recurso con POST {#crear-con-post}

El método [POST]{.verbatim} se utiliza habitualmente para crear un recurso. Con [fetch()]{.verbatim} podemos enviar un objeto JavaScript convertido a JSON:

::: {.mycode size=footnotesize}
[Función para crear producto]{.title}

``` javascript
async function crearProducto(producto) {
  const respuesta = await fetch('/api/productos', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(producto)
  })

  if (!respuesta.ok) {
    throw new Error('No se pudo crear el producto')
  }

  return respuesta.json()
}
```
:::

La propiedad [method]{.verbatim} indica el método HTTP utilizado. La cabecera [Content-Type]{.verbatim} informa al servidor de que el cuerpo de la petición contiene JSON, y  [JSON.stringify()]{.verbatim} transforma el objeto JavaScript en una cadena JSON.

El servidor deberá interpretar los datos, validar el contenido y realizar la operación correspondiente.

:::errorbox
La validación del cliente mejora la experiencia de usuario, pero el servidor debe volver a validar los datos antes de guardarlos.
:::

## Modificar un recurso con PUT {#modificar-con-put}

El método [PUT]{.verbatim} se utiliza habitualmente para sustituir la representación de un recurso.

::: {.mycode size=footnotesize}
[Función para actualizar producto]{.title}

``` javascript
async function sustituirProducto(id, producto) {
  const respuesta = await fetch(`/api/productos/${id}`, {
    method: 'PUT',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(producto)
  })

  if (!respuesta.ok) {
    throw new Error('No se pudo actualizar el producto')
  }

  return respuesta.json()
}
```
:::

En este ejemplo, el identificador del producto forma parte de la URL. El significado exacto de la operación depende del contrato de la API. En un diseño convencional, [PUT]{.verbatim} representa la sustitución de la representación del recurso, mientras que [PATCH]{.verbatim} permite aplicar una modificación parcial.


## Modificar parcialmente un recurso con PATCH {#modificar-con-patch}

Si únicamente queremos modificar el precio de un producto, podemos utilizar [PATCH]{.verbatim}:

::: {.mycode size=footnotesize}
[Función para actualizar recurso]{.title}

``` javascript
async function modificarPrecio(id, precio) {
  const respuesta = await fetch(`/api/productos/${id}`, {
    method: 'PATCH',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({ precio })
  })

  if (!respuesta.ok) {
    throw new Error('No se pudo modificar el precio')
  }

  return respuesta.json()
}
```
:::

En este caso, enviamos únicamente el campo que queremos modificar. La forma exacta del cuerpo de un [PATCH]{.verbatim} depende del formato de modificación que acepte la API. El ejemplo utiliza un objeto JSON convencional.


## Eliminar un recurso con DELETE {#eliminar-recurso-con-delete}

El método [DELETE]{.verbatim} solicita eliminar el recurso identificado por una URL.

::: {.mycode size=footnotesize}
[Función para borrar recurso]{.title}

``` javascript
async function eliminarProducto(id) {
  const respuesta = await fetch(`/api/productos/${id}`, {
    method: 'DELETE'
  })

  if (!respuesta.ok) {
    throw new Error('No se pudo eliminar el producto')
  }
}
```
:::

No todas las API devuelven un cuerpo JSON después de eliminar un recurso. Algunas responden con [204 No Content]{.verbatim}, que indica que la operación se ha realizado correctamente y que no se devuelve contenido.

Por eso no debemos llamar automáticamente a [respuesta.json()]{.verbatim} después de cada petición.


# Estados de carga

Las operaciones de red tardan un tiempo variable. La respuesta puede llegar en mili-segundos o tardar varios segundos. Durante ese tiempo, la aplicación debe informar al usuario de lo que está sucediendo. Un patrón habitual consiste en utilizar una referencia reactiva para indicar si la operación está en curso, a veces en modo texto o con *[spinners](https://getbootstrap.com/docs/6.0/components/spinner/)*


Una petición puede encontrarse en distintas situaciones:

| Estado | Descripción |
|---|---|
| Inicial | Todavía no se ha solicitado la información |
| Cargando | La petición está en curso |
| Éxito | La información se ha recibido correctamente |
| Vacío | La petición ha terminado, pero no hay resultados |
| Error | La operación no ha podido completarse correctamente |

Table: {tablename=yukitblr colspec=X[1,l]X[3,l]}

Es importante distinguir entre un resultado vacío y un error.

::: infobox
Una API puede devolver un array vacío indicando que no hay productos disponibles, no que la petición haya fallado.
:::


# Gestión de errores {#gestión-errores}

Las peticiones HTTP pueden fallar por diferentes motivos:

- El servidor devuelve un estado HTTP de error.
- El usuario pierde la conexión a Internet.
- El servidor no está disponible.
- La petición es bloqueada por una política de seguridad del navegador.
- La respuesta no contiene JSON válido cuando esperamos JSON.
- Los datos recibidos no tienen el formato esperado.
- La petición se cancela.

Por tanto, debemos evitar asumir que todas las peticiones terminarán correctamente.

## Diferentes tipos de errores

Hay que diferenciar entre los posibles distintos errores que pueden suceder:

- **Errores HTTP**: El servidor responde, pero indica que la operación no se ha completado correctamente. Por ejemplo, [404]{.verbatim} puede indicar que el recurso no existe y [50]{.verbatim} que se ha producido un error interno del servidor.
- **Errores de red**: La petición no llega a completarse debido a un problema de conectividad, resolución del dominio, conexión o restricciones del navegador.
- **Errores de interpretación**: El servidor devuelve una respuesta, pero no podemos interpretar el cuerpo como esperábamos. Por ejemplo, [response.json()]{.verbatim} puede fallar si el cuerpo no contiene JSON válido.
- **Errores de aplicación**: La respuesta es válida desde el punto de vista HTTP y sintáctico, pero los datos no cumplen las condiciones que necesita la aplicación.

## Utilizar [try...catch]{.verbatim} {#usar-try-catch}

Para gestionar los errores  debemos usar la estructura [try...catch]{.verbatim}. En una interfaz real, normalmente no basta con escribir el error en la consola, ya que el usuario no verá el mensaje y por tanto debemos informarle mediante un mensaje adecuado:


:::::::::::::: {.columns columnsep=0.5cm}
::: {.column width="60%"}

::: {.mycode size=footnotesize}
[Parte script]{.title}

``` vue
<script setup>
try {
  const resp = await fetch('/api/productos')

  if (!resp.ok) {
    throw new Error(`Error HTTP: ${resp.status}`)
  }

  const productos = await resp.json()

  console.log(productos)
} catch (error) {
  console.error('Error cargando products:', error)
}
</script>
```
:::

:::
::: {.column width="40%" }

::: {.mycode size=footnotesize}
[Plantilla]{.title}

``` vue
<template>
<p v-if="error" role="alert">
  Error al cargar los datos.
</p>
<!-- ... -->
</template>
```
:::

:::
::::::::::::::


El atributo [role="alert"]{.verbatim} ayuda a que determinadas tecnologías de asistencia anuncien el mensaje cuando aparece.

## No mostrar siempre el mensaje técnico {#no-mostrar-mensaje-técnico}

El mensaje original de un error puede contener detalles poco útiles para el usuario o información que no conviene mostrar directamente. Podemos registrar el error para facilitar la depuración y mostrar un mensaje más comprensible:

En una aplicación real, también podemos distinguir entre errores de validación, errores de autenticación, recursos inexistentes y fallos temporales del servidor.


# Cancelación de peticiones {#cancelación-peticiones}

A veces una petición deja de ser necesaria antes de que termine. Por ejemplo:

- El usuario abandona una vista.
- El usuario cambia rápidamente de filtro.
- Se inicia una búsqueda nueva mientras la anterior sigue en curso.
- El componente se desmonta y ya no necesita los resultados.

JavaScript proporciona [AbortController]{.verbatim}, que permite cancelar una petición [fetch()]{.verbatim} mediante una señal, normalmente con un error de tipo [AbortError]{.verbatim}. 

Debemos distinguir una cancelación intencionada de un error de red real, por lo que en el siguiente ejemplo la petición se cancela cuando el componente se desmonta.


:::::::::::::: {.columns columnsep=0.5cm}
::: {.column width="60%"}

::: {.mycode size=footnotesize}
[Parte script]{.title}

``` vue
<script setup>
import { ref, onMounted, onUnmounted } from 'vue'

const productos = ref([])
const error = ref('')

const controlador = new AbortController()

onMounted(async () => {
  try {
    const respuesta =
      await fetch('/api/productos', {
            signal: controlador.signal
    })

    if (!respuesta.ok) {
      throw new Error('No cargan los productos')
    }

    productos.value = await respuesta.json()
  } catch (err) {
    if (err.name !== 'AbortError') {
      error.value = err.message
    }
  }
})

onUnmounted(() => {
  controlador.abort()
})
</script>
```
:::

:::
::: {.column width="40%" }

::: {.mycode size=footnotesize}
[Plantilla]{.title}

``` vue
<template>
<p v-if="error">{{ error }}</p>

<ul>
  <li
   v-for="producto in productos"
   :key="producto.id"
  >
   {{ producto.nombre }}
  </li>
</ul>
</template>
```
:::

:::
::::::::::::::



La señal se crea fuera de la función que realiza la petición, por lo que puede utilizarse tanto para iniciar la solicitud como para cancelarla posteriormente.

## ¿Qué ocurre si necesitamos repetir la petición? {#repetir-la-petición}

Si queremos realizar nuevas peticiones con posibilidad de cancelación, normalmente crearemos un [AbortController]{.verbatim} nuevo para cada operación. Un controlador que ya ha sido abortado no puede reutilizarse para iniciar una petición nueva.

Por ejemplo:

::: {.mycode size=footnotesize}
[Repetir petición]{.title}

``` javascript
let controladorActual

async function cargarDatos() {
  controladorActual?.abort()

  controladorActual = new AbortController()

  try {
    const respuesta = await fetch('/api/datos', {
      signal: controladorActual.signal
    })

    if (!respuesta.ok) {
      throw new Error('Error al cargar los datos')
    }

    return await respuesta.json()
  } catch (error) {
    if (error.name === 'AbortError') {
      return
    }

    throw error
  }
}
```
:::

Esta técnica resulta útil para búsquedas en las que el usuario puede cambiar rápidamente el texto introducido. No obstante, en una aplicación real debemos coordinar la cancelación con los estados de carga y error, evitando que una operación antigua modifique la interfaz después de que se haya iniciado una nueva.


# Componentes dependientes de datos externos {#componentes-dependientes-datos-externos}

En una aplicación Vue, un componente puede necesitar información externa para representar su contenido. Por ejemplo, un componente [ListaProductos.vue]{.configfile} puede recibir los productos mediante una prop:

:::::::::::::: {.columns}
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[Parte script]{.title}

``` vue
<script setup>
defineProps({
  productos: {
    type: Array,
    required: true
  }
})
</script>
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[Plantilla]{.title}

``` vue
<template>
  <ul>
    <li
      v-for="producto in productos"
      :key="producto.id"
    >
      {{ producto.nombre }}
    </li>
  </ul>
</template>
```
:::

:::
::::::::::::::


Este componente no necesita saber de dónde proceden los productos, pueden venir de una API, de un archivo local o de otro componente. Su responsabilidad consiste en representar los datos recibidos.

## Separar la carga de los datos de su representación {#separar-carga-datos-representación}

Normalmente deberíamos crear un componente padre encargado de consultar la API, ya que el componente hijo quizá pueda ser reutilizado por ser agnóstico al tipo de listado que debe dibujar.

:::::::::::::: {.columns columnsep=0.5cm}
::: {.column width="65%"}

::: {.mycode size=footnotesize}
[Componente padre]{.title}

``` vue
<script setup>
import { ref, onMounted } from 'vue'
import ListaProductos 
    from '../components/ListaProductos.vue'

const productos = ref([])
const cargando = ref(false)
const error = ref('')

async function cargarProductos() {
  cargando.value = true
  error.value = ''

  try {
    const respuesta = await fetch('/api/productos')

    if (!respuesta.ok) {
      throw new Error('Error al cargar productos')
    }

    productos.value = await respuesta.json()
  } catch (err) {
    error.value = err.message
  } finally {
    cargando.value = false
  }
}

onMounted(cargarProductos)
</script>

```
:::

:::
::: {.column width="35%" }

::: {.mycode size=footnotesize}
[Componente padre]{.title}

``` vue
<template>
  <h1>Catálogo</h1>

  <p v-if="cargando">
    Cargando...
  </p>
  <p v-else-if="error">
    {{ error }}
  </p>

  <ListaProductos
    v-else
    :productos="productos"
  />
</template>
```
:::

:::
::::::::::::::



Esta separación tiene varias ventajas:

- [ListaProductos]{.verbatim} puede reutilizarse en diferentes partes de la aplicación.
- La lógica de carga no se mezcla necesariamente con la representación de la lista.
- Podemos probar cada componente de forma independiente.
- El componente visual no necesita conocer los detalles de la API.

Esta organización no es una regla obligatoria para todas las aplicaciones, pero resulta útil cuando la interfaz empieza a crecer.


# Creación de un servicio para una API {#creación-servicio-api}

Cuando una aplicación tiene varios componentes que realizan peticiones al mismo servidor, repetir la misma lógica puede generar código difícil de mantener. Por ejemplo, cada componente podría tener su propio [fetch()]{.verbatim}, sus propias comprobaciones de errores y sus propias cabeceras. Una alternativa consiste en centralizar la comunicación con la API en un módulo JavaScript. A este tipo de módulo se le suele llamar *servicio* o *capa de acceso a datos*.

::: warnbox
Para evitar repetir código de peticiones a una API, lo ideal es crear un **servicio** para ello.
:::

Entre las ventajas al crear un servicio, podemos destacar: 

- Evitamos duplicar peticiones.
- Centralizamos las URL y las cabeceras.
- Podemos modificar la comunicación con el servidor sin cambiar todos los componentes.
- Facilitamos las pruebas y el mantenimiento.
- Podemos compartir funciones entre diferentes vistas.

En proyectos pequeños, puede ser suficiente con unas pocas funciones. En proyectos grandes, esta capa puede crecer para incluir autenticación, transformación de datos, gestión de errores y otros aspectos comunes.

Para guardar los servicios creados, podemos crear un directorio [src/services]{.configdir} para así tenerlos ordenados.


## Crear el servicio

Para crear el servicio debemos crear un fichero [productosService.js]{.configfile} que contendrá las funciones encargadas de comunicarse con la API.


::: {.mycode size=footnotesize}
[Servicio para productos]{.title}

``` javascript
const API_URL = '/api/productos'

async function comprobarRespuesta(respuesta) {
  if (!respuesta.ok) {
    throw new Error(`Error HTTP: ${respuesta.status}`)
  }

  return respuesta
}

export async function obtenerProductos() {
  const respuesta = await fetch(API_URL)

  await comprobarRespuesta(respuesta)

  return respuesta.json()
}

export async function obtenerProducto(id) {
  const respuesta = await fetch(`${API_URL}/${id}`)

  await comprobarRespuesta(respuesta)

  return respuesta.json()
}

export async function crearProducto(producto) {
  const respuesta = await fetch(API_URL, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(producto)
  })

  await comprobarRespuesta(respuesta)

  return respuesta.json()
}

export async function eliminarProducto(id) {
  const respuesta = await fetch(`${API_URL}/${id}`, {
    method: 'DELETE'
  })

  await comprobarRespuesta(respuesta)
}
```
:::

En este módulo centralizamos las operaciones relacionadas con los productos, y de esta manera, los componentes pueden importar las funciones que necesitan sin tener que repetir los detalles de cada petición.

::: warnbox
El ejemplo de [crearProducto()]{.verbatim} presupone que la API devuelve un cuerpo JSON después de crear el recurso. Si la API responde con [204 No Content]{.verbatim} u otra respuesta sin cuerpo, debemos adaptar la función para no intentar interpretar un JSON inexistente.
:::

## Utilizar el servicio desde un componente {#utilizar-servicio-desde-componente}

A la hora de querer usar un servicio creado desde un componente, lo primero que tendremos que hacer es pensar qué necesitamos importar y especificar la función y el fichero.

:::::::::::::: {.columns}
::: {.column width="55%"}

::: {.mycode size=footnotesize}
[Parte script]{.title}

``` vue
<script setup>
import { ref, onMounted } from 'vue'
import { obtenerProductos } 
    from '../services/productosService.js'

const productos = ref([])
const cargando = ref(false)
const error = ref('')

async function cargarProductos() {
  cargando.value = true
  error.value = ''

  try {
    productos.value = 
        await obtenerProductos()
  } catch (err) {
    console.error(err)
    error.value = 'Error con productos.'
  } finally {
    cargando.value = false
  }
}

onMounted(cargarProductos)
</script>
```
:::

:::
::: {.column width="45%" }

::: {.mycode size=footnotesize}
[Plantilla]{.title}

``` vue
<template>
<section>
  <h1>Productos</h1>
  <p v-if="cargando">
      Cargando productos...
  </p>

  <p v-else-if="error" 
    role="alert"
  >
      {{ error }}
  </p>
  
  <ul v-else>
    <li
      v-for="prod in productos"
      :key="prod.id"
    >
      {{ prod.nombre }}
    </li>
  </ul>
</section>
</template>
```
:::

:::
::::::::::::::



El componente ya no conoce la URL exacta ni cómo se construye la petición. Únicamente utiliza la función [obtenerProductos()]{.verbatim}.


