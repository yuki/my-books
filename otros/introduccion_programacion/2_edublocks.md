
# Introducción a EduBlocks {#introducción-edublocks}

**EduBlocks** es un entorno de programación por bloques que podemos utilizar para programar en varios lenguajes, entre ellos **Python**. Funciona de forma parecida a [Scratch](https://scratch.mit.edu/), pero cada bloque **corresponde a una línea de código Python**. De esta manera, se puede aprender cómo funciona Python sin tener que preocuparnos de errores de escritura o de formato.


## ¿Por qué usar bloques para empezar? {#empezar-bloques}

La programación por bloques es una manera **más visual** de programar, ideal para aprender, y también es más fácil de entender.
- **Evita errores de escritura**, como olvidar un paréntesis o escribir mal una palabra.

Nos ayuda a **conocer la estructura del código** de manera sencilla. Además, con EduBlocks, como también nos muestra el código Python, es ideal para ir aprendiendo poco a poco.


## Primeros pasos con EduBlocks {#primeros-pasos-edublocks}

Para usar EduBlocks en el navegador hay que acceder a su página web: [https://app.edublocks.org](https://app.edublocks.org), donde nos podremos registrar, loguear, o empezar a programar directamente. Si nos registramos nos guardará los proyectos creados.

Si seleccionamos **"Python"** nos aparecerá el siguiente pop-up para crear un proyecto:

![](img/introduccion_programacion/edublocks_project.png){width="40%" framed=true}

Ahí podemos elegir:

- **Project name**: El nombre del proyecto. Debemos elegir un nombre significativo para luego poder volver a él.
- **Mode**: Aquí podemos elegir el lenguaje de programación. Tiene que aparecer **Python**.
- **Type**: Podemos elegir si queremos programar por bloques o directamente en texto. Elegirmemos **Blocks**.

Al darle al botón **Create**, nos aparecerá el entorno donde podremos empezar a programar:

![](img/introduccion_programacion/edublocks_entorno.png){width="70%" framed=true}

Se pueden diferenciar tres apartados:

- Grupos de distintos tipos de bloques que vamos a poder usar para programar.
- Lugar donde podemos poner los distintos bloques.
- Código fuente Python de lo que estamos programando.


## Grupos de bloques {#grupos-de-bloques}

Vamos a explicar los distintos grupos de bloques, aunque no hace falta entender qué significan de momento:


::::::::::::::: {.columns }
:::: {.column width="25%"}
![](img/introduccion_programacion/edublocks_imports.png){width="100%"}
::::
:::: {.column width="74%"}
Los lenguajes de programación suelen estar separados en "módulos", por lo que para usar ciertas características de los lenguajes hay que importar el módulo correspondiente. En EduBlocks hay módulos para fechas, matemáticas...
::::
:::::::::::::::


::::::::::::::: {.columns }
:::: {.column width="25%"}
![](img/introduccion_programacion/edublocks_variables.png){width="100%"}
::::
:::: {.column width="74%"}
Para crear variables debemos usar este grupo, para después poder usarlas. Más adelante hablaremos de las variables.
::::
:::::::::::::::



::::::::::::::: {.columns }
:::: {.column width="25%"}
![](img/introduccion_programacion/edublocks_statements.png){width="100%"}
::::
:::: {.column width="74%"}
Son bloques básicos, para mostrar datos, obtener datos desde el teclado, convertir texto a números...
::::
:::::::::::::::


::::::::::::::: {.columns }
:::: {.column width="25%"}
![](img/introduccion_programacion/edublocks_text.png){width="100%"}
::::
:::: {.column width="74%"}
Bloques para realizar tareas con texto: combinar textos, convertirlo a mayúsculas, minúsculas, contar letras...
::::
:::::::::::::::


::::::::::::::: {.columns }
:::: {.column width="25%"}
![](img/introduccion_programacion/edublocks_math.png){width="100%"}
::::
:::: {.column width="74%"}
En este apartado hay bloques para realizar operaciones matemáticas. Para poder usarlas **hay que importar el módulo de matemáticas**.
::::
:::::::::::::::


::::::::::::::: {.columns }
:::: {.column width="25%"}
![](img/introduccion_programacion/edublocks_logic.png){width="100%"}
::::
:::: {.column width="74%"}
En este grupo **hay bloques muy importantes para la lógica de un programa**. Más adelante hablaremos y los entenderemos.
::::
:::::::::::::::


::::::::::::::: {.columns }
:::: {.column width="25%"}
![](img/introduccion_programacion/edublocks_lists.png){width="100%"}
::::
:::: {.column width="74%"}
Operaciones con listas, que es un tipo de variable.
::::
:::::::::::::::


::::::::::::::: {.columns }
:::: {.column width="25%"}
![](img/introduccion_programacion/edublocks_loops.png){width="100%"}
::::
:::: {.column width="74%"}
En este grupo **hay bloques muy importantes para realizar tareas repetitivas**. Más adelante hablaremos y los entenderemos.
::::
:::::::::::::::


::::::::::::::: {.columns }
:::: {.column width="25%"}
![](img/introduccion_programacion/edublocks_definitions.png){width="100%"}
::::
:::: {.column width="74%"}
Bloques para crear funciones.
::::
:::::::::::::::

::::::::::::::: {.columns }
:::: {.column width="25%"}
![](img/introduccion_programacion/edublocks_turtle.png){width="100%"}
::::
:::: {.column width="74%"}
Bloques para dibujar. Es necesario importar el módulo "turtle".
::::
:::::::::::::::


::::::::::::::: {.columns }
:::: {.column width="25%"}
![](img/introduccion_programacion/edublocks_graphs.png){width="100%"}
::::
:::: {.column width="74%"}
Si queremos crear gráficos (de líneas, de barras horizontales...) podemos usar estos bloques.
::::
:::::::::::::::

::::::::::::::: {.columns }
:::: {.column width="25%"}
![](img/introduccion_programacion/edublocks_random.png){width="100%"}
::::
:::: {.column width="74%"}
Si necesitamos crear números aleatorios podemos usar las funciones de este grupo.
::::
:::::::::::::::


::::::::::::::: {.columns }
:::: {.column width="25%"}
![](img/introduccion_programacion/edublocks_requests.png){width="100%"}
::::
:::: {.column width="74%"}
Los bloques de este grupo nos va a permitir realizar peticiones a páginas web, obtener información de ellas o coger datos de ficheros JSON.
::::
:::::::::::::::


## Empezamos a programar {#empezamos-programar}

La mejor manera para aprender es **¡programar!**. Vamos a hacer unos programas sencillos para aprender a usar EduBlocks y ver dónde están los bloques más usados y para qué sirven.

### ¡Hola Mundo! {#hola-mundo}

Cuando aprendemos a programar en un lenguaje concreto, el primer programa que se suele hacer es el conocido como "hola mundo". Es un programa sencillo que muestra en pantalla un mensaje: `"¡Hola mundo!"`.

Para programarlo tenemos que:

1. Ir a la categoría **Statements**.
2. Arrastra el bloque que dice: `print("Hello World")`, que sirve para imprimir por pantalla
3. Haz clic en el bloque y cambiar para que ponga: `"¡Hola mundo!"`.
4. Pulsa el botón ![](img/introduccion_programacion/edublocks_run.png){inline=true height=2em}

Deberíamos tener en Edublocks lo siguiente:

::::::::::::::: {.columns }
:::: {.column width="48%"}
![](img/introduccion_programacion/edublocks_program_1.png){width="70%"}
::::
:::: {.column width="48%"}

::: mycode
[Código fuente en Python]{.title}

```python
#Start code here
print("¡Hola mundo!")
```
:::

::::
:::::::::::::::

Y el resultado debería ser:

![](img/introduccion_programacion/edublocks_program_1_output.png){width="50%" framed=true}



### Leer datos del usuario

La gran mayoría de los programas necesitan *input* de los usuarios. En este caso vamos a pedir al usuario que escriba su nombre, y luego lo vamos a saludar.

Los pasos a dar son:

1. Ir a la categoría **"Variables"**.
2. Pulsa el botón ![](img/introduccion_programacion/edublocks_create_variable.png){inline=true height=2em} para crear una variable. Nos aparece un *pop-up* para darle un nombre a la variable: `nombre_usuario`. Verás que ahora en la categoría aparecen 2 bloques nuevos (uno es para darle valor a la variable y otro para usarla)

::::::::::::::: {.columns }
:::: {.column width="48%"}
![Para asignar valor a la variable](img/introduccion_programacion/variable_assign.png){width="70%"}
::::
:::: {.column width="48%"}
![Para usar el valor de la variable](img/introduccion_programacion/variable.png){width="70%"}
::::
:::::::::::::::

3. Coge el bloque para asignar valor a la variable
4. Vete a la sección **Statements** y coge el bloque **Input**. Ponlo dentro del bloque anterior y que el texto que sea: "¿Cómo te llamas?". Esto nos va a pedir el valor al usuario
5. Vete a la sección **Statements** y coge el bloque para imprimir por pantalla
6. Vete a la sección **Text** y coge el bloque que empieza por **"f"**, y ponlo dentro del bloque anterior. En el texto pon "Hola " y comprueba que la variable seleccionada es "nombre_usuario".


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


