
# Introducción {#introduccion-typescript}

**[TypeScript](https://es.wikipedia.org/wiki/TypeScript)** (TS) es un lenguaje de código abierto desarrollado por Microsoft que se basa en **JavaScript** (realmente es un superconjunto de este), añadiendo **tipado estático** y características propias de lenguajes orientados a objetos como clases, interfaces o módulos.

El código que generamos se **transpila a JavaScript** (el código fuente se convierte a código JavaScript), por lo que puede ejecutarse en cualquier navegador o entorno que soporte JS.

Hoy en día se usa para crear aplicación tanto en entorno cliente como para entorno servidor (para React.js, Node.js...). Desde Angular2 está desarrollado en TypeScript, ya que la primera versión (llamada AngularJS), se desarrollaba con JavaScript.

Hay una amplia [documentación](https://www.typescriptlang.org/docs/handbook/intro.html) del lenguaje y en la web del [W3School](https://www.w3schools.com/typescript/index.php) también existe un tutorial completo. A continuación sólo se van a explicar ciertos conceptos básicos para tener una guía de referencia básica.


## Ventajas de usar TypeScript {#ventajas-typescript}

Entre las ventajas que nos podemos encontrar al usar TypeScript, se pueden destacar las siguientes:

- **Detección de errores en tiempo de desarrollo** gracias al tipado.
- **Código más legible y mantenible**.
- **Autocompletado y ayuda contextual** en el editor (por ejemplo, VS Code).
- **Compatibilidad total con JavaScript**: cualquier código JS válido también lo es en TS.


# Declaración de variables {#declaracion-variables}

Para declarar variables existen diferentes maneras en TypeScript:

- [var]{.verbatim} o sin asignación: **no recomendado**
  - Es la forma tradicional de declarar variables en JavaScript.
  - Tiene **ámbito de función**, no de bloque.
  - Puede **redefinirse y reasignarse** libremente.
  - Puede provocar errores difíciles de detectar.
- [let]{.verbatim}:
  - Introducido con **ES6** (2015).
  - Tiene **ámbito de bloque**: solo existe dentro del bloque donde se define.
  - Puede **reasignarse**, pero **no redeclararse** en el mismo bloque.
  - Es la opción más usada para variables que cambian de valor.
- [const]{.verbatim}
  - También introducido con **ES6**.
  - Tiene **ámbito de bloque**, igual que `let`.
  - **No puede reasignarse** (su valor no puede cambiar).
  - Ideal para valores que deben permanecer constantes.


|                         | **var**               | **let**                         | **const**                      |
|-------------------------|-----------------------|---------------------------------|--------------------------------|
| Ámbito (scope)          | Función               | Bloque                          | Bloque                         |
| Redeclaración permitida |  Sí                   | **No**                          | **No**                         |
| Reasignación permitida  |  Sí                   | Sí                              | No                             |
| Uso recomendado         | **Evitarlo**          | Para variables que cambian    | Para valores fijos o referencias |

Table: {tablename=yukitblrcol colspec=XXXX}

En el siguiente apartado veremos ejemplos de cómo se declaran las variables.


# Tipos de datos {#tipos-datos}

En la [documentación oficial](https://www.typescriptlang.org/docs/handbook/basic-types.html) se explican todos los tipos de datos que se pueden utilizar en TypeScript. A continuación se van a detallar algunos de ellos

## Tipos simples {#tipos-simples}

TypeScript cuenta con tres tipos de datos simples:

- **[string]{.verbatim}**: para representar cadenas de texto
- **[number]{.verbatim}**: para tipos numéricos. No existe distinción como en otros lenguajes para *int* o *float*, aunque sí existe para **bigint**. También soporta números en binario, octal y hexadecimal:
- **[boolean]{.verbatim}**: para tipos que sólo pueden ser *true* o *false*.

Existen otros tipos de datos especiales:

- **[any]{.verbatim}**: desactiva el control de tipos. Se recomienda evitarlo salvo en casos especiales (uso de código que no se ha escrito en TypeScript, o librerías de terceros).
- **[unknown]{.verbatim}**: es la contrapartida a *any*, ya que aunque puede ser de cualquier tipo, mantiene el tipado seguro.
- **[undefined]{.verbatim}**: se puede asignar a cualquier tipo, pero es un tipo propio.
- **[null]{.verbatim}**: igual que el anterior.

::: {.mycode}
[Ejemplos de declaración de variables y tipos]{.title}

``` typescript
const nombre: string = "Rubén";
const pi: number = 3.1415;
let decimal: number = 6;
let hex: number = 0xf00d;
let binary: number = 0b1010;
let octal: number = 0o744;
let big: bigint = 100n;
let activado: boolean = true;
```
:::


## Tipos complejos {#tipos-complejos}

Existen otros tipos de datos, también habituales en otros lenguajes de programación.

### Arrays {#typescript-array}

Como en otros lenguajes, podemos crear *arrays* del **mismo tipo de datos**. A la hora de declararlo, en cambio, se puede hacer de tres maneras:

::: {.mycode}
[Declarar un array]{.title}

``` typescript
// se infiere que el tipo es number[]
let prueba = [1, 2, 3];
// define un array con elementos de tipo number
let prueba2: number[] = [1,2, 3];
// usa la clase Array, indicando que contendrá datos number
let prueba3: Array<number> = [1, 2, 3];
```
:::


### Tuplas {#typescript-tuplas}

Una ***tuple*** (o tupla) es un tipo de array con una largura y un tipo de datos para cada posición predefinida. Se pueden nombrar las posiciones, para ayudar a la comprensión, pero no afecta al funcionamiento

::: {.mycode}
[Declarar una tuple]{.title}

``` typescript
// definir la tupla
let ejemplo: [number, boolean, string];
// inicializar con datos correctos
ejemplo = [5, false, 'Mi texto'];
let direccion: [calle: string, n: number];
```
:::


### Objetos propios: *type* e *interface* {#typescript-objetos}

Al igual que pasa en JavaScript, podemos crear objetos propios, siendo una colección de parejas clave-valor. La ventaja es que podremos especificar el tipo de datos para cada propiedad del objeto. Otra característica de TypeScript es que podemos crear objetos con propiedades opcionales

::: {.mycode}
[Crear un objeto propio]{.title}

``` typescript
const coche: { marca: string, year?: number } = {
  marca: "Toyota"
};
car.year = 2000;
```
:::

La propiedad *year* es opcional porque le hemos puesto el símbolo de interrogante **[?]{.verbatim}**. Al ser opcional, durante la asignación inicial podemos no asignarle valor.

Para poder reutilizar un tipo de objeto, podemos usar [interface]{.verbatim}, lo que también nos permite crear nuevos objetos extendiendo otros ya creados.

::: {.mycode}
[Crear y extender un objeto]{.title}

``` typescript
interface Rectangle {
  height: number,
  width: number
}
interface ColoredRectangle extends Rectangle {
  color: string
}
const coloredRectangle: ColoredRectangle = {
  height: 20,
  width: 10,
  color: "red"
};
```
:::

Con [type]{.verbatim} podemos crear tipos personalizados, que pueden tener un valor prefijado.

::: {.mycode}
[Crear y extender un objeto]{.title}

``` typescript
type Rol = "admin" | "usuario" | "invitado";
let rolActual: Rol = "usuario";
```
:::

La palabra reservada [type]{.verbatim} también puede utilizarse para crear otros tipos de objetos. Se recomienda leer los siguientes enlaces para poder ver todas las posibilidades:

- [w3cshcools](https://www.w3schools.com/typescript/typescript_aliases_and_interfaces.php): explica las diferencias entre [type]{.verbatim} e [interface]{.verbatim}.
- [*cheatsheets*](https://www.typescriptlang.org/cheatsheets/) explicando las posibilidades de [type]{.verbatim} e [interface]{.verbatim}.


::: warnbox
Los objetos declados con [type]{.verbatim} e [interface]{.verbatim} tienen ciertas diferencias, explicadas en la documentación.
:::

### Enum {#typescript-enum}

Los [enum](https://www.typescriptlang.org/docs/handbook/enums.html) son un tipo de clase especial que representa un grupo de constantes, y que no se pueden modificar. Pueden ser de tipo *string* o numéricos.

Los *enum* numéricos los podemos inicializar o pueden inicializarse sólos empezando por 0.

:::::::::::::: {.columns }

::: {.column width="6%"}
:::

::: {.column width="40%" }

::: {.mycode}
[Enum numérico inicializado]{.title}

``` typescript
enum Direction {
  Up = 1,
  Down,
  Left,
  Right,
}
```
:::
:::

::: {.column width="6%"}
:::

::: {.column width="40%" }
::: {.mycode}
[Enum numérico sin inicializar]{.title}

``` typescript
enum Direction {
  Up,
  Down,
  Left,
  Right,
}
```
:::

:::
::: {.column width="6%"}
:::
::::::::::::::

El resto de constantes tendrán un valor auto-incremental partiendo del valor inicial (sea 0, o el que hayamos puesto).

:::::::::::::: {.columns }

::: {.column width="40%" }

::: {.mycode}
[Enum de texto]{.title}

``` typescript
enum Direction {
  Up = "UP",
  Down = "DOWN",
}
```
:::
:::

::: {.column width="50%"}
En el caso de crear un *enum* de tipo *string*, cada miembro debe ser inicializado con un texto.

:::

::::::::::::::


# Funciones y parámetros {#funciones-parametros}

A la hora de crear funciones debemos especificar los parámetros y los tipos de objetos que tienen. Los parámetros pueden ser:

- **Tener valores prefijados**: se puede especificar el valor por defecto de un parámetro, por lo que se puede llamar a la función sin especificarlo.
- **Opcionales**: los parámetros pueden ser opcionales, si se especifica con el símbolo de interrogante **[?]{.verabatim}**.

En caso de que las funciones devuelvan un dato, también hay que especificar el tipo de datos que va a devolver. En caso de que no devuelva ningún tipo de datos, se usará [void]{.verbatim}.

::: {.mycode}
[Enum de texto]{.title}

``` typescript
function sumar(a: number, b: number = 10): number {
  return a + b;
}

function saludar(nombre: string, mensaje?: string): void {
  console.log(mensaje ? `${mensaje}, ${nombre}` : `Hola, ${nombre}`);
}

console.log(sumar(2));    // 12
console.log(sumar(3, 5)); // 8
saludar("Ana");         // Hola, Ana
saludar("Bob", "Buenos días"); // Buenos días, Bob
```
:::



# Clases y métodos {#clases-métodos}

TypeScript permite usar clases, constructores y métodos, como en otros lenguajes de programación orientado a objetos tradicionales. La sintaxis de una clase, los objetos y los métodos se realiza de manera similar a otros lenguajes.

::: {.mycode}
[Ejemplo de clase]{.title}

``` ts
class Persona {
  private nombre: string;
  private edad: number;

  public constructor(nombre: string, edad: number) {
    this.nombre = nombre;
    this.edad = edad;
  }

  saludar() {
    console.log(`Hola, soy ${this.nombre} y tengo ${this.edad} años.`);
  }
}

const persona1 = new Persona("Bob", 30);
persona1.saludar();
```
:::

Los atributos y los métodos de una clase pueden tener distinta "**visibilidad**":

- **public**: El valor por defecto. Se permite el acceso desde cualquier lugar.
- **private**: Permite el acceso a los miembros de la clase sólo desde la propia clase.
- **protected**: Permite el acceso al miembro de la clase desde sí mismo y desde cualquier clase que lo herede.


## Herencia {#herencia}

Como en otros lenguajes de programación orientada a objetos, también se permite la herencia de una clase "padre". Se permite expandir la funcionalidad con:

- **[implements]{.verbatim}**: en la [documentación](https://www.typescriptlang.org/docs/handbook/2/classes.html#implements-clauses) se explica su uso, que sirve para comprobar que se satisface una [interface]{.verbatim} concreta.
- **[extends]{.verbatim}**: para extender una clase padre. La nueva clase contiene todos los atributos y métodos de la clase original, pudiendo añadir nuevos miembros.


# Módulos e importaciones {#modulos-importaciones}

TypeScript organiza el código en **módulos**. Cada archivo puede **exportar** variables, funciones o clases, y **importarlas** en otros archivos.

::: {.mycode}
[Ejemplo de clase exportada]{.title}

```ts
// archivo: operaciones.ts
export function multiplicar(a: number, b: number): number {
  return a * b;
}

// archivo: main.ts
import { multiplicar } from './operaciones';

console.log(multiplicar(4, 5)); // 20
```
:::

De esta manera es cómo funciona Angular para importar componentes, servicios o módulos.



