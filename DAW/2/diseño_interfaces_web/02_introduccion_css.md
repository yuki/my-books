
# Historia de CSS {#historia-css}

En los primeros años de la World Wide Web, las páginas web eran muy diferentes a las actuales. Su objetivo principal era compartir información y documentos entre investigadores, por lo que el aspecto visual tenía una importancia secundaria.


## El problema de HTML {#problema-html}

HTML nació como un lenguaje para describir la estructura de un documento, no su apariencia, por lo que se podía definir el contenido mediante títulos, párrafos, listas y enlaces, pero apenas ofrecía opciones para controlar la presentación del documento. Esto provocaba que la mayoría de las páginas tuvieran un aspecto muy similar: fondo gris, texto negro, enlaces azules y una distribución muy sencilla.

A medida que Internet comenzó a popularizarse, empresas y organizaciones quisieron crear páginas con un aspecto más atractivo y diferenciado. Sin embargo, HTML no había sido diseñado para ello. No existía ningún mecanismo para definir aspectos como:

- Colores.
- Márgenes.
- Tipografías.
- Espaciados.
- Posición de los elementos.

## La llegada de etiquetas de presentación

Como los diseñadores querían controlar el aspecto de las páginas, los navegadores comenzaron a incorporar etiquetas HTML relacionadas con la presentación como por ejemplo: [<font>]{.verbatim}, [<center>]{.verbatim}, [<big>]{.verbatim} ...

Estas etiquetas solucionaban parcialmente el problema, pero generaban otros nuevos, como que si queríamos añadir el tipo de fuente se lo teníamos que especificar a todos los textos. Aparte, se mezclaba el contenido con la presentación, el mantenimiento era costoso y cada navegador interpretaba algunas etiquetas de forma distinta, o no las interpretaba directamente.

## El nacimiento de CSS {#nacimiento-css}

