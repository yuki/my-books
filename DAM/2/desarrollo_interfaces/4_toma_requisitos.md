
# Toma de requisitos del cliente {#toma-requisitos-cliente}

Antes de comenzar con la programación de una aplicación, debemos tener claro cuáles son los requisitos del cliente cuál es el alcance del proyecto, qué se espera del resultado.

Estos requisitos se suelen obtener mediante entrevistas con el cliente para recabar toda la información posible, para que de esta manera queden claras las funcionalidades que debe tener la aplicación.

En caso de que algún requisito no sea aclarado al inicio del proyecto, puede desencadenar en una cadena de tomar malas decisiones que repercutirá en el resultado final. El problema es que en algunos casos, esas malas decisiones pueden incluirse en el *core* de la aplicación y limitarla a futuro.

::: errorbox
Una mala toma de requisitos puede hacer que la aplicación se desarrolle de manera incorrecta y limitarla a futuro.
:::


## Obtención de los requisitos {#obtencion-requisitos}

Tal como se ha dicho previamente, la obtención de requisitos se realiza al inicio del proyecto, antes de realizar ningún tipo de programación. Las maneras más habituales de obtener los requisitos son:

- Entrevistas con el cliente.
- Entrevistas con los usuarios que van a usar la aplicación.
- Conocer y analizar el estado actual (si lo tienen) de la metodología de trabajo. Ya que con la finalización del proyecto, esta metodología se deberá adaptar.

También es importante que el analista y jefe de proyecto se pongan en la piel del cliente, para poder hacer las preguntas oportunas y poder entender qué se quiere realizar.


## Análisis de requisitos {#analisis-requisitos}

Una vez obtenida la información por parte del cliente, se debe realizar un análisis  de los requisitos, de esta manera, pueden surgir dudas, y en ese caso, volver al paso anterior.

Diferenciar los tipos de requisitos nos ayudará a entender el alcance de cada uno de ellos para así poder gestionar distintos apartados de la aplicación.

A la hora de analizar los requisitos, se suele crear una tabla donde se indicará:

- **Tipo** de requisito.
- **Categoría**, para poder separarlos entre los distintos tipos.
- **Prioridad**, para poder ordenarlos en base a lo prioritoario que son, y cuándo se deben abordar.
- **Dependencias**, ya que hay requisitos que pueden depender de otros. Por lo tanto, antes de poder realizar el requisito, deben terminarse las dependencias.
- **Título** descriptivo que resuma el requisito.
- **Descripción** del requisito, donde habrá que dar toda la información que sea necesaria para posteriormente poder desarrollarla.
- **Razón** del requisito, para poder entender mejor por qué debe realizarse.

A la hora de escribir los requisitos, podemos crear una tabla para cada uno de ellos de la siguiente forma:


```{=html}
<table data-tablename="requisito">
  <thead>
    <tr>
        <th>ID</th>
        <th>Tipo</th>
        <th>Categoría</th>
        <th>Prioridad</th>
        <th>Dependencias</th>
    </tr>
    <tr>
        <th>1</th>
        <th>Funcional</th>
        <th>Transaccional</th>
        <th>Muy Alta</th>
        <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
        <td class="tg-7btt" colspan="5">Registro de usuarios</td>
    </tr>
    <tr>
        <td class="tg-0pky" colspan="5"><span style="font-weight:bold">Descripción:</span><br>La aplicación permitirá el registro del usuario solicitando los siguientes datos:<br>
          <ul>
            <li>E-mail</li>
            <li>Contraseña</li>
            <li>Nombre y apellidos (opcional)</li>
            <li>Fecha de nacimiento</li>
            <li>Género (opcional)</li>
            <li>País (opcional)</li>
          </ul>
        </td>
    </tr>
    <tr>
        <td class="tg-0lax" colspan="5"><span style="font-weight:bold">Razón:</span><br>Para poder registrar recetas el usuario debe estar registrado en el sistema.<br>Algunos datos son opcionales. La fecha de nacimiento es obligatoria ya que<br>los usuarios deben ser mayores de edad.</td>
    </tr>
  </tbody>
</table>
```


```{=latex}
\begin{requisitostbl}{X[-1]X[1]X[1]X[1]X[1]}
    ID & Tipo & Categoría & Prioridad &  Dependencias \\
    1  & Funcional & Transaccional & Muy Alta &    \\

    Registro de usuarios  \\

    \textbf{Descripción}:

    La plataforma permitirá el registro del usuario solicitando los siguientes datos:

    \begin{multicols}{2}
        \begin{itemize}
            \item E-mail
            \item Contraseña
            \item Nombre y apellidos (opcional)
            \item Fecha de nacimiento
            \item Género (opcional)
            \item País (opcional)
        \end{itemize}
    \end{multicols}
    \\

    \textbf{Razón}:

    Para poder registrar recetas el usuario debe estar registrado en el sistema.  Algunos datos son opcionales. La fecha de nacimiento es obligatoria ya que los usuarios deben ser mayores de edad.\\
\end{requisitostbl}

\vspace{10pt}
```

En este caso, en el apartado "Dependencias" no se ha añadido nada ya que es el primer requisito de la aplicación.


### Requisitos de negocio {#requisitos-negocio}

Los requisitos de negocio suelen ser los menos técnicos, y se puede resumir en **qué quiere conseguir la empresa tras finalizar el proyecto**.

Algunos ejemplos:

- Crear un portal web de recetas, para que los usuarios puedan subir sus recetas, valorarlas y compartirlas.
- Crear una aplicación que mejore la productividad de la gestión de productos de la empresa, para tener un inventariado digital, que genere avisos antes de que se agoten.
- Crear una red social de gente que le guste la escalada, donde poder compartir rutas, valorar dificultades, hacer quedadas para escalar.

