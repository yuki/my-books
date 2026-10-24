
# Arquitectura de formularios {#arquitectura-de-formularios}

Los formularios permiten recoger información del usuario y utilizarla dentro de una aplicación web. En Vue, además de los controles HTML habituales, podemos aprovechar la reactividad para gestionar los valores introducidos, validar los campos y mostrar mensajes de error de forma dinámica.

En una aplicación real, un formulario puede incluir:

- Campos de texto, números, fechas y contraseñas.
- Casillas de verificación y botones de opción.
- Listas desplegables.
- Validaciones de los datos introducidos.
- Mensajes de error asociados a cada campo.
- Indicadores de carga durante el envío.
- Mensajes de confirmación cuando la operación termina correctamente.
- Envío de datos a una API REST.

Vue proporciona herramientas para implementar estas funcionalidades sin necesidad de utilizar una biblioteca externa.

## Separación de responsabilidades {#separación-responsabilidades}

Para construir formularios mantenibles, conviene distinguir varias responsabilidades:

- **Plantilla:** define los campos, las etiquetas, los botones y los mensajes que se muestran.
- **Estado reactivo:** almacena los valores introducidos y los estados del formulario.
- **Validación:** comprueba si los datos cumplen las reglas establecidas.
- **Envío:** procesa los datos y, cuando corresponde, los envía a una API.
- **Presentación de resultados:** informa al usuario de los errores o del resultado de la operación.

En un formulario sencillo, estas responsabilidades pueden estar dentro de un mismo componente [.vue]{.configfile}. Si el formulario crece, puede ser conveniente separar las reglas de validación, los servicios HTTP o parte de la lógica en módulos independientes.

## Ejemplo de estructura de un formulario {#ejemplo-estructura-formulario}

Podemos representar el estado de un formulario mediante un objeto reactivo:

::: mycode
[Objeto reactivo]{.title}

``` javascript
import { reactive } from 'vue'

const formulario = reactive({
  nombre: '',
  correo: '',
  edad: null
})
```
:::

Cada propiedad representa un dato que el usuario debe introducir.

Mediante [v-model]{.verbatim}, podemos vincular los controles HTML con estas propiedades. De este modo, los cambios realizados por el usuario actualizan el estado y los cambios en el estado se reflejan en la interfaz.


# Validación reactiva {#validación-reactiva}

La validación consiste en comprobar si los datos introducidos cumplen unas condiciones determinadas. Por ejemplo, un formulario de registro podría exigir que:

- El nombre no esté vacío.
- El correo electrónico tenga un formato aceptable.
- La edad esté dentro de un intervalo determinado.
- La contraseña tenga una longitud mínima.
- Dos campos relacionados, como la contraseña y su confirmación, coincidan.

En Vue podemos realizar estas comprobaciones mediante JavaScript y mostrar sus resultados de forma reactiva.

## Primera validación: campo obligatorio {#validar-campo-obligatorio}

Vamos a crear un formulario que compruebe si el usuario ha introducido su nombre. En el siguiente ejemplo aparecen varios elementos importantes:

- [nombre]{.verbatim} almacena el valor introducido.
- [errorNombre]{.verbatim} almacena el mensaje de error.
- [v-model]{.verbatim} mantiene sincronizado el campo con el estado reactivo.
- [@blur]{.verbatim} ejecuta la validación cuando el usuario abandona el campo.
- [@submit.prevent]{.verbatim} evita que el navegador envíe el formulario de la manera tradicional y permite gestionar el envío desde Vue.
- [v-if]{.verbatim} muestra el mensaje únicamente cuando existe un error.

El método [trim()]{.verbatim} elimina los espacios en blanco del principio y del final de una cadena. De esta forma, un nombre compuesto únicamente por espacios no se considera válido.

:::::::::::::: {.columns columnsep=0.5cm}
::: {.column width="45%"}

::: {.mycode size=footnotesize}
[Validación campo obligatorio]{.title}

``` vue
<script setup>
import { ref } from 'vue'
const nombre = ref('')
const errorNombre = ref('')

function validarNombre() {
  if (!nombre.value.trim()) {
    errorNombre.value = 
        'El nombre es obligatorio'
  } else {
    errorNombre.value = ''
  }
}
</script>
<style scoped>
.error {
  color: red;
}
</style>
```
:::

