
# ¿Qué es Python? {#que-es-python}

Python es un lenguaje de programación **interpretado** creado por [Guido van Rossum](https://en.wikipedia.org/wiki/Guido_van_Rossum) en 1989. Lo creó como un hobby durante las vacaciones y lo llamó Python por la serie [Monty Python's Flying Circus](https://en.wikipedia.org/wiki/Monty_Python%27s_Flying_Circus).

Los objetivos que Van Rossum tenía para su lenguaje eran:

- Python debería ser **fácil, intuitivo y tan potente** como sus principales competidores.
- El proyecto sería de **código abierto** para que cualquiera pudiera colaborar.
- El código escrito en Python sería tan **comprensible como cualquier texto en inglés**.
- Python debería ser **apto para las actividades diarias** permitiendo la construcción de prototipos en poco tiempo.

Para ver la importancia de Python como lenguaje simple y potente, es importante saber que ha servido como influencia para otros lenguajes posteriores, como [Ruby](https://es.wikipedia.org/wiki/Ruby) y [Swift](https://es.wikipedia.org/wiki/Swift_(lenguaje_de_programaci%C3%B3n)).


## Quién lo usa {#quien-lo-usa}

Python se utiliza en muchos ámbitos dentro de los sistemas de computación:

- **Automatización de tareas**: crear *scripts* para hacer tareas repetitivas en el ordenador. Muy habitual en entornos GNU/Linux.
- **Desarrollo web**: con frameworks como [Flask](https://es.wikipedia.org/wiki/Flask) o [Django](https://es.wikipedia.org/wiki/Django_(framework)) se pueden hacer páginas y aplicaciones web.
- **Análisis de datos**: se usa en ciencia de datos y estadísticas con herramientas como Pandas o NumPy.
- **Inteligencia Artificial y Machine Learning**: es uno de los lenguajes más usados a día de hoy para entrenar modelos.
- **Ciencia e investigación**: muy utilizado en universidades y laboratorios para cálculos y simulaciones.
- **Videojuegos**: con bibliotecas como [Pygame](https://es.wikipedia.org/wiki/Pygame) se pueden hacer juegos simples. También se puede usar en entornos 3D como [Blender](https://docs.blender.org/api/current/info_quickstart.html) y para hacer scripting en Unity y Unreal.
- **Educación**: ideal para aprender a programar.


## Dónde lo podemos usar {#donde-usar}

Como ya se ha comentado, Python al ser un lenguaje interpretado, se necesita el intérprete para poder ejecutar los programas realizados, o una plataforma donde poder ejecutar los programas.

Si queremos usar Python en nuestros ordenadores:

- **GNU/Linux**: La gran mayoría de las distribuciones GNU/Linux instalan por defecto Python, ya que se usa como dependencia para muchos programas (sistemas de paquetes, programas de monitorización...).
- **MacOS**: MacOS por defecto tiene instalado el intérprete de Python, pero no suele ser la versión más nueva.
- **Windows**: Es necesario instalar el intérprete. Se puede instalar el *[manager](https://apps.microsoft.com/detail/9nq7512cxl7t?hl=es-ES&gl=ES)* desde la Microsoft Store, o alguna de las [versiones disponibles](https://apps.microsoft.com/search/publisher?name=Python+Software+Foundation&hl=es-ES&gl=ES), así como desde la [web oficial de Python](https://www.python.org/downloads/windows/).


También podemos usar Python desde aplicaciones web como:

- [Edublocks](https://app.edublocks.org/): Es el sistema que vamos a usar para aprender los conceptos básicos. 
- [Jupyter](https://jupyter.org/try): JupyterLab nos permite crear pequeños programas, gráficas y uso para ciencia de datos, junto con documentación, a través de una aplicación web.
- [Google Colab](https://colab.google/): Es un servicio de Jupyter Notebook hosteado por Google con posibilidad de usar recursos de computación como GPUs y [TPUs](https://en.wikipedia.org/wiki/Tensor_Processing_Unit).

En estas plataformas es posible que exista cierta limitación, ya que es posible que no podamos instalar librerías de terceros.


## Versiones de Python {#versiones-python}

Al igual que sucede con el lenguaje hablado, los lenguajes de programación evolucionan con el tiempo. Los lenguajes de programación suelen tener distintas versiones a lo largo del tiempo, añadiendo mejoras y en algunos casos quitando cosas obsoletas.

Python 2.0 salió en el año 2000 y la última versión de esa rama (2.7.18) en 2020. Python 3, salió en 2008, fue diseñado para rectificar ciertos errores fundamentales en el diseño del lenguaje, lo que hacía que en ciertos aspectos el lenguaje perdiese retro-compatibilidad (los programas escritos para 2.0 no se podían ejecutar con el intérprete de 3.x sin hacer cambios).

Durante muchos años python 2.7.X y 3.X han coexistido para dar tiempo a hacer la migración de proyectos grandes, hasta que en 2020 se decidió dejar de dar soporte a las versiones 2.X. Hoy en día todo código que veamos debería ser de la versión 3 en adelante.

Python actualmente está en la versión **3.13** (más concretamente 3.13.5).


# Variables {#variables}

Una **variable** es un nombre que usamos para **guardar un dato** en la memoria del ordenador. Podemos imaginarla como una **caja con una etiqueta**, donde guardamos un valor que luego podemos usar, cambiar o mostrar.

Para crear una variable en EduBlocks tenemos que:

1. Ir a la categoría **"Variables"**.
2. Pulsa el botón ![](img/introduccion_programacion/edublocks_create_variable.png){inline=true height=2em} para crear una variable. Nos aparece un *pop-up* para darle un nombre a la variable: [nombre_usuario]{.verbatim}. Verás que ahora en la categoría aparecen 2 bloques nuevos (uno es para darle valor a la variable y otro para usarla)

::::::::::::::: {.columns }
:::: {.column width="48%"}
![Para asignar valor a la variable](img/introduccion_programacion/variable_assign.png){width="70%"}
::::
:::: {.column width="48%"}
![Para usar el valor de la variable](img/introduccion_programacion/variable.png){width="70%"}
::::
:::::::::::::::

En Python las variables se definen de forma dinámica. Esto quiere decir que no debemos especificar qué tipo de datos va a tener antes de ser declarada.

::::::::::::::: {.columns }
:::: {.column width="48%"}
![Para asignar valor a la variable](img/introduccion_programacion/edublocks_input.png){width="70%"}
::::
:::: {.column width="48%"}

::: mycode
[Asignar valor a las variables]{.title}

```python
#Start code here
nombre_usuario = "Rubén"
nombre_usuario = 1
```
:::

::::
:::::::::::::::


En la primera sentencia asignamos un valor a la variable, y posteriormente sustituimos el valor por otro. Estos datos son de distinto tipo. En otros lenguajes de programación no se puede realizar la asignación de distintos tipos de datos en la misma variable.

Debido a que los lenguajes de programación tienen un léxico propio, esas palabras no las podremos utilizar como variables, ya que dará error. En la [documentación oficial](https://docs.python.org/3/reference/lexical_analysis.html#keywords) están las palabras reservadas, como: False, rawait, else, ...

::: errorbox
Hay ciertas [palabras reservadas](https://docs.python.org/3/reference/lexical_analysis.html#keywords) que no podemos usar como nombres de variables.
:::


## Tipos de datos {#tipos-datos}

En Python, cada dato que usamos tiene un **tipo**, que indica qué tipo de información representa y qué se puede hacer con él. Conocer los tipos de datos es importante para saber cómo usarlos correctamente en un programa.

A continuación una breve descripción de los **tipos más comunes**:

| Nombre        | Ejemplo en código                        | Descripción breve                                |
|---------------|------------------------------------------|--------------------------------------------------|
| int           | [edad = 18]{.verbatim}                              | Números enteros, sin decimales. Pueden ser positivos o negativos |
| float         | [precio = 3.99]{.verbatim}                          | Números con decimales. Pueden ser positivos o negativos |
| str           | [nombre = "Ruben"]{.verbatim}                         | Texto, siempre entre comillas                    |
| bool          | [activo = True]{.verbatim}                          | Verdadero (**True**) o falso (**False**)             |
| list          | [frutas = ["pera", "uva"]]{.verbatim}               | Lista ordenada y modificable de elementos        |
| tuple         | [coordenadas = (3, 5)]{.verbatim}                   | Lista ordenada, **no modificable** (inmutable)   |
| dict          | [persona = {"nombre": "Ruben", "edad": 42}]{.verbatim}| Datos en forma **clave : valor**                 |
| set           | [numeros = {1, 2, 3}]{.verbatim}                    | Conjunto **sin elementos repetidos**, sin orden  |
| NoneType      | [nada = None]{.verbatim}                            | Representa la **ausencia de valor**              |
Table: {tablename=yukitblr colspec=X[1,l]X[3,l]X[5,l]}


::: infobox
Es importante entender los distintos tipos de datos en programación y para qué sirve cada uno.
:::

A continuación vamos a ver ejemplos usando Edublocks y el código en Python real para los tipos de datos más sencillos. Más adelante veremos el resto de los tipos de datos.

Para realizar ciertas operaciones, será necesario convertir un tipo de datos a otro, ya que si son de distintos tipos, dará error.

### Números enteros (int) {#integers}

Son números **sin decimales**, positivos o negativos. 


::::::::::::::: {.columns }
:::: {.column width="48%"}
![](img/introduccion_programacion/edublocks_int.png){width="70%"}
::::
:::: {.column width="48%"}

::: mycode
[Variables con enteros]{.title}

```python
edad = 20
puntos = -5
```
:::

::::
:::::::::::::::


### Números decimales (float) {#float}

Son números con decimales (coma flotante). También pueden ser positivos y negativos.

::::::::::::::: {.columns }
:::: {.column width="48%"}
![](img/introduccion_programacion/edublocks_float.png){width="70%"}
::::
:::: {.column width="48%"}

::: mycode
[Variables con floats]{.title}

```python
precio = 14.5
valor = -2.3
```
:::

::::
:::::::::::::::


### Cadenas de texto (str) {#str}

Son textos entre comillas, que pueden contener letras, números o símbolos. Es importante diferenciar que el contenido de un texto, aunque sea un número, el tipo es distinto

::::::::::::::: {.columns }
:::: {.column width="48%"}
![](img/introduccion_programacion/edublocks_str.png){width="70%"}
::::
:::: {.column width="48%"}

::: mycode
[Variables con texto]{.title}

```python
nombre = "Ruben"
numero = "5"
entero = 5
```
:::

::::
:::::::::::::::

:::errorbox
Es importante diferenciar que las variables "numero" y "entero" son dos tipos de datos completamente distintos.
:::


### Booleanos (bool) {#bool}

Solo tienen dos valores posibles: **True** (verdadero) o **False** (falso). Sirve para hacer operaciones lógicas o para guardar datos que sólo pueden ser verdadero o falso.


::::::::::::::: {.columns }
:::: {.column width="48%"}
![](img/introduccion_programacion/edublocks_bool.png){width="70%"}
::::
:::: {.column width="48%"}

::: mycode
[Variables con booleans]{.title}

```python
mayor_de_edad = True
usado = False
```
:::

::::
:::::::::::::::

