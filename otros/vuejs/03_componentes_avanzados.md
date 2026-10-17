
# Componentes avanzados {#componentes-avanzados}

En las unidades anteriores hemos aprendido a crear componentes Vue, gestionar su estado reactivo, comunicar unos componentes con otros y aplicar estilos CSS.

Vue proporciona además una serie de herramientas para resolver situaciones más avanzadas, como cambiar dinámicamente el componente que se muestra, conservar su estado cuando deja de estar visible, representar elementos fuera de la estructura habitual del DOM o aplicar transiciones al mostrar y ocultar contenido.

Entre los mecanismos avanzados que ofrece Vue 3 están:

- Componentes dinámicos.
- El elemento [<component>]{.verbatim}.
- [<KeepAlive>]{.verbatim} para conservar el estado de los componentes.
- [<Teleport>]{.verbatim} para representar contenido en otra zona del DOM.
- [<Transition>]{.verbatim} y [<TransitionGroup>]{.verbatim} para crear transiciones.
- Componentes asíncronos mediante [defineAsyncComponent()]{.verbatim}.
- La gestión de contenido asíncrono y el papel de [<Suspense>]{.verbatim}.

Estas herramientas permiten construir interfaces más dinámicas y mejorar tanto la experiencia de usuario como la organización de la aplicación.


## Componentes dinámicos {#componentes-dinámicos}

Un componente dinámico es aquel que se selecciona durante la ejecución de la aplicación, en función del estado o de determinadas condiciones. Hasta ahora hemos utilizado componentes de forma directa:

::: mycode
[Uso de componentes]{.title}

``` vue
<script setup>
import Cabecera from './components/Cabecera.vue'
import Productos from './components/Productos.vue'
</script>

<template>
  <Cabecera />
  <Productos />
</template>
```
:::

En este caso, ambos componentes forman parte de la plantilla y Vue los representa siguiendo su estructura. Sin embargo, podemos necesitar mostrar un componente diferente dependiendo de la acción del usuario.

Por ejemplo, una interfaz con varias pestañas podría mostrar:

- Una vista de información personal.
- Una vista de configuración.
- Una vista de notificaciones.

Podríamos implementar cada vista mediante un componente independiente y decidir cuál mostrar en cada momento.

Los componentes dinámicos permiten resolver este tipo de situaciones sin tener que escribir una condición independiente para cada componente en toda la plantilla.


# El elemento [<component>]{.verbatim} {#elemento-componente}

Vue proporciona el elemento especial [<component>]{.verbatim} para representar dinámicamente un componente. Este elemento utiliza el atributo [is]{.verbatim} para determinar qué componente debe mostrarse.


::: mycode
[Uso de [<component>]{.verbatim}]{.title}

``` vue
<script setup>
import { shallowRef } from 'vue'

import Perfil from './components/Perfil.vue'
import Configuracion from './components/Configuracion.vue'
import Notificaciones from './components/Notificaciones.vue'

const vistaActual = shallowRef(Perfil)
</script>

<template>
  <nav>
    <button @click="vistaActual = Perfil">
      Perfil
    </button>

    <button @click="vistaActual = Configuracion">
      Configuración
    </button>

    <button @click="vistaActual = Notificaciones">
      Notificaciones
    </button>
  </nav>

  <component :is="vistaActual" />
</template>
```
:::

En este ejemplo, [vistaActual]{.verbatim} contiene una referencia al componente que queremos mostrar. Cuando el usuario pulsa uno de los botones, cambia el valor de [vistaActual]{.verbatim} y Vue representa el componente correspondiente. Se usa [shallowRef]{.verbatim} porque de esta manera únicamente hace reactivo el valor de referencia, sin convertir profundamente el objeto almacenado.

::: errorbox
Hay que usar [shallowRef]{.verbatim} en lugar de [ref]{.verbatim}, de lo contrario obtendremos *warnings* en la consola.
:::

La expresión [<component :is="vistaActual" />]{.verbatim} indica que el componente que se debe representar depende del valor de la variable reactiva.