:::
::: {.column width="55%" }

::: {.mycode size=footnotesize}
[Plantilla del componente]{.title}

``` vue
<template>
  <form @submit.prevent="validarNombre">
    <label for="nombre">Nombre:</label>
    <input
      id="nombre"
      v-model="nombre"
      type="text"
      @blur="validarNombre"
    >
    <span 
      v-if="errorNombre" class="error">
      {{ errorNombre }}
    </span>
    <button type="submit">
        Validar
    </button>
  </form>
</template>
```
:::

:::
::::::::::::::



## ¿Cuándo debemos validar? {#cuándo-debemos-validar}

Podemos ejecutar las validaciones en diferentes momentos:

- **Al abandonar un campo:** mediante [blur]{.verbatim}, para informar al usuario cuando termina de introducir un dato.
- **Al modificar un campo:** para actualizar el resultado mientras escribe.
- **Al enviar el formulario:** para comprobar todos los campos antes de procesar los datos.

No existe una única estrategia válida para todos los formularios. Una buena práctica consiste en no mostrar demasiados errores antes de que el usuario haya tenido oportunidad de introducir los datos.

También debemos recordar que una validación implementada en el navegador puede ser eludida. El servidor debe comprobar de nuevo los datos antes de aceptarlos.

## Validación mediante propiedades computadas {#validación-mediante-propiedades-computadas}

Cuando una validación depende directamente de un valor reactivo, podemos utilizar [computed()]{.verbatim}.

::: {.mycode size=footnotesize}
[Validación nombres computados]{.title}

``` vue
<script setup>
import { ref, computed } from 'vue'
const nombre = ref('')

const nombreValido = computed(() => {
  return nombre.value.trim().length >= 3
})
</script>

<template>
  <label for="nombre">Nombre:</label>
  <input id="nombre" v-model="nombre" type="text">

  <p v-if="nombre && !nombreValido">
    El nombre debe tener al menos 3 caracteres.
  </p>
  <p v-else-if="nombreValido">
    Nombre válido.
  </p>
</template>
```
:::

La propiedad [nombreValido]{.verbatim} se actualiza automáticamente cuando cambia [nombre]{.verbatim}.

Utilizar [computed()]{.verbatim} es especialmente útil cuando queremos separar el cálculo de la validez de la presentación de los mensajes.


# Validación síncrona y asíncrona {#validación-síncrona-asíncrona}

Las validaciones pueden clasificarse en síncronas y asíncronas, según necesiten esperar una operación externa para obtener el resultado.

## Validación síncrona {#validación-síncrona}

Una validación síncrona puede resolverse inmediatamente con los datos disponibles en el navegador. Algunos ejemplos son:

- Comprobar que un campo no está vacío.
- Verificar que un número está dentro de un intervalo.
- Comprobar que dos contraseñas coinciden.
- Verificar que una cadena tiene una longitud mínima.
- Comprobar que una cantidad es positiva.


::: {.mycode size=footnotesize}
[Validación síncrona]{.title}

``` javascript
function validarEdad(edad) {
  return Number.isInteger(edad) && edad >= 18
}
```
:::

La función devuelve inmediatamente un booleano que indica si la edad cumple la condición.

### Validación asíncrona {#validación-asíncrona}

Una validación asíncrona necesita esperar una operación que puede tardar en completarse. Algunos ejemplos son:

- Comprobar si un nombre de usuario está disponible.
- Verificar si una dirección de correo ya está registrada.
- Consultar un código postal en un servicio externo.
- Comprobar si un producto sigue disponible en el servidor.

En estos casos podemos utilizar [async]{.verbatim}, [await]{.verbatim} y [fetch()]{.verbatim}. Imaginemos que una API ofrece un endpoint que comprueba si un nombre de usuario está disponible:

::: {.mycode size=footnotesize}
[Validación asíncrona]{.title}

