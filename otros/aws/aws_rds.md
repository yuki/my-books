

# Introducción {#introducción-rds}

**RDS**, contracción de las siglas en inglés *Relational Database Service*, es el **servicio de bases de datos relacional** que podemos crear y ejecutar en la nube de AWS sin que tengamos que realizar nosotros la creación e instalación de un sistema operativo en el que se ejecute.

Este servicio facilita el despliegue del servicio, permitiendo que podamos crear servicios en alta disponibilidad sin tener que conocer los aspectos de configuración que hay detrás de ellos, ya que Amazon se encarga de realizar la configuración total del servicio.

Actualmente existen distintos sistemas gestores de bases de datos relacionales que podemos desplegar a través del servicio RDS, entre las que podemos destacar:

-   **MySQL**: Es la base de datos relacional con licencia de Software Libre mas conocida a día de hoy.

-   **MariaDB**: Fork de MySQL y compatible con ella.

-   **PostgreSQL**: Antes del boom de MySQL era la base de datos de referencia en el mundo del Software Libre, siendo más compatible que la anterior.

-   **Aurora (MySQL Compatible)**: Es una versión de MySQL modificada por Amazon para tener mayor rendimiento.

-   **Aurora (PostgreSQL Compatible)**: Es una versión de PostgreSQL modificada por Amazon para tener mayor rendimiento.

-   **Oracle**: Sistema de base de datos privativo desarrollado por la empresa del mismo nombre.

-   **SQL Server**: Gestor de base de datos de Microsoft.

Dependiendo del proyecto que queramos desplegar, deberemos elegir entre el sistema que más se adecúe al proyecto.

# Características {#características-rds}

A la hora de desplegar una instancia RDS existen distintas características que podemos tener en cuenta, que son muy interesantes y en principio no importa qué SGBD elijamos, ya que están disponibles para todos ellos.

## Clúster de base de datos Multi-AZ {#clúster-de-base-de-datos-multi-az}

Marcando esta opción RDS nos creará un sistema clúster del sistema de base de datos que hayamos elegido teniendo en cuenta las siguientes características:

-   **Instancia primaria**: Es la instancia que permite lectura y escritura.

-   **Instancias en espera con capacidad de lectura**: Estas instancias las desplegará en otras zonas de disponibilidad diferente a donde se encuentra la instancia primaria. **Esto proporciona alta disponibilidad y redundancia de datos**. También podremos realizar cargas de trabajo de lectura sobre estas instancias.

Se puede crear el sistema Multi-AZ posterior al despliegue de una instancia RDS, ya que quizá no nos interese realizarlo de inicio ya que supone un coste adicional.

## Copias de seguridad automáticas {#copias-de-seguridad-automáticas}

Durante la creación de la base de datos podemos indicar que se realicen copias de seguridad de manera automática de la instancia de base de datos. De esta manera, podemos delegar parte de este sistema en el propio servicio.

Por otro lado, estas copias de seguridad posteriormente las podremos utilizar para levantar nuevas instancias de pruebas o para realizar la restauración de la base de datos a una copia concreta.

## Implementación azul-verde {#implementación-azul-verde}

Un despliegue azul-verde (o en inglés *blue-green deployment*) es una técnica que se utiliza cuando queremos realizar modificaciones en nuestra aplicación o servicio, que trata de minimizar los riesgos de un pase de producción tradicional.

La idea es hacer uso de dos servidores (o grupos de servidores) idénticos. Normalmente el servicio actual es el denominado **blue**, y de él se realiza una réplica. En este nuevo entorno de réplica se realizarán las modificaciones necesarias para el nuevo despliegue o las nuevas características.

Cuando se haya comprobado que el nuevo entorno funciona de manera correcta, está en modo **green** (se le da luz verde para pasar a producción), se alterará a cuál de ellos se estará enviando el tráfico real, pasando del entorno antiguo *blue* al nuevo entorno *green*.

En caso de que haya algún tipo de error, se puede dar marcha atrás, ya que es reversible, volviendo a enviar las conexión al entorno anterior *blue*.

# Crear base de datos MySQL {#crear-base-de-datos-mysql}

Desde el panel de RDS tenemos el botón para crear una base de datos, `\includegraphics[height=0.8\baselineskip]{img/aws/rds_create.png}`{=latex} `<img src="img/aws/rds_create.png" style="height:1.5rem">`{=html} , y tendremos que tener en cuenta las necesidades y lo comentado previamente. Entre las opciones que nos aparecen en la nueva página, y los distintos apartados del formulario podemos destacar:

