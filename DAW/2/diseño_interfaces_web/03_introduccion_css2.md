
# Especificidad {#especificidad}

En el apartado anterior hemos visto que CSS permite utilizar diferentes tipos de selectores para seleccionar elementos HTML. En ocasiones, varias reglas CSS pueden afectar al mismo elemento y modificar la misma propiedad. Por ejemplo:

:::::::::::::: {.columns }
::: {.column width="60%"}

::: mycode
[HTML]{.title}

```html
<p id="mensaje" class="importante">
    Hola mundo
</p>
```
:::

:::
::: {.column width="40%" }

::: mycode
[css]{.title}
```css
p {
    color: blue;
}
.importante {
    color: green;
}
#mensaje {
    color: red;
}
```
:::

:::
::::::::::::::

Las tres reglas anteriores afectan al mismo elemento y las tres intentan establecer el valor de la propiedad [color]{.verbatim}. Ante estos casos, cuando hay varias reglas, la **especificidad** es el mecanismo que utiliza CSS para determinar qué regla tiene prioridad cuando varias reglas pueden aplicarse al mismo elemento. El texto será **rojo**, porque el selector [#mensaje]{.verbatim} tiene una especificidad mayor que los otros dos selectores.


## Tipos de selectores y especificidad  {#tipos-selectores-especificidad}

La especificidad de un selector depende principalmente del tipo de selector utilizado. Podemos establecer, **de mayor a menor prioridad**, la siguiente clasificación:

A) Estilos inline.
B) Identificadores ([#id]{.verbatim}).
C) Clases, atributos y pseudoclases.
D) Elementos y pseudoelementos.



Para comprender la especificidad podemos representar un selector mediante cuatro valores [A B C D]{.verbatim} que podemos imaginar como una puntuación. Imaginemos los siguientes ejemplos:

:::::::::::::: {.columns }
::: {.column width="33%"}

::: mycode
[CSS]{.title}

```css
p {
    color: blue;
}
```
:::

:::
::: {.column width="33%" }

::: mycode
[css]{.title}
```css
.mensaje {
    color: green;
}
```
:::

:::
::: {.column width="33%" }

::: mycode
[css]{.title}
```css
#mensaje {
    color: red;
}
```
:::

:::
::::::::::::::


Las puntuaciones quedarían:

- [0 0 0 1]{.verbatim}: porque contiene un selector de tipo elemento.
- [0 0 1 0]{.verbatim}: por ser una clase.
- [0 1 0 0]{.verbatim}: por ser identificador.


