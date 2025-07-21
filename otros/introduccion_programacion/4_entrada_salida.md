
# Salida de datos con print() {#salida-datos-print}

Aunque ya hemos visto previamente un ejemplo de cómo mostrar datos, vamos a explicar mejor cómo funciona.

::::::::::::::: {.columns }
:::: {.column width="48%"}
![](img/introduccion_programacion/edublocks_print_1.png){width="70%"}
::::
:::: {.column width="48%"}

::: mycode
[Código fuente en Python]{.title}

```python
#Start code here
print("Hola")
print(123)
```
:::

::::
:::::::::::::::

En el código vemos que usamos **print**, que es una función interna del lenguaje, al que le pasamos un parámetro. Ese parámetro puede ser un texto u otro tipo de datos.

También podemos pasarle como parámetro el valor de una variable:

::::::::::::::: {.columns }
:::: {.column width="58%"}
![](img/introduccion_programacion/edublocks_print_2.png){width="70%"}
::::
:::: {.column width="38%"}

::: mycode
[Código fuente en Python]{.title}

```python
#Start code here
nombre_usuario = "Ruben"
print(nombre_usuario)
```
:::

::::
:::::::::::::::

Edublocks nos impide usar variables que no existen, pero si intentamos imprimir una variable que no existe, obtendremos un error como el siguiente:

::::::::::::::: {.columns }
:::: {.column width="38%"}

::: mycode
[Código fuente con error]{.title}

```python
#Start code here
nombre_usuario = "Ruben"
print(nombre)
```
:::

::::
:::: {.column width="58%"}

::: mycode
[Error al ejecutar]{.title}

```python
NameError: name 'nombre' is not defined
```
:::

::::
:::::::::::::::

::: errorbox
Si intentamos usar una variable que no existe, tendremos un error al ejecutar nuestro código.
:::


## Concatenar datos con print {#concatenar-datos}

**Print** es una función que permite que pasemos más de un parámetro, para poder sacar por pantalla más datos con la misma instrucción. En el grupo de bloques "**Text**" tenemos un bloque para poder añadir más textos al *print*.

::::::::::::::: {.columns }
:::: {.column width="58%"}
![](img/introduccion_programacion/edublocks_print_3.png){width="70%"}
::::
:::: {.column width="38%"}

::: {.mycode size="footnotesize"}
[Código fuente en Python]{.title}

```python
#Start code here
nombre_usuario = "Ruben"
print("Hola", nombre_usuario)
```
:::

::::
:::::::::::::::


Como alternativa, también podemos **formatear la salida** de una manera [más sofisticada](https://docs.python.org/3/tutorial/inputoutput.html#fancier-output-formatting), pudiendo hacer que quede mejor. Para ello se hace uso de la función **f**.

::::::::::::::: {.columns }
:::: {.column width="58%"}
![](img/introduccion_programacion/edublocks_print_4.png){width="70%"}
::::
:::: {.column width="38%"}

::: {.mycode size="footnotesize"}
[Código fuente en Python]{.title}

```python
#Start code here
nombre_usuario = "Ruben"
print(f"Hola {nombre_usuario}")
```
:::

::::
:::::::::::::::


## Parámetros especiales "sep", "end"

**Print** tiene dos parámetros especiales que tienen un valor por defecto que podemos modificar. Estos parámetros son:

- **sep**: especifica el separador que se usa para concatenar el resto de parámetros. Por defecto es un espacio " ".
- **end**: especifica cómo se termina el string. Por defecto es un salto de línea, cuyo valor en programación suele ser "**\\n**".

Un par de ejemplos de cómo se pueden usar estos parámetros:

![](img/introduccion_programacion/edublocks_print_5.png){width="70%"}


::: mycode
[Código fuente en Python]{.title}

```python
#Start code here
nombre_usuario = "Ruben"
print("Hola", nombre_usuario, sep="_", end="!")
print(1)
print("Te llamas", nombre_usuario, sep=":", end="?")
print(1)
```
:::


::::::::::::::: {.columns }
:::: {.column width="48%"}
La salida debería ser como la imagen de la derecha. Se han añadido los "print(1)" para ver cómo afecta el parámetro "*end*" al cambiarlo y su valor por defecto. Aparte, si no se ponen, Edublock tiene un fallo y no muestra el resultado.
::::
:::: {.column width="48%"}

![](img/introduccion_programacion/edublocks_print_5_output.png){width="70%"}

::::
:::::::::::::::



# Entrada de datos con input() {#entrada-datos-input}

La gran mayoría de los programas necesitan *input* de los usuarios. En este caso vamos a pedir al usuario que escriba su nombre, y luego lo vamos a saludar. El valor que escriba el usuario **debe guardarse en una variable**.

Los pasos a dar son:

1. Crear una variable.
2. Coge el bloque para asignar valor a la variable
3. Vete a la sección **Statements** y coge el bloque **Input**. Ponlo dentro del bloque anterior y que el texto que sea: "¿Cómo te llamas?". Esto nos va a pedir el valor al usuario.
4. Imprime por pantalla un texto que diga "Hola " con el valor del dato obtenido.


Deberíamos tener en Edublocks lo siguiente:

![Código de bloques](img/introduccion_programacion/edublocks_program_2.png){width="70%"}


::: mycode
[Código fuente en Python]{.title}

```python
#Start code here
nombre_usuario = input("¿Cómo te llamas? ")
print(f"Hola {nombre_usuario}")
```
:::


Y el resultado, tras usar el programa, es:

![](img/introduccion_programacion/edublocks_program_2_output.png){width="50%" framed=true}


Es importante entender que **el input obtenido siempre va a ser de tipo "*string*"** con lo introducido por el usuario. Da igual que el texto sólo sean números. A continuación veremos cómo convertir datos entre distintos tipos.

