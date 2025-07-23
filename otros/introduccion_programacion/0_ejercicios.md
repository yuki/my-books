
# Ejercicio "else anidado" {#ejercicio-else-anidado}

Amplía el código del ejemplo [if-else](#ejemplo-if-else) para que cuando entre en el [else]{.verbatim} se compruebe:

- si es mayor de 13: que escriba: "Eres adolescente"
- si no, pero es mayor a 6: escriba: "¿En qué curso estás?"
- si no: escriba: "¿Sabes montar en bici?"


::::::::::::::: {.columns }
:::: {.column width="40%"}
![](img/introduccion_programacion/edublocks_ejercicio_if_else.png){width="90%"}
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