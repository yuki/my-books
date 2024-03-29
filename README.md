# Libros de texto
En este repositorio vas a encontrar distintos libros de texto para distintos cursos de FP creados mediante el sistema de procesamiento de texto **LaTeX**.

Más adelante verás que la licencia utilizada para estos libros es una licencia libre de Creative Commons.


![Cultura libre](https://raw.githubusercontent.com/yuki/yukibook.cls/main/img/seal.svg)


## Tabla de contenidos
- [Libros de texto](#libros-de-texto)
  - [Tabla de contenidos](#tabla-de-contenidos)
  - [¿Por qué?](#por-qué)
  - [¿Están terminados?](#están-terminados)
  - [Libros realizados](#libros-realizados)
    - [Otros libros](#otros-libros)
    - [Anexos](#anexos)
  - [¿Puedo utilizarlos?](#puedo-utilizarlos)
    - [¿Puedo modificarlos/venderlos?](#puedo-modificarlosvenderlos)
  - [¿Cómo están hechos?](#cómo-están-hechos)
    - [Auto-generación](#auto-generación)



## ¿Por qué?
Realizar mis propios apuntes tiene ciertas ventajas:
* Te ayuda a profundizar y recapacitar acerca de los temas que vas a enseñar
* Enfocar el libro en los temas que crees más importantes
* Modificar las explicaciones realizadas en caso de que los alumnos no entiendan alguna parte
* Pensar ejercicios enfocados a lo que vas a explicar
* Aprender



## ¿Están terminados?
Los libros son un trabajo contínuo. En principio, los que se pueden descargar en formato PDF están listos para ser utilizados, pero es posible que no estén terminados para todo el currículo de la asignatura.

En caso de ser modificados, los PDF se autogeneran y podrás descargar las últimas versiones en los enlaces que aparecen a continuación.



## Libros realizados
Los libros que están ahora mismo creados son libros utilizados para Formación Profesional, y que puedes descargar desde los siguientes enlaces:

* Grado Medio para Técnico en Sistemas microinformáticos y redes
  * [Sistemas Operativos en red](https://github.com/yuki/my-books/releases/download/latest/SOred.pdf)
* Grado Superior para Técnico superior en Administración de Sistemas informáticos en red
  * [Planificación y administración de redes](https://github.com/yuki/my-books/releases/download/latest/redes_book.pdf) **NOTA: No está acabado**
  * [Administración de sistemas gestores de bases de datos](https://github.com/yuki/my-books/releases/download/latest/sgbd_book.pdf)
* Grado Superior para Técnico superior en Desarrollo de Aplicaciones Multiplataforma
  * [Sistemas Informáticos](https://github.com/yuki/my-books/releases/download/latest/sistemas_informaticos.pdf)
  * [Desarrollo de Interfaces](https://github.com/yuki/my-books/releases/download/latest/desarrollo_interfaces.pdf) (en progreso)
  * [Sistemas de Gestión Empresarial](https://github.com/yuki/my-books/releases/download/latest/sistemas_gestion_empresarial.pdf) (en progreso)
* Grado Superior para Técnico superior en Desarrollo de Aplicaciones Web
  * [Sistemas Informáticos](https://github.com/yuki/my-books/releases/download/latest/sistemas_informaticos_web.pdf) (es igual que el de DAM)


### Otros libros
Aparte de estos libros, se han creado los siguientes libros/apuntes sobre temas específicos:
* [Configuración básica de pfSense como firewall de red](https://github.com/yuki/my-books/releases/download/latest/pfsense_book.pdf)
* [Cómo hacer una buena documentación, o al menos intentarlo](https://github.com/yuki/my-books/releases/download/latest/como_hacer_documentacion.pdf)
* [Git: Sistemas de control de versiones](https://github.com/yuki/my-books/releases/download/latest/git_book.pdf)
* [Introducción a Laravel](https://github.com/yuki/my-books/releases/download/latest/laravel_book.pdf)


### Anexos
Y por último, hay ciertos Anexos creados, que están incluídos en varios de los libros. Algunos de estos anexos son apuntes mínimos y en otros se profundiza más.

Como también puede ser interesante tenerlos por separado, se pueden descargar desde aquí:
* [Gestión de copias de seguridad](https://github.com/yuki/my-books/releases/download/latest/gestion_backups_anexo.pdf)
* [Glosario de varios términos informáticos](https://github.com/yuki/my-books/releases/download/latest/glosario_anexo.pdf)
* [Instalar Ubuntu LTS](https://github.com/yuki/my-books/releases/download/latest/instalar_ubuntu_lts_anexo.pdf)
  * [Crear sistema RAID 1 en Ubuntu](https://github.com/yuki/my-books/releases/download/latest/ubuntu_raid1_anexo.pdf)
* [Sistemas de monitorización](https://github.com/yuki/my-books/releases/download/latest/sistemas_monitorizacion_anexo.pdf)
  * [Monitorización básica con Munin](https://github.com/yuki/my-books/releases/download/latest/monitorizacion_munin_anexo.pdf)
* [Virtualbox y networking](https://github.com/yuki/my-books/releases/download/latest/virtualbox_networking_anexo.pdf)




## ¿Puedo utilizarlos?
Los libros están hechos como material libre bajo la licencia [Creative Commons BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/deed.es).


### ¿Puedo modificarlos/venderlos?
Puedes modificarlos, distribuirlos y venderlos teniendo en cuenta la licencia [Creative Commons BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/deed.es).

Te agradecería que en cualquiera de esos casos me informes, o me facilites las modificaciones realizadas, para ver si encajan en mi visión del libro y así poder incluirlas y de esta manera mejorarlos.

Si sabes utilizar Github, puedes hacer uso de los **Pull requests** para indicarme las modificaciones.



## ¿Cómo están hechos?
Los libros están generados con **LaTeX**, tratando de buscar que la generación sea la mejor posible. Para realizar los libros he utilizado una clase propia que se puede encontrar [aquí](https://github.com/yuki/yukibook.cls).

Esta clase tiene su propia documentación en el enlace, pero se ha creado por las siguientes razones:
* Crear una portada propia (utilizando como referencia los libros técnicos de O'Reilly, porque me parecía gracioso).
* Poder tener encabezados y temas en un formato propio.
* Crear cajas para código o mensajes, buscando la visualización acorde al libro.
* Para aprender **LaTeX** y no depender de un programa _WYSIWYG_.
* Poder hacer "includes" de partes de un libro en otro, o tener temas comunes. De esta manera, si modifico algo de ese tema común, no tengo que ir copiando/pegando las modificaciones en todos los libros donde lo uso. Modifico en un sitio, y sólo tengo que compilar el libro correspondiente (y GitHub lo hace por mí :D)

Muchas de las imágenes utilizadas en los documentos están realizadas mediante [draw.io](https://www.diagrams.net/)

### Auto-generación
Si no sabes nada de **LaTeX**, es posible que no sepas cómo utilizar el código fuente de los libros para generar los PDF. 

Para evitar eso, he creado un _[workflow](https://github.com/yuki/my-books/blob/main/.github/workflows/build-and-publish.yml)_ que con cada modificación que se sube a Github se crea una acción para formar el PDF y lo puedas descargar con los enlaces de arriba.


## Futuro
Mi idea es en un futuro cercano hacer uso de [Pandoc](https://pandoc.org/) para generar una versión HTML de los libros. La idea es poder hacer uso del formato HTML en clase. Ahora mismo no es 100% posible, pero la idea es:

- [ ] Modificar la clase [yukibook.cls](https://github.com/yuki/yukibook.cls) y separar el formato de la página de los estilos. Ahora mismo soy muy dependiente de la clase LaTeX que he creado.
- [ ] Entender las posibilidades de Pandoc al crear HTML y la posibilidad de posicionar imágenes.
- [ ] Crear una plantilla HTML que se adecúe a mis necesidades y que me guste: [estoy en ellos](https://github.com/yuki/pandoc-template-bootstrap5).
- [ ] Determinar si el resultado final es útil para dar clases.
