
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

Es importante distinguir entre un resultado vacío y un error.

::: infobox
Una API puede devolver un array vacío indicando que no hay productos disponibles, no que la petición haya fallado.
:::




