
# Estructuras de control {#estructuras-control}

Hasta ahora hemos aprendido a declarar variables, almacenar información y realizar operaciones con ellas. Todos lo hemos visto hasta ahora ejecutan las instrucciones de manera secuencial, una después de otra. Un programa debe ser capaz de tomar decisiones, repetir tareas o ejecutar unas instrucciones u otras dependiendo de la información introducida por el usuario.

Las **estructuras de control** permiten modificar el flujo normal de ejecución de un programa, y gracias a ellas podremos crear aplicaciones complejas y dinámicas. Tal como sabéis del curso pasado las estructuras de control se diferencian en:

- **Estructuras secuenciales**: se ejecutan una detrás de otra.
- **Estructuras condicionales**: ejecuta instrucciones dependiendo de una condición.
- **Estructuras repetitivas**: permite ejecutar un bloque varias veces.


## Estructuras condicionales {#estructuras-condicionales}

Tal como existe en otros lenguajes de programación la estructura condicional [if]{.verbatim} es la más sencilla y ejecutará el contenido si se cumple una condición. Si esa condición no se cumple y existe el bloque [else]{.verbatim} se ejecutará este segundo bloque.


:::::::::::::: {.columns }
::: {.column width="47%"}

::: {.mycode}
[Condicional simple]{.title}
```javascript
const edad = 20;

if (edad >= 18) {
    console.log("Mayor");
}
```
:::

:::
::: {.column width="47%" }

::: {.mycode}
[Condicional con else]{.title}
```javascript
const edad = 20;

if (edad >= 18) {
    console.log("Mayor");
} else {
    console.log("Menor");
}
```
:::

:::
::::::::::::::

