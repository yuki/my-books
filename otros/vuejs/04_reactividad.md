
# Introducción {#introducción-reactividad-vue}

La **reactividad** es uno de los conceptos fundamentales de Vue. Es el mecanismo que permite que la interfaz de usuario se actualice automáticamente cuando cambian los datos de una aplicación.

En JavaScript tradicional, si modificamos una variable, el navegador no actualiza automáticamente los elementos HTML que dependen de ella. Vue añade el sistema relaciona  los datos y la interfaz. Cuando un dato reactivo cambia, Vue detecta el cambio y actualiza las partes de la interfaz que dependen de ese dato.


# El sistema de reactividad de Vue {#sistema-reactividad}

Previamente hemos visto parte de cómo funciona la reactividad entre variables y las plantillas, pero en el siguiente ejemplo vamos a crear un botón reactivo:

::: mycode
[Crear botón reactivo]{.title}

``` vue
<script setup>
import { ref } from 'vue'

const contador = ref(0)

function incrementar() {
  contador.value++
}
</script>
<template>
  <p>Contador: {{ contador }}</p>

  <button @click="incrementar">
    Incrementar
  </button>
</template>
```
:::


En este ejemplo [contador]{.verbatim} es una variable reactiva. Cuando el valor se incrementa, Vue detecta el cambio y actualiza automáticamente el elemento [p]{.verbatim} de la plantilla.

::: infobox
La reactividad permite que los datos y la interfaz permanezcan sincronizados.
:::


## [ref()]{.verbatim} {#reactividad-con-ref}

Vue tiene la función [ref()]{.verbatim} que es una de las herramientas más importantes de la Composition API. Permite crear una **referencia reactiva** de la siguiente manera:



:::::::::::::: {.columns }
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[Referencia reactiva]{.title}

``` vue
<script setup>
const variable = ref(valorInicial)
</script>
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[Ejemplo]{.title}

``` vue
<script setup>
import { ref } from 'vue'

const contador = ref(0)
</script>
```
:::

:::
::::::::::::::


En el ejemplo  [contador]{.verbatim} contiene un valor reactivo, lo que permite acceder o modificar su valor desde JavaScript utilizamos la propiedad [.value]{.verbatim}, pero para la plantilla no lo tenemos que escribir.


:::::::::::::: {.columns }
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[Acceder al valor]{.title}

``` vue
<script setup>
console.log(contador.value)
contador.value++
contador.value = 10
</script>
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[Mostrar en la plantilla]{.title}

``` vue
<template>
  <p>{{ contador }}</p>
</template>
```
:::

:::
::::::::::::::


## [reactive()]{.verbatim} {#reactividad-con-reactive}

Otra herramienta de Vue para crear datos reactivos es `reactive()`, que está pensado principalmente para trabajar directamente con **objetos y arrays**, mientras que [ref()]{.verbatim} es más para variables "simples".


:::::::::::::: {.columns }
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[Uso de [reactive()]{.verbatim}]{.title}

``` vue
<script setup>
import { reactive } from 'vue'

const usuario = reactive({
  nombre: 'Alice',
  edad: 20
})

usuario.nombre = 'Bob'
usuario.edad = 21
</script>
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[Uso en la plantilla]{.title}

``` vue
<template>
  <p>{{ usuario.nombre }}</p>
  <p>{{ usuario.edad }}</p>
</template>
```
:::

:::
::::::::::::::


Tal como se puede ver, se ha creado un objeto, que es [reactive]{.verbatim}, se le han modificado los atributos y luego en la vista se accede a los atributos, sin tener que usar [.value]{.verbatim}. Los atributos se pueden modificar dinámicamente desde el interfaz.


## Valores computados con [computed()]{.verbatim} {#valores-computados}

En muchas aplicaciones necesitamos obtener un valor a partir de otros datos, como puede ser la suma de datos, o la concatenación de textos. Para cuando el cálculo es complejo, o se utiliza en varios lugares, Vue proporciona `computed()`.

:::::::::::::: {.columns }
::: {.column width="60%"}

::: {.mycode size=footnotesize}
[Uso de [computed()]{.verbatim}]{.title}

``` vue
<script setup>
import { ref, computed } from 'vue'

