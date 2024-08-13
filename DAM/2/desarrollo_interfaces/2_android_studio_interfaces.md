
# Interfaces con Android UI {#interfaces-con-android-ui}

A la hora de crear interfaces para dispositivos Android a través de Android Studio, dependiendo de la aplicación que estemos creando, pueden ser generadas de dos maneras distintas:

* **[Diseño de vista en XML](https://developer.android.com/develop/ui/views/layout/declaring-layout?hl=es-419)**: Son generadas a través de ficheros [XML](https://es.wikipedia.org/wiki/Extensible_Markup_Language) utilizando un editor en el que podremos colocar distintos elementos, restricciones... Para el correcto funcionamiento y compilación del proyecto, estos ficheros deben de cumplir con el estándar XML y ser ficheros válidos. Era el sistema original a la hora de crear vistas.
* **[Jetpack Compose](https://developer.android.com/courses/jetpack-compose/course?hl=es-419)**: es un *framework* Kotlin para crear interfaces de usuario de manera declarativa. En este caso se "escribe" lo que queremos que tenga el interfaz.

En un mismo proyecto puede coexistir vistas creadas de distintas maneras, por lo que en un proyecto antiguo que se usó XML, podemos ir migrando vistas al formato Compose si usamos Kotlin.

## Diferencias entre ambos modelos

A la hora de elegir qué sistema elegir, dependerá de los conocimientos que tengamos en ambos, pero a continuación se muestra una pequeña tabla comparativa:

<!-- TODO: crear una tabla con esto -->
* **XML**:
  * Ventajas:
    * **Separación de conceptos**: La vista se diferencia cláramente de la lógica
    * Editor **WYSIWYG**: Android Studio incorpora un editor visual que nos permite colocar los componentes de la vista. Puede ser más intuitivo para algunos desarrolladores
    * **Reciclaje**: Se pueden generar plantillas/*layouts* XML que pueden ser utilizados en distintos *activities*.
  * Desventajas:
    * **Limitado**: A la hora de generar interfaces complejos, el formato XML tiene limitaciones que tienen que ser subsanado con código Java/Kotlin.
    * ***Verbosity***: Los ficheros XML pueden ser complejos y tener redundancias. Esto puede hacer que se complique a la hora de mantener vistas complejas.
* **Jetpack Compose**
  * Ventajas:
    * **Sintaxis declarativa** que facilita la creación de UI complejas
    * **Tipado seguro**: Como es código Kotlin, se reduce la posibilidad de cometer errores de tipado y que haya errores durante la ejecución.
    * **Modularidad**: Jetpack Compose promueve la creación de componentes de interfaz que se puedan reutilizar. Esto facilita el mantenimiento de la aplicación y la escalabilidad.
    * **Vista previa "en vivo"**: Se puede ver una vista previa a medida que se va generando la vista en código.
  * Desventajas:
    * La **curva de aprendizaje** puede ser pronunciada al inicio.
    * **Compatibilidad**: A día de hoy no debería ser un problema, pero sólo se puede usar con **Android 5.0 (API level 21)** o superior.
    * Sólo se puede usar con Kotlin.


# Diseño de vistas en XML con Android Studio {#vistas-con-xml}

A continuación se explica la creación de un proyecto donde por defecto se nos va a crear el ***MainActivity*** utilizando una vista en formato XML, conocidas como *Android View*, que es el sistema antiguo de creación de vistas.

Los ficheros de las vistas se encuentran por defecto en la ruta [src/main/res/layout]{.configdir} de nuestro proyecto. No es habitual editar estos ficheros fuera de Android Studio, pero hay que tener en cuenta dónde se almacenan.

## Creando nuestro primer proyecto {#creando-nuestro-primer-proyecto}

Una vez abierto Android Studio vamos a crear un nuevo proyecto y vamos a elegir "Empty Views Activity", de esta manera el proyecto que nos va a generar va a tener una primera vista con un texto centrado

![](img/di/tema_2/crear_proyecto.png){width="60%"}


En el siguiente paso elegimos el nombre del proyecto, la ruta, el lenguaje de programación y el SDK que vamos a utilizar. Con las opciones elegidas, se empezará a generar el proyecto y los ficheros necesarios para poder hacer funcionar la aplicación.

Si desplegamos en el menú de la izquierda (con la opción "Android" seleccionada) hasta llegar a la ruta [app/res/layout]{.configdir}, veremos que tenemos un fichero que se llama [activity_main.xml]{.configfile}, que al hacer click obtendremos una vista similar a esta:

![](img/di/tema_2/vista_principal.png){width="100%"}


## Vista "diseño", "blueprint" y código {#vista-diseño-blueprint-y-código}

A la hora de interactuar con las vistas tendremos tres opciones:

-   **Vista diseño**: Es lo más cercano a lo que el usuario final va a ver. De esta manera podremos ver los distintos elementos que tiene la interfaz y con el contenido que se le haya dado.

-   **Vista blueprint**: También conocida como "cianotipo" o vista de plano. Simula los planos de ingeniería y en esta vista sólo veremos de qué tipo es cada elemento. Esta vista es adecuada para abstraernos del contenido y centrarnos en el diseño.

-   **Código XML**: Es el contenido del fichero XML de la propia vista. Podremos realizar modificaciones cambiando el texto. Esta vista es la idónea si queremos cambiar algún parámetro concreto que ya está prefijado y queremos ir a tiro hecho.

## Componentes en el interfaz {#componentes-en-el-interfaz}

:::::::::::::: {.columns }
::: {.column width="60%"}
A la hora de crear nuestro interfaz Android Studio tiene una serie de componentes que podremos utilizarlos diréctamente arrastrando los componentes al interfaz.

Debe quedar claro que cada uno de ellos contará con sus características propias, por lo que es importante hacer uso de la [documentación oficial](https://developer.android.com/reference/android/widget/EditText) a la hora de utilizar cada uno de ellos.
:::
::: {.column width="30%" }
![](img/di/tema_2/componentes.png){width="100%"}
:::
::::::::::::::



## Layouts y constraints {#layouts-y-constraints}

Con la vista inicial, si seleccionamos el texto "Hello World!" veremos que tiene una configuración en el apartado ***Layout*** como el siguiente:


:::::::::::::: {.columns }
::: {.column width="60%"}
Se pueden identificar 4 *constraints* que hacen referencia a los distintos puntos del componente:

-   ***Start***: Lado izquierdo del componente.

-   ***End***: Lado derecho del componente.

-   ***Top***: Parte superior del componente.

-   ***Bottom***: Parte inferior del componente.
:::
::: {.column width="30%" }
![](img/di/tema_2/constraints.png){width="100%"}
:::
::::::::::::::


De esta manera, cada parte del componente tendrá un *constraint* que estará asociado, en este caso, a una parte del *layout* padre que lo contiene. Si miramos el código fuente del fichero XML, se puede apreciar cómo cada uno de estos aparece escrito:

::: mycode
[Código XML de un TextView]{.title}
```xml
<TextView
    android:id="@+id/textView"
    android:layout_width="wrap_content"
    android:layout_height="wrap_content"
    android:text="Hello World!"
    app:layout_constraintBottom_toBottomOf="parent"
    app:layout_constraintEnd_toEndOf="parent"
    app:layout_constraintStart_toStartOf="parent"
    app:layout_constraintTop_toTopOf="parent" />
```
:::

Si añadimos al interfaz un botón, en la parte baja de la pantalla, centrado y en la posición que nos interese en la vista vertical, veremos que a la hora de ejecutar la vista en el simulador deja de aparecer en la posición que lo hemos indicado.

::: errorbox
Los atributos "layout_editor" del XML sólo sirven para la vista del editor, no para la vista final. Para colocar los elementos en su posición correcta hay que usar los constraints.
:::

Es por eso, que para cada componente que queramos añadir a la vista deberá tener sus *constraints* haciendo referencia a otros componentes o al *layout* que lo contiene. En caso de que no hayamos añadido uno, o algo en la vista no sea correcto, nos aparecerá en el interfaz:

![](img/di/tema_2/error_constraints.png){width="40%"}

Los componentes pueden estar asociados a otros componentes, pero no tienen por qué estar asociados entre ellos. Por ejemplo, la siguiente vista tiene a nivel horizontal podemos apreciar lo siguiente:

:::::::::::::: {.columns }
::: {.column width="60%"}
-   El texto "Hello World" está asociado a ambos lados del layout que lo contiene, y por eso aparece centrado.

-   El componente con texto "Hello3" es más ancho que el texto que lo contiene (atributo ***layout_width***). En el lado izquierdo está asociado al otro componente mientras que en el lado derecho a la vista, haciendo que quede horizontalmente entre ambos.
:::
::: {.column width="30%" }
![](img/di/tema_2/ejemplo_constraints.png){width="100%"}
:::
::::::::::::::



### Cadenas {#cadenas}

Las [cadenas](https://developer.android.com/develop/ui/views/layout/constraint-layout#constrain-chain) sirven para enlazar un grupo de componentes (o vistas) de manera bidireccional entre ellos. Se pueden realizar cadenas de manera vertical y horizontal. Ejemplo de cadena vertical con los 3 elementos que están centrados.

![](img/di/tema_2/cadenas.png){width="30%" framed=true}


## Vista vertical y horizontal {#vista-vertical-y-horizontal}

Nuestros dispositivos pueden rotar de posición, y por tanto los componentes que aparecen en pantalla deberían poder ajustarse a la nueva posición de la misma.

Por eso, a la hora de diseñar el interfaz, deberemos pensar qué hacer con la posición de los componentes: si se desplazan de posición, si se ocultan de alguna manera, si se convierten en un menú desplegable\...

Por defecto, al rotar el dispositivo, los componentes se moverán teniendo en cuenta el ***layout*** y los ***constraints*** que tienen configurados. En la vista creada al crear el proyecto, al rotar el dispositivo sucederá lo siguiente:

:::::::::::::: {.columns }
::: {.column width="30%"}
![](img/di/tema_2/v1.png){width="100%"}
:::
::: {.column width="60%" }
![](img/di/tema_2/h1.png){width="100%"}
:::
::::::::::::::


Tal como se puede ver, el texto "Hello World!" permanece centrado respecto a la vista debido a que el texto tiene asociados unos constraints contra el resto del interfaz, haciendo que siempre esté centrado.

### Diferenciando las vistas {#diferenciando-las-vistas}

A la hora de tener distintas vistas para la posición del dispositivo, es posible que no nos interese tener todos los elementos, o que estos no estén situados en la misma posición.

Por ejemplo, la calculadora de iOS a la hora de rotar el dispositivo, la calculadora ofrece más opciones convirtiéndola en una calculadora científica.



:::::::::::::: {.columns }
::: {.column width="10%"}
:::
::: {.column width="20%"}
![](img/di/tema_2/calculadora_ios.png){width="100%"}
:::
::: {.column width="10%"}
:::
::: {.column width="40%" }
![](img/di/tema_2/calculadora_ios_landscape.png){width="100%"}
:::
::: {.column width="10%"}
:::
::::::::::::::


Si creamos una vista sin realizar modificaciones para el modo "*landscape*", obtendremos un resultado similar a este:

:::::::::::::: {.columns }
::: {.column width="30%"}
![](img/di/tema_2/calculadora_android.png){width="100%"}
:::
::: {.column width="60%" }
![](img/di/tema_2/calculadora_android_landscape_mal.png){width="100%"}
:::
::::::::::::::




Como se puede ver, la colocación de los botones se mantiene igual en ambas vistas, pero hace que el modo apaisado no sea usable. Y aunque pudiésemos ver el resultado, la vista no tendría mucho sentido.

En cambio, si realizamos una composición distinta para la vista apaisada, obtendremos un resultado más óptimo, donde podremos tener los elementos colocados de una manera distinta, pero más usable.

![](img/di/tema_2/calculadora_android_landscape_bien.png){width="70%"}


Para tener vistas diferenciadas tendremos que crear una vista en modo apaisado sobre la vista que ya tengamos creada. Para ello vamos al editor de la vista, hacemos click en el desplegable y seleccionamos "*Create Landscape Qualifier*".

Esto nos creará en el árbol de nuestro proyecto una carpeta con el nombre de la vista original y dos ficheros: el original y otro donde podemos ver que le ha añadido "*land*" para identificar que es la versión apaisada.


:::::::::::::: {.columns }
::: {.column width="35%"}
![](img/di/tema_2/crear_landscape.png){width="100%"}
:::
::: {.column width="35%" }
![](img/di/tema_2/vista.png){width="100%"}
:::
::::::::::::::


Gracias a esto nos va a crear una vista nueva, con todos los elementos de la vista original, manteniendo los *constraints*. El nuevo fichero **xml** lo podremos encontrar en una nueva ruta que ha creado un directorio para las vistas apaisadas: [app/src/main/res/layout-land]{.configdir}.

## Dando funcionalidad al interfaz {#dando-funcionalidad-al-interfaz}

Aunque no se va a ahondar en cómo programar para Android, se va a añadir un pequeño ejemplo para entender cómo funciona un botón y un texto y cómo interactuar entre sí.

La idea es:

-   Crear un interfaz con un botón y un TextView.

-   Al pulsar el botón, el texto original del TextView desaparece y se incrementa en 1 para saber el número de pulsaciones que se han realizado.

Teniendo esto en cuenta, el código del fichero **MainActivity.kt** debería quedar de la siguiente manera:

::: mycode
[Código Kotlin para hacer funcionar un botón]{.title}

```kotlin
//... imports previos
import android.widget.Button
import android.widget.TextView

class MainActivity : AppCompatActivity() {

    var contador:Int = 0

    override fun onCreate(savedInstanceState: Bundle?) {
        //... código ya existente

        val button:Button = findViewById(R.id.button)
        val text:TextView = findViewById(R.id.textView)

        button.setOnClickListener {
            contador = contador+1
            text.text= (contador).toString()
        }
    }
}
```
:::

::: questionbox
**¿Qué pasa con los datos si rotamos la pantalla?**
:::

# Diseño de vistas con Jetpack Compose {#vistas-jetpack-compose}

En este caso, el proyecto lo crearemos seleccionando la opción "Empty Activity", lo que nos creará un proyecto donde por defecto se nos va a crear la clase ***MainActivity*** utilizando el nuevo sistema **Jetpack Compose**, para la creación de vistas, y por tanto haciendo uso de la sintaxis declarativa.

Al terminar de crearse el proyecto, si utilizamos en la vista el sistema *Split*, junto al código fuente veremos el mensaje que nos indica que debemos "construir" la vista y refrescar para ver el resultado en tiempo real. Al hacer click, se construirá la vista y a partir de ese momento tendremos una previsualización en tiempo real, tal como aparece a continuación:

:::::::::::::: {.columns }
::: {.column width="10%"}
:::
::: {.column width="50%"}
![](img/di/tema_2/jetpack_refresh.png){width="100%"}
:::
::: {.column width="30%" }
![](img/di/tema_2/jetpack_preview.png){width="100%"}
:::
::: {.column width="10%"}
:::
::::::::::::::

## Entendiendo la vista por defecto {#entendiendo-vista-inicial}

La vista que nos ha generado el proyecto cuenta con una serie de apartados que hay que entender para poder realizar modificaciones y también saber qué está sucediendo en la vista previa.

### Función que genera un *widget* de vista {#funcion-genera-widget}

Tal como se ha dicho previamente, *Compose* trata de generar vistas, **o partes de ella**, que puedan ser reutilizadas. En este caso, el asistente de creación del proyecto nos ha creado una función `fun Greeting(...)` que genera un pequeño componente de tipo **Text** que genera y visualiza un texto utilizando el párametro que se le pasa a la función, y un posible modificador (luego hablaremos de ellos).


::: mycode
[Widget que genera un texto]{.title}

```kotlin
@Composable
fun Greeting(name: String, modifier: Modifier = Modifier) {
    Text(
        text = "Hello $name!",
        modifier = modifier
    )
}
```
:::

De esta función lo que nos interesa es entender la anotación `@Composable`, que es una anotación que todas las funciones de "componibilidad" deben tener. Este `@Composable` informa al compilador de Compose que esta función está diseñada para convertir datos en IU.


### Vista previa de Compose {#vista-previa}

Una de las ventajas que tenemos a la hora de usar Compose es que podemos tener una vista previa a medida que vamos escribiendo el interfaz, sin necesidad de utilizar el emulador del terminal, lo que hace que **consumamos menos recursos**. La función que nos genera la vista previa tiene la anotación `@Preview`, a la que podremos añadir distintos parámetros.

::: mycode
[Función que genera la vista previa]{.title}

```kotlin
@Preview(showBackground = true)
@Composable
fun GreetingPreview() {
    JetpackTheme {
        Greeting("Android")
    }
}
```
:::

Tal como se ha visto previamente, tenemos una vista previa que nos muestra el "Hello Android", pero esta vista **no simula un interfaz real**. Esto no tiene por qué ser malo, ya que nos podemos centrar sólo en el interfaz/widget que estemos creando.

Podemos tener tantas vistas previas como nos interese, para diferentes dispositivos, modo claro/oscuro... Para generar nuevas vistas previas, debemos añadir una nueva anotación `@Preview` con los parámetros que nos interese. Por ejemplo:

::: mycode
[Nuevas vistas previas con distintos parámetros]{.title}

```kotlin
@Preview(showBackground = true, showSystemUi = true, 
    uiMode = Configuration.UI_MODE_NIGHT_YES)
@Preview(showBackground = true, showSystemUi = true,
    device = "id:pixel_fold")
@Preview(showBackground = true, showSystemUi = true,
    device = "spec:width=411dp,height=891dp,orientation=landscape")
```
:::

En estos ejemplos se han añadido distintos parámetros a la anotación `@Preview`, que son:

* **showSystemUi**: nos muestra el interfaz como si se estuviese ejecutando en un dispositivo.
* **uiMode**: acepta cualquier valor de [Configuration.UI_*](https://developer.android.com/reference/android/content/res/Configuration#UI_MODE_NIGHT_YES). En el ejemplo hará uso del modo noche.
* **device**: podemos indicar un dispositivo concreto mediante su **id**
  * Podemos crear nuestro propio tipo de dispositivo con el parámetro **spec:**, en el que le podemos indicar la orientación también.

Existen más posibilidades de cómo generar vistas en la [documentación oficial](https://developer.android.com/develop/ui/compose/tooling/previews?hl=es-419).


### La vista en MainActivity {#vista-mainactivity}

Tras todo lo anterior, es momento de entender qué sucede en la función principal de nuestra clase **MainActivity**, que es la función que se va a ejecutar al arrancar nuestra aplicación, al igual que en el anterior proyecto, **onCreate**.

::: mycode
[MainActivity con código Jetpack Compose]{.title}

```kotlin
class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent {
            JetpackTheme {
                Scaffold(modifier = Modifier.fillMaxSize()) { innerPadding ->
                    Greeting(
                        name = "Android",
                        modifier = Modifier.padding(innerPadding)
                    )
                }
            }
        }
    }
}
```
:::

En esta función el bloque **setContent** define el diseño de la actividad, donde se llaman a las funciones que admiten composición. Estas funciones solo se pueden llamar desde otras funciones del mismo tipo.

Luego podemos ver que todo está también dentro de **JetpackTheme** que es una función que está declarada en el fichero [ui/theme/Theme.kt]{.configfile}. Esta función generada lo que hace es diferenciar si el dispositivo está en modo claro o modo oscuro, para hacer uso del tema que hayamos creado.



## Disposición de elementos {#disposicion-elementos}

A la hora de crear nuestro interfaz debemos pensar en la composición/disposición (*layout* en inglés) de los distintos elementos. En la [documentación oficial](https://developer.android.com/develop/ui/compose/layouts/basics) hay un ejemplo similar al que se va a explicar aquí, por lo que es recomendable echar un vistazo.

Vamos a suponer el siguiente interfaz básico, donde a la izquierda aparece cómo quedaría el interfaz final, mientras que la disposición de los distintos elementos aparecen resaltados en la imagen de la derecha.

:::::::::::::: {.columns }
::: {.column width="10%"}
:::
::: {.column width="34%"}
![](img/di/compose/compose_dispose.png){width="100%"}
:::
::: {.column width="10%"}
:::
::: {.column width="34%" }
![](img/di/compose/compose_dispose_layout.png){width="100%"}
:::
::: {.column width="10%"}
:::
::::::::::::::

Mirando la disposición diseñada, a la hora de convertirlo a programación declarativa debemos entender los distintos apartados que hemos creado y cómo se van a colocar los distintos componentes.

Una primera iteración en programación con Composer quedaría de la siguiente manera, donde se han colocado los componentes con contenido *hardcodeado*, por lo que la función creada siempre mostrará el mismo contenido:


:::::::::::::: {.columns }
::: {.column width="67%"}

::: {.mycode size=scriptsize}
[Función con código Compose]{.title}

```kotlin
@Composable
fun Post() {
    Column {
        Column {
            Text("title")
            Text("subtitle")
        }
        Image(
            painter = painterResource(R.drawable.dragon),
            contentDescription = null
        )
        Text("Lorem ipsum dolor sit amet, conse...")
        Row {
            Column {
                Image(
                    painter = painterResource(R.drawable.goku),
                    contentDescription = null
                )
            }
            Column {
                Text("Author")
                Text("2024-09-01")
            }
        }
    }
}
```
:::

:::
::: {.column width="30%" }
![](img/di/compose/post1.png){width="100%"}
:::
::::::::::::::

Tal como se puede ver en el código, se han utilizado las siguientes funciones para colocar los elementos:

* **[Colmn](https://developer.android.com/reference/kotlin/androidx/compose/foundation/layout/package-summary#Column(androidx.compose.ui.Modifier,androidx.compose.foundation.layout.Arrangement.Vertical,androidx.compose.ui.Alignment.Horizontal,kotlin.Function1))**: pone todos los componentes hijos en una secuencia vertical.
* **[Row](https://developer.android.com/reference/kotlin/androidx/compose/foundation/layout/package-summary#Row(androidx.compose.ui.Modifier,androidx.compose.foundation.layout.Arrangement.Horizontal,androidx.compose.ui.Alignment.Vertical,kotlin.Function1))**: para colocar los componentes hijos en una secuencia horizontal.

## Modificadores de los elementos {#modificadores-elementos}

La función creada previamente coloca los distintos elementos haciendo uso de las funciones de Composer, pero para tener una interfaz amigable y con el resultado final, debemos hacer uso de los modificadores para cada elemento. Este será el punto en el que decidiremos "cómo poner bonito" el interfaz.

::: errorbox
Los modificadores se pueden añadir a nivel de bloque o a nivel de elemento. Hay que tener cuidado con las prioridades de los modificadores.
:::


Los modificadores se pueden añadir a nivel de bloque o a nivel de elemento, por lo que habrá que tener cuidado con el tipo de sentencias que utilizamos, ya que algunas prevalecen sobre otras por tener mayor prioridad.

Añadiendo distintos modificadores, el código quedaría:

:::::::::::::: {.columns }
::: {.column width="53%"}


::: {.mycode size=tiny}
[Añadidos distintos modificadores]{.title}

```kotlin
@Composable
fun Post() {
    Column (
        modifier = Modifier // FALTA CÓDIGO
    ) {
        Column (
            horizontalAlignment = Alignment.CenterHorizontally,
            modifier = Modifier
                .padding(10.dp)
                .fillMaxWidth()
                // FALTA CÓDIGO
        ) {
            Text(
                text = "title",
                modifier = Modifier.padding(bottom = 15.dp)
            )
            Text("subtitle")
        }
        Image(
            painter = painterResource(R.drawable.dragon),
            contentDescription = null
        )
        Text(
            text = "Lorem ipsum dolor sit amet, conse...",
            modifier = Modifier // FALTA CÓDIGO
        )
        Row (
            verticalAlignment = Alignment.CenterVertically,
            modifier = Modifier // FALTA CÓDIGO
        ){
            Column {
                Image(
                    painter = painterResource(R.drawable.goku),
                    contentDescription = null,
                    modifier = Modifier
                        .clip(CircleShape)
                        .background(color = Color.LightGray)
                        .size(100.dp)
                        .padding(5.dp)
                )
            }
            Column (
                Modifier.padding(start = 10.dp)
            ) {
                Text("Author")
                Text("2024-09-01")
            }
        }
    }
}
```
:::

:::
::: {.column width="44%" }
![](img/di/compose/post2.png){width="100%" framed=true}
:::
::::::::::::::


Se han añadido distintos modificadores tanto a nivel de columna/fila como a nivel de componente final. Tal como se puede ver, el código es bastante auto-explicativo. El código de ejemplo no está completo, se han añadido comentarios donde falta código para dibujar los bordes en algunos modificadores. **Los bordes facilitan ver la disposición de cada conjunto de elementos**

::: exercisebox
Completa el código anterior añadiendo los modificadores de los bordes para que se asemeje a la imagen mostrada.
:::



# Ciclo de vida del *Activity* en Android {#ciclo-de-vida-del-activity-en-android}


El contenido del texto de la vista se resetea al rotar el dispositivo. Es decir, **cualquier posible contenido que hubiese en ellos se pierde**. Esto es debido a que el ***Activity*** de la vista se destruye y se vuelve a crear en el nuevo estado de la pantalla.

::: errorbox
**Al rotar el dispositivo el \textit{Activity} entra en un ciclo de destrucción-creación**
:::

Es importante conocer qué sucede al rotar el dispositivo, y qué sucede con la vista y con los componentes que tenemos en primer plano.

Existen distintas funciones dentro del ciclo de vida de un ***Activity***, que serán llamadas por el sistema cada vez que se entre en cada uno de estos estados:

:::::::::::::: {.columns }
::: {.column width="25%"}
-   onCreate()

-   onStart()

-   onResume()

-   onPause()

-   onStop()

-   onDestroy()
:::
::: {.column width="70%" }
![Esquema del "*Activity-lifecycle*". Fuente: [Documentación oficial](https://developer.android.com/guide/components/activities/activity-lifecycle)](img/di/tema_2/activity_lifecycle.png){width="100%"}
:::
::::::::::::::

En el esquema (y en la web oficial de la [documentación](https://developer.android.com/guide/components/activities/activity-lifecycle#alc)) se puede apreciar los estados y sus transiciones:



::: exercisebox
Añade al **MainActivity.kt** las funciones necesarias para ver todas las transiciones al rotar la pantalla. Que las funciones muestren en el **Logcat** un texto que indique qué se ha ejecutado.
:::



## Mantener los estados {#mantener-los-estados}

Una vez sabemos cómo actúa las distintas transiciones de estados de las vistas, es momento de poder guardar el estado para poder recuperar la información al crear el Activity de nuevo. Para ello se van a usar dos funciones:

-   **onSaveInstanceState** : Se llamará cuando vaya a destruirse el Activity.

-   **onRestoreInstanceState**: Se llamará justo después de llamar al método **onCreate**.

Siguiendo con el ejemplo previo, donde queremos guardar el número de veces que se ha pulsado el botón, deberíamos añadir algo como lo siguiente:

::: mycode
[Código Kotlin para mantener estados]{.kotlin}
```kotlin
override fun onResume(){
    super.onResume()
    Log.d("Debug","onResume")
    val text:TextView = findViewById(R.id.textView)
    text.text = contador.toString()
}

override fun onSaveInstanceState(outState: Bundle) {
    // Save the user's current game state.
    outState?.run {
        putInt("contador", contador)
    }
    // Always call the superclass so it can save the view hierarchy.
    super.onSaveInstanceState(outState)
}

override fun onRestoreInstanceState(savedInstanceState: Bundle) {
    // Always call the superclass so it can restore the view hierarchy.
    super.onRestoreInstanceState(savedInstanceState)
    // Restore state members from saved instance.
    savedInstanceState?.run {
        contador = savedInstanceState.getInt("contador")
    }
}
```
:::


# Uso de vistas cruzadas

