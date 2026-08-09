
# Principios básicos {#introducción-principios-básicos}

Diseñar una interfaz web no consiste únicamente en elegir unos colores atractivos o utilizar una tipografía moderna. Un buen diseño debe facilitar que el usuario encuentre la información rápidamente, comprenda cómo utilizar la aplicación y pueda realizar sus tareas sin esfuerzo.

A principios del siglo XX, un grupo de psicólogos alemanes comenzó a estudiar cómo las personas perciben las formas y organizan la información visual. Sus investigaciones dieron lugar a la **[Psicología de la Gestalt](https://es.wikipedia.org/wiki/Psicolog%C3%ADa_de_la_Gestalt)**, una corriente que sostiene que nuestro cerebro no interpreta cada elemento de forma aislada, sino que intenta organizarlos para formar un conjunto coherente.

La palabra **Gestalt** puede traducirse como *forma*, *configuración* o *estructura*. Uno de sus principios fundamentales afirma que: **"El todo es más que la suma de sus partes."**

Aunque estas [leyes](https://es.wikipedia.org/wiki/Leyes_de_la_Gestalt) fueron formuladas mucho antes de la aparición de Internet, siguen siendo una referencia imprescindible para el diseño de interfaces, ya que ayudan a comprender cómo los usuarios interpretan una página web de forma casi inconsciente.

Estos principios no son reglas estrictas, sino recomendaciones que, en la mayoría de los casos, mejoran la calidad del diseño.


## Diseñar para las personas {#diseñar-para-personas}

Cuando se desarrolla una aplicación web es habitual cometer un error: diseñarla pensando en el desarrollador en lugar de en el usuario.

Un desarrollador conoce perfectamente el funcionamiento de la aplicación, dónde se encuentra cada opción y qué significa cada botón. Sin embargo, un usuario la verá por primera vez y no tendrá esos conocimientos.

Por este motivo, el diseño debe centrarse siempre en facilitar el trabajo al usuario.

Antes de añadir un nuevo elemento a una interfaz conviene hacerse preguntas como:

- ¿Es realmente necesario?
- ¿El usuario comprenderá su función?
- ¿Existe una forma más sencilla de realizar esta tarea?
- ¿Puede eliminarse sin perder funcionalidad?

Un diseño sencillo suele ser más fácil de aprender y utilizar que uno excesivamente complejo.


## Simplicidad {#simplicidad}

Uno de los principios más importantes del diseño consiste en eliminar todo aquello que no aporte valor. Cada botón, icono, imagen o texto debe tener una finalidad.

Una pantalla llena de elementos produce el efecto contrario al deseado:

- Dificulta la lectura.
- Aumenta el tiempo necesario para encontrar la información.
- Genera sensación de desorden.
- Incrementa la probabilidad de cometer errores.

En muchas ocasiones, mejorar una interfaz consiste en **eliminar elementos**, no en añadir más.

::: infobox
Si hay dudas si un elemento es necesario, prueba a ocultarlo temporalmente. Si la aplicación sigue funcionando correctamente y resulta más sencilla de utilizar, probablemente ese elemento sobra.
:::

## Consistencia {#consistencia}

La consistencia hace referencia a mantener el mismo estilo y comportamiento en toda la aplicación. Los usuarios aprenden rápidamente cómo funciona una interfaz. Si cada pantalla utiliza un diseño diferente, deberán volver a aprender continuamente cómo interactuar con ella. Por ejemplo:

- Todos los botones principales deberían tener el mismo color.
- Los enlaces deberían presentar siempre el mismo estilo.
- Los formularios deberían seguir la misma estructura.
- Los mensajes de error deberían aparecer siempre de la misma forma.

Una interfaz consistente transmite profesionalidad y facilita el aprendizaje.


## Contraste {#contraste}

El contraste permite distinguir fácilmente los distintos elementos de la interfaz. Puede lograrse mediante:

- Color.
- Tamaño.
- Forma.
- Grosor de la tipografía.
- Espaciado.

El contraste también es esencial para la accesibilidad. Un texto gris claro sobre un fondo blanco puede resultar prácticamente ilegible para muchas personas.

## Jerarquía visual {#jerarquía-visual}

No toda la información tiene la misma importancia. La jerarquía visual consiste en organizar los elementos para que el usuario identifique rápidamente qué debe mirar primero. Podemos crear jerarquía utilizando:

- Tipografía y tamaño de la fuente.
- Color.
- Posición y espaciado.

Al abrir una página, el usuario debería comprender inmediatamente cuál es el contenido principal.

De la misma manera, los elementos relacionados deben situarse próximos entre sí. Cuando varios elementos aparecen separados por grandes espacios, el usuario interpreta que pertenecen a grupos distintos.


## Alineación {#alineación}

Similar al caso anterior, la alineación proporciona orden y limpieza visual. Todos los elementos deberían seguir una estructura común. Incluso cuando el usuario no es consciente de ello, una mala alineación produce sensación de desorden.

## Repetición {#repetición}

La repetición consiste en reutilizar los mismos elementos visuales a lo largo de toda la aplicación, ya que ayuda al usuario a reconocer rápidamente los distintos componentes. Entre los elementos que se deberían repetir están los colores, tipografías, iconos, estilos de botones/alertas/avisos, márgenes ...

Actualmente esta repetición suele implementarse mediante **sistemas de diseño** (*Design Systems*) y utilizando variables, que estudiaremos más adelante.

## Espacio en blanco {#espacio-blanco}

El espacio en blanco (también llamado *white space*) no es un espacio desperdiciado. Su función es permitir que la información respire. "*White space* no hace referencia al color, si no a zonas libres de contenido. Un diseño con suficiente espacio resulta:

- Más limpio.
- Más elegante.
- Más fácil de leer.
- Menos agotador.

Por el contrario, cuando todos los elementos aparecen demasiado juntos, el usuario necesita un mayor esfuerzo para localizar la información.


## Equilibrio {#equilibrio}

Una interfaz equilibrada distribuye correctamente los elementos dentro de la pantalla. No significa que todo deba ser perfectamente simétrico. Existen dos tipos de equilibrios:

- **Equilibrio simétrico**: Ambos lados presentan una distribución similar.
  - Estabilidad.
  - Formalidad.
  - Orden.
- **Equilibrio asimétrico**: Los elementos tienen tamaños distintos, pero mantienen un equilibrio visual.
  - Dinamismo.
  - Modernidad.
  - Creatividad.

Actualmente muchos diseños modernos utilizan composiciones asimétricas.


## Escala y proporción {#escala-proporción}

La escala hace referencia al tamaño relativo de los elementos. Los elementos más importantes suelen ser más grandes. Por ejemplo:

- El logotipo suele ser mayor que un enlace.
- El título suele ser mayor que un párrafo.
- El botón principal suele destacar respecto al resto.

El tamaño ayuda al usuario a identificar rápidamente la información más relevante.

## Color {#color}

El color constituye uno de los recursos más importantes del diseño. Puede utilizarse para:

- Llamar la atención.
- Organizar información.
- Diferenciar categorías.
- Transmitir emociones.
- Guiar al usuario.

Por ejemplo:

- Verde → éxito.
- Rojo → error.
- Azul → confianza.
- Amarillo → advertencia.

No obstante, estos significados pueden variar entre culturas. También es importante no utilizar únicamente el color para transmitir información, ya que las personas con dificultades para distinguir determinados colores podrían no comprender el mensaje.

## Tipografía {#tipografía}

Elegir una tipografía adecuada mejora enormemente la legibilidad. Una buena tipografía debe ser **clara**, fácil de leer, consistente y adecuada al contexto.

En interfaces web modernas suelen utilizarse tipografías **sans-serif**, ya que ofrecen una excelente **legibilidad** en pantalla. También conviene limitar el número de tipografías, ya que utilizar muchas tipografías diferentes produce sensación de desorden.

![Tipografía Serif arriba y Sans Serif abajo](img/diw/serif-vs-sans-serif.svg){width="50%"}

Otros aspectos a tener en cuenta son el tamaño, el espaciado entre líneas, así como la longitud de las mismas y los márgenes que tenemos con otros contenidos.


## Retroalimentación (*Feedback*) {#retroalimentación}

Cada vez que el usuario realiza una acción, la interfaz debe responder, ya que si una aplicación no proporciona retroalimentación, el usuario puede pensar que no ha funcionado correctamente. Por ejemplo al enviar un formulario:

- Se informa de que los datos se están procesando.
- Se muestran los errores encontrados.
- Se confirma el envío correcto.


## Tolerancia a errores {#tolerancia-a-errores}

Los usuarios cometen errores constantemente, y normalmente el desarrollador no ha pensado en todos ellos. Una buena interfaz debe tratar de:

- Evitarlos.
- Detectarlos.
- Facilitar su corrección.

## Accesibilidad desde el diseño {#accesibilidad-desde-diseño}

La accesibilidad no consiste únicamente en añadir atributos HTML, debe estar presente desde el inicio del diseño. Diseñar pensando en la accesibilidad beneficia a todos los usuarios.

::: infobox
Diseñar pensando en la accesibilidad beneficia a todos los usuarios.
:::


# Leyes de la Gestalt {#leyes-gestalt}

Ya se han nombrado a estas [leyes de Gestalt](https://es.wikipedia.org/wiki/Leyes_de_la_Gestalt) en el anterior apartado, y aunque varias ya se han explicado también, sirva el siguiente listado (obtenido de la [Wikipedia](https://es.wikipedia.org/wiki/Leyes_de_la_Gestalt) como descripción resumida de todas ellas:

- **Ley del Contraste**: Una forma es mejor percibida cuanto mayor sea contraste entre el fondo y la figura.
- **Ley de Jerarquización**: Una forma es mejor percibida cuanto más principal y menos accesoria la mente la interprete.
- **Ley de Birkhoff**: Una forma es mejor percibida cuantos más ejes tenga.
- **Ley de Memoria**: Una forma es mejor percibida cuantas más veces haya sido vista.
- **Ley del Cierre**: Una forma es mejor percibida cuanto más cerrada sea. Si un contorno no está completamente cerrado, la mente tiende a cerrarlo.
- **Ley de la Continuidad**: Una forma es mejor percibida cuanto más continua sea. Si el patrón se rompe, la mente tiende a continuarlo.
- **Ley de la Proximidad**: Los elementos aislados, pero con cierta cercanía, tienden a ser considerados como grupos.
- **Ley de la Simetría**: Los elementos aislados, pero con cierta simetría, tienden a ser considerados como grupos.
- **Ley de la Semejanza**: Los elementos aislados, pero con cierta semejanza, tienden a ser considerados como grupos.
- **Ley del Movimiento Común**: Los elementos aislados, pero con movimiento común, tienden a ser considerados como grupos.
- **Ley de Invariancia Topológica**: Una buena forma resiste a las deformaciones a las que sea sometida.
- **Ley de Enmascaramiento**: Una buena forma resiste a las perturbaciones a las que sea sometida.

Los siguientes dibujos (obtenidos de la [Wikipedia](https://es.wikipedia.org/wiki/Leyes_de_la_Gestalt)) explican algunas de las leyes de forma visual.

:::::::::::::: {.columns }
::: {.column width="30%"}
![Ley del cierre](img/diw/Gestalt_closure.svg){width="100%"}

:::
::: {.column width="30%" }
![Ley de semejanza](img/diw/Gestalt_similarity.svg){width="100%"}

:::
::: {.column width="30%" }
![Ley de la proximidad](img/diw/Gestalt_proximity.svg){width="100%"}

:::
::::::::::::::


# Principales leyes de UX {#leyes-ux}

Además de los principios de diseño visual, existen diversas leyes relacionadas con el comportamiento de los usuarios.

Estas leyes proceden de la psicología, la ergonomía y la interacción persona-ordenador, y ayudan a diseñar interfaces más cómodas y eficientes.

## Ley de Fitts {#ley-fitts}

:::::::::::::: {.columns }
::: {.column width="70%"}
La **[Ley de Fitts](https://es.wikipedia.org/wiki/Ley_de_Fitts)** establece que el tiempo necesario para pulsar un elemento depende principalmente de dos factores: su tamaño y la distancia hasta él.

En otras palabras:

- Los botones grandes son más fáciles de pulsar.
- Los botones cercanos requieren menos tiempo.

:::
::: {.column width="27%" }
![Ley de Fitts: borrador del tamaño del objetivo W y distancia al objetivo D](img/diw/Fitts_Law.svg){width="100%"}

:::
::::::::::::::


## Ley de Hick {#ley-hick}

La [Ley de Hick](https://es.wikipedia.org/wiki/Ley_de_Hick) afirma que: 

::: citationbox
[Ley de Hick]{.solution}

Cuantas más opciones tenga una persona, más tiempo necesitará para tomar una decisión.
:::

::: questionbox
¿Os pasa esto en la vida real? Ejemplos: restaurantes, seleccionar película en servicios de streaming, elegir un electrodoméstico/ordenador,...
:::

Por ello conviene evitar menús con decenas de opciones al mismo nivel. Es preferible:

- Agrupar opciones.
- Utilizar categorías.
- Mostrar únicamente las acciones necesarias.

## Ley de Jakob {#ley-jakob}

[Jakob Nielsen](https://es.wikipedia.org/wiki/Jakob_Nielsen) formuló una de las leyes más conocidas de la experiencia de usuario:

::: citationbox
[Jakob Nielsen]{.solution}

Los usuarios pasan la mayor parte de su tiempo utilizando otras páginas web
:::

Como consecuencia, esperan que todas funcionen de manera parecida. Por ejemplo, la mayoría de usuarios espera encontrar:

- El logotipo en la esquina superior izquierda.
- El menú principal en la parte superior.
- El carrito de compra en la esquina superior derecha.
- El pie de página al final del sitio.

Romper estas convenciones únicamente por originalidad suele perjudicar la usabilidad.


## Ley de Miller {#ley-miller}

[George Miller](https://en.wikipedia.org/wiki/George_Armitage_Miller) propuso que la memoria a corto plazo puede manejar un número limitado de elementos simultáneamente. Aunque investigaciones posteriores han matizado esta cifra, el principio sigue siendo válido: **no conviene presentar demasiada información al mismo tiempo**.

Por ello es recomendable:

- Dividir formularios largos en varios pasos.
- Agrupar información.
- Utilizar títulos y subtítulos.


## Efecto Von Restorff {#efecto-von-restorff}

También conocido como **efecto de aislamiento**, afirma que un elemento diferente al resto llama inmediatamente la atención. Por ejemplo: si todos los botones son grises excepto uno azul, el usuario lo localizará rápidamente.

Este principio suele utilizarse para destacar:

- Botones de compra.
- Promociones.
- Avisos importantes.
- Llamadas a la acción (*Call to Action* o CTA).

Sin embargo, si todos los elementos intentan destacar al mismo tiempo, ninguno lo conseguirá.


## Regla del pico y el final {#regla-pico-final}

Las personas recuerdan principalmente:

- El momento más intenso de una experiencia.
- El final de dicha experiencia.

En una aplicación web esto implica que conviene cuidar especialmente:

- El proceso de registro.
- El proceso de compra.
- El mensaje final de confirmación.


::: infobox
Un proceso agradable termina dejando una mejor impresión general.
:::


## Ley de Tesler {#ley-tesler}

También conocida como la **Ley de conservación de la complejidad**, afirma que toda aplicación posee una cierta complejidad inevitable, por lo que el diseñador debe procurar que esa complejidad recaiga sobre el sistema y no sobre el usuario.

Por ejemplo, en lugar de obligar al usuario a introducir manualmente su provincia, la aplicación puede rellenarla automáticamente a partir del código postal.


## Principio de Pareto {#principio-pareto}

Con frecuencia, aproximadamente **el 80 % del uso de una aplicación se concentra en un 20 % de sus funciones**, por ello conviene destacar aquellas herramientas que realmente utilizan la mayoría de los usuarios.

Las funciones menos frecuentes pueden mantenerse accesibles, pero sin ocupar un lugar protagonista en la interfaz.


## No obligues al usuario a pensar {#usuario-no-pensar}

Uno de los libros más influyentes sobre usabilidad es *Don't Make Me Think*, de [Steve Krug](https://en.wikipedia.org/wiki/Steve_Krug), en el que la idea principal se puede resumir en: 

::: infobox
Una buena interfaz debe ser tan evidente que el usuario no tenga que detenerse a pensar qué debe hacer.
:::

Cada vez que un usuario duda:

- pierde tiempo;
- aumenta la probabilidad de cometer errores;
- disminuye su satisfacción.

Por ello, las interfaces deben ser intuitivas y aprovechar patrones de diseño que resulten familiares.