const nombre = ref('Alice')
const apellidos = ref('Doe')

const nombreCompleto = computed(() => {
  return `${nombre.value} ${apellidos.value}`
})
</script>
```
:::

:::
::: {.column width="40%" }

::: {.mycode size=footnotesize}
[Uso en la plantilla]{.title}

``` vue
<template>
  <p>{{ nombreCompleto }}</p>
</template>
```
:::

:::
::::::::::::::


Una propiedad computada es un valor que Vue calcula a partir de otros valores reactivos. Otro posible ejemplo:

:::::::::::::: {.columns }
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[Uso de [computed()]{.verbatim}]{.title}

``` vue
<script setup>
import { ref, computed } from 'vue'

const precio = ref(25)
const cantidad = ref(3)

const total = computed(() => {
  return precio.value * cantidad.value
})
</script>
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[Uso en la plantilla]{.title}

``` vue
<template>
  <p>Precio: {{ precio }} €</p>
  <p>Cantidad: {{ cantidad }}</p>
  <p>Total: {{ total }} €</p>
</template>
```
:::

:::
::::::::::::::

En este ejemplo, típico de un carrito de la compra, si [cantidad]{.verbatim} cambia, el valor computado de [total]{.verbatim} también cambiará. 


Podemos conseguir un resultado parecido utilizando una función pero la diferencia fundamental es que una propiedad computada **almacena en caché su resultado** mientras sus dependencias no cambien.


::: infobox
Una función se ejecuta cada vez que se solicita, mientras que un valor [computed]{.verbatim} se ejecuta una vez y se cachea. No se volverá a ejecutar mientras no cambien sus dependencias.
:::


## Reaccionando con [watch()]{.verbatim} {#reaccionando-con-watch}

[watch()]{.verbatim} permite ejecutar código cuando cambia un dato reactivo concreto. Gracias a [watch]{.verbatim} podemos obtener el valor antes del cambio y el valor cuando ha cambiado:


::: {.mycode }
[Uso de [watch]{.verbatim}]{.title}

``` vue
<script setup>
import { ref, watch } from 'vue'

const contador = ref(0)

watch(contador, (nuevoValor, valorAnterior) => {
  console.log('El contador ha cambiado')
  console.log('Anterior:', valorAnterior)
  console.log('Nuevo:', nuevoValor)
})
</script>
```
:::

En cuanto [contador]{.verbatim} se modifique, Vue ejecutará la función proporcionada a [watch()]{.verbatim}, y tal como se puede ver, el callback recibe dos valores:

- [nuevoValor]{.verbatim}: valor después del cambio.
- [valorAnterior]{.verbatim}: valor anterior al cambio.


[watch()]{.verbatim} es especialmente útil cuando el cambio de un dato debe provocar una **acción secundaria**. Por ejemplo:

- Realizar una petición a una API;
- Guardar información;
- Ejecutar una operación costosa;
- Reaccionar ante un cambio determinado;
- Sincronizar información con otro sistema.


## [watchEffect()]{.verbatim}

[watchEffect()]{.verbatim} también permite ejecutar código reactivo, pero funciona de una forma diferente.

::: {.mycode}
[Uso de [watchEffect]{.verbatim}]{.title}

``` vue
<script setup>
import { ref, watchEffect } from 'vue'

const nombre = ref('Alice')

watchEffect(() => {
  console.log(`El nombre es ${nombre.value}`)
})
</script>
```
:::


Vue ejecuta inmediatamente la función y detecta automáticamente qué valores reactivos se utilizan dentro de ella. Si [nombre]{.verbatim} cambia, la función volverá a ejecutarse.

La diferencia principal es que en [watch()]{.verbatim} debemos indicar explícitamente qué queremos observar, mientras que con [watchEffect()]{.verbatim} Vue detecta automáticamente las dependencias.


::: exercisebox
Crea un componente en el que haya un objeto con datos personales y que sea reactivo. Utiliza los distintos componentes reactivos vistos, y que se cambie algún dato mediante botones para comprobar cómo se modifica la visualización al cambiar.
:::


# Eventos {#eventos-vue}

