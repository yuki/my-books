
# Estructuras de control {#estructuras-control}

Las **estructuras de control** son fundamentales en programación, por lo que todos los lenguajes de programación las tienen.

Estas estructuras nos permiten que el programa **tome decisiones** o **repita acciones** de forma automática, según ciertas condiciones. Gracias a ellas, podemos crear programas más inteligentes y útiles.

Las estructuras de control se pueden diferenciar por:

- **Condicionales**
- **Bucles**

Es importante entender que las estructuras de control van a formar bloques de código que pueden ejecutarse, o no. Estos "bloques" se van a diferenciar porque va a usar **sangría** dentro de la estructura. Más adelante vamos a verlo mejor en los ejemplos.

::: errorbox
La sangría en el código Python es muy importante.
:::

Otros lenguajes de programación pueden tener más estructuras aparte de las que vamos a ver, o con otras palabras registradas. Las que vamos a ver suelen ser común en la gran mayoría de lenguajes, **por lo que es muy importante entender cómo funcionan**.

::: warnbox
Las estructuras de control son fundamentales en programación. Es importante aprender a usarlas.
:::


## Condicionales {#condicionales}

Las estructuras condicionales permiten que el programa **elija entre distintas opciones** según si una condición es verdadera o falsa. Teniendo en cuenta la condición, se ejecutará una parte de código u otra.

### Condicional "if" {#condicional-if}

El condicional [if]{.verbatim} se usa para indicar que **si se cumple una condición se debe ejecutar un bloque de código**. El diagrama de flujo sería el siguiente:


::::::::::::::: {.columns }
:::: {.column width="45%"}

Vamos a entender qué sucede:

- El "código 1" se va a ejecutar siempre en nuestro programa.
- Se llega al condicional [if]{.verbatim}, que tiene forma de rombo, y se analiza la condición:
  - Si la condición se cumple: se ejecuta el bloque "código A".
  - Si la condición no se cumple, se salta el bloque y se sigue el flujo normal.
- El "código 2" siempre se va ejecutar.

::::
:::: {.column width="53%"}

![](img/introduccion_programacion/flujo_if.svg){width="70%"}

::::
:::::::::::::::



Para verlo en código con Edublocks, y su correspondencia en Python, tenemos el siguiente ejemplo:

::::::::::::::: {.columns }
:::: {.column width="48%"}
![](img/introduccion_programacion/edublocks/edublocks_flujo_if.png){width="70%"}
::::
:::: {.column width="48%"}

::: mycode
[Código fuente en Python]{.title}

```python
#Start code here
edad = 18
print("Hola")
if edad >= 18:
  print("Eres mayor de edad")
print("Adios")
```
:::

::::
:::::::::::::::

El bloque [if]{.verbatim} en Edublocks está dentro del grupo **Logic**. Vamos a entender qué hace el código:

1. Se crea una variable, con el tipo de datos **int**, con un valor de 20.
2. Se imprime por pantalla "Hola".
3. Se analiza la condición [edad >= 18]{.verbatim}. ¿Es esta condición [True]{.verbatim}? Sí, porque 20 es mayor a 18, por lo tanto se imprime el código que está dentro del bloque [if]{.verbatim}: "Eres mayor de edad".
   
   ::: warnbox
    Fíjate en la sangría del código después de la sentencia [if]{.verbatim}.
   :::

4. Se imprime por pantalla "Adios".

Vamos a analizar el código [if edad >= 18:]{.verbatim}, **porque es muy importante escribirlo bien**, ya que si no tendremos errores de léxico.


- **[if]{.verbatim}**: es la palabra clave de la estructura condicional.
- **[edad >= 18]{.verbatim}**: es la condición que se analiza.
- **[:]{.verbatim}**: **la condición siempre termina con los dos puntos [:]{.verbatim}**


Es muy importante ver que el bloque de código dentro del [if]{.verbatim} está **sangrado a la derecha** con espacios. Esto significa que todo el código que esté a esa altura pertenece al bloque dentro del [if]{.verbatim}.

Todas las líneas dentro del bloque **deben tener la misma sangría**. De no ser así, al ejecutar el código tendremos un error ["IndentationError: unexpected indent"]{.verbatim} o el código se ejecutará donde no queremos.


