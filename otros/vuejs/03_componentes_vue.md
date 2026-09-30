
# Concepto de componente {#concepto-componente}

Uno de los conceptos fundamentales de Vue es el **componente**, que se puede definir como una parte independiente y reutilizable de la interfaz de una aplicación. En lugar de construir toda la aplicación dentro de un único archivo, **podemos dividirla en pequeñas piezas que tengan una responsabilidad concreta**.

Una aplicación Vue puede contener decenas, cientos o incluso miles de componentes dependiendo de su tamaño: cabecera, menú, lista de productos, producto, carrito, formulario de creación, pie de página, ...


## Ventajas de utilizar componentes {#ventajas-componentes}

La utilización de componentes proporciona varias ventajas, entre las que podemos destacar:

- **Reutilización**: Un mismo componente puede utilizarse varias veces. Por ejemplo, si tenemos un componente [ProductCard.vue]{.verbatim}, podemos utilizarlo para representar todos los productos de una tienda. Por lo tanto, cada vez que se visualiza un producto, se llamará a ese componente.
- **Mantenimiento**: Si toda la lógica relacionada con una parte de la interfaz está concentrada en un componente, modificarla resulta más sencillo. Por ejemplo, si queremos cambiar el aspecto de todas las tarjetas de producto, sólo necesitamos modificar el [ProductCard.vue]{.verbatim} y se reflejará en todo.
- **Organización**: Los componentes permiten dividir una aplicación compleja en unidades más pequeñas. Esto facilita que diferentes desarrolladores puedan trabajar en distintas partes de una aplicación.
- **Encapsulación**: Un componente puede contener su propia estructura HTML, lógica JavaScript y estilos CSS. De esta forma, podemos mantener agrupado el código relacionado con una determinada funcionalidad.


## Responsabilidad al crear componentes {#responsabilidad-crear-componentes}

Una buena aplicación no debería convertir cada pequeño elemento HTML en un componente sin una razón clara, ni tampoco tener componentes de cientos de líneas. Es por eso que a la hora de hacer una aplicación debemos realizar un análisis para dividir la aplicación en **unidades con sentido**.

::: infobox
Cada componente representa una parte con una responsabilidad concreta que tiene que tener sentido.
:::


# *Single File Components* {#single-file-components}

Vue proporciona un formato de archivo denominado ***Single File Component* (SFC)**. Los componentes SFC utilizan normalmente la extensión [.vue]{.verbatim} y permiten mantener en un mismo archivo las diferentes partes que forman un componente.

Un componente sencillo puede tener la siguiente estructura:

::: mycode
[Componente Vue]{.title}

``` vue
<template>
  <h1>Hola Vue</h1>
</template>

<script setup>
const mensaje = 'Bienvenido a Vue 3'
</script>

<style>
h1 {
  color: blue;
}
</style>
```
:::

Este componente contiene tres partes:

- [<template>]{.verbatim}:  define la estructura visual del componente. 
- [<script setup>]{.verbatim}: contiene la lógica.
- [<style>]{.verbatim}: contiene los estilos.

No es obligatorio utilizar siempre los tres bloques, por lo que la estructura dependerá de las necesidades del componente.


# Estructura de un componente {#estructura-componente}

Tal somo se ha visto, un componente consta de tres apartados diferenciados, y de esta manera poder tener diferenciado cada lógica/estructura.

## [<template>]{.verbatim} {#componente-template}

En su interior utilizaremos HTML junto con la sintaxis de plantillas proporcionada por Vue. Aparte de poder utilizar cualquier etiqueta o elemento HTML, Vue nos proporciona mecanismos que permiten relacionar este HTML con datos y lógica JavaScript.

::: mycode
[Scripts en la configuración]{.title}

``` vue
<template>
  <h1>Hola {{nombre}}</h1>
  <p>Texto de la página.</p>
</template>
```
:::

En este ejemplo [{{nombre}}]{.verbatim} es una variable que debe ser definida dentro del bloque [<script setup>]{.verbatim}. Esta técnica se denomina **interpolación** y se estudiará más adelante.