Los eventos permiten que una aplicación Vue responda a las acciones realizadas por el usuario. Cuando un usuario pulsa un botón, escribe en un campo, selecciona una opción, envía un formulario o pulsa una tecla, el navegador genera un **evento**. Vue proporciona mecanismos para asociar estos eventos con funciones de nuestro componente.


## Manejo de eventos {#manejo-eventos}

En JavaScript podemos escuchar eventos utilizando [addEventListener()]{.verbatim}, mientras que Vue proporciona una forma mucho más integrada con sus plantillas, por ejemplo con la directiva [v-on]{.verbatim}


:::::::::::::: {.columns }
::: {.column width="60%"}

::: {.mycode size=footnotesize}
[Eventos en JavaScript]{.title}

```javascript
const boton = document.querySelector('#boton')

boton.addEventListener('click', () => {
  console.log('Botón pulsado')
})
```
:::

:::
::: {.column width="40%" }

::: {.mycode size=footnotesize}
[Evento en Vue]{.title}

``` vue
<script setup>
function saludar() {
  console.log('Botón pulsado')
}
</script>
<button v-on:click="saludar">
  Saludar
</button>
```
:::

:::
::::::::::::::

Cuando el usuario pulsa el botón, Vue ejecuta la función [saludar()]{.verbatim}. De esta forma, el evento y la lógica del componente quedan relacionados directamente en la plantilla.

::: infobox
La función que responde a un evento suele denominarse **manejador de eventos** (*event handler*).
:::


## [v-on]{.verbatim} y la sintaxis [@]{.verbatim} {#v-on-sintaxis-arroba}

La sintaxis completa para escuchar un evento se ha visto previamente, pero [v-on]{.verbatim} tiene una abreviatura mucho más utilizada usando [@]{.verbatim} y el evento que queremos usar. Por lo tanto, los siguientes códigos son equivalentes:


:::::::::::::: {.columns }
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[Eventos en Vue]{.title}

```vue
<button v-on:click="saludar">
  Saludar
</button>
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[Código equivalente]{.title}

``` vue
<button @click="saludar">
  Saludar
</button>
```
:::

:::
::::::::::::::


::: infobox
En código Vue moderno es habitual utilizar [@]{.verbatim}.
:::


Otros ejemplos: 

::: mycode
[Ejemplos de eventos]{.title}

``` vue
<template>
<button @click="guardar">Guardar</button>

<input @input="actualizar">

<form @submit="enviarFormulario">
  ...
</form>

<div @mouseover="mostrarInformacion">
  ...
</div>
</template>
```
:::


## Parámetros en los eventos {#parámetros-eventos}

Los *event handlers* de eventos pueden recibir parámetros. A continuación dos ejemplos con distintos números de parámetros:


:::::::::::::: {.columns }
::: {.column width="45%"}

::: {.mycode size=footnotesize}
[Eventos con parámetro]{.title}

```vue
<script setup>
function saludar(nombre) {
  console.log(`Hola, ${nombre}`)
}
</script>
<template>
  <button @click="saludar('Bob')">
    Saludar
  </button>
</template>
```
:::

:::
::: {.column width="55%" }

::: {.mycode size=footnotesize}
[Evento con parámetros]{.title}

``` vue
<script setup>
function mostrarUsuario(id, nombre) {
  console.log(id)
  console.log(nombre)
}
</script>
<template>
  <button @click="mostrarUsuario(10, 'Bob')">
    Usuario
  </button>
</template>
```
:::

:::
::::::::::::::


Esto resulta especialmente útil cuando trabajamos con listas. Por ejemplo:

::: mycode
[Evento con parámetros de una lista]{.title}

``` vue
<template>
  <button
    v-for="usuario in usuarios"
    :key="usuario.id"
    @click="seleccionarUsuario(usuario.id)"
  >
    {{ usuario.nombre }}
  </button>
</template>
```
:::



## El objeto [Event]{.verbatim} {objeto-event}

Los eventos del navegador proporcionan información adicional mediante el objeto [Event]{.verbatim}.


::: mycode
[Evento con parámetros de una lista]{.title}

``` vue
<script setup>
function mostrarEvento(evento) {
  console.log(evento)
  console.log(evento.target)
}
</script>
<template>
  <button @click="mostrarEvento">
    Pulsar
  </button>
