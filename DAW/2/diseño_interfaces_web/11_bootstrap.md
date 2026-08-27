
# Frameworks CSS {#frameworks-css}

Un ***framework* CSS** es un conjunto de archivos CSS, componentes y utilidades ya preparados que permiten desarrollar interfaces web de una forma más rápida y estructurada. En lugar de tener que escribir desde cero todos los estilos necesarios para una página, el framework proporciona clases y componentes que podemos utilizar directamente en nuestro HTML.

Por ejemplo, si queremos crear un botón con CSS puro, normalmente tendríamos que definir nosotros mismos propiedades como el color, el fondo, el borde, el tamaño, el espacio interior y los diferentes estados del botón. En un *framework* podemos encontrar clases que ya proporcionan este tipo de estilos. Ejemplo de un botón propio y uno creado con **Bootstrap**


:::::::::::::: {.columns}
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[CSS propio para botón]{.title}
```css
.boton {
    padding: 0.5rem 1rem;
    border: none;
    border-radius: 0.5rem;
    background-color: #0d6efd;
    color: white;
    cursor: pointer;
}
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[Botón HTML con Bootstrap]{.title}
```html
<button class="btn btn-primary">
    Aceptar
</button>
```
:::

:::
::::::::::::::


Tal como se puede ver, el desarrollador no tiene que implementar desde cero todas las reglas CSS necesarias para conseguir el aspecto básico del botón, sólo añadir un par de clases al HTML para conseguir el mismo resultado.

Existen numerosos frameworks y sistemas de estilos:

- **[Bootstrap](https://getbootstrap.com/)**.
- **[Tailwind CSS](https://tailwindcss.com/)**.
- **[Bulma](https://bulma.io/)**.
- **[Foundation](https://get.foundation/)**.
- **[UIkit](https://getuikit.com/)**.

Algunos frameworks proporcionan componentes visuales completos mientras que otros se centran  más en clases de utilidad que permiten construir el diseño combinando pequeñas reglas.


## ¿Qué proporciona un framework CSS? {#qué-proporciona-un-framework-css}

Aunque cada framework tiene sus propias características, normalmente proporciona diferentes tipos de herramientas. Entre ellas podemos encontrar:

- **Sistema de layout** para organizar los elementos.
- **Grid** para crear distribuciones mediante filas y columnas.
- **Clases de utilidad** para propiedades frecuentes.
- **Componentes visuales** como botones, tarjetas, menús o alertas.
- **Estilos para formularios**.
- **Diseño responsive**.
- **Tipografía**.
- **Colores**.
- **Espaciado**.
- **Bordes y sombras**.
- **Estados interactivos**.

Por tanto, un framework CSS no es simplemente una colección de colores y botones. Proporciona una serie de herramientas que permiten construir interfaces siguiendo unas reglas comunes.


## Frameworks CSS y clases {#frameworks-css-clases}

Una de las características habituales de estos frameworks es el uso intensivo de clases CSS. Por ejemplo, podemos encontrar clases destinadas a controlar el espaciado o a controlar el layout:

:::::::::::::: {.columns}
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[Margen superior e inferior]{.title}
```html
<div class="mt-2 mb-2">
    Contenido
</div>
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[Botón HTML con Bootstrap]{.title}
```html
<div class="container">
  Contenido
</div>
```
:::

:::
::::::::::::::

La clase utilizada dependerá del framework concreto. La idea fundamental es que el HTML utiliza las clases proporcionadas por el framework para aplicar los estilos que necesitamos.



## Frameworks CSS y diseño responsive {#frameworks-diseño-responsive}

Una de las razones por las que los frameworks CSS se hicieron especialmente populares es que facilitan la creación de interfaces **responsive**. Recordemos que una interfaz responsive debe adaptarse a diferentes tamaños de pantalla.

