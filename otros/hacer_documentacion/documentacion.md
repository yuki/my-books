
# Introducción {#introducción}

En nuestra vida laboral vamos a realizar proyectos que consistirán en buscar soluciones a problemas y que conllevará una serie de tareas técnicas que tendremos que realizar: configurar una red de ordenadores, modificar una aplicación web, crear una aplicación móvil, analizar una infraestructura y proponer mejoras\...

Junto a ese proyecto lo más habitual es que se acompañe de una documentación del proyecto realizado, en el que se deberá explicar la toma de requisitos por parte del cliente, el análisis realizado de los mismos, cuáles han sido las decisiones tomadas al realizar el proyecto y por qué y cómo se ha realizado el propio proyecto en sí mismo.

Aunque hayamos leído documentación en internet, como no estamos acostumbrados a realizar nuestra propia documentación, cuando comenzamos a crear documentación propia el resultado final que obtenemos no suele ser el adecuado.

Es por eso que en este documento se van a dar una serie de consejos y pautas para realizar una buena documentación.

# Lenguaje formal/técnico {#lenguaje-formaltécnico}

:::::::::::::: {.columns }
::: {.column width="68%"}
Aunque pueda parecer obvio, en las documentaciones no se puede utilizar un lenguaje coloquial, por lo que debemos **escribir siempre desde un punto de vista técnico**.

**Se debe utilizar lenguaje formal** y cuando hagamos referencia a opiniones, pensamientos o decisiones **se hará uso del plural mayestático**.

De esta manera se evita que la persona que escribe sea la que dé su opinión, ya que lo habitual es que detrás del proyecto hay un grupo de profesionales que respaldan las decisiones tomadas, que se ha tenido en cuenta la opinión de otros profesionales, o que ha sido supervisado.
:::
::: {.column width="28%" }
![\ ](img/documentacion/debian.png){width="100%"}
:::
::::::::::::::


::: infobox
**Creemos que la solución realizada en este proyeto es la adecuada porque ...**
:::



Cuando se haga uso de opiniones o se indique unos ajustes "**mejores que otros**" siempre deben llevar su justificación asociada para que se entienda el por qué de la elección realizada.

::: errorbox
**Por supuesto, es muy importante que el documento no cuente con faltas de ortografía, frases inacabadas, inconexas, ...**
:::

# Formato del documento {#formato-del-documento}

Aunque inicialmente pueda parecer sencillo, el estilo del documento puede resultar lo más difícil de realizar, por lo que tenemos que seguir una serie de consejos, que se expondrán a continuación, pero que no tienen por qué ser los únicos.

## Letra, sangrías y ajustes del documento {#letra-sangrías-y-ajustes-del-documento}

Hoy en día, la mayoría de editores de texto **WYSIWYG** (del inglés "*What You See Is What You Get*", lo que ves es lo que obtienes), como pueden ser Microsoft Word, LibreOffice o Google Docs, tienen unas opciones por defecto que hace que los documentos queden visualmente atractivos y que en principio no tengamos que modificar muchas cosas.

Aún así, modificar estas preferencias es sencillo y puede hacer que el documento quede visualmente más atractivo, más personalizado, diferenciándose del resto de documentos, y que mejoren la primera impresión del lector.

::: infobox 
**En las empresas se suelen crear plantillas personalizadas, con el logotipo de la empresa, colores corporativos, tipos de letra utilizados en el logo, ...**
:::

Tal como se puede ver en este mismo documento, el interlineado y la separación entre párrafos facilita la lectura del mismo, por lo que debería ser una configuración a ajustar.

![\ ](img/documentacion/libreoffice.png){width="70%"}

