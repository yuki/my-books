
# Introducción {#introducción-formularios}

Hasta este momento hemos aprendido a crear páginas web dinámicas mediante JavaScript, manipular el DOM y responder a las acciones del usuario mediante eventos. Sin embargo, la mayoría de las aplicaciones web necesitan que el usuario pueda introducir información.

Por ejemplo:

- Iniciar sesión.
- Registrarse.
- Buscar productos.
- Enviar mensajes.
- Realizar pedidos.
- Configurar preferencias.

Toda esta información se recoge mediante **formularios**, que son un conjunto de controles que permite al usuario introducir información en una página web.

Los datos introducidos pueden utilizarse para distintas finalidades:

- Enviarse a un servidor.
- Procesarse mediante JavaScript.
- Guardarse en el navegador.
- Utilizarse para filtrar o buscar información.

Los formularios constituyen uno de los elementos más utilizados en el desarrollo de aplicaciones web.

# El elemento [<form>]{.verbatim} {#elemento-form}

Todos los controles de un formulario suelen agruparse dentro de un elemento [<form>]{.verbatim}, que actúa como un contenedor para todos los controles relacionados.

::: mycode
[Formulario básico]{.title}
```html
<form>
    <label for="nombre">Nombre</label>
    <input type="text" id="nombre" name="nombre">
    <button type="submit">Login</button>
</form>
```
:::

Tradicionalmente, cuando el usuario pulsa un botón de envío, el navegador recopila todos los datos del formulario y los envía al servidor. Hoy en día JavaScript suele intervenir para comprobar que los datos son correctos.

![Proceso de un formulario](img/dec/formulario.svg){width="100%"}

::: errorbox
**Es importante siempre realizar la validación también en el *backend*.**
:::


## Atributos principales del formulario {#atributos-formulario}

El elemento [[<form>]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/form) dispone de numerosos atributos. Los más importantes son los siguientes.


| Atributo | Descripción |
|----------|-------------|
| [action]{.verbatim} | Dirección del servidor a la que se enviarán los datos. |
| [method]{.verbatim} | Método HTTP utilizado ([GET]{.verbatim} para obtener información o [POST]{.verbatim}) para enviar datos. |
| [autocomplete]{.verbatim} | Activa ([=on]{.verbatim}) o desactiva ([=off]{.verbatim}) el autocompletado del navegador. |
| [novalidate]{.verbatim} | Desactiva la validación automática de HTML5. |
| [name]{.verbatim} | Nombre del formulario. Hoy en día se usa más [id]{.verbatim} |


::: mycode
[Formulario con atributos]{.title}
```html
<form action="/login" method="post" autcomplete="on" name="registro">
    <label for="nombre">Nombre</label>
    <input type="text" id="nombre" name="nombre">
    <button type="submit">Login</button>
</form>
```
:::

