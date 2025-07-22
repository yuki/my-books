
# Estructuras de control

Las **estructuras de control** son fundamentales en programación, por lo que todos los lenguajes de programación las tienen, aunque pueden variar en las palabras utilizadas. Estas estructuras nos permiten que el programa **tome decisiones** o **repita acciones** de forma automática, según ciertas condiciones. Gracias a ellas, podemos crear programas más inteligentes y útiles.

En Python, las estructuras de control más importantes son:

- **Condicionales**
- **Bucles**

Es importante entender que las estructuras de control van a formar bloques de código que pueden ejecutarse, o no. Estos "bloques" se van a diferenciar porque va a usar **sangría** dentro de la estructura. Más adelante vamos a verlo mejor en los ejemplos.

::: errorbox
La sangría en el código Python es muy importante.
:::


## Condicionales

Las estructuras condicionales permiten que el programa **elija entre distintas opciones** según si una condición es verdadera o falsa. Teniendo en cuenta la condición, se ejecutará una parte de código u otra.

### Condicional "if"

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

Es muy importante ver que el código dentro del [if]{.verbatim} está **sangrado a la derecha** con dos espacios. Esto significa que todo el código que esté a esa altura pertenece al bloque del [if]{.verbatim}.

A continuación analiza los siguiente ejemplos y comprueba cómo es la **sangría** del código:

::::::::::::::: {.columns }
:::: {.column width="30%"}

::: {.mycode size=scriptsize}
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

::: {.mycode size=scriptsize}
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

::: {.mycode size=scriptsize}
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


Todas las líneas dentro del bloque **deben tener la misma sangría**. De no ser así, al ejecutar el código tendremos un error ["IndentationError: unexpected indent"]{.verbatim} o el código se ejecutará donde no queremos.

::: errorbox
La sangraía en el código Python es muy importante.
:::


### Condicional "if else"

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

Tal como se puede ver, al utilizar una infraestructura "[if-else]{.verbatim}" siempre va a haber una parte del código que se va a ejecutar

Vamos a usar un código similar al anterior como ejemplo:

::: exercisebox
Analiza el código y trata de entenderlo antes de leer la explicación posterior.
:::

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



## Bucles: while, for