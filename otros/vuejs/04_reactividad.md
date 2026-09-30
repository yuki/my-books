
# Introducción {#introducción-reactividad-vue}

La **reactividad** es uno de los conceptos fundamentales de Vue. Es el mecanismo que permite que la interfaz de usuario se actualice automáticamente cuando cambian los datos de una aplicación.

En JavaScript tradicional, si modificamos una variable, el navegador no actualiza automáticamente los elementos HTML que dependen de ella. Vue añade el sistema relaciona  los datos y la interfaz. Cuando un dato reactivo cambia, Vue detecta el cambio y actualiza las partes de la interfaz que dependen de ese dato.


## El sistema de reactividad de Vue {#sistema-reactividad}

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


## [ref()]{.verbatim}

Vue tiene la función [ref()]{.verbatim} que es una de las herramientas más importantes de la Composition API. Permite crear una **referencia reactiva** de la siguiente manera:



:::::::::::::: {.columns }
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[Referencia reactiva]{.title}

``` javascript
<script setup>
const variable = ref(valorInicial)
</script>
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[Ejemplo]{.title}

``` javascript
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

``` javascript
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


## [reactive()]{.verbatim}

Otra herramienta de Vue para crear datos reactivos es `reactive()`, que está pensado principalmente para trabajar directamente con **objetos y arrays**, mientras que [ref()]{.verbatim} es más para variables "simples".


:::::::::::::: {.columns }
::: {.column width="50%"}

::: mycode
[Uso de [reactive()]{.verbatim}]{.title}

``` vue
<script setup>
import { reactive } from 'vue'

const usuario = reactive({
  nombre: 'Alice',
  edad: 20
})

usuario.nombre = 'Mikel'
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


Tal como se puede ver, se ha creado un objeto, que es [reactive]{.verbatim}, se le han modificado los atributos y luego en la vista se accede a los atributos, sin tener que usar [.value]{.verbatim}.









