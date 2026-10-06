
# Comunicación entre componentes {#comunicación-entre-componentes}

Tal como se ha dicho previamente, una aplicación Vue es habitual dividir la interfaz en múltiples componentes, en la que cada uno tiene su propia responsabilidad y **puede necesitar comunicarse con otros componentes**. Por ejemplo:

- Un componente padre puede proporcionar información a un hijo.
- Un componente hijo puede informar a su padre de que el usuario ha realizado una acción.
- Varios componentes pueden necesitar compartir información.
- Un componente puede permitir que su contenido sea proporcionado desde el exterior.

Vue sigue, como regla general, un flujo de datos **unidireccional**. Los datos normalmente fluyen desde el componente padre hacia sus componentes hijos. Por ejemplo, un componente [App]{.verbatim} puede proporcionar un nombre a un componente [Usuario]{.verbatim}:

Vue proporciona diferentes mecanismos para resolver todas las situaciones posibles:

- **Props** para enviar datos de padre a hijo.
- **Eventos personalizados** para enviar información de hijo a padre.
- **[v-model]{.verbatim}** para crear una comunicación bidireccional entre componentes.
- **Slots** para proporcionar contenido a un componente.
- **Estado compartido** para situaciones en las que varios componentes necesitan acceder a los mismos datos.


# Comunicación padre a hijo: *Props* {#vue-props}

Las **props** (***properties***) permiten que un componente padre proporcione datos a un componente hijo. Supongamos los siguientes componentes:

:::::::::::::: {.columns }
::: {.column width="40%"}

::: {.mycode size=footnotesize}
[Componente **Usuario**]{.title}

``` vue
<script setup>
defineProps({
  nombre: String
})
</script>
<template>
  <p>Usuario: {{ nombre }}</p>
</template>
```
:::

:::
::: {.column width="60%" }

::: {.mycode size=footnotesize}
[Componente padre]{.title}

``` vue
<script setup>
import Usuario from './components/Usuario.vue'
</script>
<template>
  <Usuario nombre="Bob" />
</template>
```
:::

:::
::::::::::::::


El componente [Usuario]{.verbatim} recibe [nombre]{.verbatim} como una prop desde el componente padre.



## *Props* dinámicas {#props-dinámicas}

Las props no tienen por qué contener valores escritos directamente, podemos enlazarlas con datos mediante dos puntos **[:]{.verbatim}**. Por ejemplo:


::: {.mycode size=footnotesize}
[Componente padre]{.title}

``` vue
<script setup>
import Usuario from './components/Usuario.vue'
import { ref } from 'vue'

const nombreUsuario = ref('Alice')
</script>

<template>
  <Usuario :nombre="nombreUsuario" />
  <Producto :precio="precio * 1.21" />
</template>
```
:::


En este caso, el valor de la prop depende de [nombreUsuario]{.verbatim}. Si el valor reactivo cambia, el componente hijo recibirá el nuevo valor. En el segundo componente se ha enviado una expresión.


::: exercisebox
Crea un componente que sea un contador: 

- Tiene un botón para incrementar un número.
- Llama a un componente hijo y le pasa el número.
- El componente hijo muestra ese valor.
:::


## Pasar objetos mediante props {#pasar-objetos-mediante-props}

Las props también pueden contener objetos completos. Por ejemplo, en el componente padre se ha creado un objeto que después se pasa a un componente hijo:


:::::::::::::: {.columns }
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[Componente padre]{.title}

``` vue
<script setup>
const usuario = {
  id: 1,
  nombre: 'Alice',
  edad: 20
}
</script>
<template>
  <Usuario :usuario="usuario" />
</template>
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[Componente usuario]{.title}

``` vue
<script setup>
defineProps({
  usuario: Object
})
</script>
<template>
  <h2>{{ usuario.nombre }}</h2>
  <p>Edad: {{ usuario.edad }}</p>
</template>
```
:::

:::
::::::::::::::


## Declaración de props con [defineProps()]{.verbatim} {#declaración-props}

En [<script setup>]{.verbatim} utilizamos [defineProps()]{.verbatim} para declarar las propiedades que puede recibir un componente. Vue permite crear una variable para declarar los *props* y de esta manera acceder en la plantilla a través de esta variable, pero también a través de los nombres de las *props*.


:::::::::::::: {.columns }
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[Uso de variable *props*]{.title}

``` vue
<script setup>
const props = defineProps({
  nombre: String,
  edad: Number
})
</script>
<template>
  <h2>{{ props.nombre }}</h2>
  <p>{{ props.edad }} años</p>
</template>
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[Uso de variables propias]{.title}

``` vue
<script setup>
const props = defineProps({
  nombre: String,
  edad: Number
})
</script>
<template>
  <h2>{{ nombre }}</h2>
  <p>{{ edad }} años</p>
</template>
```
:::

:::
::::::::::::::


Cualquiera de las dos opciones es posible.