Cada editor de texto tiene unos ajustes que se pueden modificar, por lo que es recomendable dedicar un tiempo para entender las distintas configuraciones que ofrece. En la imagen superior se puede ver la configuración que ofrece [Libreoffice](https://es.libreoffice.org/).

**Es importante modificar los ajustes en el propio estilo** y no ir título a título o párrafo a párrafo. Si queremos que todos los "Título 1" sean de color verde y tamaño 15 debemos editar ese estilo. Si luego decidimos que pasen a ser de color azul y tener otra fuente, con cambiar el estilo nos modificará todos los títulos de manera automática, sin tener que perder el tiempo en ir modificando todos a mano.

::: errorbox
**Debemos modificar las configuraciones de los estilos, para así aplicar a todo texto que sea de ese estilo en el documento. No ir párrafo a párrafo o título a título**
:::

### Aspecto visual general {#aspecto-visual-general}

Tal como se puede apreciar en este documento, no hacen falta grandes florituras para que un documento quede atractivo a la vista y sea sencillo de leer.

:::::::::::::: {.columns }
::: {.column width="25%"}
![\ ](img/documentacion/debian.png){width="75%"}
:::
::: {.column width="70%" }
**Hay que tener ojo crítico con nuestros propios documentos** y realizar una comparación entre el trabajo realizado y otros documentos que hayamos visto.

Si nuestro documento no tiene las características exigidas, o a nosotros mismos nos parece que no resulta atractivo, **no es raro pensar que al profesor que lea el documento tampoco le guste**.
:::
::::::::::::::

El aspecto visual puede cambiar la predisposición del lector, ayudando a que la lectura sea más agradable y sencilla. Y al contrario, puede predisponer a no querer seguir leyendo y terminar cuanto antes el documento.

::: errorbox
**La primera impresión del documento puede hacer que al docente que lo corrija le predisponga para bien o para mal.**
:::

## Cabecera, pie de página y números de página {#cabecera-pie-de-página-y-números-de-página}

Es recomendable añadir el número de página en el documento, ya que facilita saber en qué parte del documento nos encontramos, para de esta manera poder hacer referencia a una página concreta. Normalmente el número de página suele aparecer en el pie de página, como se ha hecho en este documento.

Aparte, se debe añadir el título del documento, el nombre de la empresa o alguna referencia general en el pie de página o en la cabecera. Es importante es que en estos apartados el tamaño de letra utilizado sea menor al del texto general y que haya la suficiente separación como para que no se mezcle con el texto.

::: warnbox
**En la cabecera y en el pie de página el tamaño de letra debe ser menor, para que no se confunda con el propio texto.**
:::

Una vez más, se recomienda ser crítico con lo realizado, comprobar que el aspecto visual general de lo realizado es acorde y facilita la lectura.

## Imágenes y su composición {#imágenes-y-su-composición}

En los documentos en los que hay que añadir imágenes hay que tener en cuenta cómo se va a realizar la composición, el tamaño de las imágenes y dónde situarlas.

### Tamaño y posicionamiento {#tamaño-y-posicionamiento}

Dependiendo de la imagen que queramos utilizar, podríamos ajustarla al centro, ocupando gran parte de la zona central del documento, como ya hemos visto más arriba, o como es el ejemplo que se muestra a continuación.

![\ ](img/documentacion/debian.svg){width="70%"}

En este caso es el nombre de la distribución [Debian](https://www.debian.org/), pero anteriormente hemos visto una captura de pantalla de un programa. Las imágenes deben tener el tamaño adecuado para ver el contenido de las mismas.

### Explicación sobre las imágenes {#explicación-sobre-las-imágenes}

A lo largo de este documento se han añadido ciertas imágenes que se han puesto de distintos tamaños tanto a la izquierda como a la derecha de párrafos.

Estas imágenes han sido un mero ejemplo de cómo se pueden poner imágenes que acompañan al párrafo, **siempre dentro de los márgenes del documento y dejando espacio al texto**. Las imágenes no deben de estar pegadas al texto por ningún margen.

::: errorbox
**Toda imagen que sea añadida al documento debe llevar consigo una explicación.**
:::

En el caso de las imágenes que están situadas al lado de los párrafos, los párrafos harán referencia a las imágenes. En el caso de imágenes centradas, lo ideal es que antes antes de la misma se detalle a qué hace referencia.

Por ejemplo:

> En LibreOffice podemos modificar todos los estilos yendo al menú del párrafo yendo al menú "Estilos --\> Gestionar estilos", y desde ahí seleccionar el que nos interese modificar. Por ejemplo, el "**Cuerpo de texto**":

![\ ](img/documentacion/libreoffice.png){width="70%"}

Tal como se puede ver, se ha realizado una pequeña introducción a lo que se quiere explicar para posteriormente añadir una imagen explicativa del resultado obtenido.

### Recorte de imágenes {#recorte-de-imágenes}

Cuando en una imagen queremos hacer referencia a algo en concreto, lo ideal es no poner la captura de pantalla del escritorio completo, sino sólo realizar la captura a la ventana de la que estamos hablando.

![\ ](img/documentacion/recortes.png){width="40%"}


Para ello la aplicación "Herramienta de Recortes" de Windows permiten hacer un recorte perfecto de la ventana que seleccionemos, tal como se puede ver en la imagen anterior, seleccionando el modo. De esta manera obtendremos sólo la ventana que nos interesa, evitando hacer un mal recorte, y conseguiremos que **la atención se centre sobre lo que es realmente importante**.

Si queremos concretar algo dentro de una imagen, es recomendable bordear esa sección de un color (rojo, por ejemplo) para que sea más apreciable. En algunos casos también podría añadirse una pequeña flecha para mostrar la opción.

A la hora de tener capturas de pantalla de ciertas ventanas, o recortadas, puede ser conveniente añadir un pequeño borde, ya que en los escritorios actuales las ventanas hacen uso de fondo blanco y no se vería de manera correcta con el fondo blanco del documento.

A continuación se visualiza la misma imagen con y sin borde:


:::::::::::::: {.columns }
::: {.column width="43%"}
![\ ](img/documentacion/captura.png){width="100%"}
:::
::: {.column width="43%" }
![\ ](img/documentacion/captura.png){width="100%" framed=true}
:::
::::::::::::::

Como se puede apreciar, la imagen que no tiene borde hace un efecto de "recorte brusco", mientras que con el borde se ve claramente que es una sección recortada.

::: infobox
**Es recomendable poner un borde a las capturas de ventanas**
:::

# Referencias {#referencias}

En todo documento pueden (y deben) existir referencias a otra documentación, o texto copiado y/o adquirido de varias fuentes, y en caso de ser así debe de ser referenciado.

```{=latex}
\vspace{-10pt}
```
> "Las referencias a otras obras son una parte muy importante en la literatura de muchas profesiones; cada una de ellas ha diseñado su propia manera de incluir esta información en el texto, y estas han dado lugar a formatos estandarizados de cita." (Fuente: [Wikipedia](https://es.wikipedia.org/wiki/Wikipedia:Referencias))

Tal como se puede ver en el párrafo anterior, el texto está entrecomillado, con una sangría superior y al final del mismo aparece la fuente de la información original y un enlace a la web de referencia. Existen distintas maneras de referenciar textos o citas de otros documentos, pero no entraremos en detalle sobre ello.

Por tanto, si a la hora de crear un documento hacemos referencia a otros textos, deberíamos indicarlo, y más cuando hacemos copia-pega del mismo. Hay que ser objetivos y dar a conocer al lector que lo que acaba de leer no es de elaboración propia y que por tanto se ha utilizado el texto de otro autor. De ahí que **hay que referenciar al autor original o la página web de donde se ha sacado la información**.

Otro ejemplo podría ser: tal como escribió [Isaac Newton](https://es.wikipedia.org/wiki/Isaac_Newton) a Hooke: "*Si he visto más lejos es porque estoy sentado sobre los hombros de gigantes.*", lo que viene a decir que hasta él mismo había basado sus estudios y había conseguido sus logros haciendo uso de las aportaciones de otros grandes científicos anteriores. Como se puede ver, la referencia está entre comillas también y en tipo de letra itálica.

# Releer el documento antes de entregar {#releer-el-documento-antes-de-entregar}

Un documento técnico no es algo que se realice en un día, por lo que pasa por varias etapas durante su escritura, y es por eso que antes de realizar la entrega se debe de repasar lo escrito.

Aunque pueda parecer obvio, este paso no se suele realizar porque quien realiza el documento suele pensar que cuando realizó la escritura ya lo hizo bien. Aún pudiendo ser cierto, una lectura posterior siempre va a sacar a relucir fallos e incongruencias de lo escrito.

En algunos casos puede que durante la escritura inicial se nos olvidase corregir faltas de ortografía, o la estructura del documento no se realizase de la mejor manera correcta, o incluso que se explique lo mismo en dos párrafos contiguos.

Es por eso que **todos los componentes que han realizado el proyecto deben de leer y aportar correcciones al mismo antes de realizar la entrega final** al cliente.

# Actualización del documento {#actualización-del-documento}

Un documento técnico suele ser un "ente vivo", que debe ser actualizado cuando los distintos servicios/componentes del proyecto sufran actualizaciones, modificaciones o simplemente se dejen de utilizar.

La documentación técnica debe reflejar fielmente el estado actual de la infraestructura/programa/web, ya que de nada sirve tener información anticuada que ya no refleja la realidad, y que puede ser incluso contraproducente.

Esta documentación servirá a nuevos integrantes de la compañía a conocer cuál es el estado de la infraestructura/programa/web, o también a una empresa externa nueva que vaya a realizar modificaciones sobre la misma.

