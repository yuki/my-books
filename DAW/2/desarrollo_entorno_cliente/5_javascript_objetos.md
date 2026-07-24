
# Objetos {#objetos}

Hasta ahora hemos trabajado con variables capaces de almacenar un único dato, pero como ya sabemos, en una aplicación real normalmente usamos entidades y datos más complejos. Esto hace que usar sólo variables independientes sea ineficiente y poco real.

En JavaScript podemos usar **[objetos](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Working_with_objects)**, que son una estructura que permite agrupar información relacionada. Cada dato dentro de un objeto es una **propiedad**, que se puede declarar con o sin comillas (normalmente sin comillas). De los objetos de JavaScript se deriva el formato [JSON](https://es.wikipedia.org/wiki/JSON) (*JavaScript Object Notation*), ampliamente utilizado hoy en día en internet, como alternativa a [XML](https://es.wikipedia.org/wiki/Extensible_Markup_Language).


:::::::::::::: {.columns }
::: {.column width="47%"}

::: mycode
[Crear objeto]{.title}
```javascript
const alumno = {
    nombre: "Alice",
    edad: 20,
    direccion: {
        ciudad: "Bilbao",
        calle: "una",
    }
};
```
:::

:::
::: {.column width="47%" }

::: mycode
[Crear objeto]{.title}
```javascript
const alumno = {
    "nombre": "Bob",
    "edad": 20,
    "direccion": {
        "ciudad": "Bilbao",
        "calle": "una",
    }
};
```
:::

:::
::::::::::::::



En el ejemplo anterior tenemos el objeto **alumno** con tres propiedades y cada uno con su valor. Los objetos pueden modificarse incluso aunque hayan sido declarados con [const]{.verbatim} ya que se está cambiando el contenido, pero no la referencia (que es lo que protege [const]{.verbatim}).


## Propiedades {#propiedades}

Tal como se ha mencionado, un objeto contiene una colección de propiedades, y sobre ellas tenemos la posibilidad de realizar distintas operaciones que vamos a detallar a continuación:

### Acceder y modificar propiedades {#acceder-modificar-propiedades}

Una vez creado un objeto, es posible consultar el valor de sus propiedades, modificarlas, añadir otras nuevas o eliminarlas. JavaScript proporciona varias formas de acceder a la información almacenada dentro de un objeto.

Para acceder a las propiedades podemos hacerlo de dos maneras:

:::::::::::::: {.columns }
::: {.column width="47%"}

::: {.mycode size=footnotesize}
[Acceder a propiedades]{.title}
```javascript
console.log(alumno.nombre);
console.log(alumno.edad);
console.log(alumno.direccion.calle);
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[Acceder a propiedades]{.title}
```javascript
console.log(alumno["nombre"]);
console.log(alumno["direccion"]["calle"]);
//evitad mezclar
console.log(alumno["direccion"].calle);
```
:::

:::
::::::::::::::

El uso de corchetes suele ser más habitual cuando el nombre de la propiedad lo tenemos en una variable.


:::::::::::::: {.columns }
::: {.column width="47%"}

::: mycode
[Acceder a propiedades]{.title}
```javascript
let propiedad = "direccion";
console.log(alumno[propiedad])
```
:::

:::
::: {.column width="47%" }

::: mycode
[Modificar propiedades]{.title}
```javascript
alumno.nombre = "Bob";
alumno.curso = "2º DAW";
```
:::

:::
::::::::::::::


Para modificar la propiedad usaríamos la misma forma tal como se ve en el código de arriba. Y si queremos añadir propiedades nuevas, igual.

### Eliminar propiedades {#eliminar-propiedades}

En caso de querer borrar una propiedad usaremos el operador [delete]{.verbatim}. Por defecto siempre devuelve [true]{.verbatim} [aunque hay excepciones](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/delete#return_value).

::: mycode
[Eliminar propiedades]{.title}
```javascript
delete alumno.curso;
```
:::


### Acceder a propiedad inexistente {#propiedad-inexistente}

Es posible que en algún caso intentemos acceder a una propiedad no definida, y por tanto inexistente. El resultado será [undefined]{.verbatim}, por lo que no dará error.


### Acceso a objeto inexistente con [?.]{.verbatim} {#objeto-inexistente}

Si un objeto puede no existir, si intentásemos acceder a él o a una propiedad del mismo, obtendremos un error. Para evitar ese error, podemos utilizar el operador [?.]{.verbatim} (llamado *[optional chaining](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Optional_chaining)*).


::: mycode
[Acceder objeto inexistente]{.title}
```javascript
const profesor = null;
console.log(profesor?.nombre); // undefined
console.log(profesor.nombre);  // error
```
:::

### Comprobar si existe una propiedad {#comprobar-propiedad}

Una forma sencilla consiste en utilizar el operador [in]{.verbatim}. Al utilizar este operador tendremos un tipo booleano, por lo que si la propiedad existe tendremos un [true]{.verbatim}.


::: mycode
[Comprobar si existe propiedad]{.title}
```javascript
if ("edad" in alumno) {
    console.log("tiene edad")
} else {
    console.log("no tiene edad")
}
```
:::

### Recorrido de propiedades {#recorrido-propiedades}

En muchas ocasiones es necesario procesar todas las propiedades de un objeto. JavaScript proporciona distintos mecanismos para recorrerlas.

#### Utilizando [for...in]{.verbatim} {#recorrer-utilizando-for-in}

Ya hemos visto previamente que podemos hacer uso del bucle La forma más sencilla consiste en utilizar un bucle `for...in`. En este caso únicamente obtenemos el nombre de las propiedades.

::: mycode
[Recorrer con [for...in]{.verbatim}]{.title}
```javascript
const alumno = {
    nombre: "Alice",
    edad: 20,
    ciudad: "Bilbao"
};

for (const propiedad in alumno) {
    console.log(propiedad);
}
```
:::

::: exercisebox
[[12a](https://github.com/yuki/ejercicios/blob/main/daw/dec/12a.html)]{.solution}

Crea un objeto, añade propiedad, borra y recorre todas las propiedades.
:::

#### Obtener todas las propiedades con [Object.keys()]{.verbatim} {#obtener-todas-las-propiedades}

La función [Object.keys()]{.verbatim} devuelve un array con todas las propiedades del objeto.

::: mycode
[Recorrer con [Object.keys()]{.verbatim}]{.title}
```javascript
const propiedades = Object.keys(alumno);
console.log(propiedades);
// recorrer propiedades
for (const propiedad of Object.keys(alumno)) {
    console.log(propiedad);
}
```
:::


#### Obtener sólo los valores de las propiedades con [Object.values()]{.verbatim} {#obtener-valores-las-propiedades}

Si queremos sólo los valores, podemos utilizar la función [Object.values()]{.verbatim}.

::: mycode
[Obtener sólo los valores]{.title}
```javascript
console.log(Object.values(alumno));
```
:::


#### Obtener propiedad y valor con [Object.entries()]{.verbatim} {#obtener-propiedad-valor-array}

Devuelve un array formado por pares en el formato [[[clave,valor],...]]{.verbatim}.

::: mycode
[Obtener sólo los valores]{.title}
```javascript
console.log(Object.values(alumno));
// recorrer propiedad/valor
for (const [propiedad, valor] of Object.entries(alumno)) {
    console.log(propiedad, valor);
}
```
:::

::: exercisebox
[[12b](https://github.com/yuki/ejercicios/blob/main/daw/dec/12b.html)]{.solution}

Usa [Object.entries()]{.verbatim} para recorrer un objeto.
:::


#### ¿Qué método utilizar? {#resumen-recorrer}

A modo de resumen sirva la siguiente tabla. 

| Método | Devuelve |
|---------|----------|
| [for...in]{.verbatim} | Propiedades del objeto. |
| [Object.keys()]{.verbatim} | Array con las propiedades. |
| [Object.values()]{.verbatim} | Array con los valores. |
| [Object.entries()]{.verbatim} | Array con pares propiedad-valor. |

En JavaScript moderno es muy frecuente utilizar [Object.entries()]{.verbatim} junto con [for...of]{.verbatim}, ya que proporciona una sintaxis clara y fácil de leer, pero dependerá de qué necesitamos.

::: infobox
Usa el método para recorrer objetos que mejor se adecúe en cada momento.
:::


## Métodos {#objetos-métodos}

Los objetos también puede contener funciones, que reciben el nombre de **métodos**. Los métodos se pueden declarar de dos maneras tal como podemos ver a continuación:

:::::::::::::: {.columns }
::: {.column width="47%"}

::: {.mycode size=footnotesize}
[Método]{.title}
```javascript
const alumno = {
    nombre: "Carol",
    saludar: function () {
        console.log("Hola.");
    }
};
alumno.saludar();
```
:::

:::
::: {.column width="47%" }

::: {.mycode size=footnotesize}
[Método]{.title}
```javascript
const alumno = {
    nombre: "David",
    saludar (saludo) {
        console.log(`Hola ${saludo}`);
    }
};
alumno.saludar("tu");
```
:::

:::
::::::::::::::


### El valor "this" {#valor-this .unnumbered}

Dentro de un método podemos acceder al propio objeto utilizando la palabra reservada [this]{.verbatim}.

:::::::::::::: {.columns }
::: {.column width="47%"}

::: {.mycode size=footnotesize}
[Uso de "this"]{.title}
```javascript
const alumno = {
  nombre: "Eve",
  saludar() {
    console.log(`Hola ${this.nombre}`);
  }
};
alumno.saludar();
```
:::

:::
::: {.column width="47%" }

::: {.mycode size=footnotesize}
["this" no funciona *arrow-functions*]{.title}
```javascript
const alumno = {
  nombre: "Frank",
  saludar: => () {
    console.log(`Hola ${saludo}`);
  }
};
alumno.saludar();
```
:::

:::
::::::::::::::

Aunque técnicamente es posible utilizar funciones flecha como métodos, normalmente **no es recomendable**. Al utilizar funciones flecha no crean su propio [this]{.verbatim}, por lo que puede producir problemas con los resultados.

::: errorbox
Es mejor evitar las *arrow functions* como método.
:::

::: exercisebox
[[12c](https://github.com/yuki/ejercicios/blob/main/daw/dec/12c.html)]{.solution}

Crea un método dentro de un objeto y haz uso de él.
:::

## Copia de objetos {#copia-objetos}

En muchas ocasiones necesitamos crear una copia de un objeto para modificarla sin alterar el original. Sin embargo, copiar un objeto en JavaScript no siempre produce el resultado esperado. Para comprender este comportamiento es necesario recordar que las variables que almacenan objetos **guardan una referencia al objeto**, no el objeto en sí.

Imaginemos el siguiente ejemplo en el que creamos un objeto y creamos otra variable asignando el objeto:

::: {.mycode size=footnotesize}
[Asignación de objetos]{.title}

```javascript
const alumno1 = {
    nombre: "Grace",
    edad: 20
};
const alumno2 = alumno1;
```
:::

::: exercisebox
[[12d](https://github.com/yuki/ejercicios/blob/main/daw/dec/12d.html)]{.solution}

Añade o modifica en alumno2 una propiedad. ¿Qué pasa con alumno1?
:::

Ambas variables hacen referencia al mismo objeto:

![Referencia de objetos](img/dec/objetos.png){width=50%}

Esto hace que aunque modifiquemos [alumno2]{.verbatim} el cambio también se ve reflejado en [alumno1]{.verbatim}. Es más, si realizamos la comparación con [===]{.verbatim} nos devuelve que es [true]{.verbatim}, porque son el mismo objeto.


::: {.mycode size=footnotesize}
[Comparación de objetos]{.title}

```javascript
const alumno1 = {
    nombre: "Heidi",
    edad: 20
};
const alumno2 = alumno1;
console.log(alumno1 === alumno2);
const alumno3 = {
    nombre: "Heidi",
    edad: 20
};
console.log(alumno1 === alumno3);
```
:::

::: exercisebox
[[12e](https://github.com/yuki/ejercicios/blob/main/daw/dec/12e.html)]{.solution}

Realiza el ejercicio anterior e interioriza lo que sucede.
:::

### Copia superficial {#copia-superficial}

Para realizar una copia real del objeto debemos hacer uso del operador *[Spread](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax)* [...]{.verbatim}, aunque también se puede utilizar [Object.assign()]{.verbatim}.

:::::::::::::: {.columns }
::: {.column width="47%"}

::: {.mycode size=footnotesize}
[Copia superficial]{.title}

```javascript
const alumno1 = {
    nombre: "Ivan",
    edad: 20,
    direccion: {
        ciudad: "Bilbao"
    }
};
const alumno2 = {...alumno1};
console.log(alumno1 === alumno2);
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[Copia superficial]{.title}

```javascript
const alumno1 = {
    nombre: "Alice",
    edad: 20,
    direccion: {
        ciudad: "Bilbao"
    }
};
const alumno2 = Object.assign({}, alumno1);
console.log(alumno1 === alumno2);
```
:::

:::
::::::::::::::


::: exercisebox
[[12f](https://github.com/yuki/ejercicios/blob/main/daw/dec/12f.html)]{.solution}

Cambia la edad y la ciudad en [alumno1]{.verbatim}. ¿Qué sucede en [alumno2]{.verbatim}?
:::

::: errorbox
Cuidado que sólo son **copias superficiales**. **Los objetos anidados siguen siendo el mismo objeto**.
:::


### Copia profunda {#copia-profunda}

Cuando es necesario copiar completamente un objeto, incluidos todos los objetos anidados, hablamos de una **copia profunda** (*deep copy*). En estos casos tenemos que hacer uso de [structuredClone()]{.verbatim}.

::: {.mycode size=footnotesize}
[Copia superficial]{.title}

```javascript
const alumno1 = {
    nombre: "Bob",
    edad: 20,
    direccion: {
        ciudad: "Bilbao"
    }
};
const alumno2 = structuredClone(alumno1);
```
:::

::: exercisebox
[[12g](https://github.com/yuki/ejercicios/blob/main/daw/dec/12g.html)]{.solution}

Cambia la edad y la ciudad en [alumno1]{.verbatim}. ¿Qué sucede en [alumno2]{.verbatim}?
:::



## Combinar objetos {#combinar-objetos}

El operador *spread* también puede utilizarse para combinar objetos.

::: mycode
[Combinar objetos]{.title}
```javascript
const persona = {
    nombre: "Carol"
};
const datos = {
    ...persona,
    edad: 20,
    ciudad: "Bilbao"
};
console.log(datos);
```
:::


## Sobrescribir propiedades {#sobreescribir-propiedades}

Si una propiedad aparece varias veces, prevalece la última.

::: mycode
[Sobrescribir propiedades]{.title}
```javascript
const alumno = {
    nombre: "Dan",
    edad: 20
};

const copia = {
    ...alumno,
    edad: 21
};
```
:::

# Arrays {#arrays}

Hasta ahora hemos visto cómo los objetos permiten agrupar información relacionada, sin embargo, en muchas ocasiones necesitamos almacenar **varios elementos**. Para ello, al igual que en otros lenguajes, JavaScript incorpora los **[arrays](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array)**. 

A diferencia de otros lenguajes, JavaScript permite crear arrays de distintos tipos de datos. El ejemplo más claro es un array de objetos son los datos que obtenemos de una [API](https://en.wikipedia.org/wiki/API) en formato [JSON](https://es.wikipedia.org/wiki/JSON).


:::::::::::::: {.columns }
::: {.column width="47%"}

::: {.mycode size=footnotesize}
[Acceder simple]{.title}
```javascript
const datos = [10, 20, "treinta"];
const llenar = [];
```
:::

:::
::: {.column width="47%" }

::: {.mycode size=footnotesize}
[Array objetos]{.title}
```javascript
const alumnos = [
    {
        nombre: "Ann",
        edad: 20
    },
    {
        nombre: "Bob",
        edad: 21
    }
];
```
:::

:::
::::::::::::::



Aparte del "array tradicional", también existen otras [colecciones indexadas](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects\#indexed_collections).

## Acceder y modificar elementos {#array-acceder-modificar}

Para acceder y modificar elementos de un array debemos hacerlo a través de su índice. En JavaScript los **índices empiezan en 0**.


:::::::::::::: {.columns }
::: {.column width="47%"}

::: mycode
[Acceder a un índice]{.title}
```javascript
console.log(datos[0]);
```
:::

:::
::: {.column width="47%" }

::: mycode
[Modificar un índice]{.title}
```javascript
datos[2] = 30;
```
:::

:::
::::::::::::::


## Longitud del array {#longitud-array}

Para poder saber cuántos elementos tiene el array tenemos la propiedad [length]{.verbatim}. Por lo tanto, si queremos acceder al último elemento, tendremos que restarle 1.

:::::::::::::: {.columns }
::: {.column width="47%"}

::: mycode
[Longitud del array]{.title}
```javascript
console.log(datos.length);
```
:::

:::
::: {.column width="47%" }

::: mycode
[Último elemento]{.title}
```javascript
datos[datos.length-1];
```
:::

:::
::::::::::::::


## Recorrer un array {#recorrer-array}

La forma clásica consiste en utilizar un bucle [for]{.verbatim}, aunque actualmente se hace uso de [for...of]{.verbatim}.

:::::::::::::: {.columns }
::: {.column width="47%"}

::: {.mycode size=footnotesize}
[Recorrer array]{.title}
```javascript
for (let i=0; i<datos.length; i++) {
    console.log(datos[i]);
}
```
:::

:::
::: {.column width="47%" }

::: {.mycode size=footnotesize}
[Recorrer array]{.title}
```javascript
for (const dato of datos) {
    console.log(dato);
}
```
:::

:::
::::::::::::::


## Métodos de arrays {#array-metodos}

JavaScript incorpora numerosos métodos para trabajar con arrays. Muchos de ellos modifican el contenido del array y otros devuelven uno nuevo. A continuación veremos los más utilizados, pero es interesante ver la [documentación de arrays](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array) para ver todos.


:::::::::::::: {.columns }
::: {.column width="47%"}

::: {.mycode size=footnotesize}
[Métodos array]{.title}
```javascript
const numeros = [10, 20, 30, 40, 50];
// añadir elemento al final
numeros.push(60);
// eliminar último elemento
numeros.pop();
// añadir al inicio
numeros.unshift(5);
// eliminar el primero
numeros.shift();
// obtener una parte del array
const nums = numeros.slice(1, 3)
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[Métodos array]{.title}
```javascript
const colores = ["Rojo", "Verde", "Azul"];
// buscar un elemento
console.log(colores.includes("Verde"));
// obtener la posición
console.log(colores.indexOf("Azul"));
// concatenar arrays
const nuevo = numeros.concat(colores);
const letras = ["C", "A", "B"];
// ordenar
letras.sort();
// invertir
letras.reverse();
// convertir en cadena
console.log(colores.join(", "));
```
:::

:::
::::::::::::::

En nla siguiente tabla un resumen de los métodos vistos:

| Método | Descripción |
|---------|-------------|
| [push()]{.verbatim} | Añade al final |
| [pop()]{.verbatim} | Elimina el último |
| [unshift()]{.verbatim} | Añade al principio |
| [shift()]{.verbatim} | Elimina el primero |
| [includes()]{.verbatim} | Comprueba si existe |
| [indexOf()]{.verbatim} | Devuelve la posición |
| [concat()]{.verbatim} | Une arrays |
| [slice()]{.verbatim} | Obtiene una copia parcial |
| [splice()]{.verbatim} | Inserta o elimina elementos |
| [sort()]{.verbatim} | Ordena |
| [reverse()]{.verbatim} | Invierte el orden |
| [join()]{.verbatim} | Convierte en texto |


## Copia de arrays {#copia-arrays}

Al igual que pasaba con los objetos, si tenemos un array creado, al asignarlo a otra variable no estamos realizando una copia, sino una referencia al dato.

<!-- 

# Métodos modernos

JavaScript moderno incorpora métodos muy potentes para trabajar con arrays.

Los más importantes son:

- `find()`
- `filter()`
- `map()`
- `reduce()`
- `some()`
- `every()`

Estos métodos constituyen la base de la programación funcional en JavaScript y se estudiarán en el siguiente apartado de la unidad.

 -->





<!-- 

# 5.5 Desestructuración y operador spread

JavaScript moderno incorpora varias características que simplifican enormemente el trabajo con objetos y arrays.

Dos de las más utilizadas son la **desestructuración** (*destructuring*) y el **operador spread** (`...`).

Ambas aparecen constantemente en aplicaciones modernas y son fundamentales para trabajar con bibliotecas y frameworks como Vue.

---

# Desestructuración de objetos

La desestructuración permite extraer propiedades de un objeto y almacenarlas en variables de forma muy sencilla.

Supongamos el siguiente objeto.

```javascript
const alumno = {
    nombre: "Ana",
    edad: 20,
    ciudad: "Bilbao"

};
```

En lugar de escribir:

```javascript
const nombre = alumno.nombre;

const edad = alumno.edad;
```

podemos escribir:

```javascript
const { nombre, edad } = alumno;
```

Ahora disponemos de dos variables.

```javascript
console.log(nombre);

console.log(edad);
```

Resultado:

```
Ana

20
```

---


# Desestructuración de arrays

También funciona con arrays.

```javascript
const colores = [

    "Rojo",

    "Verde",

    "Azul"

];
```

Podemos escribir:

```javascript
const [primero, segundo] = colores;

console.log(primero);

console.log(segundo);
```

Resultado:

```
Rojo

Verde
```

---

# Ignorar elementos

```javascript
const [primero, , tercero] = colores;

console.log(tercero);
```

Resultado:

```
Azul
```

---

# Intercambiar variables

Una aplicación muy interesante consiste en intercambiar dos variables.

```javascript
let a = 10;

let b = 20;

[a, b] = [b, a];

console.log(a);

console.log(b);
```

Resultado:

```
20

10
```

---

# El operador spread

El operador spread (`...`) permite expandir un objeto o un array.

Ya lo hemos utilizado para copiar objetos.

También funciona con arrays.

```javascript
const grupo1 = [
    "Ana",
    "Luis"
];

const grupo2 = [
    "Pedro",
    "Marta"
];

const grupoCompleto = [
    ...grupo1,
    ...grupo2
];

console.log(grupoCompleto);
```

Resultado:

```javascript
["Ana", "Luis", "Pedro", "Marta"]
```

---

# Añadir elementos fácilmente

```javascript
const numeros = [

    1,

    2,

    3

];

const nuevos = [
    ...numeros,
    4,
    5
];
```

Resultado:

```javascript
[1, 2, 3, 4, 5]
```

---


 -->
