
# Introducción {#introducción}

[Vue.js](https://vuejs.org/) es un **framework progresivo de JavaScript** orientado principalmente al desarrollo de interfaces de usuario y aplicaciones web. Fue creado por Evan You y publicado por primera vez en 2014. Desde entonces ha evolucionado hasta convertirse en una de las herramientas más utilizadas para desarrollar aplicaciones web modernas.

Vue permite construir interfaces a partir de **componentes reutilizables**, de manera que una aplicación puede dividirse en pequeñas piezas independientes. Cada componente puede contener su propia estructura HTML, lógica JavaScript y estilos CSS.

::: infobox
Cada componente puede contener su propia estructura HTML, lógica JavaScript y estilos CSS independientes.
:::

Una de las características más importantes de Vue es su **sistema de reactividad**. Cuando los datos utilizados por una interfaz cambian, Vue detecta esos cambios y actualiza automáticamente las partes de la página que dependen de ellos. Imaginemos un contador, en JavaScript tradicional tendríamos que modificar manualmente el contenido del elemento HTML cada vez que cambia el contador. Con Vue podemos declarar la relación entre el dato y la interfaz, y Vue se encarga de actualizar el DOM cuando sea necesario.

Vue no sustituye a JavaScript. Al contrario, se construye sobre JavaScript y proporciona herramientas y abstracciones que facilitan la creación de interfaces complejas. Por tanto, es importante entender Vue como una **capa de abstracción sobre JavaScript**, no como un lenguaje de programación independiente.


## Características principales de Vue.js {#caracteristticas-principales}

Vue incorpora diferentes características que facilitan el desarrollo de aplicaciones web.

- **Componentes**: Un componente representa una parte de la interfaz y puede reutilizarse en diferentes lugares de la aplicación. Una cabecera, menú de navegación, un formulario, lista de productos...
- **Reactividad**: La reactividad permite que la interfaz se actualice automáticamente cuando cambian los datos de los que depende. Esta característica es fundamental en las aplicaciones web modernas, donde la información de la pantalla cambia constantemente sin necesidad de recargar toda la página.
- **Data Binding**: Vue facilita la conexión entre los datos de la aplicación y los elementos HTML. Esta conexión permite mostrar datos en la interfaz, modificar atributos HTML dinámicamente, cambiar clases CSS, ...
- **Directivas**: Vue proporciona directivas que permiten controlar el comportamiento de los elementos HTML. Por ejemplo [v-if]{.verbatim}, [v-for]{.verbatim}, [v-bind]{.verbatim}, ...
- **Composition API**: Vue 3 introduce y potencia la **Composition API**, que permite organizar la lógica de los componentes de una forma más flexible.
- [<script setup>]{.verbatim}: Introducido en Vue 3, simplifica considerablemente la escritura de componentes. Con ella podemos utilizar directamente las funcionalidades de la Composition API sin necesidad de una estructura adicional.
- **Integración progresiva**: Una de las características históricas de Vue es que puede incorporarse progresivamente a un proyecto. No es necesario convertir una aplicación completa a Vue desde el principio. Puede utilizarse para controlar inicialmente una pequeña parte de una página y posteriormente aumentar su presencia.
- **Ecosistema**: Vue no se limita al núcleo del framework. Existe un ecosistema de herramientas que permite construir aplicaciones completas. Entre las herramientas más importantes se encuentran:
  - **Vite** para la creación y compilación de proyectos.
  - **Vue Router** para gestionar la navegación.
  - **Pinia** para gestionar el estado compartido.
  - **Vue DevTools** para depurar aplicaciones.
  - **Vitest** para realizar pruebas.

Estas herramientas se estudiarán a lo largo del libro.


## Arquitectura de una aplicación Vue {#arquitectura-aplicaicón-vue}

Una aplicación Vue está formada normalmente por diferentes componentes que se organizan formando un árbol de componentes. Por ejemplo:

- Cabecera con logotipo, barra de búsqueda y botón de login
- Menú de navegación
- Lista de productos
- Tarjeta de producto
- Pie de página

Cada uno de estos elementos puede convertirse en un componente Vue y de esta manera permite separar responsabilidades. "**ProductList.vue**" puede encargarse de mostrar una lista de productos, mientras que "**ProductCard.vue**" puede encargarse de representar individualmente cada producto. De esta forma, si posteriormente necesitamos modificar cómo se representa un producto, podemos hacerlo en "**ProductCard.vue**" sin tener que modificar toda la aplicación.

## Reactividad y componentes {#reactividad-componentes}

La combinación de componentes y reactividad es uno de los conceptos fundamentales de Vue. En una aplicación tradicional podemos modificar directamente el DOM utilizando las API proporcionadas por JavaScript, pudiendo seleccionar un elemento y modificar su contenido.

En Vue, en cambio, normalmente trabajaremos con un estado de la aplicación y declararemos cómo debe representarse ese estado en la interfaz. Podemos pensar en el funcionamiento de la siguiente forma:

![Fuente: [Documentación Vuejs](https://v2.vuejs.org/v2/guide/reactivity.html)](img/vuejs/reactivity.png){width=80%}

Esto permite que el programador se preocupe principalmente de qué debe mostrar la interfaz en función de los datos, en lugar de tener que indicar manualmente cada modificación del DOM. Esta forma de trabajar se conoce habitualmente como **renderizado declarativo**.


# Herramientas del ecosistema Vue {#herramientas-ecosistema-vue}

Para desarrollar aplicaciones Vue 3 utilizaremos varias herramientas.

- **[Node.js](https://nodejs.org/)**: Proporciona el entorno necesario para ejecutar herramientas de desarrollo basadas en JavaScript fuera del navegador. En un proyecto Vue (y en otros *frameworks* de desarrollo) se utiliza principalmente para ejecutar las herramientas de desarrollo y gestionar las dependencias.
- **[npm](https://www.npmjs.com/package/npm)**: Es el gestor de paquetes incluido habitualmente con Node.js. Permite instalar las diferentes dependencias utilizadas por nuestro proyecto. Existen alternativas como [pnmp](https://pnpm.io/), [yarm](https://yarnpkg.com/) y [bun](https://bun.sh/).
- **[Vite](https://vite.dev/)**: Es la herramienta utilizada habitualmente para crear y desarrollar proyectos Vue modernos. Proporciona:
  - Servidor de desarrollo.
  - Recarga rápida durante el desarrollo.
  - Compilación para producción.
  - Gestión de módulos.
  - Integración con Vue.
- **[Vue Router](https://router.vuejs.org/)**: Permite implementar la navegación entre diferentes vistas de una aplicación Vue. El navegador puede cambiar entre distintas vistas sin necesidad de cargar una página HTML completamente nueva en cada navegación.
- **[Pinia](https://pinia.vuejs.org/)**: Es la solución oficial de gestión de estado para el ecosistema Vue. Permite compartir datos entre diferentes componentes cuando mantenerlos únicamente dentro de un componente ya no resulta adecuado.
- **[Vue DevTools](https://devtools.vuejs.org/)**: Proporciona herramientas para inspeccionar y depurar aplicaciones Vue. Permite observar componentes, datos reactivos y diferentes aspectos del funcionamiento de la aplicación.


# Vue y JavaScript {#vue-javascript}

Vue no elimina la necesidad de conocer JavaScript. Al contrario, para trabajar correctamente con Vue es necesario dominar JavaScript. Durante el desarrollo de una aplicación Vue utilizaremos conceptos que ya deberían resultar familiares como funciones felcha, arrays, promesas, programación asíncrona, [fetch]{.verbatim}, eventos... Por este motivo, antes de comenzar a trabajar con Vue es importante tener una base sólida de JavaScript moderno.


## Vue frente a JavaScript sin framework {#vue-frente-a-javascript-puro}

JavaScript permite crear interfaces web directamente utilizando las API del navegador. Por ejemplo, podemos seleccionar elementos del DOM, modificar su contenido, añadir eventos y crear nuevos elementos. 

Cuando una aplicación es pequeña, este enfoque puede ser suficiente. Sin embargo, a medida que aumenta la complejidad aparecen problemas relacionados con:

- Organización del código.
- Actualización manual del DOM.
- Reutilización de componentes.
- Gestión del estado.
- Comunicación entre diferentes partes de la aplicación.
- Mantenimiento del código.

Para una aplicación compleja con muchos componentes, datos dinámicos y diferentes vistas, un framework como Vue puede facilitar considerablemente el desarrollo y mantenimiento.

## Vue y TypeScript {#vue-typescript}

**[TypeScript](https://es.wikipedia.org/wiki/TypeScript)** (TS) es un lenguaje de código abierto desarrollado por Microsoft que se basa en **JavaScript** (realmente es un superconjunto de este), añadiendo **tipado estático** y características propias de lenguajes orientados a objetos como clases, interfaces o módulos.

El código que generamos se **transpila a JavaScript** (el código fuente se convierte a código JavaScript), por lo que puede ejecutarse en cualquier navegador o entorno que soporte JS.

Vue está creado con TypeScript y por tanto también podemos desarrollar aplicaciones Vue con TypeScript, de esta manera ganamos la detección de errores en tiempo de desarrollo.