</template>
```
:::


El objeto recibido contiene información sobre el evento que se ha producido. Por ejemplo, **[event.target]{.verbatim} representa el elemento que originó el evento**.


::: infobox
[event.target]{.verbatim} representa el elemento que originó el evento.
:::


### Evento de entrada {#evento-entrada}

En un campo de texto podemos obtener el valor introducido mediante [evento.target.value]{.verbatim}: 

::: mycode
[Evento con parámetros de una lista]{.title}

``` vue
<script setup>
function mostrarValor(evento) {
  console.log(evento.target.value)
}
</script>
<template>
  <input @input="mostrarValor">
</template>
```
:::

Por ejemplo, si el usuario escribe dentro del campo de texto obtendremos ese valor.



### Pasar argumentos y recibir el evento

Cuando necesitamos pasar nuestros propios argumentos y también queremos acceder al objeto [Event]{.verbatim}, podemos utilizar [$event]{.verbatim}.


::: mycode
[Evento con parámetros de una lista]{.title}

``` vue
<script setup>
function mostrarUsuario(id, evento) {
  console.log(id)
  console.log(evento)
}
</script>
<template>
  <button @click="mostrarUsuario(10, $event)">
    Usuario
  </button>
</template>
```
:::


[$event]{.verbatim} representa el evento generado por el navegador. Este mecanismo resulta especialmente útil cuando necesitamos combinar información propia de nuestra aplicación con información proporcionada por el navegador.

::: exercisebox
Crea una pequeña lista de objetos con datos de usuarios. Con esta lista:

- Muestra todos los usuarios en una tabla, pero que sólo salga el nombre y apellidos.
- La última columna de la tabla que tenga 3 botones para:
  - **Visualizar usuario**: Crea un modal con todos los datos del usuario
  - **Borrar usuario**: recibe el id y simula enviar un POST para borrar el usuario.
:::


## Modificadores de eventos {#modificadores-eventos}

Vue proporciona **[modificadores de eventos](https://vuejs.org/guide/essentials/event-handling.html)** para realizar operaciones habituales sin tener que escribirlas manualmente dentro de las funciones. Los modificadores se añaden después del nombre del evento utilizando un punto.


### [.prevent]{.verbatim} {#modificador-prevent}

Por defecto, cuando se envía un formulario, el navegador puede intentar recargar la página. Podemos evitar este comportamiento con [.prevent]{.verbatim}:

::: mycode
[Modificador [.prevent]{.verbatim}]{.title}

``` vue
<script setup>
function enviarFormulario() {
  console.log('Formulario enviado')
}
</script>
<template>
  <form @submit.prevent="enviarFormulario">
    <input type="text">
    <button type="submit">
      Enviar
    </button>
  </form>
</template>
```
:::


La función solamente se encarga de procesar los datos. El modificador [.prevent]{.verbatim} hace que Vue ejecute internamente la función JavaScript [.preventDefault()]{.verbatim}. Por lo tanto, este modificador simplifica la operación.


### [.stop]{.verbatim} {#modificador-stop}

Detiene la propagación del evento, y es equivalente conceptualmente a la función JavaScript [evento.stopPropagation()]{.verbatim}:


::: mycode
[Modificador [.stop]{.verbatim}]{.title}

``` vue
<template>
  <button @click.stop="accion">
    Pulsar
  </button>
</template>
```
:::



### [.once]{.verbatim} {#modificador-once}

Hace que el manejador se ejecute una sola vez. Después de la primera ejecución, el evento deja de ejecutar ese manejador.


::: mycode
[Modificador [.once]{.verbatim}]{.title}

``` vue
<template>
  <button @click.once="mostrarMensaje">
    Mostrar
  </button>
</template>
```
:::

### [.self]{.verbatim} {#modificador-self}

Hace que el evento se procese únicamente cuando se produce directamente sobre el propio elemento. Es especialmente útil en determinados componentes como ventanas modales:

::: mycode
[Modificador [.self]{.verbatim}]{.title}

``` vue
<template>
  <div @click.self="cerrar">
    ...
  </div>
