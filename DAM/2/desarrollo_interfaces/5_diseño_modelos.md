
# Diseño de modelos conceptuales {#diseño-modelos-conceptuales}

Tras la toma de requisitos es el momento de analizarlos y realizar los correspondientes diseños conceptuales. Estos modelos son la base para posteriormente comenzar con la programación.

Tal como nos dice [Wikipedia](https://es.wikipedia.org/wiki/Modelo_conceptual), **un modelo conceptual es una representación de un sistema**, hecho de la composición de conceptos que se utilizan para ayudar a las personas a conocer, comprender o simular un tema que representa el modelo, incluye las entidades importantes y las relaciones entre ellos.

El objetivo principal de un modelo conceptual es transmitir los principios fundamentales y la funcionalidad básica del sistema que representa. Además, debe desarrollarse de tal manera que proporcione una interpretación del sistema fácilmente comprensible para los usuarios del modelo.

Los modelos conceptuales tienen como objetivos fundamentales:

1. Mejorar la comprensión individual del sistema representativo.
2. Facilitar la transmisión eficiente de los detalles del sistema entre las partes interesadas.
3. Proporcionar un punto de referencia para los diseñadores de sistemas para extraer las especificaciones del sistema.
4. Documentar el sistema para futuras referencias y proporcione un medio para la colaboración.


Entre los tipos de modelos que nos podemos encontrar, podemos destacar:

- Diagramas de estructura
  - Diagramas de clases
  - Diagrama de datos
  - Diagramas de componentes
  - Diagramas de despliegue
- Diagramas de comportamiento e interacción
  - Diagramas de actividades
  - Diagramas de casos de uso
  - Diagramas de estado
  - Diagramas de secuencia

A continuación se detallan algunos de ellos.

## Diseño conceptual de datos {#diseño-datos}

Para la realización del diseño conceptual de datos, lo más habitual suele ser utilizar el conocido "**modelo Entidad-Relación**" que es utilizado para posteriormente realizar el diseño lógico, y finalmente el diseño físico de base de datos. Esto siempre que necesitemos un sistema de base de datos relacional.

El modelo de datos suele ser la parte fundamental de muchos tipos de aplicaciones, por lo que la toma de requisitos debe de haber sido correcta, y la creación del diseño del modelo de datos también.

::: infobox
El diseño conceptual del modelo de datos, junto con los requisitos de datos, es una parte fundamental de muchas aplicaciones.
:::


## Diagramas de caso de uso {#diseño-casos-uso}

Los diagramas de caso de uso **describen una funcionalidad**, que combina la interacción entre un usuario y un sistema, formando una secuencia de eventos.

La descripción del caso de uso se centra en qué se va a realizar, pero no en la manera en la que se va a hacer a nivel técnico. Debe usarse expresiones precisas, para evitar confusión, por lo que se busca sencillez y claridad.

Por ejemplo, a continuación dos ejemplos de cómo se podría representar el registro de un usuario y la autenticación en un sistema, haciendo uso de diagramas de caso de uso:

::::::::::::::: {.columns}
:::: {.column width="10%"}
::::
:::: {.column width="30%"}
![](img/di/tema_5/registro.png){width=100%}
::::
:::: {.column width="48%"}
![](img/di/tema_5/autenticar.png){width=100%}
::::
:::: {.column width="10%"}
::::
:::::::::::::::

Tal como se puede ver, son diagramas abstractos que muestran de forma sencilla la acción a realizar.


## Mapa de navegación {#mapa-navegacion}

Teniendo en cuenta los distintos diagramas de comportamiento e interacción que hayamos obtenido, el siguiente paso es el de realizar la topología de la aplicación y los caminos entre las distintas funcionalidades que tendrá. El resultado obtenido será el del **mapa de navegación de la aplicación**.


![Mapa de navegación de una web de recetas](img/di/tema_5/mapa_de_navegacion.png){width=95%}


El mapa de navegación de una aplicación, o una web, nos debe proporcionar una descripción general, y condensada, de los enlaces entre las principales áreas de contenido.


## Prototipos {#prototipos}

A medida que los pasos anteriores se van realizando, en paralelo se puede ir realizando el análisis de cómo queremos que sea la aplicación, en lo que se refiere al aspecto visual y el diseño del interfaz.

En los primeros pasos, se pueden realizar **bocetos en papel** o en aplicaciones, sin demasiado detalle, para acompañar a los distintos diseños que se han visto previamente. Estos bocetos pueden empezar a formar una idea genérica de cómo será la aplicación.


Para realizar modelos más concretos, y más cercanos a la realidad, se hace uso de **sistemas de prototipos**, que son un modelo (representación, demostración o simulación) fácilmente ampliable y modificable. Las características que suelen tener:

- Suelen contar con interfaz de usuario.
- Pueden tener funcionalidad de entrada y salida, así como de navegación.
- Existen distintas herramientas con las que realizarlos.
- Pueden tener distinto nivel de detalle.
- El cliente es capaz de entender lo que ve, por lo que es una manera de obtener *feedback* de manera rápida.
- Nos puede mostrar aspectos imprevistos no analizados en etapas anteriores. Por lo tanto, ayuda a mejorar y concretar las especificaciones de requisitos.