Es importante comprender que los valores de especificidad no se suman como una puntuación normal. Se comparan de izquierda a derecha. Por ejemplo [0 1 0 0 > 0 0 20 0]{.verbatim}, el primero es más específico aunque el segundo selector tenga 20 clases, ya que el selector de identificador es más prioritario que las clases. Existe [calculadoras](https://specificity.keegan.st/) para calcular el valor y comparar entre distintas reglas y saber cuál es más específica que otra.


::: exercisebox
[[03a](https://github.com/yuki/ejercicios/blob/main/daw/diw/03a.html)]{.solution}

Crea un HTML con tres [p]{.verbatim} y añade estilos por especificidad.
:::

## Combinación de selectores {#combinar-selectores}

La especificidad también se acumula cuando combinamos selectores. Si seguimos la regla explicada previamente, analicemos los siguientes ejemplos:


:::::::::::::: {.columns }
::: {.column width="50%"}

::: mycode
[CSS]{.title}

```css
article p {
    color: blue;
}
```
:::

:::
::: {.column width="50%" }

::: mycode
[css]{.title}
```css
article .mensaje {
    color: green;
}
```
:::

:::
::::::::::::::


Las puntuaciones quedarían:

- [0 0 0 2]{.verbatim}: porque contiene dos selector de tipo.
- [0 0 1 1]{.verbatim}: por tener un selector de tipo y otro de clase. Por lo tanto, tiene mayor especifidad que la anterior


## Varias clases {#varias-clases}

Si un selector contiene varias clases, todas ellas cuentan para la especificidad.


:::::::::::::: {.columns }
::: {.column width="50%"}

::: mycode
[CSS]{.title}

```css
.mensaje.importante {
    color: red;
}
```
:::

:::
::: {.column width="50%" }

::: mycode
[css]{.title}
```css
.mensaje {
    color: blue;
}
```
:::

:::
::::::::::::::

La primera regla es más especifica que la segunda.


## Selectores de atributos {#selectores-atributos-especificidad}

Los selectores de atributos tienen la misma importancia que las clases.

:::::::::::::: {.columns }
::: {.column width="50%"}

::: mycode
[CSS]{.title}

```css
input[type="email"] {
    border-color: blue;
}
```
:::

:::
::: {.column width="50%" }

Tiene puntuación de [0 0 1 1]{.verbatim} por:

- Un selector de tipo: [input]{.verbatim}
- Un selector de atributo: [[type="email"]]{.verbatim}

:::
::::::::::::::




## Pseudoclases {#pseudoclases-especificidad}

Las pseudoclases también cuentan como una clase a efectos de especificidad.


:::::::::::::: {.columns }
::: {.column width="50%"}

::: mycode
[CSS]{.title}

```css
a:hover {
    color: red;
}
```
:::

:::
::: {.column width="50%" }

Tiene puntuación de [0 0 1 1]{.verbatim} por:

- Un selector de tipo: [a]{.verbatim}
- Un selector de atributo: [:hover]{.verbatim}

:::
::::::::::::::




## Pseudoelementos {#pseudoelementos-especificidad}

Los pseudoelementos cuentan como selectores de tipo.


:::::::::::::: {.columns }
::: {.column width="50%"}

::: mycode
[CSS]{.title}

```css
p::first-letter {
    font-size: 30px;
}
```
:::

:::
::: {.column width="50%" }

Tiene puntuación de [0 0 0 2]{.verbatim} por:

- Un selector de tipo: [p]{.verbatim}
- Un pseudoelemento: [::first-letter]{.verbatim}

:::
::::::::::::::



## El selector universal {#selector-universal-especificidad}

El selector **universal** no aporta especificidad. Lo mismo pasa con [> + ~]{.verbatim}. Estos elementos sirven para establecer relaciones entre selectores, pero no aumentan la especificidad.


## Especificidad frente a orden {#especificidad-y-orden}

La especificidad no es el único criterio que utiliza CSS. Cuando dos reglas tienen **la misma especificidad**, el orden de aparición puede determinar cuál se aplica. En el siguiente ejemplo ambos selectores tienen la misma puntuación y afectan al mismo tipo de elemento:


::: mycode
[CSS]{.title}

```css
p {
    color: blue;
}
p {
    color: red;
}
```
:::

A pesar de tener la misma puntuación, la regla que se aplica es la segunda, ya que aparece después y por tanto el texto será rojo.


## Forzar declaración con [!important]{.verbatim} {#forzar-declaracion-important}

CSS proporciona una herramienta especial denominada [!important]{.verbatim} que adquiere una prioridad especial dentro del mecanismo de la cascada. Puede utilizarse para forzar que una determinada declaración tenga prioridad sobre otras declaraciones normales. 

Teniendo en cuenta el ejemplo anterior, al añadir [!important]{.verbatim} a la primera regla se vuelve prioritaria y deja sin validez a la segunda:

::: mycode
[CSS]{.title}

```css
p {
    color: blue !important;
}
p {
    color: red;
}
```
:::


Cuando existen numerosos [!important]{.verbatim}, se vuelve complicado saber qué regla terminará aplicándose, y por tanto **no se recomienda utilizar como solución habitual a los problemas de estilos**.

::: errorbox
Utilizar [!important]{.verbatim} es considerado una mala práctica.
:::


## Herramientas del navegador {#herramientas-navegador-comprobar-especificidad}

Las herramientas para desarrolladores de los navegadores permiten comprobar fácilmente qué reglas CSS se están aplicando. Por ejemplo, en Chrome o Firefox podemos seleccionar un elemento mediante el inspector y el navegador mostrará:

- Las reglas que afectan al elemento.
- Las propiedades aplicadas.
- Las propiedades sobrescritas.
- El archivo CSS donde se encuentra cada regla.
- La línea donde está definida.
- En algunos casos, información relacionada con la especificidad.

Si aparece una propiedad tachada significa que existe otra declaración para la misma propiedad que tiene prioridad. Aprender a identificar el orden y utilizar esta herramienta resulta fundamental para solucionar problemas de CSS.


::: exercisebox
[[03b](https://github.com/yuki/ejercicios/blob/main/daw/diw/03b.html)]{.solution}

Teniendo en cuenta el siguiente código HTML y CSS, analiza el código y determina qué color va a tener texto (apúntalo en un papel). Copia el texto en ficheros y comprueba si has acertado. Analiza con las herramientas del desarrollador las reglas que se aplican y cuáles se tachan por tener menor especificidad.

::: {.mycode size="footnotesize"}
[HTML]{.title}

```html
<h1 id="titulo">Especificidad de CSS</h1>

<h2 class="azul">Primer ejemplo</h2>
<p class="base">Párrafo 1</p>

<h3 class="verde">Segundo ejemplo</h3>
<p id="importante" class="destacado">Segundo párrafo</p>

<h2 class="gris">Tercer ejemplo</h2>
<p class="base resaltado">Tercer párrafo</p>

<p class="importante">Cuarto párrafo</p>
```
:::

::: {.mycode size="footnotesize"}
[CSS]{.title}

```css
p { color: black;}
h1 { color: darkgray;}
h2 { color: purple;}
h3 { color: brown;}
#titulo { color: red;}
.base { color: green;}
h2.azul { color: blue;}
p.destacado { color: orange;}
h3.verde { color: olive;}
p.resaltado { color: teal;}
p.importante { color: fuchsia !important;}
#importante { color: darkblue !important;}
h2.gris { color: gray;}
```
:::

:::


# Herencia {#herencia}

La **herencia** es uno de los mecanismos fundamentales de CSS. Permite que determinadas propiedades CSS definidas en un elemento se transmitan en herencia automáticamente a sus elementos descendientes. Gracias a la herencia, no es necesario establecer algunas propiedades individualmente en todos los elementos de una página.


:::::::::::::: {.columns }
::: {.column width="50%"}

::: mycode
[HTML]{.title}

```html
<body>
    <h1>Título</h1>
    <p>Primer párrafo.</p>
    <div>
        <p>Segundo párrafo.</p>
    </div>
</body>
```
:::

:::
::: {.column width="50%" }

::: mycode
[CSS]{.title}
```css
body {
    color: blue;
}
div {
    color: red;
}
```
:::

:::
::::::::::::::

Con el ejemplo anterior, los textos de los elementos descendientes heredarán el color especificado en el padre. Por otro lado, tal como se puede ver, un elemento puede tener su propio valor para una propiedad heredable e incluso comenzar su propia herencia tal como sucede con la regla [div]{.verbatim}.

::: infobox
La herencia permite reducir la cantidad de código CSS necesario y facilita la creación de estilos generales para una página.
:::



## No todas las propiedades se heredan {#no-todo-se-hereda}

Es importante tener en cuenta que **no todas las propiedades CSS son heredables**. Por ejemplo, [color]{.verbatim} se hereda normalmente, pero propiedades relacionadas con el modelo de caja, como [margin]{.verbatim}, no se heredan normalmente. 

Por tanto, debemos distinguir entre 

- **Propiedades heredables**: por defecto se establecen al valor calculado del elemento padre. Son propiedades relacionadas al texto, como [color]{.verbatim}, [font-family]{.verbatim}, [font-size]{.verbatim}, [font-style]{.verbatim}, [line-height]{.verbatim},  [text-align]{.verbatim} y [visibility]{.verbatim}.
- **Propiedades NO heredables**: por defecto se establecen al valor inicial de la propiedad. Son propiedades relacionadas con el modelo de caja o el *layout*, como [border]{.verbatim}, [background]{.verbatim}, [margin]{.verbatim}, [padding]{.verbatim}, [width]{.verbatim} y [height]{.verbatim}.

Para saber qué propiedad es heredable, dentro de la documentación de [MDN](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference/Properties/color) o [W3C](https://www.w3schools.com/cssref/pr_text_color.php) podemos ver la definición de ***Inherited***, que si es **True** se hereda.


## Forzar herencia con [inherit]{.verbatm} {#forzar-herencia}

CSS proporciona la palabra clave [inherit]{.verbatm} para indicar explícitamente que una propiedad debe utilizar el valor heredado del elemento padre.

Usando esta palabra también vamos a poder heredar atributos que no se heredarían.


:::::::::::::: {.columns }
::: {.column width="50%"}

::: mycode
[HTML]{.title}

```html
<div>
    <p>Primer párrafo.</p>
    <p>Segundo párrafo</p>
</div>
```
:::

:::
::: {.column width="50%" }

::: mycode
[CSS]{.title}
```css
div {
  border: 2px solid red;
}
p {
    border: inherit;
}
```
:::

:::
::::::::::::::


::: exercisebox
[[03d](https://github.com/yuki/ejercicios/blob/main/daw/diw/03d.html)]{.solution}

Genera un HTML con propiedades que se hereden automáticamente y otras por herencia forzada.
:::


## [initial]{.verbatim} como reset {#initial-reset}

Podríamos definir [initial]{.verbatim} como si fuese un reset, ya que establece el valor inicial definido para la propiedad según CSS.

Supongamos el siguiente ejemplo:

:::::::::::::: {.columns }
::: {.column width="50%"}

::: mycode
[HTML]{.title}

```html
<div>
    <h1>Título</h1>>
    <p>primer párrafo</p>
</div>
```
:::

:::
::: {.column width="50%" }

::: mycode
[CSS]{.title}
```css
div {
  color:red
}
h1 {
    color: initial;
}
```
:::

:::
::::::::::::::

Establecemos en [div]{.verbatim} un color que por herencia deberían tener todos los elementos bajo él, pero en la regla de h1 hacemos que el color vuelva al valor por defecto.


::: exercisebox
[[03e](https://github.com/yuki/ejercicios/blob/main/daw/diw/03e.html)]{.solution}

Genera un HTML con propiedades heredadas pero que no se establezcan por el uso de [initial]{.verbatim}.
:::


## La palabra clave [unset]{.verbatim} {#palabra-clave-unset}

La palabra clave [unset]{.verbatim} combina dos comportamientos.

- Si la propiedad es heredable, [unset]{.verbatim} se comporta como: [inherit]{.verbatim}
- Si la propiedad no es heredable, se comporta como [initial]{.verbatim}

::: mycode
[CSS]{.title}
```css
p {
    color: unset;
    margin: unset;
}
```
:::

En el anterior ejemplo tenemos las dos maneras de comportarse:

- Como [color]{.verbatim} es una propiedad heredable, [unset]{.verbatim} hará que se utilice el valor heredado.
- Para [margin]{.verbatim} se utilizará el valor por defecto.



## La palabra clave [revert]{.verbatim} {#palabra-clave-revert}

La palabra clave [revert]{.verbatim} permite volver al valor que habría tenido la propiedad utilizando las reglas de origen anteriores, en lugar de continuar aplicando la declaración actual.

Su funcionamiento está relacionado con la cascada y con los diferentes orígenes de las reglas CSS.

Aunque puede resultar útil en determinados casos, de momento no la usaremos, aunque es conveniente ver un ejemplo en [MDN](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference/Values/revert).


# Cascada {#cascada}

El nombre de **CSS** procede de *Cascading Style Sheets*, que en español significa **hojas de estilo en cascada**. La palabra *cascada* hace referencia al mecanismo que utiliza CSS para determinar qué estilos deben aplicarse cuando existen varias reglas que afectan a un mismo elemento.

En una página web es habitual que diferentes reglas puedan establecer valores para una misma propiedad.


::: mycode
[CSS]{.title}
```css
p {
    color: blue;
}
p {
    color: red;
}
```
:::


Las dos reglas afectan a los elementos [<p>]{.verbatim} y las dos establecen un valor para la propiedad [color]{.verbatim}. CSS necesita decidir cuál de los dos valores utilizará. La cascada es el conjunto de reglas que permite resolver estas situaciones.



## La cascada no significa "gana la última regla" {#cascada-no-gana-última-regla}

El orden de aparición es solamente uno de los criterios utilizados por la cascada, por lo que hay que tener cuidado y no creer que la última regla siempre va a ser la correcta.

Hay que recordar que la regla que se aplica es la que mayor [especificidad](#especificidad) tenga.


## Las tres ideas fundamentales {#ideas-fundamentales}

Para comprender la cascada es necesario distinguir los conceptos que hemos visto previamente:

- **Especificidad**: Determina qué selector tiene mayor prioridad cuando varias reglas coinciden con un elemento.
- **Herencia**: Permite que determinadas propiedades pasen de los elementos padres a sus descendientes.
- **Cascada**: Determina qué declaración termina utilizándose cuando existen varias declaraciones posibles.


## Origen de las hojas de estilo {#origen-hojas-estilo}

Las reglas CSS pueden proceder de diferentes lugares. De forma simplificada, podemos distinguir:

- Hojas de estilo del navegador.
- Hojas de estilo proporcionadas por el usuario.
- Hojas de estilo del autor de la página.

En el desarrollo habitual de páginas web trabajaremos principalmente con los estilos del **autor**, es decir, los CSS que escribimos nosotros.

### Estilos del navegador {#estilos-navegador}

Los navegadores incluyen una hoja de estilos predeterminada conocida habitualmente como **user-agent stylesheet**. Cuando creamos nuestro HTML, al añadir algún elemento ya tiene un estilo propio de tamaño, color, tipo de letra, grosor, márgenes...

Estos estilos no los hemos escrito nosotros, proceden de las reglas predeterminadas del navegador, que suelen proporcionar estilos predeterminados para las siguientes etiquetas: [<h1>]{.verbatim}, [<p>]{.verbatim}, [<a>]{.verbatim}, [<ul>]{.verbatim}, [<button>]{.verbatim}, [<input>]{.verbatim}, entre muchos otros elementos.

Por este motivo, una página HTML puede tener un aspecto visual incluso cuando no hemos escrito ninguna hoja de estilos.

![Mismo HTML sin estilos en Chrome, Firefox y Safari en MacOS](img/diw/estilos-navegador.png){width=80% framed=true}

Tal como se puede ver, existen diferencias claras en el botón, pero también en dónde se dibuja el *bullet* de la lista, separación entre elementos, y más sutilmente el subrayado del enlace.

Esto siempre ha sido un problema, y más antiguamente cuando algunos navegadores no gestionaba bien el estándar, sobre todo en la gestión de los parámetros de cajas. Por eso existen ficheros **[reset.css](https://meyerweb.com/eric/tools/css/reset/)** para resetear los estilos predeterminados. Los *frameworks* CSS como [Bootstrap](https://getbootstrap.com/docs/5.2/content/reboot/) o [TailWind](https://tailwindcss.com/docs/preflight) también hacen esta operación antes de aplicar sus estilos.


## Controlar el sistema de cascada {#controla-sistema-cascada}

CSS ha evolucionado y actualmente existen mecanismos adicionales para controlar la cascada. Uno de ellos son las **capas de cascada**, mediante [@layer]{.verbatim}.

Las capas permiten organizar las reglas CSS en diferentes niveles de prioridad y posteriormente colocar las reglas dentro de cada capa. Esto resulta especialmente útil en proyectos grandes, donde diferentes partes del CSS pueden proceder de distintas bibliotecas o módulos.

::: mycode
[CSS]{.title}
```css
@layer main {
    p {
        color: blue;
    }
}

@layer componentes {
    p {
        color: red;
    }
}
```
:::

En el ejemplo anterior la capa "**componentes**" es más prioritaria que "main" por estar declarada después, por lo tanto el color del texto será rojo. También podemos especificar el orden de las capas sin importar después el orden de la declaración.


:::::::::::::: {.columns }
::: {.column width="50%"}

::: mycode
[Orden de capas]{.title}

```css
@layer componentes, main;
```
:::

:::
::: {.column width="50%" }

::: mycode
[Orden de capas]{.title}
```css
@layer componentes;
@layer main;
```
:::

:::
::::::::::::::


Ahora la capa "main" es más prioritaria (por añadirlo después en la declaración), y por tanto sus estilos son los que se aplican a misma especificidad.

::: exercisebox
[[03f](https://github.com/yuki/ejercicios/blob/main/daw/diw/03f.html)]{.solution}

Crea un CSS con capas y modifica el orden de la declaración para aplicar sus estilos.
:::


## Especificidad frente a orden {#especificidad-orden}

Teniendo en cuenta todo lo visto hasta ahora, las reglas que más prioridad tienen es por la especificidad, pero a misma especificidad quien gana es la regla que se declara última, siempre y cuando no haya de por medio una especificación de *layers*, que puede alterar el orden.


## Diferencia entre herencia y cascada {#diferencia-herencia-cascada}

La **herencia** y la **cascada** son conceptos relacionados, pero no son lo mismo. La herencia permite que determinadas propiedades pasen de un elemento padre a sus descendientes.

La cascada, en cambio, determina qué declaración CSS tiene prioridad cuando existen varias declaraciones que pueden aplicarse, y por tanto habrá que medir con la especificidad cuál gana.


Podemos resumirlo de esta manera:

| Concepto | Función |
|---|---|
| Herencia | Transmite determinadas propiedades desde los padres a los descendientes |
| Cascada | Decide qué declaración tiene prioridad |
| Especificidad | Ayuda a determinar qué selector tiene prioridad cuando varias reglas coinciden |

Table: {tablename=yukitblr colspec=X[1,l]X[4,l]}


# Unidades de medida {#unidades-de-medida}

Las propiedades CSS que controlan tamaños, distancias y dimensiones necesitan utilizar unidades de medida.

::: mycode
[Indicando tamaño]{.title}
```css
p {
    font-size: 20px;
}
```
:::


En este caso:

- [font-size]{.verbatim} indica el tamaño de la fuente.
- [20]{.verbatim} es el valor numérico.
- [px]{.verbatim} es la unidad de medida.

Las unidades permiten indicar al navegador cuánto debe medir un elemento, cuánto espacio debe ocupar o qué distancia debe existir entre diferentes elementos.

Las unidades CSS pueden clasificarse principalmente en:

- **Unidades absolutas**: representan una medida que no depende directamente del tamaño de otro elemento.
- **Unidades relativas**: dependen de alguna característica del documento, del elemento padre, del tamaño de la fuente o del tamaño de la ventana del navegador. Las unidades relativas son especialmente importantes para crear interfaces adaptables a diferentes tamaños de pantalla.


## Unidades absolutas {#unidades-absolutas}

Las principales unidades absolutas son:

| Unidad | Significado |
|---|---|
| [px]{.verbatim} | Píxel CSS |
| [cm]{.verbatim} | Centímetro |
| [mm]{.verbatim} | Milímetro |
| [in]{.verbatim} | Pulgada |
| [pt]{.verbatim} | Punto |
| [pc]{.verbatim} | Pica |
| [Q]{.verbatim}  | 1/40th of 1cm |

Table: {tablename=yukitblr colspec=X[1,l]X[4,l]}

En el desarrollo web habitual, [px]{.verbatim} es con diferencia la unidad absoluta más utilizada.

### El píxel CSS {#pixel-css}

La unidad [px]{.verbatim} representa un **píxel CSS**. Es importante no confundir necesariamente un píxel CSS con un píxel físico de la pantalla, ya que los dispositivos modernos pueden tener una densidad de píxeles muy elevada.

Por tanto, [px]{.verbatim} debe entenderse como una unidad de CSS y no simplemente como "un punto físico de la pantalla". Suele resultar muy útiles cuando queremos controlar con precisión determinados tamaños, y su uso habitual es en:

- Bordes.
- Iconos.
- Sombras.
- Pequeños espacios.
- Tamaños que necesitan un control concreto.

### Unidades físicas {#unidades-físicas}

CSS también proporciona unidades físicas como [cm]{.verbatim}, [mm]{.verbatim}, [in]{.verbatim} o [pt]{.verbatim}. Estas unidades pueden resultar especialmente interesantes cuando se trabaja con impresión.

::: mycode
[Indicando tamaño]{.title}
```css
@media print {
    .pagina { /* A4 */
        width: 21cm;
        min-height: 29.7cm;
    }
}
```
:::

::: infobox
Usar unidades físicas en pantallas no tiene sentido.
:::

## Unidades relativas {#unidades-relativas}

Las unidades de longitud relativas especifican una longitud en relación con otra propiedad de longitud. Las unidades de longitud relativas se adaptan mejor a diferentes medios de renderizado.

| Unidad | Significado |
|---|---|
| [em]{.verbatim} | Relativo al tamaño de fuente del elemento (2em significa 2 veces el tamaño de la fuente actual) |
| [rem]{.verbatim} | Relativo al tamaño de fuente del elemento raíz |
| [ex]{.verbatim} | Relativo a la altura-x de la fuente actual (poco usado) |
| [ch]{.verbatim} | Relativo al ancho del "0" (cero) de la fuente actual |
| [vw]{.verbatim} | Relativo al 1% del ancho de la ventana de visualización |
| [vh]{.verbatim} | Relativo al 1% de la altura de la ventana de visualización |
| [%]{.verbatim} | Relativo al elemento padre |

Table: {tablename=yukitblr colspec=X[1,l]X[4,l]}

Las medidas [vw]{.verbatim}, [vh]{.verbatim}, [vmin]{.verbatim} y [vmax]{.verbatim} tienen en cuenta la ventana del navegador. Si la ventana fuese 50cm de ancho entonces [1vw = 0.5cm]{.verbatim}.



### Unidad relativa [em]{.verbatim} {#unidad-relativa-em}

La unidad [em]{.verbatim} es una unidad relativa relacionada con el tamaño de la fuente. Los navegadores tienen un tamaño predefinido de 16px, que el usuario puede cambiar (por ejemplo, por problemas de visión).

Por ejemplo, si utilizamos:

::: mycode
[Indicando tamaño]{.title}
```css
p {
    font-size: 20px;
    margin: 2em;
}
```
:::

El valor de [2em]{.verbatim} está relacionado con el tamaño indicado, y por tanto será 40px. Pero si no se indica la primera regla, por defecto se coge el valor del navegador, y por tanto serán 32px.

::: exercisebox
[[03g](https://github.com/yuki/ejercicios/blob/main/daw/diw/03g.html)]{.solution}

Comprueba el valor relativo de [em]{.verbatim}:

- Indicando un tamaño de fuente en el CSS.
- Usando el valor por defecto del navegador.
- Busca la configuración del navegador y cambialo a 32px y comprueba los cambios.
:::


Si indicamos el tamaño de la fuente en el [body]{.verbatim}, después podemos utilizar [em]{.verbatim} para hacer relativo el resto de tamaños.

::: mycode
[Indicando tamaño]{.title}
```css
body {
    font-size: 16px;
}
h1 {
    font-size: 2em;
}
```
:::


#### El problema de la acumulación de [em]{.verbatim} {#problema-acumulación-em}

Una característica importante de [em]{.verbatim} es que puede acumularse cuando existen elementos anidados. Analiza el siguiente ejemplo:


:::::::::::::: {.columns }
::: {.column width="50%"}

::: mycode
[HTML]{.title}

```html
<div>
    Texto
    <div>
        Texto interior
    </div>
</div>
```
:::

:::
::: {.column width="50%" }

::: mycode
[CSS]{.title}
```css
body {
    font-size: 16px;
}
div {
    font-size: 1.5em;
}
```
:::

:::
::::::::::::::


::: questionbox
¿Qué tamaño tendrá el "texto interior"?
:::


El segundo [<div>]{.verbatim} utiliza como referencia el tamaño de fuente de su padre, que es otro [<div>]{.verbatim}, que a su vez tiene una fuente relativa partiendo de 16px. El resultado sería:

- Tamaño original: 16px
- Primer [<div>]{.verbatim}: 16x1.5 = 24px
- Segundo [<div>]{.verbatim}: 24x1.5 = 36px

Esto puede ser útil en determinados casos, pero también puede complicar el control de los tamaños.

::: errorbox
La unidad [em]{.verbatim} es relativa y acumulativa, lo que puede llevar a problemas.
:::


::: exercisebox
[[03h](https://github.com/yuki/ejercicios/blob/main/daw/diw/03h.html)]{.solution}

Realiza el ejemplo anterior y analiza el resultado.
:::


### Unidad relativa [rem]{.verbatim} {#unidad-relativa-rem}

La unidad [rem]{.verbatim} también es relativa al tamaño de la fuente, pero toma como referencia el elemento raíz del documento. La unidad [rem]{.verbatim} viene de **root em**, y la raíz del documento HTML es normalmente [<html>]{.verbatim}.


:::::::::::::: {.columns }
::: {.column width="50%"}

::: mycode
[HTML]{.title}

```html
<h1>Título 1</h1>
<div>
    <h1>Título 2</h1>
</div>
```
:::

:::
::: {.column width="50%" }

::: mycode
[CSS]{.title}
```css
html {
    font-size: 16px;
}
div {
    font-size: 2rem;
}
h1 {
    font-size: 2rem;
}
```
:::

:::
::::::::::::::

::: questionbox
¿Qué tamaño tendrán los [h1]{.verbatim}?
:::

::: exercisebox
[[03i](https://github.com/yuki/ejercicios/blob/main/daw/diw/03i.html)]{.solution}

Realiza el ejemplo anterior y analiza el resultado.
:::


La ventaja de [rem]{.verbatim} respecto a [em]{.verbatim} es que permite crear una escala de tamaños de manera sencilla y clara.

::: mycode
[CSS]{.title}
```css
html  { font-size: 16px; }
h1    { font-size: 2rem; }
h2    { font-size: 1.5rem; }
p     { font-size: 1rem; }
small { font-size: 0.875rem; }
```
:::

La relación entre los tamaños se mantiene respecto a una única referencia, lo que facilita modificar posteriormente la escala general.


### Unidad relativa [ch]{.verbatim} {#unidad-relativa-ch}

La unidad [ch]{.verbatim} está relacionada con el ancho del carácter [0]{.verbatim} de la fuente utilizada. Por ejemplo:

::: mycode
[CSS]{.title}
```css
p {
    max-width: 60ch;
}
```
:::

Esto permite limitar aproximadamente la anchura de una línea de texto.  Es especialmente útil para mejorar la legibilidad de textos largos. De esta forma evitamos que los párrafos ocupen líneas excesivamente largas y nos aseguramos el tamaño que va a tener.


### Unidad relativa [ex]{.verbatim} {#unidad-relativa-ex}

La unidad [ex]{.verbatim} está relacionada con la altura de la letra [x]{.verbatim} de la fuente actual. Por ejemplo:

::: mycode
[CSS]{.title}
```css
.elemento {
    height: 5ex;
}
```
:::

Su uso es mucho menos frecuente que [em]{.verbatim}, [rem]{.verbatim}, o [ch]{.verbatim}.

Para los desarrollos habituales podemos conocer su existencia sin necesidad de utilizarla habitualmente.




### Porcentajes {#porcentajes}

El símbolo `%` representa una unidad relativa y su valor depende del contexto en el que se utilice. En muchas propiedades, el porcentaje se calcula utilizando como referencia el elemento contenedor.


:::::::::::::: {.columns }
::: {.column width="50%"}

::: mycode
[HTML]{.title}

```html
<div class="contenedor">
    <div class="caja"></div>
</div>
```
:::

:::
::: {.column width="50%" }

::: mycode
[CSS]{.title}
```css
.contenedor {
    width: 800px;
}

.caja {
    width: 50%;
}
```
:::

:::
::::::::::::::


El elemento "contenedor" tiene un tamaño fijado de 800px y la caja dentro de él una anchura del 50% del tamaño de referencia correspondiente, es decir, la mitad.

::: infobox
Los porcentajes son muy útiles para crear diseños adaptables.
:::


El significado exacto de un porcentaje depende de la propiedad donde se utilice.

::: mycode
[CSS]{.title}
```css
.caja {
    padding: 10%;
}
```
:::


No se interpreta exactamente igual la propiedad anterior, por lo que conviene leer la [documentación](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference/Values/percentage).

::: warnbox
El uso del porcentaje depende de la propiedad concreta y del contexto.
:::



### Unidades relacionadas con el *viewport* {#unidades-relacionadas-viewport}

CSS también proporciona unidades relativas al tamaño de la ventana del navegador. El ***[viewport](#viewport)*** es, de forma simplificada, el área visible de la página. Las unidades tradicionales relacionadas con él son:

- [vw]{.verbatim}: significa ***viewport width*** y representa el 1% del **ancho** del *viewport*, por lo que [100vh]{.verbatim} es el 100% de la anchura del *viewport*.
- [vh]{.verbatim}: significa ***viewport height*** y representa el 1% de la **altura** del *viewport*, por lo que [100vh]{.verbatim} es el 100% de la altura del *viewport*.

::: mycode
[CSS]{.title}
```css
.elemento {
    width: 100vw;
    height: 100vh;
}
```
:::

Sin embargo, en aplicaciones reales no siempre es necesario utilizar [100vw]{.verbatim} para el ancho, ya que puede producir problemas cuando aparecen barras de desplazamiento.

Existen otras unidades explicadas en la [documentación](https://developer.mozilla.org/en-US/docs/Web/CSS/Guides/Values_and_units/Numeric_data_types\#dimensions)

| Unit |	Relative to |
|:----|:----|
| [dvh]{.verbatim} | 1% of the dynamic viewport's height. |
| [dvw]{.verbatim} | 1% of the dynamic viewport's width. |
| [lvh]{.verbatim} | 1% of the large viewport's height. |
| [lvw]{.verbatim} | 1% of the large viewport's width. |
| [svh]{.verbatim} | 1% of the small viewport's height. |
| [svw]{.verbatim} | 1% of the small viewport's width. |
| [vb]{.verbatim} | 1% of viewport's size in the root element's block axis. |
| [vh]{.verbatim} | 1% of viewport's height. |
| [vw]{.verbatim} | 1% of viewport's width. |
| [vi]{.verbatim} | 1% of viewport's size in the root element's inline axis. |
| [vmax]{.verbatim} | 1% of viewport's larger dimension. |
| [vmin]{.verbatim} | 1% of viewport's smaller dimension. |


Table: {tablename=yukitblr colspec=X[1,l]X[4,l]}

Más adelante veremos en profundidad qué es y cómo funciona el [*Viewport*](#viewport).

## Unidades para ángulos {#unidades-ángulos}

CSS también utiliza unidades para representar ángulos. Las principales son:

- [deg]{.verbatim}: grados.
- [rad]{.verbatim}: radianes.
- [grad]{.verbatim}: grados centesimales.
- [turn]{.verbatim}: vueltas.


:::::::::::::: {.columns }
::: {.column width="50%"}

::: mycode
[Rotación]{.title}

```css
.elemento {
    transform: rotate(45deg);
}
```
:::

:::
::: {.column width="50%" }

::: mycode
[Rotación]{.title}
```css
.elemento {
    transform: rotate(0.5turn);
}
```
:::

:::
::::::::::::::

En la siguiente tabla se ven varios ejemplos y sus equivalencias de la documentación de [MDN](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference/Values/angle).

| Rotación | Equivalencias |
|:----|:----|
| ![](img/diw/angle90.png){width=50%}      | [90deg = 100grad = 0.25turn ≈ 1.5708rad]{.verbatim} |
| ![](img/diw/angle180.png){width=50%}     | [180deg = 200grad = 0.5turn ≈ 3.1416rad]{.verbatim} |
| ![](img/diw/angleminus90.png){width=50%} | [-90deg = -100grad = -0.25turn ≈ -1.5708rad]{.verbatim} |

Table: {tablename=yukitblr colspec=X[1,l]X[4,l]}



::: exercisebox
[[03j](https://github.com/yuki/ejercicios/blob/main/daw/diw/03j.html)]{.solution}

Crea dos elementos con una anchura de 200px y usa la rotación con distintas unidades.
:::


## Unidades de tiempo {#unidades-tiempo}

Algunas propiedades CSS utilizan unidades de tiempo. Estas unidades se utilizarán especialmente cuando estudiemos transiciones y animaciones CSS. Las principales son:

- [s]{.verbatim}: segundos.
- [ms]{.verbatim}: milisegundos.

:::::::::::::: {.columns }
::: {.column width="50%"}

::: {.mycode size="footnotesize"}
[Transiciones]{.title}

```css
.boton {
    transition: background-color 0.3s;
}
```
:::

:::
::: {.column width="50%" }

::: {.mycode size="footnotesize"}
[Transiciones]{.title}
```css
.boton {
    transition: background-color 300ms;
}
```
:::

:::
::::::::::::::

Ambos valores representan la misma duración.



<!-- 
TODO: poner esto?
## Unidades de frecuencia {#unidades-frecuencia}

CSS también define unidades relacionadas con frecuencias:

```text
Hz
kHz
```

Por ejemplo:

```css
audio {
    /* Ejemplo conceptual */
}
```

Sin embargo, actualmente tienen una utilización muy reducida en el desarrollo web habitual.

No es necesario utilizarlas en los primeros desarrollos con CSS. -->


## Valores sin unidad {#valores-sin-unidad}

Algunas propiedades CSS aceptan números sin unidad.

:::::::::::::: {.columns }
::: {.column width="50%"}

::: mycode
[Opacidad]{.title}

```css
.elemento {
    opacity: 0.5;
}
```
:::

:::
::: {.column width="50%" }

::: mycode
[altura]{.title}
```css
.elemento {
    line-height: 1.5;
}
```
:::

:::
::::::::::::::

En estos ejemplos no es necesario poner unidad ya que:

- [opacity]{.verbatim}: utiliza un número comprendido normalmente entre 0 y 1.
- [line-height]{.verbatim}: es una propiedad que puede aceptar no tener unidad.



## El valor [0]{.verbatim} {#valor-0}

En muchas propiedades CSS, cuando el valor es cero, la unidad puede omitirse. 

::: mycode
[0 sin usar unidad]{.title}
```css
.elemento {
    margin: 0;
    padding: 0;
    border-width: 0;
}
```
:::

En estos casos no hace falta poner ninguna unidad por haber puesto cero, mientras que si fuese otra cantidad sí habría que poner [px]{.verbatim}, [em]{.verbatim} o cualquier otra.


## Medidas calculadas automáticamente {#medidas-calculadas}

En CSS moderno, por la aparición de móviles y *tablets* hizo que el diseño *responsive* se haya vuelto imprescindible, y por tanto el hacer uso de medidas relativas es imprescindible. A eso se le suma el poder realizar cálculos automáticos de medidas.


### [Calc()]{.verbatim} {#calc}

CSS permite realizar cálculos utilizando diferentes unidades mediante la función [calc()]{.verbatim}.

::: mycode
[Calcular anchura automáticamente]{.title}
```css
.caja {
    width: calc(100% - 40px);
}
```
:::

Con esta regla estamos indicando que el ancho va a ser "ancho disponible menos 40px", y de esta manera no tenemos que forzar la anchura, ya que es relativa y calculada.

La función [calc()]{.verbatim} admite las cuatro operaciones básicas: sumar ([+]{.verbatim}), restar ([-]{.verbatim}), multiplicar ([*]{.verbatim}) y dividir ([/]{.verbatim}).


### [min()]{.verbatim} y [max()]{.verbatim} {#min-y-max}

CSS moderno también proporciona dos funciones para calcular el tamaño:

- [min()]{.verbatim}: utiliza el menor de los valores proporcionados.
- [max()]{.verbatim}: utiliza el mayor de los valores proporcionados.

Ambas funciones permiten uno o más parámetros separados por comas.

:::::::::::::: {.columns }
::: {.column width="50%"}

::: mycode
[min()]{.title}

```css
.caja {
    width: min(90%, 1000px);
}
```
:::

:::
::: {.column width="50%" }

::: mycode
[max()]{.title}
```css
.caja {
    width: max(300px, 50%);
}
```
:::

:::
::::::::::::::

El primer ejemplo permite utilizar el menor de los valores proporcionados. Por tanto:

- En pantallas pequeñas puede utilizar el `90%`.
- En pantallas grandes no superará los `1000px`.

En el segundo ejemplo, con [max()]{.verbatim}, utilizará el mayor de los dos valores.


### [clamp()]{.verbatim} {#clamp}

Una función especialmente útil para diseños adaptables es [clamp()]{.verbatim}. Su [sintaxis](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference/Values/clamp\#parameters) acepta tres parámetros, [clamp(min, val, max)]{.verbatim}:

- **min**: Si el valor preferido es menor que este valor, se utilizará el valor mínimo.
- **val**: El valor preferido es la expresión cuyo valor se utilizará siempre que el resultado esté entre los valores mínimo y máximo. Suele ser un valor relativo.
- **max**: El valor máximo es el valor de expresión más grande (más positivo) al que se asignará el valor de la propiedad si el valor preferido es mayor que este límite superior.


::: mycode
[max()]{.title}
```css
h1 {
    font-size: clamp(2rem, 5vw, 4rem);
}
```
:::


El tamaño de este ejemplo:

- Nunca será inferior a [2rem]{.verbatim}.
- Intentará utilizar    [5vw]{.verbatim}.
- Nunca será superior a [4rem]{.verbatim}.

Esto permite crear tamaños que se adapten progresivamente al espacio disponible.

