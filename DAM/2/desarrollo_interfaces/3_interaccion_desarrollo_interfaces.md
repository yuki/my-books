
# Introducción {#introduccion-desarrollo-aplicaciones}

Durante el desarrollo de aplicaciones hay que tener en cuenta ciertas cuestiones que deben ser pensadas para asegurar que la aplicación cumple con las expectativas y la funcionalidad deseadas. De no tener en cuenta algunos de estos aspectos, la aplicación resultante puede resultar difícil de usar, no ajustarse a los objetivos previstos, contener fallos de usabilidad... Es más, todos los aspectos de una aplicación están relacionados entre sí, tal como se puede ver en este gráfico.

![Aspectro de la experiencia de usuario. [Referencia](https://www.preapps.com/blog/11-ways-how-to-market-a-dating-app-699/).](img/di/tema_3/aspectro_usabilidad.svg){width=100%}

Si simplificamos el aspectro a tener en cuenta y nos centramos sólo en las necesidades que puede tener un proyecto, los elementos a tener en cuenta para la experiencia de usuario también se simplifican, **aunque mantienen la importancia**.

En este aspecto, [Jesse James Garrett](https://en.wikipedia.org/wiki/Jesse_James_Garrett) divide los elementos que tienen relación con la experiencia de usuario en varios elementos separados en cinco capas. Aunque se hacía referencia a los sistemas web, también son válidos en aplicaciones de escritorio y móvil.

![Elementos de UX según Jesse James Garrett. [Fuente traducida](http://www.jjg.net/elements/translations/elements_es.pdf)](img/di/tema_3/elementos_experiencia_usuario.png){width=70%}

# Definiendo conceptos

Durante el desarrollo de una aplicación, en lo que se refiere a su uso, existen distinta terminología, que en algunos casos, se utilizan como sinónimos, o entre-mezclados, lo que dificulta su comprensión.


## Diseño de interacción {#diseño-interaccion}

Tal como nos dice la [wikipedia](https://es.wikipedia.org/wiki/Dise%C3%B1o_de_interacci%C3%B3n), el **diseño de interacción** (abreviado como **IxD**), está definido como "la práctica de diseñar productos digitales interactivos, entornos, sistemas, y servicios". Esta definición no sólo afecta a entornos digitales, ya que también es aplicable al mundo real.

![Error en el diseño](img/di/tema_3/interaccion.jpg){width=70% framed=true}


Podríamos resumirlo como:

- Cuáles son las acciones que el usuario tiene que realizar para llevar a cabo su objetivo al utilizar la aplicación.
- Cómo debe realizar dichas acciones.


Es importante diseñar sistemas que sean efectivos, eficientes y sencillos a la hora de utilizarlos, ya que por el contrario, por muy buena que sea nuestra aplicación, los usuarios pueden decidir no utilizarla.


::: errorbox
Si nuestra aplicación no es sencilla de utilizar, los usuarios pueden dejar de usarla.
:::

El objetivo debe ser minimizar los errores que los usuarios pueden realizar, incrementar la satisfacción del usuario, disminuir la frustración y, en definitiva, hacer más productivas las tareas que rodean a las personas y la aplicación.


## Usabilidad  {#usabilidad}

Usabilidad es un neologismo (del inglés *usability*, facilidad de uso) que se refiere a la facilidad con que las personas pueden utilizar una herramienta u objeto. En el mundo de la informática es aplicable a una aplicación, página web, máquina, proceso...

La **usabilidad** también se refiere al estudio de esas herramientas, normalmente previo o durante al desarrollo, para tratar de determinar cuál será el **grado de usabilidad** de las mismas. Para ello se realizarán **pruebas empíricas y relativas**:

- **Empírica** porque no se basa en opiniones o sensaciones, sino en pruebas de usabilidad realizadas en laboratorio u observadas mediante trabajo de campo (por ejemplo, con usuarios).
- **Relativa** porque el resultado no es ni bueno ni malo, sino que depende de las metas planteadas o de una comparación con otros sistemas similares.

::: infobox
Jakob Nielsen definió la usabilidad como el atributo de calidad que mide lo fáciles que son de usar las interfaces Web.
:::

[Jakob Nielsen](https://es.wikipedia.org/wiki/Jakob_Nielsen), en su libro *Usability Engineering (1993)*, define los cinco componentes de calidad de sus "Objetivos de Usabilidad":

- **Capacidad de aprendizaje**: ¿Cómo de fácil es para los usuarios realizar tareas básicas la primera vez que conocen el diseño?
- **Eficiencia**: Una vez que los usuarios han aprendido el diseño, ¿con qué rapidez pueden realizar tareas?
- **Memorabilidad**: Cuando los usuarios vuelven al diseño después de un período sin usarlo, ¿con qué facilidad pueden recuperar la competencia?
- **Errores**: ¿Cuántos errores cometen los usuarios, cómo de graves son estos errores y con qué facilidad pueden recuperarse de ellos?
- **Satisfacción**: ¿Cómo de agradable es utilizar el diseño?

::: infobox
Existe la norma [ISO 9241](https://en.wikipedia.org/wiki/ISO_9241) enfocada a la calidad en usabilidad y ergonomía del hardware y software.
:::


## Experiencia de usuario {#experiencia-usuario}

La experiencia del usuario (**UX**) es el conjunto de factores y elementos relativos a la interacción del usuario con un entorno o dispositivo concretos, dando como resultado una percepción positiva o negativa de dicho servicio, producto o dispositivo.

La experiencia de usuario es un concepto subjetivo, ya que junto con la interacción del usuario también pueden ir acompañadas de aspectos relativos como las emociones, los sentimientos y la transmisión de la marca...

Inicialmente la experiencia de usuario se le empezó a dar importancia en la informática durante el auge de internet y el desarrollo  páginas web.

Para diseñar una buena experiencia de usuario, debemos partir de un diseño de interacción adecuado y de un buen diseño de interfaz.

Por otro lado, la experiencia de usuario también puede verse alterada por la predisposición del usuario y su propia experiencia: tratar de utilizar una aplicación como otra parecida, 

::: infobox
Muchas aplicaciones con objetivos similares suelen tener interfaces similares para facilitar la transición de usuarios.
:::



## Interfaz de usuario {#interfaz-usuario}

La interfaz de usuario (en inglés *user interface*, **UI**) es la capa que se sitúa entre el usuario y el propio producto (da igual que sea una aplicación o algo físico).

En esta interfaz de usuario aparecerán todos los elementos con los que el usuario interactuará de manera directa. Estos elementos generarán eventos o realizarán algún tipo de actividad en el producto, que normalmente generará una salida/respuesta.


### Procesos de diseño de un interfaz de usuario {#procesos-diseño-interfaz-usuario}

El diseño de la interfaz de usuario es una disciplina asociada al diseño industrial y se enfoca en maximizar la usabilidad y la experiencia de usuario.

Antes de realizar el diseño del interfaz de usuario debemos tener claro cómo queremos que sea la interacción entre la persona que va a utilizar la aplicación y la propia aplicación.

::: errorbox
Para diseñar el interfaz, debemos tener clara la interacción humano-aplicación.
:::


Para el diseño de la interfaz deberemos tener en cuenta, al menos, los siguientes puntos:

- Elaborar una **lista de los elementos funcionales** requeridos por el sistema para que cumpla los objetivos del proyecto. Esto se realiza teniendo claro los **requisitos** del proyecto.
- **Analizar los usuarios potenciales de la aplicación y las tareas que van a realizar**. Normalmente se hace a través de un trabajo de campo estudiando la forma en la que realizan las tareas, entrevistando a los usuarios, ... Algunas de las preguntas que debemos contestar son:
  - ¿Qué querría el usuario que haga el sistema?
  - ¿Cómo encajaría el sistema en el flujo de trabajo o las actividades diarias?
  - ¿Cuán competente es el usuario técnicamente y qué sistemas parecidos ya utiliza?
  - ¿Qué estilos de aspecto y comportamiento son los preferidos del usuario?
- Es importante tener clara cómo es la **arquitectura de la información**, que es el estudio, análisis, organización, disposición, estructuración y presentación de la información.
- A la hora de diseñar interfaces, **es útil hacer uso de sistemas de prototipado** utilizando herramientas específicas para ello. En algunos casos, incluso pueden tener una funcionalidad básica.
- Ya se ha mencionado previamente, pero es importante recalcar realizar **pruebas de usabilidad**, en las que el usuario pueda expresar lo que piensa mientras utiliza la aplicación.


### Principios y requisitos de diseño de una interfaz de usuario {#principios-requisitos-interfaz}

Las características dinámicas de un sistema se describen en términos de requisitos diálogo

La norma [ISO 9241](https://en.wikipedia.org/wiki/ISO_9241) establece una serie de conceptos y elementos básicos de ergonomía que suponen un punto de partida para facilitar el diálogo entre los sistemas y las personas que usan dichos sistemas, con **definiciones de alto nivel**, **aplicaciones ilustrativas** y **ejemplos de los principios definidos**. Los principios aplicables representan los aspectos dinámicos de la interfaz y pueden considerarse, de forma general, como la "sensación" que produce la interfaz.

Tal como nos dice la [wikipedia](https://es.wikipedia.org/wiki/Dise%C3%B1o_de_interfaz_de_usuario#Principios_y_requisitos_de_dise%C3%B1o_de_una_interfaz_de_usuario), los siete principios son los siguientes:

- **Adecuación a la tarea**: el diálogo es adecuado a la tarea cuando asiste al usuario en la compleción eficaz y eficiente de la tarea.
- **Carácter autodescriptivo**: el diálogo es autodescriptivo cuando cada paso del diálogo es inmediatamente comprensible ya sea mediante la información devuelta por el propio sistema o por una explicación a solicitud del - usuario.
- C**onformidad con las expectativas del usuario**: el diálogo es conforme con las expectativas del usuario cuando es consistente y se ajusta a las características del usuario, tales como conocimiento de la tarea, - educación, experiencia, y otros convenios comúnmente aceptados.
- **Adecuación al aprendizaje**: el diálogo es adecuado al aprendizaje cuando ofrece soporte y guía para que el usuario aprenda a utilizar el sistema.
- **Controlabilidad**: el diálogo es controlable cuando el usuario es capaz de iniciar y controlar la dirección y ritmo de la interacción hasta el punto en el que la tarea ha sido completada.
- Tolerancia a errores: el diálogo es tolerante a errores si, con independencia de que haya errores de la entrada, el resultado pretendido puede ser alcanzado sin acción necesaria por parte del usuario, o con una acción - mínima.
- Personalizable: el diálogo es personalizable cuando la interfaz de software puede ser modificada para ajustarse a las necesidades de la tarea, preferencias individuales, y habilidades del usuario.


En cuanto a la **presentación de la información**, cómo se organiza en la aplicación, la visualización de los objetos y la codificación de la información, también se tiene que tener en cuenta varios puntos:

- **Claridad**: el contenido de la información es presentado de forma rápida y precisa.
- **Discriminabilidad**: la información visualizada puede ser distinguida de forma precisa.
- **Concisión**: los usuarios no son sobrecargados con información irrelevante.
- **Consistencia**: el diseño es único y conforme a las expectativas del usuario.
- **Detectabilidad**: la atención del usuario es dirigida hacia la información necesaria.
- **Legibilidad**: la información es fácil de leer.
- **Comprensibilidad**: el significado es claramente inteligible, no ambiguo, interpretable y reconocible.