``` javascript
async function comprobarUsuarioDisponible(nombreUsuario) {
  const respuesta = await fetch(
    `/api/usuarios/disponible?nombre=${encodeURIComponent(nombreUsuario)}`
  )

  if (!respuesta.ok) {
    throw new Error('No se ha podido comprobar el usuario')
  }

  const resultado = await respuesta.json()

  return resultado.disponible
}
```
:::

La función devuelve una promesa que se resolverá con un booleano. El endpoint es un ejemplo: su existencia y su comportamiento dependen de la API que implemente el servidor.

#### Gestionar el estado de una validación asíncrona {#gestionar-estado-asíncrona}

Mientras esperamos la respuesta, podemos mostrar un indicador de comprobación.

::: {.mycode size=footnotesize}
[Gestionar estado]{.title}

``` vue
<script setup>
import { ref } from 'vue'

const nombreUsuario = ref('')
const comprobando = ref(false)
const usuarioDisponible = ref(null)
const error = ref('')

async function comprobarDisponibilidad() {
  if (!nombreUsuario.value.trim()) {
    usuarioDisponible.value = null
    error.value = 'Introduce un nombre de usuario'
    return
  }

  comprobando.value = true
  usuarioDisponible.value = null
  error.value = ''

  try {
    const disponible = await comprobarUsuarioDisponible(
      nombreUsuario.value
    )

    usuarioDisponible.value = disponible
  } catch {
    error.value = 'No se ha podido comprobar la disponibilidad'
  } finally {
    comprobando.value = false
  }
}

async function comprobarUsuarioDisponible(nombre) {
  const respuesta = await fetch(
    `/api/usuarios/disponible?nombre=${encodeURIComponent(nombre)}`
  )

  if (!respuesta.ok) {
    throw new Error('Error en la petición')
  }

  const resultado = await respuesta.json()

  return resultado.disponible
}
</script>

<template>
  <form @submit.prevent="comprobarDisponibilidad">
    <label for="usuario">Nombre de usuario:</label>

    <input
      id="usuario"
      v-model.trim="nombreUsuario"
      type="text"
    >

    <button type="submit" :disabled="comprobando">
      Comprobar
    </button>

    <p v-if="comprobando">
      Comprobando disponibilidad...
    </p>

    <p v-else-if="usuarioDisponible === true">
      El nombre está disponible.
    </p>

    <p v-else-if="usuarioDisponible === false">
      El nombre ya está ocupado.
    </p>

    <p v-if="error" class="error">
      {{ error }}
    </p>
  </form>
</template>
```
:::

En este ejemplo, el estado [comprobando]{.verbatim} permite desactivar el botón mientras se realiza la petición. Por su parte, [usuarioDisponible]{.verbatim} distingue tres situaciones:

- [true]{.verbatim}: el nombre está disponible.
- [false]{.verbatim}: el nombre está ocupado.
- [null]{.verbatim}: todavía no se dispone de un resultado válido.

En aplicaciones reales conviene contemplar también las peticiones repetidas, la cancelación de solicitudes y las respuestas que llegan en un orden distinto al de su envío.


# Mensajes de error {#mensajes-de-error}

Una validación resulta útil cuando el usuario comprende qué debe corregir. Por eso, no basta con determinar si un campo es válido: también debemos comunicar el resultado de forma clara.

## Mensajes asociados a cada campo {#mensajes-asociados-a-campos}

Es preferible mostrar el mensaje cerca del control correspondiente.

::: {.mycode size=footnotesize}
[Mensajes de error]{.title}

``` vue
<template>
  <label for="correo">Correo electrónico:</label>
  
  <input
    id="correo"
    v-model="correo"
    type="email"
    :aria-invalid="Boolean(errorCorreo)"
    aria-describedby="error-correo"
  >
  
  <span
    v-if="errorCorreo"
    id="error-correo"
    class="error"
  >
    {{ errorCorreo }}
  </span>
</template>
```
:::

El atributo [aria-invalid]{.verbatim} permite indicar a las tecnologías de asistencia que el campo contiene un valor inválido. [aria-describedby]{.verbatim} relaciona el control con el mensaje que lo describe.

