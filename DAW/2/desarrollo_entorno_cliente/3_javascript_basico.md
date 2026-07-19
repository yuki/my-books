
# Escribir código JavaScript {#escribir-código-javascript}

JavaScript puede incorporarse a una página web de diferentes formas. La elección de una u otra dependerá del tamaño del proyecto, de la organización del código y de las necesidades de la aplicación. En este apartado aprenderemos las distintas formas de incluir código JavaScript en un documento HTML y las buenas prácticas recomendadas en el desarrollo web moderno.

Existen dos formas principales de incorporar JavaScript a una página web:

- Código integrado (interno).
- Código en un fichero externo.

## Código integrado {#código-integrado}

El código integrado consiste en escribir el código JavaScript directamente dentro del documento HTML mediante la etiqueta [<script>]{.verbatim}.

::: mycode
[Código JavaScript integrado en HTML]{.title}

```html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Mi primera página</title>
</head>
<body>

    <h1>Hola Mundo</h1>
    <!-- esto es un comentario HTML -->
    <script>
        // esto es un comentario en JavaScript
        console.log("Hola desde JavaScript");
    </script>
</body>
</html>
```
:::

Cuando el navegador encuentra la etiqueta [<script>]{.verbatim}, interpreta y ejecuta inmediatamente el código contenido en su interior. Dentro de la misma página web puede haber varias etiquetas, que se ejecutarán en orden.

::: infobox
La etiqueta [<script>]{.verbatim} puede tener un atributo [type]{.verbatim}, como [type="text/javascript"]{.verbatim}. Si no se pone, se asume como código JavaScript por defecto.
:::


## Código en un fichero externo {#código-fichero-externo}

La forma más habitual a la hora de escribir código JavaScript es en un fichero independiente con extensión [.js]{.verbatim}, por ejemplo [js/app.js]{.configfile}. Desde el fichero HTML se referencia el archivo JavaScript.


:::::::::::::: {.columns }
::: {.column width="47%"}

::: {.mycode size=footnotesize}
[Código index.html]{.title}
```html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Mi primera página</title>
</head>
<body>
    <h1>Hola Mundo</h1>
    <script src="js/app.js"></script>
</body>
</html>
```
:::

:::
::: {.column width="47%" }

::: {.mycode size=scriptsize}
[Código js/app.js]{.title}
```javascript
console.log("Hola desde un fichero externo");
```
:::

:::
::::::::::::::


Cuando el navegador recibe el código HTML lo analizará y verá el atributo [src]{.verbatim}, por lo que realizará una nueva petición al servidor para descargar el fichero y así poder ejecutarlo. Es la opción recomendada en prácticamente cualquier proyecto ya que cuenta con unas ventajas que el código integrado no tiene:

- El código HTML es más limpio.
- Se separa la estructura de la lógica.
- El mismo fichero puede reutilizarse en varias páginas.
- Es más sencillo localizar errores.
- Facilita el trabajo en equipo.
- El navegador puede almacenar el archivo en caché para futuras visitas. No volverá a pedirlo al servidor.

Cuando un proyecto crece puede ser recomendable separar el código en distintos ficheros.