Para solucionar estos problemas, en 1994 el informático noruego [Håkon Wium Lie](https://en.wikipedia.org/wiki/H%C3%A5kon_Wium_Lie) propuso un nuevo lenguaje denominado ***Cascading Style Sheets***, más conocido por sus siglas **CSS**. Su propuesta consistía en separar completamente dos aspectos diferentes:

- **HTML** describiría el contenido y la estructura.
- **CSS** definiría únicamente la apariencia.

La idea fue muy bien recibida y, junto con otros colaboradores como [Bert Bos](https://en.wikipedia.org/wiki/Bert_Bos), evolucionó hasta convertirse en un estándar del W3C, y en diciembre de 1996 se publicó la primera recomendación oficial: **CSS Level 1 (CSS1)**. Permitía modificar aspectos como:

- Colores.
- Tipografías.
- Márgenes.
- Sangrías.
- Alineación del texto.
- Fondos.

## CSS2 {#css2}

En 1998 apareció **CSS2**, incorporando numerosas mejoras. Entre ellas destacaban:

- Posicionamiento absoluto.
- Posicionamiento relativo.
- Tipos de medios (pantalla, impresión...).
- Capas.
- Nuevos selectores.
- Tablas más completas.

Gracias a CSS2 comenzaron a desarrollarse diseños mucho más complejos. Sin embargo, los navegadores todavía presentaban importantes diferencias en su implementación. Durante muchos años era habitual que una página funcionara correctamente en un navegador y mostrara errores en otro.


## CSS3: una nueva forma de evolucionar {#css3}

En lugar de crear una única especificación enorme, el W3C decidió dividir CSS en pequeños módulos independientes. Aunque popularmente hablamos de **CSS3**, en realidad no existe un documento oficial llamado "CSS3". Actualmente CSS está formado por numerosos módulos, cada uno con su propio ritmo de desarrollo. Algunos ejemplos son:

- Selectores.
- Fondos y bordes.
- Animaciones.
- Transiciones.
- Flexbox.
- Grid Layout.
- Variables CSS.
- Media Queries.

Este sistema permite incorporar nuevas funcionalidades sin esperar años para publicar una nueva versión completa.

## El nacimiento de los preprocesadores CSS {#preprocesadores-css}

Para resolver estas limitaciones aparecieron los llamados **preprocesadores CSS**. Un preprocesador permite escribir en un lenguaje más potente y cómodo que posteriormente se transforma automáticamente en CSS estándar. Los dos preprocesadores más conocidos son:

- [SASS](https://en.wikipedia.org/wiki/Sass_(style_sheet_language)): nace en 2006 y permite crear variables, anidamiento, sistema de *mixins* (podría definirse como funciones) para no tener que repetir código, herencia, bucles ... 
- [LESS](https://es.wikipedia.org/wiki/LESS_(lenguaje_de_hojas_de_estilo)): nace en 2009 inspirado por SASS y la ventaja es que mediante JavaScript permite ejecutarse en el navegador sin tener que preprocesarse previamente.

Hasta hace unos años prácticamente todos los grandes proyectos utilizaban SASS o LESS internamente, ya que permitían:

- Reducir la repetición de código.
- Organizar grandes proyectos.
- Reutilizar componentes.
- Facilitar el mantenimiento.
- Trabajar en equipo.
- Automatizar tareas.

En aquella época CSS todavía no disponía de muchas de estas características.

Con el paso del tiempo CSS ha ido incorporando muchas funciones como variables, nuevos selectores, algunas funciones matemáticas, ... Como consecuencia, muchos proyectos pequeños y medianos ya pueden desarrollarse utilizando únicamente CSS.

Sin embargo, SASS sigue siendo muy utilizado en proyectos grandes porque continúa ofreciendo ventajas relacionadas con la organización del código y la reutilización de estilos.


## CSS en la actualidad {#css-actualidad}

Hoy en día CSS es un lenguaje extremadamente potente y en continua evolución en el que participan distintas empresas para proponer nuevas características para ser añadidas.


# Añadir CSS en una página HTML {#añadir-css-pagina-html}

Para que una página HTML pueda utilizar una hoja de estilos, es necesario indicar al navegador dónde se encuentra el archivo CSS. La forma más habitual consiste en utilizar el elemento [<link>]{.verbatim} dentro de la sección [<head>]{.verbatim} del documento HTML.

::: mycode
[Añadir CSS en un HTML]{.title}

```html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Mi primera página con CSS</title>
    <link rel="stylesheet" href="css/estilos.css">
</head>
<body>
    <h1>Hola mundo</h1>
</body>
</html>
```
:::

En este ejemplo el navegador carga el archivo [estilos.css]{.configfile} situado dentro de la carpeta [css]{.configdir}, **antes de mostrar la página**. El atributo [rel="stylesheet"]{.verbatim} indica que el archivo enlazado es una hoja de estilos, mientras que [href]{.verbatim} especifica la ruta del archivo CSS.


## Incorporar varias hojas de estilo {#añadir-varias-hojas}

En proyectos reales es muy habitual dividir el código CSS en varios archivos para facilitar su mantenimiento. En ese caso el navegador descargará y aplicará todas las hojas de estilo en el orden en el que aparecen. Cuando varias hojas de estilo modifican la misma propiedad de un mismo elemento, **el orden en el que se cargan puede afectar al resultado final**.

::: mycode
[Añadir varios CSS en un HTML]{.title}

```html
<head>
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/estilos.css">
    <link rel="stylesheet" href="css/titulos.css">
</head>
```
:::

 Siguiendo con el ejemplo anterior, supongamos que contienen el siguiente código:

:::::::::::::: {.columns }
::: {.column width="50%"}

::: mycode
[estilos.css]{.title}
```css
h1 {
    color: blue;
}
```
:::

:::
::: {.column width="50%" }

::: mycode
[titulos.css]{.title}
```css
h1 {
    color: red;
}
```
:::

:::
::::::::::::::


El color final del título será **rojo**, ya que la segunda hoja de estilos sobrescribe la primera. Este comportamiento forma parte del mecanismo conocido como **[cascada](#cascada)** (*cascade*), que estudiaremos con detalle más adelante.

::: errorbox
El orden de carga de los ficheros es importante.
:::

No existe un número fijo de archivos CSS que deba tener un proyecto. En aplicaciones pequeñas suele ser suficiente con una única hoja de estilos, pero a medida que el proyecto crece, resulta habitual dividir el código en varios archivos según su función.

::: exercisebox
[[01](https://github.com/yuki/ejercicios/blob/main/daw/diw/01.html)]{.solution}

Carga dos ficheros CSS y comprueba la importancia del orden tal como aparece en el ejercicio anterior.
:::


## CSS interno {#css-interno}

Se puede escribir estilos CSS dentro de una página HTML directamente usando las etiquetas [<style>]{.verbatim} y tiene que estar dentro de la cabecera [<head>]{.verbatim}.

::: mycode
[HTML+CSS inline]{.title}

```html
<html>
  <head>
    <style>
      body {
        background-color: linen;
      }  
      h1 {
        color: maroon;
        margin-left: 40px;
      }
    </style>
  </head>
  <body>
    <!-- ... -->
  </body>
</html>
```
:::

::: errorbox
No se recomienda usar CSS interno dentro de un HTML.
:::

Existen sistemas para generar HTML unificado (para generar HTML auto-contenidos) para generar webs estáticas, pero durante el desarrollo **no se debe usar CSS dentro del HTML**.


## Estilos CSS *inline* {#estilos-css-inline}

Se puede utilizar estilos CSS dentro del código HTML, lo que se denominan estilos *inline*. Esta técnica era muy utilizada al inicio de la web, pero **no es recomendable usarla** ya que va en contra de la reutilización de los estilos CSS.

También va en contra de la separación entre maquetación y estilos, lo que puede dificultar la reutilización de componentes en distintos apartados de una misma aplicación. En el siguiente ejemplo se ve un ejemplo de estilo *inline* y cómo sería con HTML y CSS separado:

:::::::::::::: {.columns columnsep=0.5cm}
::: {.column width="33%"}

::: mycode
[HTML+CSS inline]{.title}

```html
<p style="
 color: red;
 font-style: italic;
">
    Texto
</p>
```
:::

:::
::: {.column width="33%" }

::: mycode
[HTML]{.title}
```html
<p class="special">
    Texto
</p>
```
:::

:::
::: {.column width="33%" }

::: mycode
[css]{.title}
```css
.scpecial {
  color: red;
  font-style: italic;
}
```
:::

:::
::::::::::::::

En el primer ejemplo, si quisiésemos otro [p]{.verbatim} con el mismo estilo, habría que volver a escribir dicho estilo, mientras que con la separación sólo sería necesario poner la clase. Si en el primer ejemplo queremos añadir un nuevo estilo, habría que modificarlo en varios sitios, mientras que con la separación sólo sería necesario hacerlo en la hoja CSS.

::: errorbox
No se recomienda usar estilos *inline*.
:::


## Ejemplos de la importancia de CSS {#ejemplos-importancia-css}

Las hojas de estilo CSS nos permiten hacer que una página web se vea completamente diferente cambiando dicha hoja de estilo. Imaginemos una empresa que tiene un producto de tienda online para varios clientes. 

- Los estilos CSS están *inline*, modificar los estilos para cada cliente supondría:
  - Copiar todo el código fuente.
  - Modificar los estilos *inline*.
  - Si queremos añadir una nueva feature, habría que modificarlo en cada cliente.
  - Volver a modificar los estilos *inline*.
- Los estilos CSS están separados de HTML:
  - Se hace una copia del CSS para cada cliente y se modifica con estilos propios.
  - Si queremos añadir una nueva feature, se actualiza sólo el HTML en cada cliente.


A continuación un ejemplo del mismo código HTML con distintas hojas de estilo CSS. Ejemplos obtenidos de [W3Schools](https://www.w3schools.com/css/css_intro.asp).

:::::::::::::: {.columns columnsep=0.5cm}
::: {.column width="50%"}

![Sin estilo](img/diw/ejemplo-1.png){width=100% framed=true}

:::
::: {.column width="50%" }

![Ejemplo 1](img/diw/ejemplo-2.png){width=100% framed=true}


:::
::::::::::::::

:::::::::::::: {.columns columnsep=0.5cm}
::: {.column width="50%"}

![Ejemplo 2](img/diw/ejemplo-3.png){width=100% framed=true}

:::
::: {.column width="50%" }

![Ejemplo 3](img/diw/ejemplo-4.png){width=100% framed=true}


:::
::::::::::::::



# Sintaxis de CSS {#sintaxis-css}

CSS posee una sintaxis sencilla y relativamente fácil de aprender. A diferencia de otros lenguajes de programación, CSS no contiene estructuras de control como bucles o condicionales (aunque sí dispone de funciones y reglas avanzadas que estudiaremos más adelante). Su función principal consiste en indicar **cómo deben mostrarse los elementos HTML**.

## Regla CSS {#regla-css}

Una hoja de estilos está formada por un conjunto de **reglas CSS**. Cada regla indica:

- Qué elementos deben modificarse.
- Qué propiedades deben cambiar.
- Qué valor debe asignarse a cada propiedad.

La estructura general es la siguiente:

:::::::::::::: {.columns }
::: {.column width="50%"}

::: mycode
[Definiciones]{.title}
```css
selector {
    propiedad: valor;
}
```
:::

:::
::: {.column width="50%" }

::: mycode
[Ejemplo real]{.title}
```css
h1 {
    color: red;
}
```
:::

:::
::::::::::::::

Esta regla indica que todos los elementos [<h1>]{.verbatim} deben mostrarse en color rojo.


### El selector {#selector}

El selector indica **qué elementos HTML** se verán afectados por la regla. En la siguiente sólo aparecen unos pocos ejemplos, pero en el [anexo](#etiquetas-html) aparecen todas las etiquetas HTML que se pueden usar como selectores.

| Selector | Función |
|-----------|---------|
| h1 | Encabezados 1 |
| h2 | Encabezados 2 |
| p | Párrafos |
| ul | Lista desordenada |



### Las propiedades {#propiedades}

Las propiedades indican qué aspecto queremos modificar. Existen cientos de propiedades distintas. Algunas de las más utilizadas son:

| Propiedad | Función |
|-----------|---------|
| [color]{.verbatim} | Color del texto |
| [background-color]{.verbatim} | Color de fondo |
| [font-size]{.verbatim} | Tamaño del texto |
| [font-family]{.verbatim} | Tipografía |
| [width]{.verbatim} | Anchura |
| [height]{.verbatim} | Altura |
| [margin]{.verbatim} | Margen exterior |
| [padding]{.verbatim} | Espacio interior |
| [border]{.verbatim} | Borde |
| [text-align]{.verbatim} | Alineación del texto |

Cada propiedad únicamente acepta determinados valores, aprenderemos los más importantes.


### Los valores {#valores}

Cada propiedad necesita un valor. Dependiendo de la propiedad, ese valor puede ser:

| Valor | Ejemplo |
|-----------|---------|
| Un color      | [color:red;]{.verbatim} |
| Un número     | [font-size: 20px;]{.verbatim} |
| Una longitud  | [font-size: 2rem;]{.verbatim} |
| Un porcentaje | [width: 80%;]{.verbatim}  |
| Una palabra clave | [display: flex;]{.verbatim} |
| Una función   |  [width: calc(100% - 50px);]{.verbatim} |




## Declaraciones {#declaraciones}

Cada pareja formada por una propiedad y un valor recibe el nombre de **declaración**. Una misma regla puede contener varias declaraciones. En el siguiente ejemplo hay tres:


::: mycode
[Ejemplo real]{.title}
```css
h1 {
    color: blue;
    font-size: 40px;
    text-align: center;
}
```
:::

El conjunto de declaraciones comprendido entre las llaves recibe el nombre de **bloque de declaraciones**.


## Comentarios {#comentarios}

Los comentarios permiten añadir información al código sin que el navegador la interprete. Pueden ser de una única línea o varias:


:::::::::::::: {.columns }
::: {.column width="50%"}

::: mycode
[Comentario]{.title}
```css
/* Estilos generales */
body {
    margin: 0;
}
```
:::

:::
::: {.column width="50%" }

::: mycode
[Comentario multilínea]{.title}
```css
/*
  Curso: DAW
  Fecha: Septiembre de 2026
*/
```
:::

:::
::::::::::::::



## Sensibilidad a mayúsculas y minúsculas {#sensibilidad-mayúsculas-minúsculas}

Tanto los nombre de propiedades como las palabras clave deben escribirse en minúsculas. Aunque algunos navegadores aceptan determinadas variantes, es recomendable seguir siempre las convenciones del lenguaje.



## Espacios en blanco {#espacios-en-blanco}

CSS ignora los espacios en blanco innecesarios. Las siguientes reglas son equivalentes.

:::::::::::::: {.columns columnsep="0.5cm"}
::: {.column width="31%"}

::: mycode
[Ignora espacios]{.title}
```css
h1 {
color:red;
}
```
:::

:::
::: {.column width="31%" }

::: mycode
[Ignora espacios]{.title}
```css
h1 {
  color:red;
}
```
:::

:::
::: {.column width="38%" }

::: mycode
[Ignora espacios]{.title}
```css
h1 {   color:red;     }
```
:::

:::
::::::::::::::

Todas producen exactamente el mismo resultado, pero únicamente la segunda resulta fácil de leer.


## Sangrado (*indentation*) {#indentation}

El sangrado consiste en desplazar ligeramente el código hacia la derecha para mostrar su estructura. Aunque CSS funciona correctamente sin sangrado, utilizar una indentación uniforme mejora enormemente la legibilidad. La mayoría de editores realizan esta tarea automáticamente. Podemos elegir si queremos que sea dos espacios o cuatro.


## El punto y coma {#punto-y-coma}

Cada declaración finaliza mediante un punto y coma **;**. Cuando una regla contiene varias declaraciones, el punto y coma resulta obligatorio.


## ¿Qué ocurre cuando existe un error? {#ocurre-error}

Una característica muy importante de CSS es que los navegadores intentan seguir interpretando la hoja de estilos aunque encuentren errores.

::: mycode
[Ignora espacios]{.title}
```css
h1 {
    color: blue;
    colr: red;
    font-size: 40px;
}
```
:::


En este caso:

- [color: blue;]{.verbatim} se aplicará correctamente.
- [colr: red;]{.verbatim} será ignorado.
- [font-size: 40px;]{.verbatim} volverá a aplicarse normalmente.

Este comportamiento hace que pequeños errores no impidan visualizar la página.


## Orden de las propiedades {#orden-propiedades}

CSS no obliga a escribir las propiedades siguiendo un orden determinado. Los siguientes producen el mismo resultado:

:::::::::::::: {.columns }
::: {.column width="50%" }

::: mycode
[Ignora espacios]{.title}
```css
h1 {
    color: blue;
    margin: 20px;
    font-size: 30px;
}
```
:::

:::
::: {.column width="50%" }

::: mycode
[Ignora espacios]{.title}
```css
h1 {
    font-size: 30px;
    margin: 20px;
    color: blue;
}
```
:::

:::
::::::::::::::


No obstante, en proyectos profesionales suele seguirse un orden para facilitar la lectura.

1. Posicionamiento.
2. Modelo de cajas.
3. Tipografía.
4. Colores.
5. Animaciones.

Mantener siempre el mismo criterio mejora el mantenimiento del código.

::: infobox
En un equipo de desarrollo se debería seguir el mismo formateo, orden e indentación.
:::


# Selectores CSS {#selectores-css}

Una regla CSS necesita indicar sobre qué elementos HTML debe aplicarse. Para ello se utilizan los **selectores**. El selector es la parte de una regla CSS que permite identificar los elementos que queremos modificar.

Los selectores son una de las partes fundamentales de CSS, ya que permiten aplicar diferentes estilos a diferentes elementos de un documento HTML, y se pueden diferenciar en distintos apartados.


## Selector de tipo {#selector-tipo}

El selector de tipo permite seleccionar todos los **elementos HTML de un determinado tipo**.

:::::::::::::: {.columns }
::: {.column width="50%"}

::: mycode
[HTML]{.title}
```html
<p>Primer párrafo.</p>
<p>Segundo párrafo.</p>
<p>Tercer párrafo.</p>
```
:::

:::
::: {.column width="50%" }

::: mycode
[css]{.title}
```css
p {
    color: blue;
}
```
:::

:::
::::::::::::::


Teniendo en cuenta el ejemplo anterior, el CSS selecciona todos los elementos de tipo [<p>]{.verbatim} (párrafo) añadiéndoles el color azul al texto.

Los selectores de tipo son sencillos, pero pueden resultar demasiado generales cuando necesitamos aplicar diferentes estilos a elementos del mismo tipo.


## Selector universal {#selector-universal}

El selector universal se representa mediante un asterisco ([*]{.verbatim}) y selecciona todos los elementos del documento.


::: mycode
[css]{.title}
```css
* {
    margin: 0;
    box-sizing: border-box;
}
```
:::

El selector universal se utiliza frecuentemente para realizar pequeños ajustes generales. Aunque el selector universal es útil, no conviene utilizarlo indiscriminadamente para aplicar muchas propiedades a todos los elementos, ya que puede generar reglas innecesarias y dificultar el mantenimiento.


::: exercisebox
[[02a](https://github.com/yuki/ejercicios/blob/main/daw/diw/02a.html)]{.solution}

Crea un HTML con elementos [h1]{.verbatim} y [p]{.verbatim} y genera un CSS con un selector universal que quite el margen y añada borde a todos los elementos.
:::


## Selector de clase {#selector-clase}

Los selectores de clase permiten aplicar estilos a determinados elementos sin afectar a todos los elementos del mismo tipo. En HTML se utiliza el atributo [class]{.verbatim}.


:::::::::::::: {.columns }
::: {.column width="50%"}

::: mycode
[HTML]{.title}

```html
<h1 class="importante grande">
  Título importante
</h1>

<p class="importante">
  Este texto es importante.
</p>

<p class="grande">
  Este texto es grande.
</p>
```
:::

:::
::: {.column width="50%" }

::: mycode
[css]{.title}
```css
.importante {
  color: red;
}

.grande {
  font-size: 50px;
}
```
:::

:::
::::::::::::::

En CSS, una clase se selecciona utilizando un punto ([.]{.verbatim}) seguido del nombre de la clase. Una clase puede ser utilizada varias veces y en distintos elementos, por lo que debemos tener eso en cuenta, pero más adelante hablaremos de ello.

Por otro lado, el atributo [class]{.verbatim} puede contener varias clases separadas mediante espacios, por lo que recibirá los estilos de ambas clases. De esta manera podemos reutilizar y combinar estilos dependiendo de nuestras necesidades.


::: exercisebox
[[02b](https://github.com/yuki/ejercicios/blob/main/daw/diw/02b.html)]{.solution}

Crea un HTML con elementos que tengan clases y combinaciones y genera un CSS con clases reutilizables y un selector universal.
:::


## Selector de identificador {#selector-identificador}

HTML también dispone del atributo [id]{.verbatim} que sólo debe ser **utilizado una única vez** en cada documento HTML. Para seleccionar un elemento mediante su identificador utilizamos el carácter [#]{.verbatim}:


:::::::::::::: {.columns }
::: {.column width="50%"}

::: mycode
[HTML]{.title}

```html
<h1 id="titulo-principal">
    Mi página web
</h1>
```
:::

:::
::: {.column width="50%" }

::: mycode
[css]{.title}
```css
#titulo-principal {
    color: blue;
}
```
:::

:::
::::::::::::::


El selector se aplicará al **elemento** cuyo [id]{.verbatim} sea [titulo-principal]{.verbatim}.

::: exercisebox
[[02c](https://github.com/yuki/ejercicios/blob/main/daw/diw/02c.html)]{.solution}

Crea un HTML con elementos que tengan identificadores y crea CSS propios.
:::


## Selector por atributo {#selecto-atributo}

CSS permite seleccionar elementos que poseen determinados atributos HTML. Por ejemplo, podemos seleccionar todos los elementos que tengan el atributo [type]{.verbatim}:


:::::::::::::: {.columns }
::: {.column width="50%"}

::: mycode
[HTML]{.title}

```html
<input type="text">

<input type="email">

<input type="password">
```
:::

:::
::: {.column width="50%" }

::: mycode
[css]{.title}
```css
input[type] {
    border: 1px solid black;
}
input[type="email"] {
    background-color: lightblue;
}
```
:::

:::
::::::::::::::


También podemos seleccionar un valor concreto del atributo, en el ejemplo [type="email"]{.verbatim}. En este caso, únicamente el campo de correo electrónico tendrá el fondo azul claro.

Los selectores de atributo son especialmente útiles cuando necesitamos aplicar estilos dependiendo de las características de un elemento HTML.

Otro ejemplo para enlaces con atributo [target]{.verbatim}.

:::::::::::::: {.columns }
::: {.column width="50%"}

::: mycode
[HTML]{.title}

```html
<a href="http://google.com"
    target="_self">
    link
</a>
<a href="http://google.com" 
    target="_blank">
    link
</a>
```
:::

:::
::: {.column width="50%" }

::: mycode
[css]{.title}
```css
a[target] {
    font-weight: bold;
}
a[target="_blank"] {
    color: red;
}
```
:::

:::
::::::::::::::

::: exercisebox
[[02d](https://github.com/yuki/ejercicios/blob/main/daw/diw/02d.html)]{.solution}

Crea un HTML con elementos que tengan atributos y crea CSS propios.
:::


## Agrupar selectores {#agrupar-selectores}

Podemos aplicar las mismas reglas a varios selectores separándolos mediante comas. La agrupación evita repetir código.

:::::::::::::: {.columns }
::: {.column width="50%"}

::: mycode
[Agrupar selectores]{.title}

```css
h1,
h2,
h3 {
    font-family: sans-serif;
}
```
:::

:::
::: {.column width="50%" }

::: mycode
[Agrupar selectores]{.title}
```css
h1, h2, h3 {
    font-family: sans-serif;
}
```
:::

:::
::::::::::::::



## Selectores descendientes {#selectores-descendientes}

CSS permite seleccionar elementos que se encuentran dentro de otros elementos. Podemos seleccionar únicamente los párrafos que están dentro de [<article>]{.verbatim}.

:::::::::::::: {.columns }
::: {.column width="50%"}

::: mycode
[HTML]{.title}

```html
<article>
    <p>Primer párrafo.</p>
    <p>Segundo párrafo.</p>
</article>

<article>
    <div>
        <p>
            Texto.
        </p>
    </div>
</article>

<p>Párrafo exterior.</p>
```
:::

:::
::: {.column width="50%" }

::: mycode
[css]{.title}
```css
article p {
    color: blue;
}
```
:::

:::
::::::::::::::


El espacio entre [article]{.verbatim} y [p]{.verbatim} indica que estamos seleccionando los elementos[<p>]{.verbatim} que son descendientes de [<article>]{.verbatim}.

El resultado será:

- Primer párrafo → azul.
- Segundo párrafo → azul.
- Párrafo exterior → sin este estilo.
- Texto → azul.

El selector descendiente no se limita a los hijos directos, si no a toda la descendencia.

::: errorbox
El selector descendiente no se limita a los hijos directos, si no a toda la descendencia.
:::


## Selector de hijo directo {#selector-hijo-directo}

En ocasiones no queremos seleccionar cualquier descendiente, sino únicamente los **hijos directos**. Para ello utilizamos el símbolo [>]{.verbatim}.

:::::::::::::: {.columns }
::: {.column width="50%"}

::: mycode
[HTML]{.title}

```html
<article>
  <p>Párrafo directo.</p>
  <div>
    <p>Dentro de un div.</p>
  </div>
</article>
```
:::

:::
::: {.column width="50%" }

::: mycode
[css]{.title}
```css
article > p {
    color: blue;
}
```
:::

:::
::::::::::::::


De esta manera sólo se selecciona únicamente el primer párrafo, porque el segundo párrafo no es hijo directo de [<article>]{.verbatim}.

::: exercisebox
[[02f](https://github.com/yuki/ejercicios/blob/main/daw/diw/02f.html)]{.solution}

Crea un HTML con un CSS que diferencie entre descendientes e hijos directos.
:::


## Selector de hermano adyacente {#selector-hermano-adyacente}

CSS permite seleccionar elementos que aparecen inmediatamente después de otro. Para ello se utiliza el símbolo [+]{.verbatim}.


:::::::::::::: {.columns }
::: {.column width="50%"}

::: mycode
[HTML]{.title}

```html
<h2>Título</h2>
<p>Primer párrafo.</p>
<p>Segundo párrafo.</p>
```
:::

:::
::: {.column width="50%" }

::: mycode
[css]{.title}
```css
h2 + p {
    color: blue;
}
```
:::

:::
::::::::::::::


Con la regla anterior sólo se selecciona el primer párrafo, pero el segundo no.


## Selector de hermanos posteriores {#selector-hermano-posterior}

Para seleccionar todos los hermanos que aparecen después de un elemento se usa [~]{.verbatim}.


:::::::::::::: {.columns }
::: {.column width="50%"}

::: mycode
[HTML]{.title}

```html
<h2>Título</h2>
<p>Primer párrafo.</p>
<p>Segundo párrafo.</p>
<div>Otro elemento.</div>
<p>Tercer párrafo.</p>
```
:::

:::
::: {.column width="50%" }

::: mycode
[css]{.title}
```css
h2 ~ p {
    color: blue;
}
```
:::

:::
::::::::::::::


Con la regla anterior selecciona todos los elementos [<p>]{.verbatim} que sean hermanos posteriores de [<h2>]{.verbatim}. Por tanto, los tres párrafos serán seleccionados.

::: exercisebox
[[02g](https://github.com/yuki/ejercicios/blob/main/daw/diw/02g.html)]{.solution}

Crea un HTML con un CSS que diferencie entre hermanos adyacentes y todos los posteriores.
:::




## Pseudoclases {#pseudoclases}

Las **pseudoclases** permiten seleccionar elementos en función de un estado o una condición, y se representan mediante dos puntos ([:]{.verbatim}). Unos ejemplos son:

- [:hover]{.verbatim}: Cuando el usuario sitúa el puntero del ratón sobre el elemento.
- [:focus]{.verbatim}: Cuando un elemento  tiene el foco.
- [:active]{.verbatim}: Representa el momento en el que un elemento está siendo activado
- [:visited]{.verbatim}: Enlaces que el usuario ya ha visitado



::: exercisebox
[[02h](https://github.com/yuki/ejercicios/blob/main/daw/diw/02h.html)]{.solution}

Crea un HTML con un CSS que use estas pseudoclases.
:::


##  Pseudoelementos {#pseudoelementos}

Los **pseudoelementos** permiten seleccionar determinadas partes de un elemento o generar contenido asociado a él. Se representan normalmente mediante dos puntos ([::]{.verbatim}).


:::::::::::::: {.columns }
::: {.column width="50%"}

::: mycode
[HTML]{.title}

```html
<p class="aviso">
    Este campo es obligatorio.
</p>
```
:::

:::
::: {.column width="50%" }

::: mycode
[css]{.title}
```css
p::first-letter {
    font-size: 50px;
}
p::first-line {
    font-weight: bold;
}
.aviso::before {
    content: "⚠ ";
}
.enlace::after {
    content: " →";
}
```
:::

:::
::::::::::::::


Las reglas creadas hacen:

- Modifica la primera letra de cada párrafo.
- Permite modificar la primera línea de un texto.
- Permite insertar contenido antes del contenido del elemento.
- [::after]{.verbatim} funciona de forma similar, pero inserta el contenido después.


::: errorbox
El contenido generado mediante [::before]{.verbatim} y [::after]{.verbatim} forma parte de la representación visual del documento, pero no sustituye al contenido HTML que necesita el usuario. No debemos utilizarlos para introducir información esencial que deba estar disponible para todas las personas o tecnologías de asistencia.
:::


::: exercisebox
[[02i](https://github.com/yuki/ejercicios/blob/main/daw/diw/02i.html)]{.solution}

Crea el ejemplo anterior e interioriza los pseudoelementos.
:::



## Combinación de selectores {#combinación-selectores}

Los selectores pueden combinarse para crear reglas mucho más específicas. Por ejemplo:


:::::::::::::: {.columns }
::: {.column width="50%"}

::: mycode
[HTML]{.title}

```html
<article class="destacado">
  <p>Este párrafo será azul.</p>
</article>
```
:::

:::
::: {.column width="50%" }

::: mycode
[css]{.title}
```css
article.destacado p {
    color: blue;
}
```
:::

:::
::::::::::::::


Esta regla selecciona los párrafos que se encuentran dentro de un elemento que:

- Es un [<article>]{.verbatim}.
- Tiene la clase [destacado]{.verbatim}.


También podemos combinar clases:

:::::::::::::: {.columns }
::: {.column width="50%"}

::: mycode
[HTML]{.title}

```html
<button class="boton">
    Aceptar
</button>

<button class="boton importante">
    Eliminar
</button>
```
:::

:::
::: {.column width="50%" }

::: mycode
[css]{.title}
```css
.boton.importante {
    background-color: red;
}
```
:::

:::
::::::::::::::

La regla selecciona únicamente los elementos que tienen **las dos clases**:



## Resumen de selectores {#resumen-selectores}

| Selector | Ejemplo | Selecciona |
|---|---|---|
| Universal             | [*]{.verbatim} | Todos los elementos |
| Tipo                  | [p]{.verbatim} | Todos los  |
| Clase                 | [.aviso]{.verbatim} | Elementos con la clase [aviso]{.verbatim} |
| ID                    | [#menu]{.verbatim} | Elemento con [id="menu"]{.verbatim} |
| Atributo              | [input[type="email"]]{.verbatim} | Inputs de tipo email |
| Descendiente          | [article p]{.verbatim} | [<p>]{.verbatim} dentro de [<article>]{.verbatim} |
| Hijo directo          | [article > p]{.verbatim} | [<p>]{.verbatim} hijos directos |
| Hermano adyacente     | [h2 + p]{.verbatim} | [<p>]{.verbatim} inmediatamente posterior |
| Hermanos posteriores  | [h2 ~ p]{.verbatim} | [<p>]{.verbatim} posteriores que sean hermanos |
| Pseudoclase           | [a:hover]{.verbatim} | Enlaces bajo el cursor |
| Pseudoelemento        | [p::first-letter]{.verbatim} | Primera letra de un párrafo |


## Buenas prácticas {#buenas-prácticas}

Al escribir selectores CSS conviene seguir algunas recomendaciones.

- Utilizar clases para los estilos reutilizables.
- Evitar selectores excesivamente complejos, ya que dificultan el mantenimiento posterior.
- Utilizar nombres descriptivos con las clases e identificadores únicos.