En versiones anteriores de Vue dentro de [<template>]{.verbatim} sólo permitía tener un único elemento raíz.


## [<script setup>]{.verbatim}

Dentro de este bloque se escribe la lógica del componente usando JavaScript. La palabra [setup]{.verbatim} hace referencia a la **[Composition API](https://vuejs.org/api/composition-api-setup.html)** de Vue, que aparece en Vue 3.0 en 2020.


::: mycode
[Scripts en la configuración]{.title}

``` vue
<script setup>
const nombre = 'Bob'

function saludar() {
  console.log(`Hola ${nombre}`)
}
</script>

<template>
  <h1>Hola {{ nombre }}</h1>

  <button @click="saludar">
    Saludar
  </button>
</template>
```
:::


Las variables y funciones declaradas en [<script setup>]{.verbatim} están disponibles automáticamente dentro del [<template>]{.verbatim}. No es necesario hacer nada para registrar [nombre]{.verbatim} y [saludar]{.verbatim}, ya que Vue se encarga de hacerlos disponibles dentro de la plantilla.


## [<style>]{.verbatim} {#estructura-style}

Este bloque contiene los estilos CSS del componente, pero hay que entender que por defecto, los estilos definidos en un componente pueden tener un ámbito que no se limita necesariamente al componente.

### Estilo global {#estilo-global}

En el siguiente ejemplo, las reglas CSS creadas dentro del componente no se van a limitar sólo al contenido del componte. Cualquier otro [h1]{.verbatim} de la aplicación podrá tener el color rojo, teniendo en cuenta las reglas de especificidad.

::: mycode
[Estilo global]{.title}

``` vue
<template>
  <h1>Hola mundo</h1>
</template>

<style>
h1 {
    color:red;
}
</style>
```
:::


### Estilos encapsulados {#estilos-encapsulados}

Vue proporciona el atributo [scoped]{.verbatim} para limitar los estilos a los elementos del componente. De esta manera, Vue transforma internamente los estilos para evitar que se apliquen de forma accidental a elementos equivalentes de otros componentes.

::: mycode
[Estilo encapsulado]{.title}

``` vue
<template>
  <h1>Hola mundo</h1>
</template>

<style scoped>
h1 {
    color:red;
}
</style>
```
:::


# Registro y uso de componentes {#registro-uso-componentes}

Por defecto tenemos un componente "raíz" que es [App.vue]{.verbatim}, y este puede tener componentes hijos que a su vez tienen otros. El componente que utiliza otros componentes se denomina **componente padre**, mientras que el que es utilizado por otro se denomina **componente hijo**.


Para utilizar un componente dentro de otro componente debemos importarlo y utilizarlo en el [<template>]{.verbatim}. Imaginemos que tenemos el componente [components/CabeceraH1.vue]{.configfile} que queremos usarlo en [App.vue]{.verbatim}:



:::::::::::::: {.columns }
::: {.column width="36%"}

::: {.mycode size=footnotesize}
[Componente CabeceraH1.vue]{.title}

``` vue
<template>
  <header>
    <h1>Mi aplicación</h1>
  </header>
</template>
```
:::

:::
::: {.column width="64%" }

::: {.mycode size=footnotesize}
[Importarlo en App.vue]{.title}

``` vue
<script setup>
import CabeceraH1 from './components/CabeceraH1.vue'
</script>

<template>
  <CabeceraH1 />
</template>
```
:::

:::
::::::::::::::

Tenemos que entender qué esta sucediendo en el ejemplo anterior:

- Tenemos el componente [CabeceraH1.vue]{.verbatim} dentro del directorio [components/]{.configdir}
- Dentro del componente [App.vue]{.verbatim} queremos usarlo, por lo que:
  - Dentro de [<script setup>]{.verbatim} lo importamos
  - En la plantilla [<template>]{.verbatim} lo usamos como una etiqueta HTML nueva, teniendo en cuenta el nombre del fichero del componente.


::: warnbox
Los componentes deben ser multi-palabra, para evitar confusiones con etiquetas HTML o componentes propios de Vue. **No es obligatorio**, pero de no ser así, el *linter* dará *warnings*.
:::


## Reutilización de componentes {#reutilización-componentes}

Una de las principales ventajas de los componentes es que podemos utilizar el mismo componente varias veces. Imaginemos que tenemos un componente para visualizar productos de una tienda, podemos reutilizarlo varias veces:

::: mycode
[Reutilizar ProductCard.vue]{.title}

``` vue
<template>
  <ProductCard nombre="Teclado" />
  <ProductCard nombre="Ratón" />
  <ProductCard nombre="Monitor" />
</template>
```
:::

Aunque todavía no hemos visto cómo pasar parámetros a los componentes, en el ejemplo anterior se usan los conocidos como ***props*** para proporcionar diferentes datos a cada instancia.

Esta separación entre el componente y los datos que recibe será fundamental para desarrollar interfaces reutilizables.


## Crear componente {#crear-componente}

Vamos a crear un componente en nuestro proyecto vacío. Aunque podemos crear el componente directamente en el directorio [src]{.configdir}, tal como se ha dicho previamente vamos a organizarlos en la carpeta [src/components]{.configdir}:

El archivo [src/components/CabeceraH1.vue]{.configfile} tendrá:


::: mycode
[Crear nuevo componente]{.title}

``` vue
<template>
  <h1>Bienvenido a Vue 3</h1>
</template>
```
:::

Ahora podemos utilizarlo en el componente raíz [App.vue]{.verbatim}.

::: mycode
[Usar nuevo componente]{.title}

``` vue
<script setup>
import CabeceraH1 from './components/CabeceraH1.vue';

</script>

<template>
  <h1>Mi aplicación</h1>

  <Saludo />
</template>
```
:::




## Componente con estructura, lógica y estilos {#componente-estructura-logica-estilos}

Vamos a crear un componente que utilice las tres partes principales de un *Single File Component*.


::: mycode
[Crear nuevo componente]{.title}

``` vue
<script setup>
const titulo = 'Clicka'

function mostrarMensaje() {
  console.log('Has pulsado el botón')
}
</script>

<template>
  <article class="tarjeta">
    <h2>{{ titulo }}</h2>

    <button @click="mostrarMensaje">
      Mostrar mensaje
    </button>
  </article>
</template>

<style scoped>
.tarjeta {
  padding: 1rem;
  border: 1px solid #ccc;
}

button {
  padding: 0.5rem 1rem;
}
</style>
```
:::


Este ejemplo reúne varios conceptos:

- Variables JavaScript en [<script setup>]{.verbatim}.
- Funciones JavaScript.
- HTML en [<template>]{.verbatim}.
- Interpolación.
- Eventos.
- CSS en [<style>]{.verbatim}.
- Estilos encapsulados mediante [scoped]{.verbatim}.


Más adelante profundizaremos en cada apartado, pero de momento sirve como ejemplo completo.


::: exercisebox
Analiza una página web que visites de manera habitual (un periódico, foro de noticias, ...) y divide mentalmente su interfaz en componentes.
:::


::: exercisebox
Crea un componente para productos y úsalo 3 veces. Debe contener:

- Nombre del producto.
- Descripción.
- Precio.
- Un botón.

De momento contendrá la misma información, más adelante usaremos variables.
:::


# Plantillas y renderizado {#plantillas-renderizado}

Las plantillas ([<template>]{.verbatim}) de Vue permiten definir la estructura visual de un componente utilizando HTML junto con una serie de características propias de Vue.

A primera vista, una plantilla Vue se parece mucho a un documento HTML convencional. La diferencia es que Vue permite incorporar **expresiones JavaScript, directivas y enlaces de datos** para que el contenido de **la interfaz pueda cambiar de forma dinámica**.



## Interpolación de expresiones {#interpolación-expresiones}

La forma más sencilla de mostrar datos dinámicos en una plantilla es mediante la **interpolación**. La interpolación utiliza una pareja de llaves dobles [{{ expresión }}]{.verbatim}. Por ejemplo:


:::::::::::::: {.columns }
::: {.column width="40%"}

::: {.mycode size=footnotesize}
[Interpolación]{.title}

``` vue
<script setup>
const nombre = 'Bob'
const edad = 20
</script>

<template>
  <h1>{{ nombre }}</h1>
  <p>{{ edad }}</p>
</template>
```
:::

:::
::: {.column width="60%" }

::: {.mycode size=footnotesize}
[Interpolación]{.title}

``` vue
<script setup>
const nombre = 'Ane'
const edad = 20
</script>

<template>
  <p>{{ 10 + 5 }}</p>
  <p>{{ nombre.toUpperCase() }}</p>
  <p>{{ edad >= 18 ? 'Mayor' : 'Menor' }}</p>
</template>
```
:::

:::
::::::::::::::


### ¿Qué podemos utilizar dentro de [{{ }}]{.verbatim}? {#qué-podemos-usar}

Dentro de [{{ }}]{.verbatim} podemos utilizar expresiones JavaScript que produzcan un valor:

::: mycode
[Ejemplos]{.title}

``` vue
<p>{{ nombre }}</p>
<p>{{ edad + 1 }}</p>
<p>{{ nombre.toUpperCase() }}</p>
<p>{{ usuario.nombre }}</p>
<p>{{ productos.length }}</p>
```
:::

Sin embargo, no debemos utilizar la interpolación para ejecutar bloques completos de JavaScript. Por ejemplo, no tendría sentido escribir:

::: mycode
[Este ejemplo no debería hacerse]{.title}

``` vue
{{ if (edad >= 18) { ... } }}
```
:::


[if]{.verbatim} es una sentencia y no una expresión que produzca directamente un valor. Para este tipo de situaciones Vue proporciona directivas como [v-if]{.verbatim}.


## Enlace de atributos con [v-bind]{.verbatim} {#enlace-atributos-v-bind}

La interpolación permite introducir datos dentro del contenido de un elemento, pero no permite utilizar directamente [{{ }}]{.verbatim} para establecer atributos HTML. Para enlazar un atributo HTML con un valor JavaScript utilizamos la directiva [v-bind]{.verbatim}. Por ejemplo, para establecer dinámicamente los atributos [src]{.verbatim} y [alt]{.verbatim} hacemos lo siguiente:


::: mycode
[Uso de [v-bind]{.verbatim}]{.title}

``` vue
<script setup>
const imagen = '/imagenes/vue.png'
const descripcion = 'Logotipo de Vue.js'
</script>
<template>
  <img v-bind:src="imagen" v-bind:alt="descripcion">
</template>
```
:::


Dado que [v-bind]{.verbatim} se utiliza con mucha frecuencia, Vue proporciona una sintaxis abreviada utilizando únicamente [:]{.verbatim}. Las siguientes dos etiquetas son equivalentes:

::: mycode
[Equivalencia]{.title}

``` vue
<img v-bind:src="imagen">
<img :src="imagen">
```
:::

La segunda forma es la más habitual en aplicaciones Vue. También podemos utilizarla con otros atributos:

::: mycode
[Otros ejemplos]{.title}

``` vue
<a :href="url">Visitar página</a>

<input :value="nombre">

<button :disabled="deshabilitado">
  Guardar
</button>
```
:::


### Atributos dinámicos {#atributos-dinámicos}

Una de las ventajas de [v-bind]{.verbatim} es que el atributo puede depender de los datos de la aplicación.

::: mycode
[Atributo dinámico]{.title}

``` vue
<script setup>
const formularioBloqueado = true
</script>
<template>
  <button :disabled="formularioBloqueado">
    Enviar
  </button>
</template>
```
:::


Cuando [formularioBloqueado]{.verbatim} cambie, Vue actualizará automáticamente el atributo correspondiente.


### Enlace de clases CSS {#clases-CSS}

Las clases CSS también pueden cambiar dinámicamente en Vue. Podemos hacer que en nuestro código JavaScript se pueda modificar la clase que está asignada a un elemento HTML:


::: mycode
[Atributo dinámico]{.title}

``` vue
<script setup>
  const claseMensaje = 'importante'
</script>
<template>
  <p :class="claseMensaje">
    Mensaje importante
  </p>
</template>
<style>
.importante {
  font-weight: bold;
}
</style>
```
:::


Vue añadirá la clase indicada al elemento. También podemos utilizar un objeto para controlar varias clases:

::: mycode
[Atributo dinámico]{.title}

``` vue
<template>
  <p :class="{ activo: estaActivo, error: hayError }">
    Estado del usuario
  </p>
</template>
```
:::

En este caso:

- [activo]{.verbatim} se aplica cuando [estaActivo]{.verbatim} es [true]{.verbatim}.
- [error]{.verbatim} se aplica cuando [hayError]{.verbatim} es [true]{.verbatim}.


Esta técnica resulta especialmente útil cuando la apariencia de un componente depende de su estado.


## Renderizado condicional con [v-if]{.verbatim} {#renderizado-condicional-v-if}

Una aplicación frecuentemente necesita mostrar unos elementos u otros dependiendo de determinadas condiciones. Vue proporciona la directiva [v-if]{.verbatim} para realizar un **renderizado condicional**.


::: mycode
[Renderizado condicional]{.title}

``` vue
<script setup>
const estaConectado = true
</script>

<template>
  <p v-if="estaConectado">
    Usuario conectado
  </p>
</template>
```
:::


Cuando [estaConectado]{.verbatim} sea [true]{.verbatim}, Vue mostrará el elemento. En cambio, si es [false]{.verbatim} el elemento no se renderizará. Por tanto, [v-if]{.verbatim} no se limita a ocultar visualmente el elemento. Vue decide si el elemento debe formar parte del DOM renderizado.

### Condiciones más complejas

La condición puede utilizar expresiones, e incluso expresiones que dependan de varios valores: 


:::::::::::::: {.columns }
::: {.column width="40%"}

::: {.mycode size=footnotesize}
[Condicional con expresión]{.title}

``` vue
<template>
  <p v-if="edad >= 18">
    Puedes acceder.
  </p>
</template>
```
:::

:::
::: {.column width="60%" }

::: {.mycode size=footnotesize}
[Expresión con varios valores]{.title}

``` vue
<template>
  <p v-if="estaConectado && tienePermisos">
    Panel de administración
  </p>
</template>
```
:::

:::
::::::::::::::


### Condicionales con [v-else]{.verbatim} y [v-else-if]{.verbatim}

Vue permite definir alternativas mediante [v-else]{.verbatim} y [v-else-if]{.verbatim} y funcionan igual en otros lenguajes de programación.

En el siguiente ejemplo sólo uno de los dos elementos será renderizado.

::: mycode
[Condicional y alternativa]{.title}

``` vue
<template>
  <p v-if="estaConectado">
    Bienvenido.
  </p>
  <p v-else>
    Debes iniciar sesión.
  </p>
</template>
```
:::


Cuando tenemos varias posibilidades podemos utilizar `v-else-if`.

::: mycode
[Condicional con varias opciones]{.title}

``` vue
<template>
  <p v-if="nota >= 9">
    Sobresaliente
  </p>
  <p v-else-if="nota >= 7">
    Notable
  </p>
  <p v-else-if="nota >= 5">
    Aprobado
  </p>
  <p v-else>
    Suspenso
  </p>
</template>
```
:::

Vue comprobará las condiciones en orden y renderizará la primera que sea verdadera.


## Renderizado con [v-show]{.verbatim} {#renderizado-con-v-show}

Otra directiva relacionada con la visibilidad es [v-show]{.verbatim}. A diferencia de [v-if]{.verbatim}, [v-show]{.verbatim} **no elimina el elemento del DOM**.

::: mycode
[Elemento oculto]{.title}

``` vue
<p v-show="mostrarMensaje">
  Este mensaje puede ocultarse.
</p>
```
:::

Cuando la condición es falsa, Vue modifica el CSS del elemento para ocultarlo mediante [display: none]{.verbatim}.



### Diferencias entre [v-if]{.verbatim} y [v-show]{.verbatim} {#diferencias-entre-vif-vshow}


En la siguiente tabla se puede ver una comparativa para saber cuándo usar [v-if]{.verbatim} o [v-show]{.verbatim}.


| [v-if]{.verbatim} | [v-show]{.verbatim} |
|-------------------|---------------------|
| El elemento puede aparecer o desaparecer con poca frecuencia. | El elemento se muestra y oculta frecuentemente. |
| El contenido es relativamente costoso de crear. | Queremos mantener el elemento creado. |
| Queremos que el elemento no exista en el DOM cuando no se utiliza. | El coste de cambiar su visibilidad es menor que crear y destruir continuamente el elemento. | 


Por ejemplo, un panel que el usuario abre y cierra continuamente podría utilizar [v-show]{.verbatim}.


## Renderizado de listas con [v-for]{.verbatim} {#renderizado-listas-v-for}

Una de las operaciones más habituales en una aplicación web es mostrar una lista de elementos. Vue proporciona la directiva [[v-for]{.verbatim}](https://vuejs.org/guide/essentials/list.html) para ello, similar a cómo funciona un bucle [for]{.verbatim}.


::: mycode
[Renderizar una lista]{.title}

``` vue
<script setup>
const nombres = ['Alice', 'Bob', 'Carol', 'David']
</script>
<template>
  <ul>
    <li v-for="nombre in nombres">
      {{ nombre }}
    </li>
  </ul>
</template>
```
:::

Vue generará un elemento [<li>]{.verbatim} para cada elemento del array, por lo que generará una lista HTML. También podemos utilizar [of]{.verbatim}:

::: mycode
[Alternativa]{.title}

``` vue
<li v-for="nombre of nombres">
  {{ nombre }}
</li>
```
:::



### Obtener el índice {#obtener-índice}

Podemos obtener también la posición del elemento dentro del array de elementos. El índice comienza en [0]{.verbatim}, como ocurre normalmente con los arrays de JavaScript.


:::::::::::::: {.columns }
::: {.column width="50%"}

::: mycode
[Obtener el índice]{.title}

``` vue
<li v-for="(nombre, indice) in nombres">
  {{ indice }} - {{ nombre }}
</li>
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[El resultado será]{.title}

``` text
0 - Alice
1 - Bob
2 - Carol
3 - David
```
:::

:::
::::::::::::::



## [key]{.verbatim} en las listas

Cuando utilizamos [v-for]{.verbatim}, normalmente debemos proporcionar una propiedad [key]{.verbatim} **que identifique de forma única cada elemento**.


::: mycode
[Añadir [key]{.verbatim}]{.title}

``` vue
<script setup>
const usuarios = [
  { id: 1, nombre: 'Ane' },
  { id: 2, nombre: 'Mikel' },
  { id: 3, nombre: 'Jon' }
]
</script>
<template>
  <ul>
    <li v-for="usuario in usuarios" :key="usuario.id">
      {{ usuario.nombre }}
    </li>
  </ul>
</template>
```
:::

La propiedad [key]{.verbatim} ayuda a Vue a identificar cada elemento de la lista cuando esta cambia. Esto permite que Vue pueda actualizar el DOM de una forma más eficiente y predecible.

::: errorbox
No deberíamos utilizar como [key]{.verbatim} un valor que pueda cambiar durante la vida del elemento.
:::

Tampoco se debe usar el índice como [key]{.verbatim} cuando la lista puede cambiar de orden, insertar elementos o eliminar elementos. Aunque técnicamente puede funcionar, puede provocar comportamientos inesperados cuando la lista cambia. Por ello, siempre que sea posible, utilizaremos un identificador único y estable.



::: exercisebox
Crea un componente que visualice una alerta con un color de fondo y bordes redondeados con un color un poco más intenso. Puede ser de los siguientes tipos:

- **Info**: muestra mensajes de aviso en color azul.
- **Sucess**: para mostrar mensajes de confirmación en color verde.
- **Warning**: para mensajes de aviso con fondo naranja.
- **Error**: para mensajes de error en color rojo.

Para inspiraros en los [*alerts* de Bootstrap](https://getbootstrap.com/docs/5.3/components/alerts/).
:::