::: exercisebox
[[01](https://github.com/yuki/ejercicios/blob/main/daw/dec/01.html)]{.solution}

Escribe el código anterior y busca dónde aparece el log.
:::


### Carga de varios ficheros {#carga-ficheros-externos}

Cuando una página contiene varios archivos JavaScript, **el orden en el que se cargan puede ser muy importante**. El navegador ejecuta los scripts siguiendo el orden en que aparecen en el documento HTML. Teniendo esto en cuenta, **es importante tener en cuenta si existen dependencias entre ficheros**.

Supongamos los siguientes dos ficheros:

:::::::::::::: {.columns }
::: {.column width="47%"}

::: {.mycode size=scriptsize}
[Código js/funciones.js]{.title}
```javascript
function saludar(nombre) {
    console.log(`Hola ${nombre}`);
}
```
:::

:::
::: {.column width="47%" }

::: {.mycode size=scriptsize}
[Código js/app.js]{.title}
```javascript
saludar("Rubén");
```
:::

:::
::::::::::::::

::: exercisebox
[[02a](https://github.com/yuki/ejercicios/blob/main/daw/dec/02a.html) y [02b](https://github.com/yuki/ejercicios/blob/main/daw/dec/02b.html)]{.solution}

¿Cuál sería el orden correcto de cargar los ficheros? Prueba todas las opciones posibles. ¿Qué sucede cuando el orden es incorrecto?
:::

## ¿Dónde cargar el JavaScript? {#dónde-cargar-javascript}

Tradicionalmente existían dos posibilidades.

- Dentro del **[<head>]{verbatim}**: Este método puede provocar problemas. Mientras el navegador descarga deja de construir la página HTML. Como consecuencia, el usuario puede percibir una carga más lenta, y si realiza alguna ejecución, como el HTML no está construido, puede haber errores.
- Antes de cerrar **[<body>]{verbatim}**: Durante muchos años la recomendación fue colocar los scripts justo antes del cierre del elemento [<body>]{verbatim}.

:::::::::::::: {.columns }
::: {.column width="47%"}

::: {.mycode size=scriptsize}
[Código en el head]{.title}
```html
<head>
    <script src="03.js"></script>
</head>
<body>
    <h1 id="titulo">Título</h1>
```
:::

:::
::: {.column width="47%" }

::: {.mycode size=scriptsize}
[Antes de cerrar body]{.title}
```html
<body>
    <h1 id="titulo">Título</h1>
...
    <script src="03.js"></script>
</body>
```
:::

:::
::::::::::::::

::: exercisebox
[[03a](https://github.com/yuki/ejercicios/blob/main/daw/dec/03a.html) y [03b](https://github.com/yuki/ejercicios/blob/main/daw/dec/03b.html)]{.solution}

¿Qué diferencia hay al cargar el siguiente código en el [head]{.verbatim} o al terminar el [body]{.verbatim}?

[console.log(document.getElementById("titulo"))]{.verbatim}
:::


### Atributo defer {#atributos-al-cargar}

Actualmente, la práctica más recomendada consiste en utilizar el atributo [defer]{.verbatim}. Esto mejora el rendimiento y evita muchos errores relacionados con elementos HTML que todavía no existen, ya que:

- el navegador continúa construyendo el documento HTML;
- el archivo JavaScript se descarga en segundo plano;
- el código no se ejecuta hasta que el documento HTML ha terminado de cargarse.

::: {.mycode}
[Usando defer como atributo]{.title}
```html
<head>
  <script src="app.js" defer></script>
</head>
```
:::

::: exercisebox
[[03c](https://github.com/yuki/ejercicios/blob/main/daw/dec/03c.html)]{.solution}

Modifica el ejercicio anterior usando [defer]{.verbatim} en el [head]{.verbatim}.
:::

### Atributo async {#atributo-async}

También existe el atributo [async]{.verbatim}. En este caso el navegador descarga el archivo en paralelo, pero lo ejecuta **tan pronto como termina la descarga**, incluso aunque el documento HTML todavía no haya finalizado. El orden de ejecución entre varios scripts con [async]{.verbatim} **no está garantizado**.

Por ello suele utilizarse únicamente para scripts independientes, como ejemplos:

- **Herramientas de análisis de visitas**: suelen ser librerías que funcionan aisladas de la aplicación. Recopilan datos y los envían a servidores externos (como *Google Analytics*).
- **Publicidad**: similar al caso anterior, pero para la inclusión de publicidad. En este caso obtienen datos de un servidor externo para incrustar las imágenes en la web.

::: errorbox
No es recomendable utilizar [async]{.verbatim} para scripts que dependen unos de otros.
:::

## Comparación y buenas prácticas {#comparativa}

Tal como se ha podido ver, existen distintas maneras a la hora de cargar el código JavaScript, por lo que es importante entender dónde poner el código y que quizá sea necesario usar atributos al cargar los ficheros.

En la siguiente imagen se puede ver una representación visual de los distintos métodos de carga:

![Fuente: [MDN](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/script)](img/dec/async-defer.jpg){width=100%}


En la siguiente tabla se resumen también cómo se pueden usar.

| Método | ¿Bloquea la carga del HTML? | ¿Respeta el orden? | Uso recomendado |
|---------|----------------------------|--------------------|-----------------|
| [<script>]{.verbatim} clásico | Sí | Sí | Solo ejemplos sencillos. |
| [<script defer>]{.verbatim} | No | Sí | Opción recomendada. |
| [<script async>]{.verbatim} | No | No necesariamente | Scripts independientes. |

Table: {tablename=yukitblr colspec=XXXX}

::: infobox
Es importante conocer las diferencias de cómo cargar nuestro código.
:::


## Gramática del lenguaje {#gramática}

Como todos los lenguajes de programación, JavaScript cuenta con su propia gramática y léxico. En la documentación de MDN se explica [el léxico completo](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Lexical_grammar).

# Comentarios {#comentarios}

Los comentarios son fragmentos de texto incluidos en el código fuente que **no son ejecutados por el motor de JavaScript**. Su finalidad es ayudar a comprender el funcionamiento del programa, documentar decisiones de diseño o desactivar temporalmente determinadas instrucciones durante el desarrollo.

Al igual que sucede en otros lenguajes podemos hacer comentarios de una única línea o de varias.


:::::::::::::: {.columns }
::: {.column width="47%"}

::: mycode
[Comentarios de una línea]{.title}

```javascript
// Este es un comentario
console.log("Hola mundo");
let edad = 20; // edad
```
:::

:::
::: {.column width="47%" }

::: mycode
[Comentando varias líneas]{.title}
```javascript
/*
Este comentario puede ocupar
una o varias líneas.
*/
console.log("Hola");
```
:::

:::
::::::::::::::


Los comentarios deberían aportar información útil al código, por lo que no se debería usar para explicar cualquier línea. Lo habitual es usarlos para:

- Algoritmos complejos.
- Decisiones de diseño.
- Soluciones poco evidentes.
- Limitaciones conocidas.
- Código pendiente de modificar.


::: errorbox
Los comentarios deben mantenerse actualizados a medida que se actualiza el código.
:::



## Comentarios JSDoc {#jsdoc}

Al igual que sucede en otros lenguajes de programación, en proyectos profesionales es habitual utilizar un formato especial de programación. En el caso de Java se suele usar [Javadoc](https://en.wikipedia.org/wiki/Javadoc) y para JavaScript, con sintaxis similar, se puede usar **[JSDoc](https://en.wikipedia.org/wiki/JSDoc)**.

Permite documentar funciones, clases y otros elementos del programa de forma estructurada. Su sintaxis comienza con `/**`.

::: mycode
[Comentarios con  JSDoc]{.title}
```javascript
/**
 * Devuelve la suma de dos números.
 *
 * @param {number} a Primer número.
 * @param {number} b Segundo número.
 * @returns {number} Resultado de la suma.
 */
function sumar(a, b) {
    return a + b;
}
```
:::


# Variables {#variables}

Las variables permiten almacenar información en memoria para poder utilizarla posteriormente. Gracias a ellas un programa puede recordar valores, realizar cálculos, modificar información o intercambiar datos entre distintas partes del código.

:::::::::::::: {.columns }
::: {.column width="47%"}

::: mycode
[Crear y usar una variable]{.title}

```javascript
let nombre = "Rubén";
console.log(nombre);
```
:::

:::
::: {.column width="47%" }


En este caso:

- [let]{.verbatim}: indica que vamos a declarar una variable.
- [nombre]{.verbatim}: es el identificador.
- ["Rubén"]{.verbatim}: es el valor almacenado.
- [console.log(nombre);]{.verbatim}: uso de la variable

:::
::::::::::::::


El nombre de una variable recibe el nombre de **identificador** y debe cumplir una serie de reglas. Puede contener:

- Letras.
- Dígitos (excepto al principio).
- Guion bajo ([_]{.verbatim}).
- Símbolo dólar ([\$]{.verbatim}).

Lógicamente no se pueden usar [palabras reservadas](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#reserved_words) como identificador de variables. También es importante saber que JavaScript es *case sensitive*, por lo que [nombre]{.verbatim} no es lo mismo que [Nombre]{.verbatim}.

::: errorbox
JavaScript es *case sensitive*. Cuidado a la hora de usar identificadores.
:::


## Declaración e inicialización {#declaración-inicialización}

Es importante distinguir dos conceptos.

- **Declarar la variable**: Consiste en crear la variable. Todavía no tiene un valor.
- **Inicializar la variable**: Consiste en asignarle un valor por primera vez.
- Ambas acciones e pueden hacer a la vez.


:::::::::::::: {.columns }
::: {.column width="30%"}

::: mycode
[Declarar variable]{.title}

```javascript
let edad;
```
:::

:::
::: {.column width="30%" }

::: mycode
[Inicializar variable]{.title}

```javascript
edad = 20;
```
:::

:::
::: {.column width="30%" }

::: mycode
[Ambas]{.title}

```javascript
let edad = 20;
```
:::

:::
::::::::::::::


## Diferencias entre `let`, `const` y `var` {#diferencias-variables}

A la hora de declarar variables podemos usar tres palabras reservadas:

- [let]{.verbatim}: Es la forma recomendada para declarar variables cuyo valor puede cambiar.
- [const]{.verbatim}: Declara una constante. Una constante debe recibir un valor en el momento de su creación. Cuando una constante almacena un objeto o un array, lo que permanece constante es **la referencia al objeto**, no necesariamente su contenido. Por convenio, cuando una constante representa un valor fijo global suele escribirse en mayúsculas.
- [var]{.verbatim}: Antes de ECMAScript 2015 era cómo se declaraban, pero **no se recomienda utilizarla en código nuevo**. El motivo es que presenta un comportamiento diferente respecto al ámbito de las variables y a la elevación (*[hoisting](https://developer.mozilla.org/es/docs/Glossary/Hoisting)*), lo que puede provocar errores difíciles de detectar.



:::::::::::::: {.columns }
::: {.column width="30%"}

::: {.mycode size=footnotesize}
[Variable con let]{.title}

```javascript
let contador = 0;
contador++;
contador++;
console.log(contador);
```
:::

:::
::: {.column width="35%" }

::: {.mycode size=footnotesize}
[Constantes]{.title}

```javascript
const PI = 3.141592;
PI = 3; // TypeError:
const letras = ["a", "b"];
// permitido
letras.push("c");
```
:::

:::
::: {.column width="30%" }

::: {.mycode size=footnotesize}
[Con var]{.title}

```javascript
var nombre = "Ana";
```
:::

:::
::::::::::::::


Sirva como resumen la siguiente tabla:

|                          | **let**                    | **const**                        | **var**               |
|--------------------------|----------------------------|----------------------------------|-----------------------|
| Ámbito (scope)           | Bloque                     | Bloque                           | Función               |
| Re-declaración permitida | Sí                         | **No**                           |  Sí                   |
| Re-asignación permitida  | Sí                         | No                               |  Sí                   |
| Uso recomendado          | Para variables que cambian | Para valores fijos o referencias | **Evitarlo**          |

Table: {tablename=yukitblrcol colspec=XXXX}



## Convención de nombres

JavaScript permite utilizar muchos nombres distintos, pero existen convenciones ampliamente aceptadas.

- **[camelCase](https://en.wikipedia.org/wiki/Camel_case)**: Es la **convención utilizada en JavaScript**. La primera palabra comienza en minúscula y las siguientes empiezan con mayúscula. Ejemplo de nombres: nombreCompleto, numeroAlumnos, fechaNacimiento, ...
- **[Snake_Case](https://en.wikipedia.org/wiki/Snake_case)**: Usado en Python, PHP, ... Ejemplo de nombres: nombre_completo, numero_alumnos, ...


Por otro lado, habría que decidir el idioma de las variables, cómo poner los comentarios... todo depende del idioma usado por los programadores, si el código va a ser publicado...

::: infobox
Lo importante es elegir una convención y tratar de mantenerla siempre.
:::


# Tipos de datos {#tipos-datos}

Toda la información que maneja un programa se almacena en forma de **datos**. JavaScript puede trabajar con distintos tipos de datos, como números, textos, valores lógicos, listas de elementos u objetos. Conocer los distintos tipos de datos es fundamental para escribir programas correctos y evitar errores.

JavaScript es un lenguaje de **tipado dinámico**, lo que significa que no es necesario indicar el tipo de una variable al declararla. Al contrario que pasa en Java o C, que es el programador el encargado de indicar el tipo de variable, en JavaScript será el propio lenguaje quien determine automáticamente el tipo a partir del valor asignado.


## Tipos primitivos {#tipos-primitivos}

Como otros lenguajes de programación, JavaScript cuenta con unos tipos de datos primitivos, que representan un valor:

- [[Boolean]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Boolean): Valores que sólo pueden ser [true]{.verbatim} y [false]{.verbatim}.
- [[null]{.verbatim}](https://developer.mozilla.org/en-US/docs/Glossary/Null): Palabra especial que determina que es un valor nulo.
- [[undefined]{.verbatim}](https://developer.mozilla.org/en-US/docs/Glossary/Undefined): Valor primitivo asignado a las variables que no se han declarado todavía.
- [[Number]{.verbatim}](https://developer.mozilla.org/en-US/docs/Glossary/Number): Número entero o de coma flotante. Por ejemplo: [42]{.verbatim} o [3.14159]{.verbatim}.
  - Puede resultar en valores  [[Infinity]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/POSITIVE_INFINITY) y [[-Infinity]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/NEGATIVE_INFINITY) que representan el [valor máximo](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/MAX_VALUE) y [mínimo](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/MIN_VALUE) posibles.
  - [[NaN]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/NaN): *Not a Number*, el resultado de saber si un tipo de datos es un número y resultao que no lo es: [Number("hola")]{.verbatim}
- [[BigInt]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Data_structures#bigint_type): Un entero de [precisión arbitraria](https://es.wikipedia.org/wiki/Aritm%C3%A9tica_de_precisi%C3%B3n_arbitraria). Por ejemplo: [9007199254740992n]{.verbatim}.
- [[String]{.verbatim}](https://developer.mozilla.org/en-US/docs/Glossary/String): Una secuencia de caracteres que forman un texto. Se puede escribir con:
  - **Comillas simples**: [\'hola\']{.verbatim}
  - **Comillas dobles**: ["hola"]{.verbatim}
  - **Comillas invertidas**: [\`hola\`]{.verbatim}
- [[Symbol]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol): Es un tipo de datos que garantiza que es único e inmutable.


::: exercisebox
Prueba todos los tipos de datos descritos hasta ahora, haciendo hincapié en [[symbol]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/Symbol)
:::


:::::::::::::: {.columns }
::: {.column width="47%"}

::: {.mycode}
[Ejemplo tipos de datos]{.title}
```javascript
let verdadero = true;
let falso = false;
let nulo = null;
let edad = 18;
let temperatura = 22.5;
let saldo = -150.75;
// Infinity
console.log(42 / 0);
// -Infinity
console.log(-42 / 0);
```
:::

:::
::: {.column width="47%" }

::: {.mycode}
[Ejemplo tipos de datos]{.title}
```javascript
let nombre = "Rubén";
let ciudad = 'Bilbao';
let saludo = `Hola`;
console.log("Hola "+nombre)
console.log("Hola %s",nombre)
console.log(`Hola ${nombre}`)
let edad;
// undefined
console.log(edad);
```
:::

:::
::::::::::::::


## Objetos {#objetos}

El resto de tipos de datos no descritos previamente son de tipo [[Object]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Data_structures#objects), entre los que se pueden incluir funciones, arrays, expresiones regulares, [[Map]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map) o objetos de tipo Error.

Un objeto ejemplo de objeto sería el siguiente:

::: mycode
[Ejemplo de Object]{.title}
```javascript
const alumno = {
    nombre: "Rubén",
    edad: 20,
    aprobado: true
};
console.log(alumno.nombre)
```
:::

Más adelante nos adentraremos en los objetos.

## Operador [typeof]{.verbatim} {#operador-typeof}

JavaScript incorpora el operador [[typeof]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/typeof), que permite conocer el tipo de un dato.

::: {.mycode}
[Operador typeof]{.title}
```javascript
let nombre = "Rubén";
typeof nombre;
```
:::


## Conversión de tipos {#conversión-tipos}

Muchas veces es necesario convertir un tipo de datos a otro, puede que de manera temporal o en otras ocasiones de manera permanente. Se va a explicar la conversión explícita, ya que existen algunos casos que se van a explicar después con los operadores.


:::::::::::::: {.columns }
::: {.column width="47%"}

::: {.mycode}
[Conversión de datos]{.title}
```javascript
let edad = Number("25");
//NaN
Number("Hola")
parseInt("123")
// 123
parseInt("123px")
parseInt(123.4)
parseFloat("12.75")
```
:::

:::
::: {.column width="47%" }

::: {.mycode}
[Conversión de datos]{.title}
```javascript
String(25)
String(true)
Boolean(1)
Boolean("123")
Boolean(0)
Boolean("")
Boolean(null)
Boolean(undefined)
Boolean(NaN)
```
:::

:::
::::::::::::::


::: exercisebox
Haz una prueba de las distintas conversiones de tipos vistas.
:::

## Comparación entre [==]{.verbatim} y [===]{.verbatim}

Debido a las conversiones automáticas que realiza JavaScript por defecto, hace que se vea especialmente afectados los operadores de comparación. Esto hace que a veces podamos tener fallos en nuestro código no deseados:

::: exercisebox
¿Qué resultados dan la siguientes operaciones?

- [5 == 5]{.verbatim}
- [5 == "5"]{.verbatim}
- [1 == true]{.verbatim}
- [0 == false]{.verbatim}
:::

Para evitar las conversiones automáticas existe el operador [[===]{.verbatim} o *strict equality*](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Strict_equality) que devuelve un **Boolean** y tiene en cuenta tanto el valor como el tipo de datos.

::: exercisebox
¿Qué resultados dan la siguientes operaciones?

- [5 === 5]{.verbatim}
- [5 === "5"]{.verbatim}
- [1 === true]{.verbatim}
- [0 === false]{.verbatim}
- [Symbol(42) === Symbol(42)]{.verbatim}
- [typeof Symbol(42) === typeof Symbol(42)]{.verbatim}
:::

El operando de negación es [[!==]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Strict_inequality).

::: warnbox
Es recomendable hacer uso de [===]{.verbatim} a la hora de realizar comparaciones.
:::


# Operadores {#operadores}

Los operadores permiten realizar operaciones sobre uno o varios valores. Gracias a ellos es posible realizar cálculos matemáticos, comparar datos, combinar condiciones, asignar valores o modificar variables. No vamos a entrar en todos ellos, ya que son muchos, pero todos ellos se encuentran en la [documentación de MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators).

## Operadores aritméticos {#operadores-aritméticos}

Los operadores aritméticos permiten realizar operaciones matemáticas.

| Operador | Descripción | Ejemplo |
|:----------:|:-------------:|:---------:|
| `+` | Suma | `5 + 2` |
| `-` | Resta | `5 - 2` |
| `*` | Multiplicación | `5 * 2` |
| `/` | División | `5 / 2` |
| `%` | Resto de la división | `5 % 2` |
| `**` | Potencia | `5 ** 2` |


## Operadores de asignación {#operadores-asignación}

Permiten almacenar un valor en una variable. Aunque el operador más utilizado es [=]{.verbatim} también existen otros operadores que nos permiten escribir de operaciones de manera abreviada.

| Operador | Equivale a |
|----------|------------|
| `+=` | `x = x + valor` |
| `-=` | `x = x - valor` |
| `*=` | `x = x * valor` |
| `/=` | `x = x / valor` |
| `%=` | `x = x % valor` |
| `**=` | `x = x ** valor` |


::: exercisebox
Escribe un ejemplo para cada una de las asignaciones anteriores.
:::


## Operadores de incremento y decremento {#operadores-incremento-decremento}

Permiten aumentar o disminuir una variable en una unidad. Pueden  colocarse antes o después de la variable, y depende de dónde se pongan varía su comportamiento.

:::::::::::::: {.columns }
::: {.column width="47%"}

::: mycode
[Incremento]{.title}

```javascript
let x = 5;
x++;
console.log(x++);
console.log(++x);
```
:::

:::
::: {.column width="47%" }

::: mycode
[Decremento]{.title}
```javascript
let x = 5;
x--;
console.log(x--);
console.log(--x);
```
:::

:::
::::::::::::::

::: exercisebox
¿Cuál es el resultado del código anterior?
:::


## Operadores de comparación {#operadores-comparación}

Permiten comparar dos valores. El resultado siempre es un valor booleano: [true]{.verbatim} o [false]{.verbatim}.

| Operador | Significado |
|----------|-------------|
| [>]{.verbatim} | Mayor que |
| [<]{.verbatim} | Menor que |
| [>=]{.verbatim} | Mayor o igual |
| [<=]{.verbatim} | Menor o igual |
| [==]{.verbatim} | Igual (con conversión automática) |
| [!=]{.verbatim} | Distinto (con conversión automática) |
| [===]{.verbatim} | Igual estricto |
| [!==]{.verbatim} | Distinto estricto |


::: warnbox
Como ya vimos en el apartado anterior, se recomienda utilizar [===]{.verbatim} y [!==]{.verbatim}.
:::



## Operadores lógicos {#operadores-lógicos}

Permiten combinar varias condiciones. Los usaremos más adelante en las sentencias condicionales.

| Operador | Significado |
|----------|-------------|
| [&&]{.verbatim} | Y lógico (AND) |
| `||` | O lógico (OR) |
| [!]{.verbatim} | Negación (NOT) |


## Operador de concatenación {#operador-concatenación}

El operador [+]{.verbatim} también puede utilizarse para unir cadenas de texto, pero actualmente suele preferirse el uso de *[template literals](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Template_literals)*.

::: mycode
[Concatenar texto]{.title}

```javascript
const nombre = "Rubén";
const apellido = "Gómez";
console.log(nombre + " " + apellido);
// mejor así
console.log(`Hola ${nombre} ${apellido}`);
```
:::


# Entrada y salida de datos {#entrada-salida-datos}

Todo programa necesita comunicarse con el usuario, y normalmente la comunicación consiste en:

- Mostrar información.
- Solicitar datos.
- Presentar mensajes de error.
- Confirmar una acción.

En JavaScript existen diferentes mecanismos para realizar estas tareas, y aunque en un principio debería ser en un formato Web, para comenzar vamos a ver otras maneras y así también poder usarlas para *debuggear*.

## Salida mediante la consola {#salida-consola}

La forma más habitual durante el desarrollo consiste en utilizar la consola del navegador. La función más utilizada y la que se ha estado utilizando hasta ahora. Aparte del formato *log* podemos utilizar otros métodos detallados a continuación:

::: mycode
[Salida mediante consola]{.title}
```javascript
console.log("Hola mundo");
console.info("Información");
console.warn("Advertencia");
console.error("Error");
```
:::

Para los dos últimos métodos, algunos navegadores los muestran utilizando diferentes colores o iconos.


## Solicitar datos mediante [prompt()]{.verbatim} {#solicitar-datos}

La función [prompt()]{.verbatim} muestra una ventana solicitando información al usuario, que deberá escribir el valor y pulsar el botón **Aceptar**. El valor deberá ser guardado en una variable

::: mycode
[Solicitar datos]{.title}
```javascript
const nombre = prompt("Introduce tu nombre");
```
::::

::: warnbox
[prompt()]{.verbatim} **siempre devuelve una cadena de texto**.
:::

Esta función hoy en día no se usa ya que tiene varios inconvenientes y su función se puede obtener a través de formularios:

- Interrumpen la ejecución del programa.
- Bloquean la interacción con la página.
- Su apariencia depende del navegador.
- No pueden personalizarse.


## Mostrar mensajes mediante [alert()]{.verbatim} {#mostrar-mensajes-alert}

La función [alert()]{.verbatim} muestra una ventana con un mensaje. El programa permanece detenido hasta que el usuario pulse el botón de aceptación. Hoy en día apenas se usa por las mismas razones que [prompt()]{.verbatim}.

::: mycode
[Método alert]{.title}
```javascript
alert("Bienvenido");
```
:::


## Solicitar confirmación mediante [confirm()]{.verbatim} {#uso-confirm}

La función [confirm()]{.verbatim} muestra una pregunta con dos botones para *Aceptar* o *Cancelar*, que nos devolverá un valor *booleano*.

::: mycode
[Método alert]{.title}
```javascript
const borrar = confirm("¿Desea eliminar el registro?");
```
:::

De nuevo, una función apenas usada ya que es habitual usar *modals*

## Mostrar información en la página

Además de la consola, JavaScript puede modificar el contenido de una página web. Profundizaremos más adelante, pero sirva el siguiente ejemplo como un adelanto.


:::::::::::::: {.columns }
::: {.column width="30%"}

::: {.mycode size=footnotesize}
[Código index.html]{.title}
```html
<p id="mensaje"></p>
```
:::

:::
::: {.column width="65%" }

::: {.mycode size=scriptsize}
[Código js/app.js]{.title}
```javascript
document.getElementById("mensaje").textContent = "Hola!";
```
:::

:::
::::::::::::::


<!-- 

# Operador de fusión nula (`??`)

Devuelve el operando de la derecha únicamente cuando el de la izquierda vale `null` o `undefined`.

```javascript
const nombre = null;

console.log(nombre ?? "Anónimo");
```

Resultado:

```
Anónimo
```

Este operador evita muchos errores relacionados con valores inexistentes.

---

# Encadenamiento opcional (`?.`)

Permite acceder a propiedades de un objeto sin producir un error cuando dicho objeto no existe.

```javascript
const usuario = null;

console.log(usuario?.nombre);
```

Resultado:

```
undefined
```

Sin este operador el programa produciría una excepción.

Es una característica incorporada en JavaScript moderno y ampliamente utilizada.

---

# Operador de propagación (`...`)

Permite expandir el contenido de un array u objeto.

```javascript
const numeros = [1, 2, 3];

const copia = [...numeros];

console.log(copia);
```

Resultado:

```
[1, 2, 3]
```

También se utiliza para combinar arrays y objetos.

Estudiaremos este operador con mayor profundidad en unidades posteriores.


 -->