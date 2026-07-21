
# Objetos {#objetos}

Hasta ahora hemos trabajado con variables capaces de almacenar un único dato, pero como ya sabemos, en una aplicación real normalmente usamos entidades y datos más complejos. Esto hace que usar sólo variables independientes sea ineficiente y poco real.

En JavaScript podemos usar **[objetos](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Working_with_objects)**, que son una estructura que permite agrupar información relacionada. Cada dato dentro de un objeto es una **propiedad**.

::: mycode
[Crear objeto]{.title}
```javascript
const alumno = {
    nombre: "Rubén",
    edad: 20,
    direccion: {
        ciudad: "Bilbao",
        calle: "una",
    }
};
```
:::


En el ejemplo anterior tenemos el objeto **alumno** con tres propiedades y cada uno con su valor. Los objetos pueden modificarse incluso aunque hayan sido declarados con [const]{.verbatim} ya que se está cambiando el contenido, pero no la referencia (que es lo que protege [const]{.verbatim}).


## Propiedades {#propiedades}

Tal como se ha mencionado, un objeto contiene una colección de propiedades, y sobre ellas tenemos la posibilidad de realizar distintas operaciones que vamos a detallar a continuación:

### Acceder y modificar propiedades {#acceder-modificar-propiedades}

Una vez creado un objeto, es posible consultar el valor de sus propiedades, modificarlas, añadir otras nuevas o eliminarlas. JavaScript proporciona varias formas de acceder a la información almacenada dentro de un objeto.

Para acceder a las propiedades podemos hacerlo de dos maneras:

:::::::::::::: {.columns }
::: {.column width="47%"}

::: mycode
[Acceder a propiedades]{.title}
```javascript
console.log(alumno.nombre);
console.log(alumno.edad);
console.log(alumno.direccion.calle);
```
:::

:::
::: {.column width="47%" }

::: mycode
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
//undefined
console.log(profesor?.nombre);
// error
console.log(profesor.nombre)
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


## Métodos {#objetos-métodos}

Los objetos también puede contener funciones, que reciben el nombre de **métodos**. Los métodos se pueden declarar de dos maneras tal como podemos ver a continuación:

:::::::::::::: {.columns }
::: {.column width="47%"}

::: mycode
[Método]{.title}
```javascript
const alumno = {
    nombre: "Rubén",
    saludar: function () {
        console.log("Hola.");
    }
};
alumno.saludar();
```
:::

:::
::: {.column width="47%" }

[Método]{.title}
```javascript
const alumno = {
    nombre: "Rubén",
    saludar (saludo) {
        console.log(`Hola ${saludo}`);
    }
};
alumno.saludar("tu");
```
:::

:::
::::::::::::::


### El valor [this]{.verbatim} {#valor-this .unnumbered}

Dentro de un método podemos acceder al propio objeto utilizando la palabra reservada [this]{.verbatim}.

:::::::::::::: {.columns }
::: {.column width="47%"}

::: mycode
[Uso de "this"]{.title}
```javascript
const alumno = {
    nombre: "Rubén",
    saludar() {
        console.log(`Hola ${this.nombre}`);
    }
};
alumno.saludar();
```
:::

:::
::: {.column width="47%" }

["this" no funciona *arrow-functions*]{.title}
```javascript
const alumno = {
    nombre: "Rubén",
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






<!-- 


# 5.4 Recorrido de propiedades

En muchas ocasiones es necesario procesar todas las propiedades de un objeto.

JavaScript proporciona distintos mecanismos para recorrerlas.

---

# Utilizando `for...in`

La forma más sencilla consiste en utilizar un bucle `for...in`.

```javascript
const alumno = {

    nombre: "Ana",

    edad: 20,

    ciudad: "Bilbao"

};

for (const propiedad in alumno) {

    console.log(propiedad);

}
```

Salida:

```
nombre

edad

ciudad
```

En este caso únicamente obtenemos el nombre de las propiedades.

---

# Obtener también los valores

Podemos acceder al valor utilizando corchetes.

```javascript
for (const propiedad in alumno) {

    console.log(propiedad, alumno[propiedad]);

}
```

Salida:

```
nombre Ana

edad 20

ciudad Bilbao
```

---

# `Object.keys()`

La función `Object.keys()` devuelve un array con todas las propiedades del objeto.

```javascript
const propiedades = Object.keys(alumno);

console.log(propiedades);
```

Resultado:

```javascript
["nombre", "edad", "ciudad"]
```

Como devuelve un array, puede recorrerse fácilmente.

```javascript
for (const propiedad of Object.keys(alumno)) {

    console.log(propiedad);

}
```

---

# `Object.values()`

Devuelve únicamente los valores.

```javascript
console.log(Object.values(alumno));
```

Resultado:

```javascript
["Ana", 20, "Bilbao"]
```

---

# `Object.entries()`

Devuelve un array formado por pares **clave-valor**.

```javascript
console.log(Object.entries(alumno));
```

Resultado:

```javascript
[
    ["nombre", "Ana"],
    ["edad", 20],
    ["ciudad", "Bilbao"]
]
```

Es especialmente útil cuando necesitamos recorrer simultáneamente las claves y sus valores.

```javascript
for (const [propiedad, valor] of Object.entries(alumno)) {

    console.log(propiedad, valor);

}
```

Salida:

```
nombre Ana

edad 20

ciudad Bilbao
```

---

# ¿Qué método utilizar?

| Método | Devuelve |
|---------|----------|
| `for...in` | Propiedades del objeto. |
| `Object.keys()` | Array con las propiedades. |
| `Object.values()` | Array con los valores. |
| `Object.entries()` | Array con pares clave-valor. |

En JavaScript moderno es muy frecuente utilizar `Object.entries()` junto con `for...of`, ya que proporciona una sintaxis clara y fácil de leer.

---

# Buenas prácticas

- Utilizar `for...in` únicamente para recorrer objetos.
- No utilizar `for...in` para recorrer arrays.
- Utilizar `Object.keys()`, `Object.values()` y `Object.entries()` cuando resulte más cómodo trabajar con arrays.
- Elegir el método que haga el código más claro y fácil de mantener.


 -->