
# Componentes de una interfaz {#componentes-interfaz}

Hasta ahora hemos aprendido a construir páginas web utilizando HTML, CSS, Flexbox, Grid y diseño responsive. Sin embargo, una interfaz de usuario no es únicamente una distribución de elementos: está formada por **componentes reutilizables** que aparecen en prácticamente cualquier aplicación web.

Una **cabecera**, un **menú**, una **tarjeta** o un **formulario** son ejemplos de componentes de interfaz. Cada uno resuelve un problema concreto y puede reutilizarse en diferentes páginas de un mismo proyecto.


## Cabeceras [<header>]{.verbatim} {#cabeceras}

La **cabecera** (*header*) es la zona superior de una página web. Normalmente contiene la identidad del sitio, la navegación principal y, en ocasiones, herramientas como el buscador o el acceso de usuario.

Es uno de los componentes más importantes de cualquier interfaz, ya que suele aparecer en todas las páginas de un mismo sitio y constituye el principal punto de navegación para el usuario.

En HTML existe un elemento semántico específico para representar la cabecera [<header>]{.verbatim}. Este elemento indica que el contenido pertenece a la parte introductoria de una página o de una sección. Una cabecera puede contener:

- Logotipo o nombre del sitio.
- Menú de navegación.
- Buscador.
- Iconos de usuario.
- Botones de acceso.

No existe un único diseño correcto; dependerá del tipo de aplicación que estemos desarrollando. El ejemplo más sencillo únicamente mostraría el nombre del sitio, pero hoy día una web suele tener distintos apartados, accesibles a través de una barra de navegación:


:::::::::::::: {.columns}
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```html
<header class="header">
  <h1 class="logo">MiWeb</h1>
  <nav>
    <a href="#">Inicio</a>
    <a href="#">Cursos</a>
    <a href="#">Blog</a>
    <a href="#">Contacto</a>
  </nav>
</header>
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[CSS]{.title}
```css
.header {
    display: flex;
    justify-content: space-between;
    align-items: center;

    padding: 1rem 2rem;

    background-color: #1f2937;
}

.logo {
    margin: 0;
    color: white;
}

.header nav {
    display: flex;
    gap: 1.5rem;
}

.header a {
    color: white;
    text-decoration: none;
}
```
:::

:::
::::::::::::::


[Flexbox](#flexbox) resulta la mejor opción para este tipo de distribución horizontal.



## Menús de navegación con [<nav>]{.verbatim} {#elemento-nav}

El **menú de navegación** [<nav>]{.verbatim} es el componente que permite al usuario desplazarse entre las diferentes páginas o secciones de un sitio web. Junto con la cabecera, constituye uno de los elementos más importantes de la experiencia de usuario, ya que facilita el acceso al contenido y ayuda a comprender la estructura de la aplicación.

En el ejemplo anterior ya se ha creado dentro de la cabecera el elemento semántico [<nav>]{.verbatim}. Este elemento mejora la accesibilidad y ayuda a los lectores de pantalla a identificar la navegación principal del sitio.

Una página puede contener varios elementos [<nav>]{.verbatim} si existen distintos bloques de navegación: por ejemplo, un menú principal y otro en el pie de página.

Desde el punto de vista semántico, un menú representa un conjunto de elementos relacionados. Por ello, es muy habitual construirlo mediante listas.

:::::::::::::: {.columns}
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```html
<nav>
  <a href="#" class=active>Inicio</a>
  <!-- ... -->
</nav>
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[CSS]{.title}
```css
.active {
  border-bottom: 2px solid white;
}
```
:::

:::
::::::::::::::


### Usabilidad en la navegación {#usabilidad-navegación}

Dada la importancia de los menús de navegación, es importante indicar al usuario en qué sección se encuentra. Por lo tanto, en la cabecera, en la sección en la que nos encontramos se suele añadir un estilo propio para que se vea claramente.