</template>
```
:::


### [.capture]{.verbatim}

Permite utilizar la fase de captura del evento. Los eventos del navegador pueden recorrer el DOM durante una fase de captura y otra de propagación. Este modificador permite controlar la fase utilizada por el listener.


::: mycode
[Modificador [.capture]{.verbatim}]{.title}

``` vue
<template>
  <div @click.capture="procesar">
    ...
  </div>
</template>
```
:::



## Eventos de teclado {#eventos-teclado}

Podemos reaccionar a teclas concretas, lo que permite implementar interacciones de teclado sin tener que comprobar manualmente las propiedades del objeto [KeyboardEvent]{.verbatim}.


- [keydown]{.verbatim}: al pulsar una tecla.
- [keyup]{.verbatim}: al dejar de pulsar una tecla.


Un ejemplo en el que obtenemos la tecla pulsada, donde hemos puesto una condición:


::: mycode
[Evento de teclado]{.title}

``` vue
<script setup>
function teclaPulsada(evento) {
  if (evento.key === 'Enter') {
    console.log('Se ha pulsado Enter')
  } else {
    console.log(evento.key)
  }
}
</script>
<template>
  <input @keydown="teclaPulsada">
</template>
```
:::


Para situaciones sencillas, se puede tener en cuenta si se ha pulsado una tecla concreta. A continuación varios ejemplos para distintas teclas:


::: mycode
[Modificador de teclado]{.title}

``` vue
<template>
  <input @keyup.enter="enviar">
  <input @keyup.esc="cancelar">
  <input @keyup.tab="siguiente">
  <input @keyup.delete="borrar">
  <input @keyup.space="accionSpace">

  <button @click.ctrl="accionCtrl">Ctrl + clic</button>
  <button @click.shift="accionShift">Shift + clic</button>
  <button @click.alt="accionAlt">Alt + clic</button>
  <button @click.meta="accionMeta">Meta + clic</button>
</template>
```
:::


# Formularios en Vue {#formularios-vue}

Los formularios son una parte fundamental de las aplicaciones web. En Vue podemos utilizar los elementos HTML habituales:

- [<input>]{.verbatim}
- [<textarea>]{.verbatim}
- [<select>]{.verbatim}
- [<option>]{.verbatim}
- [<button>]{.verbatim}
- [<form>]{.verbatim}
- [<input type="checkbox">]{.verbatim}
- [<input type="radio">]{.verbatim}

Por ejemplo:

::: mycode
[Modificador de teclado]{.title}

``` vue
<script setup>
function enviar() {
  console.log('Formulario enviado')
}
</script>
<template>
  <form @submit.prevent="enviar">
    <label>
      Nombre:
      <input type="text">
    </label>

    <button type="submit">
      Enviar
    </button>
  </form>
</template>
```
:::


Sin embargo, todavía no estamos almacenando el valor introducido por el usuario. Para establecer una relación entre un control de formulario y una variable reactiva podemos utilizar [v-model]{.verbatim}.


## [v-model]{.verbatim} {#v-model}

[v-model]{.verbatim} permite crear un **enlace bidireccional** entre un elemento de formulario y un dato reactivo. Por ejemplo:

::: mycode
[Modificador de teclado]{.title}

``` vue
<script setup>
import { ref } from 'vue'

const nombre = ref('')
</script>
<template>
  <input v-model="nombre">

  <p>Hola, {{ nombre }}</p>
</template>
```
:::

Cuando el usuario escribe en el campo, [nombre]{.verbatim} la variable se actualizará, y a su vez se visualizará también en la plantilla.


### [v-model]{.verbatim} y los eventos {#v-model-y-eventos}

Aunque [v-model]{.verbatim} parece un mecanismo especial, conceptualmente combina distintas operaciones. Puede entenderse de forma simplificada como una combinación entre el valor del control y un evento que actualiza ese valor.

Es importante entender que [v-model]{.verbatim} no sustituye al sistema de eventos de JavaScript, sino que proporciona una forma cómoda de utilizarlo con formularios.

### [v-model]{.verbatim} con distintos controles {#v-model-controles}

[v-model]{.verbatim} puede utilizarse con diferentes tipos de controles. A continuación algunos ejemplos para distintos tipos como [textarea]{.verbatim}, [select]{.verbatim}, ...


::: mycode
[V-model y controles]{.title}

``` vue
<template>
  <textarea v-model="descripcion"></textarea>

  <select v-model="pais">
    <option value="es">España</option>
    <option value="fr">Francia</option>
    <option value="pt">Portugal</option>
  </select>

  <input type="checkbox" v-model="aceptaCondiciones">

  <input type="radio" value="basico" v-model="nivel">
  <input type="radio" value="avanzado" v-model="nivel">
