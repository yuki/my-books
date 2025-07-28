
# Programa discoteca {#programa-discoteca}

1. Pedir DNI a la persona.
2. Comprobar si la edad es mayor o igual que 18 ([edad>=18]{.verbatim}).
3. Si es mayor o igual → dejar entrar.
4. Si es menor → no dejar entrar y apartar de la cola.
5. Dejar que avance la siguiente persona.
6. Ir a la instrucción 1.


# Programa con inputs {#programa-inputs}

![](img/introduccion_programacion/edublocks/ejercicios/edublocks_ejercicio_inputs.png){width="90%"}

::: mycode
[Código fuente en Python]{.title}

```python
#Start code here
nombre = input("¿Cómo te llamas?")
edad = input("¿Cuántos años tienes?")
ciudad = input("¿Dónde vives?")
print("Hola", nombre, "tienes", edad, "años y vives en", ciudad)
print(f"Hola {nombre} tienes {edad} años y vives en {ciudad}")
```
:::


# Ejercicio aritméticos {#ejercicio-area}

Escribe un programa que calcule el área de un rectángulo (base x altura) usando dos variables. Los datos se los tienes que pedir al usuario.

Recuerda usar [la conversión de tipos de datos](tabla-conversion).


![](img/introduccion_programacion/edublocks/ejercicios/edublocks_ejercicio_area.png){width="90%"}


::: {.mycode size=scriptsize}
[Código fuente en Python]{.title}

```python
#Start code here
base = float(input("Introduce la base "))
altura = float(input("Introduce la altura "))
print("El área es", base * altura)
```
:::


## Ejercicios de operadores lógicos {#ejercicios-logicos}

¿Qué valor devuelven las siguientes expresiones? (piénsalas primero y luego compruébalo en Python):

 - [3 == "3"]{.verbatim}
 - [4 <= 4.0]{.verbatim}
 - ["hola" != "Hola"]{.verbatim}


::::::::::::::: {.columns }
:::: {.column width="54%"}
![](img/introduccion_programacion/edublocks/ejercicios/edublocks_ejercicio_logicos.png){width="100%"}
::::
:::: {.column width="44%"}

::: {.mycode size=scriptsize}
[Código fuente en Python]{.title}

```python
#Start code here
print(3 == "3")
print(4 < 4.0)
print("hola" != "Hola")
```
:::

::::
:::::::::::::::


## Ejercicios de operadores lógicos combinados {#ejercicios-logicos-combinados}

¿Qué valor devuelven las siguientes expresiones? (piénsalas primero y luego compruébalo en Python):

- [True == True and False == True]{.verbatim}
- [5 > 3 and 4 < 2]{.verbatim}
- [5 > 3 or 4 < 2]{.verbatim}
- [not (7 <= 7)]{.verbatim}
- [not (0)]{.verbatim}

::::::::::::::: {.columns }
:::: {.column width="55%"}
![](img/introduccion_programacion/edublocks/ejercicios/edublocks_ejercicio_logicos_combinados.png){width="100%"}
::::
:::: {.column width="44%"}

::: {.mycode size=scriptsize}
[Código fuente en Python]{.title}

```python
#Start code here
print(True == True and False == True)
print(5 > 3 and 4 < 2)
print(5 > 3 or 4 < 2)
print(not 7 <= 7)
print(not 0)
```
:::

::::
:::::::::::::::



# Ejercicios de condicionales {#ejercicios-condicionales}

## Ejercicio de notas {#ejercicio-notas}

Escribe un programa que pida una nota del 0 al 10 y diga si es:

- "Suspenso" (< 5)
- "Aprobado" (5 a 6.9)
- "Notable" (7 a 8.9)
- "Sobresaliente" (9 a 10)

Solución con "else anidados" y "elif":

::::::::::::::: {.columns }
:::: {.column width="45%"}
![](img/introduccion_programacion/edublocks/ejercicios/edublocks_ejercicio_notas.png){width="90%"}
::::
:::: {.column width="45%"}
![](img/introduccion_programacion/edublocks/ejercicios/edublocks_ejercicio_notas-elif.png){width="100%"}
::::
:::::::::::::::


::::::::::::::: {.columns }
:::: {.column width="45%"}

::: {.mycode size=scriptsize}
[Código fuente en Python]{.title}

```python
#Start code here
print("¿Qué nota has sacado?")
nota = float(input(""))
if nota <= 5:
  print("Suspenso")
else:
  if nota <= 6.9:
    print("Aprobado")
  else:
    if nota <= 8.9:
      print("Notable")
    else:
      print("Sobresaliente")
```
:::

::::
:::: {.column width="45%"}