Un framework proporciona normalmente clases y reglas que ya contemplan diferentes tamaños de pantalla. Por ejemplo, Bootstrap utiliza diferentes **[breakpoints](#breakpoints-puntos-ruptura)** para adaptar su sistema de layout, lo que permite construir layouts responsive sin tener que definir manualmente todas las media queries necesarias.


## Ventajas e inconvenientes de utilizar un framework CSS {#framework-ventajas-inconvenientes}

Los frameworks CSS proporcionan numerosas ventajas, pero no siempre son la mejor opción. Su utilización debe depender de las características del proyecto.


| Ventajas | Inconvenientes |
|----------|-----------------|
| Desarrollo más rápido | Dependencia del framework |
| Diseño responsive | HTML con muchas clases |
| Algunos disponen de componentes reutilizables | Personalización: no siempre resulta sencilla |
| Consistencia visual | Curva de aprendizaje |
| Compatibilidad | 
| Documentación y comunidad



## Framework CSS como herramienta, no como sustituto de CSS {#framework-no-sustituye-css}

Un framework CSS no debe entenderse como un sustituto de CSS. El framework está construido utilizando CSS y proporciona una capa de abstracción sobre él. Aprender un framework no debería significar dejar de aprender CSS.

Un desarrollador que conoce CSS puede utilizar un framework de forma consciente, modificarlo cuando sea necesario y solucionar problemas cuando el comportamiento predeterminado no sea suficiente.


# Bootstrap {#bootstrap}

**[Bootstrap](https://getbootstrap.com/)** es un framework CSS orientado al desarrollo de interfaces web. Proporciona un conjunto de estilos, componentes y utilidades que permiten construir páginas web de forma más rápida y mantener una apariencia coherente entre sus diferentes elementos.

Bootstrap fue creado originalmente por desarrolladores de Twitter y se publicó como proyecto de código abierto en 2011. Con el tiempo se convirtió en uno de los frameworks CSS más conocidos y utilizados para el desarrollo de interfaces web.

Su objetivo principal es proporcionar una base sobre la que construir una interfaz sin tener que implementar desde cero todos los estilos habituales.


## Instalación e inclusión de Bootstrap {#instalación-bootstrap}

Para utilizar Bootstrap en una página web necesitamos incorporar sus archivos al proyecto. Existen diferentes formas de hacerlo, pero las dos más habituales son utilizar una **[CDN](https://es.wikipedia.org/wiki/Red_de_distribuci%C3%B3n_de_contenidos)** (*content delivery network*, red de distribución de contenidos) o descargar Bootstrap e incluir sus archivos dentro del propio proyecto.

La opción elegida depende de las necesidades del proyecto. Para comenzar a trabajar con Bootstrap, una CDN resulta especialmente sencilla porque no necesitamos descargar ni configurar ningún archivo. En proyectos donde queremos tener un mayor control sobre las dependencias, podemos instalar Bootstrap dentro del propio proyecto.


::: {.mycode size=footnotesize}
[HTML con Bootstrap]{.title}
```html
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Bootstrap demo</title>
  <link 
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" 
    rel="stylesheet" 
    integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" 
    crossorigin="anonymous">
</head>
<body>
  <h1>Hello, world!</h1>
  <script 
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" 
    integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" 
    crossorigin="anonymous"></script>
</body>
</html>
```
:::

El ejemplo anterior muestra la página HTML mínima usando Bootstrap a través del CDN. Se ha añadido las siguientes etiquetas:

- [meta name="viewport"]{.verbatim}: ya hemos visto [anteriormente](#viewport) que es la etiqueta para tener diseño responsive.
- [link]{.verbatim} para [bootstrap.min.css]{.configfile}: es la hoja de estilos de Bootstrap con todas las reglas necesarias para poder usarlo. Es la versión "minimizada" (sin saltos de línea).
  - Atributo [integrity]{.verbatim}: permite al navegador comprobar que el archivo descargado coincide con el contenido esperado, que es un [hash criptográfico](https://es.wikipedia.org/wiki/Funci%C3%B3n_hash_criptogr%C3%A1fica).
  - Atributo [crossorigin]{.verbatim}: indica cómo debe realizarse la solicitud de un recurso situado en otro origen.
- [<script>]{.verbatim} para [bootstrap.bundle.min.js]{.configfile}: Bootstrap proporciona un fichero JavaScript ya que algunos componentes son interactivos y lo necesitan.  Es un *bundle* porque incluye también [Popper](https://github.com/floating-ui/popper-docs/tree/main), una dependencia utilizada por algunos componentes interactivos. Es importante que este fichero se cargue tras la carga de todo el documento HTML. Por lo tanto:
  - Debe ir al final del documento, justo antes de cerrar [</body>]{.verbatim}. De esta manera el navegador puede procesar primero el contenido HTML antes de cargar y ejecutar determinados scripts.
  - Se podría añadir la etiqueta en el [<head>]{.verbatim} usando [defer]{.verbatim} para que se ejecute al final de la descarga.


Si elegimos la opción de tener los ficheros descargados, debemos guardarlos junto con el código HTML (normalmente se usan los directorios [css]{.configdir} y [js]{.configdir}) y después añadirlos usando la ruta correcta en el HTML.

La diferencia entre ambos sistemas podría resumirse en la siguiente tabla:

| CDN                                            | Archivos locales                                    |
| ---------------------------------------------- | --------------------------------------------------- |
| No necesitamos descargar Bootstrap manualmente | Los archivos forman parte del proyecto              |
| Configuración muy sencilla                     | Tenemos mayor control                               |
| El navegador obtiene el recurso de Internet    | No necesitamos obtener Bootstrap desde una CDN      |
| Muy cómodo para ejemplos y prototipos          | Adecuado cuando queremos controlar las dependencias |
| Dependemos de la disponibilidad de la CDN      | Tenemos que mantener los archivos                   |



Como alternativa, también se puede hacer la instalación mediante sistemas como **[npm](https://nodejs.org/es)**.

<!-- TODO: explicar nodejs, npm y sistema de instalación? -->

Para comprobar que se ha cargado correctamente, podemos añadir un botón, con su clase correspondiente, para ver si se renderiza de manera correcta:

::: {.mycode}
[Botón HTML con Bootstrap]{.title}
```html
<button class="btn btn-primary">
    Aceptar
</button>
```
:::


## Instalar sólo ciertos módulos {#instalar-solo-módulos}

En el apartado anterior hemos instalado/confiugrado Bootstrap al completo, pero existe la posibilidad de hacer la instalación de sólo ciertos módulos, ya que cuentan con una separación que separa:

- **Layout**: Sistema de estructura del documento que contiene *breakpoints*, sistema Grid, columnas, ...
- **Content**: Contiene las variables para los colores base, y el sistema *reboot* para tener consistencia.
- **Components**: Es la parte que tiene todos los componentes que genera botones, tablas, alertas, acordeones...
- **Utilities**: Contiene utilidades para hacer bordes, formas, anchuras, alturas...

En ciertos proyectos puede interesar cargar sólo ciertos componentes en lugar de todo el *framework*, por lo que es interesante ver la [documentación](https://getbootstrap.com/docs/5.3/getting-started/contents/) para decidir qué interesa más.


## CSS propio junto con Bootstrap {#css-propio-con-bootstrap}

A la hora de crear nuestro proyecto no tenemos que decantarnos sólo en usar Bootstrap, ya que también podemos crear nuestro fichero CSS propio para tener nuestras reglas propias y de esta manera personalizar el proyecto.

Lo que tenemos que hacer es cargar nuestro fichero CSS después del fichero Bootstrap, ya que de esta manera, las reglas que realicemos, **por [cascada](#cascada)/[especificidad](#especificidad)/[origen](#origen-hojas-estilo)**, tendrán más prioridad que las de Bootstrap si las realizamos de manera correcta cuando intentemos sobreescribir estilos.


::: exercisebox
[[10a](https://github.com/yuki/ejercicios/blob/main/daw/diw/10a.html) y [10b](https://github.com/yuki/ejercicios/blob/main/daw/diw/10b.html)]{.solution}

Crea:

- HTML usando Bootstrap a través de CDN.
- Añade botones, algún componente que haga uso de Bootstrap.
- Crea una hoja de estilos propia, con reglas que añadan clases y usalas junto con Bootrap.
- Crea otro HTML que use Bootstrap de manera local, tras descargar los ficheros necesarios.
:::


## Contenedores en Bootstrap {#contenedores-bootstrap}

Bootstrap proporciona un sistema de **[contenedores](https://getbootstrap.com/docs/5.3/layout/containers/)** que permite controlar la anchura del contenido de una página y mantenerlo centrado dentro del viewport.

Un contenedor resulta especialmente útil en pantallas grandes. Si colocásemos todo el contenido ocupando el 100 % de una pantalla muy ancha, las líneas de texto podrían resultar demasiado largas y la interfaz podría perder estructura.

Existen distintos contenedores que se adaptan al tamaño del viewport:

|               | [Extra small <576px]{.footnotesize}  | [Small ≥576px]{.footnotesize}  | [Medium ≥768px]{.footnotesize}  | [Large ≥992px]{.footnotesize}  | [X-Large ≥1200px]{.footnotesize}  | [XX-Large ≥1400px]{.footnotesize}  |
|:--------------------|--------------|---------------|--------------|-----------------|------------------|--------|
| [.container      ]{.footnotesize}   | 100%         | 540px         | 720px        | 960px           | 1140px           | 1320px |
| [.container-sm   ]{.footnotesize}   | 100%         | 540px         | 720px        | 960px           | 1140px           | 1320px |
| [.container-md   ]{.footnotesize}   | 100%         | 100%          | 720px        | 960px           | 1140px           | 1320px |
| [.container-lg   ]{.footnotesize}   | 100%         | 100%          | 100%         | 960px           | 1140px           | 1320px |
| [.container-xl   ]{.footnotesize}   | 100%         | 100%          | 100%         | 100%            | 1140px           | 1320px |
| [.container-xxl  ]{.footnotesize}   | 100%         | 100%          | 100%         | 100%            | 100%             | 1320px |
| [.container-fluid]{.footnotesize}   | 100%         | 100%          | 100%         | 100%            | 100%             | 100%   |

Table: Diferencia entre [contenedores de Bootstrap](https://getbootstrap.com/docs/5.3/layout/containers/)  {tablename=yukitblrcol colspec=X[4,l]X[3]X[3]X[3]X[3]X[3]X[3]}


Teniendo en cuenta cómo queremos que nuestra aplicación se vea, habrá que elegir la clase [container]{.verbatim} que mejor nos convenga. Cuando redimensionamos la ventana, el contenedor modificará su tamaño teniendo en cuenta la tabla anterior.


::: exercisebox
[[10c](https://github.com/yuki/ejercicios/blob/main/daw/diw/10c.html)]{.solution}

Crea un HTML que contenga:

- Distintos tipos de contenedores.
- Comprueba qué pasa al redimensionar la ventana.
- Busca cómo añadirle padding y margen superior e inferior usando las clases propias de Bootstrap.
- Analiza con las herramientas de desarrollador del navegador el CSS de cada contenedor, las reglas CSS que Bootstrap aplica y los *breakpoints* que tienen.
:::



## Sistema de columnas {#sistema-columnas}

Una de las características más conocidas de Bootstrap es su **sistema de [columnas](https://getbootstrap.com/docs/5.3/layout/columns/)**. Este sistema permite distribuir el espacio disponible de una página en diferentes columnas y crear layouts responsive de una forma sencilla. El sistema se basa principalmente en tres clases:

- [.container]{.verbatim}: controla principalmente la anchura del contenido.
- [.row]{.verbatim}: crea una fila para organizar las columnas.
- [.col]{.verbatim}: permite distribuir el espacio disponible entre las columnas.


Bootstrap utiliza tradicionalmente un sistema basado en **12 columnas**. Esto no significa que tengamos que crear siempre 12 elementos HTML, sino que el ancho disponible de una fila se puede dividir conceptualmente en 12 partes. Pueden ser 2+10, 4+8, 6+6...

Es importante diferenciar el sistema de columnas de Bootstrap de **CSS Grid**. Bootstrap utiliza un sistema basado en Flexbox para su sistema tradicional de filas y columnas, mientras que CSS Grid es un sistema de layout propio de CSS.


::: infobox
Es importante diferenciar el sistema de columnas de Bootstrap (basado en Flexbox) y CSS Grid. Ambos pueden resolver problemas similares, pero no son exactamente lo mismo.
:::


### Clases [col-*]{.verbatim} {#clases-col}

Para indicar cuántas de las 12 columnas queremos utilizar podemos emplear clases como:

- [col]{.verbatim}: para especificar que se va a crear una columna. El ancho lo decidirá automáticamente Bootstrap, dependiendo de cuántas columnas haya.
- [col-1]{.verbatim}: usa el ancho de una única columna.
- [col-2]{.verbatim}: usa el ancho de dos columnas.
- [col-12]{.verbatim}: usa todo el ancho de las 12 columnas.


De esta manera podemos crear contenedores que sólo  usen el número de columnas que nos interesa para una misma fila. En una misma fila los contenedores que haya no pueden superar las 12 columnas, porque de ser así pasará a la siguiente fila.

:::::::::::::: {.columns}
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[Ejemplo de dos columnas]{.title}
```html
<div class="row">
  <div class="col">
    Columna izquierda
  </div>
  <div class="col-6">
    Columna derecha
  </div>
</div>
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[Ejemplo 3 columnas]{.title}
```html
<div class="row">
  <div class="col-2">
    Columna pequeña
  </div>
  <div class="col-5">
    Columna ancha
  </div>
  <div class="col-5">
    Columna ancha
  </div>
</div>
```
:::

:::
::::::::::::::


::: questionbox
¿Qué pasa si las columnas en total supera el número 12?
:::


### Columnas vacías {#columnas-vacías}

Podemos utilizar menos de 12 unidades en la suma total en una fila, lo que hará que al final se deje espacio libre sin usar.

::: {.mycode size=footnotesize}
[Ejemplo 3 columnas]{.title}
```html
<div class="row">
  <div class="col-2">
    Columna pequeña
  </div>
  <div class="col-5">
    Columna ancha
  </div>
  <div class="col-5">
    Columna ancha
  </div>
</div>
```
:::

Si lo que queremos es poner columnas vacías al principio o en medio tenemos las clases [offset]{.verbatim} y [offset-*]{.verbatim}.

::: {.mycode size=footnotesize}
[Ejemplo con columnas vacías]{.title}
```html
<div class="row">
  <div class="offset-3 col-2">
    Columna pequeña
  </div>
  <div class="col-5">
    Columna ancha
  </div>
</div>
```
:::

::: questionbox
¿Cómo crees que se estructura el ejemplo anterior?
:::


### Separación entre columnas {#separación-entre-columnas}

Bootstrap incorpora también un sistema de **[gutter](https://getbootstrap.com/docs/5.3/layout/gutters/)**, es decir, el espacio existente entre columnas. Las columnas no tienen por qué quedar pegadas visualmente. Bootstrap gestiona el espacio entre ellas mediante propiedades relacionadas con el [padding]{.verbatim} y el [margin]{.verbatim}.

Podemos modificar estos espacios utilizando clases específicas de Bootstrap, [g-0]{.verbatim}, [g-1]{.verbatim} hasta [g-5]{.verbatim}.

Si queremos controlar el espacio horizontal están las clases [gx-*]{.verbatim} y para el espacio vertical [gy-*]{.verbatim}.



### Columnas responsive {#columnas-responsive}

Una de las principales ventajas del sistema de columnas es que podemos indicar diferentes tamaños dependiendo del breakpoint.


::: {.mycode size=footnotesize}
[Ejemplo con columnas *responsive*]{.title}
```html
<div class="row">
  <div class="col-6 col-xl-3">
    Contenido
  </div>
  <div class="col-6 col-xl-9">
    Contenido
  </div>
</div>
```
:::

En este ejemplo en pantallas de tamaño grande las columnas tendrán tamaño [3+9]{.verbatim}, y cuando saltemos el *breakpoint* a tamaño menor a "XL" (en Bootstrap [<1200px]{.verbatim}) se pasará a tener dos columnas de tamaño [6+6]{.verbatim}.

Para indicar el tamaño de los *breakpoints* de las columnas tenemos distintos sufijos, que coinciden con lo visto anteriormente: [sm]{.verbatim}, [md]{.verbatim}, [lg]{.verbatim}, [xl]{.verbatim} y [xxl]{.verbatim}.


::: infobox
Este sistema está pensado para trabajar muy bien con el enfoque **Mobile First**.
:::


### Alineación de columnas {#alineación-columnas}

Como las filas utilizan Flexbox, podemos utilizar clases de Bootstrap relacionadas con la alineación. Podemos diferenciar entre alineación **[vertical](https://getbootstrap.com/docs/5.3/layout/columns/\#vertical-alignment)** y **[horizontal](https://getbootstrap.com/docs/5.3/layout/columns/\#horizontal-alignment)**.

Si el contenedor donde tenemos las columnas es más alto que el contenido, podemos realizar las siguientes alineaciones verticales:

- Centrar de manera vertical toda la fila, tenemos las siguientes clases que hay que añadir al **[row]{.verbatim}**:
  - [align-items-start]{.verbatim}
  - [align-items-center]{.verbatim}
  - [align-items-end]{.verbatim}
- Si queremos alinear la columna de manera independiente, tenemos que aplicar una de las siguientes clases al **[col]{.verbatim}** correspondiente:
  - [align-self-start]{.verbatim}
  - [align-self-center]{.verbatim}
  - [align-self-end]{.verbatim}

Por otro lado, si queremos centrar las columnas en el eje horizontal de manera *responsive* dentro del contenedor, tenemos las siguientes clases aplicables al **[row]{.verbatim}** correspondiente.

  - [justify-content-start]{.verbatim}
  - [justify-content-center]{.verbatim}
  - [justify-content-end]{.verbatim}
  - [justify-content-around]{.verbatim}
  - [justify-content-between]{.verbatim}
  - [justify-content-evenly]{.verbatim}


![Ejemplo de [alineación de columnas con Bootstrap](https://getbootstrap.com/docs/5.3/layout/columns/\#horizontal-alignment)](img/diw/bootstrap-columns.png){width=80% framed=true}


### Orden de columnas

Bootstrap también proporciona clases para modificar el [orden](https://getbootstrap.com/docs/5.3/layout/columns/\#order-classes) visual de las columnas. Para ello existen las clases [order-*]{.verbatim}, donde podemos añadir un número del **1 al 5**. También existen las clases [order-first]{.verbatim} y [order-last]{.verbatim}.


::: exercisebox
[[10d](https://github.com/yuki/ejercicios/blob/main/daw/diw/10d.html)]{.solution}

Crea un HTML que contenga distintos sistemas de columnas:

- Donde haya diferentes columnas y anchuras distintas
- Comprueba qué sucede cuando superas las 12 columnas, o cuando no llenas todas.
- Añade columnas vacías con *offset*.
- Añade clases para tener columnas *responsive*, modificando la anchura de ellas al cambiar el tamaño de ventanas.
- Comprueba los sistemas de alineación tanto horizontal como vetical.
- Haz una prueba de cambiar de orden las columnas.
:::


## Iconos {#bootstrap-icons}

Los iconos son elementos gráficos que permiten representar de forma visual una acción, una información o una funcionalidad. Son muy habituales en las interfaces modernas y pueden aparecer en botones, menús, formularios, barras de navegación o mensajes.

Bootstrap no incluye iconos directamente dentro del framework CSS principal. Para trabajar con ellos existe una biblioteca independiente llamada **[Bootstrap Icons](https://icons.getbootstrap.com/)**, desarrollada por el mismo proyecto.

Bootstrap Icons es una colección de iconos diseñada para utilizarse junto con Bootstrap, aunque también puede utilizarse independientemente. La biblioteca proporciona cientos de iconos en formato SVG. 

Aparte de Bootstrap Icons existen otras bibliotecas con finalidad similar, tener iconos:

- [Material Icons](https://mui.com/material-ui/material-icons/)
- [Lucide](https://lucide.dev/icons/)
- [Feather Icons](https://feathericons.com/)
- [Font Awesome](https://fontawesome.com/)

Utilizar una biblioteca de iconos permite mantener una **coherencia visual** en el proyecto, son fáciles de usar, suelen disponer de **gran cantidad de iconos** y como los iconos son vectoriales, **podemos modificar el tamaño sin perder calidad**.


### Incluir Bootstrap Icons en el proyecto {#incluir-bootstrap-icons}

Dado que es un proyecto independiente, es necesario incluir una nueva hoja de estilos para los iconos, y de esta manera poder utilizar sus clases.

Al igual que sucedía con Bootstrap, podemos descargarnos la hoja de estilos para tenerlo en nuestro proyecto o usar una CDN. En ambos casos es añadir la hoja de estilos, sólo que modificando la dirección dependiendo del método elegido.


::: {.mycode size=footnotesize}
[HTML con Bootstrap Icons]{.title}
```html
<head>
  <!-- resto de cosas -->
  <link rel="stylesheet" href="css/bootstrap-icons.min.css">
</head>
```
:::



### Uso de Bootstrap Icons {#usar-bootstrap-icons}

Una vez incluida la biblioteca podemos utilizar los iconos mediante sus clases. En la [página web del proyecto](https://icons.getbootstrap.com/sprite/) podemos ver y buscar entre los distintos iconos que hay, y al elegir uno nos muestra distintos ejemplos del mismo, también como usarlo y nos permite descargar el icono en formato [SVG](https://es.wikipedia.org/wiki/Gr%C3%A1ficos_vectoriales_escalables).


::: {.mycode}
[Distintos iconos]{.title}
```html
<h1><i class="bi bi-bootstrap"></i> Icons</h1>

<i class="bi bi-person fs-1 rojo"></i>

<button class="btn btn-primary bi bi-save-fill">
Guardar
</button>


<div class="alert alert-success bi bi-check-circle-fill" role="alert">
  A simple success alert.
</div>
```
:::

En el ejemplo anterior se han añadido distintos iconos, y se han incluido en un botón y también en un aviso de alerta. De esta manera, los usuarios pueden identificar el propósito de ambos.

Podemos añadir nuestras propias clases para añadir colores a los iconos, o modificar el tamaño. Para esto último, también están las clases propias [fs-1]{.verbatim} a [fs-6]{.verbatim} para modificar el tamaño de la fuente.


![Ejemplo con Bootstrap Icons](img/diw/bootstrap-icons.png){width=40%}


::: exercisebox
[[10e](https://github.com/yuki/ejercicios/blob/main/daw/diw/10e.html)]{.solution}

Usa Bootstrap Icons:

- En botones, avisos, párrafos... 
- Añade reglas propias para añadir colores
- Copia el ejercicio [09b](https://github.com/yuki/ejercicios/blob/main/daw/diw/09b.html) y añade iconos en los menús.
:::



<!-- 
# Personalización de Bootstrap {#personalización-bootstrap}

Bootstrap proporciona una gran cantidad de estilos y componentes preparados para utilizar directamente en una página web. Sin embargo, en un proyecto real no siempre queremos utilizar exactamente el aspecto que Bootstrap proporciona por defecto, ya que haría que nuestra web sea genérica y sin personalización.

Normalmente, vamos a querer utilizar unos colores corporativos concretos, modificar el tamaño de los botones, cambiar los bordes, adaptar los espacios o crear un diseño visual completamente propio. Por este motivo, Bootstrap permite diferentes formas de **personalización**, que se puede resumir en dos niveles:

1. Añadir nuestro propio CSS después de Bootstrap.
2. Personalizar Bootstrap mediante sus variables y herramientas de compilación.

La primera opción ya la hemos visto previamente, y por tanto, no es necesario volver a explicar. Para la segunda opción hay distintos apartados en la [documentación](https://getbootstrap.com/docs/5.3/customize/overview/), por lo que es interesante leer las distintas opciones.


El método más sencillo es redefinir las [variables CSS de Bootstrap](https://getbootstrap.com/docs/5.3/customize/css-variables/) con los valores que mejor noss convengan

-->