</template>
```
:::

Los [checkbox]{.verbatim} devuelven un boolean, y la variable [nivel]{.verbatim} contendrá el [value]{.verbatim} correspondiente al radio seleccionado.


## Modificadores de [v-model]{.verbatim} {#modificadores-v-model}

Vue proporciona varios modificadores para [v-model]{.verbatim}.

### [.trim]{.verbatim}

Elimina espacios en los extremos del texto. Esto nos permite realizar esta operación en el *frontend* antes de realizar el envío al *backend*


::: mycode
[V-model y trim]{.title}

``` vue
<template>
  <input v-model.trim="nombre">
</template>
```
:::


### [.number]{.verbatim}

Intenta convertir el valor introducido a un número. Esto resulta útil porque los valores obtenidos de un [<input>]{.verbatim} de tipo texto son normalmente cadenas.

::: mycode
[V-model y number]{.title}

``` vue
<template>
  <input v-model.number="edad">
</template>
```
:::



### [.lazy]{.verbatim}

[.lazy]{.verbatim} hace que la sincronización se realice en determinados momentos del ciclo del control, en lugar de hacerlo en cada evento de entrada. Puede resultar útil cuando no necesitamos reaccionar a cada carácter que escribe el usuario.

::: mycode
[V-model y lazy]{.title}

``` vue
<template>
  <input v-model.lazy="nombre">
</template>
```
:::


### Combinación de modificadores {#combinación-modificadores}

Los modificadores pueden combinarse:

::: mycode
[Combinar modificadores]{.title}

``` vue
<template>
  <input v-model.trim.number="valor">
</template>
```
:::


## Validación de formularios {#validación-formularios}

Los formularios deben validar la información introducida antes de enviarla o procesarla. Podemos utilizar las capacidades de validación de HTML y también realizar validaciones mediante JavaScript.


::: mycode
[Validación]{.title}

``` vue
<script setup>
import { ref } from 'vue'

const nombre = ref('')
const errorNombre = ref(false)

function enviar() {
  errorNombre.value = nombre.value === ''

  if (errorNombre.value) {
    return
  }

  console.log('Formulario correcto')
}
</script>
<template>
  <form @submit.prevent="enviar">
    <label>
      Nombre:
      <input v-model.trim="nombre">
    </label>

    <span v-if="errorNombre">
      El nombre es obligatorio.
    </span>

    <button type="submit">
      Enviar
    </button>
  </form>
</template>
```
:::


En aplicaciones reales podemos realizar validaciones mucho más completas, para por ejemplo:

- campos obligatorios;
- longitud mínima y máxima;
- formato de correo electrónico;
- valores numéricos;
- rangos;
- coincidencia entre campos;
- validaciones dependientes de otros campos;
- validaciones contra una API.


## Separar los errores de la interfaz {#separar-errores-e-interfaz}

Es conveniente almacenar el estado de validación en datos reactivos.

::: mycode
[Validación]{.title}

``` vue
<script setup>
const errores = ref({
  nombre: '',
  email: ''
})
</script>
<template>
  <input v-model="nombre">

  <span v-if="errores.nombre">
    {{ errores.nombre }}
  </span>
</template>
```
:::

La plantilla puede mostrar los mensajes de error correspondientes, lo que permite que los mensajes de error formen parte del estado de la aplicación y que Vue actualice automáticamente la interfaz.


::: exercisebox
Crea un formulario y utiliza los distintos modificadores vistos y un sistema de validación que muestre (u oculte) los avisos.
:::