::: exercisebox
Analiza los siguiente ejemplos y comprueba cómo es la **sangría** del código. ¿Cuándo se ejecuta cada sentencia [print]{.verbatim}?
:::


::::::::::::::: {.columns }
:::: {.column width="30%"}

::: {.mycode size=small}
[Código correcto]{.title}

```python
#Start code here
edad = 18
print("Hola")
if edad >= 18:
  print("1")
  print("2")
  print("3")
print("Adios")
```
:::

::::

:::: {.column width="30%"}

::: {.mycode size=small}
[Mala sangría]{.title}

```python
#Start code here
edad = 18
print("Hola")
if edad >= 18:
  print("1")
   print("2")
 print("3")
print("Adios")
```
:::


::::
:::: {.column width="30%"}

::: {.mycode size=small}
[Código ¿correcto?]{.title}

```python
#Start code here
edad = 18
print("Hola")
if edad >= 18:
  print("1")
  print("2")
print("3")
print("Adios")
```
:::

::::
:::::::::::::::


::: errorbox
La sangría en el código Python es muy importante.
:::


#### Estructuras de control anidadas {#estructuras-anidadas}

Las estructuras de control se pueden anidar. Esto quiere decir que dentro del bloque de una estructura se pueden añadir otras estructuras nuevas (en este caso condicionales).


::: exercisebox
Analiza el siguiente ejemplo, comprueba cómo es la **sangría** del código. ¿Qué se imprime en pantalla? Y si...

- [edad = 17]{.verbatim} ?
- [edad = 67]{.verbatim} ?
:::

::::::::::::::: {.columns }
:::: {.column width="48%"}
![](img/introduccion_programacion/edublocks/edublocks_flujo_if_anidado.png){width="70%"}
::::
:::: {.column width="48%"}

::: mycode
[Código fuente en Python]{.title}

```python
#Start code here
edad = 20
print("Hola")
if edad >= 18:
  print("Eres mayor de edad")
  if edad >= 65:
    print("¿Estás jubilado?")
print("Adios")
```
:::

::::
:::::::::::::::


Cuando queremos anidar una nueva estructura de control dentro de otra hay que continuar la sangría, ya que eso determina dónde se va a ejecutar.


::: warnbox
¡RECUERDA! La sangría en el código Python es muy importante.
:::


### Condicional "if else" {#condicional-if-else}

La palabra reservada [else]{.verbatim} se utiliza para indicar el bloque de código que se va a ejecutar **cuando la condición del [if]{.verbatim} no se cumple**.

::: infobox
En un condicional "[if-else]{.verbatim}", uno de los dos bloques se va a ejecutar.
:::


El diagrama de flujo sería el siguiente::

::::::::::::::: {.columns }
:::: {.column width="45%"}


- El "código 1" se va a ejecutar siempre en nuestro programa.
- Se llega al condicional [if]{.verbatim}, y se analiza la condición:
  - Si la condición se cumple: se ejecuta el bloque "código A".
  - Si la condición no se cumple: se ejecuta el bloque del [else]{.verbatim} "código B".
- El "código 2" siempre se va ejecutar.

::::
:::: {.column width="53%"}

![](img/introduccion_programacion/flujo_if_else.svg){width="90%"}

::::
:::::::::::::::


