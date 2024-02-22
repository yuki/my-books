
# Interfaces con Android UI {#interfaces-con-android-ui}

A la hora de crear interfaces para dispositivos Android a través de Android Studio estos son generados a través de ficheros [XML](https://es.wikipedia.org/wiki/Extensible_Markup_Language). Para el correcto funcionamiento y compilación del proyecto, estos ficheros deben de cumplir con el estándar XML y ser ficheros válidos.

::: errorbox
**¡Cuidado a la hora de tocar los ficheros si los editamos a mano!**
:::

Estos ficheros se encuentran por defecto en la ruta [src/main/res/layout]{.configdir} de nuestro proyecto. No es habitual editar estos ficheros fuera de Android Studio, pero hay que tener en cuenta dónde se almacenan.

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

A la hora de crear nuestro interfaz Android Studio tiene una serie de componentes que podremos utilizarlos diréctamente arrastrando los componentes al interfaz.

Debe quedar claro que cada uno de ellos contará con sus características propias, por lo que es importante hacer uso de la [documentación oficial](https://developer.android.com/reference/android/widget/EditText) a la hora de utilizar cada uno de ellos.

![](img/di/tema_2/componentes.png){width="30%"}


## Layouts y constraints {#layouts-y-constraints}

Con la vista inicial, si seleccionamos el texto "Hello World!" veremos que tiene una configuración en el apartado ***Layout*** como el siguiente:


![](img/di/tema_2/constraints.png){width="30%"}


Se pueden identificar 4 *constraints* que hacen referencia a los distintos puntos del componente:

-   ***Start***: Lado izquierdo del componente.

-   ***End***: Lado derecho del componente.

-   ***Top***: Parte superior del componente.

-   ***Bottom***: Parte inferior del componente.

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
Los atributos "**layout_editor**" sólo sirven para la vista del editor, no para la vista final. **Para colocar los elementos en su posición correcta hay que usar los constraints**.
:::

Es por eso, que para cada componente que queramos añadir a la vista deberá tener sus *constraints* haciendo referencia a otros componentes o al *layout* que lo contiene. En caso de que no hayamos añadido uno, o algo en la vista no sea correcto, nos aparecerá en el interfaz:

![](img/di/tema_2/error_constraints.png){width="40%"}

Los componentes pueden estar asociados a otros componentes, pero no tienen por qué estar asociados entre ellos. Por ejemplo, la siguiente vista tiene a nivel horizontal podemos apreciar lo siguiente:

-   El texto "Hello World" está asociado a ambos lados del layout que lo contiene, y por eso aparece centrado.

-   El componente con texto "Hello3" es más ancho que el texto que lo contiene (atributo ***layout_width***). En el lado izquierdo está asociado al otro componente mientras que en el lado derecho a la vista, haciendo que quede horizontalmente entre ambos.

![](img/di/tema_2/ejemplo_constraints.png){width="30%" framed=true}


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
::: {.column width="20%"}
![](img/di/tema_2/calculadora_ios.png){width="100%"}
:::
::: {.column width="40%" }
![](img/di/tema_2/calculadora_ios_landscape.png){width="100%"}
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

# Dando funcionalidad al interfaz {#dando-funcionalidad-al-interfaz}

Aunque no se va a ahondar en cómo programar para Android, se va a añadir un pequeño ejemplo para entender cómo funciona un botón y un texto y cómo interactuar entre sí.

La idea es:

-   Crear un interfaz con un botón y un TextView.

-   Al pulsar el botón, el texto original del TextView desaparece y se incrementa en 1 para saber el número de pulsaciones que se han realizado.

Teniendo esto en cuenta, el código del fichero **MainActivity.kt** debería quedar de la siguiente manera:

::: mycode
[Código Kotlin para hacer funcionar un botón]{.title}

```kotlin
package com.example.prueba

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import android.widget.TextView

class MainActivity : AppCompatActivity() {

    var contador:Int = 0

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

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
**¿Qué sucede con los datos si rotamos la pantalla?**
:::

El contenido del texto de la vista se resetea al rotar el dispositivo. Es decir, **cualquier posible contenido que hubiese en ellos se pierde**. Esto es debido a que el ***Activity*** de la vista se destruye y se vuelve a crear en el nuevo estado de la pantalla.

::: errorbox
**Al rotar el dispositivo el \textit{Activity} entra en un ciclo de destrucción-creación**
:::


# Ciclo de vida del *Activity* en Android {#ciclo-de-vida-del-activity-en-android}

Es importante conocer qué sucede al rotar el dispositivo, y qué sucede con la vista y con los componentes que tenemos en primer plano.

Existen distintas funciones dentro del ciclo de vida de un ***Activity***, que serán llamadas por el sistema cada vez que se entre en cada uno de estos estados:

-   onCreate()

-   onStart()

-   onResume()

-   onPause()

-   onStop()

-   onDestroy()

En el siguiente esquema (y en la web oficial de la [documentación](https://developer.android.com/guide/components/activities/activity-lifecycle#alc)) se puede apreciar los estados y sus transiciones:


![Esquema del "*Activity-lifecycle*". Fuente: [Documentación oficial](https://developer.android.com/guide/components/activities/activity-lifecycle)](img/di/tema_2/activity_lifecycle.png){width="80%"}


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