## Validación y valores por defecto de las props {#validación-valores-default-props}

Podemos especificar qué tipo de dato esperamos recibir, de esta manera podemos ayudar a documentar el componente y permite que Vue pueda detectar determinados usos incorrectos. También se puede especificar si una *prop* es obligatoria:


::: mycode
[Especificar tipo y obligatoriedad]{.title}

``` vue
<script setup>
const props = defineProps({
  nombre: {
    type: String,
    required: true
  },
  edad: Number,
  activo: Boolean
})
</script>
```
:::


En este caso, el componente espera que se proporcione [nombre]{.verbatim} y que sea de tipo [String]{.verbatim}. 

::: errorbox
Todas las *props* son opcionales salvo que se indique [required: true]{.verbatim}.
:::

También podemos establecer un valor por defecto:

::: mycode
[Especificar valor por defecto]{.title}

``` vue
<script setup>
const props = defineProps({
  nombre: {
    type: String,
    default: 'Usuario'
  }
})
</script>
```
:::


Si el padre no proporciona [nombre]{.verbatim}, el componente utilizará el valor por defecto ["Usuario"]{.verbatim}


## Las props son de solo lectura {#props-solo-lectura}

Una regla fundamental de Vue es que un componente hijo **no debe modificar directamente una prop recibida**. Las props pertenecen conceptualmente al componente padre.


El siguiente código no se debería hacer

::: mycode
[Especificar valor por defecto]{.title}

``` vue
<script setup>
const props = defineProps({
  contador: Number
})
props.contador++
</script>
```
:::


El hijo puede solicitar un cambio mediante un evento y será el padre quien modifique el dato. Esto ayuda a evitar cambios difíciles de rastrear en aplicaciones grandes.


::: warnbox
Un componente hijo **no debe modificar directamente una prop recibida**.
:::



# Comunicación hijo a padre: eventos personalizados {#eventos-personalizados}

Los eventos personalizados permiten que un componente hijo comunique al padre que algo ha ocurrido. Por ejemplo, podemos crear un componente [Contador]{.verbatim}:


:::::::::::::: {.columns }
::: {.column width="50%"}

::: {.mycode size=footnotesize}

[Componente padre]{.title}

``` vue
<script setup>
function incrementar() {
  console.log('El hijo emite')
}
</script>
<template>
  <Contador 
    @inc="incrementar"
  />
</template>
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}

[Componente **hijo**]{.title}

``` vue
<script setup>
const emit = defineEmits(['inc'])

function incrementar() {
  emit('inc')
}
</script>
<template>
  <button @click="incrementar">
    Incrementar
  </button>
</template>
```
:::

:::
::::::::::::::


El componente padre puede escuchar el evento que emite el componente hijo con [emit()]{.verbatim}.


## [emit]{.verbatim} {#emit}

En [<script setup>]{.verbatim}, los eventos personalizados se declaran mediante [defineEmits()]{.verbatim} y emitirlos mediante [emit()]{.verbatim}:

:::::::::::::: {.columns }
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[Declarar eventos]{.title}

``` vue
<script setup>
const emit = defineEmits([
  'guardar',
  'cancelar'
])
</script>
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[Emitir evento]{.title}

``` vue
<script setup>
// ...
emit('guardar')
// ...
emit('cancelar')
</script>
```
:::

:::
::::::::::::::


El padre puede escuchar esos eventos indicando las funciones que se van a ejecutar al llamar al hijo:

::: mycode
[Recibir evento]{.title}

``` vue
<script setup>
function guardarDatos() {
    //...
}
function ejecutarCancelar() {
    //...
}
</script>
<template>
  <MiFormulario @guardar="guardarDatos" @cancelar="ejecutarCancelar" />
</template>
```
:::

De esta forma, el hijo no necesita conocer qué hará el padre con el evento. Solo comunica "ha ocurrido esta acción" y el padre decide cómo responder. Esto también sirve para reaprovechar código.

::: infobox
Imagina un componente que dibuja botones "editar" y "borrar" que emite esos eventos. Se puede utilizar para distintos apartados de la aplicación: usuarios, productos, ... Es el componente padre quien se encarga de llevar a cabo esas acciones.
:::


::: exercisebox
Crea un componente padre que:

- Cree una variable dinámica [contador]{.verbatim} que le pase a un componente hijo
- Reciba los eventos [incrementar]{.verbatim} y [decrementar]{.verbatim} que llame a funciones para realizar dicha operación sobre [contador]{.verbatim} y haga [console.log]{.verbatim}.

Un componente hijo que:

- Reciba como obligatorio una variable de tipo [Number]{.verbatim} y visualice la variable.
- Dos botones: uno que emita el evento [incrementar]{.verbatim} y otro [decrementar]{.verbatim}.
:::


## Enviar datos mediante eventos {#enviar-datos-eventos}

Un evento también puede transportar información. Por ejemplo, podemos generar desde un componente padre una lista de usuarios (cada uno es un componente hijo), y al seleccionar uno se recibe en el padre el identificador.


