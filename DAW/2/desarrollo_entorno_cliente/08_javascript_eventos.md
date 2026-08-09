
# Introducción {#introducción-eventos}

Hasta ahora hemos aprendido a acceder a los elementos del DOM y a modificarlos mediante JavaScript. Sin embargo, una página web todavía no resulta interactiva, ya que lo habitual es reaccionar a las acciones realizadas por el usuario:

- Pulsar un botón.
- Escribir en un cuadro de texto.
- Seleccionar una opción.
- Mover el ratón.
- Pulsar una tecla.
- Arrastrar un elemento.

Estas acciones reciben el nombre de **eventos**. Gracias a ellos, JavaScript puede ejecutar código exactamente en el momento en que ocurre una determinada acción. Los eventos pueden ser provocados por:

- El usuario.
- El navegador.
- El propio documento HTML.

Entre todos los eventos que existen (de [elemento](https://developer.mozilla.org/en-US/docs/Web/API/Element#events), del [document](https://developer.mozilla.org/en-US/docs/Web/API/Document#events), ..), podemos destacar los siguientes por ser de los más utilizados:

| Evento | Acción |
|---------|--------|
| [click]{.verbatim} | El usuario pulsa un elemento. |
| [dblclick]{.verbatim} | Doble clic. |
| [input]{.verbatim} | Cambia el contenido de un campo de texto. |
| [change]{.verbatim} | Finaliza un cambio en un formulario. |
| [submit]{.verbatim} | Se envía un formulario. |
| [keydown]{.verbatim} | Se pulsa una tecla. |
| [keyup]{.verbatim} | Se libera una tecla. |
| [mouseenter]{.verbatim} | El ratón entra en un elemento. |
| [mouseleave]{.verbatim} | El ratón sale del elemento. |
| [load]{.verbatim} | La página termina de cargarse. |


## Programación dirigida por eventos {#programación-dirigida-eventos}

Las aplicaciones web modernas funcionan mediante un modelo denominado **programación dirigida por eventos**. En lugar de ejecutar instrucciones una detrás de otra hasta finalizar el programa, JavaScript permanece esperando a que ocurra algún evento.

Cuando el evento se produce, ejecuta el código asociado y después vuelve a esperar el siguiente evento. Este comportamiento permite que una página permanezca activa e interactiva mientras el usuario la utiliza.

Realmente no es JavaScript quien detecta directamente las acciones del usuario, sino que es el navegador quien observa continuamente lo que ocurre. Cuando detecta un evento, avisa al motor de JavaScript para que ejecute la función correspondiente.

<!-- De hecho, podemos hacer que el navegador deje de detectar ciertos eventos, ideal para debuggear:
https://devtoolstips.org/tips/en/disable-event-listeners/

- En **Chrome**, en la pestaña Elements, a la derecha hay un apartado "Event Listeners"
- En **Firefox**, TODO: poner dónde está 
-->


# Registrar eventos con [addEventListener()]{.verbatim} {#registrar-evento}

Para que JavaScript responda a un evento es necesario registrarlo. Actualmente **la forma recomendada consiste en utilizar el método [[addEventListener()]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/API/EventTarget/addEventListener)** (disponible desde 2015). Este método permite asociar una función a cualquier evento, por lo tanto recibe al menos dos parámetros principales.

- El nombre del evento.
- La función que se ejecutará cuando ocurra.

:::::::::::::: {.columns }
::: {.column width="32%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```html
<button id="boton">
    Pulsar
</button>

<ul id="lista"></ul>
```
:::

:::
::: {.column width="63%" }

::: {.mycode size=footnotesize}
[JavaScript]{.title}
```javascript
const boton = document.querySelector("#boton");

boton.addEventListener(
    "click",
    function () {
        console.log("Botón pulsado.");
        const e = document.createElement("li");
        e.textContent = "elemento";
        const l = document.getElementById("lista");
        l.append(e);
    }
);
```
:::

:::
::::::::::::::

Con este ejemplo hemos unido crear un evento con la creación de elementos visto anteriormente. Cuando se pulsa el botón se crea un elemento que se añade a la lista, aparte de lanzar un mensaje en consola. En la [documentación](https://developer.mozilla.org/en-US/docs/Web/API/EventTarget/addEventListener) se pueden ver todas las opciones con las que cuenta [addEventListener()]{.verbatim}.

En este caso, hemos creado la función (al estilo clásico) dentro del evento, pero podemos usar una función flecha o llamar a una función ya existente:

:::::::::::::: {.columns }
::: {.column width="55%"}

::: {.mycode size=footnotesize}
[Función flecha]{.title}
```javascript
boton.addEventListener(
    "click",
    () => {
        console.log("Botón pulsado.");
    }
);
```
:::

:::
::: {.column width="45%" }

::: {.mycode size=footnotesize}
[Llamar a función existente]{.title}
```javascript
boton.addEventListener(
    "click",
    nuevoElemento
);
```
:::

:::
::::::::::::::

::: exercisebox
[[16a](https://github.com/yuki/ejercicios/blob/main/daw/dec/16a.html)]{.solution}

Usa el ejemplo anterior y crea 3 botones que lancen eventos [click]{.verbatim} con función completa, flecha y llame a una función existente.
:::


## Un elemento con varios eventos {#elemento-varios-eventos}

Un mismo elemento puede responder a distintos eventos.

::: mycode
[Llamar a función existente]{.title}
```javascript
boton.addEventListener(
    "mouseenter",
    () => { console.log("Ratón encima.");}
);

boton.addEventListener(
    "mouseleave",
    () => { console.log("Ratón sale del botón.");}
);
```
:::



## Varias funciones para el mismo evento {#mismo-evento-varias-funciones}

Hay situaciones que queremos tener dos o más funciones para el mismo evento, por lo tanto, podemos registrar varias funciones para el mismo evento.

::: mycode
[Llamar a función existente]{.title}
```javascript
boton.addEventListener(
    "click",
    () => console.log("Primera")
);

boton.addEventListener(
    "click",
    () => console.log("Segunda")
);
```
:::

Al hacer click sobre el botón se ejecutarán ambas funciones.


## ¿Por qué utilizar [addEventListener()]{.verbatim}? {#por-qué-utilizar-addeventlistener}

A la hora de crear eventos con HTML y JavaScript también se puede hacer de las siguientes maneras:

:::::::::::::: {.columns }
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[Función inline en HTML]{.title}
```HTML
<!-- añadir función en HTML-->
<button onclick="saludar()">
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[Añadir evento al elemento]{.title}
```javascript
// añadir evento al elemento
boton.onclick = function (){
    console.log("Hola");
}
boton.onclick = function (){
    console.log("Adios");
}
```
:::

:::
::::::::::::::

::: questionbox
¿Qué pasa al pulsar el botón? Cuál de las tres funciones se ejecuta?
:::

::: exercisebox
[[16b](https://github.com/yuki/ejercicios/blob/main/daw/dec/16b.html)]{.solution}

Partiendo del ejercicio anterior:

- Añade al botón1 los eventos [mouseenter]{.verbatim} y [mouseleave]{.verbatim}.
- Añade al botón1 la función inline en HTML [onclick]{.verbatim}.
- Añade dos eventos [onclick]{.verbatim} al elemento del botón1 en JavaScript.

¿Qué se termina ejecutando al hacer click al botón1?
:::

Tal como se ha podido comprobar al hacer el ejercicio, usar [addEventListener()]{.verbatim} añade una serie de ventajas respecto a los métodos "antiguos":

- Separar HTML y JavaScript facilita el mantenimiento del código.
- Permite registrar varios manejadores **para un mismo evento**.
  - El método *inline* sólo nos permite añadir una función.
  - Nos aseguramos que un evento al elemento no sobreescribe código ya escrito.
- [addEventListener()]{.verbatim} permite añadir más parámetros para controlar la propagación del evento.

::: infobox
Se recomienda utilizar siempre [addEventListener()]{.verbatim}.
:::


## Eliminar eventos con [removeEventListener()]{.verbatim} {#eliominar-eventos}

Hasta ahora hemos aprendido a asociar una función a un evento, pero en algunas situaciones también puede ser necesario **eliminar un evento** para que deje de ejecutarse. Para ello JavaScript tenemos el método [removeEventListener()]{.verbatim}.

Eliminar un evento resulta útil en situaciones como las siguientes:

- Evitar que una acción pueda ejecutarse varias veces.
- Eliminar eventos de elementos que ya no se utilizan.
- Mejorar el rendimiento en aplicaciones complejas.

Sirva el siguiente código como ejemplo, en el que al pulsar el botón **Desactivar evento**, el botón principal dejará de responder al evento [click]{.verbatim}.

:::::::::::::: {.columns }
::: {.column width="31%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```HTML
<button id="boton">
    Pulsar
</button>

<button id="quitar">
    Quitar evento
</button>
```
:::

:::
::: {.column width="64%" }

::: {.mycode size=footnotesize}
[Eliminar evento]{.title}
```javascript
const boton = document.querySelector("#boton");
const desactivar = document.querySelector("#quitar");

function saludar() {
    console.log("Hola");
}

boton.addEventListener("click", saludar);

desactivar.addEventListener("click", () => {
    boton.removeEventListener("click", saludar);
});
```
:::

:::
::::::::::::::


Usar [removeEventListener()]{.verbatim} sólo funciona cuando se indica la referencia de una función existente, no valdría con una función inline o función flecha.

::: exercisebox
[[16c](https://github.com/yuki/ejercicios/blob/main/daw/dec/16c.html)]{.solution}

Usa [removeEventListener()]{.verbatim} para eliminar un evento creado previamente.
:::

<!-- 
TODO: añadir abortsignal para eliminación automática con el options:
https://developer.mozilla.org/en-US/docs/Web/API/EventTarget/addEventListener#examples
https://developer.mozilla.org/en-US/docs/Web/API/AbortController
 -->

## Opciones de la función {#opciones-función}

Aparte de los parámetros vistos, el tipo de evento y la función, [addEventListener()]{.verbatim} puede recibir [parámetros opcionales](https://developer.mozilla.org/en-US/docs/Web/API/EventTarget/addEventListener#options) diferenciados en:

- [options]{.verbatim}: Un objeto que especifica características sobre el *event listener*. Entre las opciones disponibles están:
  - [once]{.verbatim}: valor booleano que si es [true]{.verbatim} automáticamente se elimina tras ser invocado. Es la alternativa a usar el [removeEventListener()]{.verbatim} visto anteriormente.
  - [signal]{.verbatim}: permite asociar una señal.


# El objeto [Event]{.verbatim} {#objeto-event}

Cuando ocurre un evento, el navegador genera automáticamente un objeto que contiene toda la información relacionada con él. Este objeto recibe el nombre de **[[Event]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/API/Event)**. JavaScript se lo puede pasar automáticamente como argumento a la función que gestiona el evento. El nombre de la variable que se le pasa a la función suele ser "[event]{.verbatim}" o "[e]{.verbatim}" para abreviar.

:::::::::::::: {.columns }
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[Mostrar datos del evento]{.title}
```javascript
boton.addEventListener(
    "click",
    (event) => {
        console.log(event);
    }
);
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[Mostrar datos del evento]{.title}
```javascript
boton.addEventListener(
    "click",
    (e) => {
        console.log(e);
    }
);
```
:::

:::
::::::::::::::

Cada vez que el usuario haga clic, el navegador mostrará un objeto con abundante información.

## Propiedades de [Event]{.verbatim} {#atributos-event}

El objeto [Event]{.verbatim} contiene decenas de propiedades y métodos, y en la práctica únicamente se utilizan aquellas necesarias para resolver un problema concreto. Por poner unos ejemplos están los siguientes atributos:

- [type]{.verbatim}: Indica el tipo de evento que ha ocurrido.
- [target]{.verbatim}: Qué elemento ha generado el evento.
- [currentTarget]{.verbatim}: Indica el elemento que tiene registrado el [addEventListener()]{.verbatim}. Aunque puede coincidir con el atributo anterior, no siempre es así, ya que [target]{.verbatim} puede ser un elemento hijo del que tiene registrado el evento.
- [clientX]{.verbatim} y [clientY]{.verbatim}: Las coordenadas del ratón.
- [key]{.verbatim} y [code]{.verbatim}: indica la tecla generada y la tecla física del teclado.



## Interfaces basadas en Event {#interfaces-basadas} 

Aunque todos los eventos generan un objeto [Event]{.verbatim}, existen distintas [interfaces especializados](https://developer.mozilla.org/en-US/docs/Web/API/Event\#interfaces_based_on_event). Algunas de ellas:

- [MouseEvent](https://developer.mozilla.org/en-US/docs/Web/API/MouseEvent): tal como dice la documentación, eventos que suceden cuando el usuario interactúa con "un dispositivo de apuntado" (como el ratón).
- [KeyboardEvent](https://developer.mozilla.org/en-US/docs/Web/API/KeyboardEvent): eventos de interacción con el teclado.
- [SubmitEvent](https://developer.mozilla.org/en-US/docs/Web/API/SubmitEvent): este evento actúa cuando la acción [submit]{.verbatim} de un formulario se invoca.
- [InputEvent](https://developer.mozilla.org/en-US/docs/Web/API/InputEvent): eventos que funcionan con cambios en los contenidos editables.
- [FocusEvent](https://developer.mozilla.org/en-US/docs/Web/API/FocusEvent): eventos que tienen que ver con el "foco".
- [TouchEvent](https://developer.mozilla.org/en-US/docs/Web/API/TouchEvent): para pantallas táctiles o *trackpads*.
- [DragEvent](https://developer.mozilla.org/en-US/docs/Web/API/DragEvent): eventos que representan la interacción *drag & drop*.

- [GamepadEvent](https://developer.mozilla.org/en-US/docs/Web/API/GamepadEvent): es el interfaz con la API de mandos de juegos.


# Ejemplos de eventos {#ejemplos-de-eventos}

A continuación vamos a ver distintos ejemplos de eventos usados de manera habitual.


## Eventos de ratón {#eventos-ratón}

Todos los ejemplos vistos hasta ahora han tenido en cuenta el evento [click]{.verbatim} que pertenece al ratón y lanzan un *[MouseEvent](https://developer.mozilla.org/en-US/docs/Web/API/MouseEvent)*. A continuación un nuevo ejemplo junto con el uso de propiedades de [Event]{.verbatim}:

:::::::::::::: {.columns }
::: {.column width="30%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```html
<button>Rojo</button>

<button>Verde</button>

<button>Azul</button>
```
:::

:::
::: {.column width="65%" }

::: {.mycode size=footnotesize}
[Añadir evento al elemento]{.title}
```javascript
const botones = document.querySelectorAll("button");

for (const boton of botones) {
    boton.addEventListener("click", (e) => {
        console.log(e.target.textContent);
        console.log(`X,Y: ${e.clientX},${e.clientY}`);
    });
}
```
:::

:::
::::::::::::::


::: exercisebox
[[16d](https://github.com/yuki/ejercicios/blob/main/daw/dec/16d.html)]{.solution}

- Crea tres botones con eventos para obtener información del objeto [Event]{.verbatim}.
- Crea un elemento [div]{.verbatim} con un evento. Que este [div]{.verbatim} contenga a su vez otros dos. Comprueba la diferencia entre [target]{.verbatim} y [currentTarget]{.verbatim}
:::


## Eventos de teclado {#eventos-teclado}

Cuando el usuario pulsa una tecla se genera un objeto [KeyboardEvent](https://developer.mozilla.org/en-US/docs/Web/API/KeyboardEvent). Podemos generar un evento en el [document]{.verbatim} que funcione como *keylogger*:

::: {.mycode size=footnotesize}
[Evento de teclado]{.title}
```javascript
document.addEventListener("keydown", (e) => {
    console.log(`${e.key} y ${e.code}`);
});
```
:::

::: exercisebox
[[16e](https://github.com/yuki/ejercicios/blob/main/daw/dec/16e.html)]{.solution}

Crea una web que genere una alerta al introducir el [código Konami](https://en.wikipedia.org/wiki/Konami_Code).
:::


## Eventos de entrada {#eventos-entrada}

Los elementos de [entrada](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/input) ([<input>]{.verbatim}) de los formulario generan eventos específicos al editarlos o también cuando obtienen el foco.

:::::::::::::: {.columns }
::: {.column width="35%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```html
<form id="form">
    <input id="nombre">
</form>
<pre id="output"></pre>
```
:::

:::
::: {.column width="65%" }

::: {.mycode size=footnotesize}
[Añadir evento al input]{.title}
```javascript
const form = document.querySelector("#form");
const nombre = document.querySelector("#nombre");
form.addEventListener("input", (e) => {
    console.log(e.target.value);
});

nombre.addEventListener("focus", (e) => {
    console.log(e.target.value);
});
```
:::

:::
::::::::::::::

Cada vez que el usuario escriba una letra aparecerá el contenido actual del cuadro de texto, y también cuando el texto reciba el foco.

::: exercisebox
[[16f](https://github.com/yuki/ejercicios/blob/main/daw/dec/16f.html)]{.solution}

Crea un formulario con un [input]{.verbatim}, [range]{.verbatim} y [textarea]{.verbatim}, que loguee quién tiene el foco y el valor al realizar un cambio.
:::




## Eventos de formulario/envío {#eventos-envío}

Los formularios también generan un evento cuando intentan enviarse, al realizar el evento [submit]{.verbatim}

::: mycode
[Añadir evento al formulario]{.title}
```javascript
const formulario = document.querySelector("form");

formulario.addEventListener("submit", (evento) => {
    console.log("Formulario enviado");
});
```
:::



# Evitar comportamiento predeterminado {#evitar-comportamiento-predeterminado}

Algunos elementos poseen un comportamiento predeterminado: que un enlace abra otra página o enviar al servidor un formulario. En ocasiones interesa evitar ese comportamiento. Para ello tenemos la función [preventDefault()]{.verbatim}.

::: mycode
[Evitar comportamiento predeterminado]{.title}
```javascript
formulario.addEventListener("submit", (evento) => {
    evento.preventDefault();
    console.log("Envío cancelado.");
});
```
:::

# Parar propagación del evento {#parar-propagación}

Los eventos se propagan por el árbol DOM de abajo-arriba. Cuando un contenedor contiene a otro y ambos escuchan eventos, al lanzar un evento desde el elemento más bajo, el contenedor que contiene ese elemento también recibirá el evento. Para parar esa propagación está la función [stopPropagation()]{.verbatim}

::: mycode
[Parar propagación]{.title}
```javascript
formulario.addEventListener("submit", (evento) => {
    evento.stopPropagation();
});
```
:::

::: exercisebox
[[16g](https://github.com/yuki/ejercicios/blob/main/daw/dec/16g.html)]{.solution}

- Crea un [div]{.verbatim} que contenga otro. Ambos pueden recibir el evento [click]{.verbatim}.
- Con un [checkbox]{.verbatim} controla si quieres parar la propagación del evento.
- Haz click en ambas situaciones: ¿qué ocurre?
:::