::: exercisebox
[[09a](https://github.com/yuki/ejercicios/blob/main/daw/dec/09a.html)]{.solution}

Pide con [prompt()]{.verbatim} la edad y usa un condicional para saber si es: mayor o menor.
:::

En la condición se pueden usar los [operadores de comparación](##operadores-comparación) vistos previamente y si queremos concatenar más de una condición, los [operadores lógicos](#operadores-lógicos).

:::::::::::::: {.columns }
::: {.column width="47%"}

::: {.mycode size=footnotesize}
[Operador lógico]{.title}
```javascript
const edad = 20;

if (edad >= 18 && edad <=65) {
    console.log("Mayor");
} else {
    console.log("Menor o jubilado");
}
```
:::

:::
::: {.column width="47%" }

::: {.mycode size=footnotesize}
[Condicional con else if]{.title}
```javascript
let edad = 20;

if (edad >= 65) {
    console.log("Jubilado");
} else if (edad >= 18){
    console.log("Mayor");
} else {
    console.log("Menor");
}
```
:::

:::
::::::::::::::

Tal como se puede ver, también se puede utilizar [else if]{.verbatim} si queremos comprobar una nueva condición que no se valide en la anterior.


::: exercisebox
[[09b](https://github.com/yuki/ejercicios/blob/main/daw/dec/09b.html)]{.solution}

Pide con [prompt()]{.verbatim} la edad y usa un condicional para saber si es: menor, mayor o jubilado.
:::


### Operador ternario {#operador-ternario}

Si queremos escribir una estructura sencilla [if..else]{.verbatim} podemos hacer uso del operador ternario en una única línea de la siguiente manera:

::: {.mycode}
[Operador ternario]{.title}
```javascript
const edad = 20;

const mensaje = edad >= 18 ? "Mayor" : "Menor";
```
:::


### Estructura [switch]{.verbatim} {#switch}

Si queremos comprobar varias condiciones, para no tener que anidar [if else]{.verbatim} podemos hacer uso de [switch]{.verbatim}:

::: {.mycode}
[Usando switch]{.title}
```javascript
switch (action) {
  case "draw":
    console.log("draw");
    break;
  case "eat":
    console.log("eat");
    break;
  default:
    console.log("default");
}
```
:::

Es importante añadir la sentencia [break]{.verbatim} al final de cada bloque, porque si no se seguirá ejecutando en "cascada" el resto de niveles inferiores. El bloque [default]{.verbatim} se ejecutará si no coincide con ninguno de los bloques anteriores.

::: exercisebox
[[09c](https://github.com/yuki/ejercicios/blob/main/daw/dec/09c.html)]{.solution}

Usa el condicional [switch]{.verbatim} usando y sin usar [break]{.verbatim}.
:::


# Bucles {#bucles}

Para realizar sentencias repetitivas y la ejecución repetida de bloques existen las **estructuras repetitivas**, también conocidas como **bucles**.

Un bucle permite ejecutar un bloque de instrucciones varias veces mientras se cumpla una determinada condición. Tal como pasa en otros lenguajes de programación, en JavaScript hay varios tipos de bucles:

## El bucle [while]{.verbatim} {#bucle-while}

El bucle [while]{.verbatim} ejecuta un bloque **mientras la condición sea verdadera**. La condición se evalúa **antes** de cada iteración, y por tanto, si la condición es falsa, no se realizará el bucle.

:::::::::::::: {.columns }
::: {.column width="47%"}

::: {.mycode}
[Bucle while]{.title}
```javascript
let contador = 1;

while (contador <= 5) {
    console.log(contador);
    contador++;
}
```
:::

:::
::: {.column width="47%" }

::: {.mycode}
[Bucle infinito]{.title}
```javascript
let contador = 1;

while (contador <= 5) {
    console.log(contador);
}
```
:::

:::
::::::::::::::

::: errorbox
Es importante tener en cuenta la condición para evitar **bucles infinitos**.
:::


## El bucle [do...while]{.verbatim} {#bucle-do-while}

En este caso la condición se evalúa **después** de ejecutar el bloque.


::: {.mycode}
[Bucle do...while]{.title}
```javascript
let contador = 1;
do {
    console.log(contador);
    contador++;
} while (contador <= 5);
```
:::



## El bucle [for]{.verbatim} {#bucle-for}

Es el bucle más utilizado cuando conocemos de antemano el número de repeticiones.


::: {.mycode}
[Bucle for]{.title}
```javascript
for (let i = 1; i <= 5; i++) {
    console.log(i);
}
```
:::

En este caso en la sentencia se diferencian tres partes:

- **Inicialización**: [let i = 0]{.verbatim}
- **Condición**: [i < 10]{.verbatim}
- **Actualización**: [i++]{.verbatim}


::: exercisebox
[[10a](https://github.com/yuki/ejercicios/blob/main/daw/dec/10a.html)]{.solution}

Crea un ejemplo de cada uno de los bucles vistos.
:::


## El bucle [for...of]{.verbatim} {#bucle-for-of}

JavaScript moderno incorpora el bucle [for...of]{.verbatim}, diseñado para recorrer objetos iterables (Aray, Map, Set...).

Es la forma recomendada para recorrer arrays.


::: {.mycode}
[Bucle for...of]{.title}
```javascript
const colores = ["Rojo", "Verde", "Azul"];

for (const color of colores) {
    console.log(color);
}
```
:::

## El bucle [for...in]{.verbatim} {#bucle-for-in}

Con el bucle [for...in]{.verbatim} se puede recorrer las propiedades de un objeto.

::: {.mycode}
[Bucle for...in]{.title}
```javascript
const alumno = {
    nombre: "Bob",
    edad: 20
};

for (const propiedad in alumno) {
    console.log(propiedad);
}
```
:::

También puede utilizarse sobre arrays, aunque **no es recomendable**. Para recorrer arrays utilizaremos siempre [for...of]{.verbatim}.


## Resumen de bucles

En la siguiente tabla se puede ver un resumen de los tipos de bucles y para qué deberíamos usarlos.

| Situación | Bucle recomendado |
|-----------|------------------|
| Número conocido de repeticiones | `for` |
| Repetir mientras se cumpla una condición | `while` |
| Ejecutar al menos una vez | `do...while` |
| Recorrer arrays | `for...of` |
| Recorrer propiedades de objetos | `for...in` |


## Las sentencias [break]{.verbatim} y [continue]{.verbatim} {#break-verbatim}

En ocasiones es necesario modificar el comportamiento normal de un bucle, y para ello están las siguiente instrucciones:

- [break]{.verbatim}: finaliza inmediatamente el bucle.
- [continue]{.verbatim}: salta la iteración actual y continúa con la siguiente.


:::::::::::::: {.columns }
::: {.column width="47%"}

::: {.mycode size=footnotesize}
[Sentencia "break"]{.title}
```javascript
const numeros = [4, 8, 15, 23];

for (const numero of numeros) {
    if (numero === 15) {
        console.log("Encontrado");
        break;
    }
}
```
:::

:::
::: {.column width="47%" }

::: {.mycode size=footnotesize}
[Sentencia "continue"]{.title}
```javascript
for (let i = 1; i <= 5; i++) {
    if (i === 3) {
        continue;
    }
    console.log(i);
}
```
:::

:::
::::::::::::::

::: exercisebox
[[10b](https://github.com/yuki/ejercicios/blob/main/daw/dec/10b.html)]{.solution}

Crea un ejemplo de cada uno de los bucles vistos.
:::


# Gestión de errores básica {#gestión-errores-básica}

JavaScript permite detectar y gestionar errores para evitar que la aplicación finalice de forma inesperada.

## Estructura [try...catch]{.verbatim} {#try-catch}

La estructura de gestión de excepciones que está presente en muchos lenguajes de programación es [try...catch]{.verbatim}, y JavaScript no iba a ser la excepción.

Si realizamos una sentencia que es propensa a generar un error, el programa puede pararse. Si esa sentencia se realiza dentro de un [try...catch]{.verbatim} podemos controlar la gestión del error.

::: {.mycode}
[Ejemplo de gestión de errores]{.title}
```javascript
try {
    console.log(variableInexistente);
}
catch (error) {
    console.log("Error: "+error);
}
```
:::

### El objeto [error]{.verbatim} {#error-object}

El [catch]{.verbatim} recibe un objeto con información sobre el error, que cuenta con dos atributos:

- **name**: el nombre del error.
- **message**: el mensaje de error.


### Bloque [finally]{.verbatim} {#finally}

Junto al bloque [try...catch]{.verbatim} podemos añadir un bloque opcional llamado [[finally]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/try...catch#syntax) que **se ejecutará siempre, haya o no error**.


::: {.mycode}
[Ejemplo de gestión de errores]{.title}
```javascript
try {
    console.log("Inicio");
}
catch (error) {
    console.log("Error: "+error);
}
finally {
    console.log("Fin");
}
```
:::


## Generar errores con [throw]{.verbatim} {#generar-errores-throw}

También es posible producir errores de forma intencionada con la sentencia [[throw]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/throw).

::: {.mycode}
[Ejemplo de crear errores]{.title}
```javascript
const edad = -5;

if (edad < 0) {
    throw new Error("La edad no puede ser negativa.");
}
```
:::


# Funciones {#funciones}

Hasta este momento hemos escrito programas formados por una secuencia de instrucciones. A medida que los programas crecen, es habitual encontrarse con bloques de código que realizan siempre la misma tarea. Copiar y pegar ese código varias veces hace que el programa sea más difícil de mantener y aumenta la probabilidad de cometer errores.

Las **[funciones](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions)** permiten agrupar un conjunto de instrucciones bajo un nombre para poder ejecutarlas siempre que sea necesario. Las funciones constituyen uno de los elementos más importantes de cualquier lenguaje de programación.


## Declaración y uso de funciones {#declaración-funciones}

La forma clásica de crear una función consiste en utilizar la palabra reservada [function]{.verbatim}. Para llamar a la función usaremos la palabra reservada junto con [()]{.verbatim}.

:::::::::::::: {.columns }
::: {.column width="47%"}

::: {.mycode}
[Declarar función]{.title}
```javascript
function saludar() {
    console.log("Hola.");
}
```
:::

:::
::: {.column width="47%" }

::: {.mycode}
[Llamar a función]{.title}
```javascript
saludar();
saludar();
```
:::

:::
::::::::::::::

::: infobox
Las funciones declaradas mediante [function]{.verbatim} pueden utilizarse incluso antes de aparecer en el código.
:::



## Parámetros {#parámetros}

En muchas ocasiones una función debe trabajar con datos diferentes cada vez que se ejecuta y para ello se utilizan los **parámetros**. Un parámetro es una variable que recibe un valor cuando la función es llamada. Una función puede recibir varios parámetros.

:::::::::::::: {.columns }
::: {.column width="47%"}

::: {.mycode size=footnotesize}
[Declarar función]{.title}
```javascript
function saludar(nombre) {
    console.log(`Hola ${nombre}`);
}
```
:::

:::
::: {.column width="47%" }

::: {.mycode}
[Llamar a función]{.title}
```javascript
saludar("Ann");
saludar("Bob");
```
:::

:::
::::::::::::::

Aunque es habitual llamar como sinónimos "parámetro" o "argumento", existe una pequeña [diferencia](https://es.wikipedia.org/wiki/Argumento_(inform%C3%A1tica)):

- **Parámetro:** variable definida en la función.
- **Argumento:** valor que se pasa al llamar a la función.


### Valor por defecto  {#valor-por-defecto}

Desde ECMAScript 2015 es posible asignar un valor por defecto a los parámetros. De esta manera podemos llamar a la función añadiendo el parámetro o no.


:::::::::::::: {.columns }
::: {.column width="47%"}

::: {.mycode size=footnotesize}
[Declarar función]{.title}
```javascript
function saludar(nombre="Usuario") {
    console.log(`Hola ${nombre}`);
}
```
:::

:::
::: {.column width="47%" }

::: {.mycode}
[Llamar a función]{.title}
```javascript
saludar();
saludar("Alice");
```
:::

:::
::::::::::::::

::: exercisebox
[[11a](https://github.com/yuki/ejercicios/blob/main/daw/dec/11a.html)]{.solution}

Crea un ejemplo de función con valor por defecto.
:::


### Paso de argumentos {#paso-argumentos}

En otros lenguajes de programación, al declarar una función tenemos que llamarla con el mismo número de parámetros. También suelen permitir usar el mismo identificador de función con distintos parámetros, lo que se llama [sobrecarga de funciones](https://es.wikipedia.org/wiki/Sobrecarga_(inform%C3%A1tica)). Esto no sucede en JavaScript, ya que no obliga a proporcionar exactamente el mismo número de argumentos que parámetros. Esto puede considerarse una ventaja pero también hay que tener cuidado.


:::::::::::::: {.columns }
::: {.column width="47%"}

::: {.mycode}
[Declarar función]{.title}
```javascript
function sumar(a, b) {
    console.log(a+b);
}
```
:::

:::
::: {.column width="47%" }

::: {.mycode}
[Llamar a función]{.title}
```javascript
sumar(4);
```
:::

:::
::::::::::::::

El segundo parámetro, al no haberle pasado un argumento, tendrá el valor [undefined]{.verbatim}. Por este motivo conviene utilizar parámetros por defecto cuando sea necesario o tenerlo en cuenta al crear la función.

::: exercisebox
[[11b](https://github.com/yuki/ejercicios/blob/main/daw/dec/11b.html)]{.solution}

Crea un ejemplo de función con parámetros.
:::


## Valor de retorno {#valor-retorno}

Muchas funciones no solo realizan una tarea, sino que además producen un resultado. Para ello se utiliza la palabra reservada [return]{.verbatim} para devolver el resultado.

:::::::::::::: {.columns }
::: {.column width="47%"}

::: {.mycode}
[Declarar función]{.title}
```javascript
function sumar(a, b) {
    return a + b;
}
```
:::

:::
::: {.column width="47%" }

::: {.mycode}
[Llamar a función]{.title}
```javascript
let resultado = sumar(4,6);
console.log(resultado);
```
:::

:::
::::::::::::::

Si una función no tiene [return]{.verbatim} el valor que devuelve por defecto es [undefined]{.verbatim}.


::: errorbox
Cuando se ejecuta [return]{.verbatim} la función termina. Si no hay [return]{.verbatim}, por defecto devuelve [undefined]{.verbatim}.
:::

::: exercisebox
[[11c](https://github.com/yuki/ejercicios/blob/main/daw/dec/11c.html)]{.solution}

Crea un ejemplo de función con retorno.
:::


## Funciones anónimas y funciones flecha (*arrow Functions*) {#arrow-functions}

JavaScript moderno incorpora una sintaxis para crear **funciones anónimas**, más compacta para definir funciones que carecen de nombre/identificador. Otra manera de crear funciones anónimas son las conocidas como "funciones flecha" (*arrow functions*). 

Las funciones anónimas son usadas cuando no es necesario reutilizar su código, para asignar valores directamente a una variable, para asignar como argumento a otra función o para ser devueltas desde una función.

A continuación distintos ejemplos de funciones anónimas y la sintaxis que se puede utilizar.

:::::::::::::: {.columns }
::: {.column width="47%"}

::: {.mycode size=footnotesize}
[Función anónima]{.title}
```javascript
const m = function(x, y){
  return x * y;
};
```
:::

:::
::: {.column width="47%" }

::: {.mycode size=footnotesize}
[Función flecha]{.title}
```javascript
const m = (x, y) => {
    return x * y;
}
```
:::

:::
::::::::::::::

:::::::::::::: {.columns }
::: {.column width="47%"}

::: {.mycode size=footnotesize}
[Función flecha]{.title}
```javascript
const m = (x, y) => x * y;
```
:::

:::
::: {.column width="47%" }

::: {.mycode size=footnotesize}
[Función flecha]{.title}
```javascript
const m = () => "Hola!";
```
:::

:::
::::::::::::::


::: exercisebox
[[11d](https://github.com/yuki/ejercicios/blob/main/daw/dec/11d.html)]{.solution}

Crea distintos ejemplos de funciones anónimas y flecha.
:::


<!-- 


# 4.7 Clausuras (Closures)

Una **clausura** (*closure*) aparece cuando una función recuerda las variables del entorno donde fue creada.

Ejemplo:

```javascript
function crearContador() {

    let contador = 0;

    return function () {

        contador++;

        return contador;

    };

}

const contar = crearContador();

console.log(contar());

console.log(contar());

console.log(contar());
```

Salida:

```
1

2

3
```

Aunque la función `crearContador()` ya ha terminado, la función interna sigue teniendo acceso a la variable `contador`.

Las clausuras constituyen una característica muy potente del lenguaje y se utilizan frecuentemente en bibliotecas y frameworks.

---

# 4.8 Funciones de orden superior

Una función de orden superior es aquella que:

- Recibe otra función como argumento.
- Devuelve una función como resultado.
- O ambas cosas.

Por ejemplo:

```javascript
function ejecutar(funcion) {

    funcion();

}

ejecutar(() => {

    console.log("Hola");

});
```

Este tipo de funciones resulta fundamental en JavaScript moderno.

---

# 4.9 Callbacks

Un **callback** es una función que se pasa como argumento a otra función para que sea ejecutada posteriormente.

Ejemplo:

```javascript
function procesar(callback) {

    console.log("Inicio");

    callback();

    console.log("Fin");

}

procesar(() => {

    console.log("Procesando...");

});
```

Salida:

```
Inicio

Procesando...

Fin
```

Los callbacks aparecen constantemente al trabajar con eventos, temporizadores, peticiones HTTP y programación asíncrona.

En unidades posteriores volveremos a estudiarlos con mucho más detalle.


 -->




