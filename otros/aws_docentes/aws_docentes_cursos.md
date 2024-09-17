

# Gestión de los cursos {#gestion-cursos}

Una vez creado un curso, cuando tengamos acceso, tendremos una vista como la siguiente, en la que tendremos apartados sólo visibles para nosotros, y otros que también verán los estudiantes.

![Vista principal del curso](img/aws/docentes_curso_inicio.png){width="100%" framed=true}

Arriba a la derecha hay un botón ![](img/aws/docentes_ver_estudiante.png){inline=true height=0.6cm} para poder ver el curso como si fuésemos un estudiante. De esta manera, la vista se nos modifica y se ve así:

![Vista principal del curso](img/aws/docentes_vista_estudiante.png){width="100%" framed=true}

Para volver a la vista de docente, está el botón "Abandonar la vista del estudiante".

# Añadir estudiantes {#añadir-estudiantes}

Para que los estudiantes tengan acceso al curso, debemos añadirlos previamente. Para ello debemos ir al apartado "**Personas**", y ahí hay un botón para añadir estudiantes: ![](img/aws/docentes_personas.png){inline=true height=0.6cm} 


![Añadir estudiantes por email](img/aws/docentes_agregar_personas.png){width="70%" framed=true}

Podemos añadir todos los estudiantes a la vez, indicando el email del centro. Podemos añadirlos separados por comas o cada cuenta de email por línea. Una vez añadidos los emails y darle a "Siguiente", si los estudiantes que hemos añadido no tienen cuenta en AWS Academy nos aparecerá el siguiente aviso:

![Crear nuevos usuarios](img/aws/docentes_agregar_personas2.png){width="70%" framed=true}

En este caso, seleccionamos el *checkbox* de arriba, y le damos a "Siguiente". Automáticamente creará una cuenta para cada estudiante (y les mandará un mail para que terminen el proceso), y les pondrá como nombre la propia dirección de email.

Aunque se ha visto cómo añadir estudiantes, también podemos añadir una cuenta cambiando el rol a "Profesor Auxiliar".


# Control de los laboratorios {#control-laboratorios}

Nos vamos a centrar en el control de los "***Learner Lab***", ya que es el apartado donde los estudiantes más tiempo van a pasar, y por tanto pueden descuidar el gasto y llegar al límite de $50 antes de tiempo.

Para ver cuál es el estado por estudiante, debemos ir a "Módulos → 
Iniciar el Laboratorio de aprendizaje de AWS Academy"

![Acceder al laboratorio](img/aws/docentes_lab.png){width="90%" framed=true}

Y nos abrirá la gestión del laboratorio:

![Control de los laboratorios](img/aws/docentes_lab2.png){width="90%" framed=true}

Tal como se puede ver, existen unas pestañas, que nos darán información acerca de los laboratorios de los estudiantes en general, o de un estudiante concreto.

::: infobox
Se recomienda echar un vistazo a cada apartado.
:::

Para obtener la misma información, podemos acceder a través de distintos apartados, por lo que se recomienda ir pestaña a pestaña para familiarizarnos con la información que nos proveen.

## Estado de los estudiantes {#estado-estudiantes}

Si queremos ver si los estudiantes están conectados y trabajando en sus laboratorios, lo podemos ver a través de la pestaña ***Class***, en la que se nos mostrarán los estudiantes y su estado, siendo [●]{color="red"} desconectados y  [●]{color="green"} conectados.

![Control de los laboratorios](img/aws/docentes_lab_class.png){width="90%" framed=true}

Al seleccionar un estudiante, podemos ver cuántos minutos ha estado en total en el laboratorio y en el último mes, así como el gasto realizado.

::: warnbox
Sólo veremos a los estudiantes que hayan iniciado alguna vez el laboratorio.
:::

Si nos interesa el gasto realizado, también se puede ver desde "Analytics → Lab Cost". Y para el tiempo que han estado, "Analytics → Lab Time".


## Acceso a los laboratorios de los estudiantes {#acceso-laboratorios}

Acceder a los laboratorios en cualquier momento puede ser interesante para ver qué han hecho los estudiantes,  corregir tareas ya realizadas, o mostrar al resto de estudiantes posibles errores realizados.

Para acceder se puede realizar desde distintos lugares:

* *Class* → Seleccionar estudiante → Hacer click en ![](img/aws/docentes_lab_workarea.png){inline=true height=0.6cm}
* *Dashboard* -> Seleccionar estudiante → Hacer click en ![](img/aws/docentes_lab_workarea2.png){inline=true height=0.6cm}

Al hacer click en cualquiera de ellos, nos llevará a la página de acceso del laboratorio **del estudiante**:

![Acceder a un laboratorio de estudiante](img/aws/docentes_lab_workarea_confirm.png){width="100%" framed=true}

Si accedemos a un laboratorio (de estudiante o propio) y luego queremos acceder a otro, lo más probable es que nos salga el siguiente mensaje de error:

![Mensaje de error de sesión](img/aws/docentes_lab_error.png){width="50%" framed=true}

Si se hace click sobre el "**aquí**" que aparece en el error, nos cerrará la sesión **sólo del laboratorio**. En ese momento podremos acceder de nuevo a cualquier otro laboratorio.

::: errorbox
Al pasar de un laboratorio a otro nos puede salir un error. Haz click en el enlace del mensaje que aparece.
:::

