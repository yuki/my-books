
# Colores {#colores}

Los colores son una parte fundamental del diseño de una interfaz web. CSS permite definir el color del texto, los fondos, los bordes y muchos otros elementos visuales. A través de los colores podemos establecer una identidad visual, diferenciar elementos, llamar la atención del usuario y mejorar la legibilidad del contenido.

CSS ofrece diferentes formas de especificar colores y numerosas propiedades para controlar tanto el color del texto como el fondo de los elementos.

Ya hemos visto previamente cómo modificar el color del texto en ejemplos anteriores, y también sabemos que es una propiedad que normalmente se hereda.

::: mycode
[css]{.title}
```css 
p { color: blue; }
```
:::


## Cómo especificar colores {#cómo-especificar-colores}

A la hora de asignar colores podemos elegir de distintas maneras cómo indicar el color:

### Nombre de colores {#nombre-colores}

Existen numerosos nombres de colores, en inglés, reconocidos por CSS. Hemos visto varios ejemplos como [red]{.verbatim} o [blue]{.verbatim}, pero hay [muchos más](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference/Values/named-color).

Existen los siguientes colores estándar: aqua, black,blue, fuchsia, gray, green, lime, maroon, navy, olive, purple, red, silver, teal, white, yellow.

Hay ciertos nombres que son alias de otros como:

- [aqua / cyan]{color=cyan}
- [fuchsia / magenta]{color=magenta}
- [darkgray / darkgrey]{color=DarkGrey}
- [darkslategray / darkslategrey]{color=DarkSlateGrey}
- [dimgray / dimgrey]{color=DimGrey}
- [lightgray / lightgrey]{color=LightGrey}
- [lightslategray / lightslategrey]{color=LightSlateGrey}
- [gray / grey]{color=Grey}
- [slategray / slategrey]{color=SlateGrey}

Y hay que tener en cuenta las siguientes notas también:

- Darkgray es más claro que Gray.
- Lightpink es más oscuro que Pink.

Aunque para hacer pruebas básicas está bien usar estos nombres, utilizarlos resulta bastante limitado.

### Colores mediante valores hexadecimales {#valores-hexadecimales}