Tal como se puede ver, es una idea general, pero que ya nos da una idea de otros requisitos que tendremos que tener en cuenta durante el desarrollo.


### Requisitos funcionales {#requisitos-funcionales}

Los requisitos funcionales son las declaraciones de los servicios que debe proporcionar la aplicación. En definitiva, definir cómo se va a comportar el sistema en distintas situaciones a lo largo de la aplicación.

Los requisitos funcionales se pueden dividir en:

- Requisitos transaccionales
- Requisitos de datos
- Requisitos de interfaz o de presentación
- Requisitos de personalización


#### Requisitos transaccionales {#requisitos-transaccionales}

Los requisitos transaccionales los podemos resumir como las funcionalidades que tendrá la aplicación, así como las tareas que el usuario podrá realizar con los datos contenidos en la aplicación.

En base a estos requisitos transaccionales y estas funcionalidades, veremos cómo posteriormente surgirán nuevos requisitos (como pueden ser los requisitos de datos y requisitos de interfaz).

Un ejemplo de un requisito transaccional es el visto anteriormente, como **registro de usuarios**, y otro puede ser el **realizar login de usuario**.



#### Requisitos de datos {#requisitos-datos}

Los requisitos de datos, como su propio nombre indica, tiene que ver con los datos que la aplicación va a utilizar. Es importante entender que los requisitos funcionales que salen de los puntos anteriores requerirán a su vez de los datos que la aplicación va a utilizar.

Se debe entender el análisis realizado para entender qué datos se van a utilizar, para posteriormente realizar el esquema Entidad-Relación de la base de datos.

::: infobox
Partiendo de los requisitos de datos podemos generar la base de datos de la aplicación.
:::

Ejemplos:

- **Datos de usuario**: Qué datos se pedirán al usuario al realizar el registro.
- **Datos de contenido**: Si nuestra aplicación es de recetas de cocina, qué datos se van a pedir al añadir una nueva receta (nombre, ingredientes, dificultad, procedimiento de elaboración,...).


#### Requisitos de interfaz/presentación {#requisitos-interfaz}

A la hora de representar la información y de hacer uso de la aplicación, el usuario deberá interactuar con el sistema y esto se hace mediante distintos elementos del interfaz. Es por eso que es necesario tener claro cuáles son los requisitos de interfaz, y partiendo de estos, generar un mapa de navegación

Ejemplos:

- **Registro de usuario**: Panel donde el usuario se podrá registrar.
- **Login de usuario**: Interfaz donde se puede realizar login.
- **Interfaz de usuario**: Una vez un usuario se ha logueado, qué se le mostrará al usuario en su panel principal.


#### Requisitos de personalización {#requisitos-personalizacion}

Estos requisitos pueden ser opcionales, ya que no todas las aplicaciones permitirán un sistema de personalización para los usuarios. En caso de poder realizar algún tipo de personalización, en este apartado se detallarían.

Ejemplos:

- Poder elegir idioma de la aplicación.
- El cambio de idioma se realizará de manera automática.


### Requisitos no funcionales {#requisitos-no-funcionales}

Los requisitos no funcionales son aquellos que no se refieren directamente a las funciones específicas que
proporciona el sistema. Estos requisitos no funcionales también los podemos diferenciar en distintos apartados como vamos a ver a continuación.

::: infobox
Los requisitos no funcionales suelen ser aspectos técnicos.
:::


#### Requisitos de producto {#requisitos-producto}

Estos son los requerimientos que especifican el comportamiento del producto y que pueden verse asociados a la eficiencia, fiabilidad, disponibilidad... Normalmente son detalles técnicos que el cliente no tiene por qué conocer, y que por tanto debemos abordar desde la parte técnica.

Hay que tener en cuenta, que en este caso los requisitos serán muy distintos dependiendo del tipo de producto/proyecto que estemos realizando, ya que no será igual una aplicación web o una aplicación móvil.

Ejemplos:

- La aplicación web debe estar disponible 24x7 los 365 días del año.
- El despliegue de nuevas versiones se realizará mediante un sistema que pueda revertir los cambios en caso de error.
- La aplicación móvil se testeará internamente antes de enviarla a la *store* correspondiente.



#### Requisitos organizacionales {#requisitos-organizacionales}

Dentro de los requisitos no funcionales también podemos distinguir los denominados como organizacionales, entre los que podríamos destacar, entre otros:

- **Requisitos de entrega**: Cuándo se debe realizar la entrega de los distintos *sprints* de la aplicación y de la versión final.
- **Requisitos de implementación**: Lenguaje de programación a utilizar, *framework* o versiones utilizadas, sistema de *debug*, cómo se realiza el seguimiento del proyecto, sistema de control de versiones a utilizar...
- **Uso de estándares**: Si es un lenguaje de programación compilado, qué compilador y versión se va a utilizar. Qué sistema se va a usar a la hora de crear el nombre de las variables ([camelCase](https://en.wikipedia.org/wiki/Camel_case), [snake_case](https://en.wikipedia.org/wiki/Snake_case), ...). Si es web, uso de HTML5+CSS3...



### Requisitos del sistema {#requisitos-sistema}

Para finalizar, los requisitos del sistema hacen referencia a dónde se va a ejecutar el proyecto, y cuáles son las garantías que debemos abordar para que funcione de manera correcta.

De nuevo, existirán diferencias en caso de que el proyecto sea una aplicación web o una aplicación de móvil.

Ejemplos:

- La aplicación deberá funcionar en sistemas Android con API 30 o superior
- La aplicación móvil no necesitará ningún permiso para ser usada.
- La aplicación web será desplegada en AWS en distintas zonas de computación.