Para los formularios accesibles también debemos asociar correctamente las etiquetas mediante [for]{.verbatim} e [id]{.verbatim}, ofrecer instrucciones comprensibles y no depender exclusivamente del color para identificar los errores.

## Centralizar los mensajes de validación {#centralizar-mensajes-validación}

En formularios con varios campos, es habitual utilizar un objeto que contenga todos los errores.

::: {.mycode size=footnotesize}
[Centralizar los mensajes de error]{.title}

``` javascript
import { reactive } from 'vue'

const errores = reactive({
  nombre: '',
  correo: '',
  edad: ''
})
```
:::

Después, cada función de validación puede actualizar la propiedad correspondiente.

::: {.mycode size=footnotesize}
[Centralizar los mensajes de error]{.title}

``` javascript
function validarNombre(nombre) {
  if (!nombre.trim()) {
    errores.nombre = 'El nombre es obligatorio'
    return false
  }

  errores.nombre = ''
  return true
}
```
:::

Este enfoque permite separar los valores del formulario de los mensajes de error y facilita la presentación de un resumen de errores.

## Evitar mensajes ambiguos {#evitar-mensajes-ambiguos}

Un mensaje como «Error» no ayuda demasiado al usuario. Es preferible indicar qué debe corregir:

- «Introduce tu nombre».
- «El correo electrónico no tiene un formato válido».
- «La contraseña debe tener al menos 8 caracteres».
- «Las contraseñas no coinciden».
- «No se ha podido conectar con el servidor. Inténtalo de nuevo».

Los mensajes deben ser concretos, comprensibles y coherentes con la regla que se está aplicando.

## Resumen de errores {#resumen-errores}

Cuando un formulario contiene muchos campos, puede resultar útil mostrar un resumen de los errores al principio del formulario.

::: {.mycode size=footnotesize}
[Resumen de errores]{.title}

``` vue
<div v-if="Object.values(errores).some(Boolean)" role="alert">
  <p>Revisa los siguientes campos:</p>

  <ul>
    <li v-for="(mensaje, campo) in errores" :key="campo">
      <span v-if="mensaje">
        {{ campo }}: {{ mensaje }}
      </span>
    </li>
  </ul>
</div>
```
:::

El atributo [role="alert"]{.verbatim} permite anunciar el contenido a determinadas tecnologías de asistencia cuando aparece. Debe utilizarse con criterio para no generar anuncios excesivos.


# Validación de campos relacionados {#validación-campos-relacionados}

Algunas reglas de validación dependen de la relación entre varios campos, no de un único valor. Por ejemplo:

- La contraseña y su confirmación deben coincidir.
- La fecha de finalización debe ser posterior a la fecha de inicio.
- Una cantidad no puede superar el límite seleccionado.
- Un campo puede ser obligatorio únicamente cuando se marca una opción determinada.

En estos casos, la validación debe tener en cuenta el estado conjunto del formulario.

## Ejemplo 1: confirmar una contraseña {#ejemplo-confirmar-contraseña}

En el siguiente ejemplo se valida si la contraseña y el segundo campo de confirmación de contraseña son idénticos.

::: {.mycode size=footnotesize}
[Ejemplo validar contraseña]{.title}

``` vue
<script setup>
import { ref, computed } from 'vue'

const contrasena = ref('')
const confirmarContrasena = ref('')

const contrasenasCoinciden = computed(() => {
  return (
    confirmarContrasena.value.length > 0 &&
    contrasena.value === confirmarContrasena.value
  )
})
</script>

<template>
  <form>
    <label for="contrasena">Contraseña:</label>
    <input
      id="contrasena"
      v-model="contrasena"
      type="password"
      autocomplete="new-password"
    >

    <label for="confirmar">Repite la contraseña:</label>
    <input
      id="confirmar"
      v-model="confirmarContrasena"
      type="password"
      autocomplete="new-password"
      :aria-invalid="
        confirmarContrasena.length > 0 && !contrasenasCoinciden
      "
    >

    <p
      v-if="confirmarContrasena && !contrasenasCoinciden"
      class="error"
    >
      Las contraseñas no coinciden.
    </p>

    <p v-else-if="contrasenasCoinciden">
      Las contraseñas coinciden.
    </p>
  </form>
</template>
```
:::

