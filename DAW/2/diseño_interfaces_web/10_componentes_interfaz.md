
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



