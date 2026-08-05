
# El DOM (*Document Object Model*) {#el-dom}

Cuando un navegador carga una página web, no trabaja directamente con el código HTML. En su lugar, analiza el documento y construye una representación interna denominada ***Document Object Model***, o simplemente **[DOM](https://developer.mozilla.org/en-US/docs/Web/API/Document_Object_Model)**.

El DOM convierte todos los elementos HTML (también XML o SVG) en objetos JavaScript (que tienen sus propios atributos), que se representa mediante un árbol de nodos o ***DOM tree***. El DOM realmente es un [web API](https://developer.mozilla.org/en-US/docs/Web/API) y [estándar](https://dom.spec.whatwg.org/), y a través del DOM JavaScript puede:

- Leer el contenido de una página.
- Modificar contenido.
- Cambiar estilos.
- Crear/eliminar elementos.
- Responder a las acciones del usuario.

Veamos el siguiente HTML y cuál es el árbol DOM que se genera.

:::::::::::::: {.columns }
::: {.column width="47%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```html
<!DOCTYPE html>
<html>
    <head>
        <title>Ejemplo</title>
    </head>
    
    <body>
        <h1>Mi página</h1>
        <p>Bienvenido.</p>
    </body>
</html>
```
:::

:::
::: {.column width="47%" }

![Árbol DOM](img/dec/dom.svg){width="100%"}

:::
::::::::::::::

Una de las características más importantes del DOM es que puede modificarse en cualquier momento. Una página puede cambiar automáticamente un texto, mostrar nuevos elementos o eliminar contenido sin necesidad de recargarse. **Este comportamiento es la base de las aplicaciones web modernas**.

En una página web cada tecnología desempeña una función distinta.

| Tecnología | Función |
|------------|---------|
| HTML | Define la estructura del documento. |
| CSS | Define la presentación y el aspecto visual. |
| JavaScript | Añade comportamiento e interacción. |

El DOM constituye el puente que permite a JavaScript modificar el contenido HTML y aplicar cambios visuales mediante CSS. Las herramientas para desarrolladores de cualquier navegador permiten inspeccionar el DOM: al pulsar **F12** y seleccionar la pestaña **Elements** (o **Inspector**, según el navegador), puede observarse el árbol completo generado a partir del documento HTML.

::: infobox
Desde "herramientas para desarrolladores" del navegador podemos ver el árbol DOM.
:::

## Estructura del árbol DOM {#estructura-árbol-dom}

El DOM organiza todos los elementos mediante relaciones familiares.

Cada nodo puede tener:

- Un padre (***parent***): En el ejemplo anterior el padre de [<h1>]{.verbatim} es [<body>]{.verbatim}.
- Uno o varios hijos (***children***): [<body>]{.verbatim} tiene dos hijos.
- Hermanos (***siblings***): el [<h1>]{.verbatim} tiene un hermano a nivel jerárquico que es el [<p>]{.verbatim}.

Comprender estas relaciones facilita enormemente la navegación por el documento. Cada elemento conoce su posición dentro del árbol, y gracias a ello es posible recorrer toda la estructura del documento. Un símil sería una estructura de ficheros, eligiendo un fichero de manera aleatoria, podemos ver si tiene hijos (si es un directorio), hermanos (otros ficheros en la misma ruta) o subir al directorio padre.

::: infobox
Podemos comparar el árbol DOM como un sistema de ficheros: conociendo el elemento, podemos ir a cualquier otro.
:::

## Tipos de nodos {#tipos-nodos}

Aunque habitualmente trabajaremos con elementos HTML, el DOM contiene distintos tipos de nodos:

- Documento.
- Elementos HTML.
- Comentarios.
- Texto.

:::::::::::::: {.columns }
::: {.column width="47%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```html
<p>Bienvenido.</p>
```
:::

:::
::: {.column width="47%" }

El **elemento** [<p>]{.verbatim} es un nodo. El texto ["Bienvenido"]{.verbatim} también constituye otro **nodo**.

:::
::::::::::::::

### El nodo raíz: [document]{.verbatim} {#objeto-document}

Todo el DOM se encuentra representado mediante un objeto global llamado [[document]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/API/Document), y este objeto constituye el punto de entrada para acceder a cualquier elemento de la página. Es el nodo más alto en la jerarquía, el nodo raíz, el "[padre de todos](https://es.wikipedia.org/wiki/Od%C3%ADn)".

Dentro de este nodo raíz, hay distintas propiedades que va a tener todo HTML, entre los que se puede destacar:

- [head]{.verbatim}: este nodo es de **sólo lectura** y devuelve el [<head>]{.verbatim} del documento.
- [body]{.verbatim}: representa el cuerpo del documento, donde tendremos los nodos y elementos con los que queremos interactuar.
- [title]{.verbatim}: el título del documento actual, podemos obtenerlo o modificarlo.


::: exercisebox
[[15a](https://github.com/yuki/ejercicios/blob/main/daw/dec/15a.html)]{.solution}

Crea un HTML básico y obtén las propiedades explicadas de [document]{.verbatim}. Cambia el [title]{.verbatim} de la página.
:::


# Navegación por el árbol DOM {#navegar-árbol-dom}

Antes de modificar un elemento es necesario localizarlo dentro del DOM. Una vez seleccionado, podremos navegar desde este elemento al resto de elementos (padre, hijos, hermanos) usándolo como ruta relativa. Como se ha dicho previamente, imaginemos el DOM como si fuese un sistema de ficheros.

## Selección de elementos {#selección-elementos}

JavaScript proporciona [varios métodos](https://developer.mozilla.org/en-US/docs/Web/API/Document) para realizar esta tarea, y todos ellos pertenecen al objeto [document]{.verbatim}.

### Selección por identificador único {#selección-identificador}

Dentro de HTML las etiquetas pueden tener un identificador que debe ser único en todo el documento llamado [id]{.verbatim}.

:::::::::::::: {.columns }
::: {.column width="38%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```html
<h1 id="titulo">Mi página</h1>
```
:::

:::
::: {.column width="59%" }

::: {.mycode size=footnotesize}
[Selección por id]{.title}
```javascript
const titulo = document.getElementById("titulo");
```
:::

:::
::::::::::::::

La variable [titulo]{.verbatim} contiene ahora el objeto correspondiente al elemento [<h1>]{.verbatim}. 

::: warnbox
Si no se encuentra ningún elemento, el resultado será [null]{.verbatim}.
:::

### Selección mediante un selector CSS {#selección-css}

Con este método vamos a poder seleccionar prácticamente cualquier selector de CSS.

:::::::::::::: {.columns }
::: {.column width="38%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```html
<h1 id="titulo">Mi página</h1>
<p class="vip">Muy VIP</p>
<p>otro texto</p>
```
:::

:::
::: {.column width="59%" }

::: {.mycode size=footnotesize}
[Selección por CSS]{.title}
```javascript
const titulo = document.querySelector("#titulo");
const vip = document.querySelector(".vip");
const p = document.querySelector("p");
```
:::

:::
::::::::::::::

Es importante saber que sólo nos devuelve **el primer elemento** que cumple la condición.

::: errorbox
[querySelector()]{.verbatim} sólo nos devuelve el primer elemento que cumpla la condición.
:::


### Seleccionar varios elementos {#seleccionar-varios-elementos}

Si deseamos obtener todos los elementos que cumplen un selector utilizaremos [querySelectorAll()]{.verbatim}:

::: {.mycode size=footnotesize}
[Selección por CSS]{.title}
```javascript
const parrafos = document.querySelectorAll("p");

for (const parrafo of parrafos) {
    console.log(parrafo);
}
```
:::

Tal como se puede ver, al seleccionar todos los elementos de tipo [p]{verbatim} obtendremos un array de elementos que podremos recorrer, y para cada elemento podremos realizar la tarea que queramos.



### ¿Qué método utilizar? {#método-utilizar-seleccionar}

Actualmente la mayoría de desarrolladores utilizan únicamente tres métodos:

| Método  | Devuelve  | Uso   | Obtiene |
|---------|----------|--------|--------|
| [getElementById()]{.verbatim} | [Element](https://developer.mozilla.org/en-US/docs/Web/API/Element) | [document]{.verbatim}  |  Un elemento mediante su identificador. |
| [querySelector()]{.verbatim}  | [Element](https://developer.mozilla.org/en-US/docs/Web/API/Element) | Cualquier nodo  |  El primer elemento que cumple un selector CSS. | 
| [querySelectorAll()]{.verbatim} |  [NodeList](https://developer.mozilla.org/en-US/docs/Web/API/NodeList) | Cualquier nodo  | Todos los elementos que cumplen un selector CSS. |

Table: {tablename=yukitblr colspec=X[2]X[1]X[1]X[3]}

Existen otros métodos más antiguos ([[getElementsByTagName()]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/API/Document/getElementsByTagName) , [[getElementsByClassName()]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/API/Document/getElementsByClassName) , etc.) aunque hoy en día se utilizan con menos frecuencia.


::: exercisebox
[[15b](https://github.com/yuki/ejercicios/blob/main/daw/dec/15b.html)]{.solution}

Crea un HTML y usa los métodos vistos hasta ahora para recorrer desde el [document]{.verbatim} y desde un nodo que contenga varios elementos.
:::

## Recorrer los elementos del DOM {#recorrer-dom}

En el apartado anterior hemos aprendido a localizar elementos dentro del DOM. Una vez localizado un elemento, también es posible desplazarse por el árbol DOM utilizando las relaciones de parentesco existentes entre los elementos. A través de un elemento podemos acceder a:

- El elemento padre.
- Los elementos hijos.
- El primer hijo.
- El último hijo.
- Los elementos hermanos.

Estas propiedades resultan especialmente útiles cuando conocemos la posición de un elemento dentro del documento y queremos movernos a partir de él.

Para los siguientes ejemplos vamos a partir del siguiente HTML:

::: mycode
[HTML con una lista]{.title}
```html
<ul id="lista">
    <li id="html">HTML</li>
    <li id="css">CSS</li>
    <li id="javascript">JavaScript</li>
</ul>
```
:::

### Obtener el elemento padre {#obtener-padre}

Todo elemento, excepto el nodo raíz, tiene un elemento padre. Podemos acceder a él mediante la propiedad [parentElement]{.verbatim}.

::: mycode
[Obtener padre]{.title}
```javascript
const elemento = document.querySelector("#html");
console.log(elemento.parentElement);
```
:::

### Obtener primer hijo {#obtener-primer-hijo}

Para obtener el primer elemento hijo utilizamos [firstElementChild]{.verbatim}.

::: mycode
[Obtener primer hijo]{.title}
```javascript
const lista = document.getElementById("lista");
console.log(lista.firstElementChild);
```
:::

::: questionbox
¿Por qué [firstElementChild]{.verbatim} y no [firstChild]{.verbatim}?
:::

La propiedad [firstChild]{.verbatim} devuelve **el primer nodo**, independientemente de su tipo. Por ejemplo, si el documento contiene espacios o saltos de línea antes del primer elemento, [firstChild]{.verbatim} puede devolver un nodo de texto. En cambio, [firstElementChild]{.verbatim} siempre devuelve el primer **elemento HTML**, por lo que su comportamiento suele ser más predecible.


### Obtener último hijo {#obtener-último-hijo}

Para obtener el último elemento hijo utilizamos [lastElementChild]{.verbatim}.

::: mycode
[Obtener último hijo]{.title}
```javascript
const lista = document.getElementById("lista");
console.log(lista.lastElementChild);
```
:::

### Obtener todos los hijos {#obtener-hijos}

La propiedad [children]{.verbatim} devuelve todos los elementos hijos directos, y podemos recorrerlos a través de un bucle

::: mycode
[Obtener todos los hijos]{.title}
```javascript
const lista = document.getElementById("lista");
console.log(lista.children);

for (const elemento of lista.children) {
    console.log(elemento.textContent);
}
```
:::

### Obtener el hermano siguiente {#obtener-hermano-siguiente}

Podemos acceder al siguiente elemento del mismo nivel, hermano, mediante [nextElementSibling]{.verbatim}:

::: mycode
[Obtener siguiente hermano]{.title}
```javascript
const lista = document.getElementById("lista");
const hijo = lista.firstElementChild;
console.log(hijo.nextElementSibling);
```
:::


### Obtener el hermano anterior {#obtener-hermano-anterior}

Similar al caso anterior, existe una propiedad para acceder al hermano anterior.

::: mycode
[Obtener hermano anterior]{.title}
```javascript
const e = document.querySelector("li:last-child");
console.log(e.previousElementSibling);
```
:::

### Recorrer varios hermanos {#recorrer-varios-hermanos}

Podemos recorrer todos los elementos de una lista desplazándonos de un hermano al siguiente.

::: mycode
[Recorrer varios hermanos]{.title}
```javascript
let elemento = lista.firstElementChild;

while (elemento) {
    console.log(elemento.textContent);
    elemento = elemento.nextElementSibling;
}
```
:::


### Resumen de navegación {#resumen-navegación}

La siguiente tabla sirve para poder tener un resumen de recorrer los elementos.

| Propiedad | Descripción |
|-----------|-------------|
| [parentElement]{.verbatim} | Devuelve el elemento padre. |
| [children]{.verbatim} | Devuelve todos los hijos directos. |
| [firstElementChild]{.verbatim} | Devuelve el primer hijo. |
| [lastElementChild]{.verbatim} | Devuelve el último hijo. |
| [nextElementSibling]{.verbatim} | Devuelve el hermano siguiente. |
| [previousElementSibling]{.verbatim} | Devuelve el hermano anterior. |


::: exercisebox
[[15b2](https://github.com/yuki/ejercicios/blob/main/daw/dec/15b2.html)]{.solution}

Crea una lista y usa los métodos vistos hasta ahora para recorrer la lista y obtener padre, hijo y hermanos.
:::


# Modificación del contenido {#modificación-contenido}

Una vez localizado un elemento del DOM, el siguiente paso consiste en modificar su contenido. JavaScript proporciona varias propiedades para realizar esta tarea:

- [textContent]{.verbatim}
- [innerHTML]{.verbatim}
- [innerText]{.verbatim}

Aunque las tres permiten cambiar el contenido de un elemento, existen diferencias importantes entre ellas.

## Propiedad [textContent]{.verbatim} {#textcontent}

La propiedad [textContent]{.verbatim} permite obtener o modificar todo el texto contenido en un elemento. Supongamos el siguiente HTML.

:::::::::::::: {.columns }
::: {.column width="45%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```html
<h1 id="ti">Hola</h1>
<p id="hola">
  Ey <span>Alice</span>
</p>
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[JavaScript]{.title}
```javascript
const ti = document.querySelector("#ti");
console.log(ti.textContent);
ti.textContent = "JavaScript";
```
:::

:::
::::::::::::::

Tal como se puede ver, se puede obtener el texto del elemento y también modificarlo.

::: questionbox
- ¿Qué pasa si cambiamos el texto del elemento [hola]{.verbatim}?
- ¿Qué pasa si lo cambiamos por [<b>Hola</b>]{.verbatim}?
:::


::: errorbox
[textContent]{.verbatim} no interpreta el código HTML.
:::


## Propiedad [innerHTML]{.verbatim} {#innerHTML}

[innerHTML]{.verbatim} permite leer o modificar el contenido HTML de un elemento. Resulta muy cómodo para modificar un componente y añadir nuevo HTML, el problema es que **puede introducir problemas de seguridad de ejecutar código JavaScript malicioso ya que interpreta el código introducido**.

:::::::::::::: {.columns }
::: {.column width="40%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```html
<h1 id="ti">Hola</h1>
<p id="hola">
  Ey <span>Alice</span>
</p>
<p id="nuevo"></p>
```
:::

:::
::: {.column width="55%" }

::: {.mycode size=footnotesize}
[JavaScript]{.title}
```javascript
const h = document.querySelector("#hola");
h.innerHTML = "<strong>Alice</strong>";
const n = document.querySelector("#nuevo");
n.innerHTML = `
  <h2>Noticias</h2>
  <p>bla bla</p>
`;
```
:::

:::
::::::::::::::



::: exercisebox
[[15c](https://github.com/yuki/ejercicios/blob/main/daw/dec/15c.html)]{.solution}

- Usa [innerHTML]{.verbatim} para modificar dos elementos e introduce código HTML.
- Usa [<img src="img.png" onload="alert('hacked!');">]{.verbatim}
- ¿Qué pasa con esta última instrucción? (tienes que usar una imagen existente).
:::

::: errorbox
[innerHTML]{.verbatim} puede ocasionar problemas de seguridad porque interpreta el código introducido.
:::

## Propiedad [innerText]{.verbatim} {#propiedad-innertext}

[innerText]{.verbatim} también trabaja con texto, pero únicamente tiene en cuenta el contenido visible. Es decir, ignora texto oculte (*hidden*) y código de estilo o de etiquetas [<script>]{.verbatim}. En la [documentación de MDN](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/innerText) hay un ejemplo.


::: exercisebox
- Usa la [documentación de MDN](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/innerText) y el [playground](https://developer.mozilla.org/en-US/play?uuid=bdfb68097c54aa07d71556591c5119502c820ef7&state=jVJNb9swDP0rBHdZgS5ekWEYHMWHtQHaywZsOfSgi2qztVeFEiR6aVAU2K%2FZD9svGWR7sZGsRS%2F64CPfIx%2F4iLVsLOao6nnx3bWhJCBLG2LJVVbPC83KQ1MtNcYO1VhoBlBRdpa6J8CbHoLH%2FgtQOutCDoGqRR96GhKFHmRMS793EgzHWxc2ObTeUyhNpGmVykYpFb3hvptUO%2FQCsDb3BAasc%2FdgRN0EyAakdluQuomd1hRoIjQsFHwgoQpuyLrtbNDzhidynfxSY9VEb80uZ8fJhcuri4vVF1ivrtf7EpX5dNbz4hvF1gq420743LFMHU0xE8iMowwZX1vxrWiE4LZxqfHsk8bkZnp%2FeJ%2FiZCrHdlf8%2BfVbZf94jkQbZgprenhOco8fCn58rR6eYhkj5oin%2BCPdpeMoMGzCEipXtmmLZnckq36hPu%2BuqrfjHp0sNPdFRwa8WP8fu0aqg8FeJDoyIdFoPuKf%2FTS2TTP1nc8mCQvNByyHyXt40XkmNW0Ic7TNXS349Bc%3D&srcPrefix=%2Fen-US%2Fdocs%2FWeb%2FAPI%2FHTMLElement%2FinnerText%2F) para ver qué hace [innerText]{.verbatim}.
- Modifica para usar el ejemplo con [innerHTML]{.verbatim} y [textContent]{.verbatim}.
- ¿Qué diferencia hay entre ellos?
:::

# Atributos de los elementos {#atributos-elementos}

Los elementos HTML poseen atributos que describen sus características. Con JavaScript vamos a poder consultar, modificar, añadir o eliminar dichos atributos.

Desde JavaScript vamos a poder acceder a los atributos HTML de los elementos y a las propiedades del objeto del DOM. En principio **el navegador mantiene sincronizadas ambas** si realizamos modificaciones.


## Obtener atributos {#obtener-atributos}

Si queremos obtener los nombres de los atributos que están *seteados* de un elemento podemos utilizar [getAttributeNames()]{.verbatim}. Este método nos devolverá un array con los nombres, por lo que podemos recorrerlo con un bucle de los que hemos visto previamente.

Si lo que queremos es obtener el contenido de un atributo en concreto usaremos [getAttribute("nombre")]{.verbatim}.

::: warnbox
Si el atributo no existe nos devolverá [null]{.verbatim}.
:::

:::::::::::::: {.columns }
::: {.column width="38%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```html
<img src="img.png" id="foto">

<a href="https://kernel.org">
    Visitar
</a>

<input type="text">
```
:::

:::
::: {.column width="57%" }

::: {.mycode size=footnotesize}
[Obtener atributos]{.title}
```javascript
const imagen = document.querySelector("#foto");
let nombres = imagen.getAttributeNames();

for (let n of nombres){
    console.log(n);
    imagen.getAttribute(n);
}

//acceder directamente al id
console.log(imagen.id);
```
:::

:::
::::::::::::::

Si conocemos los atributos del objeto podemos acceder a ellos directamente a través del objeto.


## Modificar atributos {#modificar-atributos}

Podemos modificar atributos de un elemento, o crear nuevos atributos, usaremos la función [setAttribute()]{.verbatim}

::: mycode
[Modificar atributo]{.title}
```javascript
const enlace = document.querySelector("a");
//modifica el atributo HTML
enlace.setAttribute("target","_blank");

//modifica el objeto DOM
enlace.href="https://www.google.com";
```
:::

## Crear atributos personalizados {#crear-atributos}

Aunque nada nos impide a crear atributos personalizados con el nombre que queramos, **las buenas prácticas y el estándar nos dice que tenemos que crearlos con el nombre empezando por [data-]{.verbatim}**. La [documentación](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Global_attributes/data-*) nos indica que de esta manera esa información se intercambiará entre el HTML y el DOM.

::: mycode
[Crear atributo personalizado]{.title}
```javascript
const enlace = document.querySelector("a");

enlace.setAttribute("data-grado","DAW");
enlace.setAttribute("data-curso",2);

//obtener todos los atributos personalizados
console.log(enlace.dataset);
//acceder a un atributo personalizado concreto
console.log(enlace.dataset.grado);
console.log(enlace.dataset.curso);
```
:::

Estos atributos resultan muy útiles para almacenar información relacionada con un elemento.

## Eliminar atributos {#eliminar-atributos}

Al igual que podemos crear, también podemos eliminar un atributo concreto

::: mycode
[Eliminar atributo]{.title}
```javascript
enlace.removeAttribute("target");
```
:::

## Comprobar si existe {#atributo-existe}

Para comprobar si un atributo existe podemos usar [hasAttribute()]{.verbatim} que nos devolverá un booleano.

::: mycode
[Comprobar si existe]{.title}
```javascript
console.log(enlace.hasAttribute("href"));
```
:::


::: exercisebox
[[15d](https://github.com/yuki/ejercicios/blob/main/daw/dec/15d.html)]{.solution}

Usa las funciones que hemos visto sobre atributos.
:::

# Gestión de clases CSS {#clases-css}

Las clases CSS permiten modificar el aspecto visual de un elemento. JavaScript puede añadir clases, eliminarlas o alternarlas dinámicamente, de esta manera podemos mostrar/ocultar elementos dinámicamente, resaltar información, cambiar colores, modificar la interfaz según acciones del usuario... 

Para toda acción con las clases se debe utilizar la propiedad [classList]{.verbatim} que contiene distintas funciones que veremos a continuación.

Para los siguientes ejemplos se va a utilizar el siguiente código:


:::::::::::::: {.columns }
::: {.column width="38%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```html
<p id="mensaje">
    Bienvenido
</p>
```
:::

:::
::: {.column width="57%" }

::: {.mycode size=footnotesize}
[CSS]{.title}
```css
.destacado {
    color: red;
    font-weight: bold;
}
.italica {
    font-style: italic;
}
```
:::

:::
::::::::::::::


## Añadir clases {#añadir-clases}

Si queremos añadir una clase a un elemento concreto se puede usar [classList.add()]{.verbatim}.

::: {.mycode size=footnotesize}
[Añadir clase]{.title}
```javascript
const mensaje = document.querySelector("#mensaje");
mensaje.classList.add("destacado");
```
:::

## Alternar una clase {#alternar-clase}

El método [classList.toggle()]{.verbatim} añade la clase si el elemento no la tiene, y si la tiene la elimina.

::: {.mycode size=footnotesize}
[Alternar clase]{.title}
```javascript
const mensaje = document.querySelector("#mensaje");
mensaje.classList.toggle("italica");
```
:::


## Comprobar si existe una clase {#comprobar-clase}

Para saber si un elemento tiene una clase podemos usar la función [classList.contains()]{.verbatim}, que nos devuelve un booleano.

::: {.mycode size=footnotesize}
[Añadir clase]{.title}
```javascript
const mensaje = document.querySelector("#mensaje");
console.log(mensaje.classList.contains("italica"));
```
:::

## Reemplazar una clase {#reemplazar-clase}

Si queremos modificar una clase por otra tenemos la función [classList.replace()]{.verbatim}.

::: {.mycode size=footnotesize}
[Añadir clase]{.title}
```javascript
const mensaje = document.querySelector("#mensaje");
mensaje.classList.replace(
    "destacado", // reemplaza esta clase
    "normal"     // por esta otra
);
```
:::

## Añadir varias clases {#añadir-varias-clases}

Si queremos añadir varias clases en lugar de ir una a una, podemos utilizar [classList.add()]{.verbatim}

::: {.mycode size=footnotesize}
[Añadir clase]{.title}
```javascript
const mensaje = document.querySelector("#mensaje");
mensaje.classList.add(
    "rojo",
    "grande",
    "centrado"
);
```
:::

## Atributo [className]{.verbatim} {#atributo-classname}

El atributo [className]{.verbatim} tiene dos funciones:

- Nos devuelve todas las clases existentes
- Nos permite modificar todas las clases

::: {.mycode size=footnotesize}
[Añadir clase]{.title}
```javascript
const mensaje = document.querySelector("#mensaje");
// obtener todas las clases
console.log(mensaje.className);

mensaje.className = "destacado italica";
```
:::

## Resumen {#resumen-clases}

| Método | Función |
|---------|---------|
| [classList.add()]{.verbatim } | Añade una clase. |
| [classList.remove()]{.verbatim } | Elimina una clase. |
| [classList.toggle()]{.verbatim } | Añade o elimina una clase. |
| [classList.contains()]{.verbatim } | Comprueba si existe una clase. |
| [classList.replace()]{.verbatim } | Sustituye una clase por otra. |
| [className]{.verbatim } | Obtiene todas las clases o las reemplaza. |


::: exercisebox
[[15e](https://github.com/yuki/ejercicios/blob/main/daw/dec/15e.html)]{.solution}

Usa las funciones anteriores para modificar las clases de un elemento.
:::


# Gestión de elementos del DOM {#crear-eliminar-elementos-dom}

Hasta ahora hemos aprendido a modificar elementos que ya existían en la página. Normalmente, en una aplicación web también vamos a querer crear nuevos elementos, insertarlos en cualquier posición o eliminarlos cuando dejan de ser necesarios. Por ejemplo:

- Añadir un nuevo elemento a una lista de tareas.
- Crear una fila en una tabla.
- Mostrar una notificación.
- Eliminar un mensaje.
- Generar una tarjeta con información obtenida desde una API.

JavaScript proporciona varios métodos para realizar estas tareas.

## Crear un elemento {#crear-elemento}

Para crear un elemento se utiliza la función [createElement()]{.verbatim}. Supongamos que queremos crear un párrafo. El proceso cuenta con varios pasos:

1. **Crear el elemento**: En este momento el elemento **todavía no aparece en la página**, ya que el elemento se ha creado y sólo existe en memoria.
2. **Añadir contenido**: Tras crearlo, podemos añadirle contenido o modificar sus propiedades.
3. **Insertarlo en el documento**: Para que el navegador lo muestre es necesario insertarlo en el DOM. Tendremos que pensar dónde queremos insertar el elemento, que puede ser dentro de otro elemento o en el body.



::: mycode
[Añadir clase]{.title}
```javascript
// crear elemento
const parrafo = document.createElement("p");

// añadir contenido
parrafo.textContent = "Hola mundo";

// modificar sus propiedades
parrafo.className = "importante";

// insertarlo en el documento
document.body.append(parrafo);
```
:::

En este caso se ha creado un párrafo, se le ha dado contenido, se le ha añadido una clase nueva y se ha añadido al final del [body]{.verbatim}.

Vamos a hacer un ejemplo más complejo, creando una estructura de elementos completamente nueva:

:::::::::::::: {.columns }
::: {.column width="57%"}


::: {.mycode size=footnotesize}
[Generar elementos]{.title}
```javascript
const tarjeta = document.createElement("div");
const titulo = document.createElement("h2");
const descripcion = document.createElement("p");

titulo.textContent = "JavaScript";
descripcion.textContent = "Creado en...";

tarjeta.append(titulo);
tarjeta.append(descripcion);
document.body.append(tarjeta);
```
:::

:::
::: {.column width="38%" }

::: {.mycode size=footnotesize}
[HTML generado]{.title}
```html
<body>
<!-- ... -->
  <div>
    <h2>JavaScript</h2>

    <p>Creado en...</p>
  </div>
</body>
```
:::

:::
::::::::::::::


### ¿Qué método utilizar? {#método-utilizar-crear}

Anteriormente hemos visto el método [[innerHTML]{.verbatim}](#innerHTML) y ahora el método [createElement()]{.verbatim}, y aunque ambas técnicas son válidas, presentan diferencias importantes.

| createElement() | innerHTML |
|-------------------|-------------|
| Crea objetos del DOM. | Inserta código HTML. |
| Más seguro. | Puede introducir riesgos de seguridad. |
| Muy adecuado para contenido dinámico. | Cómodo para generar mucho HTML. |
| Permite modificar cada elemento individualmente. | Reemplaza el contenido del elemento. |

En aplicaciones modernas debe utilizarse **[createElement()]{.verbatim}** cuando los elementos se crean dinámicamente a partir de datos.

::: infobox
En aplicaciones modernas debe utilizarse **[createElement()]{.verbatim}**.
:::



### Insertar elemento creado {#dónde-insertar-elemento}

Cuando creamos un elemento nuevo (o un pequeño árbol de elementos) tenemos que decidir dónde insertarlo. Para ello contamos con distintos métodos:

| Método | ¿Dónde? |
|---------|---------|
| [append()]{.verbatim } | Inserta como último hijo. |
| [prepend()]{.verbatim } | Inserta al comienzo, como primer hijo. |
| [before()]{.verbatim } | Inserta antes del elemento. |
| [after()]{.verbatim } | Inserta después del elemento. |


:::::::::::::: {.columns }
::: {.column width="38%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```html
<h1>Comprar</h1>
<ul id="lista">
  <li>Tomates</li>
</ul>
```
:::

:::
::: {.column width="57%" }

::: {.mycode size=footnotesize}
[Javascript]{.title}
```javascript
const lista = document.querySelector("#lista");

const pan = document.createElement("li");
pan.textContent = "Pan";
lista.append(pan);

const arroz = document.createElement("li");
arroz.textContent = "Arroz";
lista.prepend(arroz);

const p = document.createElement("p");
p.textContent = "Hay que comprar:"
lista.before(p);

const fin = document.createElement("p");
fin.textContent = "No te olvides de nada!"
lista.after(fin);
```
:::

:::
::::::::::::::


### Mover un elemento {#mover-elemento}

Un detalle importante del DOM es que un elemento **solo puede existir una vez**. Si insertamos un elemento en otra posición, el navegador no crea una copia, simplemente lo mueve.

::: mycode
[Javascript]{.title}
```javascript
const lista = document.querySelector("#lista");

const elemento = document.createElement("li");
elemento.textContent = "Pan";
lista.prepend(elemento);

elemento.textContent = "Arroz";
lista.append(elemento);
```
:::

Después de la segunda instrucción, el elemento únicamente existirá al final de la lista.


## Eliminar elemento {#eliminar-elemento}

Si queremos eliminar un elemento es una tarea sencilla. Una vez elegido el elemento concreto usamos la función [remove()]{.verbatim} y desaparecerá del DOM.

::: mycode
[Javascript]{.title}
```javascript
const lista = document.querySelector("#lista");
lista.remove();
```
:::


## Reemplazar elemento {#reemplazar-elemento}

El contenido de un elemento también puede ser sustituido por otro.

:::::::::::::: {.columns }
::: {.column width="35%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```html
<p id="mensaje">
    Texto antiguo
</p>
```
:::

:::
::: {.column width="60%" }

::: {.mycode size=footnotesize}
[Javascript]{.title}
```javascript
const nuevo = document.createElement("h2");
nuevo.textContent = "Nuevo mensaje";

const antiguo = document.querySelector("#mensaje");
antiguo.replaceWith(nuevo);
```
:::

:::
::::::::::::::

## Vaciar elemento {#vaciar-elemento}

Si sólo queremos eliminar el contenido dentro de un elemento (no eliminar el elemento) podemos hacer lo siguiente:

::: mycode
[Javascript]{.title}
```javascript
lista.textContent = "";
// alternativa
lista.innerHTML = "";
```
:::

::: exercisebox
[[15f](https://github.com/yuki/ejercicios/blob/main/daw/dec/15f.html)]{.solution}

Recorre un array de ingredientes y añade los nuevos ingredientes creando elementos de tipo [<li>]{.verbatim} insertando al inicio y luego al final de una lista.
:::

## Optimización de inserciones con [DocumentFragment]{.verbatim} {#optimización-inserción}

En los ejemplos anteriores hemos creado e insertado elementos directamente en el DOM. Esos ejemplos de código funcionan correctamente y son perfectamente válido, pero cuando el número de elementos es muy grande, puede resultar poco eficiente.

Cada vez que se inserta un nuevo elemento, el navegador debe actualizar el árbol DOM y, en muchas ocasiones, volver a calcular el diseño de la página.

Cuando se realizan cientos o miles de inserciones consecutivas, este proceso puede afectar al rendimiento de la aplicación. Para solucionar este problema, JavaScript incorpora el objeto [[DocumentFragment()]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/API/DocumentFragment).


Un [DocumentFragment()]{.verbatim} es un contenedor temporal que no tiene padre, que permite construir un objeto más ligero de tipo [Document]{.verbatim} completamente en memoria. Los elementos se crean y se añaden al fragmento, pero todavía **no forman parte del documento DOM principal**. Una vez terminado, todo el contenido del fragmento se inserta en el DOM mediante una única operación.


### Crear un fragmento {#crear-fragmento}

Un fragmento se crea mediante [createDocumentFragment()]{.verbatim}. A partir de ese momento puede utilizarse como si fuera cualquier otro elemento del DOM.

::: mycode
[Crear fragmento]{.title}
```javascript
const fragmento = document.createDocumentFragment();
```
:::

### Añadir elementos {#fragmento-añadir-elemento}

Vamos a suponer que tenemos una lista vacía y queremos añadir varios elementos en ella. Anteriormente hemos visto cómo añadir uno a uno. En este caso lo que 

::: mycode
[Añadir elementos al fragmento]{.title}
```javascript
const lenguajes = [
    "HTML",
    "CSS",
    "JavaScript",
    "TypeScript",
    "Vue"
];
for (const lenguaje of lenguajes) {
    const elemento = document.createElement("li");
    elemento.textContent = lenguaje;
    fragmento.append(elemento);
}
```
:::

En este momento la página continúa exactamente igual. Los elementos todavía no se muestran, ya que no se han insertado en el DOM.


### Insertar fragmento {#insertar-fragmento}

Una vez hemos terminado de añadir todos los elementos al fragmento debemos añadirlo al DOM

:::::::::::::: {.columns }
::: {.column width="38%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```html
<h1>Lenguajes</h1>
<ul id="lista">
</ul>
```
:::

:::
::: {.column width="57%" }

::: {.mycode size=footnotesize}
[Javascript]{.title}
```javascript
const lista = document.querySelector("#lista");

lista.append(fragmento);
```
:::

:::
::::::::::::::

Una vez hecho, el usuario ve el resultado final. Un detalle importante es que el fragmento **no se inserta como un nodo más**. El fragmento queda vacío y puede volver a reutilizarse si fuera necesario.


### ¿Por qué es más eficiente? {#razones-eficiencia}

Supongamos que queremos insertar 1000 elementos. El proceso sería el siguiente:

![Diferencia entre usar el DOM directamente o usar un fragment](img/dec/fragment-dom.svg){width="100%"}