:::::::::::::: {.columns }
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[Emitir evento en el hijo]{.title}

``` vue
<script setup>
const emit = defineEmits(['seleccionar'])

function seleccionarProducto(id) {
  emit('seleccionar', id)
}
</script>
<template>
  <!-- Listado e información -->
  <button 
    @click="seleccionarProducto(10)">
    Seleccionar producto 10
  </button>
</template>
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[Recibir datos en el padre]{.title}

``` vue
<script setup>
function seleccionarUsuario(id) {
  console.log(id)
}
</script>
<template>
  <Usuario
    v-for="usuario in usuarios"
    :key="usuario.id"
    :usuario="usuario"
    @seleccionar="seleccionarUsuario"
   />
</template>
```
:::

:::
::::::::::::::


Cada componente puede informar al padre de qué usuario ha seleccionado el usuario de la aplicación.



# [v-model]{.verbatim} entre componentes {#v-model-entre-componentes}

Anteriormente hemos visto cómo [v-model]{.verbatim} se puede usar en formularios, pero no está limitado a elementos HTML como [<input>]{.verbatim}. También podemos utilizarlo entre componentes, para establecer una relación entre un dato del componente padre y un componente hijo.

Antes de Vue 3.4 existía otra manera de funcionar, haciendo uso de eventos [update:]{.verbatim} que todavía se puede leer en la [documentación oficial](https://vuejs.org/guide/components/v-model.html#under-the-hood), pero a continuación se va a explicar el método recomendado

::: errorbox
En versiones anteriores a Vue 3.4 [v-model]{.verbatim} se usaba con otra sintaxis a la aquí explicada.
:::

En el componente padre tenemos que hacer que la variable use [ref()]{.verbatim} como hemos visto previamente:

::: mycode
[Componente padre]{.title}

``` vue
<script setup>
import { ref } from 'vue'

const contador = ref(0);
</script>
<template>
  <h1>Valor de {{contador}}</h1>
  <componenteVmodel v-model="contador" />
</template>
```
:::

En el componente hijo se usa la macro [[definemodel()]{.verbatim}](https://vuejs.org/api/sfc-script-setup.html#definemodel) para declarar una variable de doble dirección.

::: mycode
[Componente hijo]{.title}

``` vue
<script setup>
const contador = defineModel()

function update() {
  contador.value++
}
</script>
<template>
  <div>Parent bound v-model is: {{ contador }}</div>
  <button @click="update">Increment</button>
</template>
```
:::


En caso de querer pasar más de un parámetro debemos indicarlo mediante un argumento a [v-model]{.verbatim}:

:::::::::::::: {.columns }
::: {.column width="45%"}

::: {.mycode size=footnotesize}
[Componente padre]{.title}

``` vue
<script setup>
const contador = ref(0);
const contador2 = ref(50);
</script>
<template>
  <componenteVmodel 
     v-model:contador="contador" 
     v-model:contador2="contador2"
  />
</template>
```
:::

:::
::: {.column width="55%" }

::: {.mycode size=footnotesize}
[Componente hijo]{.title}

``` vue
<script setup>
const contador = defineModel("contador")
const contador2 = defineModel("contador2")
// ... funciones incrementar/decrementar
</script>
<template>
<!-- botones para inc/dec -->
</template>
```
:::

:::
::::::::::::::


También podemos especificar en el componente hijo qué tipo de variable esperamos, el valor por defecto en caso de que no se nos pase y si es obligatoria.

::: mycode
[Componente hijo]{.title}

``` vue
<script setup>
const contador = defineModel("contador",{
  type: Number,
  default: 0,
  requerid: true
})
</script>
```
:::


# Componentes dinámicos {#componentes-dinámicos}

En ocasiones queremos mostrar diferentes componentes dependiendo del estado de nuestra aplicación, y para ello tenemos el elemento especial [<component>]{.verbatim}


::: mycode
[Ejemplo]{.title}

``` vue
<script setup>
import Inicio from './components/Inicio.vue'
import Perfil from './components/Perfil.vue'

const componenteActual = ref(Inicio)
</script>
<template>
  <component :is="componenteActual" />
</template>
```
:::

En este ejemplo el componente que se visualiza es "Inicio", y se puede cambiar con [componenteActual.value = Perfil]{.verbatim}. También podemos utilizar directamente una variable con el componente seleccionado:


::: mycode
[Ejemplo]{.title}

``` vue
<script setup>
import Inicio from './components/Inicio.vue'
import Perfil from './components/Perfil.vue'

const componentes = {
  inicio: Inicio,
  perfil: Perfil
}

const vistaActual = ref('inicio')
</script>
<template>
  <component :is="componentes[vistaActual]" />
</template>
```
:::

Los componentes dinámicos resultan útiles para interfaces con pestañas, asistentes, paneles o diferentes vistas dentro de una misma zona.