La propiedad computada depende de dos referencias reactivas. Si cualquiera de ellas cambia, Vue vuelve a calcular el resultado.

Observa que no se muestra el error mientras el segundo campo está vacío. Esto evita informar de un problema antes de que el usuario haya tenido la oportunidad de introducir la confirmación.

La coincidencia de las contraseñas es solo una de las comprobaciones posibles. Los requisitos de longitud, complejidad y otras políticas deben definirse según las necesidades de la aplicación.

## Ejemplo 2: intervalo de fechas {#intervalo-fechas}

Debemos comprobar que una fecha de finalización no sea anterior a una fecha de inicio.

::: {.mycode size=footnotesize}
[Ejemplo intervalo de fechas]{.title}

``` vue
<script setup>
import { ref, computed } from 'vue'

const fechaInicio = ref('')
const fechaFin = ref('')

const fechasValidas = computed(() => {
  if (!fechaInicio.value || !fechaFin.value) {
    return false
  }

  return fechaFin.value >= fechaInicio.value
})
</script>

<template>
  <label for="inicio">Fecha de inicio:</label>
  <input id="inicio" v-model="fechaInicio" type="date">

  <label for="fin">Fecha de finalización:</label>
  <input id="fin" v-model="fechaFin" type="date">

  <p v-if="fechaInicio && fechaFin && !fechasValidas">
    La fecha de finalización debe ser igual o posterior a la inicial.
  </p>
</template>
```
:::

Los valores de los controles [type="date"]{.verbatim} se expresan normalmente en formato [AAAA-MM-DD]{.verbatim}. Por eso, comparar estas cadenas permite comprobar su orden cronológico en este ejemplo.

::: infobox
Si trabajamos con fechas y horas, zonas horarias o formatos diferentes, será necesario normalizar los valores antes de compararlos.
:::


# Formularios dinámicos {#formularios-dinámicos}

Un formulario dinámico es aquel cuyo contenido cambia en función de los datos introducidos o de las acciones del usuario. Por ejemplo, una aplicación podría mostrar preguntas diferentes según el tipo de usuario seleccionado, permitir añadir varias direcciones o generar una lista variable de productos.

Vue facilita esta tarea gracias a [v-if]{.verbatim}, [v-for]{.verbatim} y la reactividad.

## Mostrar campos condicionalmente {#mostrar-campos-condicionalmente}

Imaginemos un formulario que permite elegir entre una persona física y una empresa.

::: {.mycode size=footnotesize}
[Mostrar campos condicionalmente]{.title}

``` vue
<script setup>
import { reactive, ref } from 'vue'

const tipoCliente = ref('persona')

const formulario = reactive({
  nombre: '',
  nif: '',
  razonSocial: ''
})
</script>

<template>
  <form>
    <label for="tipo">Tipo de cliente:</label>

    <select id="tipo" v-model="tipoCliente">
      <option value="persona">Persona física</option>
      <option value="empresa">Empresa</option>
    </select>

    <template v-if="tipoCliente === 'persona'">
      <label for="nombre">Nombre:</label>
      <input id="nombre" v-model="formulario.nombre">
    </template>

    <template v-else>
      <label for="razon-social">Razón social:</label>
      <input
        id="razon-social"
        v-model="formulario.razonSocial"
      >
    </template>

    <label for="nif">NIF:</label>
    <input id="nif" v-model="formulario.nif">
  </form>
</template>
```
:::

La plantilla muestra unos campos u otros según el valor de [tipoCliente]{.verbatim}. En formularios reales también debemos decidir qué hacer con los valores de los campos que dejan de mostrarse. Podemos conservarlos, borrarlos al cambiar de opción o excluirlos explícitamente de los datos enviados al servidor.

Ocultar un campo no garantiza que su valor deba enviarse: la lógica de envío debe construir los datos adecuados para el tipo de formulario seleccionado.

## Añadir elementos a una lista {#añadir-elementos-a-lista}

Supongamos que queremos permitir que un usuario introduzca varias direcciones de correo electrónico.

::: {.mycode size=footnotesize}
[Añadir elementos a una lista]{.title}

