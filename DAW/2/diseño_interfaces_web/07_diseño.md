
# [display]{.verbatim} {#display}

La propiedad **[display]{.verbatim}** determina cómo se representa un elemento HTML dentro del documento. Es una de las propiedades más importantes de CSS, ya que controla si un elemento ocupa toda la línea, se comporta como texto, puede alinearse con otros elementos o incluso si desaparece completamente del flujo de la página.

Ya hemos visto previamente que los elementos se pueden diferenciar entre elementos de [bloque](#elementos-bloque) y elementos [en línea](#elementos-en-línea), sin embargo CSS permite modificar este comportamiento mediante la propiedad [display]{.verbatim}.

Los valores que podemos poner a [display]{.verbatim} son:

| Valor | Uso principal |
|--------|---------------|
| [block]{.verbatim} | Elemento de bloque |
| [inline]{.verbatim} | Elemento en línea |
| [inline-block]{.verbatim} | Mezcla de bloque y línea |
| [none]{.verbatim} | Oculta el elemento |
| [flex]{.verbatim} | Contenedor Flexbox |
| [inline-flex]{.verbatim} | Flexbox en línea |
| [grid]{.verbatim} | Contenedor Grid |
| [inline-grid]{.verbatim} | Grid en línea |


En esta unidad nos centraremos en los cuatro primeros. Flexbox y Grid se estudiarán en las siguientes unidades.



## [display: block]{.verbatim} {#display-block}

Podemos convertir cualquier elemento en un elemento de bloque.

:::::::::::::: {.columns columnsep=0.5cm}
::: {.column width="50%"}

::: {.mycode}
[HTML]{.title}
```html
<span>Inicio</span>
```
:::

:::
::: {.column width="50%" }

::: {.mycode}
[CSS]{.title}
```css
span {
    display: block;
}
```
:::

:::
::::::::::::::


Ahora el [<span>]{.verbatim} comenzará en una línea nueva y ocupará todo el ancho disponible. Este recurso es muy útil para convertir enlaces o elementos en línea en componentes más grandes.


## [display: inline]{.verbatim} {#display-inline}

Podemos convertir un elemento de bloque en un elemento en línea.

:::::::::::::: {.columns columnsep=0.5cm}
::: {.column width="50%"}

::: {.mycode}
[HTML]{.title}
```html
<div>Uno</div>
<div>Dos</div>
<div>Tres</div>
```
:::

:::
::: {.column width="50%" }

::: {.mycode}
[CSS]{.title}
```css
div {
    display: inline;
}
```
:::

:::
::::::::::::::

El resultado serán los tres elementos en una única línea, uno junto a otro. Sin embargo, presentan una limitación importante: **no respetan correctamente [width]{.verbatim} ni [height]{.verbatim}**, ya que los elementos en línea se dimensionan principalmente según su contenido. Cuando necesitamos controlar el tamaño suele utilizarse [inline-block]{.verbatim} que veremos a continuación.



## [display: inline-block]{.verbatim} {#display-inline-block}

La opción [inline-block]{.verbatim} combina las ventajas de ambos modelos. Características:

- Se coloca en la misma línea que otros elementos.
- Permite definir [width]{.verbatim} y [height]{.verbatim}.
- Respeta [padding]{.verbatim} y [margin]{.verbatim}.


::: mycode 
[CSS]{.title}
```css
.boton {
    display: inline-block;
    width: 140px;
    padding: 12px;
    border: 1px solid black;
}
```
:::

Es una propiedad muy utilizada para crear botones y pequeños componentes antes de la popularización de Flexbox.


## [display: none]{.verbatim} {#display-none}

El valor [none]{.verbatim} elimina completamente el elemento del flujo del documento.


:::::::::::::: {.columns columnsep=0.5cm}
::: {.column width="50%"}

::: {.mycode}
[HTML]{.title}
```html
<p>Primer párrafo</p>
<p class="oculto">Segundo</p>
<p>Tercer párrafo</p>
```
:::

:::
::: {.column width="50%" }

::: {.mycode}
[CSS]{.title}
```css
.oculto {
    display: none;
}
```
:::

:::
::::::::::::::



El segundo párrafo desaparece y deja de ocupar espacio.

### Diferencia entre [display: none]{.verbatim} y [visibility: hidden]{.verbatim} {#diferencias-display-visibility}

Aunque ambas propiedades ocultan elementos, su comportamiento es diferente.

- [display: none]{.verbatim}
  - No se muestra.
  - No ocupa espacio.
  - Desaparece del flujo del documento.
- [visibility: hidden]{.verbatim}
  - No se muestra.
  - **Sí ocupa espacio**.
  - El resto de elementos mantiene su posición.

Estudiaremos [visibility]{.verbatim} con detalle más adelante.


## Valores: [flex]{.verbatim} y [grid]{.verbatim} {#valores-flex-grid}

Además de los valores clásicos, [display]{.verbatim} activa sistemas completos de maquetación.

- [display: flex]{.verbatim}: Convierte el elemento en un contenedor flexible.
- [display: grid]{.verbatim}: Convierte el elemento en un contenedor de rejilla.


Estos dos modelos los veremos en profundidad más adelante.


## Valores: [inline-flex]{.verbatim} y [inline-grid]{.verbatim} {#valores-inline-flex-inline-grid}

También existen versiones en línea. Se comportan como un elemento en línea respecto al documento, pero su contenido interno utiliza Flexbox o Grid. Son útiles para pequeños componentes como grupos de botones o iconos.


## Cambiar el comportamiento de un elemento {#cambiar-comportamiento-elemento}

Uno de los puntos fuertes de CSS es que el comportamiento visual puede modificarse sin alterar el HTML. Por ejemplo, un menú estilo *navbar* puede escribirse como una lista:


::: {.mycode}
[HTML]{.title}
```html
<ul>
    <li>Inicio</li>
    <li>Productos</li>
    <li>Contacto</li>
</ul>
```
:::


Posteriormente, CSS puede convertir sus elementos en una distribución horizontal mediante [display]{.verbatim}. Esto permite mantener un HTML semántico y utilizar CSS únicamente para la presentación.


::: exercisebox
[[06a](https://github.com/yuki/ejercicios/blob/main/daw/diw/06a.html)]{.solution}

Comprueba las diferencias entre los elementos de bloque y los elementos en línea y cómo afecta [display]{.verbatim} con [block]{.verbatim}, [inline]{.verbatim} y [inline-block]{.verbatim} a su comportamiento. Trata de hacer un *navbar* con una lista.
:::


# [position]{.verbatim}

Por defecto, los elementos HTML aparecen en el mismo orden en que están escritos en el documento. El navegador los coloca uno detrás de otro respetando el flujo normal de la página.

La propiedad **[position]{.verbatim}** permite modificar ese comportamiento y controlar la posición exacta de un elemento. Gracias a ella podemos crear menús fijos, ventanas emergentes, etiquetas sobre imágenes o elementos que permanezcan visibles durante el desplazamiento de la página.

Los valores disponibles son:

| Valor | Descripción |
|--------|-------------|
| [static]{.verbatim} | Posición normal |
| [relative]{.verbatim} | Desplazamiento respecto a su posición original |
| [absolute]{.verbatim} | Posición absoluta respecto a un ancestro |
| [fixed]{.verbatim} | Posición fija respecto a la ventana |
| [sticky]{.verbatim} | Combinación de relativa y fija |

Cada uno modifica la forma en la que el navegador calcula la posición del elemento. Para mover un elemento también se utilizan las propiedades [top]{.verbatim}, [right]{.verbatim}, [bottom]{.verbatim} y [left]{.verbatim} que veremos en los ejemplos para posicionar el elemento.


## Flujo normal del documento {#flujo-normal}

Observemos un documento sencillo.

::: {.mycode}
[HTML]{.title}
```html
<header>Cabecera</header>

<main>Contenido</main>

<footer>Pie de página</footer>
```
:::


Sin aplicar ninguna propiedad de posicionamiento, el navegador coloca los elementos siguiendo el orden del HTML. Este comportamiento recibe el nombre de **flujo normal del documento** (*[Normal Flow](https://developer.mozilla.org/en-US/docs/Learn_web_development/Core/CSS_layout/Introduction\#normal_layout_flow)*).

Todos los elementos tienen inicialmente [position: static]{.verbatim}.


## [position: static]{.verbatim} {#position-static}

Es el valor por defecto. El elemento permanece dentro del flujo normal y las propiedades [top]{.verbatim}, [right]{.verbatim}, [bottom]{.verbatim} y [left]{.verbatim} son ignoradas.


::: {.mycode}
[CSS]{.title}
```css
div {
    position: static;
    top: 50px;
}
```
:::

En este ejemplo, [top]{.verbatim} no producirá ningún efecto. Normalmente no es necesario escribir [position: static]{.verbatim}, ya que todos los elementos lo poseen inicialmente.


## [position: relative]{.verbatim} {#position-relative}

El valor [relative]{.verbatim} desplaza un elemento **respecto a su posición original**.


:::::::::::::: {.columns columnsep=0.5cm}
::: {.column width="50%"}

::: mycode
[HTML]{.title}
```html
<div class="caja">
    Caja
</div>
```
:::

:::
::: {.column width="50%" }

::: mycode
[CSS]{.title}
```css
.caja {
    position: relative;
    top: 20px;
    left: 20px;
}
```
:::

:::
::::::::::::::


El resultado es que la caja se mueve [20px]{.verbatim} hacia la derecha y arriba (**añade 20px a la izquierda y arriba del elemento**). Lo importante es que **su espacio original sigue existiendo**. Es decir, el resto de elementos continúa comportándose como si la caja no se hubiera movido.

![Ejemplo de [position: relative]{.verbatim}](img/diw/position-relative.png){width=50%}

::: infobox
Las propiedades [top]{.verbatim}, [right]{.verbatim}, [bottom]{.verbatim} y [left]{.verbatim} tienen en cuenta el espacio a ese lado del elemento.
:::


Además de pequeños desplazamientos, [relative]{.verbatim} tiene una función muy importante: **servir de referencia para elementos absolutos**, que veremos después.

## [position: absolute]{.verbatim} {#position-absolute}

Un elemento absoluto sale del flujo normal del documento.

:::::::::::::: {.columns columnsep=0.5cm}
::: {.column width="50%"}

::: mycode
[HTML]{.title}
```html
<div class="padre">
    <div class="hijo"></div>
</div>
```
:::

:::
::: {.column width="50%" }

::: mycode
[CSS]{.title}
```css
.padre {
    position: relative;
}

.hijo {
    position: absolute;
    top: 20px;
    left: 10px;
}
```
:::

:::
::::::::::::::


La caja hija aparecerá situada un poco hacia abajo y la derecha del elemento padre. El resto de elementos actuarán como si el hijo no ocupase espacio.

![Ejemplo de [position: absolute]{.verbatim}](img/diw/position-absolute.png){width=50%}

Un elemento absoluto busca el **primer ancestro cuyo [position]{.verbatim} no sea [static]{.verbatim}**, y en caso de no haber, la referencia será toda la página. Por eso es muy habitual ver una combinación como la que aparece en el ejemplo.


::: infobox
Un elemento absoluto busca el **primer ancestro cuyo [position]{.verbatim} no sea [static]{.verbatim}**.
:::

::: errorbox
Si ningún ancestro está posicionado, la referencia será toda la página.
:::


Pongamos otro ejemplo, esta vez con un texto superpuesto a una imagen:

:::::::::::::: {.columns columnsep=0.5cm}
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```html
<div class="producto">
    <img src="camiseta.jpg" alt="">
    <span class="oferta">-20%</span>
</div>
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[CSS]{.title}
```css
.producto {
    position: relative;
}

.oferta {
    position: absolute;
    top: 10px;
    left: 10px;
    background: crimson;
    color: white;
}
```
:::

:::
::::::::::::::


## [position: fixed]{.verbatim} {#position-fixed}

Un elemento fijo permanece siempre en la misma posición de la ventana del navegador. Aunque el usuario haga scroll, el menú continuará visible.

::: mycode
[CSS]{.title}
```css
.menu {
    position: fixed;

    top: 0;
    left: 0;
}
```
:::


Los elementos fijos se utilizan para:

- Cabeceras.
- Botones de volver arriba.
- Chats flotantes.
- Barras de navegación.

También salen del flujo normal del documento.


## [position: sticky]{.verbatim} {#position-sticky}

El valor [sticky]{.verbatim} combina el comportamiento de [relative]{.verbatim} y [fixed]{.verbatim}. Inicialmente el elemento se comporta como uno normal. Cuando alcanza una determinada posición durante el desplazamiento, queda fijado.


::: mycode
[CSS]{.title}
```css
aside {
    position: sticky;
    top: 20px;
}
```
:::


El elemento permanecerá pegado a [20px]{.verbatim} del borde superior mientras exista espacio dentro de su contenedor. Es muy útil para índices y barras laterales.



::: exercisebox
[[06b](https://github.com/yuki/ejercicios/blob/main/daw/diw/06b.html)]{.solution}

Usa la propiedad [position]{.verbatim} para crear los siguientes ejemplos:

- Caja con posición **estática**.
- Añade a una imagen un texto de "Descuento" con posición **relativa** abajo-izquierda.
- Crea un *navbar* que esté *fixed* arriba.
- Crea un mensaje de "aviso" que sea [sticky]{.verbatim} mientras vemos unos párrafos.
:::


::: questionbox
¿Qué hay "raro" al hacer scroll en este ejercicio? Lo solucionaremos en el ejercicio **6d**.
:::


# [float]{.verbatim} (visión histórica)

Antes de la aparición de **Flexbox** y **CSS Grid**, la propiedad [[float]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference/Properties/float) era la herramienta más utilizada para crear diseños con columnas, menús horizontales y distribuciones complejas. Durante más de una década fue prácticamente la única solución disponible para maquetar páginas web, aunque realmente fue diseñada con un objetivo muy diferente.

Hoy en día [float]{.verbatim} **ya no se utiliza para crear maquetaciones**, pero sigue formando parte del estándar CSS y todavía resulta útil para rodear imágenes con texto (su finalidad original), igual que en un procesador de textos, tal como se ve en revistas y periódicos.


La propiedad admite cuatro valores principales:

| Valor | Descripción |
|--------|-------------|
| [left]{.verbatim} | Flota hacia la izquierda |
| [right]{.verbatim} | Flota hacia la derecha |
| [none]{.verbatim} | Sin flotación |
| [inline-start]{.verbatim} / [inline-end]{.verbatim} | Versiones adaptadas a la dirección del texto (uso menos frecuente) |

Con [left]{.verbatim} y [right]{.verbatim} el elemento se desplazará al lado izquierdo y derecho respectivamente, y el texto (o elementos posteriores) ocuparán ese espacio dejado. **Es el uso principal hoy día**.


:::::::::::::: {.columns columnsep=0.5cm}
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```html
<img src="moon.jpg" class="foto">

<p>Lorem ipsum dolor...</p>
<p>Lorem ipsum dolor...</p>

```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[CSS]{.title}
```css
.foto {
    float: left;
    margin-right: 1rem;
    margin-bottom: 0.5rem;
}
```
:::

:::
::::::::::::::


Cuando un elemento flota:

- Sale parcialmente del flujo normal.
- Se desplaza hacia un lateral.
- Los elementos posteriores intentan rodearlo.


::: exercisebox
[[06c](https://github.com/yuki/ejercicios/blob/main/daw/diw/06c.html)]{.solution}

Usa la propiedad [float]{.verbatim} para rodear dos imágenes, una colocándola a la izquierda, y la otra a la derecha.
:::


## Usos históricos {#usos-históricos}

Debido a la falta de otros sistemas, durante los años 2000 [float]{.verbatim} se utilizaba para crear maquetación para la que no había sido diseñado, sobre todo la creación de columnas. Aunque visualmente funcionaba, generaba muchos problemas de mantenimiento.

Entre los inconvenientes más famosos era el colapso del contenedor, en el que el elemento padre dejaba de reconocer la altura y por tanto el elemento se desplazaba.

Debido a ello, empezaron a crearse *hacks* para tratar de mejorar la maquetación y evitar estos problemas, que hoy día están obsoletos debido a la aparición de **Flexbox** y **Grid**.


::: errorbox
No se debería usar [float]{.verbatim} para realizar maquetaciones, sólo para rodear una imagen por texto.
:::


# La propiedad [z-index]{.verbatim} {#z-index}

En muchas interfaces web existen elementos que se superponen entre sí: ventanas modales, menús desplegables, cabeceras fijas, etiquetas sobre imágenes o botones flotantes. Cuando dos elementos ocupan la misma zona de la pantalla, el navegador necesita decidir **cuál se dibuja por encima**.

La propiedad **[z-index]{.verbatim}** controla el orden de apilamiento (*stacking order*) de los elementos posicionados. Cuanto mayor sea su valor, más arriba aparecerá el elemento respecto a los demás.

Por defecto, los elementos HTML se dibujan siguiendo el orden del documento: los que aparecen más tarde en el HTML suelen representarse encima cuando existe superposición. Este comportamiento puede modificarse mediante [z-index]{.verbatim}.

La letra Z viene de la representación tridimensional. En diseño gráfico bidimensional se usan dos ejes: **X** para horizontal e **Y** para vertical. Si añadimos el tercer eje **Z** sería el orden de dibujado.


## Cómo modificar [z-index]{.verbatim} {#cómo-modificar-z-index}

El valor de [z-index]{.verbatim} puede ser positivo, cero o negativo. Cuanto mayor sea el número más arriba se dibujará el elemento, pero sólo afecta **sobre elementos posicionados con [position]{.verbatim}** (salvo el valor [static]{.verbatim}).


:::::::::::::: {.columns columnsep=0.5cm}
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```html
<div class="caja roja"></div>
<div class="caja azul"></div>
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[CSS]{.title}
```css
.caja {
    position: relative;
    width: 120px;
    height: 120px;
}
.roja {
    background: crimson;
    z-index: 20;
}

.azul {
    background: royalblue;
    z-index: 10;
    left: 60px;
    top: -60px;
}
```
:::

:::
::::::::::::::


Las dos cajas se superponen parcialmente. Si no existe [z-index]{.verbatim}, el orden dependerá del flujo del documento. En el momento en el que se añade un valor a la propiedad, se tendrá en cuenta para dibujar las cajas, en este caso aparecerá la roja encima de la azul, debido al **valor numérico**.

![A la izquierda sin [z-index]{.verbatim}, a la derecha con [z-index]{.verbatim}](img/diw/z-index.png){width=80%}


Si ambos elementos tuviesen el mismo valor, se mantendrá el orden de HTML, el elemento escrito más tarde se dibujará encima.

::: infobox
El uso más habitual de [z-index]{.verbatim} es en ventanas *modals*, *navbar*, menús desplegables, ... para asegurar que siempre están "por encima" del resto del documento.
:::


## Contexto de apilamiento {#contexto-apilamiento}

Un concepto importante es el **[stacking context](https://developer.mozilla.org/en-US/docs/Web/CSS/Guides/Positioned_layout/Stacking_context)** o contexto de apilamiento, que es cuando un elemento crea su propio contexto, los [z-index]{.verbatim} de sus hijos solo se comparan entre ellos.

En la documentación de [MDN](https://developer.mozilla.org/en-US/docs/Web/CSS/Guides/Positioned_layout/Understanding_z-index\#impact_of_stacking_contexts) hay un ejemplo en el que se explica el apilamiento:

:::::::::::::: {.columns columnsep=0.5cm}
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```html
<section>
  <div id="div1">#1</div>
  <div id="div2">#2</div>
</section>
<div id="div3">#3</div>
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[CSS]{.title}
```css
/*...*/
#div1 {
  z-index: 5;
}

#div2 {
  z-index: -9;
}

#div3 {
  z-index: 0;
}
section {
  position: absolute;
  z-index: 2;
}
```
:::

:::
::::::::::::::


En este ejemplo hay dos contextos: uno dentro de "section" (entre "div1" y "div2"), y otro entre "section" y "div3". Ambos se calculan por separado, y dentro de cada contexto tienen en cuenta sus propios valores.

::: questionbox
¿Cuál crees que es el orden de dibujado del ejemplo anterior?
:::

::: exercisebox
[[06d](https://github.com/yuki/ejercicios/blob/main/daw/diw/06d.html)]{.solution}

- Usa la propiedad [z-index]{.verbatim} para ver el ejemplo puesto previamente. Comprueba el comportamiento al añadir y quitar la propiedad.
- Arregla del ejercicio **6b** el problema que había con el scroll y el *navbar*.
- Comprueba si has acertado tu respuesta al contexto de apilamiento.
:::


Los contextos de apilamiento pueden ser creados, por distintas propiedades que aparecen en la documentación de [MDN](https://developer.mozilla.org/en-US/docs/Web/CSS/Guides/Positioned_layout/Stacking_context), como por ejemplo:

- Elementos posicionados con [z-index]{.verbatim}.
- [opacity]{.verbatim} inferior a 1.
- Algunas transformaciones ([transform]{.verbatim}).
- [filter]{.verbatim} y otras propiedades gráficas.


## Escala de apilamiento {#escala-apilamiento}

No existe una numeración oficial, pero muchos proyectos utilizan una escala organizada para distintos elementos:

| Elemento | Valor orientativo |
|----------|-------------------|
| Contenido normal | 1 |
| Tarjetas | 10 |
| Cabecera fija | 100 |
| Menús | 200 |
| Modal | 1000 |
| Diálogos críticos | 2000 |


Lo importante no es el número exacto, sino mantener una jerarquía coherente. También es importante dejar buena separación entre los distintos valores, por si más adelante queremos añadir en medio nuevos contextos.

::: questionbox
¿Cuál es el valor mínimo y máximo? ¡Depende! Ya que el valor es un "integer", y por tanto depende del sistema operativo y/o navegador.
:::



# La propiedad [visibility]{.verbatim} {#vibility}

En desarrollo web existen varias formas de ocultar un elemento. La más conocida es [display: none]{.verbatim}, pero no siempre es la opción adecuada. En muchas ocasiones necesitamos que un elemento **desaparezca visualmente sin modificar la distribución del documento**.

La propiedad **[visibility]{.verbatim}** controla precisamente eso: permite hacer invisible un elemento **manteniendo el espacio que ocupa** dentro de la página. Es una propiedad sencilla, pero muy útil en animaciones, tablas, interfaces dinámicas y componentes interactivos.

Los valores más importantes son:


| Valor | Descripción |
|--------|-------------|
| [visible]{.verbatim} | El elemento se muestra |
| [hidden]{.verbatim} | El elemento se oculta, pero conserva su espacio |
| [collapse]{.verbatim} | Comportamiento especial para tablas |

El valor por defecto de todos los elementos es [visible]{.verbatim}, por lo que no es necesario indicarlo ni se explicará. El uso más habitual es:

- Ocultar temporalmente información manteniendo el diseño.
- Mostrar y ocultar componentes sin desplazar otros elementos.
- Interfaces con estados visibles/invisibles.
- Tablas donde determinadas filas deben desaparecer visualmente.
- Animaciones combinadas con [opacity]{.verbatim}.


## [visibility: hidden]{.verbatim} {#visibility-hidden}

Este es el valor más interesante ya que en este caso el elemento desaparece visualmente, mantiene su tamaño y sigue ocupando el espacio en el documento.

:::::::::::::: {.columns columnsep=0.5cm}
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```html
<p>Primer párrafo</p>

<p class="oculto">Segundo párrafo</p>

<p>Tercer párrafo</p>
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[CSS]{.title}
```css
.oculto {
    visibility: hidden;
}
```
:::

:::
::::::::::::::

En este ejemplo, el espacio del segundo párrafo continúa existiendo. Anteriormente se ha explicado la [diferencia con [display:none]{.verbatim}](#diferencias-display-visibility).

Aunque el elemento siga "ocupando" espacio, **no puede recibir interación del usuario mediante el ratón**.


## [visibility: collapse]{.verbatim} {#visibility-collapse}

Existe un valor que está pensado principalmente para filas y columnas de tablas: [collapse]{.verbatim}.

En la mayoría de navegadores modernos este valor se comporta de forma similar a [hidden]{.verbatim}, aunque su implementación completa depende del tipo de elemento. En proyectos habituales rara vez se utiliza fuera de tablas.

::: exercisebox
[[06e](https://github.com/yuki/ejercicios/blob/main/daw/diw/06e.html)]{.solution}

- Usa la propiedad [visibility]{.verbatim} para ocultar elementos y comprueba cómo su espacio permanece.
- ¿Qué sucede al usar [collapse]{.verbatim} en tablas?
:::


## Herencia de [visibility]{.verbatim} {#herencia-visibility}

La propiedad [visibility]{.verbatim} es heredable, lo que hace que todos los hijos de un elemento con valor [hidden]{.verbatim} también estarán ocultos.



# La propiedad [opacity]{.verbatim} {#propiedad-opacity}

En muchas interfaces modernas encontramos elementos que aparecen y desaparecen suavemente: ventanas modales, menús desplegables, imágenes al pasar el ratón o botones que cambian de intensidad. Todos estos efectos tienen un elemento en común: la **transparencia**.

La propiedad **[opacity]{.verbatim}** controla el nivel de transparencia de un elemento completo, permitiendo que sea totalmente visible, parcialmente transparente o completamente invisible **sin dejar de ocupar espacio en el documento**, continúa existiendo en el documento y **puede seguir recibiendo eventos del ratón**.

A diferencia de [visibility]{.verbatim}, [opacity]{.verbatim} está pensada para crear efectos visuales y animaciones.

Para controlar el valor de [opacity]{.verbatim} es un valor comprendido entre [0]{.verbatim} (completamente transparente) y [1]{.verbatim}, completamente opaco (este es el valor por defecto). Por ejemplo:

| Valor | Resultado |
|--------|-----------|
| `0` | Se vuelve invisible |
| `0.25` | Muy transparente |
| `0.5` | Semitransparente |
| `0.75` | Ligeramente transparente |
| `1` | Totalmente visible |


Cuando modificamos la propiedad [opacity]{.verbatim} afecta a **todo el elemento**, por lo que se vuelve transparente tanto fondo, como texto, imágenes, bordes e iconos.

::: infobox
[opacity]{.verbatim} afecta a todo el elemento, **también al fondo, como texto, imágenes, bordes e iconos**.
:::


## Transiciones suaves {#transiciones-suaves}

La opacidad puede animarse fácilmente mediante [transition]{.verbatim}, ya que el cambio deja de ser instantáneo y pasa a realizarse de forma progresiva, teniendo en cuenta el tiempo indicado. Las transiciones se estudiarán en profundidad en una unidad posterior, pero sirva el siguiente ejemplo:

:::::::::::::: {.columns columnsep=0.5cm}
::: {.column width="62%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```html
<img src="img/moon.jpg" alt="" class="imagen">
```
:::

:::
::: {.column width="38%" }

::: {.mycode size=footnotesize}
[CSS]{.title}
```css
.imagen {
    opacity: 0.5;
    transition: opacity 0.3s;
}
.imagen:hover {
    opacity: 1;
}
```
:::

:::
::::::::::::::


Este ejemplo es muy habitual en galerías de imágenes.


::: exercisebox
[[06f](https://github.com/yuki/ejercicios/blob/main/daw/diw/06f.html)]{.solution}

- Duplica el ejercicio anterior y compara [visibility]{.verbatim} con [opacity]{.verbatim}.
- Añade un listener en distintas cajas, ¿cuándo hace efecto?
- Crea una galería de imágenes con [opacity]{.verbatim} y una transición al pasar el ratón.
:::



# Ajustando imágenes y vídeos con [object-fit]{.verbatim} {#ajustar-multimedia}

Uno de los problemas más habituales al trabajar con imágenes y vídeos es adaptar un archivo multimedia a un contenedor de tamaño fijo. Si simplemente modificamos [width]{.verbatim} y [height]{.verbatim}, es muy fácil que la imagen aparezca deformada o pierda sus proporciones.

La propiedad **[object-fit]{.verbatim}** permite controlar **cómo se ajusta una imagen o un vídeo dentro de su propio contenedor**, manteniendo o modificando su relación de aspecto según nuestras necesidades.

Es una propiedad muy utilizada en tarjetas, galerías de imágenes, perfiles de usuario, tiendas online y aplicaciones móviles.

::: warnbox
[object-fit]{.verbatim} solo funciona sobre elementos multimedia como [<img>]{.verbatim} y [<video>]{.verbatim}. No debe confundirse con [background-size]{.verbatim}, que se utiliza para imágenes de fondo.
:::


Imaginemos la siguiente situación, donde ponemos una foto con una resolución de 1920x1080px: 

:::::::::::::: {.columns columnsep=0.5cm}
::: {.column width="60%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```html
<img src="paisaje.jpg" class="foto" alt="">
```
:::

:::
::: {.column width="40%" }

::: {.mycode size=footnotesize}
[Forzar tamaño contenedor]{.title}
```css
.foto {
    width: 300px;
    height: 300px;
}
```
:::

:::
::::::::::::::

La imagen va a aparecer **deformada**, ya que el navegador ajusta el ancho y la altura de forma independiente. Con [object-fit]{.verbatim} evita este problema indicando cómo debe adaptarse la imagen al contenedor. Los valores principales son:

| Valor | Descripción |
|--------|-------------|
| [contain]{.verbatim} | Mantiene la proporción completa. Pueden quedar huecos. |
| [cover]{.verbatim} | Rellena recortando el exceso, rellena el contenedor completo. |
| [fill]{.verbatim} | Rellena deformando la imagen. No se recomienda su uso. |
| [none]{.verbatim} | Mantiene el tamaño original |
| [scale-down]{.verbatim} | Elige entre `none` y `contain` |

Table: {tablename=yukitblr colspec=X[1,l]X[4,l]}


Por lo tanto, para arreglar el ejemplo anterior podemos poner:

::: mycode
[Forzar imagen con [object-fit]{.verbatim}]{.title}
```css
.foto {
    width: 300px;
    height: 300px;
    object-fit: contain;
}
```
:::


En la práctica, los valores más utilizados son **[cover]{.verbatim}** y **[contain]{.verbatim}**.


![Ejemplos de valores: [contain]{.verbatim}, [cover]{.verbatim}, [fill]{.verbatim}, [none]{.verbatim} y [scale-down]{.verbatim}](img/diw/object-fit.png){width=80%}


::: exercisebox
[[06g](https://github.com/yuki/ejercicios/blob/main/daw/diw/06g.html)]{.solution}

- Crea una galería de imágenes y usa [object-fit]{.verbatim}.
- ¿Qué valor crees que es mejor?
:::


# La propiedad [object-position]{.verbatim} {#object-position}

En el apartado anterior vimos que **[object-fit: cover]{.verbatim}** permite rellenar completamente un contenedor recortando parte de la imagen. Sin embargo, surge una nueva pregunta: **¿qué parte de la imagen debe conservarse?**

La propiedad **[[object-position]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference/Properties/object-position)** responde precisamente a esa cuestión. Permite elegir qué zona de una imagen o un vídeo permanecerá visible cuando el contenido sea recortado dentro de su contenedor.

Es una propiedad muy utilizada en avatares, fotografías de productos, retratos y cabeceras con imágenes panorámicas.

Para imágenes más pequeñas que el contenedor, permite elegir dónde colocar la imagen dentro del contenedor.

[object-position]{.verbatim} puede aceptar dos valores:

- **Valor horizontal**
- **Valor vertical**

Los valores pueden ser: [top]{.verbatim}, [center]{.verbatim}, [bottom]{.verbatim}, [left]{.verbatim}, [right]{.verbatim}, un porcentaje o una medida.

El valor por defecto es el centro de la imagen.

:::::::::::::: {.columns columnsep=0.5cm}
::: {.column width="60%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```html
<img src="paisaje.jpg" class="a">

<img src="icono.jpg" class="b">
```
:::

:::
::: {.column width="40%" }

::: {.mycode size=footnotesize}
[CSS]{.title}
```css
.a {
    width: 100px;
    height: 100px;
    object-fit: cover;
    object-position: top left;
}
.b {
    width: 400px;
    height: 400px;
    object-fit: none;
    object-position: 25% 50%;
}
```
:::

:::
::::::::::::::

En los ejemplos anteriores suponemos que:

1. La image no entra en el espacio otorgado:
   - La imagen se va a recortar, pero la imagen se alinea la parte de arriba izquierda con el contenedor, por lo tanto se recortará por abajo y la derecha.
2. La imagen es más pequeña que el contenedor:
   - La imagen se coloca sobre horizontalmente hacia la izquierda (25%) y verticalmente centrada.



::: exercisebox
[[06h](https://github.com/yuki/ejercicios/blob/main/daw/diw/06h.html)]{.solution}

Usando el ejercicio anterior de base, prueba a hacer los contenedores más grandes/pequeños con imágenes más grandes/pequeñas y usa [object-position]{.verbatim} con distintos valores.
:::

