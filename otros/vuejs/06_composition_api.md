
# Introducción {#introducción-composition-api}

La **[Composition API](https://vuejs.org/guide/extras/composition-api-faq.html)** es una forma de organizar la lógica de los componentes de Vue. Permite agrupar el código según su responsabilidad y facilita la reutilización de funcionalidades entre diferentes componentes.

En las unidades anteriores hemos utilizado elementos como [ref()]{.verbatim}, [reactive()]{.verbatim}, [computed()]{.verbatim} y [defineProps()]{.verbatim}. Todos ellos forman parte de las herramientas que utilizamos habitualmente al trabajar con la *Composition API*.

Un ejemplo visto previamente de un componente con un contador:

::: {.mycode size=footnotesize}
[Componente **Usuario**]{.title}

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

En este ejemplo:

- [ref()]{.verbatim} crea una referencia reactiva.
- [incrementar()]{.verbatim} modifica el estado.
- La plantilla muestra el valor del contador.
- Vue actualiza automáticamente la interfaz cuando cambia el valor.


En esta unidad aprenderemos a organizar esa lógica, gestionar el ciclo de vida de los componentes y extraer funcionalidades reutilizables mediante los llamados *composables*.


## Composition API frente a Options API {#composition-api-vs-options-api}

Vue dispone de dos estilos principales para organizar la lógica de los componentes: 

- **Options API**: la lógica se organiza mediante propiedades de un objeto, como [data]{.verbatim}, [methods]{.verbatim}, [computed]{.verbatim} y [watch]{.verbatim}.
- **Composition API**: permite organizar el comportamiento del componente mediante funciones y variables de JavaScript, en lugar de distribuirlo necesariamente entre diferentes opciones de configuración.

A continuación el mismo componente creado con ambas APIs:

:::::::::::::: {.columns }
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[Options API]{.title}

``` vue
<script>
export default {
  data() {
    // estado
    return {
      contador: 0
    }
  },

  methods: {
    //funciones
    incrementar() {
      this.contador++
    }
  }
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

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[Composition API]{.title}

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

:::
::::::::::::::


En la siguiente tabla vemos una comparativa:

| Característica | Options API | Composition API |
|---|---|---|
| Organización | Opciones como [data]{.verbatim} y [methods]{.verbatim} | Variables y funciones |
| Estado reactivo | Habitualmente [data()]{.verbatim} | [ref()]{.verbatim} y [reactive()]{.verbatim} |
| Acceso al estado | Mediante [this]{.verbatim} en los métodos | Mediante variables y referencias |
| Reutilización de lógica | Mixins y otras técnicas | Composables |
| Componentes complejos | Puede distribuir la lógica entre opciones | Permite agrupar la lógica por funcionalidad |
| Uso con [<script setup>]{.verbatim} | No es el patrón habitual | Es el patrón habitual |

Table: {tablename=yukitblrcol colspec=X[2]X[3,l]X[3,l]}


Ambas APIs siguen siendo válidas en Vue 3. La Composition API no elimina la Options API. Hemos estado utilizando **Composition API con [<script setup>]{.verbatim}**, ya que permite trabajar con una estructura sencilla y facilita la reutilización de código.


# Ciclo de vida de los componentes {#ciclo-vida-componentes}

Un componente Vue pasa por diferentes fases durante su existencia. Por ejemplo, cuando una aplicación muestra un componente, Vue debe crearlo, preparar su estado y representar su plantilla. 

Después, si cambian sus datos reactivos, la interfaz puede actualizarse. Finalmente, cuando el componente deja de utilizarse, Vue lo desmonta.

Este proceso se conoce como **ciclo de vida del componente**. Vue proporciona funciones especiales, conocidas como *[hooks del ciclo de vida](https://vuejs.org/api/composition-api-lifecycle.html)*, para ejecutar código en momentos concretos.

Entre las más importantes están:

- [onMounted()]{.verbatim}: cuando el componente se ha montado en el DOM.
- [onUpdated()]{.verbatim}: después de una actualización del DOM provocada por cambios reactivos.
- [onUnmounted()]{.verbatim}: después de desmontar el componente.

::: infobox
Estos hooks son especialmente útiles cuando necesitamos interactuar con elementos del DOM, iniciar operaciones o liberar recursos.
:::


![*Lifecycle* del componente. Fuente: [Vue.js](https://vuejs.org/guide/essentials/lifecycle.html)](img/vuejs/lifecycle.png){width=90%}



## [onMounted()]{.verbatim}

[onMounted()]{.verbatim} permite ejecutar una función cuando el componente se ha montado en el DOM.


::: mycode
[Al montar el DOM]{.title}

``` vue
<script setup>
import { onMounted } from 'vue'

onMounted(() => {
  console.log('El componente se ha montado')
})
</script>

<template>
  <h1>Mi aplicación</h1>
</template>
```
:::



La función registrada se ejecutará cuando Vue haya completado el montaje del componente.

Este hook resulta útil para tareas como:

- Inicializar una biblioteca que necesita elementos del DOM.
- Consultar el tamaño de un elemento.
- Iniciar determinadas operaciones asíncronas.
- Configurar recursos que dependen de que el componente esté montado.


## [onUpdated()]{.verbatim}

[onUpdated()]{.verbatim} permite ejecutar código después de que Vue haya actualizado el DOM de un componente como consecuencia de cambios reactivos.

::: mycode
[Al montar el DOM]{.title}

``` vue
<script setup>
import { ref, onUpdated } from 'vue'

const contador = ref(0)

onUpdated(() => {
  console.log('El DOM del componente se ha actualizado')
})
</script>

<template>
  <p>Contador: {{ contador }}</p>

  <button @click="contador++">
    Incrementar
  </button>
</template>
```
:::


Cada vez que el cambio reactivo provoca una actualización del DOM, Vue ejecutará el hook, pero debemos tener cuidado con su uso. 

No es recomendable utilizar [onUpdated()]{.verbatim} para modificar indiscriminadamente el estado reactivo que ha provocado la actualización, porque **podríamos generar un ciclo de actualizaciones**.

Por ejemplo, si dentro del hook incrementamos el contador cada vez que se actualiza la plantilla, podemos provocar actualizaciones repetidas:

::: mycode
[Debemos evitar este tipo de patrones.]{.title}

``` vue
<script setup>
// ...
onUpdated(() => {
  contador.value++
})
</script>
```
:::


En la mayoría de las situaciones, si necesitamos calcular un valor a partir del estado, será preferible utilizar [[computed()]{.verbatim}](#valores-computados). Si necesitamos reaccionar a un cambio para realizar una operación secundaria, puede ser más apropiado utilizar [[watch()]{.verbatim}](#reaccionando-con-watch).

[onUpdated()]{.verbatim} debe reservarse para los casos en los que realmente necesitamos actuar después de una actualización del DOM.


## [onUnmounted()]{.verbatim}

[onUnmounted()]{.verbatim} se ejecuta cuando Vue ha desmontado el componente. Resulta especialmente importante para liberar recursos que el componente haya creado.

::: mycode
[Liberar recursos en [onUnmounted()]{.verbatim}]{.title}

``` vue
<script setup>
import { onMounted, onUnmounted } from 'vue'

let intervalo

onMounted(() => {
  intervalo = setInterval(() => {
    console.log('Ejecutando tarea periódica')
  }, 1000)
})

onUnmounted(() => {
  clearInterval(intervalo)
})
</script>

<template>
  <p>Componente con una tarea periódica</p>
</template>
```
:::

Cuando el componente se monta, se crea un intervalo. Cuando se desmonta, se elimina mediante [clearInterval()]{.verbatim}.

::: errorbox
Si no limpiamos determinados recursos, estos pueden continuar funcionando incluso cuando el componente ya no está visible o ha dejado de utilizarse.
:::


Entre los recursos que puede ser necesario liberar están:

- Temporizadores creados con [setInterval()]{.verbatim}.
- Suscripciones a eventos globales.
- Conexiones o suscripciones externas.
- Recursos de bibliotecas que requieren una limpieza explícita.


Otro ejemplo en el que generamos eventos al presionar el teclado:

::: mycode
[Borrar eventos en [onUnmounted()]{.verbatim}]{.title}

``` vue
<script setup>
import { onMounted, onUnmounted } from 'vue'

function detectarTecla(evento) {
  console.log('Tecla pulsada:', evento.key)
}

onMounted(() => {
  window.addEventListener('keydown', detectarTecla)
})

onUnmounted(() => {
  window.removeEventListener('keydown', detectarTecla)
})
</script>

<template>
  <p>Pulsa cualquier tecla.</p>
</template>
```
:::

El evento se registra cuando el componente se monta y se elimina cuando se desmonta. De esta manera evitamos que el componente deje manejadores innecesarios activos.




# Encapsulación de lógica {#encapsulación-lógica}

En una aplicación real, un componente puede necesitar gestionar varias funcionalidades. Por ejemplo, un componente podría encargarse de:

- Obtener datos de una API.
- Controlar un formulario.
- Gestionar un contador.
- Detectar eventos del navegador.
- Calcular estadísticas.

Si toda la lógica se escribe dentro del mismo componente, el código puede resultar difícil de entender y mantener.

La Composition API permite agrupar la lógica relacionada y extraerla a funciones reutilizables. Supongamos que tenemos una funcionalidad para controlar un contador:

::: mycode
[Ejemplo de componente]{.title}

``` vue
<script setup>
import { ref, computed } from 'vue'

const contador = ref(0)

const esPositivo = computed(() => contador.value > 0)

function incrementar() {
  contador.value++
}

function decrementar() {
  contador.value--
}

function reiniciar() {
  contador.value = 0
}
</script>

<template>
  <p>Contador: {{ contador }}</p>
  <p>Es positivo: {{ esPositivo }}</p>

  <button @click="incrementar">+</button>
  <button @click="decrementar">-</button>
  <button @click="reiniciar">Reiniciar</button>
</template>
```
:::

Toda la lógica relacionada con el contador está agrupada. En un componente pequeño esto es suficiente. Sin embargo, si necesitamos reutilizar esa funcionalidad en varios componentes, podemos extraerla a una función independiente.

Esta función reutilizable recibe el nombre de ***composable***.


## *Composables* {#composables}

Un ***composable*** es una función de JavaScript que utiliza la Composition API para encapsular y reutilizar lógica relacionada con el estado de una aplicación Vue.

Por convención, los nombres de los composables suelen comenzar por **[use]{.verbatim}**. Algunos ejemplos de nombres habituales son:

- [useContador.js]{.configfile}
- [useUsuarios.js]{.configfile}
- [useAutenticacion.js]{.configfile}
- [useVentana.js]{.configfile}
- [useLocalStorage.js]{.configfile}


No son funciones especiales del lenguaje. Son funciones de JavaScript que siguen una convención de nombres y utilizan las herramientas reactivas de Vue. Un composable puede:

- Crear referencias reactivas.
- Calcular valores derivados.
- Definir funciones para modificar el estado.
- Utilizar [watch()]{.verbatim}.
- Registrar hooks del ciclo de vida cuando se llama desde un contexto válido de un componente.

La principal ventaja es que permite separar la lógica de la interfaz.


## Crear *composable* {#crear-composable}

Vamos a extraer la lógica del contador anterior. Primero creamos un archivo llamado [useContador.js]{.configfile}.

::: mycode
[Ejemplo de composable]{.title}

``` javascript
import { ref, computed } from 'vue'

export function useContador() {
  const contador = ref(0)

  const esPositivo = computed(() => contador.value > 0)

  function incrementar() {
    contador.value++
  }

  function decrementar() {
    contador.value--
  }

  function reiniciar() {
    contador.value = 0
  }

  return {
    contador,
    esPositivo,
    incrementar,
    decrementar,
    reiniciar
  }
}
```
:::

La función [useContador()]{.verbatim} crea el estado reactivo y las funciones necesarias para trabajar con él. Al final devuelve un objeto con los elementos que queremos ofrecer a quien utilice el composable. Después podemos utilizarlo desde un componente.


::: mycode
[Uso de composable en un componente]{.title}

``` vue
<script setup>
import { useContador } from './composables/useContador.js'

const {
  contador,
  esPositivo,
  incrementar,
  decrementar,
  reiniciar
} = useContador()
</script>

<template>
  <p>Contador: {{ contador }}</p>
  <p>Es positivo: {{ esPositivo }}</p>

  <button @click="incrementar">+</button>
  <button @click="decrementar">-</button>
  <button @click="reiniciar">Reiniciar</button>
</template>
```
:::

El componente ya no contiene la implementación de la lógica del contador, sólo importa el composable y utiliza los elementos que este devuelve.

Aunque Vue no obliga a utilizar directorios para separar los componentes y/o los *composables*, resulta conveniente realizar cierta separación, por lo que se ha creado la carpeta [composables]{.configdir}.


::: exercisebox
[[15](https://github.com/yuki/ejercicios/tree/main/daw/dec/vue/15)]{.solution}

Crea un *composable* con una función [obtenerUsuarios()]{.verbatim} que llama a una [API](https://jsonplaceholder.typicode.com/) para obtener usuarios.

El composable se utiliza en un componente **al ser montado** ([onMounted()]{.verbatim}) y dibuje los datos obtenidos en una tabla.
:::


## Buenas prácticas con la Composition API {#buenas-prácticas-composition-api}

A continuación se exponen ciertas buenas prácticas a la hora de hacer uso de la *Composition API*.

### Agrupar el código por responsabilidad {#agrupar-código-responsabilidad}

Es preferible que las variables, funciones y cálculos relacionados estén cerca unos de otros. Por ejemplo, en un formulario podemos agrupar:

- Los datos del formulario.
- Los errores de validación.
- Las funciones de validación.
- La función de envío.

Esto facilita comprender el comportamiento del componente.

### Evitar componentes demasiado grandes {#evitar-componentes-demasiado-grandes}

Cuando un componente empieza a contener demasiada lógica, podemos extraer algunas funcionalidades a composables. No es necesario crear un composable para cada función. Debemos hacerlo cuando exista una responsabilidad suficientemente clara o una posibilidad real de reutilización.

### Utilizar [computed()]{.verbatim} para los valores derivados {#utilizar-computed-para-valores-derivados}

Si un valor puede calcularse a partir de otros datos reactivos, normalmente debemos utilizar [computed()]{.verbatim}. Por ejemplo:

::: mycode
[Uso de composable en un componente]{.title}

``` javascript
const precio = ref(100)
const iva = ref(21)

const precioConIva = computed(() => {
  return precio.value * (1 + iva.value / 100)
})
```
:::


No es necesario mantener [precioConIva]{.verbatim} manualmente sincronizado mediante diferentes funciones.


### Reservar los hooks para sus momentos adecuados {#reservar-hooks-para-momentos-adecuados}

Debemos utilizar cada hook del ciclo de vida para el propósito correspondiente:

- [onMounted()]{.verbatim} para operaciones que necesitan el componente montado.
- [onUpdated()]{.verbatim} para tareas que realmente requieren actuar después de una actualización del DOM.
- [onUnmounted()]{.verbatim} para liberar recursos y limpiar suscripciones.


### Liberar los recursos creados {#liberar-recursos-creados}

Si registramos eventos globales o creamos intervalos, debemos asegurarnos de eliminarlos cuando corresponda. Esto ayuda a evitar fugas de memoria y operaciones innecesarias.

### Mantener los composables independientes de la interfaz {#mantener-composables-independientes}

Siempre que sea posible, un *composable* debe gestionar la lógica y el estado, mientras que el componente se encarga de representar la información. Esta separación facilita reutilizar la lógica y mantener una estructura ordenada.


