
# Introducción {#diseño-moderno-introducción}

Hasta ahora hemos aprendido a crear el aspecto visual de los elementos mediante colores, tipografías, bordes, márgenes y el modelo de cajas. Sin embargo, todavía nos falta cómo distribuir los elementos dentro de una página.

Durante muchos años esta fue una de las tareas más complejas de CSS. Los desarrolladores utilizaban tablas, elementos flotantes ([float]{.verbatim}) e incluso posicionamiento absoluto para construir menús, columnas y páginas completas. Estas técnicas funcionaban, pero eran difíciles de mantener y nunca fueron diseñadas realmente para crear maquetaciones.

A partir de CSS3 aparecieron dos tecnologías que cambiaron por completo la forma de diseñar interfaces:

- **[Flexbox](https://developer.mozilla.org/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Basic_concepts)**, pensado para distribuir elementos en **una única dimensión**.
- **[CSS Grid](https://developer.mozilla.org/en-US/docs/Web/CSS/Guides/Grid_layout)**, diseñado para crear **rejillas bidimensionales** con filas y columnas simultáneamente.



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