-   **Método de creación de base de datos**

    -   **Creación estándar**: Es el método en el que nos permite elegir más opciones a la hora de crear la instancia de base de datos.

    -   **Creación sencilla**: Es la manera para crear la base de datos sin que aparezcan todas las opciones que sí aparecen con el método anterior. Algunas configuraciones se pueden modificar después y otras no.

-   **Opciones del motor**: Podremos elegir el SGBD y la versión concreta que nos interese. Elegiremos **mysql**.

-   **Plantillas**: Existen plantillas creadas por AWS, y dependiendo de cuál se elija, por defecto se seleccionarán otras opciones que detallaremos más adelante.

    -   **Producción**: Para disfrutar de una alta disponibilidad y de un rendimiento rápido y constante.

    -   **Desarrollo y pruebas**: Esta instancia se ha diseñado para su uso en desarrollo, fuera de un entorno de producción.

    -   **Capa gratuita**: Para desarrollar nuevas aplicaciones, probar aplicaciones existentes o adquirir experiencia práctica.

-   **Disponibilidad y durabilidad**: Opciones para crear alta disponibilidad.

    -   **Clúster de base de datos multi-AZ: nuevo**: Crea un clúster de base de datos con una instancia de base de datos primaria y dos instancias de base de datos en espera con capacidad de lectura, con cada instancia de base de datos en una zona de disponibilidad (AZ) diferente.

    -   **Instancia de base de datos Multi-AZ**: Crea una instancia de base de datos primaria y una instancia de base de datos en espera en una zona de disponibilidad diferente.

    -   **Instancia de base de datos única**: Sólo existe una instancia de la base de datos.

-   **Configuración**:

    -   **Nombre de la instancia**: El nombre para poder identificar a la instancia de base de datos.

    -   **Nombre del usuario maestro**: Es el nombre del usuario para administrar la base de datos.

    -   **Contraseña del usuario**: Nos permite elegir la contraseña de acceso.

-   **Configuración de la instancia**: Similar al caso de las instancias de computación, es para saber cuántas vCPUs y memoria RAM tendrá la instancia de base de datos.

-   **Almacenamiento**:

    -   **Tipo de almacenamiento**: Dónde se alojan los datos.

    -   **Almacenamiento**: Cantidad de GiB para guardar los datos. Se deberá ajustar a nuestras expectativas.

    -   **IOPS provisionadas**: Número solicitado de operaciones de E/S por segundo que la instancia de base de datos puede admitir.

-   **Conectividad**:

    -   **Recurso de computación**: Crea las "*security group*" necesarias para poder permitir la conexión desde una instancia concreta.

    -   **Acceso público**: Si queremos asignar una IP pública a la base de datos y así permitir el acceso a la base de datos desde fuera del VPC.

Tal como se puede ver, hay muchas opciones entre las que se pueden elegir, pero afortunadamente, **al lado de cada opción existe un enlace para obtener más información**.

::: warnbox
**Es recomendable leer la documentación de las distintas opciones que se pueden elegir durante la creación de la instancia de base de datos.**
:::

El despliegue de la base de datos puede tardar alrededor de 5 minutos, ya que crea la instancia, realiza un backup y otras tareas de configuración.

# Conexión a la base de datos {#conexión-a-la-base-de-datos}

Para realizar la conexión a la base de datos, ya sea desde una aplicación o desde un programa de acceso, necesitaremos conocer los siguientes datos:

-   **Punto de enlace**: Es una dirección DNS para poder acceder a la base de datos del estilo **database-1.cpicwmm0inx1.us-east-1.rds.amazonaws.com**.

-   **Puerto**: Para MySQL es **3306** salvo que lo hayamos cambiado.

-   **Usuario administrador**: El usuario que hayamos elegido durante el despliegue.

-   **Contraseña**: Elegida durante el despliegue.

Si tenemos el **cliente de mysql** instalado en la instancia de computación, podremos realizar la conexión de la siguiente manera:

::: {.mycode size=small}
[Acceso a la base de datos desde consola]{.title}

``` console
admin@ip-172-31-32-168:~$ mysql -u admin \
   -h prueba-gratuita.cpicwmm0inx1.us-east-1.rds.amazonaws.com  -p
Enter password: 
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MySQL connection id is 27
Server version: 8.0.35 Source distribution
Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.
Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.
MySQL [(none)]>
```
:::

