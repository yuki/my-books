
# Variables en CSS {#variables}

Las **variables CSS**, también conocidas como **propiedades personalizadas** (*Custom Properties*), permiten almacenar valores reutilizables dentro de una hoja de estilos. Gracias a ellas podemos definir colores, tamaños, márgenes o cualquier otro valor una única vez y reutilizarlo en todo el proyecto.

Su uso facilita el mantenimiento del código, evita duplicar valores y hace mucho más sencillo crear temas claros, oscuros o modificar la identidad visual de una aplicación.

Aunque hoy día resulta extraño no usarlas, las variables no fueron efectivas en muchos navegadores hasta 2016, y previamente su uso sólo existía en los pre-procesadores CSS.

## Cómo crear una variable en CSS {#crear-variables}

Una variable CSS es una propiedad cuyo nombre comienza por dos guiones ([\-\-]{.verbatim}), para después poder usarla con la función [var()]{.verbatim} indicando el nombre dado previamente. La razón de que las variables empiecen por [\-\-]{.verbatim} es para distinguir las propiedades personalizadas de las estándar de CSS.

:::::::::::::: {.columns columnsep=0.5cm}
::: {.column width="40%"}

::: {.mycode size=footnotesize}
[Declaración de una variable]{.title}
```css
:root {
  /* COLORES */
  --color-main: #2563eb;
  --color-ok: #16a34a;
  --color-error: #dc2626;
  --color-text: #222222;
  /* ESPACIO */
  --espacio-md: 1rem;
  /* BORDES */
  --bordes: 2px;
  --radio: 10px;
}
```
:::

:::
::: {.column width="60%" }

::: {.mycode size=footnotesize}
[Uso de la variable]{.title}
```css
h1 {
    color: var(--color-main);
}
a {
    color: var(--color-main);
}
.ok {
    border: var(--bordes) solid var(--color-ok);
    border-radius: var(--radio);
    padding: var(--espacio-md);
}
```
:::

:::
::::::::::::::

Lo más habitual es declarar las variables dentro del selector [:root]{.verbatim}, de esta manera las variables estarán disponibles en toda la página. Por este motivo, suele utilizarse como lugar donde se almacena la configuración global del diseño.

Las variables se pueden usar tantas veces como sea necesario, y si en el futuro se quieren realizar modificaciones, sólo es necesario cambiarlo en la declaración, y eso hará que toda la página cambie.

Tal como se puede ver en el ejemplo, en las variables se pueden usar no sólo para colores, sino también para espaciados e incluso tipografías.

::: infobox
Es recomendable agrupar las variables por categorías y mantener una convención de nombres descriptivos.
:::


## Variables locales y herencia {#variables-locales-herencia}

En el apartado anterior hemos visto cómo crear variables "globales", ya que se han definido en [:root]{.verbatim}, pero podemos crear variables locales a un elemento. Hay que tener en cuenta que las variables CSS **se heredan**, por lo que si definimos una variable en un elemento, sus hijos podrán utilizarla.

::: mycode
[Variable local y heredada]{.title}
```css
.tarjeta {
    --color-local: blue;
}

.tarjeta p {
    color: var(--color-local);
}
```
:::

La variable únicamente existe dentro de [.tarjeta]{.verbatim} y de sus elementos descendientes. Esto permite crear componentes con configuraciones propias.

Es importante que al crear variables locales, cada componente puede definir otra variable con el mismo nombre, y por tanto serán definiciones distintas, ya que cada componente mantiene su propio contexto:


:::::::::::::: {.columns }
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[Variable local en componente]{.title}
```css
.alerta {
    --color: #dc2626;

    color: var(--color);
    border: 2px solid var(--color);
}
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[Variable local en componente]{.title}
```css
.exito {
    --color: #16a34a;

    color: var(--color);
}
```
:::

:::
::::::::::::::


## Reasignación de variables para reutilización {#reutilización-componentes}

Podemos hacer componentes genéricos y después crear variantes sólo modificando el valor de una variable, de esta manera no tenemos que repetir todas las propiedades.

:::::::::::::: {.columns }
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[Componente genérico]{.title}
```css
.boton {
  --color-boton: #2563eb;
  background: var(--color-boton);
  border: 2px solid var(--color-boton);
  color: white;
}
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[Sólo modificamos color]{.title}
```css
.boton-rojo {
    --color-boton: #dc2626;
}

.boton-verde {
    --color-boton: #16a34a;
}
```
:::

:::
::::::::::::::

Después, en el HTML el componente tendrá las clases que necesitemos.