Una de las formas más utilizadas para definir colores en CSS es mediante valores hexadecimales. Un color hexadecimal comienza con el símbolo [#]{.verbatim} y normalmente está formado por seis caracteres:

::: mycode
[Color en hexadecimal]{.title}
```css
p { color: #ff0000; }
```
:::


:::::::::::::: {.columns }
::: {.column width="70%"}

Los seis caracteres representan los componentes:

- Rojo ([R]{.verbatim}).
- Verde ([G]{.verbatim}).
- Azul ([B]{.verbatim}).

Por este motivo, este sistema recibe el nombre **RGB hexadecimal**, y se representa como [#RRGGBB]{.verbatim}. Cada componente puede tener un valor entre [00]{.verbatim} y [FF]{.verbatim}. Las letras hexadecimales también se pueden escribir en minúsculas.


:::
::: {.column width="30%" }

![Fuente: [Wikipedia](https://en.wikipedia.org/wiki/RGB_color_model)](img/diw/Venn_diagram_rgb.svg){width=100%}

:::
::::::::::::::

Con este sistema tenemos una "[profundidad](https://es.wikipedia.org/wiki/Profundidad_de_color)" de 24 bits de colores (8 bits por canal), lo que da una variedad de 16.777.216 colores.


De esta manera, a modo de ejemplos sencillos tenemos:

- #000000: negro, por ausencia de color.
- #[FF]{color=red}0000: rojo
- #00[FF]{color=green}00: verde
- #0000[FF]{color=blue}: azul
- #FFFFFF: blanco, todos los colores juntos

Cuando los pares de cada componente están formados por dos caracteres iguales, podemos utilizar una forma abreviada de tres caracteres. Por lo tanto, los siguientes ejemplos son equivalentes:

- #FF0000 es igual a #F00
- #112233 es igual a #123
- #00FFAA es igual a #0FA

### Colores con [rgb()]{.verbatim} {#valores-rgb}

Otra posibilidad consiste en utilizar la función [rgb()]{.verbatim} para representar de nuevo el sistema RGB. Con esta función cada componente se pude representar de dos maneras:

- Valor entre [0]{.verbatim} y [255]{.verbatim}.
- Como porcentaje entre 0% y 100%.

::: mycode
[Color en hexadecimal]{.title}
```css
p {
    color: rgb(255 0 0);
    background-color: rgb(30% 20% 50% );
}
```
:::

La siguiente tabla es equivalente:

| Hexadecimal | RGB | RGB | 
|-----|-----|-----|
| [#FF0000]{.verbatim}  | [rgb(255 0 0)]{.verbatim} | [rgb(100% 0% 0%)]{.verbatim} |
| [#00FF00]{.verbatim}  | [rgb(0 255 0)]{.verbatim} | [rgb(0% 100% 0%)]{.verbatim} |
| [#0000FF]{.verbatim}  | [rgb(0 0 255)]{.verbatim} | [rgb(0% 0% 100%)]{.verbatim} |
| [#FFFFFF]{.verbatim}  | [rgb(255 255 255)]{.verbatim} | [rgb(100% 100% 100%)]{.verbatim} |
| [#000000]{.verbatim}  | [rgb(0 0 0)]{.verbatim} | [rgb(0% 0% 0%)]{.verbatim} |


::: warnbox
Antiguamente los valores en [rgb()]{.verbatim} iba separado por comas, pero ya no es necesario.
:::

### Colores con HSL {#colores-hsl}

:::::::::::::: {.columns }
::: {.column width="70%"}

CSS también permite definir colores utilizando el modelo **[HSL](https://en.wikipedia.org/wiki/HSL_and_HSV)**. HSL significa:

- ***Hue***: tono/matiz.
- ***Saturation***: saturación.
- ***Lightness***: luminosidad.

CSS permite utilizarlo mediante la función [hsl()]{.verbatim}. En el siguiente ejemplo se muestra el color rojo:

:::
::: {.column width="30%" }

![Fuente: [Wikipedia](https://en.wikipedia.org/wiki/HSL_and_HSV)](img/diw/HSL_color_solid_cylinder.png){width=100%}

:::
::::::::::::::



::: mycode
[Color en hexadecimal]{.title}
```css
p { color: hsl(0 100% 50%); }
```
:::


:::::::::::::: {.columns }
::: {.column width="70%"}

HSL representa los valores como un cilindro. El primer valor representa el tono y se expresa mediante un ángulo. Por ejemplo:

-   0°:  rojo
-  60º: amarillo
- 120°: verde
- 180º: cyan
- 240°:  azul
- 300º: magenta
- 360º: rojo de nuevo, por dar la vuelta completa al círculo.

La saturación y la luminosidad se expresan mediante porcentaje. 

:::
::: {.column width="30%" }

![Fuente: [techterms](https://techterms.com/img/xl/hsl_1546.png)](img/diw/hsl_1546.png){width=100%}

:::
::::::::::::::


Cuando la saturación tiene un valor del 100% es más intenso que cuando el mismo tiene 50%. Cuando la luminosidad es menor, obtenemos un color más oscuro, y si ponemos 0% será negro.

HSL puede resultar especialmente cómodo cuando necesitamos crear variaciones de un mismo color. En el siguiente ejemplo, jugando con la luminosidad obtendremos 3 variaciones del mismo color:

::: mycode
[Variación de luminosidad con HSL]{.title}
```css
.color-base {
    color: hsl(210 80% 50%);
}
.color-claro {
    color: hsl(210 80% 70%);
}
.color-oscuro {
    color: hsl(210 80% 30%);
}
```
:::

### El canal alfa {#canal-alfa}

El canal alfa (en inglés *alpha*) permite controlar la transparencia u opacidad de un color. Se puede utilizar tanto en [rgb()]{.verbatim} como en [hsl()]{.verbatim} añadiendo a ambas funciones un cuarto parámetro tras el carácter [/]{.verbatim}.


::: mycode
[Añadida transparencia a un color]{.title}
```css
h1{
    background-color: rgb(0 0 255 / 50%);
}
h2{
    background-color: hsl(240 100% 50% / 0.5);
}
h3{
    background-color: #FF00007F;
}
```
:::

El canal alfa se puede indicar en modo porcentaje o un valor entre [0]{.verbatim} y [1]{.verbatim}. En ambos ejemplos se está indicando que el color indicado tiene una opacidad del 50%, ya que funciona de la siguiente manera:

- [0%]{.verbatim}: completamente transparente.
- [50%]{.verbatim}: semitransparente.
- [100%]{.verbatim}: completamente opaco.

En el sistema hexadecimal hay que añadir una nueva pareja al final para añadir el nivel de transparencia.

Existen otras maneras de especificar el canal alfa, usando las funciones [rgba()]{.verbatim}, [hsla()]{.verbatim}, pero en CSS moderno son aliases a las funciones vistas previamente.


### La palabra clave [transparent]{.verbatim} {#palabra-transparent}

Si queremos hacer que algo sea completamente transparente se puede utilizar la palabra clave [transparent]{.verbatim}, que tal como aparece en la [documentación](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference/Values/named-color\#transparent) es un alias/*shortcut* a [rgb(0 0 0 / 0%)]{.verbatim}.

Esto se suele utilizar para especificar el fondo de un elemento, para así dejar visible el posible fondo que haya.

::: mycode
[Fondo transparente]{.title}
```css
h1{
    background-color: transparent;
}
```
:::

## Qué sistema utilizar {#sistema-a-utilizar}

:::::::::::::: {.columns }
::: {.column width="70%"}
Aunque pueda parecer una respuesta ambigua, depende del proyecto y de la tecnología final que estemos utilizando, ya que esto también afecta.

Cuando usamos el sistema hexadecimal o la función [rgb()]{.verbatim} estamos trabajando bajo el [espacio de color](https://en.wikipedia.org/wiki/Color_space) denominado [sRGB](https://en.wikipedia.org/wiki/SRGB). Este sistema, tal como se ha dicho previamente, hace uso de 24bits (8 por canal), que hace un total de 16.777.216 colores.

En cambio, al usar [hsl()]{.verbatim} no se limita a esos 8 bits por canal, y si nuestro navegador/sistema/pantalla hace uso de otra profundidad de color, podríamos estar usándola.

A medida que avanza la tecnología necesitamos nuevas maneras de representar colores, ya que el espacio de colores se amplía, como 10 bit de color por canal, HDR, ... 
:::
::: {.column width="30%" }

![Comparación entre sRGB y BT2020](img/diw/color_scheme.svg){width=100%}

:::
::::::::::::::


## Colores y diseño de interfaces {#colores-diseño-interfaces}

En una interfaz normalmente no utilizaremos colores de manera aislada, ya que lo  habitual definir una pequeña paleta. Por ejemplo:

- Color principal
- Color secundario
- Color de fondo
- Color de texto
- Color de texto secundario
- Color de éxito
- Color de error
- Color de advertencia

Posteriormente, cuando estudiemos las variables CSS, podremos centralizar estos valores.



# Fondos {#fondos}

CSS permite controlar el fondo de los elementos mediante diferentes propiedades. Podemos utilizar colores, imágenes, degradados y controlar aspectos como su tamaño, posición o repetición.

Las propiedades relacionadas con los fondos son especialmente importantes en el diseño de interfaces, ya que permiten crear tarjetas, cabeceras, botones, secciones destacadas y otros componentes visuales.

## Color de fondo {#background-color}

La propiedad [background-color]{.verbatim} permite establecer el color de fondo de un elemento. Podemos utilizar cualquiera de los formatos de color estudiados anteriormente:


::: mycode
[Añadir color de fondo]{.title}
```css
body {background-color: #d0d0d0}
.div1 { background-color: #2563eb }
.div2 { background-color: rgb(37, 235, 212) }
.div3 { background-color: hsl(262 83% 53% / 0.5) }
```
:::

Esta propiedad se la podemos asignar a cualquier elemento, incluso al fondo del documento en [body]{.verbatim} tal como se ve en el ejemplo.

::: exercisebox
[[04a](https://github.com/yuki/ejercicios/blob/main/daw/diw/04a.html)]{.solution}

Crea distintos elementos añadiendo color al fondo usando los distintos sistemas vistos previamente.
:::

## Imágenes de fondo {#background-image}

La propiedad [background-image]{.verbatim} permite utilizar una imagen como fondo.

::: mycode
[Añadir fondo de imagen]{.title}
```css
div { background-image: url("fondo.jpg"); }
```
:::

La función [url()]{.verbatim} indica la dirección de la imagen. La ruta puede ser relativa al archivo CSS o absoluta, dependiendo de cómo esté organizada la aplicación. Si queremos que sea ruta relativa, imaginando la siguiente estructura de ficheros:

::: mycode
[Estructura de ficheros]{.title}
```text
proyecto/
├── css/
│   └── estilos.css
└── img/
    └── fondo.jpg
```
:::

Para cargar la imagen desde [estilos.css]{.verbatim} usaremos la siguiente ruta: [url("../img/fondo.jpg")]{.verbatim}.

Podemos hacer uso de [background-image]{.verbatim} junto con [background-color]{.verbatim}, pero el color sólo funcionará en caso de que la imagen no esté disponible.


::: exercisebox
[[04b](https://github.com/yuki/ejercicios/blob/main/daw/diw/04b.html)]{.solution}

Crea elementos añadiendo imágenes como fondo. Comprueba qué pasa si se añade un [background-color]{.verbatim} y si la imagen no existe.
:::


### [background-repeat]{.verbatim} {#background-repeat}

Una imagen de fondo puede repetirse para cubrir todo el espacio disponible. Podemos controlar este comportamiento mediante [[background-repeat]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference/Properties/background-repeat), cuyos valores principales, entre otros, son:

- [repeat]{.verbatim}: permite repetir la imagen tanto horizontal como verticalmente. Este es el comportamiento predeterminado de una imagen de fondo. Es especialmente útil cuando utilizamos imágenes pequeñas que forman patrones.
- [repeat-x]{.verbatim}: la imagen se repite horizontalmente.
- [repeat-y]{.verbatim}: la imagen se repite verticalmente.
- [no-repeat]{.verbatim}: para que la imagen no se repita, lo ideal para cuando queremos añadir sólo una fotografía de fondo.
- [space]{.verbatim}: se repite la imagen sin hacer cortes. Se pone la primera imagen al principio del elemento, y al final, y en medio se van añadiendo repeticiones, dejando huecos libres.

Las siguientes imágenes son del ejemplo de [MDN](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference/Properties/background-repeat).

:::::::::::::: {.columns }
::: {.column width="33%"}
![repeat](img/diw/repeat.png){width=100%}
:::
::: {.column width="33%" }
![repeat-x](img/diw/repeat-x.png){width=100%}
:::
::: {.column width="33%" }
![no-repeat](img/diw/no-repeat.png){width=100%}
:::
::::::::::::::

::: exercisebox
[[04c](https://github.com/yuki/ejercicios/blob/main/daw/diw/04c.html)]{.solution}

Comprueba la diferencia de los distintos parámetros de [background-repeat]{.verbatim}.
:::


### Varias imágenes de fondo {#varias-imágenes-fondo}

CSS permite utilizar varias imágenes de fondo simultáneamente, lo que nos permite combinar imágenes creando efectos sin tener que pre-procesarlas previamente.

Al poner varias imágenes funciona añadiendo capas una encima de la otra: la primera que se ponga estará por encima de la segunda, y esta encima de la tercera y así sucesivamente.

En el siguiente ejemplo de la documentación de [W3C](https://www.w3schools.com/Css/tryit.asp?filename=trycss3_background_multiple) se ha añadidos dos imágenes a un elemento:


:::::::::::::: {.columns columnsep="0.5cm"}
::: {.column width="35%"}

::: {.mycode size="footnotesize"}
[HTML]{.title}
```html
<div id="example1">
  <h1>Lorem Ipsum</h1>
  <p>Lorem ipsum  ...</p>
</div>
```
:::


:::
::: {.column width="65%" }

::: {.mycode size="footnotesize"}
[CSS]{.title}
```css
#example1 {
  background-image: url(img_flwr.gif), url(paper.gif);
  background-position: right bottom, left top;
  background-repeat: no-repeat, repeat;
  padding: 15px;
}
#example1 p {
	width:60%;
}
```
:::

:::
::::::::::::::

Tal como se puede ver, se pueden añadir varios parámetros [url()]{.verbatim} a [background-image]{.verbatim}, y lo mismo para la posición y si queremos que la imagen se repita.

::: warnbox
Importante recordar que las imágenes van por capas, de más "arriba" hacia abajo.
:::


## Otras propiedades de fondo {#otras-propiedades}

Existen otras propiedades que tienen que ver con el fondo, por lo que es recomendable ver la documentación para cada una de ellas para conocer sus opciones.

- [background-position]{.verbatim}: permite controlar la posición de una imagen de fondo, usando los siguientes valores:
  - Palabras clave, pudiendo combinarlos: [left]{.verbatim}, [center]{.verbatim}, [right]{.verbatim}, [top]{.verbatim}, o [bottom]{.verbatim}. 
  - Porcentajes con dos posiciones, posición desde la izquierda y desde arriba.
  - También se pueden usar posiciones como [px]{.verbatim} y [em]{.verbatim}.
- [background-size]{.verbatim}: permite controlar el tamaño de la imagen de fondo.
  - Si ponemos una única dimensión será el ancho y mantendrá la proporción. Si añadimos una segunda será la altura.
  - Si ponemos la palabra reservada [cover]{.verbatim} cubrirá todo el elemento, pero si la proporción no coincide, parte de la imagen puede quedar fuera de la zona visible.
  - Si ponemos la palabra reservada [contain]{.verbatim} la imagen se escala para que pueda verse completamente dentro del elemento, pero dejará espacio libre.
- [background-attachment]{.verbatim}: permite controlar el comportamiento del fondo cuando hacemos scroll. Permite los siguientes valores:
  - [scroll]{.verbatim}, el comportamiento normal
  - [fixed]{.verbatim}: En este caso, el fondo puede permanecer fijo mientras desplazamos el contenido.
- [background-origin]{.verbatim}: permite determinar desde qué zona de la caja se posiciona la imagen de fondo. Los valores son [border-box]{.verbatim}, [padding-box]{.verbatim} o [content-box]{.verbatim}.


::: mycode
[Ejemplos de sólo ciertas propiedades]{.title}
```css
.a {background-position: top left;}
.b {background-position: 10% 50%;}
.c {background-position: 10em 50px;}
.d {background-size: 300px;}
.e {background-size: cover;}
.f {background-size: contain;}
```
:::


## Degradados {#degradados}

CSS permite crear degradados sin necesidad de utilizar una imagen externa. Los degradados son generados por el navegador, lo que permite crear fondos visualmente complejos sin necesidad de descargar una imagen.

Existen distintas formas a la hora de crear degradados:

- [[linear-gradient()]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference/Values/gradient/linear-gradient): crea un degradado lineal. Se puede indicar la dirección como primer parámetro:
  - [to right]{.verbatim}: el degradado va de izquierda a derecha.
  - [to bottom]{.verbatim}: de arriba hacia abajo.
  - Se puede indicar más de dos colores, y el navegador hará transiciones entre ellos. Aparte de indicar la posición de cada uno de ellos.
- [[radial-gradient()]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference/Values/gradient/radial-gradient): crea un degradado que parte desde un punto central y se extiende hacia fuera.
- [[conic-gradient]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference/Values/gradient/conic-gradient): genera un degradado alrededor de un punto central en forma cónica

::: {.mycode size="footnotesize"}
[Degradado]{.title}
```css
.a { background: linear-gradient(red, orange); }
.b { background: linear-gradient(to right, red, orange, yellow); }
.c { background: linear-gradient(45deg, red 25%, yellow 50%, blue 100% ); }
.d { background: linear-gradient( to right, red 0%, yellow 50%, blue 100% ); }
.e { background: radial-gradient(circle, white, blue); }
.f { background: conic-gradient(red, orange, yellow, green, blue, purple, red); }
```
:::

:::::::::::::: {.columns }
::: {.column width="25%"}
![](img/diw/gradient1.png){width=100%}
:::
::: {.column width="25%" }
![](img/diw/gradient2.png){width=100%}
:::
::: {.column width="25%" }
![](img/diw/gradient3.png){width=100%}
:::
::: {.column width="25%" }
![](img/diw/gradient4.png){width=100%}
:::
::::::::::::::

::: exercisebox
[[04d](https://github.com/yuki/ejercicios/blob/main/daw/diw/04d.html)]{.solution}

Crea distintos degradados con las opciones vistas y que aparecen en la documentación.
:::

### Degradado sobre imagen {#degradado-sobre-imagen}

Al igual que hemos visto que se pueden poner imágenes una encima de otra, también podemos crear un degradado para poner encima de una imagen.

::: {.mycode size="footnotesize"}
[Degradado]{.title}
```css
.a {
    background-image:
        linear-gradient(
            rgb(0 0 0 / 50%),
            rgb(0 0 0 / 50%)
        ),
        url("paisaje.jpg");
}
```
:::

El resultado es una fotografía oscurecida mediante una capa negra semitransparente, sobre la que podemos colocar texto.


## La propiedad abreviada [background]{.verbatim} {#propiedad-background}

Hemos visto cómo crear o añadir fondos con propiedades específicas, pero a la propiedad [background]{.verbatim} se le pueden añadir todos los atributos vistos previamente en el siguiente orden:

::: {.mycode size="footnotesize"}
[CSS]{.title}
```css
.caja {
    background:
        #222
        url("imagen.jpg")
        no-repeat
        center
        / cover;
}
```
:::

Con esta única propiedad hemos establecido el color de fondo, una imagen, la repetición, la posición y el tamaño. La propiedad abreviada puede resultar muy útil, pero al principio puede ser más sencillo utilizar las propiedades individuales.