:::::::::::::: {.columns}
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```html
<header class="header">
  <h1 class="logo">MiWeb</h1>
  <nav>
    <ul class="menu">
      <li><a href="#">Inicio</a></li>
      <li><a href="#">Cursos</a></li>
      <li><a href="#">Blog</a></li>
      <li><a href="#">Contacto</a></li>
    </ul>
  </nav>
</header>
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[CSS]{.title}
```css
.menu {
  display: flex;
  gap: 1.5rem;
  list-style: none;
  padding: 0;
  margin: 0;
}
.menu a {
  text-decoration: none;
}
```
:::

:::
::::::::::::::


Una interfaz debe proporcionar retroalimentación cuando el usuario interactúa con ella. Para ello, en la navegación se suele usar el efecto [:hover]{.verbatim} con reglas CSS especiales para modificar el color, por ejemplo.

::: {.mycode size=footnotesize}
[Efecto [:hover]{.verbatim}]{.title}
```css
nav a:hover {
    color: #2563eb;
}
```
:::


### Cabecera *responsive* {#cabecera-responsive}

Es importante, teniendo en cuenta todo lo visto hasta ahora, que debemos tener en cuenta cómo queremos que se visualice la cabecera en distintos dispositivos, por lo que tenemos que hacerla *responsive* para que se adapte. Normalmente:

- En dispositivos móviles la cabecera y los enlaces de navegación tienen una disposición vertical.
- En navegadores de escritorio ocupan todo el ancho, el logo está a la izquierda, y los enlaces de navegación pueden estar seguidos, centrados o a la derecha del todo.


::: exercisebox
[[09a](https://github.com/yuki/ejercicios/blob/main/daw/diw/09a.html)]{.solution}

Crea una página HTML que una cabecera que se asemeje a un proyecto real. Debe contener:

- Nombre de la página o logotipo
- Menú de navegación con 3-4 enlaces
- Caja de búsqueda
- Botón para acceder/hacer login.

Añade efecto [:hover]{.verbatim} al menú y que se vea en qué página de la aplicación nos encontramos.
:::



# Barras laterales {#barras-laterales}

La **barra lateral** (*sidebar*) es un componente de interfaz que agrupa opciones de navegación, herramientas o información secundaria en uno de los laterales de la pantalla. Es muy habitual en paneles de administración, plataformas educativas, gestores de contenidos y aplicaciones empresariales.

A diferencia del menú principal, que suele situarse en la cabecera, la barra lateral permite organizar un gran número de opciones sin ocupar espacio vertical. Normalmente contiene:

- Navegación principal.
- Categorías.
- Accesos rápidos.
- Configuración.
- Información del usuario.



## Estructura HTML básica {#estructura-básica-aside}

La estructura semántica suele utilizar [<aside>]{.verbatim} para representar contenido complementario.


:::::::::::::: {.columns}
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```html
<div class="layout">
  <aside class="sidebar">
    <h2>Panel</h2>
    <nav>
      <a href="#">Inicio</a>
      <a href="#">Alumnos</a>
      <a href="#">Cursos</a>
      <a href="#">Configuración</a>
    </nav>
  </aside>
  <main>
    <h1>Contenido principal</h1>
  </main>
</div>
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[CSS]{.title}
```css
.layout {
  display: grid;
  grid-template-columns: 240px 1fr;
  min-height: 100vh;
}

.sidebar {
  padding: 1rem;
}

main {
  padding: 2rem;
}
```
:::

:::
::::::::::::::


El elemento [<aside>]{.verbatim} indica que este contenido es complementario respecto al contenido principal representado por [<main>]{.verbatim}. Grid es la herramienta más adecuada para crear una barra lateral, con el que, a través de CSS, se han creado dos columnas: una primera de [240px]{.verbatim} para la barra lateral y el resto para el contenido principal [<main>]{.verbatim}.


## Menú interno con Flexbox {#menú-interno-flexbox}

Dentro del sidebar, dado que queremos categorizar de manera vertical los enlaces, o apartados, podemos hacer uso de Flexbox para organizar los enlaces.


::: {.mycode size=footnotesize}
[CSS]{.title}
```css
.sidebar nav {
    display: flex;
    flex-direction: column;
    gap: 0.5rem;
}
```
:::


Cada enlace aparece debajo del anterior con una separación uniforme. De esta manera, podemos ver cómo **Grid organiza la página** y **Flexbox organiza los componentes**, en este caso de la barra lateral.



## Sidebar responsive {#sidebar-responsive}

En dispositivos móviles normalmente no existe espacio suficiente para mantener una columna lateral. Aunque lo habitual suele ser ocultarla, y añadir un botón para volver a mostrarla, la solución más sencilla consiste en colocarla encima del contenido. Por lo tanto, realmente el CSS debe ser:


::: {.mycode size=footnotesize}
[CSS]{.title}
```css
.layout {
    display: grid;
    grid-template-columns: 1fr;
}
@media (min-width: 768px) {
    .layout {
        grid-template-columns: 240px 1fr;
    }
}
```
:::


## Posición fija durante el scroll {#posición}

En paneles de administración es habitual que el menú permanezca visible, y que no se mueva con el scroll. Para ello podemos añadir las siguiente reglas dentro de la versión de escritorio.


::: {.mycode size=footnotesize}
[Mantener sidebar fijo]{.title}
```css
.sidebar {
    position: sticky;
    top: 0;
    height: 100vh;
}
```
:::