::: exercisebox
[[05a](https://github.com/yuki/ejercicios/blob/main/daw/diw/05a.html)]{.solution}

Crea distintas variables globales, locales, que se hereden y modifiquen en distintos componentes y haz uso de ellas.
:::



## Valores por defecto con [var()]{.verbatim} {#valores-por-defecto-var}

La función [[var()]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference/Values/var) admite un segundo parámetro que actúa como valor de respaldo. Si la primera variable no existe, utilizará el segundo valor.

::: mycode
[Valor principal y de respaldo]{.title}
```css
color: var(--color-texto, black);
```
:::

Este mecanismo resulta útil cuando desarrollamos componentes reutilizables.


## Variables y modo oscuro {#variables-modo-oscuro}

Una de las grandes ventajas de las variables CSS es la creación de temas. Hoy en día es habitual que las webs cuenten con un modo claro y un modo oscuro.


:::::::::::::: {.columns }
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[Temas]{.title}
```css
/* tema claro*/
:root {
    --fondo: white;
    --texto: #222;
}
/* tema oscuro */
body.dark {
    --fondo: #111;
    --texto: #eee;
}
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[Usar tema]{.title}
```css
body {
    background: var(--fondo);
    color: var(--texto);
}
```
:::

:::
::::::::::::::


Al cambiar la clase del [<body>]{.verbatim}, toda la interfaz cambia automáticamente.



## Variables y [calc()]{.verbatim} {#variables-calc}

Las variables pueden combinarse con funciones CSS, de esta manera el navegador realiza el cálculo automáticamente.

:::::::::::::: {.columns }
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[Variable]{.title}
```css
:root {
    --espacio: 1rem;
}
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[Uso con calc]{.title}
```css
.caja {
    padding: calc(var(--espacio) * 2);
}
```
:::

:::
::::::::::::::


Esta combinación es muy potente para crear sistemas de diseño flexibles.



<!-- 
TODO: poner esto aquí o más adelante?
## Variables y media queries {#variables-media-queries}

También podemos modificar variables dentro de una media query.

```css
:root {
    --ancho: 90%;
}

@media (min-width: 1200px) {
    :root {
        --ancho: 1100px;
    }
}
```

Después:

```css
.contenedor {
    width: var(--ancho);
}
```

La lógica queda centralizada en un único lugar.

-->



# Funciones CSS {#funciones-css}

Las **funciones CSS** son expresiones especiales que permiten realizar cálculos, manipular colores, utilizar variables o generar valores dinámicos dentro de una hoja de estilos. Una función se reconoce porque está formada por un nombre seguido de paréntesis. Ya hemos visto alguna de ellas como:

- [[calc()]{.verbatim}](#calc): realiza cálculos permitiendo distintas unidades de medida.
- [[min()]{.verbatim}](#min-y-max): devuelve el valor mínimo.
- [[max()]{.verbatim}](#min-y-max): devuelve el valor máximo.
- [[clamp()]{.verbatim}](#clamp): limita el valor entre un mínimo, uno preferido y un máximo.
- [[var()]{.verbatim}](#variables): para uso de variables.
- [[url()]{.verbatim}](#background-image): para poder añadir imágenes.

Existen otras funciones, casi todas ellas funciones matemáticas, que podemos ver en la [documentación](https://developer.mozilla.org/en-US/docs/Web/CSS/Guides/Custom_functions_and_mixins) y es interesante conocerlas, ya que quizá sean de utilidad en nuestro proyecto.


##  Función [if()]{.verbatim} {#función-if}

Aunque CSS nació como un lenguaje de hoja de estilos, ya hemos visto que cuenta con funciones, variables, permite realizar cálculos, y como está en constante evolución, en 2025 se propuso crear el condicional [[if()]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference/Values/if).

::: errorbox
El condicional [if()]{.verbatim} a día de hoy sólo es funcional en Chrome, Opera y derivados. No lo vamos a usar.
:::


:::::::::::::: {.columns }
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[Condicional [if()]{.verbatim}]{.title}
```css
.ok {
    background-color: if(
        style(--black: true): black;
        else: white;
    );
    color: if(
        style(--black: true): white;
        else: black;
    );
}
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[Usar tema]{.title}
```HTML
<div class="ok">
    Lorem ipsum ... 
</div>
<div class="ok" style="--black: true">
    Lorem ipsum ...
</div>
```
:::

:::
::::::::::::::

En el ejemplo vemos cómo hacer uso del condicional para modificar el color del texto y el fondo.



## Creación de funciones {#creación-funciones}

De nuevo, este apartado sólo sirve para ver que CSS está evolucionando y añadiendo características más propias de un lenguaje de programación que de una hoja de estilos.

La regla [[@function]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference/At-rules/@function) nos permitirá definir funciones reutilizables, a las que les podremos pasar parámetros y devolver valores.

::: errorbox
La regla [@function]{.verbatim} a día de hoy sólo es funcional en Chrome, Opera y derivados. No la vamos a usar.
:::

:::::::::::::: {.columns columnsep=0.5cm}
::: {.column width="43%"}

::: {.mycode size=footnotesize}
[Declaración de función]{.title}
```css
:root {
  --espacio-md: 1rem;
}

@function --double(--value) {
  result: calc(var(--value) * 2);
}

```
:::

:::
::: {.column width="57%" }

::: {.mycode size=footnotesize}
[Uso de función]{.title}
```css
p {
  --base-spacing: 10px;
  border-radius: --double(var(--espacio-md));
  padding: --double(var(--espacio-md));
}
```
:::

:::
::::::::::::::

Se ha declarado una función que recibe como parámetro un valor y devuelve el doble del mismo. A la hora de usar la función se le ha pasado una variable ya existente, de esta manera podemos ver cómo CSS casi se vuelve un "lenguaje de programación"


::: exercisebox
[[05b](https://github.com/yuki/ejercicios/blob/main/daw/diw/05b.html)]{.solution}

Prueba este ejemplo en Chrome y en otro navegador no compatible.
:::


