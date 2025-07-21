
# Por qué es necesario convertir datos {#porque-necesario-convertir}

A veces es necesario **cambiar el tipo de un dato** para poder realizar ciertas operaciones.  Por ejemplo, le pedimos al usuario su edad y queremos ver si es un número primo o no.

Si no realizamos la conversión de datos, el resultado que obtendremos no será el esperado, por lo que nuestro programa no realizará lo que queremos.

Pasar de un tipo de datos a otro se llama **conversión de tipos** o *type casting*, y Python nos permite hacerlo de forma sencilla.

## Funciones de conversión más comunes {#tabla-conversion}

A continuación una tabla resumen de cómo se realiza la conversión de datos entre distintos tipos. Algunas de estas conversiones no se pueden usar en Edublocks.

| Función     | Qué hace                                      | Ejemplo                    |
|-------------|-----------------------------------------------|----------------------------|
| [int()]{.verbatim}   | Convierte a número entero   | [int("5") → 5]{.verbatim}   |
| [float()]{.verbatim} | Convierte a número con decimales  | [float("3.14")]{.verbatim} → [3.14]{.verbatim}   |
| [str()]{.verbatim}   | Convierte a cadena de texto  | [str(10) → "10"]{.verbatim}  |
| [bool()]{.verbatim}  | Convierte a valor lógico (True o False) | [bool(0)]{.verbatim} → [False]{.verbatim}   |
| [list()]{.verbatim}  | Convierte a lista  | [list("hola")]{.verbatim} → [["h", "o", "l", "a"]]{.verbatim} |
| [set()]{.verbatim}   | Convierte a conjunto (sin elementos repetidos)| [set([1, 2, 2])]{.verbatim} → [{1, 2}]{.verbatim} |
| [tuple()]{.verbatim} | Convierte a tupla  | [tuple([1, 2])]{.verbatim} → [(1, 2)]{.verbatim}  |

Table: {tablename=yukitblr colspec=X[l]X[3,l]X[3,l]}


## Conocer el tipo de dato{#conocer-tipo-dato}

Si queremos conocer el tipo de datos de una variable, podemos hacer uso de la función [type()]{.verbatim}. A continuación un ejemplo de código:

::: mycode
[Conocer el tipo de datos]{.title}

```python
nombre = "Ruben"
print(type(nombre))
print(type(nombre).__name__)
```
:::

::: exercisebox
¿Qué diferencia hay entre las dos últimas sentencias?
:::


<!-- TODO: Sería interesante hacer un ejemplo de cada tipo, pero de momento paso.
# Conversión a int {#conversion-int}
-->