``` vue
<script setup>
import { ref } from 'vue'

const correos = ref([''])

function agregarCorreo() {
  correos.value.push('')
}

function eliminarCorreo(indice) {
  correos.value.splice(indice, 1)
}
</script>

<template>
  <form @submit.prevent>
    <div
      v-for="(correo, indice) in correos"
      :key="indice"
    >
      <label :for="`correo-${indice}`">
        Correo {{ indice + 1 }}:
      </label>

      <input
        :id="`correo-${indice}`"
        v-model="correos[indice]"
        type="email"
      >

      <button
        type="button"
        @click="eliminarCorreo(indice)"
      >
        Eliminar
      </button>
    </div>

    <button type="button" @click="agregarCorreo">
      Añadir correo
    </button>
  </form>
</template>
```
:::

En este ejemplo, [correos]{.verbatim} contiene un array de cadenas. Cada elemento se muestra mediante [v-for]{.verbatim}, y [v-model]{.verbatim} permite modificar la posición correspondiente.

Para un formulario sencillo, el índice puede utilizarse como clave. Si cada elemento tiene una identidad propia y puede reordenarse, es preferible asignarle un identificador estable en lugar de utilizar su posición en el array.

También es necesario impedir que se eliminen todos los elementos si el formulario requiere al menos uno. Estas reglas forman parte de la validación del formulario.


# Envío de formularios a una API {#envío-formularios-api}

En muchas aplicaciones, el formulario no termina cuando el usuario introduce los datos. Habitualmente, los datos deben enviarse a un servidor para crear un usuario, registrar un pedido o guardar información.

En Vue podemos gestionar el envío mediante un manejador de eventos y una petición HTTP con [fetch()]{.verbatim}.

## Estados habituales del envío {#estados-habituales-envío}

Es recomendable distinguir varios estados:

- **Inicial:** el usuario todavía no ha enviado el formulario.
- **Enviando:** la petición está en curso.
- **Éxito:** el servidor ha aceptado la operación.
- **Error:** la operación no se ha completado correctamente.

Estos estados pueden representarse mediante referencias reactivas.

## Ejemplo completo: registro de un usuario {#ejemplo-registro-usuario}

En el siguiente ejemplo, el formulario comprueba los datos básicos y los envía a un endpoint  [/api/usuarios]{.verbatim}.

::: {.mycode size=footnotesize}
[Registro de usuario]{.title}

``` vue
<script setup>
import { reactive, ref } from 'vue'

const formulario = reactive({
  nombre: '',
  correo: ''
})

const errores = reactive({
  nombre: '',
  correo: ''
})

const enviando = ref(false)
const mensaje = ref('')
const errorGeneral = ref('')

function validarFormulario() {
  errores.nombre = ''
  errores.correo = ''

  if (!formulario.nombre.trim()) {
    errores.nombre = 'El nombre es obligatorio'
  }

  if (!formulario.correo.trim()) {
    errores.correo = 'El correo es obligatorio'
  } else if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(formulario.correo)) {
    errores.correo = 'Introduce un correo válido'
  }

  return !errores.nombre && !errores.correo
}

async function enviarFormulario() {
  mensaje.value = ''
  errorGeneral.value = ''

  if (!validarFormulario()) {
    return
  }

  enviando.value = true

  try {
    const respuesta = await fetch('/api/usuarios', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(formulario)
    })

    if (!respuesta.ok) {
      throw new Error('No se ha podido registrar el usuario')
    }

    mensaje.value = 'Usuario registrado correctamente'

    formulario.nombre = ''
    formulario.correo = ''
  } catch (error) {
    errorGeneral.value = error.message
  } finally {
    enviando.value = false
  }
}
</script>

<template>
  <form @submit.prevent="enviarFormulario">
    <div>
      <label for="nombre">Nombre:</label>

      <input
        id="nombre"
        v-model.trim="formulario.nombre"
        type="text"
        required
        :aria-invalid="Boolean(errores.nombre)"
        aria-describedby="error-nombre"
      >

      <span
        v-if="errores.nombre"
        id="error-nombre"
        class="error"
      >
        {{ errores.nombre }}
      </span>
    </div>

    <div>
      <label for="correo">Correo electrónico:</label>

      <input
        id="correo"
        v-model.trim="formulario.correo"
        type="email"
        required
        :aria-invalid="Boolean(errores.correo)"
        aria-describedby="error-correo"
      >

      <span
        v-if="errores.correo"
        id="error-correo"
        class="error"
      >
        {{ errores.correo }}
      </span>
    </div>

    <button type="submit" :disabled="enviando">
      {{ enviando ? 'Enviando...' : 'Registrarse' }}
    </button>

    <p v-if="mensaje" role="status">
      {{ mensaje }}
    </p>

    <p v-if="errorGeneral" class="error" role="alert">
      {{ errorGeneral }}
    </p>
  </form>
</template>

<style scoped>
form {
  display: grid;
  gap: 1rem;
  max-width: 30rem;
}

form div {
  display: grid;
  gap: 0.25rem;
}

.error {
  color: #b00020;
}
</style>
```
:::



