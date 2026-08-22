

# Introducción {#introducción-responsive}

Cuando Internet comenzó a popularizarse durante los años noventa, la mayoría de los usuarios navegaba desde un ordenador de sobremesa, y la tecnología de resolución de monitores era de tamaño similar. Las páginas web se diseñaban pensando en una única resolución, por lo que era habitual crear sitios con un ancho fijo de 800 o 1024 píxeles.

Con el paso del tiempo aparecieron portátiles, pantallas panorámicas, tablets, teléfonos inteligentes e incluso televisores conectados a Internet. De repente, una misma página debía verse correctamente en dispositivos con pantallas de apenas 320 píxeles y en monitores de más de 2.500 píxeles de ancho. Esta diversidad hizo necesario un nuevo enfoque de diseño: el **Responsive Web Design**.

En la actualidad, el diseño *responsive* es un requisito imprescindible en cualquier desarrollo web. No consiste únicamente en hacer que una página “quepa” en un móvil, sino en adaptar la distribución, el tamaño de los elementos y la experiencia de usuario a cada dispositivo.

::: infobox
Un diseño *responsive* no consiste sólo que en la página quepa en un móvil, sino en adaptar la distribución, el tamaño de los elementos y la experiencia de usuario a cada dispositivo.
:::


## Web adaptativa frente a web responsive {#web-adaptativa-frente-responsive}

Aunque a menudo se utilizan como sinónimos, existen diferencias entre ambos conceptos.

| Diseño adaptativo (Adaptive) | Diseño responsive |
|------------------------------|------------------|
| Varias versiones del sitio | Una única versión |
| Anchuras predeterminadas | Diseño fluido |
| Cambios en puntos concretos | Adaptación continua |
| Mayor mantenimiento | Más flexible |

El diseño **adaptativo** crea varias versiones del mismo sitio (por ejemplo, una para móvil y otra para escritorio). El diseño **responsive** utiliza una única estructura que se adapta mediante CSS.

Hoy en día, el enfoque recomendado es el responsive.


# Viewport {#viewport}

Cuando una página web se visualiza en un ordenador, el navegador dispone normalmente de una pantalla relativamente grande. Sin embargo, cuando se visita esa misma página desde un teléfono móvil, el área disponible es mucho menor.

Cuando aparecieron los primeros *smartphones*, muchos sitios web no estaban preparados para pantallas pequeñas. Para intentar mostrar páginas diseñadas para ordenadores, los navegadores móviles utilizaban un viewport virtual considerablemente más ancho que la pantalla física.  El resultado era una página diminuta que el usuario tenía que ampliar mediante zoom.


Para que el navegador pueda interpretar correctamente el tamaño de la página en dispositivos móviles existe el concepto de ***viewport***, que es el área visible de una página web dentro de la ventana del navegador. Es fundamental entender qué es antes de empezar a trabajar con Media Queries y diseño responsive.


## El viewport no es necesariamente igual a la resolución de pantalla {#viewport-resolución-pantalla}

Es importante no confundir estos los conceptos de *viewport* y resolución de pantalla. Hoy en día los dispositivos móviles pueden tener una resolución física igual que la de una pantalla de ordenador (1920 x 1080 píxeles, o incluso más) pero eso no significa que una página web disponga de un viewport de [1080px]{.verbatim} de ancho.

Los dispositivos móviles utilizan una **densidad de píxeles** (***ppi*** o *pixels per inch*) diferente a la de las pantallas tradicionales y los navegadores utilizan un **viewport lógico** para representar las páginas. Por este motivo, cuando hablamos de CSS normalmente trabajamos con **píxeles CSS**, no con los píxeles físicos del panel.


## La etiqueta [meta viewport]{.verbatim} {#etiqueta-meta-viewport}

Para indicar al navegador móvil cómo debe utilizar el viewport se utiliza una etiqueta [<meta>]{.verbatim} dentro de [<head>]{.verbatim}. La configuración habitual es:

::: {.mycode size=footnotesize}
[HTML con cabecera [viewport]{.verbatim}]{.title}
```html
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Mi página</title>
    </head>
    <body>
        <h1>Mi página responsive</h1>
    </body>
</html>
```
:::

Esta etiqueta es prácticamente obligatoria en cualquier página web moderna que pretenda ser responsive. A continuación una explicación de cada atributo de la etiqueta, aunque conviene mirar la [documentación](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/meta/name/viewport) para ver todos los posibles atributos:

- [<meta ... >]{.verbatim}: es una [etiqueta HTML](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/meta) que representa metadatos que no pueden ser representados por otras etiquetas. Dentro de ella acepta distintos atributos:
  - [name="viewport"]{.verbatim}: el nombre de los metadatos, en este caso indicando que hacemos referencia al ***viewport***.
  - [content="..."]{.verbatim}: el contenido de los metadatos. Es una lista de valores separado por comas que contiene parejas de clave-valor, del estilo [key=value]{.verbatim}. En este caso están definidos las siguientes claves:
    - [width=device-width]{.verbatim}: indica al navegador que el ancho del viewport debe coincidir con el ancho disponible del dispositivo en **píxeles CSS**.
    - [initial-scale=1.0]{.verbatim}: indica el nivel de zoom inicial de la página. Puede ser un valor entre [0]{.verbatim} y [100]{.verbatim} donde [1]{.verbatim} es el 100%, es decir, **no hay zoom adicional.**


