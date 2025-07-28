
# Qué son los operadores {#que-son-operadores}

En programación, los **operadores** son símbolos que se usan para hacer cálculos o comparar valores. En algunos casos sólo se van a poder utilizar con algunos tipos de datos concretos, y otros con cualquier tipo, por lo que hay que asegurar que se usan de manera correcta.

A continuación se van a explicar los distintos tipos de operadores existentes, y aunque se van a utilizar con números, es importante entender que lo **habitual es hacerlo con variables**.


# Operadores aritméticos {#operadores-aritméticos}

Sirven para hacer **operaciones matemáticas**, por lo que se utilizan con tipos de datos numéricos.

| Operador        | Nombre          | Ejemplo       | Resultado     |
|-----------------|-----------------|---------------|---------------|
| [+]{.verbatim}  | Suma            | [3 + 2]{.verbatim}  | [5]{.verbatim}   |
| [-]{.verbatim}  | Resta           | [7 - 4]{.verbatim}  | [3]{.verbatim}   |
| [*]{.verbatim}  | Multiplicación  | [5 * 2]{.verbatim}  | [10]{.verbatim}  |
| [/]{.verbatim}  | División        | [7 / 2]{.verbatim}  | [3.5]{.verbatim} |
| [//]{.verbatim} | División entera | [7 // 2]{.verbatim} | [3]{.verbatim}   |
| [%]{.verbatim}  | Módulo (resto)  | [7 % 2]{.verbatim}  | [1]{.verbatim}   |
| [**]{.verbatim} | Potencia        | [2 ** 3]{.verbatim} | [8]{.verbatim}   |

Table: {tablename=yukitblr colspec=XXXX}

Hay que tener en cuenta que:

- La división **[/]{.verbatim}** siempre da un número con decimales (**float**), aunque sea exacta.
- La división entera **[//]{.verbatim}** dará el resultado sin contar los decimales, y genera un **int**.
- El módulo **[%]{.verbatim}** dará el resto de la división, en tipo **int**.
- Si se combinan dos tipos de datos, el resultado usará el tipo de datos necesario para poder mostrar el resultado.

En Edublocks estas operaciones están en el apartado **Math**, y se puede seleccionar el operador a través de un desplegable:

![](img/introduccion_programacion/edublocks/edublocks_operators_arithmetic.png){width="60%"}


::: exercisebox
Escribe un programa que calcule el área de un rectángulo (base x altura) usando dos variables (sin mirar la [solución](#ejercicio-area)). Los datos se los tienes que pedir al usuario. Recuerda [la conversión de tipos de datos](tabla-conversion).
:::


# Operadores lógicos {#operadores-logicos}

Se usan para **comparar valores** y obtener un resultado lógico: **verdadero** (**[True]{.verbatim}**) o **falso** (**[False]{.verbatim}**).

| Operador | Significado  | Ejemplo  | Resultado  |
|----------|--------------|----------|------------|
| [==]{.verbatim}     | Igual que             | [3 == 3]{.verbatim}     | [True]{.verbatim}  |
| [!=]{.verbatim}     | Distinto de           | [3 != 5]{.verbatim}     | [True]{.verbatim}  |
| [<]{.verbatim}      | Menor que             | [2 < 5]{.verbatim}      | [True]{.verbatim}  |
| [<=]{.verbatim}     | Menor o igual que     | [3 <= 3]{.verbatim}     | [True]{.verbatim}  |
| [>]{.verbatim}      | Mayor que             | [7 > 10]{.verbatim}     | [False]{.verbatim} |
| [>=]{.verbatim}     | Mayor o igual que     | [4 >= 5]{.verbatim}     | [False]{.verbatim} |
| [is]{.verbatim}     | Es el mismo objeto    | [a is b]{.verbatim}     | [True]{.verbatim} si **a** y **b** son el mismo objeto |
| [is not]{.verbatim} | No es el mismo objeto | [a is not b]{.verbatim} | [True]{.verbatim} si son objetos diferentes |

Table: {tablename=yukitblr colspec=XXXX}

Todos los ejemplos utilizados son con números, pero lo habitual es hacer uso de variables. En Edublocks está en el grupo **Logic**.

![](img/introduccion_programacion/edublocks/edublocks_operators_logic.png){width="60%"}


::: exercisebox
¿Qué valor devuelven las siguientes expresiones? (piénsalas primero y luego compruébalo en Python, antes de mirar la [solución](#ejercicios-logicos)):

 - [3 == "3"]{.verbatim}
 - [4 <= 4.0]{.verbatim}
 - ["hola" != "Hola"]{.verbatim}

:::


## Operadores especiales: "is" y "is not"

Existen dos operadores especiales que tienen en cuenta la gestión de memoria de los objetos que se usan en el programa. Estos dos operadores se usan cuando el programa a realizar es avanzado y queremos gestionar la memoria que se usa, por lo que no los vamos a usar.

::: mycode
[Uso de "is" y "is not"]{.title}

```python
a = [1, 2, 3]
b = a         # b apunta al mismo objeto que a, en memoria
c = [1, 2, 3] # c tiene el mismo valor, pero es otro objeto

print(a is b) # True
print(a is c) # False
print(a == c) # True, porque los valores son iguales
```
:::

[Aquí](https://w3schools.tech/tutorial/python/python_identity_operators) se puede ver más ejemplos de su uso y una explicación avanzada en algunos casos especiales.

::: warnbox
No vamos a hacer uso de estos dos operadores especiales.
:::


# Operadores lógicos combinados: "and", "or", "not" {#operadores-logicos-combinados}

Sirven para **combinar condiciones**. En el siguiente capítulo los entenderemos mejor.

| Operador | Significado  | Ejemplo    | Resultado  |
|----------|--------------|------------|------------|
| [and]{.verbatim} | Y (ambas verdaderas)  | [3 < 5 and 10 > 2]{.verbatim}     | [True]{.verbatim}  |
| [or]{.verbatim}  | O (al menos una verdadera) | [3 > 5 or 10 > 2]{.verbatim} | [True]{.verbatim}  |
| [not]{.verbatim} | No (niega el valor)  | [not True]{.verbatim}              | [False]{.verbatim} |

Table: {tablename=yukitblr colspec=X[1]X[2]X[2]X[1]}

![](img/introduccion_programacion/edublocks/edublocks_operators_logic2.png){width="80%"}


::: exercisebox
¿Qué valor devuelven las siguientes expresiones? (piénsalas primero y luego compruébalo en Python, antes de mirar la [solución](#ejercicios-logicos-combinados)):

- [True == True and False == True]{.verbatim}
- [5 > 3 and 4 < 2]{.verbatim}
- [5 > 3 or 4 < 2]{.verbatim}
- [not (7 <= 7)]{.verbatim}
- [not (0)]{.verbatim}

:::

