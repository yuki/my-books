
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
::: {.column width="55%"}

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
::: {.column width="45%" }

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



