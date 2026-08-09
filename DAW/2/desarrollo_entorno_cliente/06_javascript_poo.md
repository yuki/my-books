
# Programación orientada a objetos {#javascript-poo}

Hasta ahora hemos estado usando objetos literales, y aunque este tipo de objetos resulta suficiente para muchas aplicaciones, es posible que el desarrollo que tengamos que hacer se plantee desde el inicio como objetos con la misma estructura.

Por ejemplo, una aplicación de gestión de un instituto puede manejar cientos de alumnos, y todos ellos van a contar con las mismas características, van a tener la misma estructura. La **Programación Orientada a Objetos (POO)** permite definir un modelo común para crear tantos objetos como sea necesario.

JavaScript incorpora desde **ECMAScript 2015** una sintaxis basada en **clases**, muy similar a la utilizada por otros lenguajes modernos. Aunque internamente JavaScript continúa utilizando prototipos, la sintaxis mediante clases facilita el aprendizaje y es la forma habitual de programar en la actualidad.

<!-- 
TODO: su fuese necesario en el futuro, añadir qué es la POO, ventajas.
 -->

## Resumen de conceptos en POO {#resumen-poo}

Aunque ya se ha programado con orientación a objetos, a continuación se resume los conceptos más importantes:

- **Clase**: describe cómo serán los objetos.
- **Objeto**: es una instancia concreta creada a partir de esa clase.
- **Propiedades/Atributos**: representan el estado del objeto (nombre, edad, ...).
- **Métodos**: representan el comportamiento, o funciones, que puede realizar el objeto.

Tradicionalmente la Programación Orientada a Objetos se basa en cuatro conceptos fundamentales, que ya nos deberían sonar, o al menos, saber utilizar:

- **Abstracción**: consiste en representar un sistema enfocándose en sus características esenciales
- **Encapsulación**: es la agrupación de datos con los métodos que operan en esos datos.
- **Herencia**: gracias a la herencia se pueden crear nuevas clases partiendo de una ya preexistente.
- **Polimorfismo**: se refiere a la propiedad por la que es posible enviar mensajes sintácticamente iguales a objetos de tipos distintos.


# Crear una clase {#crear-clase}

Para crear una clase se usa la palabra reservada [class]{.verbatim}.Su sintaxis general es la que se verá a continuación, y el nombre de la clase, por convenio, suele comenzar con letra mayúscula.

A diferencia de otros lenguajes de programación, no hace falta indicar los campos públicos ya que se inicializan a través del [constructor]{.verbatim}, que es un método especial que se ejecuta automáticamente cuando se crea un nuevo objeto. **Cada clase únicamente puede tener un constructor**.

::: warnbox
Cada clase únicamente puede tener un constructor.
:::


:::::::::::::: {.columns }
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[Nueva clase]{.title}
```javascript
class Alumno {
  constructor(nombre, edad) {
    this.nombre = nombre;
    this.edad = edad;
  }
  saludar() {
    console.log(`Hola ${this.nombre}`);
  }
}
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[Crear objetos]{.title}
```javascript
const alumno1 = new Alumno("Alice",20);

const alumno2 = new Alumno("Bob",25);

alumno1.saludar();

alumno2.saludar();
```
:::

:::
::::::::::::::


Tal como se puede ver, se ha creado también un método [saludar]{.verbatim} que se puede llamar después de crear un objeto de la clase.

## Encapsulación {#clases-encapsulación}

Uno de los principios fundamentales de la Programación Orientada a Objetos es la **encapsulación**, que consiste en proteger el estado interno de un objeto y controlar la forma en que puede accederse a él.

En lugar de permitir que cualquier parte del programa modifique libremente los datos, el propio objeto decide cómo deben utilizarse.


:::::::::::::: {.columns }
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[Nueva clase]{.title}
```javascript
class Cuenta {
    constructor(saldo) {
        this.saldo = saldo;
    }
    setSaldo(saldo){
        this.saldo = saldo;
    }
}
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[Crear objetos]{.title}
```javascript
const cuenta = new Cuenta(1000);
// nada impide hacer
cuenta.saldo = -5000;
// debería ser
cuenta.setSaldo(1500);
```
:::

:::
::::::::::::::

Desde el punto de vista de la programación, acceder a un campo y modificarlo es posible, pero puede afectar al comportamiento del mismo. Es por eso que para evitar problemas deberíamos hacer uso de la encapsulación y crear métodos que modifiquen las propiedades.

