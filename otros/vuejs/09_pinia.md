
# El problema del estado compartido {#problema-estado-compartido}

En una aplicación Vue, cada componente puede mantener sus propios datos reactivos mediante [ref()]{.verbatim} o [reactive()]{.verbatim}. Esta solución funciona bien cuando los datos solo se utilizan dentro de un componente.

Sin embargo, en una aplicación real es habitual que varios componentes necesiten acceder a la misma información. Por ejemplo, una aplicación de comercio electrónico puede tener:

- Un componente que muestra el catálogo de productos.
- Un componente que muestra los detalles de un producto.
- Un componente que muestra el número de productos del carrito.
- Un componente que muestra el contenido del carrito.
- Un componente que permite consultar el perfil del usuario.

Todos estos componentes pueden necesitar consultar o modificar datos compartidos, como el carrito de la compra o la información del usuario autenticado.

## El problema de la comunicación entre componentes {#problema-comunicación-entre-componentes}

Vue permite comunicar componentes mediante [props]{.verbatim} y eventos personalizados. No obstante, cuando los componentes están muy separados en la jerarquía, puede ser necesario transmitir datos a través de varios componentes intermedios.

Imaginemos la siguiente estructura de componentes en un proyecto: 

::: {.mycode size=footnotesize}
[Estructura de componentes]{.title}

``` text
App.vue
├── Cabecera.vue
│   └── CarritoResumen.vue
└── Principal.vue
    └── Productos.vue
        └── Producto.vue
```
:::

Si el componente [Producto.vue]{.configfile} permite añadir productos al carrito y [CarritoResumen.vue]{.configfile} debe mostrar el número de unidades, ambos componentes necesitan compartir información.

Sin una solución de estado compartido, podríamos tener que transmitir datos y eventos a través de varios componentes intermedios, aunque estos no utilicen directamente la información. Esta situación puede hacer que el código resulte difícil de mantener.

Este problema suele denominarse *prop drilling*: transmitir propiedades a través de varios niveles de componentes hasta llegar al componente que realmente las necesita.

## Posibles soluciones {#posibles-soluciones}

Existen varias formas de compartir información en Vue:

- **Props y eventos:** adecuados cuando la comunicación entre componentes es sencilla.
<!-- 
 FIXME: no se habla de nada hasta ahora de provide() e inject
- **[provide()]{.verbatim} e [inject()]{.verbatim}:** permiten compartir datos entre un componente y sus descendientes sin transmitirlos manualmente por todos los niveles intermedios.
-->
- **Un estado reactivo compartido:** permite centralizar determinados datos en un módulo JavaScript.
- **Pinia:** proporciona una solución estructurada para gestionar el estado compartido de una aplicación.

[Pinia](https://pinia.vuejs.org/) facilita la organización de los datos, las operaciones que los modifican y la lógica que varios componentes necesitan utilizar.


# Estado local frente a estado global {#estado-local-frente-a-global}

El **estado** de una aplicación es el conjunto de datos que pueden cambiar durante su ejecución y que determinan qué información se muestra o cómo se comporta la interfaz. En Vue podemos distinguir entre **estado local** y **estado global**.

## Estado local {#estado-local}

El estado local pertenece a un componente y se utiliza principalmente dentro de él. Por ejemplo, el estado que indica si un menú desplegable está abierto o cerrado no suele necesitar compartirse con otros componentes.

::: {.mycode size=footnotesize}
[Componente estado local]{.title}

``` vue
<script setup>
import { ref } from 'vue'

const menuAbierto = ref(false)

function alternarMenu() {
  menuAbierto.value = !menuAbierto.value
}
</script>

<template>
  <button @click="alternarMenu">
    {{ menuAbierto ? 'Cerrar menú' : 'Abrir menú' }}
  </button>

  <nav v-if="menuAbierto">
    <a href="/">Inicio</a>
    <a href="/contacto">Contacto</a>
  </nav>
</template>
```
:::

En este caso, [menuAbierto]{.verbatim} solo tiene sentido dentro del componente. No sería necesario almacenarlo en un estado global.

## Estado global {#estado-global}

El estado global contiene información que debe estar disponible para varios componentes independientes. Algunos ejemplos son:

- El usuario que ha iniciado sesión.
- El contenido del carrito de la compra.
- Las preferencias de visualización.
- Los filtros que deben compartirse entre distintas vistas.
- Los datos que varios componentes necesitan consultar y modificar.

Cuando diferentes componentes utilizan los mismos datos, conviene centralizar su gestión para evitar duplicaciones y mantener un comportamiento coherente.

### ¿Qué información debe almacenarse en un estado global? {#información-estado-global}

No es necesario convertir todos los datos de una aplicación en estado global. Hacerlo puede complicar innecesariamente el proyecto. Como criterio general:

- Si los datos solo afectan a un componente, utiliza estado local.
- Si varios componentes próximos necesitan comunicarse, utiliza props y eventos cuando resulte suficiente.
- Si componentes independientes necesitan compartir y modificar los mismos datos, considera utilizar un estado global.
- Si los datos deben conservarse después de recargar la página, necesitarás además algún mecanismo de persistencia.

Es importante recordar que **estado global no significa almacenamiento permanente**. El estado global permite compartir datos durante la ejecución de la aplicación, pero no garantiza que se conserven al recargar la página.


# Pinia {#pinia}

[Pinia](https://pinia.vuejs.org/) es una biblioteca de gestión del estado diseñada para aplicaciones Vue. Pinia permite definir almacenes de estado, denominados *stores*, que centralizan los datos y la lógica relacionada con ellos. 

Cada store puede contener:

- **State:** los datos reactivos que se desean compartir.
- **Getters:** propiedades calculadas a partir del estado.
- **Actions:** funciones que permiten modificar el estado y ejecutar operaciones relacionadas con él.

::: infobox
Es la solución recomendada actualmente para organizar el estado compartido en proyectos Vue modernos.
:::

Por ejemplo, una aplicación podría tener un store para el usuario ([src/stores/usuario.js]{.configfile}), otro para los productos ([src/stores/productos.js]{.configfile}) y otro para el carrito de la compra ([src/stores/carrito.js]{.configfile}).

La carpeta [stores]{.configdir} es una convención habitual para organizar los almacenes de Pinia. No es obligatoria, pero ayuda a mantener una estructura clara.

Podemos destacar las siguientes ventajas:

- Centraliza el estado compartido.
- Permite reutilizar la misma información desde distintos componentes.
- Mantiene la reactividad de los datos.
- Facilita la separación entre la interfaz y la lógica de negocio.
- Permite definir operaciones síncronas y asíncronas.
- Se integra con las herramientas de desarrollo de Vue.
- Facilita las pruebas y el mantenimiento de aplicaciones grandes.


::: warnbox
Pinia no sustituye a la reactividad de Vue: se apoya en ella para que los componentes se actualicen cuando cambia el estado compartido.
:::



