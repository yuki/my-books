
# Estructuras de control {#estructuras-control}

Las **estructuras de control** son fundamentales en programación, por lo que todos los lenguajes de programación las tienen, aunque pueden variar en las palabras utilizadas. Estas estructuras nos permiten que el programa **tome decisiones** o **repita acciones** de forma automática, según ciertas condiciones. Gracias a ellas, podemos crear programas más inteligentes y útiles.

En Python, las estructuras de control más importantes son:

- **Condicionales**
- **Bucles**

Es importante entender que las estructuras de control van a formar bloques de código que pueden ejecutarse, o no. Estos "bloques" se van a diferenciar porque va a usar **sangría** dentro de la estructura. Más adelante vamos a verlo mejor en los ejemplos.

::: errorbox
La sangría en el código Python es muy importante.
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
  - Si la condición se cumple, se pasa a ejecutar el "código A".
  - Si la condición no se cumple, pasa al siguiente código.
- El "código 2" siempre se va ejecutar.

::::
:::: {.column width="53%"}

![](img/introduccion_programacion/flujo_if.svg){width="70%"}

::::
:::::::::::::::



Para verlo en código con Edublocks, y su correspondencia en Python, tenemos el siguiente ejemplo:

::::::::::::::: {.columns }
:::: {.column width="48%"}
![](img/introduccion_programacion/edublocks_flujo_if.png){width="70%"}
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
- **[edad >= 18]{.verbatim}**: es la condición que se analiza, teniendo en cuenta 
- **[:]{.verbatim}**: **la condición siempre termina con los dos puntos [:]{.verbatim}**

Es muy importante ver que el código dentro del [if]{.verbatim} está **sangrado a la derecha** con espacios. Esto significa que todo el código que esté a esa altura pertenece al bloque del [if]{.verbatim}.

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


::::::::::::::: {.columns }
:::: {.column width="48%"}
![](img/introduccion_programacion/edublocks_flujo_if_anidado.png){width="70%"}
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



Tal como se ha dicho anteriormente, la sangría en el código es muy importante. Cuando queremos anidar una nueva estructura de control dentro de otra hay que continuar la sangría, ponerlo al nivel correspondiente, ya que eso determina dónde se va a ejecutar.



### Condicional "if else" {#condicional-if-else}

La palabra reservada [else]{.verbatim} se utiliza para indicar el código que se va a ejecutar **cuando la condición del [if]{.verbatim} no se cumple**. El diagrama de flujo sería el siguiente:


::::::::::::::: {.columns }
:::: {.column width="45%"}

Vamos a entender qué sucede:

- El "código 1" se va a ejecutar siempre en nuestro programa.
- Se llega al condicional [if]{.verbatim}, y se analiza la condición:
  - Si la condición se cumple, se pasa a ejecutar el "código A".
  - Si la condición no se cumple, se pasa a ejecutar el "código B".
- El "código 2" siempre se va ejecutar.

::::
:::: {.column width="53%"}

![](img/introduccion_programacion/flujo_if_else.svg){width="90%"}

::::
:::::::::::::::

Tal como se puede ver, al utilizar una infraestructura "[if-else]{.verbatim}" siempre va a haber una parte del código que se va a ejecutar.
Vamos a usar el siguiente código como [ejemplo]{#ejemplo-if-else}: 

::::::::::::::: {.columns }
:::: {.column width="48%"}
![](img/introduccion_programacion/edublocks_flujo_if_else.png){width="70%"}
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

1. Se crea una variable, con el tipo de datos **int**, con un valor de 17.
2. Se imprime por pantalla "Hola".
3. Se analiza la condición [edad >= 18]{.verbatim}. ¿Es esta condición [True]{.verbatim}? No, **por lo tanto se salta al bloque else** y se imprime el código que está dentro del bloque [else]{.verbatim}: "Eres menor de edad".
4. Se imprime por pantalla "Adios".

::: exercisebox
[Solución](#ejercicio-else-anidado). Amplía el ejemplo anterior para que cuando entre en el [else]{.verbatim} se compruebe:

- si es mayor de 13: que escriba: "Eres adolescente"
- si no, pero es mayor a 6: escriba: "¿En qué curso estás?"
- si no: escriba: "¿Sabes montar en bici?"
:::



### Condicional "elif" {#condicional-elif}

**[elif]{.verbatim}** se puede resumir en que es la unión de un [else]{.verbatim} y un [if]{.verbatim}, sin tener que hacer un bloque dentro del [else]{.verbatim}. Sirve para evaluar cuando hay más de una condición, y dejará de evaluar las opciones cuando se encuentre con la primera condición que es verdadera.



::::::::::::::: {.columns }
:::: {.column width="48%"}
![](img/introduccion_programacion/edublocks_flujo_if_elif.png){width="70%"}
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

La alternativa a este código, sería el siguiente, 



## Bucles {#bucles}



### while

### for