Tal como se puede ver, al utilizar una infraestructura "[if-else]{.verbatim}" siempre va a haber un bloque de código que se va a ejecutar.
Vamos a usar el siguiente código como [ejemplo]{#ejemplo-if-else}: 

::::::::::::::: {.columns }
:::: {.column width="48%"}
![](img/introduccion_programacion/edublocks/edublocks_flujo_if_else.png){width="70%"}
::::
:::: {.column width="48%"}

::: mycode
[Código fuente en Python]{.title}

```python
#Start code here
edad = 17
print("Hola")
if edad >= 18:
  print("Eres mayor de edad")
else:
  print("Eres menor de edad")
print("Adios")
```
:::

::::
:::::::::::::::


El bloque [else]{.verbatim} en Edublocks también está dentro del grupo **Logic**. Vamos a entender qué hace el código:

1. Se crea una variable con un valor de 17, es de tipo de datos **int**.
2. Se imprime por pantalla "Hola".
3. [edad >= 18]{.verbatim}. ¿Es esta condición [True]{.verbatim}? No, **por lo tanto se salta al bloque else y se ejecuta su contenido**.
4. Se imprime por pantalla "Adios".

::: exercisebox
Añade en el [else]{.verbatim}, sin ver la [solución](#ejercicio-else-anidado):

- si es mayor de 13: que escriba: "Eres adolescente"
- si no, pero es mayor a 6: escriba: "¿En qué curso estás?"
- si no: escriba: "¿Sabes montar en bici?"
:::



### Condicional "elif" {#condicional-elif}

**[elif]{.verbatim}** se puede resumir en que es la unión de un [else]{.verbatim} y un [if]{.verbatim}, sin tener que hacer un bloque dentro del [else]{.verbatim}. Sirve para evaluar cuando hay más de una condición, y dejará de evaluar las opciones cuando se encuentre con la primera condición que es verdadera.



::::::::::::::: {.columns }
:::: {.column width="48%"}
![](img/introduccion_programacion/edublocks/edublocks_flujo_if_elif.png){width="70%"}
::::
:::: {.column width="50%"}

::: mycode
[Código fuente en Python]{.title}

```python
#Start code here
edad = 6
print("Hola")
if edad >= 18:
  print("Eres mayor de edad")
elif edad >= 13:
  print("Eres adolescente")
elif edad >= 6:
  print("¿En qué curso estás?")
else:
  print("¿Sabes montar en bici?")
print("Adios")
```
:::

::::
:::::::::::::::

En el ejemplo anterior se puede ver cómo se han añadido varias condiciones. Vamos a ver qué sucede cuando [edad = 6]{.verbatim}:

1. **[edad >= 18]{.verbatim}**: No, por lo tanto salta a la alternativa. Anteriormente sería un [else]{.verbatim}, pero en este código existe una nueva sentencia condicional.
2. **[edad >= 13]{.verbatim}**: No, por lo tanto saltamos.
3. **[edad >= 6]{.verbatim}**: ¡Sí! por lo tanto ejecutamos el bloque de código dentro de esta sentencia, y no se sigue analizando el resto de la "cascada" (el [else]{.verbatim}).

::: exercisebox
Compara este código con la [solución del ejercicio anterior](#ejercicio-else-anidado).
:::

### Ejercicio

Realiza el siguiente ejercicio. Existen varias [soluciones posibles](#ejercicio-notas), así que intenta hacer dos: utilizando estructuras anidadas, y por otra parte usando [elif]{.verbatim}.

::: exercisebox
Escribe un programa (sin mirar la [solución](#ejercicio-notas)) que pida una nota del 0 al 10 y diga si es:

- "Suspenso" (< 5)
- "Aprobado" (5 a 6.9)
- "Notable" (7 a 8.9)
- "Sobresaliente" (9 a 10)
:::


## Bucles {#bucles}

Un **bucle** es una estructura que permite **repetir un bloque de instrucciones varias veces**, de forma automática **mientras se cumpla una condición**. Python tiene dos tipos principales de bucles, llamados [while]{.verbatim} y [for]{.verbatim}.

Sirven para hacer tareas repetitivas sin tener que escribir el mismo código una y otra vez, ya que eso sería muy ineficiente. Por ejemplo, si queremos mostrar los números del 1 al 10, podemos usar un bucle en lugar de escribir 10 veces [print()]{.verbatim}. 

Al escribir un bucle hay que tener en cuenta que la condición en algún momento no se cumpla, porque si no estaríamos en lo que se llama **bucle infinito**.

::: errorbox
Hay que tener cuidado al escribir bucles para no hacer **bucles infinitos**.
:::


### Bucle "while" {#bucle-while}

Sirve para repetir un bloque de instrucciones mientras se cumpla una condición. Cuando la condición deja de cumplirse, el bucle se detiene y se continúa con el flujo normal del programa.

::::::::::::::: {.columns }
:::: {.column width="45%"}

Teniendo en cuenta el diagrama de flujo:

1. El "código 1" se va a ejecutar siempre en nuestro programa.
2. Se llega a la sentencia "while condición" y se analiza:
  - Si la condición se cumple: se ejecuta el "código A" y se vuelve al paso 2.
  - Si no se cumple: se salta el bloque del bucle.
3. Se ejecuta "código 2".


::::
:::: {.column width="53%"}

![](img/introduccion_programacion/bucle_while.svg){width="70%"}

::::
:::::::::::::::

Vamos a hacer un ejemplo que imprima los primeros 10 números. En Edublocks los bucles están en el grupo **Loops**.

::::::::::::::: {.columns }
:::: {.column width="55%"}
![](img/introduccion_programacion/edublocks/edublocks_bucle_while.png){width="90%"}
::::
:::: {.column width="44%"}

::: mycode
[Código fuente en Python]{.title}

```python
#Start code here
contador = 1
while contador <= 10:
  print(contador)
  contador = contador + 1
```
:::

::::
:::::::::::::::


::: exercisebox
Haz un programa (sin mirar la [solución](#ejercicio-bucle-inverso)) que pida un número al usuario, e imprima todos los números en orden inverso hasta llegar a 0.
:::

::: exercisebox
Haz un programa (sin mirar la [solución](#ejercicio-contador)) que sume todos los números del 1 al 100.
:::

### Bucle "for" {#bucle-for}

El bucle [for]{.verbatim} se utiliza para recorrer elementos de una secuencia: una lista ([list]{.verbatim}), un conjunto [set]{.verbatim}, una cadena de texto, un rango de números con [range()]{.verbatim}...

A continuación un ejemplo usando una lista:

![](img/introduccion_programacion/edublocks/edublocks_bucle_for.png){width="70%"}


::: mycode
[Código fuente en Python]{.title}

```python
#Start code here
personajes = ["Mario", "Zelda", "Lara Croft"]
for personaje in personajes:
  print(f"Me gustan las sagas de {personaje}")
```
:::

Otro ejemplo con la función [[range()]{.verbatim}](https://docs.python.org/3/library/functions.html#func-range). Esta función acepta distinta cantidad de parámetros:

- **[range(10)]{.verbatim}**: genera una lista **desde 0 hasta el número indicado menos uno** (no se incluye el número indicado).
- **[range(start,stop,step)]{.verbatim}**: genera una lista empezando por [start]{.verbatim} hasta el [stop]{.verbatim} menos uno, aumentando en pasos de [step]{.verbatim} (si no se pone, por defecto es 1).

::::::::::::::: {.columns }
:::: {.column width="48%"}
![](img/introduccion_programacion/edublocks/edublocks_bucle_for_range.png){width="90%"}
::::
:::: {.column width="50%"}

::: mycode
[Código fuente en Python]{.title}

```python
#Start code here
for i in range(10):
  print(f"El {i}")
print("Nuevo contador")
for i in range(-10, 10):
  print(f"El {i}")
```
:::

::::
:::::::::::::::


::: exercisebox
Crea un bucle [for]{.verbatim} desde 0 hasta 400 usando pasos de 5. [Solución](#ejercicio-bucle-for).
:::

::: exercisebox
Haz un programa (sin mirar la [solución](#tabla-multiplicar)) que pida un número al usuario, e imprima su tabla de multiplicar hasta el 10 (si el número introducido es mayor a 10, la tabla será hasta el mismo número).
:::


### Instrucciones útiles en los bucles {#bucles-instrucciones-utiles}

Existen unas instrucciones que podemos utilizar dentro de los bucles que pueden ser útiles:

- **[break]{.verbatim}**: Sirve para salir del bucle antes de que termine.
- **[continue]{.verbatim}**: Sirve para saltar a la siguiente iteración del bucle (sin ejecutar nada más en la iteración actual).

::: exercisebox
Haz un programa (sin mirar la [solución](#ejercicio-break)) que imprima del 1 al 30, **pero**:

- Salte los números 7, 15 y 23 sin imprimirlos.
- Pare el bucle si llega al número 27.
:::

