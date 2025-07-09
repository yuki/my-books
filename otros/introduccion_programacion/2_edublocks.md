
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


## 3.4 Primer programa: decir "¡Hola!"

### 🧪 Objetivo:
Mostrar en pantalla un mensaje: `"¡Hola mundo!"`.

### 🧩 Pasos en EduBlocks:
1. Ve a la categoría **"Text"**.
2. Arrastra el bloque que dice `print("")`.
3. Haz clic en el bloque y escribe dentro: `¡Hola mundo!`.
4. Pulsa el botón **Run** o **Ejecutar**.

### ✅ Resultado esperado:
Aparecerá en la parte inferior:  
`¡Hola mundo!`

---

## 3.5 Leer datos del usuario

### 🎯 Objetivo:
Pedir al usuario que escriba su nombre, y luego saludarlo.

### 🧩 Pasos en EduBlocks:
1. Ve a la categoría **"Variables"**.
2. Arrastra un bloque para crear una variable: por ejemplo, `nombre = input("")`.
3. En el texto del bloque, escribe: `"¿Cómo te llamas?"`
4. Luego, usa un bloque `print("")` y escribe: `"Hola, " + nombre`.

### 💬 Resultado:
Si el usuario escribe “Ane”, el programa mostrará:  
`Hola, Ane`

---

## 3.6 Decisiones: if... else...

### 🎯 Objetivo:
Preguntar la edad y decir si puedes entrar a una discoteca.

### 🧩 Pasos:
1. Crear una variable `edad = int(input("¿Qué edad tienes?"))`
2. Usar un bloque `if... else` (condicional).
3. Dentro del `if`, escribir la condición: `edad >= 18`
4. En cada parte, usar `print()` para mostrar un mensaje:

- Si tiene 18 o más: `"Puedes entrar"`
- Si no: `"No puedes entrar"`

---

## 3.7 Bucle while (repetición)

### 🎯 Objetivo:
Contar del 1 al 5.

### 🧩 Pasos:
1. Crear una variable `contador = 1`
2. Usar un bloque `while contador <= 5:`
3. Dentro del bucle:
   - Mostrar el valor del contador
   - Aumentar el contador (`contador = contador + 1`)