::: exercisebox
[[14a](https://github.com/yuki/ejercicios/blob/main/daw/dec/14a.html)]{.solution}

Crea una clase con al menos dos atributos y un método.
:::


## Campos y métodos privados {#campos-privados}

Aunque pueda parecer extraño, JavaScript incorporó los elementos y métodos privados en julio del 2021. Para declarar propiedades y métodos privados se hace usando el símbolo [#]{.verbatim}.

Una propiedad y un método privado sólo se podrá acceder desde la propia clase, tal como sucede en otros lenguajes que cuentan con programación orientada a objetos.

:::::::::::::: {.columns }
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[Nueva clase]{.title}
```javascript
class Cuenta {
    #saldo;
    constructor(saldo) {
        this.#saldo = saldo;
    }
    #privado() {
        console.log("Priv");
    }
    getSaldo() {
        this.#privado();
        return this.#saldo;
    }
}
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[Crear objetos]{.title}
```javascript
const cuenta = new Cuenta(1000);
// obtener dato
console.log(cuenta.getSaldo());

//esto dará error
console.log(cuenta.#privado());
//esto dará error
console.log(cuenta.#saldo);
```
:::

:::
::::::::::::::

Tal como se puede ver, para obtener acceso a la propiedad privada debemos hacer uso de un método creado a tal efecto [getSaldo()]{.verbatim}, **que es público**. Lo mismo si queremos modificar la propiedad, se debe hacer a través de un método.

Es importante matizar que **en navegadores Chrome desde la consola de desarrollador es posible acceder al método privado**, por lo que no dará error.

::: errorbox
En navegadores Chrome desde la consola de desarrollador es posible acceder al método privado.
:::

![Consola de desarrollador en Chrome a la izquierda y Firefox a la derecha](img/dec/clase-privada-chrome.png){width=100% framed=true}


::: exercisebox
[[14b](https://github.com/yuki/ejercicios/blob/main/daw/dec/14b.html)]{.solution}

Crea una clase con un atributo y un método privado.
:::


## Getters y setters {#getters-setters}

Aunque anteriormente hemos visto cómo acceder a una propiedad, hemos utilizado el estilo clásico de otros lenguajes como Java. En cambio, JavaScript incorpora una sintaxis especial denominada ***getter*** y ***setter***.

Un ***getter*** permite consultar una propiedad como si fuese un atributo, mientras que el ***setter*** permite modificar una propiedad.


:::::::::::::: {.columns }
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[Setter y getter]{.title}
```javascript
class Cuenta {

    #saldo;

    constructor(saldo) {
        this.#saldo = saldo;
    }

    get saldo() {
        return this.#saldo;
    }
    set saldo(valor) {
        if (valor >= 0) {
            this.#saldo = valor;
        }
    }
}
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[Cómo se usa]{.title}
```javascript
console.log(cuenta.saldo);
cuenta.saldo = 500;
console.log(cuenta.saldo);
```
:::

:::
::::::::::::::

::: exercisebox
[[14c](https://github.com/yuki/ejercicios/blob/main/daw/dec/14c.html)]{.solution}

Coge una clase de los ejercicios anteriores y modifica para usar *getters* y *setters*.
:::


# Herencia {#herencia}

La herencia consiste en crear una nueva clase a partir de otra ya existente. La nueva clase hereda las propiedades y métodos de la clase original. En JavaScript se utiliza la palabra reservada [extends]{.verbatim} para realizar la herencia.

Cuando una clase hija define su propio constructor, debe llamar al constructor de la clase padre mediante [super()]{.verbatim}. Por supuesto, esta nueva clase puede contar con nuevos atributos y métodos que hagan nuevas funciones.


:::::::::::::: {.columns }
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[Setter y getter]{.title}
```javascript
class Persona {

  constructor(nombre, edad) {
    this.nombre = nombre;
    this.edad = edad;
  }
  saludar() {
    console.log(`Hola, 
    soy ${this.nombre}`);
  }
}
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[Crear objetos]{.title}
```javascript
class Alumno extends Persona {

    constructor(nombre, edad, curso) {
        super(nombre, edad);
        this.curso = curso;
    }
}
const alumno = new Alumno(
    "Ana",20,"2º DAW"
);

alumno.saludar();
```
:::

:::
::::::::::::::


::: exercisebox
[[14d](https://github.com/yuki/ejercicios/blob/main/daw/dec/14d.html)]{.solution}

Crea una clase, otra que herede de la primera y que tenga un atributo y un método nuevo.
:::



# Polimorfismo {#polimorfismo}

La palabra **polimorfismo** significa literalmente **muchas formas**. En Programación Orientada a Objetos indica que distintos objetos pueden responder de forma diferente al mismo método.

Teniendo en cuenta la clase "**Persona**" del ejemplo anterior, a continuación se han creado dos nuevas clases que heredan de ella y que sobrescriben el método [saludar()]{.verbatim}.


:::::::::::::: {.columns }
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[Setter y getter]{.title}
```javascript
class Alumno extends Persona {

    saludar() {
        super.saludar();
        console.log("Soy alumno.");
    }
}
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[Crear objetos]{.title}
```javascript
class Profesor extends Persona {

    saludar() {
        super.saludar();
        console.log("Soy profesor.");
    }
}
```
:::

:::
::::::::::::::

Nótese que para llamar al método de la clase padre se ha usado [super.saludar()]{.verbatim}, que hace referencia al método que necesitamos del padre.

::: exercisebox
[[14e](https://github.com/yuki/ejercicios/blob/main/daw/dec/14e.html)]{.solution}

Partiendo del ejemplo anterior, haz una instancia de cada clase que llame a su método [saludar()]{.verbatim}.
:::


# Propiedades y métodos estáticos {#propiedades-métodos-estáticos}


Un método estático se declara mediante la palabra reservada [static]{.verbatim} y no requieren crear un objeto para ser usados. Es más, si se crea un objeto se accede a dicho método **dará error**.

::: mycode
[Propiedad y método estático]{.title}
```javascript
class Calculadora {
    static VERSION = "1.0";

    static sumar(a, b) {
        return a + b;
    }
}

const resultado = Calculadora.sumar(5, 8);
```
:::

En principio no vamos a hacer uso de este sistema, pero es importante conocerlo ya que JavaScript cuenta con distintas clases que podemos utilizar que funcionan así, como [Math](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math), 

