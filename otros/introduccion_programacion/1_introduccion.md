
# ¿Qué es programar? {#programar}

Programar es **dar instrucciones a un ordenador** para que realice una tarea. Esto se realiza escribiendo el **código fuente** con las instrucciones que queremos dar. Esto termina en la creación de una aplicación informática (programa, página web, videojuego, ...).

Programar se suele comparar con crear una receta de cocina en la que se deben indicar todos los pasos a realizar (programa) que posteriormente se interpreta por otro cocinero (el ordenador). Cualquier instrucción que no se especifique de manera correcta, hará que la receta final (el programa realizado) no funcione. 

[[Exact Instructions Challenge](https://www.youtube.com/watch?v=FN2RM-CHkuI&ab_channel=JoshDarnit)]{.movie} es un ejemplo de la comparativa realizada.


::: infobox
Programar es como escribir una receta de cocina. Se deben describir todos los pasos e ingredientes a usar.
:::

## ¿Para qué sirve programar? {#para-que-sirve-programar}

La programación sirve para automatizar tareas, crear juegos, hacer aplicaciones, controlar robots y mucho más. Casi todo lo que usamos hoy en día tiene programación por dentro: los móviles, los coches, las lavadoras, las páginas web, etc.

Dependiendo de la aplicación que vayamos a realizar, deberemos usar un lenguaje de programación u otro.


# Lenguajes de programación {#lenguajes-programación}

Los ordenadores no entienden directamente nuestro idioma. Para hablar con ellos, usamos **lenguajes de programación**, que son formas especiales de escribir instrucciones que el ordenador puede entender y ejecutar.

Hay muchos lenguajes, y cada uno tiene sus características. Algunos son más fáciles de aprender, otros son más rápidos o más potentes para ciertas tareas. Algunos ejemplos de lenguajes de programación conocidos:

- **Python** : muy sencillo, ideal para empezar. Se usa en ciencia, robótica, inteligencia artificial...
- **C o C++**: muy rápido, se usa en videojuegos, sistemas operativos, robots.
- **Java** : muy usado en empresas, aplicaciones móviles (Android), sistemas grandes.
- **JavaScript** : se usa para hacer páginas web interactivas. Se ejecuta en el navegador web (como Chrome o Firefox).
- **PHP**: se usa para crear páginas webs.
- **Scratch o Edublocks**: se programa con bloques, muy visual y fácil para empezar.


## Componentes de un lenguaje de programación {#componentes-lenguaje-programación}

Al igual que los lenguajes que usamos en nuestro día a día, los lenguajes de programación también tienen reglas:


- **Alfabeto**: Conjunto de símbolos para formar las palabras utilizadas por el lenguaje. Normalmente son letras, dígitos, símbolos (+,-,:,(),[],...)
- **Léxico**: Las palabras que el lenguaje tiene reservadas para programar. Si alguna de las palabras del léxico se escribe mal, el programa no se podrá compilar/ejecutar.
  - if, else, for, while, ...
- **Sintaxis**: Son las reglas que tiene el lenguaje para asegurar que una cadena de palabras forman una oración válida. En lenguaje natural la diferencia sería:
  - "Yo conduzco un coche"
  - "Coche conduzco yo"
- **Semántica**: Determina que la frase tiene sentido (puede estar bien escrita, pero no tiene sentido). Las siguientes frases son un ejemplo en lenguaje natural:
  - "Yo conduzco un coche"
  - "Un coche me conduce"


## Tipos de lenguajes {#tipos-lenguajes-programación}

El ordenador solo entiende **código máquina** (unos y ceros, el código binario). Por eso, los programas escritos en lenguajes como Python o Java necesitan **traducirse** a un lenguaje que el ordenador pueda ejecutar.

Según **cómo se hace esa traducción**, los lenguajes se dividen en:

- Lenguajes **interpretados**
- Lenguajes **compilados**
- Lenguajes **híbridos**

::: exercisebox
Busca al menos 2 lenguajes de programación para cada tipo.
:::


Hay otro muchos criterios para diferenciar los lenguajes de programación. Estas diferenciaciones son más profundas, por lo que no vamos a entrar en ellas, pero en la siguiente tabla se pueden ver algunas de ellas.

| Criterios de diferenciación | Clasificación |   
|----------|------------|
| Según el nivel de abstracción | Lenguajes de bajo nivel. Lenguajes de alto nivel. |
| Según el paradigma de programación | Imperativos. Declarativos. Orientados a objetos. Orientados a objetos. Funcionales. Lógicos.
| Según su propósito | De propósito general. De propósito específico (por ejemplo, para bases de datos o web).
| Según la sintaxis | De sintaxis simple (como Python). De sintaxis estricta (como Java o C++) | 
| Según su tipado | Estático. Dinámico. Fuerte. Débil |
| Según la gestión de memoria | Con gestión manual (como C). Con recolector de basura (como Java o Python) |
| Según su orientación al hardware o al sistema | Lenguajes de sistema. Lenguajes de aplicación. |

Table: {tablename=yukitblr colspec=X[l]X[l]}


### Lenguajes interpretados {#lenguajes-interpretados}

Un lenguaje **interpretado** necesita un **intérprete**, que es un programa que lee tu código fuente línea por línea y lo ejecuta directamente. Entre los lenguajes interpretados más conocidos nos encontramos con:

- Python
- JavaScript
- Bash

Los pasos para programar con un lenguaje interpretado son:

1. Escribes el código (por ejemplo, en Python).
2. El intérprete lo lee y lo ejecuta paso a paso.
3. Si hay un error, se detiene en ese momento.

Dependiendo del lenguaje y su intérprete, el paso 2 y 3 pueden variar. En algunos casos el intérprete lee todo el código fuente y si hay algún error (en la escritura), no lo ejecuta y muestra el error antes de ejecutar ninguna instrucción.

Si llevas el código fuente a otro ordenador y no está instalado el intérprete 

| Ventajas | Desventajas|   
|----------|------------|
| Muy fáciles de probar. | Suelen ser **más lentos** que los compilados. |
| Ideales para aprender y hacer pruebas rápidas. |  |

Table: {tablename=yukitblr colspec=X[l]X[l]}


### Lenguajes compilados {#lenguajes-compilados}

Un lenguaje **compilado** necesita un **compilador**, que convierte todo el código fuente en un archivo ejecutable. El resultado de la compilación genera código máquina (binario) que es directamente interpretado por el sistema operativo y la CPU. Los lenguajes compilados más conocidos son:

- C
- C++
- Rust

Al programar con lenguajes compilados, los pasos son:

1. Escribes el código (por ejemplo, en C++).
2. Lo **compilas**, lo que hace que genere un archivo ejecutable (por ejemplo, [programa.exe]{.verbatim}).
3. Ese archivo ya puede ejecutarse sin necesidad del código fuente.

Los programas compilados se pueden llevar a otro ordenador y se puede ejecutar directamente, sin necesidad de tener en ese ordenador nada instalado.

| Ventajas | Desventajas|   
|----------|------------|
| Muy **rápido al ejecutarse**. | Si haces un cambio, tienes que compilar otra vez. |
| Ideal para programas grandes o que necesitan rendimiento. | Los errores aparecen todos de golpe al compilar. |

Table: {tablename=yukitblr colspec=X[l]X[l]}



### Lenguajes híbridos {#lenguajes-híbridos}

Los lenguajes **híbridos** combinan lo mejor de los dos mundos: primero **compilan** el código a un formato intermedio, y luego lo **interpretan o ejecutan con una máquina virtual**. Ejemplos de lenguajes híbridos:

- Java (usa la JVM)
- C# (usa .NET)
- Kotlin (usado sobre todo en Android)

Al programar en un lenguaje híbrido, los pasos son:

- Escribes el código (por ejemplo, en Java).
- Lo compilas a un formato intermedio (por ejemplo, *bytecode*). En el caso de Java, se compila con el llamado **JDK** (Java Development Kit).
- Ese bytecode se ejecuta en una **máquina virtual**, como la JVM (Java Virtual Machine).

En este caso, el intérprete debe estar instalado en el ordenador donde queramos ejecutar el programa

| Ventajas | Desventajas|   
|----------|------------|
| Buena velocidad. | Necesitas tener instalada la máquina virtual. |
| Portabilidad: el mismo programa funciona en distintos sistemas. | A veces, un poco más complejo de configurar. |

Table: {tablename=yukitblr colspec=X[l]X[l]}



#  Pensamiento lógico y resolución de problemas {#pensamiento-lógico}

Antes de escribir el código fuente de un programa, es importante aprender a **pensar como un programador**. La programación no trata solo de escribir instrucciones, sino de **resolver problemas paso a paso**.

Programar es como resolver un puzzle. Necesitas analizar el problema, pensar cómo dividirlo en partes pequeñas y resolver cada una de las partes con instrucciones claras.


:::warnbox
Antes de programar tenemos que entender qué problema queremos solucionar y pensar cómo lo vamos a solucionar.
:::

Por ejemplo, si queremos hacer un programa que tenga en cuenta si una persona puede entrar en una discoteca y sólo pueden entrar los mayores de 18 años. La lógica del programa sería:

1. Preguntar la edad de la persona.
2. Comprobar si la edad es mayor o igual que 18 ([edad>=18]{.verbatim}).
3. Si es mayor o igual → dejar entrar.
4. Si es menor → no dejar entrar.

Después de pensar el plan, es momento de escribir el código fuente del programa. Cada punto anterior, al escribir el código fuente, pueden ser una o más instrucciones


# Errores al programar {#errores-al-programar}

Cuando se programa, es normal que las cosas no funcionen a la primera. Hay tres tipos de errores muy comunes:

- **Errores de sintaxis**: El código tiene una "falta de ortografía". Por ejemplo, olvidarse de un paréntesis o escribir mal una palabra clave.
- **Errores de lógica**: El código se ejecuta, pero **no hace lo que tú querías**. Por ejemplo, poner el signo [>]{.verbatim} en lugar de [<]{.verbatim}.
- **Errores de ejecución**: El programa se bloquea mientras está funcionando. Se ha escrito una instrucción que hace que el programa "se rompa": dividir entre cero o leer una variable que no existe.

