
# *Box Model* {#box-model}

Para comprender realmente cómo se comporta una página web es necesario conocer el **modelo de cajas** (*[Box Model](https://developer.mozilla.org/en-US/docs/Web/CSS/Guides/Box_model)*), uno de los conceptos más importantes de CSS.

El navegador no interpreta los elementos HTML como texto o imágenes aisladas, sino como **cajas rectangulares**. Cada párrafo, botón, imagen, encabezado o formulario ocupa una caja con unas dimensiones y un espacio determinado respecto a los demás elementos.

Comprender el modelo de cajas permitirá responder preguntas como:

- ¿Por qué dos elementos están separados?
- ¿Por qué una caja ocupa más espacio del esperado?
- ¿Cuál es la diferencia entre [[padding]{.verbatim}](#padding) y [[margin]{.verbatim}](#márgenes)?
- ¿Por qué un borde modifica el tamaño visible de un elemento?


## Áreas de una caja {#elementos-caja}

Tal como se ha dicho, cada elemento en HTML es interpretada como una caja rectangular, que a su vez cuenta con cuatro áreas distintas:

1. **Contenido** (*content*): Contenido del elemento.
2. **Relleno** (*padding*): Espacio interior.
3. **Borde** (*border*): Borde visible.
4. **Margen** (*margin*): Espacio exterior para separar esta caja de otras vecinas.

El tamaño de la caja es calculado por el navegador teniendo en cuenta el espacio de todas ellas. En las siguientes imágenes se pueden apreciar mejor:

:::::::::::::: {.columns }
::: {.column width="33%"}
![Modelo caja en [MDN](https://developer.mozilla.org/en-US/docs/Web/CSS/Guides/Box_model)](img/diw/caja.png){width=100%}
:::
::: {.column width="33%" }
![Modelo caja Chrome](img/diw/caja-chrome.png){width=100%}
:::
::: {.column width="33%" }
![Modelo caja Firefox](img/diw/caja-firefox.png){width=100%}
:::
::::::::::::::

Desde las herramientas del desarrollador de nuestro navegador podemos ver el *box model* y el tamaño que ocupa cada elemento de una página.

Este modelo constituye la base del diseño en CSS y es imprescindible entenderlo antes de ver apartados más complejos.

## Tamaño de la caja y [box-sizing]{.verbatim} {#tamaño-caja-box-sizing}

Supongamos que tenemos la siguiente caja:

::: mycode
[Máxima altura]{.title}
```css
.caja {
    width: 300px;
    height: 200px;
    padding: 20px;
    border: 5px solid black;
    margin: 10px;
}
```
:::

Aunque todavía no hayamos visto las propiedades en profundidad, pero teniendo en cuenta el modelo de caja visto anteriormente:

::: questionbox
¿Cuál crees que es la anchura total de la caja? ¿Y la altura?
:::


En el ejemplo anterior la anchura de la caja es de [300+20+20+5+5=350px]{.verbatim}, ya que hay que sumar la anchura establecida, más el *padding* a cada lado y la anchura del borde, también a cada lado. El margen no entra en el cómputo del tamaño, al ser separación entre elementos. Este comportamiento puede resultar extraño al principio.


La propiedad [box-sizing]{.verbatim} permite modificar cómo se calculan las dimensiones. Existen dos valores principales:

- [content-box]{.verbatim}: es el comportamiento tradicional. La anchura corresponde al contenido. **Este es el comportamiento por defecto**.
- [border-box]{.verbatim}: **el ancho incluye el padding y el borde**. Este comportamiento resulta **más intuitivo**.

En las siguientes imágenes se puede apreciar mejor la diferencia en el cálculo de la dimensión real de la caja:

:::::::::::::: {.columns }
::: {.column width="50%"}
![Comparación](img/diw/border_box-content-box.png){width=100%}
:::
::: {.column width="25%" }

![Content-box](img/diw/content-box.png){width=100%}

:::
::: {.column width="25%" }

![Border-box](img/diw/border-box.png){width=100%}

:::
::::::::::::::

Tal como se puede ver, cuando la opción es [content-box]{.verbatim} el tamaño es el establecido en [width]{.verbatim}, y después se añade los tamaños restantes. En cambio, cuando es [border-box]{.verbatim}, las herramientas del desarrollador muestran cómo al tamaño del contenido se le ha restado el tamaño del [padding]{.verbatim} y el [border]{.verbatim} para que coincida con el total de [width]{.verbatim}

::: exercisebox
[[04i](https://github.com/yuki/ejercicios/blob/main/daw/diw/04i.html)]{.solution}

Comprueba el uso de [box-sizing]{.verbatim} y la diferencia entre configurarlo como [content-box]{.verbatim} o [border-box]{.verbatim}. Interioriza la diferencia y piensa cuál usarías en un proyecto real.
:::


### Modificar a [box-sizing:border-box]{.verbatim} en toda la página {#aplicar-border-box-página}

Si queremos hacer uso de [box-sizing: border-box]{.verbatim} en nuestra página web, y aplicarlo a todo sin tener que ir elemento a elemento, podemos usar la siguiente regla al comienzo de nuestro CSS:

::: mycode
[Aplicar border-box a todo]{.title}
```css
*,
*::before,
*::after {
    box-sizing: border-box;
}
```
:::

De esta forma, todos los elementos utilizan el mismo modelo de caja. Actualmente es una práctica muy recomendada porque facilita enormemente el cálculo de dimensiones.

::: infobox
Hoy en día se recomienda [box-sizing: border-box]{.verbatim} como decisión de diseño inicial.
:::

::: errorbox
Es importante conocer el comportamiento por defecto, ya que si se decide cambiar después, supondría tener que volver a redimensionar todos los componentes que hayamos hecho.
:::



## Elementos de bloque y elementos en línea {#elementos-bloque-línea}

El modelo de caja afecta a todos los elementos, aunque no todos se comportan igual. Los elementos pueden ser de **bloque** o elementos **en línea**, pero **nunca los dos a la vez**.


### Elementos de bloque {#elementos-bloque}

Los elementos de bloque tienen las siguientes características:

- Ocupan todo el ancho disponible.
- Comienzan en una línea nueva.
- Admiten anchura y altura.

En la siguiente tabla están todos los elementos de tipo bloque (fuente: [w3schools](https://www.w3schools.com/htmL/html_blocks.asp)):

|    |    |    |    |    |    |
|:---|:---|:---|:---|:---|:---|
| [<address>]{.verbatim} | [<article>]{.verbatim} | [<aside>]{.verbatim} | [<blockquote>]{.verbatim} | [<canvas>]{.verbatim} | [<dd>]{.verbatim} | 
| [<div>]{.verbatim} | [<dl>]{.verbatim} | [<dt>]{.verbatim} | [<fieldset>]{.verbatim} | [<figcaption>]{.verbatim} | [<figure>]{.verbatim} | 
| [<footer>]{.verbatim} | [<form>]{.verbatim} | [<h1>]{.verbatim} |-[<h6>]{.verbatim} | [<header>]{.verbatim} | [<hr>]{.verbatim} | [<li>]{.verbatim} | 
| [<main>]{.verbatim} | [<nav>]{.verbatim} | [<noscript>]{.verbatim} | [<ol>]{.verbatim} | [<p>]{.verbatim} | [<pre>]{.verbatim} |
| [<section>]{.verbatim} | [<table>]{.verbatim} | [<tfoot>]{.verbatim} | [<ul>]{.verbatim} | [<video>]{.verbatim} |

Table: {tablename=tblr}

### Elementos en línea {#elementos-en-línea}

Los elementos en línea tienen las siguientes características:

- Ocupan únicamente el espacio de su contenido.
- No comienzan una línea nueva.
- Su comportamiento respecto a anchura y altura es diferente.


En la siguiente tabla están todos los elementos de tipo bloque (fuente: [w3schools](https://www.w3schools.com/htmL/html_blocks.asp)):

|    |    |    |    |    |    |
|:---|:---|:---|:---|:---|:---|
| [<a>]{.verbatim} | [<abbr>]{.verbatim} | [<b>]{.verbatim} | [<bdo>]{.verbatim} | [<br>]{.verbatim} | [<button>]{.verbatim} | 
| [<cite>]{.verbatim} | [<code>]{.verbatim} | [<dfn>]{.verbatim} | [<em>]{.verbatim} | [<i>]{.verbatim} | [<img>]{.verbatim} |
| [<input>]{.verbatim} | [<kbd>]{.verbatim} | [<label>]{.verbatim} | [<map>]{.verbatim} | [<object>]{.verbatim} | [<output>]{.verbatim} |
| [<q>]{.verbatim} | [<samp>]{.verbatim} | [<script>]{.verbatim} | [<select>]{.verbatim} | [<small>]{.verbatim} | [<span>]{.verbatim} |
| [<strong>]{.verbatim} | [<sub>]{.verbatim} | [<sup>]{.verbatim} | [<textarea>]{.verbatim} | [<time>]{.verbatim} | [<var>]{.verbatim} |

Table: {tablename=tblr colspec=XXXXXX}

Más adelante estudiaremos la propiedad [[display]{.verbatim}](#display), que permite modificar este comportamiento.


# Dimensiones {#dimensiones}

Las dimensiones permiten controlar el tamaño de los elementos HTML. CSS proporciona propiedades para definir el ancho, la altura, así como límites mínimos y máximos que hacen posible crear interfaces adaptables a diferentes dispositivos.

Las siguientes propiedades forman parte del **modelo de caja** y son fundamentales para construir cualquier diseño web:

- [width]{.verbatim}: ancho del área de elemento.
- [min-width]{.verbatim}: ancho mínimo del elemento.
- [max-width]{.verbatim}: ancho máximo del elemento.
- [height]{.verbatim}: altura del elemento.
- [min-height]{.verbatim}: altura mínima del elemento.
- [max-height]{.verbatim}: altura máxima del elemento.
- [box-sizing]{.verbatim}: qué tipo de "modelo de caja" usar para el cálculo de dimensiones.


## Dimensiones por zona {#dimensiones-por-zonas}

A continuación vamos a ver distintas propiedades para modificar las dimensiones de las cajas del *box model* de HTML. Las propiedades se pueden diferenciar entre:

- **Propiedad general**: el nombre no indica a qué zona afecta, y por tanto modificará todas las áreas.
- **Propiedad específica**: indica qué zona va a modificar, y sólo afectará a esa zona.


### Propiedad general: todas las zonas {#propiedad-general-todas}

Son las propiedades que afectan a todas las áreas del *box model*: arriba, derecha, abajo e izquierda. Por lo tanto, si tenemos el siguiente ejemplo:

::: mycode
[Padding]{.title}
```css
.caja {
    padding: 30px;
}
```
:::

Indica que nuestra caja tiene [30px]{.verbatim} de [padding]{.verbatim} en cada área: **arriba, derecha, abajo e izquierda**. Podemos utilizar las propiedades generales para especificar que sólo queremos afectar a ciertas áreas, y eso depende de cuántos parámetros pasemos:

:::::::::::::: {.columns columnsep=0.25cm}
::: {.column width="40%"}

::: {.mycode size="footnotesize"}
[¿a qué área afecta?]{.title}
```css
.a { padding: 2px; }
.b { padding: 2px 4px; }
.c { padding: 2px 4px 6px; }
.d { padding: 1px 2px 3px 4px;}
```
:::

:::
::: {.column width="60%" }

- **1 valor**: indicamos todas las áreas.
- **2 valores**: primer valor es [top]{.verbatim} y [bottom]{.verbatim}, el segundo para [right]{.verbatim} y [left]{.verbatim}.
- **3 valores**: [top]{.verbatim}, [right]{.verbatim} y [left]{.verbatim}, último valor es [bottom]{.verbatim}.
- **4 valores**: [top]{.verbatim}, [right]{.verbatim}, [bottom]{.verbatim} y [down]{.verbatim}

:::
::::::::::::::


Esto afecta a propiedades como [padding]{.verbatim}, [border-width]{.verbatim} y [margin]{.verbatim}.

::: infobox
Es importante conocer este orden ya que se repite en varias propiedades generales que veremos a continuación.
:::


### Propiedad específica: sólo afecta a una zona {#propiedad-específica}

Para muchas propiedades que veremos a continuación existen propiedades específicas que sólo afectan al área correspondiente. Por ejemplo:

- [padding-top]{.verbatim}: sólo añade padding a la parte superior.
- [border-right]{.verbatim}: para configurar sólo el borde del lado derecho.
- [margin-bottom]{.verbatim}: sólo añade margen en la parte inferior.


De esta manera, con el nombre de la propiedad ya se especifica claramente a qué zona afecta.


## La propiedad [width]{.verbatim} {#anchura-width}

La propiedad [width]{.verbatim} establece el **ancho del área de contenido** de un elemento.


::: mycode
[Anchura]{.title}
```css
.caja {
    width: 300px;
}
```
:::

El contenido tendrá un ancho de [300px]{.verbatim}. Es importante recordar que, por defecto, el [padding]{.verbatim} y el [border]{.verbatim} **no están incluidos** dentro de ese ancho. Este comportamiento se estudiará más adelante con [box-sizing]{.verbatim}.

### Ancho relativo {#ancho-relativo}

Los porcentajes permiten crear elementos adaptables.

::: mycode
[Padding con anchura relativa]{.title}
```css
.contenedor { width: 80%; }
```
:::

El ancho dependerá del tamaño del elemento contenedor. Si el contenedor mide [1000px]{.verbatim}, el elemento ocupará aproximadamente [800px]{.verbatim}. Si posteriormente mide [600px]{.verbatim}, el ancho pasará a ser aproximadamente [480px]{.verbatim}.



## Propiedad [min-width]{.verbatim} {#min-width}

La propiedad [min-width]{.verbatim} establece el **ancho mínimo** que puede tener un elemento.

::: mycode
[Anchura y asegurar ancho mínimo]{.title}
```css
.caja {
    width: 50%;
    min-width: 250px;
}
```
:::

El elemento intentará ocupar el [50%]{.verbatim} pero nunca será inferior a [250px]{.verbatim}. Esta propiedad resulta muy útil en diseños responsive.


## Propiedad [max-width]{.verbatim} {#max-width}

[max-width]{.verbatim} establece el **ancho máximo** permitido.

::: mycode
[Anchura y asegurar ancho máximo]{.title}
```css
.caja {
    width: 90%;
    max-width: 1200px;
}
```
:::

Este patrón es extremadamente habitual. Por defecto, en pantallas pequeñas ocupará el [90%]{.verbatim}, mientras que en pantallas grandes nunca superará los [1200px]{.verbatim}. De esta forma evitamos que el contenido resulte excesivamente ancho.


## La propiedad [height]{.verbatim} {#altura-height}

[height]{.verbatim} define la **altura del área de contenido**.


::: mycode
[Altura]{.title}
```css
.caja { height: 200px; }
```
:::

El contenido dispondrá de una altura de [200px]{.verbatim}. Si el contenido ocupa más espacio del disponible, puede producirse un desbordamiento, que estudiaremos en el siguiente apartado.

Un porcentaje en [height]{.verbatim} solo funciona correctamente cuando el elemento padre tiene una altura definida. Si el elemento padre no tiene altura definida, el porcentaje puede no producir el resultado esperado.

## Propiedad [min-height]{.verbatim} {#min-height}

La propiedad [min-height]{.verbatim} establece una altura mínima.

::: mycode
[Altura]{.title}
```css
.caja { min-height: 200px; }
```
:::

Aunque el contenido sea muy pequeño, la caja tendrá al menos [200px]{.verbatim} de altura. Si el contenido crece, el elemento también crecerá.

::: infobox
Es recomendable usar [min-height]{.verbatim} antes que una altura fija cuando el contenido puede crecer.
:::


## Propiedad [max-height]{.verbatim} {#max-height}

[max-height]{.verbatim} limita la altura máxima.

::: mycode
[Máxima altura]{.title}
```css
.caja { max-height: 400px; }
```
:::

Si el contenido supera ese tamaño, podrá producirse un desbordamiento dependiendo de la propiedad [overflow]{.verbatim}. Esta combinación es muy frecuente en paneles laterales y listas con desplazamiento.


# Overflow / desbordamiento {#overflow}

En ocasiones, el contenido de un elemento ocupa más espacio del disponible. Esto puede ocurrir porque el texto es demasiado largo, una imagen es muy grande o hemos establecido unas dimensiones fijas demasiado pequeñas.

La propiedad [overflow]{.verbatim} controla qué debe hacer el navegador cuando el contenido **desborda** los límites del elemento. Es una propiedad muy utilizada en paneles, tarjetas, menús, ventanas modales y contenedores con desplazamiento.


Supongamos una caja con un alto fijo como el siguiente ejemplo:

::: mycode
[Caja]{.title}
```css
.caja {
    width: 100px;
    height: 100px;
    border: 2px solid black;
}
```
:::

Si introducimos un texto muy largo, el contenido puede superar la altura disponible, lo que se denomina **overflow** o **desbordamiento**. El navegador debe decidir qué hacer con ese contenido, y para ello utilizamos la propiedad [overflow]{.verbatim}, que podemos configurar con una de las siguientes opciones:

- [auto]{.verbatim}: Las barras aparecen solo cuando son necesarias.
- [hidden]{.verbatim}: El contenido sobrante se oculta.
- [scroll]{.verbatim}: Siempre aparecen barras de desplazamiento.
- [visible]{.verbatim}: El contenido sobresale del elemento.

Una vez decidido qué configuración debemos hacer, la añadimos al CSS:

::: mycode
[Caja con overflow]{.title}
```css
.caja {
    width: 100px;
    height: 100px;
    border: 2px solid black;
    overflow: auto;
}
```
:::


![[overflow]{.verbatim} como: [auto]{.verbatim}, [hidden]{.verbatim}, [scroll]{.verbatim} y [visible]{.verbatim}](img/diw/overflow.png){width=70%}


## Control independiente de cada eje {#control-independiente-eje}

A la hora de controlar el desbordamiento, podemos controlarlo de manera separada para el eje horizontal y el vertical. Para ello están las propiedades

- [overflow-x]{.verbatim}: para el eje horizontal.
- [overflow-y]{.verbatim}: para el eje vertical.


::: exercisebox
[[04j](https://github.com/yuki/ejercicios/blob/main/daw/diw/04j.html) y [04k](https://github.com/yuki/ejercicios/blob/main/daw/diw/04k.html)]{.solution}

Usa [overflow]{.verbatim} y sus variantes junto con las propiedades de anchura y altura vistas anteriormente.
:::


# *Padding* {#padding}

El ***padding*** es el espacio **interior** que existe entre el contenido de un elemento y su borde. Forma parte del **modelo de caja (Box Model)** y se utiliza para crear separación interna, mejorar la legibilidad y aumentar el área útil de elementos como botones, tarjetas o formularios.

Vamos a recordar la imagen puesta previamente, ya que es importante diferenciarlo del margen:

:::::::::::::: {.columns }
::: {.column width="33%"}
![Modelo caja en [MDN](https://developer.mozilla.org/en-US/docs/Web/CSS/Guides/Box_model)](img/diw/caja.png){width=100%}
:::
::: {.column width="33%" }
![Modelo caja Chrome](img/diw/caja-chrome.png){width=100%}
:::
::: {.column width="33%" }
![Modelo caja Firefox](img/diw/caja-firefox.png){width=100%}
:::
::::::::::::::

Recordamos que:

- **Padding**: espacio interior entre el contenido y el borde.
- **Margin**: espacio exterior entre elementos.

Por lo tanto, podemos hacer el siguiente ejemplo:


::: mycode
[Padding]{.title}
```css
.caja {
    padding: 20px;
}
```
:::

El contenido quedará separado 20px del borde por todos sus lados. Tal como hemos visto anteriormente, *padding* tiene una propiedad para cada lado de la caja con [padding-top]{.verbatim}, [padding-right]{.verbatim}, [padding-bottom]{.verbatim} y [padding-left]{.verbatim}.

En el caso de añadir color de fondo **sí cubre el padding** y llegará hasta el borde.


## Uso de *padding* en botones {#padding-botones}

Uno de los usos más habituales del padding es aumentar el área de pulsación de un botón. Aunque el texto sea pequeño, el botón tendrá una superficie mucho más cómoda para el usuario. Este patrón aparece prácticamente en cualquier interfaz moderna.

::: exercisebox
[[04h](https://github.com/yuki/ejercicios/blob/main/daw/diw/04h.html)]{.solution}

Crea distintos elementos añadiendo *padding*. Modifica un botón para añadir un *padding* personalizado y así darle más área de pulsación. Compara cómo afecta el *padding* respecto al margen del ejeercicio anterior.
:::



# Bordes {#bordes}

Los bordes permiten delimitar visualmente los elementos de una página web. CSS ofrece un conjunto de propiedades para controlar su grosor, estilo, color y forma.

Los bordes son uno de los componentes fundamentales del **modelo de caja (*Box Model*)** y se utilizan constantemente para crear botones, tarjetas, formularios, tablas y otros elementos de la interfaz.


## La propiedad [border]{.verbatim} {#propiedad-border}

La forma más sencilla de crear un borde consiste en utilizar la propiedad abreviada [border]{.verbatim}, a la que se le pasan tres parámetros:

- **Grosor del borde**: Se puede añadir con una unidad de medida o con palabras clave como [thin]{.verbatim}, [medium]{.verbatim}, [thick]{.verbatim}.
- **Estilo de línea**: hay distintas palabras claves que indican el tipo de borde:
  - [none]{.verbatim}: Sin borde.
  - [solid]{.verbatim}: Línea continua.
  - [dashed]{.verbatim}: Línea discontinua.
  - [dotted]{.verbatim}:  Línea de puntos.
  - [double]{.verbatim}: Línea doble.
  - [groove]{.verbatim}:  Efecto tridimensional hundido.
  - [ridge]{.verbatim}:  Efecto tridimensional elevado.
  - [inset]{.verbatim}: Aspecto interior.
  - [outset]{.verbatim}: Aspecto exterior.
- **Color del borde**.

En el siguiente ejemplo se puede ver el código en una única propiedad o separado cada parámetro en su propiedad:


:::::::::::::: {.columns }
::: {.column width="50%"}

::: mycode
[Propiedad [border]{.verbatim}]{.title}
```css
p { 
    border: 2px solid black;
}
```
:::

:::
::: {.column width="50%" }

::: mycode
[Propiedad [border]{.verbatim}]{.title}
```css
p {
    border-width: 2px;
    border-style: solid;
    border-color: black;
}
```
:::

:::
::::::::::::::

La propiedad [border-width]{.verbatim} es una propiedad "general" que acepta de uno a cuatro parámetros para las distintas zonas, tal como se ha explicado anteriormente.

::: exercisebox
[[04e](https://github.com/yuki/ejercicios/blob/main/daw/diw/04e.html)]{.solution}

Crea distintos bordes con distintos grosores, estilos y colores.
:::


## Bordes diferentes en cada lado {#bordes-diferentes}

CSS permite configurar cada lado del borde de forma independiente con las propiedades [border-top]{.verbatim}, [border-right]{.verbatim}, [border-bottom]{.verbatim} y [border-left]{.verbatim}.

Funcionan igual que [border]{.verbatim}, por lo que podemos asignar a cada lado un grosor, estilo y color distintos.

Y si queremos asignar cada característica concreta por separado, tenemos propiedades separadas como:

- [border-top-width]{.verbatim}
- [border-right-style]{.verbatim}
- [border-bottom-color]{.verbatim}

Y así para cada lado de la caja y propiedad.


## Bordes redondeados con [border-radius]{.verbatim} {#border-radius}

Una de las propiedades más utilizadas es [border-radius]{.verbatim}, que permite redondear las esquinas.

:::::::::::::: {.columns }
::: {.column width="50%"}

::: mycode
[Propiedad [border-radius]{.verbatim}]{.title}
```css
.a { border-radius: 5px; }
.b { border-radius: 1rem; }
.c { border-radius: 50%; }
```
:::

:::
::: {.column width="50%" }

::: mycode
[Círculo perfecto]{.title}
```css
.avatar {
    width: 120px;
    height: 120px;
    border-radius: 50%;
}
```
:::


:::
::::::::::::::

Cada esquina puede configurarse de forma independiente a través de las propiedades específicas:

- [border-top-left-radius]{.verbatim}
- [border-top-right-radius]{.verbatim}
- [border-bottom-right-radius]{.verbatim}
- [border-bottom-left-radius]{.verbatim}


## Bordes elípticos {#bordes-elípticos}

[border-radius]{.verbatim} también permite definir radios horizontales y verticales diferentes.

::: mycode
[Borde elíptico]{.title}
```css
.caja {
    border-radius: 50px / 20px;
}
```
:::

Esto genera esquinas con forma elíptica en lugar de circular. Aunque es una característica interesante, en la mayoría de los diseños se utilizan radios iguales. Para entender bien los bordes elípticos podemos ver cómo funcionan en la web [border-radius generator](https://developer.mozilla.org/en-US/docs/Web/CSS/Guides/Backgrounds_and_borders/Border-radius_generator) de MDN.

::: exercisebox
[[04f](https://github.com/yuki/ejercicios/blob/main/daw/diw/04f.html)]{.solution}

Crea bordes distintos para cada lado de la caja. Crea otros bordes con borde redondeados, elípticos y de distintos tamaños
:::



<!-- 
TODO: 
añadir border-image ?
outline?
foco en formulario?
bordes en tablas?
 -->


# Márgenes {#márgenes}

Los márgenes son el espacio **exterior** que existe alrededor de un elemento, después del borde. Permiten separar unos elementos de otros y son una de las partes fundamentales del **modelo de caja (*[box model](https://developer.mozilla.org/en-US/docs/Web/CSS/Guides/Box_model)*)**. Recordamos una vez más:

- **Padding**: espacio interior entre el contenido y el borde.
- **Margin**: espacio exterior entre elementos.

La forma más sencilla de establecer márgenes es mediante la propiedad [margin]{.verbatim}:

::: mycode
[Margen de 20px]{.title}
```css
.caja {
    margin: 20px;
}
```
:::

Cada zona también tiene una propiedad específica: [margin-top]{.verbatim}, [margin-right]{.verbatim}, [margin-bottom]{.verbatim} y [margin-left]{.verbatim}.

Podemos indicar los distintos tipos de unidades que ya hemos visto previamente:

::: mycode
[Margen de 20px]{.title}
```css
.caja {
    margin: 1em 20px 2rem 5%;
}
```
:::

Si usamos porcentaje para el margen, hará que dependa del tamaño de la ventana, lo que puede ser útil en diseños *responsive*.

Podemos añadir márgenes negativos, lo que hará que el contenido se desplace hacia el lado contrario al "natural". Los márgenes negativos son una herramienta potente, pero deben utilizarse con moderación porque pueden provocar solapamientos difíciles de mantener.

::: errorbox
Cuidado al usar márgenes negativos, puede provocar solapamientos no deseados.
:::


## [margin: auto]{.verbatim} {#margin-auto}

El valor especial [auto]{.verbatim} permite que el navegador calcule automáticamente el margen. El caso más conocido es el centrado horizontal.

::: mycode
[Margen auto]{.title}
```css
.caja {
    margin: auto;
}
```
:::

Es importante darse cuenta que si sólo indicamos [auto]{.verbatim} desaparece automáticamente el margen superior e inferior


<!-- 

TODO: poner esto o luego?
## 3.11.12 Márgenes automáticos en Flexbox

En diseños modernos también es frecuente utilizar `auto` dentro de Flexbox.

Por ejemplo:

```css
.menu {
    display: flex;
}

.login {
    margin-left: auto;
}
```

El margen izquierdo ocupa todo el espacio libre y desplaza el elemento hacia la derecha.

Esta técnica se estudiará con más detalle en la unidad dedicada a Flexbox.

---

 -->


## Márgenes y fondo {#márgenes-fondo}

Una característica importante es que el color de fondo **no se extiende al margen**.

Por ejemplo:

::: mycode
[Margen y fondo]{.title}
```css
.caja {
    margin: 20px;
    background-color: lightblue;
    border: 1px solid black;
}
```
:::

El color azul solo ocupa hasta llegar al borde. Todo lo que va después, que es el margen, no tendrá ese color de fondo.

::: errorbox
Es importante entender hasta dónde llega el contenido de la caja, y el color de fondo no sobrepasa el borde.
:::

## Colapso de márgenes {#colapso-márgenes}

Una característica exclusiva de los **márgenes verticales** es el **colapso de márgenes** (*margin collapsing*). 

::: questionbox
Supón Bloque A y B, ambos seguidos verticalmente. El A tiene [margin-bottom=20px]{.verbatim}, el B [margin-top=30px]{.verbatim}. ¿Cuál es la separación vertical entre ambos?
:::


La lógica supondría pensar en 50px, pero no, ya que los **márgenes verticales adyacentes** colapsan y se utiliza el mayor de ellos, en este caso, 30px. En la [documentación](https://developer.mozilla.org/en-US/docs/Web/CSS/Guides/Box_model/Margin_collapsing) se explican todos los casos.

También hay que tener en cuenta  el colapso no se produce en todos los casos. Por ejemplo:

- Márgenes horizontales.
- Elementos Flexbox.
- Elementos Grid.
- Elementos con posicionamiento especial.
- Elementos separados por padding o borde.

Por ello, en diseños modernos basados en Flexbox o Grid este comportamiento aparece con mucha menos frecuencia.


::: exercisebox
[[04g](https://github.com/yuki/ejercicios/blob/main/daw/diw/04g.html)]{.solution}

Crea distintos elementos añadiendo márgenes. Comprueba qué sucede al ponerlo como [auto]{.verbatim}, diferencia entre márgenes verticales y horizontales, y comprueba el colapso vertical de elementos adyacentes.
:::