::: infobox
La etiqueta [meta viewport]{.verbatim} debe ir en la cabecera [<head>]{.verbatim}.
:::


::: exercisebox
[[08a](https://github.com/yuki/ejercicios/blob/main/daw/diw/08a.html)]{.solution}

Crea una página HTML con la etiqueta [meta viewport]{.verbatim} y comprueba con tu móvil cómo se ve. Elimina la etiqueta y vuelve a comprobarlo.
:::




## Unidades relacionadas con el viewport {#unidades-relacionadas-viewport2}

CSS dispone de unidades [relacionadas con el viewport](#unidades-relacionadas-viewport) tal como se ha visto previamente. Un ejemplo sería:

::: {.mycode}
[HTML con cabecera [viewport]{.verbatim}]{.title}
```css
.content {
    height: 100vh;
}
```
:::


Esta regla indica que el elemento tendrá una altura equivalente al 100% de la altura del viewport.


## Viewport y orientación del dispositivo {#viewport-orientación-dispositivo}

Un teléfono puede utilizarse en dos orientaciones, en vertical y horizontal. El ancho y la altura del viewport cambian al girar el dispositivo. Esto permite que las páginas responsive adapten automáticamente su distribución.


## No bloquear el zoom del usuario {#no-bloquear-zoom}

Dentro de la configuración de la [etiqueta *viewport*](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/meta/name/viewport) existe la posibilidad de bloquear el zoom del usuario:


::: {.mycode}
[HTML con cabecera [viewport]{.verbatim}]{.title}
```css
<meta name="viewport"
      content="width=device-width, initial-scale=1.0, 
               maximum-scale=1.0, user-scalable=no"
>
```
:::

No es recomendable utilizar [user-scalable=no]{.verbatim} para una página normal. Impedir que el usuario amplíe el contenido puede perjudicar la **accesibilidad**, especialmente a personas que necesitan aumentar el tamaño de la página para poder leerla. En iPhone, desde iOS 10 Apple ignora esa configuración.

::: warnbox
No es recomendable bloquear el zoom del usuario.
:::



# Media Queries {#media-queries}

Una página responsive no cambia automáticamente su diseño por sí sola. El navegador necesita un mecanismo que le permita **aplicar unos estilos u otros según las características del dispositivo**. Ese mecanismo recibe el nombre de **Media Queries**.

Las Media Queries son una característica de CSS que permite escribir reglas condicionales. Gracias a ellas podemos modificar el número de columnas, el tamaño de la tipografía, ocultar elementos o reorganizar completamente un layout cuando cambia el tamaño del viewport. Son uno de los pilares del **Responsive Web Design** propuesto por Ethan Marcotte en 2010.


## Configuración de Media Queries {#configuración-media-queries}

Las Media Queries se evalúan antes de aplicar un bloque de estilos, y su sintaxis es la siguiente:


:::::::::::::: {.columns columnsep=0.25cm}
::: {.column width="33%"}

::: {.mycode size=footnotesize}
[Sintaxis]{.title}
```css
@media (condición) {
  /* Reglas CSS */
}
```
:::

:::
::: {.column width="33%" }

::: {.mycode size=footnotesize}
[Ejemplo]{.title}
```css
@media(max-width:768px){
/*pantallas pequeñas*/
  body {
    background: red;
  }
}
```
:::

:::
::: {.column width="33%" }

::: {.mycode size=footnotesize}
[Ejemplo]{.title}
```css
@media(min-width:768px){
/*pantallas grandes*/
  body {
    background: gray;
  }
}
```
:::

:::
::::::::::::::

La sintaxis más habitual para la condición es utilizar:

- [min-width]{.verbatim}: para aplicar cuando **como mínimo** es el tamaño indicado.
- [max-width]{.verbatim}: para aplicar las reglas cuando **como máximo** es el tamaño indicado.


::: infobox
Las reglas que hay dentro de la Media Query **solo se aplican cuando la condición es verdadera**.
:::

Los ejemplos anteriores pueden estar en el mismo fichero de configuración, y podemos utilizar tantas como necesitemos para la misma aplicación web.


## Combinar condiciones {#combinar-condiciones}

Se pueden combinar distintas condiciones mediante [and]{.verbatim}:

::: {.mycode}
[Combinar Media Queries]{.title}
```css
@media (min-width: 768px) and (max-width: 1199px) {
    body {
        background: beige;
    }
}
```
:::

Esta regla solo se aplicará entre **[768px]{.verbatim} y [1199px]{.verbatim}**. Es útil cuando queremos crear estilos específicos para tablets.


## Según orientación del dispositivo {#según-orientación-dispositivo}

Las Media Queries también pueden detectar la orientación del dispositivo, teniendo en cuenta esi está en modo [portrait]{.verbatim} (vertical) o [landscape]{.verbatim} (horizontal).

::: {.mycode}
[Orientación del dispositivo]{.title}
```css
@media (orientation: landscape) {
    body {
        background: beige;
    }
}
```
:::

Esto permite adaptar algunos componentes cuando el usuario gira el dispositivo.

## Otras características disponibles {#otras-características-media-queries}

Aunque el ancho es la condición más utilizada, existen muchas otras.

| Característica | Ejemplo |
|---------------|----------|
| Anchura (como mínimo)     | [min-width]{.verbatim} |
| Anchura (como máximo)     | [max-width]{.verbatim} |
| Altura (como máximo)     | [max-height]{.verbatim} |
| Orientación | [orientation]{.verbatim} |
| Impresión   | [print]{.verbatim} |
| Pantalla    | [screen]{.verbatim} |

Por ejemplo, para imprimir también podemos modificar la web:


::: {.mycode}
[Media Query al imprimir]{.title}
```css
@media print {
    nav {
        display: none;
    }
}
```
:::

El navegador aplicará estos estilos únicamente al generar la impresión o un PDF, y así no imprimirá la barra de navegación.


## Orden de las reglas {#orden-reglas-media-queries}

El orden del CSS sigue siendo importante al hacer uso de Media Queries. Si ambas reglas tienen la misma especificidad, la que aparece más abajo y cuya condición se cumple será la que prevalezca.

::: {.mycode}
[Orden de las reglas]{.title}
```css
h1 { font-size: 16px; }

@media (min-width: 768px) {
    h1 {
        font-size: 32px;
    }
}
```
:::

Este comportamiento sigue las reglas normales de la cascada.


## Ejemplos {#ejemplos-media-queries}

A continuación varios ejemplos de *media queries* que modifican los estilos según lo visto anteriormente.


En este ejemplo el comportamiento es el siguiente:

- En móvil → [1.5rem]{.verbatim}.
- En tablet y ordenador → [3rem]{.verbatim}.


::: {.mycode}
[Ejemplo básico]{.title}
```css
h1 { font-size: 1.5rem; }

@media (min-width: 768px) {
  h1 {
    font-size: 3rem;
  }
}
```
:::


Los estilos base corresponden al dispositivo más pequeño.

En el siguiente ejemplo se modifica cómo se visualiza un **Grid**, dependiendo del tamaño de la pantalla

::: {.mycode }
[Ejemplo con Grid]{.title}
```css
#grid {
    display: grid;
    grid-template-columns: 1fr;
    gap: 1rem;
}
@media (min-width: 768px) {
  #grid {
      grid-template-columns: repeat(3, 1fr);
      gap: 3rem;
    }
}
```
:::


Para dispositivos con pantalla grande habrá tres columnas, mientras que en pantallas pequeñas sólo se verá una.


::: exercisebox
[[08b](https://github.com/yuki/ejercicios/blob/main/daw/diw/08b.html)]{.solution}

Crea una página HTML que tenga distintos *media queries* para distintos tamaños de pantalla. Comprueba que funciona haciendo zoom en el navegador del escritorio y con el móvil.
:::



# Breakpoints y puntos de ruptura {#breakpoints-puntos-ruptura}

En el apartado anterior aprendimos que las **Media Queries** permiten aplicar estilos cuando se cumple una determinada condición. La pregunta que nos puede surgir es: **¿en qué anchuras debemos cambiar el diseño?**:

Los **breakpoints** o **puntos de ruptura** son precisamente los valores del viewport a partir de los cuales una interfaz modifica su distribución. Gracias a ellos una misma página puede reorganizarse para ofrecer una experiencia adecuada en teléfonos móviles, tablets, ordenadores portátiles o monitores de escritorio.

Es importante comprender que un breakpoint **no representa un dispositivo concreto**, sino un momento en el que decidimos aplicar una Media Query diferente para ajustar el diseño a ese tamaño.

Hemos visto previamente distintos ejemplos como el siguiente:

::: {.mycode }
[Media Query]{.title}
```css
@media (min-width: 768px) {
  /* CSS */
}
```
:::

En este caso, **768 px** es el breakpoint, que quiere decir "cuando el viewport alcance 768px o más, aplica ciertas reglas".


## Breakpoints habituales {#breakpoints-habituales}

Aunque cada proyecto puede utilizar valores diferentes, y podemos elegir los que más nos convengan, existen algunos puntos de ruptura muy extendidos:

::: {.mycode size=footnotesize}
[Breakpoints. Fuente: [devsheets](https://devsheets.io/sheets/screen-sizes)]{.title}
```css
/* Standard Breakpoints */
/* Mobile First Approach */
@media (min-width: 320px)  { /* Mobile Small */ }
@media (min-width: 480px)  { /* Mobile Large */ }
@media (min-width: 576px)  { /* Mobile XL */ }
@media (min-width: 768px)  { /* Tablet */ }
@media (min-width: 1024px) { /* Desktop */ }
@media (min-width: 1200px) { /* Large Desktop */ }
@media (min-width: 1440px) { /* Extra Large */ }

/* Desktop First Approach */
@media (max-width: 1439px) { /* Below XL */ }
@media (max-width: 1199px) { /* Below Large */ }
@media (max-width: 1023px) { /* Below Desktop */ }
@media (max-width: 767px)  { /* Below Tablet */ }
@media (max-width: 479px)  { /* Below Mobile Large */ }
```
:::

Estos valores son orientativos y **no forman parte del estándar de CSS**. Cada proyecto debe elegir los breakpoints que mejor se adapten a su diseño.


Los *frameworks* CSS también hacen uso de estos sistemas, y aunque todos ellos suelen hacer uso de aliases, los tamaños son parecidos entre sí. Por ejemplo, existe cierta diferencia entre [Bootstrap](https://getbootstrap.com/docs/5.3/layout/breakpoints/) y [TailwindCSS](https://v2.tailwindcss.com/docs/breakpoints):

|      | Bootstrap                     | Tailwindcss | 
|------|-------------------------------|-------------|
| sm   | [min-width: 576px]{.verbatim} | [min-width: 640px]{.verbatim} |
| md   | [min-width: 768px]{.verbatim} | [min-width: 768px]{.verbatim} |
| lg   | [min-width: 992px]{.verbatim} | [min-width: 1024px]{.verbatim} |
| xl   | [min-width: 1200px]{.verbatim} | [min-width: 1280px]{.verbatim} |
| xxl / 2xl |  [min-width: 1400px]{.verbatim} | [min-width: 1536px]{.verbatim} |

Table: {tablename=yukitblrcol colspec=X[1]X[3]X[3]}


### Conocer el tamaño del viewport con JavaScript {#conocer-tamaño-javascript}

Durante el desarrollo de una página responsive es muy útil saber **cuál es el tamaño real del viewport** sobre el que está trabajando el navegador. Aunque las Media Queries aplican automáticamente los estilos adecuados, conocer estas dimensiones nos ayuda a comprobar si estamos entrando en un determinado *breakpoint* o a depurar el comportamiento de nuestro diseño.

JavaScript permite obtener el ancho y la altura del viewport mediante las propiedades [window.innerWidth]{.verbatim} y [window.innerHeight]{.verbatim}. Estas propiedades devuelven el tamaño del área visible del navegador en **píxeles CSS**, es decir, las mismas unidades que utiliza CSS para evaluar las Media Queries.

::: {.mycode}
[Conocer tamaño de pantalla]{.title}
```javascript
console.log("Ancho:", window.innerWidth);
console.log("Alto:", window.innerHeight);
```
:::


Al ejecutar este código desde la consola del navegador veremos dos números que cambiarán al redimensionar la ventana. Si, por ejemplo, reducimos la anchura de la ventana por debajo de [768px]{.verbatim}, el valor de [window.innerWidth]{.verbatim} también disminuirá y las Media Queries correspondientes comenzarán a aplicarse.

Es importante entender que **el viewport también cambia cuando hacemos zoom en un navegador de escritorio**. Al aumentar el zoom al 125% o al 150%, el navegador muestra una porción menor de la página, por lo que el viewport efectivo disminuye y por tanto los valores devueltos serán más pequeños.

Del mismo modo, al reducir el zoom, el viewport aumenta y el valor obtenido será mayor. Por esta razón, las Media Queries y JavaScript siempre trabajan con el viewport efectivo y no con la resolución física del monitor.

Una forma muy cómoda de observar estos cambios consiste en escuchar el evento [resize]{.verbatim}, que se dispara cada vez que cambia el tamaño del viewport (ya sea al redimensionar la ventana o al modificar el zoom en muchos navegadores).

::: {.mycode}
[Conocer tamaño de pantalla]{.title}
```javascript
window.addEventListener("resize", () => {
    console.log(
        `Viewport: ${window.innerWidth} × ${window.innerHeight}`
    );
});
```
:::

Este pequeño script resulta muy útil **durante el desarrollo**, ya que permite visualizar en tiempo real las dimensiones sobre las que está trabajando nuestro diseño responsive.

::: errorbox
Es importante no dejar este código en producción para evitar posibles problemas de rendimiento.
:::


## Diseño para contenido, no para dispositivos {#diseño-para-contenido}

Un error muy frecuente es pensar en crear un *breakpoint* para iPhone o un dispositivo concreto. En realidad, **el diseño responsive moderno evita trabajar para dispositivos específicos**.

::: infobox
El diseño responsive moderno evita trabajar para dispositivos específicos.
:::

La estrategia correcta es observar cuándo el contenido deja de verse correctamente. Por ejemplo, si un elemento comienza a verse demasiado estrecha a los **720px**, ese puede ser el breakpoint adecuado, aunque no coincida con ningún dispositivo concreto. **El contenido debe ser quien determine el cambio de diseño**.


## Breakpoints y herramientas de desarrollo {#breakpoints-herramientas-desarrollo}

Los navegadores incorporan un **modo de diseño responsive** dentro de las herramientas de desarrollo. Desde él podemos:

- Simular teléfonos y tablets.
- Introducir un ancho personalizado.
- Ver el viewport en tiempo real.
- Comprobar cuándo se activan las Media Queries.

Es una herramienta imprescindible para desarrollar interfaces responsive sin necesidad de disponer físicamente de varios dispositivos.

Los navegadores incorporan un listado de simulación de dispositivos pre-configurados, y aparte, podemos añadir un dispositivo propio con los datos que nos interesen.

::: exercisebox
[[08c](https://github.com/yuki/ejercicios/blob/main/daw/diw/08c.html)]{.solution}

Modifica el ejercicio anterior y añade la función javascript para conocer en tiempo real el *viewport*.
:::


# Diseño *Mobile First* {#diseño-mobile-first}

Durante muchos años los sitios web se diseñaban pensando primero en los ordenadores. Una vez terminada la versión de escritorio, los desarrolladores intentaban adaptarla a móviles mediante numerosas Media Queries y excepciones. Este enfoque funcionaba, pero producía hojas de estilo difíciles de mantener y páginas poco optimizadas para dispositivos móviles.

A partir de 2010 el número de usuarios que navegaban desde teléfonos móviles comenzó a crecer rápidamente. Muchas páginas seguían estando diseñadas para pantallas grandes y ofrecían una mala experiencia en dispositivos pequeños.

El diseñador **[Luke Wroblewski](https://www.lukew.com/about/)** popularizó la filosofía ***Mobile First*** proponiendo una idea muy sencilla: **comenzar por el dispositivo con más limitaciones (de tamaño) y añadir funcionalidades a medida que aumenta el espacio disponible**. Este enfoque obliga a **priorizar el contenido realmente importante** desde el principio. Hoy en día es el enfoque recomendado por la mayoría de frameworks y guías de desarrollo web.

La secuencia de trabajo es:

1. Diseñar para móvil.
2. Adaptar para tablet.
3. Mejorar para escritorio.
4. Aprovechar el espacio en monitores grandes.

En CSS esto significa que **los estilos normales son los de móvil**, y las Media Queries utilizan generalmente [min-width]{.verbatim}.


## Estructura típica de un proyecto {#estructura-típica-proyecto}

En Mobile First los estilos se escriben de menor a mayor tamaño.

::: {.mycode}
[Estructura *mobile first*]{.title}
```css
/* Estilos base (móvil) */
body { margin: 0; }
/* ... */

@media (min-width: 768px) {
  /* Adaptaciones para Tablet */
}

@media (min-width: 1200px) {
  /* Adaptaciones para Escritorio */
}
```
:::

::: infobox
Observa que las Media Queries **añaden** estilos, no sustituyen toda la hoja de estilos.
:::


## Ventajas del enfoque Mobile First {#ventajas-enfoque-mobile-first}

A la hora de diseñar nuestra aplicación web, el empezar con el enfoque *mobile first* nos ayuda a mejorar el rendimiento, ya que los dispositivos móviles suelen tener menos potencia y conexiones más lentas. Diseñar primero para ellos favorece páginas más ligeras y rápidas.

Por otro lado, el espacio reducido obliga a preguntarse qué información es realmente importante, y cuál debería ser su sitio en la web, así como cuáles son secundarios. Esto ayuda a producir interfaces más limpios.

Por último, en lugar de eliminar estilos de escritorio, únicamente vamos añadiendo mejoras conforme aumenta el ancho disponible.



# Diseño *Desktop First* {#diseño-desktop-first}

El **Desktop First** comienza diseñando la versión de escritorio y posteriormente adapta la interfaz a pantallas cada vez más pequeñas utilizando Media Queries con [max-width]{.verbatim}. Aunque hoy en día no suele ser la opción recomendada para proyectos nuevos, es muy importante conocerla porque todavía está presente en numerosos sitios web y proyectos heredados.

La secuencia de trabajo es:

1. Diseñar para ordenador.
2. Adaptar para portátil.
3. Adaptar para tablet.
4. Adaptar para móvil.


Durante los años 2000 la inmensa mayoría de los usuarios navegaba desde ordenadores de sobremesa. Era lógico que los diseñadores comenzaran creando páginas de **960 píxeles** de ancho y posteriormente añadieran algunas adaptaciones para dispositivos pequeños cuando empezaron a aparecer los smartphones.

Un ejemplo muy típico era el siguiente:

::: {.mycode}
[Ejemplo *desktop first*]{.title}
```css
.wrapper {
    width: 960px;
    margin: 0 auto;
}
```
:::

Cuando llegaron los teléfonos móviles, fue necesario añadir Media Queries para modificar esa estructura.

## Estructura típica de Desktop First {#estructura-típica-desktop-first}

Los estilos principales pertenecen al escritorio.

::: {.mycode}
[Estructura *mobile first*]{.title}
```css
/* Estilos base (escritorio) */
body { font-size: 18px; }

/* adaptaciones */
@media (max-width: 992px) { }
@media (max-width: 768px) { }
@media (max-width: 576px) { }
```
:::

::: infobox
Observa que ahora las condiciones utilizan **anchuras máximas**.
:::


## Ventajas e inconvenientes de Desktop First {#ventajas-inconvenientes-desktop-first}

Este enfoque todavía puede resultar útil en algunos casos.

- Aplicaciones de uso interno: Si una aplicación solo va a utilizarse en ordenadores de oficina, puede tener sentido diseñar primero para escritorio.
- Proyectos heredados: Muchos sitios desarrollados hace años ya siguen esta filosofía. En estos casos suele ser más práctico mantener la misma estructura que reescribir completamente el CSS.

Pero también **presenta varios inconvenientes** cuando el objetivo es crear una aplicación pública moderna:

- Más reglas correctivas: Es habitual tener que "deshacer" estilos del escritorio.
- Más código: debido al punto anterior, normalmente se usan más reglas CSS que en *mobile first*.



# Imágenes adaptativas y *responsives* {#imágenes-adaptativas-responsive}

Las imágenes representan habitualmente el mayor porcentaje del peso de una página web. Un diseño responsive no consiste únicamente en reorganizar columnas y menús: también debe conseguir que las imágenes **se adapten al tamaño del dispositivo**, mantengan su proporción y, cuando sea posible, **descarguen la versión más adecuada para cada pantalla**.

Hay que diferenciar dos conceptos muy importantes:

- **Imágenes adaptativas**: el navegador descarga una versión diferente según el dispositivo.
- **Imágenes responsivas**: la misma imagen cambia de tamaño y se adapta al espacio disponible.

Supongamos una fotografía de **3000 × 2000 píxeles**: 

- Si la mostramos en un teléfono de 390 píxeles de ancho, el navegador tendrá que reducir enormemente su tamaño.
- Si además la imagen ocupa varios megabytes, estaremos descargando mucho más contenido del necesario.

Los principales problemas son:

- Mayor tiempo de carga.
- Más consumo de datos móviles.
- Peor experiencia de usuario.
- Peor posicionamiento en buscadores.

Por ello, las imágenes deben formar parte del diseño responsive.


## Imágenes *responsive* y *aspect-ratio* {#imágenes-responsive}

A la hora de añadir imágenes en nuestra web lo habitual es querer que cambie de tamaño al espacio disponible, y que mantenga su proporción para que no se vea mal.

::: {.mycode}
[Imágenes *responsive*]{.title}
```css
img {
    max-width: 100%;
    height: auto;
}
```
:::

Esta sencilla regla consigue que la imagen:

- Nunca sea más ancha que su contenedor.
- Mantenga automáticamente su proporción (gracias a [height:auto]{.verbatim}).
- Se reduzca cuando el espacio disponible disminuye.

Es una práctica recomendada en prácticamente cualquier proyecto web.

Existe pequeñas diferencias entre [width: 100%]{.verbatim} y [max-width: 100%]{.verbatim}:

- [width:100%]{.verbatim}: La imagen siempre ocupa todo el ancho del contenedor, incluso si originalmente era más pequeña.
- [max-width:100%]{.verbatim}: La imagen solo se reduce cuando es necesario, pero nunca se amplía por encima de su tamaño original. **Esta suele ser la opción recomendada**.


Ejemplo para una galería creada con **[Grid](#grid)**, que tiene imágenes *responsives*:

:::::::::::::: {.columns}
::: {.column width="35%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```html
<section class="galeria">
  <img src="1.jpg" alt="">
  <img src="2.jpg" alt="">
  <img src="3.jpg" alt="">
</section>
```
:::

:::
::: {.column width="65%" }

::: {.mycode size=footnotesize}
[CSS]{.title}
```css
.galeria {
  display: grid;
  grid-template-columns: 
            repeat(auto-fit, minmax(220px, 1fr));
  gap: 16px;
}

.galeria img {
    width: 100%;
    height: auto;
    object-fit: cover;
}
```
:::

:::
::::::::::::::


En lugar de usar [height:auto]{.verbatim} también se puede usar [aspect-ratio:auto]{.verbatim}, ya que mantendrá la proporción. Esta [propiedad](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference/Properties/aspect-ratio) permite forzar las imágenes a un *ratio* especificado, aunque lo ideal es añadir siempre el *fallback*: [aspect-ratio: auto 16/9]{.verbatim}: 


::: {.mycode}
[CSS]{.title}
```css
.galeria img {
    width: 100%;
    aspect-ratio: auto 16/9;
}
```
:::


## Imágenes adaptativas con [srcset]{.verbatim} {#imagenes-srcset}

Hasta ahora siempre descargábamos la misma imagen, pero HTML permite ofrecer varias versiones de un mismo recurso mediante [srcset]{.verbatim}. De esta manera el navegador elige automáticamente la imagen más adecuada según:

- El ancho del viewport.
- La resolución del dispositivo.
- La densidad de píxeles.

Esto reduce el consumo de datos y mejora el rendimiento.

::: {.mycode}
[HTML]{.title}
```html
<img alt="Paisaje"
    src="foto-800.jpg"
    srcset="
        foto-400.jpg 400w,
        foto-800.jpg 800w,
        foto-1200.jpg 1200w
    "
    sizes="
        (max-width: 768px) 100vw,
        50vw
    ">
```
:::



El atributo [sizes]{.verbatim} se combina con [srcset]{.verbatim} y de esta manera lo que conseguimos es:

- En pantallas menores de 768 px la imagen ocupará el 100 % del viewport.
- En pantallas mayores ocupará aproximadamente el 50 %.

Con esta información el navegador puede seleccionar la versión más eficiente antes de descargarla.

### El elemento [<picture>]{.verbatim} {#elemento-picture}

A veces no basta con cambiar la resolución: queremos mostrar **una fotografía diferente** según el dispositivo.

Para ello existe el elemento [[<picture>]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/picture).

::: {.mycode}
[Imágenes diferentes según tamaño]{.title}
```html
<picture>
    <source
        media="(max-width: 768px)"
        srcset="cabecera-mobile.jpg"
    >
    <source
        media="(min-width: 769px)"
        srcset="cabecera-desktop.jpg"
    >
    <img src="cabecera-desktop.jpg" alt="Cabecera">
</picture>
```
:::

El navegador elegirá la primera imagen cuya condición se cumpla. Este método es muy útil cuando el encuadre de la fotografía cambia entre móvil y escritorio.


### Imágenes de fondo {#imágenes-fondo}

Las imágenes utilizadas mediante CSS también pueden ser responsivas.

::: {.mycode}
[Imágenes diferentes según tamaño]{.title}
```css
.hero {
    background-image: url("hero-mobile.jpg");
}
@media (min-width: 768px) {
    .hero {
        background-image: url("hero-desktop.jpg");
    }
}
```
:::

De esta forma cada dispositivo descarga una imagen distinta. Es una técnica habitual en cabeceras de gran tamaño.



::: exercisebox
[[08d](https://github.com/yuki/ejercicios/blob/main/daw/diw/08d.html)]{.solution}

Comprueba el funcionamiento de usar distintas imágenes para tamaños distintos.
:::


## Formatos modernos de imagen {#formatos-modernos}

Además del diseño responsive, también conviene utilizar formatos eficientes, ya que mejoran el algoritmo de compresión y pueden hacer que ocupen menos:

| Formato | Uso recomendado |
|----------|-----------------|
| JPEG | Fotografías |
| PNG | Transparencias |
| SVG | Iconos y logotipos |
| WebP | Fotografías optimizadas |
| AVIF | Máxima compresión |

Actualmente **WebP** y **AVIF** ofrecen una excelente relación entre calidad y tamaño de archivo, por lo que son muy recomendables para proyectos modernos.



# Tipografía adaptable {#tipografías-aadaptables}

Uno de los objetivos principales del diseño responsive es garantizar que el contenido sea **legible** en cualquier dispositivo. No basta con reorganizar columnas o cambiar el tamaño de las imágenes: la tipografía también debe adaptarse al espacio disponible.

Una tipografía adaptable ajusta el tamaño del texto de forma progresiva según el tamaño del viewport, evitando que las letras sean demasiado pequeñas en un móvil o excesivamente grandes en un monitor de gran resolución. Para conseguirlo, CSS ofrece **[unidades relativas](#unidades-relativas)** y funciones como [clamp()]{.verbatim}.

Sigue siendo habitual encontrar estilos como este:

::: {.mycode}
[Tipografía estática]{.title}
```css
h1 { font-size: 48px; }

p { font-size: 16px; }
```
:::

Y aunque funciona, presenta varios inconvenientes:

- En un móvil, un título de 48 px puede ocupar demasiadas líneas.
- En un monitor 4K, un texto de 16 px puede resultar pequeño.
- Obliga a crear numerosas Media Queries para ajustar cada tamaño.

Por ello, en diseño responsive se prefieren **unidades relativas** y tamaños fluidos.


## Escala tipográfica {#escala-tipográfica}

Aunque ya se ha visto previamente al hablar de la [unidad relativa [rem]{.verbatim}](#unidad-relativa-rem), es conveniente recordar que es recomendable utilizar una **escala tipográfica** consistente.

::: {.mycode}
[Tipografía relativa]{.title}
```css
h1    { font-size: 2.5rem; }
h2    { font-size: 2rem; }
h3    { font-size: 1.5rem; }
p     { font-size: 1rem; }
small { font-size: 0.875rem; }
```
:::


Esta jerarquía facilita la lectura y mantiene la coherencia visual del sitio. Aparte, **tiene en cuenta el tamaño por defecto del navegador que ha podido ser modificado por el usuario**. 

## Adaptar la tipografía con Media Queries {#adaptar-tipografía-media-queries}

Ahora ya sólo queda hacer que la sea tipografía responsive haciendo uso de Media Queries para adaptarla al tamaño que nos interese. Teniendo en cuenta el anterior ejemplo:

::: {.mycode}
[Añadido *media queries*]{.title}
```css
@media (min-width: 768px) {
    h1 { font-size: 3.5rem; }
}
```
:::

### Unidades del *viewport* {#unidades-viewport}

CSS también permite relacionar el tamaño del texto con el [ancho del viewport](#unidades-relacionadas-viewport) mediante la unidad [vw]{.verbatim}.

::: {.mycode}
[Tipografías según el *viewport*]{.title}
```css
h1 { font-size: 6vw; }
```
:::

Si el viewport mide 1000px:

- [1vw]{.verbatim} = 10 px
- [6vw]{.verbatim} = 60 px

Si el viewport mide 400px:

- [1vw]{.verbatim} = 4 px
- [6vw]{.verbatim} = 24 px

El texto cambia automáticamente de tamaño al modificar la ventana. El problema es que al usar [vw]{.verbatim} puede hacer que en un monitor muy grande el título puede hacerse enorme, mientras que en un móvil muy pequeño puede resultar demasiado reducido.

Por ello, normalmente se combina `vw` con límites mínimos y máximos mediante `clamp()`.


## Uso de [clamp()]{.verbatim} {#uso-clamp}

Ya se ha visto la función [[clamp()]{.verbatim}](#clamp) anteriormente, pero es ahora cuando le encontramos el valor añadido, ya que nos va a solucionar el problema de usar [vw]{.verbatim}. Actualmente la técnica recomendada para crear tipografía fluida.

::: {.mycode}
[Tipografías relativa con [clamp()]{.verbatim}]{.title}
```css
h1 { font-size: clamp(2rem, 5vw, 4rem); }
```
:::

La regla anterior nos permite hacer que la tipografía:

- Nunca será menor de **2 rem**.
- Intentará crecer utilizando **5vw**.
- Nunca superará **4 rem**.

El navegador calcula automáticamente el valor adecuado.

::: infobox
Si usamos [clamp()]{.verbatim} de manera correcta nos ahorra crear Media Queries para la tipografía.
:::


## Otros aspectos a tener en cuenta {#otros-aspectos-tipografías}

Existen otros aspectos que tienen que ver con la tipografía que deberíamos tener en cuenta a la hora de adaptar nuestra página web, entre otros:

- **Altura de línea**: La legibilidad no depende únicamente del tamaño de la letra. La altura de línea ([line-height]{.verbatim}) también es fundamental.
- **Longitud de línea**: Los párrafos demasiado anchos son difíciles de leer, por ello, es recomendable limitar su anchura con [max-width]{.verbatim}. Un ancho de **60–75 caracteres por línea** suele considerarse óptimo para textos largos. Un ancho de **70–80 caracteres por línea** suele considerarse óptimo para textos largos.
- **Espaciado entre párrafos**: Además del interlineado, conviene separar visualmente los párrafos. Para ello se puede usar [p {margin-bottom:1rem;}]{.verbatim} y de esta manera hace que el espaciado crezca proporcionalmente con el resto de la tipografía.



# Contenedores fluidos {#contenedores-fluidos}

Uno de los principios fundamentales del diseño responsive consiste en evitar que los elementos tengan un tamaño fijo cuando no es necesario. En lugar de diseñar cajas de **960px** o **1200px** de ancho, los contenedores modernos se adaptan al espacio disponible utilizando porcentajes, unidades relativas y límites máximos.

Un **contenedor fluido** es un elemento cuya anchura crece y disminuye junto con el viewport, manteniendo al mismo tiempo una lectura cómoda en pantallas grandes. Esta técnica se utiliza en prácticamente todos los frameworks modernos, como [Bootstrap](https://getbootstrap.com/), [Tailwind CSS](https://tailwindcss.com/) o [Bulma](https://bulma.io/).


## Contenedor fluido junto con [max-width]{.verbatim} {#contenedor-fluido-max-width}

La evolución a la hora de crear contenedores ha sido la siguiente:

:::::::::::::: {.columns columnsep=0.25cm}
::: {.column width="33%"}

::: {.mycode size=footnotesize}
[Ancho fijo]{.title}
```css
.container {
  width: 960px;
  margin: 0 auto;
}
```
:::

:::
::: {.column width="33%" }

::: {.mycode size=footnotesize}
[Fluido]{.title}
```css
.container {
  width: 100%;
}
```
:::

:::
::: {.column width="33%" }

::: {.mycode size=footnotesize}
[Usando [max-width]{.verbatim}]{.title}
```css
.container {
  width: 100%;
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 1rem;
}
```
:::

:::
::::::::::::::

- **Ancho fijo**: Este diseño funcionaba correctamente en monitores de la época, pero presentaba varios inconvenientes:
  - En móviles aparecía desplazamiento horizontal.
  - En pantallas pequeñas el contenido no cabía.
  - Era necesario crear numerosas Media Queries para corregir el diseño.
- **Uso de porcentajes**: Ahora el contenedor ocupa siempre todo el ancho disponible. Sin embargo, en un monitor de gran tamaño los párrafos pueden resultar excesivamente largos.
- **Uso de [max-width]{.verbatim}**: En un móvil ocupará todo el ancho, en un portátil crecerá progresivamente y en pantallas muy anchas (estilo *ultra-wide*) nunca superará los **1200 px**.
  - El uso de [margin]{.verbatim} ayuda a centrar el contenido.
  - Con [padding]{.verbatim} hacemos que el texto no esté pegado al borde del dispositivo.


## Mejorando el contenedor {#mejorando-contenedor}

Podemos mejorar el contenedor fluido creado anteriormente utilizando menos reglas, pero manteniendo el comportamiento:

::: {.mycode }
[Mejorando contenedor]{.title}
```css
.container {
    width: min(100%, 1200px);
    margin-inline: auto;
    padding-inline: 1rem;
}
```
:::

Novedades:

- [min()]{.verbatim} elige el valor menor entre [100%]{.verbatim} y [1200px]{.verbatim}.
- [margin-inline]{.verbatim} sustituye a [margin-left]{.verbatim} y [margin-right]{.verbatim}.
- [padding-inline]{.verbatim} aplica el relleno horizontal respetando la dirección del texto.



