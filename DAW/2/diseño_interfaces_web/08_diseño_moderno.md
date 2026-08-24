
# Introducción {#diseño-moderno-introducción}

Hasta ahora hemos aprendido a crear el aspecto visual de los elementos mediante colores, tipografías, bordes, márgenes y el modelo de cajas. Sin embargo, todavía nos falta cómo distribuir los elementos dentro de una página.

Durante muchos años esta fue una de las tareas más complejas de CSS. Los desarrolladores utilizaban tablas, elementos flotantes ([float]{.verbatim}) e incluso posicionamiento absoluto para construir menús, columnas y páginas completas. Estas técnicas funcionaban, pero eran difíciles de mantener y nunca fueron diseñadas realmente para crear maquetaciones.

A partir de CSS3 aparecieron dos tecnologías que cambiaron por completo la forma de diseñar interfaces:

- **[Flexbox](https://developer.mozilla.org/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Basic_concepts)**, pensado para distribuir elementos en **una única dimensión**.
- **[CSS Grid](https://developer.mozilla.org/en-US/docs/Web/CSS/Guides/Grid_layout)**, diseñado para crear **cuadrículas bidimensionales** con filas y columnas simultáneamente.



# Flexbox {#flexbox}

**Flexbox** (*Flexible Box Layout*) es un sistema de maquetación que organiza elementos en **una sola dirección**, ya sea horizontal o vertical, que permite distribuir y alinear elementos de forma sencilla dentro de un contenedor.

Su principal ventaja es que el navegador reparte automáticamente el espacio disponible entre los elementos, evitando muchos de los problemas que existían con [float]{.verbatim}.

Actualmente Flexbox es la herramienta más utilizada para crear:

- Menús horizontales.
- Barras de navegación.
- Botones alineados.
- Tarjetas.
- Cabeceras.
- Formularios.
- Barras de herramientas.


Flexbox siempre trabaja con dos tipos de elementos:

- **Contenedor flex**: el elemento padre que activa Flexbox.
- **Elementos flex**: los hijos directos del contenedor.


## Contenedor flex {#contenedor-flex}

El contenedor *flex* es el elemento padre que contendrá otros elementos que se alinearán de manera horizontal, o vertical, en el espacio disponible.

:::::::::::::: {.columns columnsep=0.5cm}
::: {.column width="50%"}

::: {.mycode}
[HTML]{.title}
```html
<div class="contenedor">
    <div class="caja">A</div>
    <div class="caja">B</div>
    <div class="caja">C</div>
</div>
```
:::

:::
::: {.column width="50%" }

::: {.mycode}
[CSS]{.title}
```css
.contenedor {
    display: flex;
}
.caja {
    width:50px;
    height: 50px;
    border: 1px solid black;
}
```
:::

:::
::::::::::::::

Por defecto los elementos se alinean en filas, uno seguido de otro, de izquierda a derecha. Si el contenedor es más grande que el espacio ocupado por los elementos hijos, por defecto sólo se ocupa el espacio más a la izquierda del mismo.

Si queremos modificar las propiedades por defecto tenemos las siguientes propiedades:

- [flex-direction]{.verbatim}: determina la dirección del eje (fila o columna).
- [flex-wrap]{.verbatim}: si no hay espacio para todos los hijos, salta de línea o columna.
- [flex-flow]{.verbatim}: es la combinación de las propiedades anteriores.
- [gap]{.verbatim}: para indicar la separación entre los elementos hijos.
- [row-gap]{.verbatim}: separación para filas.
- [column-gap]{.verbatim}: separación para columnas.

Estas propiedades afectan **al conjunto de los elementos**, nunca a un hijo individual.


### [flex-direction]{.verbatim} {#flex-direction}

Nos va a permitir elegir qué tipo de eje queremos utilizar (fila o columna) y el orden del mismo. Los posibles valores son:

- [row]{.verbatim}: Crea una fila.
- [row-reverse]{.verbatim}: Crea una fila pero inversa, empezando desde el lado derecho hacia la izquierda, poniendo al final del todo el primer elemento hijo, después el segundo, ... Es importante destacar que **solo cambia la representación visual**, no el orden del documento HTML.
- [column]{.verbatim}: Crea una columna.
- [column-reverse]{.verbatim}: Crea columna invertida, como la fila pero en modo columna


### [flex-wrap]{.verbatim} {#flex-wrap}

Por defecto, Flexbox intenta colocar todos los elementos en una única línea, y si no hay espacio, los elementos hijos pueden comprimirse. Con [flex-wrap]{.verbatim} podemos modificar este comportamiento, dependiendo del valor indicado:

- [nowrap]{.verbatim}: usará siempre una única línea. Este es el comportamiento por defecto.
- [wrap]{.verbatim}: permite varias líneas si no hay espacio suficiente
- [wrap-reverse]{.verbatim}: permite varias líneas pero en orden inverso.

![Ejemplo de [wrap]{.verbatim} y [wrap-reverse]{.verbatim} en una fila](img/diw/flex-wrap.png){width=50%}


### [flex-flow]{.verbatim} {#flex-flow}

Esta propiedad combina [flex-direction]{.verbatim} y [flex-wrap]{.verbatim}. Básicamente evita tener que escribir las dos propiedades anteriores y así sólo tener una:


::: {.mycode}
[CSS]{.title}
```css
.contenedor {
    flex-flow: row wrap;
}
```
:::

Aunque es completamente válida, muchos equipos prefieren escribir ambas propiedades por separado para mejorar la legibilidad.

### [gap]{.verbatim} {#gap}

Tradicionalmente era necesario utilizar márgenes para separar elementos. Flexbox introdujo una solución mucho más limpia, la propiedad [gap]{.verbatim}. El espacio se aplica automáticamente entre los elementos, sin afectar a los bordes exteriores del contenedor.


::: {.mycode}
[CSS]{.title}
```css
.contenedor {
    gap: 30px;
}
```
:::

Actualmente [gap]{.verbatim} es la opción recomendada frente al uso de márgenes para separar componentes flexibles.

También es posible controlar cada dirección por separado.

- [row-gap]{.verbatim}: Controla la separación entre filas.
- [column-gap]{.verbatim}: Controla la separación entre columnas.

Estas propiedades son especialmente útiles cuando utilizamos [flex-wrap]{.verbatim}.


::: exercisebox
[[07a](https://github.com/yuki/ejercicios/blob/main/daw/diw/07a.html)]{.solution}

Crea un contenedor padre que sea flexible:

- Añade varios elementos dentro.
- Combina las propiedades vistas previamente.
- Haz la ventana más pequeña para ver cómo se reordenan los elementos hijos.
- Añade distinta separación entre ellos.
:::


## Elementos flexibles {#elementos-flexibles}

Los elementos flexibles (contenidos dentro de un contenedor flexible) pueden crecer, reducir su tamaño, tener un tamaño inicial diferente, cambiar su orden visual o alinearse de forma distinta al resto de sus compañeros.

Las propiedades principales, con un resumen de su uso, son:

- [flex-grow]{.verbatim}: el elemento crece proporcionalmente.
- [flex-shrink]{.verbatim}: el elemento reduce su tamaño cuando falta espacio.
- [flex-basis]{.verbatim}: tamaño inicial del elemento.
- [order]{.verbatim}: orden visual.
- [align-self]{.verbatim}: alineación individual.

Estas propiedades se aplican **sobre los hijos del contenedor, nunca sobre el propio contenedor**.


### [flex-grow]{.verbatim} {#flex-grow}

La propiedad [flex-grow]{.verbatim} indica cuánto puede **crecer** un elemento cuando existe espacio libre dentro del contenedor. Por defecto el valor es [0]{.verbatim}, por lo tanto los elementos no crecen. Esta propiedad no representa píxeles, sino **proporciones**.


::: {.mycode}
[Cambiar tamaño]{.title}
```css
.c1 { flex-grow: 1; }
```
:::


El elemento con esta propiedad crecerá ocupando el espacio sobrante del contenedor padre. Si todos los elementos hijos tienen el mismo valor, todos crecerán por igual y se repartirán el espacio equitativamente. De esta manera podemos crear **columnas del mismo tamaño**.


En cambio, si tenemos tres hijos y tienen los siguientes valores:

::: {.mycode}
[Cambiar tamaño]{.title}
```css
.c1 { flex-grow: 1; }
.c2 { flex-grow: 2; }
.c3 { flex-grow: 1; }
```
:::

De esta manera los tres hijos se dividen el espacio dando lugar a que "c1" y "c3" tendrán el mismo tamaño y "c2" será el doble de tamaño de los dos anteriores.



### [flex-shrink]{.verbatim} {#flex-shrink}

Mientras [flex-grow]{.verbatim} controla el crecimiento, **[flex-shrink]{.verbatim}** controla cuánto puede reducirse un elemento cuando falta espacio. El valor por defecto es [1]{.verbatim}, lo que significa que el elemento puede encogerse. 

::: {.mycode}
[Impide que se haga más pequeño]{.title}
```css
.c4 {
    width: 150px;
    flex-shrink: 0;
}
```
:::

De esta manera, este elemento no se va a hacer más pequeño, siendo útil para logotipos e iconos.


### [flex-basis]{.verbatim} {#flex-basis}

[flex-basis]{.verbatim} define el **tamaño inicial** de un elemento antes de repartir el espacio. Podemos imaginarlo como el punto de partida desde el que Flexbox calcula el reparto.


::: {.mycode}
[Tamaño inicial]{.title}
```css
.c5 {
    flex-basis: 200px;
}
```
:::


En muchas ocasiones sustituye al uso de [width]{.verbatim}, ya que [width]{.verbatim} define la anchura del elemento, mientras que [flex-basis]{.verbatim} define el tamaño inicial dentro del algoritmo de Flexbox.

::: infobox
Cuando trabajamos con Flexbox suele recomendarse utilizar [flex-basis]{.verbatim} en lugar de [width]{.verbatim}, ya que está pensado específicamente para este sistema de distribución.
:::


### Propiedad abreviada [flex]{.verbatim} {#propiedad-flex-abreviada}

Para no escribir las tres propiedades anteriores, podemos utilizar la propiedad [[flex]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference/Properties/flex). Esta propiedad sigue el orden [grow shrink basis]{.verbatim}, por lo tanto, las siguientes instrucciones son iguales:

:::::::::::::: {.columns columnsep=0.5cm}
::: {.column width="50%"}

::: {.mycode}
[Propiedades separadas]{.title}
```css
.item {
    flex-grow: 1;
    flex-shrink: 1;
    flex-basis: 200px;
}
```
:::

:::
::: {.column width="50%" }

::: {.mycode}
[Una única propiedad]{.title}
```css
.item {
    flex: 1 1 200px;
}
```
:::

:::
::::::::::::::



### [order]{.verbatim}

[order]{.verbatim} modifica el **orden visual** de un elemento.

:::::::::::::: {.columns columnsep=0.5cm}
::: {.column width="50%"}

::: {.mycode}
[HTML]{.title}
```html
<div class="contenedor">
    <div class="a">A</div>
    <div class="b">B</div>
    <div class="c">C</div>
</div>
```
:::

:::
::: {.column width="50%" }

::: {.mycode}
[CSS]{.title}
```css
.a { order: 2; }
.b { order: 3; }
.c { order: 1; }
```
:::

:::
::::::::::::::


En este caso el resultado visual será [C  A  B]{.verbatim}. Sólo cambia la representación visual, mientras que la jerarquía HTML se mantiene.


### [align-self]{.verbatim} {#align-self}

Hasta ahora todos los elementos compartían la misma alineación vertical. Con [align-self]{.verbatim} vamos a poder hacer que **un único elemento** tenga una alineación diferente.

::: {.mycode}
[CSS]{.title}
```css
.destacado {
    align-self: center;
}
```
:::


Este elemento se alinea centrado verticalmente, mientras que el resto de elementos mantiene la alineación del contenedor.


::: exercisebox
[[07b](https://github.com/yuki/ejercicios/blob/main/daw/diw/07b.html)]{.solution}

Partiendo del ejercicio anterior utiliza las propiedades para los elementos dentro de un contenedor [flex]{.verbatim}.
:::


# Alineaciones {#alineaciones}

Uno de los principales motivos por los que Flexbox sustituyó a [float]{.verbatim} fue la facilidad con la que permite **alinear elementos horizontal y verticalmente**. Antes de Flexbox, centrar un elemento en una página requería combinaciones de márgenes, posicionamiento absoluto o incluso tablas. Con Flexbox, la alineación se realiza mediante tres propiedades muy claras:

- [justify-content]{.verbatim}: Alineación sobre el **eje principal**.
- [align-items]{.verbatim}: Alineación sobre el **eje transversal**.
- [align-content]{.verbatim}: Alineación de **varias filas o columnas** cuando existe [flex-wrap]{.verbatim}.

Para entender la diferencia entre eje principal y transversal sirva la siguiente tabla:


|                     |  flex-direction: row  |  flex-direction: column  |
|---------------------|---------------------|---------------------|
| **Eje principal**   | Horizontal  | Vertical |
| **Eje transversal** | Vertical    | Horizontal |

Table: {tablename=yukitblrcol colspec=X[2]X[3]X[3]}


::: warnbox
Antes de utilizar estas propiedades, es importante identificar siempre cuál es el eje principal del contenedor.
:::


##  [justify-content]{.verbatim} {#justify-content}

La propiedad [justify-content]{.verbatim} distribuye los elementos a lo largo del **eje principal**: espacio horizontal cuando trabajamos con filas. Los valores principales son:

- [flex-start]{.verbatim}: Es el valor por defecto. Los elementos se agrupan al inicio del contenedor.
- [flex-end]{.verbatim}: Los elementos se agrupan al final del contenedor.
- [center]{.verbatim}: Los elementos se agrupan en el centro del contenedor.
- [space-between]{.verbatim}: Reparte el espacio **entre** los elementos. Los extremos quedan pegados a los bordes del contenedor.
- [space-around]{.verbatim}: Cada elemento recibe espacio a ambos lados. Los espacios exteriores son aproximadamente la mitad de los interiores.
- [space-evenly]{.verbatim}: Distribuye el espacio de forma completamente uniforme. Todos los espacios, incluidos los de los extremos, son iguales.


::: {.mycode}
[Ejemplo de [justify-content]{.verbatim}]{.title}
```css
.contenedor { justify-content: space-between; }
```
:::


![Ejemplo de [justify-content]{.verbatim} con distintos valores](img/diw/justify-content.png){width=60% framed=true}


::: exercisebox
[[07c](https://github.com/yuki/ejercicios/blob/main/daw/diw/07c.html)]{.solution}

Crea contenedores con las distintas variaciones que permite [justify-content]{.verbatim} para alinear sus elementos hijos.
:::


## [align-items]{.verbatim} {#align-items}

La propiedad [align-items]{.verbatim} controla la alineación sobre el **eje transversal**. Si trabajamos en una fila, significa la alineación vertical. Esta propiedad tiene varios valores, por lo que conviene mirar la [documentación](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference/Properties/align-items), pero los principales son:

- [stretch]{.verbatim}:  Es el valor por defecto. Los elementos se estiran para ocupar toda la altura del contenedor, siempre que no tengan una altura definida. Es muy útil para crear columnas de igual altura.
- [center]{.verbatim}: Los elementos ocupan su altura definida y se alinean respecto a su eje vertical.
- [flex-start]{.verbatim}:  Los elementos se alinean verticalmente en la parte alta del contenedor.
- [flex-end]{.verbatim}:  Los elementos se alinean verticalmente en la parte baja del contenedor.
- [baseline]{.verbatim}:  Se alinean respecto a la línea base del texto.

En las explicaciones se ha tomado como referencia el uso de filas.


::: {.mycode}
[Ejemplo de [justify-content]{.verbatim}]{.title}
```css
.contenedor {
    display: flex;
    flex-wrap: wrap;
    align-items: center;
}
```
:::


![Distintos ejemplos de [align-items]{.verbatim}. Versionado de [MDN](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference/Properties/align-items)](img/diw/align-items.png){width=100%}


::: exercisebox
[[07d](https://github.com/yuki/ejercicios/blob/main/daw/diw/07d.html)]{.solution}

Comprueba los valores explicados de [align-items]{.verbatim} y haz ejemplos propios.
:::


## [align-content]{.verbatim} {#align-content}

La propiedad [align-content]{.verbatim} suele confundirse con [align-items]{.verbatim} , pero su función es diferente. Solo actúa cuando existe [flex-wrap]{.verbatim} y  hay **varias filas o columnas**. Con este parámetro se alinean las **filas completas**, no los elementos individuales (que es lo que sucedía en el parámetro anterior). Los valores son similares a los anteriores:

- [center]{.verbatim}: Las filas se alinean en el centro dek eje vertical del elemento contenedor.
- [start]{.verbatim}:  Las filas se alinean verticalmente en la parte alta del contenedor.
- [end]{.verbatim}:  Las filas se alinean verticalmente en la parte baja del contenedor.
- [space-between]{.verbatim}, [space-around]{.verbatim}, [space-evenly]{.verbatim}:  Funciona igual que lo explicado en [[justify-content]{.verbatim}](#justify-content), pero a nivel de filas.

Si sólo hay una fila, [align-content]{.verbatim} no produce ningún efecto.

::: {.mycode}
[Ejemplo de [justify-content]{.verbatim}]{.title}
```css
.contenedor {
    display: flex;
    flex-wrap: wrap;
    align-content: center;
}
```
:::


::: infobox
La propiedad [align-content]{.verbatim} actúa sobre la fila/columna completa.
:::

![Distintos ejemplos de [align-content]{.verbatim}. Versionado de [MDN](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference/Properties/align-items)](img/diw/align-content.png){width=100%}



::: exercisebox
[[07e](https://github.com/yuki/ejercicios/blob/main/daw/diw/07e.html)]{.solution}

Comprueba los valores explicados de [align-items]{.verbatim} y haz ejemplos propios.
:::


# CSS Grid {#grid}

Hasta ahora hemos utilizado **Flexbox** para distribuir elementos en una única dirección. Sin embargo, muchas interfaces necesitan controlar **filas y columnas al mismo tiempo**: galerías de imágenes, paneles de administración, calendarios o la distribución completa de una página web.

**[CSS Grid Layout](https://developer.mozilla.org/en-US/docs/Web/CSS/Guides/Grid_layout)**, conocido simplemente como **Grid**, es un sistema de maquetación bidimensional diseñado específicamente para crear este tipo de cuadrículas. Mientras Flexbox organiza elementos en una fila o en una columna, Grid permite definir una estructura completa formada por **filas y columnas simultáneamente**. Actualmente Grid es la herramienta recomendada para construir el layout principal de una aplicación web.

Podemos definir que existen dos tipos de cuadrículas/*grid*:

- **Grid explícito**: se define manualmente el número y el tamaño de las filas y/o columnas. El desarrollador tiene un diseño fijo definido explícitamente. Normalmente se usa para la definición general de la web, o sistema de columnas de lectura...
- **Grid implícito**: está formado por las filas y/o columnas que el navegador crea automáticamente cuando hacen falta. Normalmente en galería de fotos, o en diseños de portada de páginas web con un número de elementos fijos pero de tamaños distintos... Ocurre cuando hay más elementos de los que se ha especificado en la cuadrícula inicial.

## Contenedor Grid {#contenedor-grid}

Para activar Grid basta con convertir un elemento en un contenedor de cuadrícula, y a partir de ese momento, todos sus hijos directos pasan a ser **elementos de la cuadrícula**.

:::::::::::::: {.columns columnsep=0.5cm}
::: {.column width="50%"}

::: {.mycode}
[HTML]{.title}
```html
<div class="contenedor">
    <div class="caja">A</div>
    <div class="caja">B</div>
    <div class="caja">C</div>
</div>
```
:::

:::
::: {.column width="50%" }

::: {.mycode}
[CSS]{.title}
```css
.contenedor {
    display: grid;
}
.caja {
    width:50px;
    height: 50px;
    border: 1px solid black;
}
```
:::

:::
::::::::::::::


Aunque todavía no hemos definido filas ni columnas, el elemento ya es un contenedor Grid. Las propiedades que veremos en este apartado siempre se aplican sobre el contenedor. Una cuadrícula/*grid* está formada por dos tipos de pistas (*tracks*):

- **Columnas**: [grid-template-columns]{.verbatim}
- **Filas**: [grid-template-rows]{.verbatim}

Hay una característica especial llamada [[grid-template-areas]{.verbatim}](#grid-areas) que veremos más adelante.


### [grid-template-columns]{.verbatim} {#grid-template-columns}

Es la propiedad más importante de Grid. y sirve para generar columnas:

::: {.mycode}
[CSS]{.title}
```css
.contenedor {
    display: grid;
    grid-template-columns: 150px 150px 150px;
}
```
:::


Cada valor define el ancho de una columna, por lo que en el ejemplo anterior se crean tres columnas de 150px cada una.


#### La unidad [fr]{.verbatim}

La unidad **[fr]{.verbatim}** (*fraction*) representa una fracción del espacio disponible.

::: {.mycode}
[CSS]{.title}
```css
.contenedor {
    display: grid;
    grid-template-columns: 1fr 2fr 1fr;
}
```
:::

Las tres columnas dividen el espacio en distintas proporciones, en este caso la columna central ocupa el doble que los laterales. El funcionamiento es muy similar a [[flex-grow]{.verbatim}](#flex-grow). Esta unidad se puede utilizar también con filas.


### [grid-template-rows]{.verbatim} {#grid-template-rows}

Las filas se definen de forma equivalente.

::: {.mycode}
[CSS]{.title}
```css
.contenedor {
    display: grid;
    grid-template-rows: 80px 200px 60px;
}
```
:::

En este caso se ha creado un *grid* que consta de tres filas con distintos tamaños cada una.


## [gap]{.verbatim} en Grid {#gap-grid}

Al igual que Flexbox, Grid utiliza [gap]{.verbatim} para separar elementos, que sustituye al uso de márgenes y genera una separación uniforme entre filas y columnas.


::: {.mycode}
[CSS]{.title}
```css
.contenedor {
    display: grid;
    grid-template-columns: 1fr 2fr 1fr;
    gap: 20px;
}
```
:::

También existen [row-gap]{.verbatim} y [column-gap]{.verbatim}.


## La función [repeat()]{.verbatim} {#función-repeat}

Cuando existen muchas columnas iguales, escribirlas manualmente resulta repetitivo, por lo que podemos usar la función [repeat()]{.verbatim}. Por ejemplo, en lugar de escribir [1fr 1fr 1fr 1fr]{.verbatim} para generar cuatro columnas, podemos usar lo siguiente:

::: {.mycode}
[CSS]{.title}
```css
.contenedor {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 20px;
}
```
:::

El resultado es exactamente el mismo y el código es más legible. [repeat()]{.verbatim} es una de las funciones más utilizadas en CSS Grid.



## *Grids* adaptables {#grids-adaptables}

Podemos crear *grids responsive* utilizando [[minmax()]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference/Values/minmax) y [[auto-fit]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference/Values/repeat\#auto-fit).

::: {.mycode}
[CSS]{.title}
```css
.contenedor {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
    gap: 20px;
}
```
:::


A continuación la explicación de la función:

- [repeat]{.verbatim}: la función trata de repetir el sistema de columnas.
  - [[auto-fit]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference/Values/repeat\#auto-fit): Trata de rellenar el espacio con columnas, pero si está vacía, la columna colapsa/desaparece.
  - [[minmax]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference/Values/minmax): es una función que recibe dos parámetros: mínimo y máximo, que genera un rango igual o superior al mínimo, e inferior o igual al máximo.

Por lo tanto, se trata de crear un sistema de columnas que al menos cada una mida 220px, y si existe más espacio se crearán nuevas.

Este patrón es uno de los más utilizados en desarrollo web moderno.

::: exercisebox
[[07f](https://github.com/yuki/ejercicios/blob/main/daw/diw/07f.html)]{.solution}

Crea un contenedor padre que sea una cuadrícula con [grid]{.verbatim} y usa las propiedades vistas previamente y usa el sistema de repetición.
:::

## Otros parámetros {#otros-parámetros}

Existen otros parámetros para poder controlar y hacer que las *grids* se ajusten a nuestras necesidades. A continuación algunos del listado que aparece en la [documentación](https://developer.mozilla.org/en-US/docs/Web/CSS/Guides/Grid_layout).

- [grid-auto-flow]{.verbatim}: controla cómo funciona el algoritmo de colocación automática, especificando exactamente cómo se distribuyen en la cuadrícula los elementos colocados automáticamente (filas o columnas).
- [grid-auto-columns]{.verbatim}: especifica el tamaño de las columnas del *grid*.
- [grid-auto-rows]{.verbatim}: especifica el tamaño de las filas del *grid*.
- [grid-column-start]{.verbatim}: especifica la posición inicial de un elemento dentro de la columna de la cuadrícula.
- [grid-column-end]{.verbatim}: especifica la posición final de un elemento dentro de la columna de la cuadrícula.
- [grid-row-start]{.verbatim}: especifica la posición inicial de un elemento dentro de la fila de la cuadrícula.
- [grid-row-end]{.verbatim}: especifica la posición final de un elemento dentro de la fila de la cuadrícula.




## Grid Areas {#grid-areas}

Hasta ahora hemos construido rejillas definiendo el número de filas y columnas, dejando que los elementos se coloquen automáticamente. Sin embargo, cuando diseñamos la estructura completa de una página web, suele ser más cómodo **dar un nombre a cada zona del layout** en lugar de trabajar con números de fila y columna.



**Grid Areas** permite asignar nombres como "*header*", "*menu*", "*main*" o "*footer* a las distintas regiones de una rejilla, consiguiendo un código mucho más legible y fácil de mantener. Mediante la propiedad [grid-template-areas]{.verbatim} podemos hacer esta separación que puede resultar más visual.

Imaginemos típica página web con distintos apartados:

:::::::::::::: {.columns columnsep=0.5cm}
::: {.column width="50%"}

::: {.mycode}
[HTML]{.title}
```html
<div id="page">
  <div id="logo">logo</div>
  <header>Header</header>
  <nav>Navigation</nav>
  <main>Main area</main>
  <div id="ads">ads</div>
  <footer>Footer</footer>
</div>
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[CSS]{.title}
```css
#page {
  display: grid;
  width: 100%;
  height: 100vh;
  grid-template-areas:
    "logo head head"
    "nav  main ads"
    ".    foot .";
  grid-template-rows: 50px 1fr 30px;
  grid-template-columns: 150px 1fr 150px;
}
#page > header {
  grid-area: head;
}
#page > nav {
  grid-area: nav;
}
/* resto áreas */
```
:::

:::
::::::::::::::

En [grid-template-areas]{.verbatim} se puede apreciar cómo está separado cada elemento de manera "visual", generando tres filas y tres columnas, y cada "celda" tiene un nombre. Cuando un nombre se repite en la misma fila, se expande horizontalmente, y lo mismo ocurre con las columnas verticalmente. Las áreas marcadas con punto ([.]{.verbatim}) son celdas vacías. El resultado sería el siguiente:

![Ejemplo básico de [grid-template-areas]{.verbatim}](img/diw/grid-template-areas.png){width=80% framed=true}

::: errorbox
A la hora de poner nombres en las "celdas" las áreas deben formar rectángulos, no puede haber formas "extrañas":
:::


::: exercisebox
[[07g](https://github.com/yuki/ejercicios/blob/main/daw/diw/07g.html)]{.solution}

Crea plantillas de webs modernas con [grid-template-areas]{.verbatim}
:::


# Grid y Flexbox juntos {#grid-flexbox-juntos}

Grid y Flexbox no son tecnologías competidoras, sino **complementarias**. Lo habitual es hacer uso ellas de manera conjunta, ya que cada una aporta ciertas características que hace que sea más simple de usar que la otra. Además, ambas forman parte del estándar de CSS, son compatibles con todos los navegadores modernos y pueden utilizarse conjuntamente dentro de un mismo proyecto.

En la siguiente tabla se puede ver un resumen completo de distintas características de ambas tecnologías:

|                | Flexbox | Grid |
|----------------|----------|------|
| Dimensiones | 1 | 2 |
| Filas | Sí | Sí |
| Columnas | Sí | Sí |
| Control simultáneo de filas y columnas | No | Sí |
| Reparto automático del espacio | Excelente | Excelente |
| Layout completo | Limitado | Ideal |
| Componentes pequeños | Ideal | Posible |
| Galerías | Aceptable | Excelente |

Table: {tablename=yukitblrcol colspec=X[2]X[1]X[1]}



Por ejemplo, un uso combinado de ambas tecnologías podría ser:

- **Plantilla general**: creada con Grid, con distintos apartados:
  - **Header**: Uso de Flexbox para colocar logo, secciones, caja de búsqueda...
  - **Sidebar**
  - **Main**: Depende del contenido, se puede usar Flexbox o Grid.
  - **Footer**: Flexbox para añadir secciones.