::: {.mycode size=scriptsize}
[Código fuente en Python]{.title}

```python
#Start code here
print("¿Qué nota has sacado?")
nota = float(input(""))
if nota <= 5:
  print("Suspenso")
elif nota <= 6.9:
  print("Aprobado")
elif nota <= 8.9:
  print("Notable")
else:
  print("Sobresaliente")
```
:::

::::
:::::::::::::::


## Ejercicio "else anidado" {#ejercicio-else-anidado}

Amplía el código del ejemplo [if-else](#ejemplo-if-else) para que cuando entre en el [else]{.verbatim} se compruebe:

- si es mayor de 13: que escriba: "Eres adolescente"
- si no, pero es mayor a 6: escriba: "¿En qué curso estás?"
- si no: escriba: "¿Sabes montar en bici?"


::::::::::::::: {.columns }
:::: {.column width="43%"}
![](img/introduccion_programacion/edublocks/ejercicios/edublocks_ejercicio_if_else.png){width="97%"}
::::
:::: {.column width="55%"}

::: mycode
[Código fuente en Python]{.title}

```python
#Start code here
edad = 6
print("Hola")
if edad >= 18:
  print("Eres mayor de edad")
else:
  if edad >= 13:
    print("Eres adolescente")
  else:
    if edad >= 6:
      print("¿En qué curso estás?")
    else:
      print("¿Sabes montar en bici?")
print("Adios")
```
:::

::::
:::::::::::::::


# Ejercicios de bucles {#ejercicios-bucles}

## Bucle inverso {#ejercicio-bucle-inverso}

Haz un programa que pida un número al usuario, e imprima todos los números en orden inverso hasta llegar a 0.

::::::::::::::: {.columns }
:::: {.column width="55%"}
![](img/introduccion_programacion/edublocks/ejercicios/edublocks_ejercicio_bucle_inverso.png){width="90%"}
::::
:::: {.column width="44%"}

::: mycode
[Código fuente en Python]{.title}

```python
#Start code here
print("Introduce un número")
numero = int(input(""))
while numero >= 0:
  print(numero)
  numero = numero - 1
```
:::

::::
:::::::::::::::

## Contador {#ejercicio-contador}

Haz un programa que sume todos los números del 1 al 100.


::::::::::::::: {.columns }
:::: {.column width="55%"}
![](img/introduccion_programacion/edublocks/ejercicios/edublocks_ejercicio_bucle_contador.png){width="90%"}
::::
:::: {.column width="44%"}

::: mycode
[Código fuente en Python]{.title}

```python
#Start code here
numero = 100
contador = 0
total = 0
while contador <= numero:
  total = total + contador
  print(contador, "-", total)
  contador = contador + 1
print("Total", total)
```
:::

::::
:::::::::::::::


## Bucle for {#ejercicio-bucle-for}

Crea un bucle [for]{.verbatim} desde 0 hasta 400 usando pasos de 5.

::::::::::::::: {.columns }
:::: {.column width="55%"}
![](img/introduccion_programacion/edublocks/ejercicios/edublocks_ejercicio_bucle_for.png){width="95%"}
::::
:::: {.column width="44%"}

::: mycode
[Código fuente en Python]{.title}

```python
#Start code here
for i in range(0, 400, 5):
  print(i)
```
:::

::::
:::::::::::::::

## Tabla de multiplicar {#tabla-multiplicar}

Haz un programa que pida un número al usuario, e imprima su tabla de multiplicar hasta el 10 (si el número introducido es mayor a 10, la tabla será hasta el mismo número).

![](img/introduccion_programacion/edublocks/ejercicios/edublocks_ejercicio_bucle_tabla_multiplicar.png){width="100%"}

::: mycode
[Código fuente en Python]{.title}

```python
#Start code here
print("Introduce un número")
numero = int(input(""))
maximo = 10
if numero > maximo:
  maximo = numero
for i in range(maximo + 1):
  print(f"{numero}x{i}={numero * i}")
```
:::

## Instrucciones break y continue {#ejercicio-break}

Haz un programa que imprima del 1 al 30, **pero**:

- Salte los números 7 y 15 sin imprimirlos.
- Pare el bucle si llega al número 23.

::::::::::::::: {.columns }
:::: {.column width="57%"}
![](img/introduccion_programacion/edublocks/ejercicios/edublocks_ejercicio_break.png){width="100%"}
::::
:::: {.column width="40%"}

::: mycode
[Código fuente en Python]{.title}

```python
#Start code here
for i in range(1, 30):
  if i == 23:
    break # your code
  if i == 7 or i == 15:
    continue # your code
  print(i)
```
:::

::::
:::::::::::::::