::: exercisebox
[[17a](https://github.com/yuki/ejercicios/blob/main/daw/dec/17a.html)]{.solution}

Modifica los atributos del formulario y comprueba qué sucede.
:::


## Controles dentro del formulario {#controles-formulario}

Un formulario puede contener numerosos tipos de controles [[<input>]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/input), y cada uno de ellos está diseñado para introducir un tipo concreto de información. Es importante elegir los adecuados ya que van a facilitar la usabilidad de la aplicación y también **facilita la validación de los datos**. Pueden ser:

- Cuadros de texto.
- Contraseñas.
- Casillas de verificación.
- Botones de opción.
- Listas desplegables.
- Áreas de texto.
- Botones.

### Atributo [name]{.verbatim} en los controles {#atributo-name}

Todos los controles deben contar con un atributo [name]{.verbatim} que será el identificador que se enviará al servidor al enviar el formulario.

::: mycode
[Formulario con atributos]{.title}
```html
<form action="/login" method="post" autcomplete="on" name="registro">
    <label for="nombre">Nombre</label>
    <input type="text" id="nombre" name="name">
    <button type="submit">Login</button>
</form>
```
:::

En el ejemplo anterior vemos cómo el control [input]{.verbatim} de tipo [text]{.verbatim} cuenta con otros dos atributos, que se les ha dado nombres distintos para diferenciarlos:

- [id]{.verbatim}: es el identificador único HTML que ya hemos visto hasta ahora.
- [name]{.verbatim}: es el nombre del campo que se enviará al servidor al pulsar el botón.

::: exercisebox
[[17a](https://github.com/yuki/ejercicios/blob/main/daw/dec/17a.html)]{.solution}

Modifica los atributos [id]{.verbatim} y [name]{.verbatim} e inspecciona los cambios.
:::


### Campos de texto {#campos-texto}

Los controles de texto permiten introducir cadenas de caracteres. Tiene distintos atributos pero el más importante es [type]{.verbatim}:

- [type]{.verbatim}: Indica el tipo de campo de texto que es. Puede facilitar la introducción del texto dependiendo del tipo que sea.
  - [[text]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/input/text): Campo de texto normal.
  - [[password]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/input/password): Para contraseñas, el navegador oculta los caracteres introducidos, pero **no está cifrada**.
  - [[email]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/input/email): HTML5 comprobará automáticamente que el formato sea estilo email.
  - [[url]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/input/url): Permite introducir direcciones web.
  - [[tel]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/input/tel): No valida automaticamente el formato, pero facilita la introducción del dato en dispositivos móviles.
  - [[search]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/input/search): Algunos navegadores incorporan botones para borrar el contenido.
- [minlength]{.verbatim}: Longitud mínima del *string*.
- [maxlength]{.verbatim}: Longitud máxima que debe tener. Si se llega al límite, no se puede escribir más.
- [pattern]{.verbatim}: Permite escribir una **expresión regular** que el texto introducido debe coincidir.
- [placeholder]{.verbatim}: Texto que aparece por defecto, pero en el momento en el que el usuario escribe desaparece.
- [readonly]{.verbatim}: Booleano que si está presente no se puede editar el campo.
- [size]{.verbatim}: Tamaño del campo de texto.

::: mycode
[Campos de texto]{.title}
```html
<label for="nombre">Nombre</label>
<input type="text" name="nombre">
<label for="password">Password</label>
<input type="password" name="password" min=6 max=12>
<label for="email">email</label>
<input type="email" name="email" placeholder="hola@example.com">
```
:::


### Campos numéricos {#campos-numéricos}

Los campos de tipo [numéricos](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/input/number) son similares al de texto, pero sólo para números y que suelen tener botones para aumentar o disminuir. Se debe poner como [type="number"]{.verbatim} y también tiene atributos propios:

- [max]{.verbatim}: Número máximo aceptado.
- [min]{.verbatim}: Número mínimo aceptado.
- [step]{.verbatim}: Cantidad para aumentar o disminuir con los botones.

::: mycode
[Campos numéricos]{.title}
```html
<label for="number">number</label>
<input type="number" name="number" min=5>
<label for="number2">number2</label>
<input type="number" name="number2" min=6 max=50 step=2>
```
:::


### Campos de hora/fecha {#campos-hora-fecha}

Existen unos campos específicos que se usan para indicar horas y/o fechas.

- [type]{.verbatim}: Indica el tipo de campo.
  - [[date]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/input/date): Campo para fecha.
  - [[datetime-local]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/input/datetime-local): Para fecha y hora local.
  - [[month]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/input/month): Para seleccionar un mes de un año concreto.
  - [[time]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/input/time): Para seleccionar unicamente la hora.
  - [[week]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/input/week): Para seleccionar unicamente la semana.
- [max]{.verbatim}: Dependerá del tipo, pero la hora/fecha máxima aceptada. El formato dependerá del tipo.
- [min]{.verbatim}: Dependerá del tipo, pero la hora/fecha mínima aceptada. El formato dependerá del tipo.

::: mycode
[Campos de hora/fecha]{.title}
```html
<label for="number">date</label>
<input type="date" name="date">
<label for="datetime-local">datetime-local</label>
<input type="datetime-local" name="datdatetime-locale">
<label for="month">month</label>
<input type="month" name="month">
<label for="time">time</label>
<input type="time" name="time">
<label for="week">week</label>
<input type="week" name="week">
```
:::


### Campos de rango {#campos-rango}

Campos de tipo deslizador para elegir entre un rango de datos. Es de tipo [type="range"]{.verbatim} y también acepta los atributos [max]{.verbatim}, [min]{.verbatim} y [step]{.verbatim}

::: mycode
[Campos de rango]{.title}
```html
<label for="range">range</label>
<input type="range" name="range">
<label for="range2">range2</label>
<input type="range" name="range2" min=0 max=30 step=2>
```
:::


### Campos de casillas y opciones {#campos-casillas-opciones}

Permiten seleccionar varias opciones simultáneamente o una única opción entre varias:

- [type]{.verbatim}: Indica el tipo de campo.
  - [[checkbox]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/input/checkbox): Permite elegir varias opciones.
  - [[radio]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/input/datetime-local): Usado en *radio groups* y sólo se permite elegir una opción.
- [checked]{.verbatim}: Booleano que indica que la opción está seleccionada.

Las casillas que comparten [name]{.verbatim} pertenecen al mismo grupo.


::: {.mycode size=footnotesize}
[Campos de casillas y opciones]{.title}
```html
<fieldset>
  <legend>Choose your interests:</legend>
  <div>
    <input type="checkbox" id="coding" name="interest" value="coding" checked />
    <label for="coding">Coding</label>
  </div>
  <div>
    <input type="checkbox" id="music" name="interest" value="music" />
    <label for="music">Music</label>
  </div>
</fieldset>

<fieldset>
  <legend>Please select your preferred contact method:</legend>
  <div>
    <input type="radio" id="contactChoice1" name="contact" value="email" />
    <label for="contactChoice1">Email</label>
    <input type="radio" id="contactChoice2" name="contact" value="phone" />
    <label for="contactChoice2">Phone</label>
    <input type="radio" id="contactChoice3" name="contact" value="mail" />
    <label for="contactChoice3">Mail</label>
  </div>
</fieldset>
```
:::

### Listas desplegables {#listas-desplegables}

Es habitual que en un formulario haya [listas desplegables](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/select) con varias [opciones](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/option):

::: mycode
[Listas desplegables]{.title}
```html
<label for="hr-select">Your favorite food</label> <br />
<select name="foods" id="hr-select">
  <option value="">Choose a food</option>
  <hr />
  <optgroup label="Fruit">
    <option value="apple">Apples</option>
    <option value="banana">Bananas</option>
    <option value="cherry">Cherries</option>
    <option value="damson">Damsons</option>
  </optgroup>
  <hr />
  <optgroup label="Fish">
    <option value="cod">Cod</option>
    <option value="haddock">Haddock</option>
    <option value="salmon">Salmon</option>
    <option value="turbot">Turbot</option>
  </optgroup>
</select>
```
:::


### Otros controles {#otros-controles}

Los formularios cuentan con otros controles, algunos de ellos menos habituales, pero que también son útiles para otros tipos de aplicaciones.

- [[<textarea>]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/textarea): Campo para introducir texto multi-línea.
  - [rows]{.verbatim}: Para modificar el número de líneas.
  - [cols]{.verbatim}: Para modificar el número de columnas.
- [[<input type="color">]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/input/color): Selector para elegir un color.
  - [value]{.verbatim}: Se puede indicar el color por defecto.
- [[<input type="file">]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/input/file): Selector para elegir un fichero de nuestro equipo.
  - [accept]{.verbatim}: Permite indicar el [tipo](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/input/file#unique_file_type_specifiers) de fichero que el selector mostrará, excluyendo el resto.
- [[<input type="hidden">]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/input/hidden): Permite añadir un campo oculto al formulario para enviar información necesaria que el usuario no tiene por qué rellenar.


::: {.mycode size=footnotesize}
[Otros campos]{.title}
```html
<textarea name="textarea" rows="5" cols="30">
Write something here…
</textarea>

<div>
  <input type="color" id="foreground" name="foreground" value="#e66465" />
  <label for="foreground">Foreground color</label>
</div>
<div>
  <label for="avatar">Choose a profile picture:</label>
  <input type="file" id="avatar" name="avatar" accept="image/png, image/jpeg" />
</div>
<div>
  <input type="hidden" id="postId" name="postId" value="34657" />
</div>
```
:::

### Botones {#botones}

Los formularios cuentan normalmente con al menos un [botón](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/button) de envío, aunque también se puede añadir uno para resetear los campos.

::: mycode
[Campos de rango]{.title}
```html
<!-- método antiguo -->
<input type="submit" value="Enviar">
<input type="reset" value="Reset">

<!-- mejor así -->
<button>Aceptar</button>
<button type="reset">Reset</button>
```
:::

## Controles obligatorios con [required]{.verbatim} {#controles-obligatorios}

Es habitual que dentro de un formulario haya campos que sean obligatorios (nombre, contraseña, email,...), y por tanto el usuario deba introducir texto.

Para facilitar esa labor HTML cuenta con el atributo [[required]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Attributes/required) que recordará al usuario que tiene que rellenar el campo. Esa validación la realiza el navegador.

::: mycode
[Control obligatorio]{.title}
```html
<label for="nombre">Nombre</label>
<input id="nombre" type="text" required>
```
:::

## Etiquetas y accesibilidad {#etiquetas-accesibilidad}

Un formulario correctamente programado no siempre resulta fácil de utilizar. La accesibilidad y la usabilidad buscan que cualquier usuario pueda completar un formulario de forma cómoda, independientemente del dispositivo utilizado o de sus capacidades. Diseñar formularios accesibles beneficia a todos los usuarios y constituye una buena práctica en el desarrollo web.

Todo control debería disponer de una etiqueta descriptiva, tal como se ha ido poniendo en los ejemplos previos. Esta etiqueta, [<label>]{.verbatim}, tiene la siguiente forma:

::: mycode
[Etiqueta para los campos]{.title}
```html
<label for="nombre">Nombre</label>
<input id="nombre" type="text">
```
:::

La relación entre el atributo [for]{.verbatim} de la etiqueta e [id]{.verbatim} del control permite que el usuario pueda pulsar sobre la etiqueta para activar el control. Esto es especialmente útil en los campos [checkbox]{.verbatim} y [radio]{.verbatim}.

::: errorbox
Para mejorar la usabilidad hay que usar [for]{.verbatim} de la etiqueta e [id]{.verbatim} del control en los [checkbox]{.verbatim} y [radio]{.verbatim}.
:::

### Atributo [placeholder]{.verbatim} {#atributo-placeholder}

Ya hemos visto previamente cómo el atributo [placeholder]{.verbatim} es útil en campos de texto, que permite mostrar un texto de ejemplo. Este atributo **no debe sustituir a la etiqueta [<label>]{.verbatim}**.

### Agrupar controles {#agrupar-controles}

Cuando varios controles pertenecen al mismo grupo resulta recomendable utilizar la etiqueta [<fieldset>]{.verbatim} tal como se ha visto previamente. Normalmente utilizada para los campos de selección, pero puede usarse para cualquier tipo de campos.


# Uso de JavaScript en formularios {#uso-javascript-formularios}

Ya se ha visto cómo crear formularios mediante HTML, pero para construir aplicaciones dinámicas es necesario acceder a los controles desde JavaScript para leer su contenido, modificarlo o responder a las acciones del usuario.

En este apartado aprenderemos las operaciones más habituales que se realizan sobre un formulario.

## Obtener controles del formulario {#obtener-controles-formulario}

Como cualquier otro elemento del DOM, los controles pueden obtenerse mediante los métodos de selección habituales. Teniendo en cuenta todo lo visto anteriormente, en los siguientes ejemplos se va a seleccionar parte de los controles y cómo obtener el valor de los mismos.

::: mycode
[Obtener controles]{.title}
```javascript
// obtener un control concreto
const password = document.querySelector("#password");
console.log(password.value);

// un checkbox o radio
const coding = document.querySelector("#coding");
console.log(coding.checked);

// una lista seleccionable
const lista = document.querySelector("#hr-select");
// valor seleccionado
console.log(lista.value);
// índice del seleccionado
let indice = lista.selectedIndex
console.log(indice);
// texto a través del índice
console.log(lista[indice].text)

// obtener todos los inputs en un array
const controles = document.querySelectorAll("input");
```
:::


Es importante entender que todo lo que devuelve el atributo [value]{.verbatim} es un texto, por lo que si esperamos un número, tendremos que convertirlo.

Por el contrario, para obtener los [checkbox]{.verbatim} y [radio]{.verbatim} tenemos que usar el atributo [checked]{.verbatim}, que nos devolverá un tipo booleano.

En las listas desplegables se puede obtener el item seleccionado y su posición en la lista. La lista empieza desde cero, pero normalmente esa posición se suele usar para un texto estándar de selección. También hay que tener en cuenta que una cosa es el texto del [option]{.verbatim} que se le muestra al usuario y el valor real del [value]{.verbatim}.

::: exercisebox
[[17b](https://github.com/yuki/ejercicios/blob/main/daw/dec/17b.html)]{.solution}

Crea un formulario con los controles vistos previamente y que al pulsar el botón del formulario obtener los valores. Usa [preventDefault()]{.verbatim} para ver los valores.
:::

## Modificar valores {#modificar-valores}

Si queremos cambiar el contenido de un control para asignarle un nuevo valor es similar al apartado anterior, sólo que en lugar de obtener el valor, lo que tenemos que hacer es asignarlo.


## Obtener formulario completo {#obtener-formulario-completo}

Podemos obtener todo el formulario.

::: {.mycode size=footnotesize}
[Obtener todo el formulario]{.title}
```javascript
const formulario = document.querySelector("#registro");
```
:::


## Uso del foco en formularios {#uso-foco}

El foco, [focus]{.verbatim}, indica qué control está preparado para recibir información del usuario o está siendo utilizado en ese instante. También podemos saber cuándo un elemento ha perdido el foco con [blur]{.verbatim}.

Desde JavaScript podemos situar el foco en un element, normalmente es muy útil cuando detectamos un error de validación. Aunque más adelante se verá cómo realizar la validación, ésta se puede hacer cada vez que el usuario escribe/usa un control, o se puede crear un evento con [blur]{.verbatim} para que lo valide cuando pierda el foco. 

::: mycode
[Evento para validar campo]{.title}
```javascript
const password = document.querySelector("#password");
password.addEventListener("blur", (e)=>{
    if (password.value.length < 7){
        alert("password corta");
    }
});
```
:::

## Habilitar y deshabilitar controles {#habilitar-deshabilitar}

Los controles pueden activarse o desactivarse mediante la propiedad [disabled]{.verbatim} que es de tipo booleano. En el HTML con poner el atributo es suficiente para indicar que está deshabilitado.

:::::::::::::: {.columns }
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```html
<input type="text" disabled>
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[Deshabilitar control]{.title}
```javascript
boton.disabled = true;
```
:::

:::
::::::::::::::

En el momento en el que se deshabilita el campo no podrá recibir el foco y tampoco se enviará al formulario.


## Atributo [readonly]{.verbatim} {#atributo-readonly}

Existe la propiedad [readonly]{.verbatim} para hacer que un control no pueda ser modificado. El usuario puede leer el contenido, el control puede recibir el foco y se envía en el formulario. Se suele utilizar, por ejemplo, cuando al usuario se le asigna un ID único o nombre de usuario que no podrá modificar.

:::::::::::::: {.columns }
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```html
<input type="text" readonly>
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[Deshabilitar control]{.title}
```javascript
boton.readonly = true;
```
:::

:::
::::::::::::::


# Validación HTML5 {#validación-html5}

HTML5 incorpora un sistema de validación integrado que permite comprobar muchos errores sin escribir código JavaScript. Gracias a esta funcionalidad es posible detectar campos obligatorios, números fuera de rango, correos electrónicos incorrectos y muchas otras situaciones.

Ya se han ido viendo a lo largo de este capítulo varias de los atributos, pero se van a volver a poner aquí:

- [required]{.verbatim}: campo obligatorio.
- [minlength]{.verbatim} y [maxlength]{.verbatim}: para el tamaño del texto.
- [min]{.verbatim} y [max]{.verbatim}: para campos numéricos.
- [step]{.verbatim}: comprobará el campo numérico.
- [pattern]{.verbatim}: comprobará con la expresión regular indicada.

Todas estas validaciones se realizan automáticamente al pulsar el botón de envío del formulario. Esta validación la realiza el navegador, y si es incorrecto suele indicarlo con un mensaje.

## Comprobar desde JavaScript {#comprobar-validación-html5}

JavaScript también puede consultar el estado de esta validación con la función [checkValidity()]{.verbatim} para el campo, devolviendo un boobleano.

:::::::::::::: {.columns }
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```html
<input type="text" minlength="4">
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[Comprobar validación]{.title}
```javascript
nombre.checkValidity();
```
:::

:::
::::::::::::::

Además de comprobar el estado, podemos forzar que vuelvan a salir los mensajes de validación del navegador.

::: mycode 
[Mostrar validación]{.title}
```javascript
formulario.reportValidity();
```
:::

Y podemos modificar el texto que aparece y personalizarlo.

::: mycode 
[Modificar texto validación]{.title}
```javascript
nombre.setCustomValidity(
    "Debe introducir su nombre."
);
```
:::

## Estados CSS {#estados-css}

HTML5 incorpora pseudo-clases que indican el estado de un control, por lo que de esta manera podemos personalizarlo a nuestro gusto y adaptarlo a los colores de nuestra aplicación

::: mycode 
[CSS de validación]{.title}
```css
input:valid {
    border: 2px solid green;
}
input:invalid {
    border: 2px solid red;
}
```
:::


# Validación mediante JavaScript {#validación-javascript}

Ya se ha visto que HTML5 incorpora numerosas comprobaciones automáticas, pero existen situaciones que requieren reglas más complejas para las que será necesario usar JavaScript. Por ejemplo:

- Comparar dos contraseñas.
- Validar un DNI.
- Verificar que una fecha sea posterior a otra.


## Validación en tiempo real {#validación-tiempo-real}

Podemos validar mientras el usuario escribe dentro de un campo de texto: 

::: mycode 
[Validación tiempo real]{.title}
```javascript
nombre.addEventListener("input", () => {
    if (nombre.value.length < 3) {
        console.log("Nombre demasiado corto.");
    }
});
```
:::

Cuando validamos en tiempo real se detectan automáticamente los errores y podemos avisar al usuario antes de que siga rellenando el resto del formulario. De esta manera no recibirá todos los posibles errores a la vez.

## Validación al enviar formulario {#validación-al-enviar}

También es posible realizar todas las comprobaciones cuando el usuario pulsa el botón de envío, una vez rellenado todo el formulario:

::: mycode 
[Validación tiempo real]{.title}
```javascript
formulario.addEventListener("submit", (e) => {
    if (nombre.value === "") {
        e.preventDefault();
        alert("Debe introducir un nombre.");
        nombre.focus();
    }
});
```
:::

Una ventaja para usar este método es que toda la validación podría estar dentro de una misma función. Tal como se puede ver en el ejemplo, se ha realizado la validación, y en caso de no ser válida, se realiza un aviso al usuario y se pone el foco en el campo correspondiente.

::: warnbox
Cuando se realiza la validación con [preventDefault()]{.verbatim} se evita enviar el formulario.
:::

::: exercisebox
[[17c](https://github.com/yuki/ejercicios/blob/main/daw/dec/17c.html)]{.solution}

Crea un formulario que valide algún campo en tiempo real y todos al enviar el formulario.
:::


## Combinar HTML5 y JavaScript {#combinar-html5-javascript}

En la mayoría de aplicaciones se utilizan ambas técnicas: HTML5 valida automáticamente los errores más sencillos mientras que con JavaScript se realizan las comprobaciones específicas de la aplicación. Esta combinación reduce considerablemente la cantidad de código necesario.


<!-- 
TODO: añadir expresiones regulares para validación
 -->


# Mensajes de error y experiencia de usuario {#mensajes-error-ux}

Validar correctamente un formulario no consiste únicamente en impedir que el usuario introduzca datos incorrectos, también es importante informarle de forma clara sobre qué error ha cometido y cómo puede corregirlo.

Un formulario que muestra mensajes adecuados resulta mucho más fácil de utilizar que otro que simplemente impide el envío de los datos. Un buen mensaje debería responder a tres preguntas:

- ¿Qué ha ocurrido?
- ¿Por qué se ha producido el error?
- ¿Cómo puede solucionarse?

Los mensajes de error deben ser claros, breves, específicos, educados y fáciles de comprender para un usuario no-técnico.

::: errorbox
El error "*pattern mismatch*" puede ser útil para *debuggear* pero no para el usuario.
:::

Aunque ya se ha ido indicando en apartados anteriores cómo realizar una buena experiencia de usuario, a continuación se vuelve a recopilar de cara a tener buenas prácticas en el desarrollo.


## Mostrar mensajes junto al campo {#mensajes-junto-campo}

Siempre que sea posible, el mensaje debe aparecer cerca del control que contiene el error, de esta manera el usuario identifica inmediatamente qué dato debe corregir. Para ello se puede utilizar elementos HTML que en principio estén ocultos y que en caso de error aparezcan:

:::::::::::::: {.columns columnsep="0.5cm"}
::: {.column width="37%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```html
<label for="nombre">
    Nombre
</label>

<input
    id="nombre"
    type="text">

<span id="errorNombre" 
      class="hidden error">
</span>
```
:::

:::
::: {.column width="63%" }

::: {.mycode size=footnotesize}
[Comprobar validación]{.title}
```javascript
const nombre = document.querySelector("#nombre");
if (nombre.value === ""){
  const er = document.querySelector("#errorNombre");
  er.textContent = "Debe introducir un nombre.";
  er.mensaje.classList.replace("hidden", "");
}
```
:::

:::
::::::::::::::

Si la validación se está haciendo en tiempo real, una vez el usuario corrige el error, el mensaje de error debe desaparecer.

### Resaltar el campo {#resaltar-campo}

Aparte del mensaje de error, resulta recomendable indicar visualmente el control con un color diferente, para que resalte cuál es el que contiene el error. Previamente se ha indicado que HTML5 cuenta con unas clases CSS especiales, pero podemos crear unas clases propias.

:::::::::::::: {.columns }
::: {.column width="50%"}
::: {.mycode size=footnotesize}
[HTML]{.title}
```css
.error {
    border: 2px solid red;
}
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[JavaScript]{.title}
```javascript
// añadir y quitar clase
nombre.classList.add("error");
nombre.classList.remove("error");
```
:::

:::
::::::::::::::

En la siguiente imagen se puede apreciar el formulario de registro de usuario en el que se ha optado por añadir todos los mensajes de error al inicio del formulario y resaltar cada campo que contiene un error.

![Errores de validación](img/dec/validacion-errores.png){width="50%" framed=true}


## No borrar la información introducida {#no-borrar-información}

Cuando el formulario contiene errores, el usuario espera poder corregir únicamente los campos incorrectos. No debería ser necesario volver a escribir todos los datos. Por este motivo, normalmente no debe vaciarse el formulario después de una validación fallida.

::: warnbox
Es importante para la usabilidad no vaciar los campos rellenados cuando se realiza la validación.
:::

## Poner foco en el campo {#poner-foco}

Ya se ha visto previamente que es recomendable situar el cursor sobre el campo que se ha validado y ha dado error. De esta manera, en caso de ser un formulario grande, el usuario podrá comenzar inmediatamente con la corrección.


# Ejercicios con formularios {#ejercicios-formularios}

A lo largo de esta unidad hemos estudiado cómo crear formularios HTML, acceder a sus controles desde JavaScript y validar la información introducida por el usuario. En este apartado reuniremos todos estos conocimientos desarrollando unos ejercicios.

El objetivo no es crear una aplicación real, sino integrar en un único ejemplo las técnicas más utilizadas en el desarrollo web.

::: exercisebox
[[17d](https://github.com/yuki/ejercicios/blob/main/daw/dec/17d.html)]{.solution}

Crea un formulario que tenga los siguientes campos:

- Nombre
- Correo electrónico
- Edad
- Contraseña
- Confirmación de contraseña
- Aceptación de las condiciones de uso

Antes de enviarlo se comprobará que:

- Todos los campos obligatorios estén rellenados.
- El usuario sea mayor de edad.
- Las dos contraseñas coincidan.
- Se hayan aceptado las condiciones de uso.

Usa validación propia y de HTML, y si hay error que aparezcan errores y cambie el CSS.
:::


::: exercisebox
[[17e](https://github.com/yuki/ejercicios/blob/main/daw/dec/17e.html)]{.solution}

Crea un formulario para la web del centro para registrar nuevos alumnos. Debe contener:

- Nombre
- Apellidos
- Correo electrónico
- Edad
- Curso
- Turno (mañana o tarde)
- Comentarios
- Aceptación de la política de privacidad

El formulario deberá cumplir los siguientes requisitos:

- Todos los campos serán obligatorios excepto "Comentarios".
- La edad deberá estar comprendida entre 16 y 99 años.
- El correo electrónico deberá utilizar el tipo de entrada adecuado de HTML5.
- El alumno deberá aceptar la política de privacidad.
- Si existe algún error se mostrará un mensaje indicando el problema y el formulario no se enviará.
- Si todos los datos son correctos aparecerá un mensaje indicando que el registro se ha realizado correctamente.
- El formulario deberá disponer de un diseño sencillo mediante CSS.
:::