### Analizar el envío {#analizar-envío}

La función [enviarFormulario()]{.verbatim} realiza las siguientes operaciones:

1. Limpia los mensajes de resultados anteriores.
2. Ejecuta [validarFormulario()]{.verbatim}.
3. Detiene el proceso si hay errores.
4. Activa el estado [enviando]{.verbatim}.
5. Realiza una petición HTTP con el método [POST]{.verbatim}.
6. Convierte los datos a JSON mediante []{.verbatim}.
7. Comprueba la respuesta del servidor.
8. Muestra un mensaje de éxito o de error.
9. Desactiva el indicador de envío en el bloque [finally]{.verbatim}.

El atributo [Content-Type: application/json]{.verbatim} indica que el cuerpo de la petición contiene datos JSON.

También es importante comprobar [respuesta.ok]{.verbatim}: [fetch()]{.verbatim} no lanza automáticamente una excepción por recibir respuestas HTTP como **400**, **404** o **500**. Por eso debemos comprobar el estado de la respuesta explícitamente.

### Validación en el servidor {#validación-en-servidor}

La validación del navegador mejora la experiencia de usuario, pero **no debe considerarse una medida de seguridad suficiente**.

**El servidor debe comprobar nuevamente todos los datos recibidos** porque un usuario puede enviar peticiones directamente sin utilizar el formulario.

Además, la comprobación del correo mediante una expresión regular sencilla solo verifica un formato aproximado. No demuestra que la dirección exista ni que pertenezca al usuario.


# Librerías de validación {#librerías-validación}

Cuando los formularios contienen muchas reglas, campos relacionados, arrays dinámicos o validaciones asíncronas, mantener toda la lógica manualmente puede resultar complicado.

En esos casos podemos utilizar bibliotecas especializadas.

Algunas opciones del ecosistema Vue son:

- **VeeValidate:** biblioteca para gestionar formularios y validaciones en Vue.
- **FormKit:** solución para construir formularios con componentes, validación y otras herramientas.
- **Zod:** biblioteca para definir esquemas de datos y validarlos. Puede utilizarse junto con Vue y otras bibliotecas de formularios.

Cada biblioteca tiene un enfoque diferente. Antes de elegir una, debemos comprobar su compatibilidad con la versión de Vue utilizada, su documentación y las necesidades del proyecto.

## ¿Cuándo merece la pena utilizar una biblioteca? {#cuándo-usar-biblioteca}

Para un formulario de contacto con dos o tres campos, probablemente sea suficiente utilizar [ref()]{.verbatim}, [reactive()]{.verbatim}, funciones de validación y mensajes de error. En cambio, una biblioteca puede resultar útil cuando necesitamos:

- Gestionar decenas de campos.
- Reutilizar esquemas de validación.
- Aplicar reglas complejas y dependientes entre sí.
- Gestionar arrays de campos dinámicos.
- Validar datos de forma asíncrona.
- Integrar formularios con estructuras de datos complejas.
- Mantener criterios uniformes en toda una aplicación.

No es obligatorio instalar una biblioteca para trabajar con formularios en Vue. La elección depende de la complejidad y de los requisitos del proyecto.




