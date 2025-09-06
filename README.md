# Libros de texto
En este repositorio vas a encontrar distintos libros de texto para distintos módulos de Formación Profesional creados con [Markdown](https://markdown.es/sintaxis-markdown/) que se procesan con [Pandoc](https://pandoc.org/) para generar el resultado en HTML y PDF.

Más adelante verás que la licencia utilizada para estos libros es una licencia libre de Creative Commons.


![Cultura libre](https://raw.githubusercontent.com/yuki/yukibook.cls/main/img/seal.svg)

## ¿Por qué?
Realizar apuntes propios tiene ventajas importantes:
* Te ayuda a profundizar y recapacitar acerca de los temas que vas a enseñar
* Enfocar el libro en los temas que crees más importantes
* Modificar las explicaciones realizadas en caso de que los alumnos no entiendan alguna parte
* Pensar ejercicios enfocados a lo que vas a explicar
* Aprender



## ¿Están terminados?
Los libros son un trabajo contínuo y están en constantes actualizaciones. Son funcionales y se pueden utilizar, pero puede haber apartados en los que se necesite profundizar más, añadir ejercicios (porque los tengo en Moodle), ...

En caso de ser modificados el HTML y los PDF se autogeneran desde un Github Action.

## ¿Dónde puedo obtenerlos?
Los puedes ver en formato HTML desde [este enlace](https://yuki.github.io/my-books/). Algunos de ellos están traducidos al euskera.

Desde esa web tienes acceso a cada libro en formato HTML, y en la cabecera de cada uno de ellos hay un icono (<img src="https://github.com/user-attachments/assets/4e8ce536-b631-46e4-9f1a-f4bbd6a289dd" width="20" />) para poder verlo/descargarlo en formato PDF (o cambiando en la URL "html" por "pdf").


## ¿Puedo utilizarlos?
Los libros están hechos como material libre bajo la licencia [Creative Commons BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/deed.es).


### ¿Puedo modificarlos?
Puedes modificarlos y distribuirlos teniendo en cuenta la licencia [Creative Commons BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/deed.es).

Te agradecería que en cualquiera de esos casos me informes, o me facilites las modificaciones realizadas, para ver si encajan en mi visión del libro y así poder incluirlas y de esta manera mejorarlos.

Si sabes utilizar Github, puedes hacer uso de los **Pull requests** para indicarme las modificaciones.



## ¿Cómo están hechos?
Originalmente los libros estaban creados con **LaTeX**, pero no podía generar de manera correcta el HTML. Ahora están generados con **Markdown**, para ser procesados con [Pandoc](https://pandoc.org/) y unas plantillas que he creado especiales para ello que puedes encontrar en mi repositorio [pandoc-templates](https://github.com/yuki/pandoc-templates/).

Esta plantilla tiene su propia documentación en el enlace, pero se ha creado por las siguientes razones:
* Crear una portada propia, utilizando como referencia los libros técnicos de O'Reilly (me parecía gracioso 😆).
* Poder tener encabezados y temas en un formato propio.
* Crear cajas para código o mensajes, buscando la visualización acorde al libro.
* Poder hacer "includes" de ficheros. Si modifico un fichero, si se usa en distintos libros, sólo tengo que compilar los libros correspondientes para ver el resultado en todos ellos (y GitHub lo hace por mí 😁)

Muchas de las imágenes utilizadas en los documentos están realizadas mediante [draw.io](https://www.diagrams.net/)

### Auto-generación
Si no sabes nada de **Pandoc**, es posible que no sepas cómo utilizar el código fuente de los libros para generar los PDF y el HTML. 

Para evitar eso, he creado un _[workflow](https://github.com/yuki/my-books/blob/main/.github/workflows/pandoc-publish.yml)_ que me permite a través de una "Github Action" generar el PDF y el HTML y así tener el resultado [final](https://yuki.github.io/my-books/) directamente online.