::: exercisebox
[[09b](https://github.com/yuki/ejercicios/blob/main/daw/diw/09b.html)]{.solution}

Partiendo del ejercicio anterior:
- Añade una barra lateral.
- Modifica el comportamiento entre el móvil y el escritorio.
:::


# Tarjetas {#tarjetas}

Las **tarjetas** (*cards*) son uno de los componentes más utilizados en el diseño de interfaces modernas. Una tarjeta es un contenedor que agrupa información relacionada dentro de una superficie visual independiente, facilitando la organización del contenido y su reutilización.

Actualmente encontramos tarjetas en casi cualquier aplicación: productos de una tienda online, cursos de una plataforma educativa, noticias, perfiles de usuario, paneles de estadísticas o publicaciones de redes sociales. Suele contener título, texto, etiquetas, botones, iconos, y/o una imagen.

La estructura básica es tan sencilla como:

:::::::::::::: {.columns}
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```html
<article class="card">
  <img src="curso.jpg"
      alt="Curso de HTML">
  <h2>Curso de HTML</h2>
  <p>
    Aprende los fundamentos
    del desarrollo web.
  </p>
</article>
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[CSS]{.title}
```css
.card {
    padding: 1.5rem;
    border: 1px solid #d1d5db;
    border-radius: 0.75rem;
    background-color: white;
}

.card h2 {
    margin-top: 0;
}
.card img {
    width: 100%;
    aspect-ratio: 16 / 9;
    object-fit: cover;
    border-radius: 0.5rem;
}
```
:::

:::
::::::::::::::

Utilizamos [[<article>]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/article) porque representa una unidad de contenido independiente que podría reutilizarse en otras partes del sitio.

Se ha añadido una imagen que cubre la parte superior de la tarjeta, y añadiendo bordes redondeados tanto a la tarjeta como a la imagen para mejorar el aspecto.


## Tarjetas y posicionamiento en Grid {#tarjetas-posicionamiento-grid}

El uso de tarjetas es un patrón perfecto para crear una cuadrícula/*grid*. A la hora de colocar las tarjetas podemos hacerlo de diferentes formas, y por tanto, ajustar la configuración del *grid* al diseño que más queramos:

- **Tener siempre el mismo número de columnas**: este diseño es adecuado si tenemos controlado el tamaño de pantalla, y si sabemos que no se va a ver en otro sistema. **NO es el sistema recomendado**,
- **Las tarjetas siempre tienen el mismo ancho**: ideal si queremos que siempre se vean igual. El problema es que no es adaptable al tamaño de la pantalla.
- **Usar *[grid responsive](#grids-adaptables)***: las tarjetas tendrán un tamaño mínimo asignado, pero se adaptarán al tamaño de la pantalla. **Este es el sistema recomendado hoy día**.


# Botones {#botones}

Los **botones** son uno de los componentes con los que más interactúan los usuarios. Permiten enviar formularios, abrir ventanas, confirmar acciones, cancelar operaciones o navegar dentro de una aplicación. Un buen diseño de botones mejora la usabilidad, transmite claramente la importancia de cada acción y proporciona una respuesta visual inmediata al usuario.

En HTML existen dos elementos muy utilizados: **[<button>]{.verbatim}** y **[<a>]{.verbatim}**. Aunque ambos pueden tener el mismo aspecto mediante CSS, su significado semántico es diferente:

- [<button>]{.verbatim}: ejecuta una acción.
- [<a>]{.verbatim}: navega a otra página.


## El elemento [<button>]{.verbatim} {#elemento-button}

El elemento semántico para ejecutar acciones es [<button>]{.verbatim}. Las acciones más habituales son enviar un formulario, abrir un cuadro de diálogo, ejecutar una función de JavaScript o confirmar/cancelar una acción.


:::::::::::::: {.columns}
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```html
<button>Guardar</button>

<button disabled>Cancelar</button>
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[CSS]{.title}
```css
button {
    padding: 0.75rem 1.25rem;
    border: none;
    border-radius: 0.5rem;
    background-color: #2563eb;
    color: white;
    cursor: pointer;
}
```
:::

:::
::::::::::::::

A la hora de modificar los atributos de un botón podemos hacer que tenga más área de pulsación, esquinas redondeadas y modificar el color, entre otras cosas.


## Estados de un botón {#estados-botón}

Un botón puede encontrarse en distintos estados visuales, y por tanto podemos usarlo como reglas CSS:

- [button]{.verbatim}: el estado por defecto.
- [button:hover]{.verbatim}: estado al pasar el ratón por encima.
- [button:active]{.verbatim}: cuando se hace click en el botón.
- [button:disabled]{.verbatim}: el botón está desactivado, no se puede hacer hacer click.


## Diferencia entre botones y agrupación {#diferentes-botones-agrupación}

No todas las acciones tienen la misma importancia, por tanto, si existen botones para realizar distintas acciones, deberían tener colores y/o formas distintas, o indicaciones con distintos iconos. Los botones deben ser fácilmente identificables y utilizables, para ello, como buenas prácticas es importante:

- Utilizar texto descriptivo de la acción que realiza.
- Evitar depender únicamente del color para diferenciar acciones.
- Mantener suficiente contraste entre texto y fondo.
- Proporcionar un área de pulsación amplia (al menos unos 44 × 44 px en interfaces táctiles).
- Utilizar el atributo [disabled]{.verbatim} cuando la acción no esté disponible.


![Ejemplo de botones en [Bootstrap](https://getbootstrap.com/docs/5.3/components/buttons/)](img/diw/botones-bootstrap.png){width=90%}


En muchas aplicaciones es habitual alinear botones para realizar distintas acciones y que estén cerca entre sí. La mejor manera es hacer uso de Flexbox, y su sistema de alineación, ya se horizontal o vertical. Algunos *frameworks* permiten la agrupación de botones, que se usa para botones con acciones relacionadas entre sí.

![Grupo de botones con [Bulma](https://bulma.io/documentation/elements/button/\#button-group)](img/diw/button-group-bulma.png){width=40%}


::: exercisebox
[[09c](https://github.com/yuki/ejercicios/blob/main/daw/diw/09c.html)]{.solution}

Partiendo del ejercicio anterior:
- Crea un sistema grid que contenga tarjetas
- Cada tarjeta debe tener una imagen, un encabezado, un pequeño texto y un enlace tipo botón.
- Añade en alguna tarjeta un texto de "oferta" como si fuese un producto rebajado.
:::



# Formularios {#formularios}

Los **formularios** [<form>]{.verbatim} son el principal mecanismo mediante el cual una aplicación web recoge información del usuario, desde un inicio de sesión hasta una matrícula, una compra online o un formulario de contacto, prácticamente cualquier sitio web necesita formularios bien diseñados.

Un buen formulario no solo debe ser estéticamente agradable: también debe ser **claro, accesible, fácil de completar y adaptable a dispositivos móviles**. Los elementos más habituales que encontraremos dentro de un formulario son:

- Etiquetas ([label]{.verbatim}): cada campo debe tener una etiqueta descriptiva. El atributo [for]{.verbatim} conecta la etiqueta con el [id]{.verbatim} del campo [<input>]{.verbatim}correspondiente. Esta relación mejora la accesibilidad y permite que al pulsar sobre el texto también se active el campo de entrada.
- Campos de texto ([input]{.verbatim}): Existen distintos tipos para determinados tipos de datos, y es importante elegir el correcto, ya que mejora la validación y la experiencia de usuario en dispositivos móviles.
  - [text]{.verbatim}: Texto general
  - [email]{.verbatim}: Correo electrónico
  - [password]{.verbatim}: Contraseñas
  - [tel]{.verbatim}: Teléfono
  - [number]{.verbatim}: Valores numéricos
  - [date]{.verbatim}: Fechas
- Áreas de texto ([textarea]{.verbatim}): para añadir textos largos.
- Listas desplegables ([select]{.verbatim}): permite seleccionar entre distintas opciones.
- Casillas de verificación ([input type="checkbox"]{.verbatim}): permite elegir varias opciones.
- Casillas de selección ([inpuyt type="radio"]{.verbatim}): permite elegir una opción entre varias.
- Botones ([button]{.verbatim})


El formulario agrupa todos los controles de entrada y permite enviar la información al servidor cuando el usuario pulsa el botón correspondiente.


:::::::::::::: {.columns}
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```html
<form>
  <div class="form-group">
    <label for="nombre">Nombre</label>
    <input
      id="nombre"
      type="text"
    >
  </div>

  <div class="form-group">
    <label for="email">Correo</label>
    <input
      id="email"
      type="email"
    >
  </div>
</form>
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[CSS]{.title}
```css
.form-group {
    display: flex;
    flex-direction: column;
    gap: 0.5rem;
    margin-bottom: 1rem;
}

input,
textarea,
select {
    width: 100%;
    padding: 0.75rem;
    border: 1px solid #d1d5db;
    border-radius: 0.5rem;
    font: inherit;
    box-sizing: border-box;
}
```
:::

:::
::::::::::::::

El ejemplo anterior crea un formulario básico con:

- Anchura completa.
- Espaciado cómodo.
- Esquinas redondeadas.
- Tipografía coherente con el resto de la página.

Unificando cada *label* con su *input* en un grupo permite crear un sistema Flexbox, que en este caso se ha alineado de manera vertical, pero se podría modificar a modo horizontal para la vista de escritorio.



::: exercisebox
[[09d](https://github.com/yuki/ejercicios/blob/main/daw/diw/09d.html)]{.solution}

Crea un formulario que se vea diferente en distintos dispositivos.
:::



# Tablas {#tablas}

Las **tablas** permiten representar información organizada en filas y columnas. Son especialmente útiles cuando necesitamos mostrar datos que tienen una relación entre sí, como listados de alumnos, productos, horarios, resultados o estadísticas.

Aunque CSS permite transformar prácticamente cualquier conjunto de elementos en una tabla visual, cuando los datos son realmente tabulares debemos utilizar los elementos HTML específicos para tablas, lo que proporciona una estructura semántica que facilita la accesibilidad y permite a los navegadores interpretar correctamente la información.

Una tabla se construye mediante los siguientes elementos:

- [<table>]{.verbatim}:  Contenedor de la tabla.
- [<thead>]{.verbatim}: Encapsula las filas que forman la cabecera de la tabla. Es opcional.
- [<tbody>]{.verbatim}: Encapsula las filas que forman el contenido principal de la tabla. Es opcional.
- [<tfoot>]{.verbatim}: Encapsula las filas que forman la parte baja de la tabla. Es opcional.
- [<tr>]{.verbatim}:  Fila.
- [<th>]{.verbatim}:  Celda de encabezado.
- [<td>]{.verbatim}:  Celda de datos.


:::::::::::::: {.columns}
::: {.column width="43%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```html
<table>
  <thead>
    <tr>
      <th>Student ID</th>
      <th>Name</th>
      <th>Major</th>
      <th>Credits</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>3741255</td>
      <td>Jones, Martha</td>
      <td>Computer Science</td>
      <td>240</td>
    </tr>
    <tr>
      <td>3971244</td>
      <td>Nim, Victor</td>
      <td>Russian Literature</td>
      <td>220</td>
    </tr>
  </tbody>
  <tfoot>
    <tr>
      <th colspan="3">Totals</td>
      <td>460</td>
    </tr>
  </tfoot>
</table>
```
:::

:::
::: {.column width="57%" }

::: {.mycode size=footnotesize}
[CSS]{.title}
```css
thead, tfoot {
  border-bottom: 2px solid rgb(160 160 160);
  text-align: center;
  background-color: #2c5e77;
  color: white;
}

tbody {
  background-color: #e4f0f5;
}
table {
  border-collapse: collapse;
  border: 2px solid rgb(140 140 140);
  font-family: sans-serif;
  font-size: 0.8rem;
  letter-spacing: 1px;
}

th, td {
  border: 1px solid rgb(160 160 160);
  padding: 8px 10px;
}
tbody > tr > td:last-of-type {
  text-align: center;
}
tbody tr:nth-child(even) {
    background-color: #f3f4f6;
}
```
:::

:::
::::::::::::::


## Estilos de tablas {#estilos-tabla}

Los navegadores apenas añaden estilos a las tablas, lo que puede dificultar su lectura, por lo que resulta importante añadir estilos propios. Entre los estilos que suele ser recomendable añadir son:

- **Encabezados**: añadir un estilo para las cabeceras permite visualizar claramente qué representa cada columna.
- **Bordes**: permite separar el contenido para mejorar su visualización.
- **Filas alternas**: para tablas largas conviene alternar los colores de filas pares/impares.
- **Efecto [:hover]{.verbatim}**: para facilitar la lectura, también se puede destacar la fila sobre la que se encuentra el cursor.
- **Tablas *responsive***: uno de los principales problemas de las tablas es su comportamiento en pantallas pequeñas. La solución sencilla consiste en permitir desplazamiento horizontal con [overflow-x: auto]{.verbatim} en el **contenedor padre de la tabla**.


::: exercisebox
[[09e](https://github.com/yuki/ejercicios/blob/main/daw/diw/09e.html)]{.solution}

Crea una tabla que contenga lo expuesto previamente.
:::


# Modals {#modals}

Un ***[modal](https://www.w3schools.com/howto/howto_css_modals.asp)*** es una ventana que aparece sobre el contenido principal de una página para mostrar información o solicitar una acción al usuario. Mientras el *modal* está abierto, normalmente el usuario debe interactuar con él antes de continuar con el contenido que queda detrás.

Los *moal* se utilizan habitualmente para:

- Mostrar información adicional.
- Confirmar acciones importantes.
- Mostrar formularios para crear/editar datos.
- Avisar de determinadas situaciones.
- Mostrar imágenes o contenido ampliado.

Los *modal* debe utilizarse con moderación. Si una acción puede realizarse directamente sobre la página, normalmente es preferible no interrumpir al usuario con una ventana *modal*.

Se va a explicar cómo se creaban previamente a la aparición de la etiqueta [<dialog>]{.verbatim} y después con la nueva etiqueta.


## Estructura básica antigua {#modal-estructura-básica}

Para entender cómo funcionan los modal se va a explicar cómo se hacían de manera "artesanal". Hoy en día sigue siendo el método usado en distintos *frameworks*.

:::::::::::::: {.columns}
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```html
<div class="modal">
  <div class="modal-content">
    <h2>Confirmar acción</h2>
    <p>
        ¿Seguro?
    </p>
    <button>Cancelar</button>
    <button>Eliminar</button>
  </div>
</div>

<button id="abrir">Open Modal</button>
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[CSS]{.title}
```css
.modal {
  display: none;
  position: fixed;
  z-index: 1;
  padding-top: 100px;
  left: 0;
  top: 0;
  /* ... */
}
```
:::

:::
::::::::::::::

La estructura consta de tres elementos principales:

- [.modal]{.verbatim}: es un elemento que se posiciona por encima del contenido a modo de *overlay*.
- [.modal-content]{.verbatim}: es el mensaje que queremos mostrar.
- [<button>]{.verbatim}: el botón que ejecuta la acción. En este caso sólo mostrará el modal.
- **Código JavaScript**: al pulsar el botón hará el modal visible. Para ocultar el mensaje se puede hacer de distintas maneras:
  - Confirmando/Cancelando la acción que indica el modal.
  - Pulsando en un botón de cerrar del modal (como si fuese una ventana del sistema operativo).
  - Pulsando en el propio *overlay* del modal. De esta manera facilita el cierre.


::: {.mycode size=footnotesize}
[Código JavaScript]{.title}
```javascript
var modal = document.getElementById("myModal");
var btn = document.getElementById("myBtn");

btn.onclick = function() {
    modal.style.display = "block";
}

// para ocultar/cerrar el modal
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
```
:::


## Elemento [<dialog>]{.verbatim} {#elemento-dialog}

Desde el 2022 existe para todos los navegadores el elemento [[<dialog>]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/dialog) que fue propuesto por Chrome. Con esta etiqueta podemos crear un elemento modal (aunque puede no serlo también) para generar un componente interactivo, alerta o una subventana.

Con los ejemplos más básicos no es necesario  hacer uso de JavaScript, ya que existe un atributo desde 2023 [popovertarget]{.verbatim} que permite asociar un botón para que abra el diálogo, teniendo en cuenta el [id]{.verbatim}.


::: {.mycode size=footnotesize}
[HTML]{.title}
```html
<button popovertarget="my-dialog">Open dialog</button>

<dialog id="my-dialog" popover>
  <p>bla bla</p>
  <button popovertarget="my-dialog" popovertargetaction="hide">Close</button>
</dialog>
```
:::

[<dialog>]{.verbatim} ofrece funcionalidades inspiradas en la forma "tradicional" de hacerlos, sólo que esta vez el navegador es capaz de realizar ciertas acciones y por tanto no tenemos que hacerlas de manera manual. Es una opción especialmente interesante en aplicaciones web modernas y es recomendable ver las distintas opciones que existen en la [documentación de MDN](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/dialog).

::: infobox
HTML y CSS son tecnologías en constante evolución, por lo que cada cierto tiempo se añaden características para simplificar acciones al desarrollador.
:::


## Aspectos a tener en cuenta {#modals-aspectos}

A la hora de crear un modal se pueden tener ciertos aspectos en cuenta para mejorar el aspecto y la usabilidad general. Algunas de ellas son obligatorias, mientras que otras son optativas:

- Hacer que el *overlay* oscurezca el fondo, para mejorar la visibilidad del contenido del modal.
- No hay que olvidar hacer que el modal tenga un [z-index]{.verbatim} superior al contenido general.
- Añadir una animación de visualización/ocultación puede mejorar a que el usuario sepa dónde fijar la mirada.
- Evitar el scroll de fondo mejora la sensación para hacer que el foco sea el modal


:::::::::::::: {.columns}
::: {.column width="35%"}

::: {.mycode size=footnotesize}
[CSS]{.title}
```css
body.modal-open {
    overflow: hidden;
}
```
:::

:::
::: {.column width="65%" }

::: {.mycode size=footnotesize}
[JavaScript]{.title}
```javascript
//Al abrir el modal, se añade una clase
btn.addEventListener("click", () => {
  modal.classList.add("is-open");
  document.body.classList.add("modal-open");
});
// falta quitar la clase al cerrar el modal
```
:::

:::
::::::::::::::


Con el ejemplo anterior, se evita poder hacer scroll en la página cuando el modal está abierto.


::: exercisebox
[[09f](https://github.com/yuki/ejercicios/blob/main/daw/diw/09f.html)]{.solution}

Crea una página HTML que contenga:

- Botón que abra un modal creado *custom*.
- Botón que abra un [<dialog>]{.verbatim}.
  - Comprueba las opciones que tiene y mira si resulta interesante alguna.
:::


# Avisos y/o alertas {#avisos-alertas}

Los **avisos** y **alertas** son componentes utilizados para mostrar al usuario información importante sobre el estado de una aplicación. A diferencia de los modales, las alertas normalmente **no bloquean la interacción con el resto de la página**, por lo que permiten continuar trabajando mientras permanecen visibles. Son especialmente útiles para comunicar:

- Operaciones realizadas correctamente.
- Errores.
- Advertencias.
- Información adicional.
- Cambios en el estado de una aplicación.

Un ejemplo típico sería mostrar el mensaje de que los datos de un formulario se han guardado correctamente tras ser enviados.


:::::::::::::: {.columns}
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```HTML
<div class="aviso alert-info ">
  Los datos se han guardado.
</div>
<div class="aviso alert-error ">
  ¡ERROR!
</div>
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[CSS]{.title}
```css
.aviso {
    padding: 1rem;
    border-radius: 0.5rem;
    border: 1px solid transparent;
    margin: 10px 0;
}
.alert-info {
    background-color: #dbeafe;
    color: #1e3a8a;
}
```
:::

:::
::::::::::::::


## Tipos de avisos {#tipos-avisos}

A la hora de crear avisos o alertas habría que tener en cuenta qué tipo de aplicación estamos construyendo, y los posibles avisos que queremos informar al usuario final. En una aplicación estándar, podríamos crear:


:::::::::::::: {.columns}
::: {.column width="50%"}

- **Aviso informativo**: indica información útil para el usuario.
- **Aviso de confirmación/éxito**: para indicar que la operación se ha realizado correctamente (guardar datos, crear usuario, ...).
- **Alerta de advertencia**: cuando se necesita la atención del usuario, aunque no es un error.
- **Alerta de error**: para indicar que no se ha podido realizar la acción, o ha terminado con error.

:::
::: {.column width="50%" }

![Ejemplo de avisos](img/diw/alertas.png){width=100%}

:::
::::::::::::::

## Posibles mejoras {#posibles-mejoras-alertas}

A la hora de crear los avisos y alertas, nos puede interesar añadir las siguientes características:

- **Iconos**: Un icono puede ayudar a identificar rápidamente el tipo de mensaje.
- **Título**: Podemos añadir un título para separar el contenido.
- **Botón de cerrar**: Para que el aviso/alerta desaparezca, añadir un botón de cerrado.
- **Alerta temporal**: Algunas aplicaciones muestran mensajes durante unos segundos y después los ocultan automáticamente. Resulta útil para mensajes de confirmación, pero no debemos ocultar automáticamente mensajes importantes que el usuario necesite tiempo para leer.
- **ID del error**: Para poder debuggear qué ha sucedido, podemos añadir un código único de error para que el usuario informe de dicho error.
- **Indicar dónde ha dado error**: Esto es especialmente útil en formularios. Añadir un borde rojo en el registro de entrada que ha fallado indica claramente al usuario dónde está el error.


::: exercisebox
[[09g](https://github.com/yuki/ejercicios/blob/main/daw/diw/09g.html)]{.solution}

Crea distintos diálogo de aviso y alerta:

- Añade distintos colores para cada tipo de aviso.
- Añade un título.
- Añade un icono alineado con el texto (usa Flexbox).
:::


# Breadcrumbs {#breadcrumbs}

Los ***breadcrumbs*** o **migas de pan** son un componente de navegación que muestra al usuario el camino jerárquico que ha seguido dentro de un sitio web o aplicación. Por ejemplo: [Inicio > Cursos > Desarrollo Web > JavaScript]{.verbatim}.

Permiten conocer rápidamente **dónde se encuentra el usuario** y facilitan volver a niveles superiores sin tener que utilizar el menú principal, ya que cada nivel, excepto el último, es un enlace.

Son especialmente útiles en sitios web con una estructura jerárquica profunda, como tiendas online, plataformas educativas, documentación técnica o gestores de contenidos.


Dado que los *breadcrumbs* son un componente de navegación podemos utilizar el elemento [<nav>]{.verbatim}, aunque también se podría usar una lista.


:::::::::::::: {.columns}
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```HTML
<nav class="breadcrumbs"
    aria-label="Breadcrumb">
  <ol>
    <li>
      <a href="/">Inicio</a>
    </li>
    <li>
      <a href="/cursos">Cursos</a>
    </li>
    <li>
      <a href="/cursos/web">
        Desarrollo Web
      </a>
    </li>
    <li>
      JavaScript
    </li>
  </ol>
</nav>
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[CSS]{.title}
```css
.breadcrumbs ol {
    display: flex;
    align-items: center;
    gap: 0.5rem;
    padding: 0;
    margin: 0;
    list-style: none;
}

.breadcrumbs li + li::before {
    content: ">";
    margin: 0 0.5rem;
}
```
:::

:::
::::::::::::::


En el ejemplo se ha creado una lista, y para añadir la separación [>]{.verbatim} entre los niveles se ha hecho uso de una regla CSS con el selector de [hermanos adyacentes](#resumen-selectores).


::: exercisebox
[[09h](https://github.com/yuki/ejercicios/blob/main/daw/diw/09h.html)]{.solution}

Crea un *breadcrumb* y modifica los estilos. Analiza la posibilidad de añadir el separador con CSS o con JavaScript.
:::



# Paginación {#paginación}

La **paginación** es un componente de navegación que permite dividir una gran cantidad de contenido en varias páginas. En lugar de mostrar todos los resultados al mismo tiempo, se presentan pequeños grupos de elementos y se permite al usuario desplazarse entre ellos.

Es habitual encontrar paginación en:

- Listados de productos.
- Resultados de búsquedas.
- Listados de alumnos.
- Noticias.
- Artículos.
- Registros de una base de datos.
- Paneles de administración.


La paginación no es únicamente un elemento visual. Los enlaces deben permitir realmente acceder a las diferentes páginas de contenido. La paginación representa una navegación, por lo que podemos utilizar [<nav>]{.verbatim} tal como hemos visto previamente, o una lista.


:::::::::::::: {.columns}
::: {.column width="55%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```HTML
<nav aria-label="Paginación">
    <a href="?page=1">Anterior</a>
    <a href="?page=1">1</a>
    <a href="?page=2" class="active">2</a>
    <a href="?page=3">3</a>
    <a href="?page=4">4</a>
    <a href="?page=2">Siguiente</a>
</nav>
```
:::

:::
::: {.column width="45%" }

::: {.mycode size=footnotesize}
[CSS]{.title}
```css
.pagination a {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    min-width: 1.5rem;
    min-height: 1.5rem;
    padding: 0.5rem;
    border: 1px solid #d1d5db;
    border-radius: 0.5rem;
    color: #374151;
    text-decoration: none;
    font-weight: bold;
}
```
:::

:::
::::::::::::::

En el ejemplo se ha añadido sólo el CSS para los enlaces, que al igual que sucede en muchas páginas, genera un pequeño borde para cada número.

![Ejemplo de paginación](img/diw/paginacion.png){width=50%}



## Diseño habitual {#paginación-diseño-habitual}

Dado que la paginación es un sistema de navegación, a simple vista nos debe mostrar claramente distintos aspectos, entre los que podemos destacar:

- Página en la que nos encontramos.
- Efecto [:hover]{.verbatim} sobre los enlaces.
- Deshabilitar "anterior" o "siguiente" si estamos en la primera o última página respectivamente.
- Cuando existen muchas páginas no tiene sentido mostrar todos los números.



::: exercisebox
[[09i](https://github.com/yuki/ejercicios/blob/main/daw/diw/09i.html)]{.solution}

Crea un sistema de *paginación* de uso habitual con las características de diseño especificadas.
:::



# Acordeones {#acordeones}

Un **acordeón** es un componente de interfaz que permite mostrar y ocultar bloques de contenido. Cada bloque suele estar formado por un título o encabezado que el usuario puede pulsar para desplegar la información asociada.

Son especialmente útiles cuando tenemos mucha información que no queremos mostrar completamente al mismo tiempo. Algunos ejemplos habituales son:

- Preguntas frecuentes.
- Secciones de ayuda.
- Opciones de configuración.
- Descripciones adicionales.
- Información agrupada por categorías.

Un acordeón puede tener inicialmente todos sus contenidos cerrados.


## Estructura básica {#acordeón-estructura}

Tal como pasa con otros elementos, originalmente este sistema se construía de manera "artesanal" usando HTML, CSS y JavaScript, pero desde 2020 existe dos etiquetas nuevas [[<details>]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/details) y [<sumamry>]{.verbatim} que nos facilita la creación ya que no es necesario el uso de JavaScript.

:::::::::::::: {.columns}
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[Método "artesanal"]{.title}
```HTML
<div class="accordion">
  <div class="accordion-item">
    <button class="accordion-header">
      Cabecera
    </button>
    <div class="accordion-content">
        <p>Contenido.</p>
    </div>
  </div>
  <!-- Más secciones -->
</div>
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[Método nuevo]{.title}
```html
<details>
  <summary>Cabecera</summary>
  <p>
    Contenido.
  </p>
</details>
```
:::

:::
::::::::::::::


El siguiente paso es tener el código CSS para añadir estilos personalizables, ocultar la sección por defecto, y el código JavaScript para ocultar/desocultar la sección en el método antiguo.

:::::::::::::: {.columns columnsep=0.25cm}
::: {.column width="44%"}

::: {.mycode size=footnotesize}
[CSS]{.title}
```css
.accordion {
    border: 1px solid #d1d5db;
    border-radius: 0.5rem;
    overflow: hidden;
    width: 40%;
}
.accordion summary, 
.accordion .accordion-header {
    width: 100%;
    display: flex;
    align-items: center;
    justify-content: space-between;
    border: none;
    background-color: #f3f4f6;
    padding: 1rem 0rem 1rem 1rem;
    cursor: pointer;
    font-weight: 600;
    list-style: none;
    font: inherit;
}
```
:::

:::
::: {.column width="56%" }

::: {.mycode size=footnotesize}
[JavaScript]{.title}
```javascript
const headers = 
document.querySelectorAll(".accordion-header");

headers.forEach(header => {
    header.addEventListener("click", () => {
        const item = header.parentElement;
        item.classList.toggle("is-open");
    });
});
```
:::

:::
::::::::::::::

![Ejemplo de acordeón](img/diw/acordeon.png){width=50%}



## Diseño y ayudas {#acordeón-diseño-ayudas}

Para facilitar la usabilidad de los acordeones es habitual hacer uso de los siguientes diseños y/o ayudas:

- Diferenciar cabecera de contenido: normalmente la cabecera suele ser de un color y el contenido de otro.
- Añadir una flecha o icono para indicar si la sección está abierta o cerrada. Al cambiar el estado, el icono debe cambiar.
- Si existen varias secciones de acordeón juntas, hay que separar las distintas secciones.
- En algunos casos al abrir un contenedor queremos cerrar el resto. Esto dependerá de la información y/o aplicación que estamos realizando.


::: exercisebox
[[09j](https://github.com/yuki/ejercicios/blob/main/daw/diw/09j.html)]{.solution}

Crea un sistema de acordeón con el método nuevo y el método "manual"/"antiguo". Dale el diseño CSS que más te guste y si es necesario el código JavaScript.
:::





