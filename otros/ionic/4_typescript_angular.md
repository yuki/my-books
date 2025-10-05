
# Introducción a TypeScript {#introduccion-typescript}

**[TypeScript](https://es.wikipedia.org/wiki/TypeScript)** (TS) es un lenguaje de código abierto desarrollado por Microsoft que se basa en **JavaScript** (realmente es un superconjunto de este), añadiendo **tipado estático** y características propias de lenguajes orientados a objetos como clases, interfaces o módulos.

El código que generamos se **transpila a JavaScript** (el código fuente se convierte a código JavaScript), por lo que puede ejecutarse en cualquier navegador o entorno que soporte JS.

Hoy en día se usa para crear aplicación tanto en entorno cliente como para entorno servidor (para React.js, Node.js...). Desde Angular2 está desarrollado en TypeScript, ya que la primera versión (llamada AngularJS), se desarrollaba con JavaScript.

Hay una amplia [documentación](https://www.typescriptlang.org/docs/handbook/intro.html) del lenguaje, pero a continuación se van a explicar ciertos conceptos básicos.


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


| Característica          | **var**               | **let**                         | **const**                      |
|-------------------------|-----------------------|---------------------------------|--------------------------------|
| Ámbito (scope)          | Función               | Bloque                          | Bloque                         |
| Redeclaración permitida |  Sí                   | **No**                          | **No**                         |
| Reasignación permitida  |  Sí                   | Sí                              | No                             |
| Uso recomendado         | **Evitarlo**          | Para variables que cambian    | Para valores fijos o referencias |

Table: {tablename=yukitblr colspec=XXXX}

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


