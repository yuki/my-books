
# Acceso a la plataforma {#acceso-aws-docentes}

Amazon pone como responsable a una persona del centro, que será la encargada de dar acceso al resto de docentes. Por lo tanto, para poder acceder a la plataforma **AWS Academy** necesitamos que el encargado del centro nos permita el acceso a la misma.

Para realizar login, hay que ir a la URL [https://www.awsacademy.com/](https://www.awsacademy.com/), donde debemos introducir nuestro email y contraseña. Como está activado el 2FA (doble factor de autenticación), nos llegará un código por email que deberemos introducir.

![Login AWS Academy](img/aws/docentes_login.png){width="40%" framed=true}

Una vez logueado tendremos una web donde podremos elegir entre las siguientes secciones:

![](img/aws/docentes_web.png){width="80%" framed=true}

* **Home**: Página de inicio de la plataforma donde vemos los cursos que podemos crear.
* **Resources**: Tenemos a nuestro alcance distintos tipos de recursos, tanto para utilizar con los alumnos, como para nosotros, para poder realizar cursos y así obtener certificaciones.
* **Contact**: Aquí aparece el contacto principal entre nuestro instituto y AWS.
* **Forums**: Foros para poder pedir ayuda o para interactuar con estudiantes y otros docentes.
* **Classes**: Un resumen de los cursos que hemos creado o en los que se nos ha apuntado.
* **LMS**: En inglés *Learning Management System*, o Sistema de gestión del aprendizaje. Básicamente es el punto central de AWS Academy y es la vista a la que accederán los alumnos con sus credenciales.


# LMS {#lms}

Cuando entramos al **LMS** tendremos una imagen similar a la siguiente:

![Panel de control](img/aws/docentes_lms.png){width="100%" framed=true}

Tenemos cláramente dos partes diferenciadas, el menú de la izquierda que contiene:

* **Usuario**: Menú de nuestro usuario, donde podremos configurar distintos aspectos como notificaciones, subir ficheros, y crear clases.
  
  ::: infobox
  En este apartado es donde podemos crear clases.
  :::

* **Panel de control / Asignaturas**: Son dos apartados separados, pero muestran la misma información a día de hoy. Podemos ver:
  * **Clases activas**: Cursos que están actualmente activos.
  * **Clases futuras**: Como podemos crear clases con fechas futuras, aquí nos aparecerán las que la fecha de inicio todavía no haya llegado.
  * **Clases completadas**: Cursos ya finalizados.
  * **Educator Classes**: Cursos creados para docentes, para aprender el contenido que después también se podrá realizar con los estudiantes.
* **Calendario**: Podemos crear tareas y eventos.
* **Bandeja de entrada**: Mensajes que nos llega de la plataforma.
* **Historial**: Historial de lo que sucede en nuestra plataforma.
* **Ayuda**: Recursos de ayuda para el docente, donde podemos acceder a los foros y nos aparecen noticias de actualizaciones de la plataforma.


## Confirmar e-mail {#confirmar-mail}

Una vez hemos entrado en la plataforma, debemos confirmar la cuenta de correo electrónico. Los pasos hay que realizarlos desde el apartado **Configuraciones** del panel de nuestro usuario.

![Panel de usuario](img/aws/docentes_panel_usuario.png){width="50%" framed=true}

En el lado derecho aparece la sección "Maneras para contactar" donde aparece nuestra dirección de correo. El icono de exclamación indica que no hemos confirmado que la cuenta existe. Si hacemos click en nuestra cuenta, nos indicará que nos ha mandado un correo.


::::::::::::::: {.columns }
:::: {.column width="25%"}
![](img/aws/docentes_email_confirm.png){width="100%" framed=true}
::::
:::: {.column width="30%"}
![](img/aws/docentes_email_reenviar.png){width="100%" framed=true}
::::
:::: {.column width="40%"}
![](img/aws/docentes_email_recibido.png){width="100%" framed=true}
::::
:::::::::::::::

En ese correo tendremos, tal como se ve en la tercera imagen de arriba, un enlace para confirmar el registro. Y una vez confirmada, la dirección en el panel de usuario aparecerá sin enlace y sin la exclamación.

![Dirección confirmada](img/aws/docentes_email_confirmado.png){width="40%" framed=true}




# Cursos para docentes {#cursos-docentes}

Dentro del LMS nos encontramos con varios cursos docentes que **es recomendable realizar** para conocer distintos apartados dentro de AWS.

Existe el curso ***Educator Getting Started with AWS Academy*** (está en castellano) que ha sido creado con información general de AWS Academy.

::: infobox
Para conocer el programa AWS Academy es recomendable realizar el curso ***Educator Getting Started with AWS Academy***.
:::


# Creación de clases {#lms-clases}

Tal como se ha dicho previamente, las clases para estudiantes se crean desde el apartado "Usuario":

![Crear clases](img/aws/docentes_usuario.png){width="48%" framed=true}

Y al hacer click nos saldrá un asistente para crear un curso como el siguiente:

![Asistente para crear clases](img/aws/docentes_curso_crear.png){width="67%" framed=true}

En el asistente nos deja seleccionar:

* **Course**: El curso que queremos utilizar como base para nuestro curso.

  ::: infobox
  Para este ejemplo, usaremos "Academy Learner Lab".
  :::

* **Course Nickname**: Un nombre para identificar de mejor manera el curso.
* **Start date / Start Time**: Fecha y hora de inicio del curso. Se puede poner una fecha anterior al día de hoy.
* **End date / End Time**: Fecha y hora de finalización del curso. No se podrá acceder una vez pasada esa fecha y hora.
* **Timezone**: Zona horaria del curso.
* **Language**: Idioma del curso.
* **Delivery Modality**: Cómo se va a realizar el curso, completamente online, en persona o mezcla de ambas.

::: errorbox
La creación de los cursos pueden tardar hasta 12 horas. Se recomienda ser previsor y crearlos con tiempo.
:::