::: exercisebox
[[16](https://github.com/yuki/ejercicios/tree/main/daw/dec/vue/16)]{.solution}

Crea un componente que tenga tres botones. Dependiendo del pulsado se visualizará un componente hijo u otro.
:::


## Utilizar nombres de componentes

También podemos seleccionar un componente mediante una cadena de texto, siempre que el nombre pueda resolverse correctamente.

Por ejemplo, con componentes importados y registrados de forma local en [<script setup>]{.verbatim}, es recomendable utilizar directamente las referencias a los componentes, como en el ejemplo anterior.

Esto evita depender de nombres de componentes registrados globalmente.

## Componentes dinámicos y [v-if]{.verbatim}

Podríamos resolver el ejemplo de las pestañas utilizando [v-if]{.verbatim}:

::: mycode
[Uso de [v-if]{.verbatim}]{.title}

``` vue
<Perfil v-if="vistaActual === 'perfil'" />
<Configuracion v-else-if="vistaActual === 'configuracion'" />
<Notificaciones v-else />
```
:::

Esta solución también es válida. Sin embargo, [<component>]{.verbatim} resulta especialmente útil cuando la selección dinámica de componentes forma parte importante de la lógica de la interfaz.

Debemos recordar que cambiar de componente puede provocar que el componente anterior se desmonte y que el nuevo se monte. Si necesitamos conservar el estado de los componentes al alternar entre ellos, podemos utilizar [<KeepAlive>]{.verbatim}.


# [<KeepAlive>]{.verbatim} {#keepalive}

De forma predeterminada, cuando Vue deja de representar un componente dinámico y pasa a mostrar otro, el componente anterior puede desmontarse.

Al desmontarse, su estado local deja de mantenerse como el estado activo de esa instancia. Por ejemplo, imaginemos un componente que contiene un formulario:

::: mycode
[Formulario simple]{.title}

``` vue
<script setup>
import { ref } from 'vue'

const nombre = ref('')
</script>

<template>
  <form>
    <label>
      Nombre:
      <input v-model="nombre">
    </label>

    <p>Nombre introducido: {{ nombre }}</p>
  </form>
</template>
```
:::

Si el usuario escribe un nombre, cambia a otra vista y después vuelve al formulario, puede encontrarse con que el componente se ha creado de nuevo y el campo está vacío. En determinadas situaciones esto no es deseable, por lo que Vue proporciona [<KeepAlive>]{.verbatim} para conservar las instancias de los componentes dinámicos cuando dejan de estar activas.

Por ejemplo:

::: mycode
[Uso de [keepalive]{.verbatim}]{.title}

``` vue
<KeepAlive>
  <component :is="vistaActual" />
</KeepAlive>
```
:::

Con esta estructura, Vue puede mantener en caché la instancia del componente que deja de mostrarse, en lugar de destruirla inmediatamente. Cuando se vuelve a seleccionar ese componente, Vue puede reutilizar la instancia conservada y mantener su estado local.

## Hooks relacionados con [<KeepAlive>]{.verbatim} {#hooks-relacionados-keepalive}

Los componentes que se conservan mediante [<KeepAlive>]{.verbatim} tienen un comportamiento especial. En lugar de desmontarse cuando dejan de estar activos, pueden [desactivarse y volver a activarse](https://vuejs.org/guide/built-ins/keep-alive.html#lifecycle-of-cached-instance) posteriormente.

Vue proporciona dos hooks para detectar estas situaciones:

- [onActivated()]{.verbatim}: se ejecuta cuando la instancia conservada se activa.
- [onDeactivated()]{.verbatim}: se ejecuta cuando la instancia conservada se desactiva.

Por ejemplo:

::: mycode
[Uso de [onActivated()]{.verbatim} y [onDeactivated()]{.verbatim}]{.title}

``` vue
<script setup>
import { onActivated, onDeactivated } from 'vue'

onActivated(() => {
  console.log('El componente está activo')
})

onDeactivated(() => {
  console.log('El componente está inactivo')
})
</script>

<template>
  <p>Componente conservado en caché</p>
</template>
```
:::


Estos hooks son útiles cuando necesitamos ejecutar operaciones específicas al recuperar o abandonar temporalmente una vista.


## Limitar los componentes conservados {#limitar-componentes-conservados}

[<KeepAlive>]{.verbatim} permite utilizar los atributos [include]{.verbatim}, [exclude]{.verbatim} y [max]{.verbatim}. El parámetro [[max]{.verbatim}](https://vuejs.org/guide/built-ins/keep-alive.html#max-cached-instances) establece el número máximo de instancias que se conservan en la caché.


::: mycode
[Uso de [max]{.verbatim}]{.title}

``` vue
<KeepAlive :max="5">
  <component :is="vistaActual" />
</KeepAlive>
```
:::


También podemos limitar los componentes que se almacenan:

::: mycode
[Uso de *include*]{.title}

``` vue
<KeepAlive :include="['Perfil', 'Formulario']">
  <component :is="vistaActual" />
</KeepAlive>
```
:::

El comportamiento de [include]{.verbatim} y [exclude]{.verbatim} depende del nombre del componente. Conviene comprobar que los componentes tienen los nombres esperados.

::: warnbox
[<KeepAlive>]{.verbatim} no debe utilizarse indiscriminadamente. Mantener demasiadas instancias en memoria puede aumentar el consumo de recursos. Debemos emplearlo cuando conservar el estado aporte una ventaja real.
:::


# [<Teleport>]{.verbatim} {#teleport}

Normalmente, Vue representa el contenido de un componente en la posición del DOM que corresponde a su plantilla. Sin embargo, en ocasiones necesitamos mostrar contenido en otra zona del documento. Por ejemplo:

- Una ventana modal.
- Un cuadro de confirmación.
- Un menú emergente.
- Un aviso flotante.
- Un panel que debe situarse directamente bajo el elemento [<body>]{.verbatim}.

Vue proporciona [[<Teleport>]{.verbatim}](https://vuejs.org/guide/built-ins/teleport.html) para resolver este problema. [<Teleport>]{.verbatim} permite representar una parte de la plantilla en otro lugar del DOM sin cambiar la organización lógica de los componentes.


En el siguiente ejemplo, el contenido de [<Teleport>]{.verbatim} se representa dentro del elemento [body]{.verbatim}, aunque el código de la plantilla esté situado dentro de un componente Vue.


::: mycode
[Uso de *Teleport*]{.title}

``` vue
<template>
  <button>
    Abrir ventana
  </button>

  <Teleport to="body">
    <div class="modal">
      <h2>Ventana modal</h2>
      <p>Este contenido se representa dentro de body.</p>
    </div>
  </Teleport>
</template>
```
:::

**El atributo [to]{.verbatim} indica el destino**. Puede utilizarse un selector CSS (como el ejemplo anterior), o un selector que identifique otro elemento existente en el DOM (**que debe existir el elemento con ese identificador**):

::: mycode
[Uso de *Teleport*]{.title}

``` vue
<Teleport to="#zona-modales">
<!-- ... -->
</Teleport>
```
:::


## Aspectos importantes de [<Teleport>]{.verbatim} {#aspectos-importantes-teleport}

Hay que tener ciertos aspectos importantes al usar [<Teleport>]{.verbatim}:

- No crea un componente nuevo.
- No cambia la relación lógica entre el componente padre y el contenido teletransportado.
- El contenido sigue utilizando el estado y los eventos del componente que lo declara.
- El destino debe existir cuando Vue necesite representar el contenido, salvo que se utilicen las opciones específicas previstas para destinos diferidos en versiones compatibles.
- No proporciona automáticamente toda la accesibilidad de una ventana modal.

En una ventana modal real también debemos considerar el foco del teclado, la posibilidad de cerrarla mediante Escape, la gestión del foco al cerrarla y el comportamiento para lectores de pantalla.


Si no usamos [<Teleport>]{.verbatim}, dependiendo de dónde se incluyese el componente, parte de su contenido podría quedar recortado, o podría afectar a su comportamiento. 

::: infobox
Al utilizar [<Teleport>]{.verbatim}, podemos representar la ventana en una zona distinta del DOM y evitar determinados problemas de posicionamiento y apilamiento.
:::


::: exercisebox
[[17](https://github.com/yuki/ejercicios/tree/main/daw/dec/vue/17)]{.solution}

Crea un componente que haga un modal y "teletranspórtalo" a un [<div id="modals">]{.verbatim} que esté en el [index.html]{.configfile}.
:::


# [<Transition>]{.verbatim} {#transition}

Vue permite añadir transiciones cuando un elemento aparece o desaparece de la interfaz. Por ejemplo, podemos hacer que un mensaje aparezca progresivamente en lugar de mostrarse de forma inmediata. Para ello utilizamos el componente integrado [<Transition>]{.verbatim}.



::: mycode
[Uso de *Transition*]{.title}
``` vue
<script setup>
import { ref } from 'vue'

const visible = ref(false)
</script>

<template>
  <button @click="visible = !visible">
    Mostrar u ocultar
  </button>

  <Transition>
    <p v-if="visible" class="mensaje">
      Hola, este mensaje tiene una transición.
    </p>
  </Transition>
</template>

<style scoped>
.mensaje {
  padding: 16px;
  background: lightblue;
  border-radius: 8px;
}

.v-enter-active,
.v-leave-active {
  transition: opacity 0.4s ease;
}

.v-enter-from,
.v-leave-to {
  opacity: 0;
}
</style>
```
:::

Cuando el elemento aparece, su opacidad pasa de [0]{.verbatim} a su valor normal. Cuando desaparece, la opacidad pasa a [0]{.verbatim} antes de que Vue retire el elemento del DOM.

::: exercisebox
[[17](https://github.com/yuki/ejercicios/tree/main/daw/dec/vue/17)]{.solution}

Partiendo del [ejercicio 15](https://github.com/yuki/ejercicios/tree/main/daw/dec/vue/15) añade un botón por fila que simule borrar un usuario y haga una transición eliminando la fila.
:::


## Clases de transición {#clases-transición}

Vue aplica diferentes clases de CSS durante las fases de entrada y salida tal como se puede ver en la siguiente imagen: 

![Clases por defecto en transiciones. Fuente: [Vue.js](https://vuejs.org/guide/built-ins/transition.html#css-based-transitions)](img/vuejs/transition.png){width=100%}


En la siguiente tabla aparece cada clase y el momento en el que se usan:

| Clase | Momento |
|---|---|
| [v-enter-from]{.verbatim} | Estado inicial de la entrada |
| [v-enter-active]{.verbatim} | Durante la transición de entrada |
| [v-enter-to]{.verbatim} | Estado final de la entrada |
| [v-leave-from]{.verbatim} | Estado inicial de la salida |
| [v-leave-active]{.verbatim} | Durante la transición de salida |
| [v-leave-to]{.verbatim} | Estado final de la salida |



Estas clases utilizan el prefijo [v-]{.verbatim} por defecto pero podemos personalizarlo mediante el atributo [name]{.verbatim} como aparece en el siguiente ejemplo:


::: mycode
[Clases personalizadas]{.title}
``` vue
<Transition name="desvanecer">
  <p v-if="visible">
    Mensaje
  </p>
</Transition>
<style scoped>+
.desvanecer-enter-active,
.desvanecer-leave-active {
  transition: opacity 0.4s ease;
}

.desvanecer-enter-from,
.desvanecer-leave-to {
  opacity: 0;
}
</style>
```
:::

En el ejemplo anterior, gracias al parámetro [name]{.verbatim}, las clases utilizarán el prefijo [desvanecer-]{.verbatim} tal como se ve en el apartado de estilos. Gracias a esto, podemos tener diferentes tipos de transiciones en una misma aplicación.



## Transiciones con desplazamiento {#transiciones-desplazamiento}

También podemos combinar opacidad y desplazamiento. Si utilizamos [name="deslizar"]{.verbatim}, el elemento aparecerá y desaparecerá con un pequeño desplazamiento vertical utilizando el siguiente ejemplo:


::: mycode
[Clases personalizadas]{.title}
``` vue
<style scoped>
.deslizar-enter-active,
.deslizar-leave-active {
  transition:
    opacity 0.3s ease,
    transform 0.3s ease;
}

.deslizar-enter-from {
  opacity: 0;
  transform: translateY(12px);
}

.deslizar-leave-to {
  opacity: 0;
  transform: translateY(-12px);
}
</style>
```
:::


## ¿Qué elementos pueden utilizar [<Transition>]{.verbatim}? {#elementos-transition}

[<Transition>]{.verbatim} se utiliza habitualmente con un único elemento o componente que aparece o desaparece. Puede trabajar, entre otros, con:

- Elementos controlados por [v-if]{.verbatim}.
- Elementos controlados por [v-show]{.verbatim}.
- Componentes dinámicos.
- Componentes que cambian de una vista a otra.

Por ejemplo:


::: mycode
[Clases personalizadas]{.title}
``` vue
<Transition name="deslizar">
  <div v-if="visible">
    Contenido animado
  </div>
</Transition>
```
:::


En cambio, si queremos animar la inserción, eliminación u ordenación de varios elementos de una lista, normalmente debemos utilizar [<TransitionGroup>]{.verbatim} que veremos después.

## Consideraciones de accesibilidad {#consideraciones-accesibilidad}

Las animaciones deben mejorar la experiencia de usuario, no dificultarla. Debemos evitar movimientos excesivos y considerar la preferencia del usuario por reducir las animaciones. Podemos utilizar la consulta de medios [prefers-reduced-motion]{.verbatim}:

::: mycode
[Ejemplo para reducir transiciones]{.title}
``` vue
@media (prefers-reduced-motion: reduce) {
  .deslizar-enter-active,
  .deslizar-leave-active {
    transition: none;
  }
}
```
:::


De esta forma, los usuarios que hayan indicado que prefieren reducir el movimiento podrán experimentar una interfaz con menos animaciones.


# [<TransitionGroup>]{.verbatim} {#transitiongroup}

[<TransitionGroup>]{.verbatim} permite animar la entrada, salida y movimiento de varios elementos de una lista. Es especialmente útil cuando una lista cambia como consecuencia de las acciones del usuario. Por ejemplo, podemos crear una lista en la que sea posible añadir y eliminar elementos.

::: mycode
[Ejemplo *TransitionGroup*]{.title}

``` vue
<script setup>
import { ref } from 'vue'

const siguienteId = ref(4)

const elementos = ref([
  { id: 1, texto: 'Elemento 1' },
  { id: 2, texto: 'Elemento 2' },
  { id: 3, texto: 'Elemento 3' }
])

function agregar() {
  elementos.value.push({
    id: siguienteId.value,
    texto: `Elemento ${siguienteId.value}`
  })

  siguienteId.value++
}

function eliminar(id) {
  elementos.value = elementos.value.filter(
    elemento => elemento.id !== id
  )
}
</script>

<template>
  <button @click="agregar">
    Añadir elemento
  </button>

  <TransitionGroup name="lista" tag="ul">
    <li
      v-for="elemento in elementos"
      :key="elemento.id"
    >
      {{ elemento.texto }}

      <button @click="eliminar(elemento.id)">
        Eliminar
      </button>
    </li>
  </TransitionGroup>
</template>

<style scoped>
.lista-enter-active,
.lista-leave-active,
.lista-move {
  transition: all 0.3s ease;
}

.lista-enter-from,
.lista-leave-to {
  opacity: 0;
  transform: translateX(20px);
}

.lista-leave-active {
  position: absolute;
}
</style>
```
:::

En este ejemplo, los elementos pueden aparecer y desaparecer con una transición. Además, si su posición cambia debido a la inserción o eliminación de otros elementos, la clase [lista-move]{.verbatim} permite animar ese desplazamiento.


## Diferencias entre [<Transition>]{.verbatim} y [<TransitionGroup>]{.verbatim}

En la siguiente tabla se puede ver las diferencias entre las dos características vistas previamente:

| Característica | [<Transition>]{.verbatim} | [<TransitionGroup>]{.verbatim} |
|---|---|---|
| Uso principal | Entrada y salida de un elemento o componente | Entrada, salida y movimiento de elementos de una lista |
| Número de elementos | Normalmente uno | Varios |
| Uso de [key]{.verbatim} | Depende del elemento y de la situación | Cada elemento de la lista debe tener una clave única |
| Elemento contenedor | No introduce necesariamente un contenedor adicional | Puede utilizar [tag]{.verbatim} para definir el elemento contenedor |

Table: {tablename=yukitblrcol colspec=X[2]X[3,l]X[3,l]}



[<TransitionGroup>]{.verbatim} no sustituye a [v-for]{.verbatim}: normalmente se utiliza junto a esta directiva. 

::: warnbox
Es importante proporcionar claves estables para que Vue pueda identificar los elementos y aplicar las transiciones correctamente.
:::


# Componentes asíncronos {#componentes-asíncronos}

En una aplicación grande, no siempre es necesario cargar todos los componentes al iniciar la página. Por ejemplo, podemos tener una aplicación con:

- Una página principal.
- Un panel de estadísticas.
- Un editor avanzado.
- Un sistema de informes.

Si algunos componentes solo se utilizan ocasionalmente, cargar todo su código desde el principio puede aumentar el tiempo de carga inicial.

Vue permite definir componentes asíncronos para cargar determinados componentes cuando se necesitan. La idea consiste en dividir el código de la aplicación en diferentes fragmentos que puedan cargarse por separado. Esto suele combinarse con las importaciones dinámicas de JavaScript.

<!-- Por ejemplo:

~~~javascript
const modulo = await import('./components/Estadisticas.vue')
~~~
 -->

La importación dinámica devuelve una promesa que se resuelve con el módulo cargado. Sin embargo, en una plantilla Vue no debemos utilizar directamente esa promesa como si fuera un componente. Para gestionar este proceso disponemos de [defineAsyncComponent()]{.verbatim}.

<!-- https://oneuptime.com/blog/post/2026-01-24-vue-async-components/view -->

<!-- https://www.patterns.dev/vue/async-components/  -->



## [defineAsyncComponent()]{.verbatim} {#defineAsyncComponent}

La función [defineAsyncComponent()]{.verbatim} permite definir un componente cuya implementación se carga de forma asíncrona.

::: mycode
[Ejemplo *defineAsyncComponent*]{.title}

``` vue
<script setup>
import { defineAsyncComponent } from 'vue'

const Estadisticas = defineAsyncComponent(
  () => import('./components/Estadisticas.vue')
)
</script>

<template>
  <Estadisticas />
</template>
```
:::

Vue cargará el componente mediante una importación dinámica cuando sea necesario. Con Vite, esta importación permite que el sistema de compilación genere un fragmento de código independiente cuando corresponda. De esta forma, el componente puede no formar parte del código JavaScript inicial de la aplicación.

Entre las ventajas de usar componentes asíncronos se puede destacar:

- Permiten dividir el código en fragmentos.
- Pueden reducir el código que debe descargarse inicialmente.
- Facilitan cargar componentes pesados solo cuando se necesitan.
- Son útiles para paneles, editores, informes y otras funciones secundarias.

No obstante, dividir el código no garantiza por sí solo una mejora del rendimiento. Debemos considerar el tamaño de los componentes, cuándo se cargan y la experiencia que percibe el usuario.

## Componentes asíncronos con opciones

La función [defineAsyncComponent()]{.verbatim} también permite configurar diferentes opciones, como un componente de carga, un componente de error o un tiempo de espera.

Por ejemplo:

::: mycode
[Ejemplo con opciones]{.title}

``` vue
<script setup>
import { defineAsyncComponent } from 'vue'

import Cargando from './components/Cargando.vue'
import ErrorCarga from './components/ErrorCarga.vue'

const Estadisticas = defineAsyncComponent({
  loader: () => import('./components/Estadisticas.vue'),
  loadingComponent: Cargando,
  errorComponent: ErrorCarga,
  delay: 200,
  timeout: 10000
})
</script>

<template>
  <Estadisticas />
</template>
```
:::

En este ejemplo:

- [loader]{.verbatim}: define cómo se carga el componente.
- [loadingComponent]{.verbatim}: especifica qué componente mostrar mientras se carga.
- [errorComponent]{.verbatim}: indica qué componente utilizar si se produce un error de carga.
- [delay]{.verbatim}: establece el retraso antes de mostrar el componente de carga.
- [timeout]{.verbatim}: establece un tiempo límite tras el cual la carga se considera fallida.

El componente de error permite ofrecer una respuesta visual si el módulo no puede cargarse y un tiempo de espera agotado no significa necesariamente que la descarga se haya cancelado. **Debemos diseñar el tratamiento de errores teniendo en cuenta las limitaciones reales de la red y de la aplicación**.


# Suspense {#suspense}

[<Suspense>]{.verbatim} es un componente integrado de Vue diseñado para coordinar estados de espera asociados a dependencias asíncronas de determinados componentes. Es decir, permite definir contenido alternativo mientras se resuelven esas dependencias. 

::: warnbox
Actualmente *[Suspense](https://vuejs.org/guide/built-ins/suspense.html)* es una *feature* experimental.
:::

Por ejemplo, podemos tener una interfaz principal y mostrar un mensaje de carga mientras se prepara un componente asíncrono.

::: mycode
[Ejemplo con *Suspense*]{.title}

``` vue
<script setup>
import { defineAsyncComponent } from 'vue'

const Estadisticas = defineAsyncComponent(
  () => import('./components/Estadisticas.vue')
)
</script>

<template>
  <Suspense>
    <template #default>
      <Estadisticas />
    </template>

    <template #fallback>
      <p>Cargando estadísticas...</p>
    </template>
  </Suspense>
</template>
```
:::

La idea general es que Vue pueda mostrar el contenido de reserva mientras espera a que se resuelvan las dependencias asíncronas que reconoce dentro del árbol correspondiente.

## Diferencias entre con [loadingComponent]{.verbatim} {#diferencias-con-loadingComponent}

Ambos mecanismos están relacionados con la carga asíncrona, pero tienen propósitos diferentes: 

- [loadingComponent]{.verbatim}, configurado en [defineAsyncComponent()]{.verbatim}, proporciona un componente de carga para ese componente asíncrono.
- [<Suspense>]{.verbatim}, por su parte, coordina un estado de espera en un árbol de componentes y permite definir contenido alternativo mediante el slot [fallback]{.verbatim}.

No debemos asumir que cualquier petición realizada con [fetch()]{.verbatim} activa automáticamente [<Suspense>]{.verbatim}. Una petición asíncrona ordinaria no queda coordinada automáticamente por este componente solo por ejecutarse dentro de un componente Vue.

## Consideración importante sobre su uso

La API de [<Suspense>]{.verbatim} debe utilizarse teniendo en cuenta la versión de Vue y las características concretas de la aplicación. Su estado y sus opciones de uso pueden evolucionar.

En proyectos sencillos, gestionar explícitamente los estados "cargando", "error" y "datos" mediante referencias reactivas sigue siendo una solución clara y válida.

Por ejemplo:

::: mycode
[Ejemplo con *Suspense*]{.title}

``` vue
<script setup>
import { ref, onMounted } from 'vue'

const datos = ref(null)
const cargando = ref(true)
const error = ref('')

onMounted(async () => {
  try {
    const respuesta = await fetch('/api/estadisticas')

    if (!respuesta.ok) {
      throw new Error('No se pudieron cargar las estadísticas')
    }

    datos.value = await respuesta.json()
  } catch (err) {
    error.value = err.message
  } finally {
    cargando.value = false
  }
})
</script>

<template>
  <p v-if="cargando">
    Cargando estadísticas...
  </p>

  <p v-else-if="error">
    {{ error }}
  </p>

  <pre v-else>{{ datos }}</pre>
</template>
```
:::

Este patrón resulta especialmente útil cuando queremos controlar explícitamente los estados de carga y error de una petición HTTP.


