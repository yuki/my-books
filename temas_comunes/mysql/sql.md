
# SQL básico {#sql-basico}

## Introducción {#sql-introduccion}

SQL (por sus siglas en inglés ***S**tructured **Q**uery **L**anguage*) surgió como una evolución de un lenguaje previo llamado SEQUEL. SQL nació en IBM en 1977. Unos años más tarde fue considerado un estándar ANSI y al año siguiente (1987) un estándar ISO.

SQL tiene las siguientes características:


- **Lenguaje de definición de datos (DDL)**: nos permite crear y/o manipular la estructura de la base de datos y las relaciones que en ellas deben existir.
- **Lenguaje de manipulación de datos (DML)**: este apartado se puede subdividir en las siguientes tareas:

    - Consultar determinada información.
    - Insertar nuevos datos.
    - Modificar los datos existentes.
    - Eliminar datos que ya no sean necesarios.


- **Control de transacciones**: para definir cuándo se inicia, cuándo finaliza o si es necesario deshacer una transacción.
- **Control de datos**: permite asignar y revocar permisos a los usuarios, tanto de acceso a la información como de operaciones que pueden realizar sobre los mismos.


El lenguaje SQL puede ser utilizado:

- De forma **interactiva**: en una consola o desde un CLI instalado en la propia máquina donde se encuentra el servidor u otra máquina remota.
- **Inmerso** dentro de un lenguaje de programación anfitrión, ejecutando consultas desde Java o PHP, por ejemplo.

Es un **lenguaje declarativo** ya que permite especificar la operación que se debe llevar a cabo (en forma de sentencias), pero no la forma en la que se llevará a cabo. Esa será la tarea del SGBD, ejecutar la tarea de la manera más adecuada para obtener los datos.

Los SGBD implementan (de manera parcial o total) el estándar SQL y sobre él añaden funcionalidades propias e incluso lenguajes de programación propios derivados de SQL (PL/SQL en Oracle, PL/pgSQL en PostgreSQL. Por lo tanto, **SQL no es un lenguaje de programación, pero hay SGBDs que han creado dicha funcionalidad**.

Debido a que SQL es un estándar, las funciones principales deberían funcionar en cualquier SGBD que haga uso del estándar, aunque es cierto que algunos SGBD amplían SQL con funciones o procedimientos propios que otros SGBD no tienen porqué tener. Esas funciones o procedimientos extra a veces se incorporan al estándar un tiempo después.

Dentro del lenguaje SQL podemos separar las consultas o acciones teniendo en cuenta qué realizamos con ellos.


## Lenguaje de definición de datos: DDL {#ddl}
El DDL (*Data Definition Language*) de SQL proporciona comandos para la definición de esquemas de relación, borrado de relaciones y modificaciones de los esquemas de relación. Existen tres operaciones básicas: **CREATE**, **ALTER** y **DROP**.

### Gestión de bases de datos {#gestion-base-de-datos}
La función de un SGBD es la de proporcionar la capacidad de tener distintas bases de datos en el sistema, es por ello que tenemos que aprender a gestionar las bases de datos que tenemos, o en un momento dado crear bases de datos.


::: {.mycode}
[Crear una base de datos y mostrar las existentes ]{.title}

``` mysql
mysql> CREATE DATABASE prueba;

mysql> SHOW DATABASES;
+-----------------------------+
| Database                    |
+-----------------------------+
| information_schema          |
| mysql                       |
| performance_schema          |
| prueba                      |
| sys                         |
+-----------------------------+
5 rows in set (0.00 sec)
```
:::


Para poder entrar en una base de datos y poder visualizar, modificar o usar las tablas y datos que hay en ella:

::: {.mycode}
["Entrar" en una base de datos]{.title}

``` mysql
mysql> USE prueba;
Database changed
```
:::

Borrar una base de datos existente.

::: {.mycode}
[Borrar una base de datos]{.title}

``` mysql
mysql> DROP DATABASE prueba;
```
:::


### Gestión de tablas {#gestion-tablas}
La gestión de tablas se realiza cuando estamos dentro de una base de datos, por lo que deberemos asegurarnos que hemos entrado dentro de una de ellas antes de realizar ninguna gestión sobre ellas.


::: {.mycode}
[Crear distintas tablas]{.title}

``` mysql
CREATE TABLE alumnos (
    dni      varchar(9) not null primary key,
    nombre   varchar(20),
    apellido varchar (20),
    telefono integer
);

CREATE TABLE asignaturas (
    codigo integer not null primary key,
    nombre varchar(50)
);

CREATE TABLE matriculacion_alumno (
    codigo_asignatura integer,
    dni_alumno varchar(9),
    nota float,
    fecha_matriculacion date,

    PRIMARY KEY(codigo_asignatura, dni_alumno),
    FOREIGN KEY (codigo_asignatura) REFERENCES asignaturas(codigo),
    FOREIGN KEY (dni_alumno) REFERENCES alumnos(dni) ON DELETE CASCADE
);
```
:::


Si queremos modificar el modelo de la tabla creada previamente

::: {.mycode}
[Modificar una tabla, añadiendo una columna]{.title}

``` mysql
mysql> ALTER TABLE alumnos ADD nacimiento date;
```
:::

::: {.mycode}
[Eliminar una tabla]{.title}

``` mysql
mysql> DROP TABLE alumnos;
```
:::

TRUNCATE es una función especial que vacía de contenido una tabla. Realmente lo que hace es borrar la tabla y volverla a crear, de ahí que sea considerada una función dentro del DDL.

::: {.mycode}
[Truncar una tabla]{.title}

``` mysql
mysql> TRUNCATE TABLE alumnos;
```
:::


Para poder gestionar una tabla debemos saber cómo es y cómo está creada, ya que dependiendo de ello podremos realizar modificaciones sobre la misma.

Para ver las columnas que tiene una tabla podemos hacerlo de dos maneras:

::: {.mycode}
[Ver columnas de una tabla]{.title}

``` mysql
mysql> SHOW COLUMNS FROM alumnos;
mysql> DESCRIBE alumnos;
```
:::


Podemos obtener más datos, como los privilegios que tenemos con el usuario que nos hemos conectado sobre cada columna haciendo:

::: {.mycode}
[Ver permisos sobre columnas]{.title}

``` mysql
mysql> SHOW FULL COLUMNS FROM alumnos;
```
:::

Y si queremos ver cómo se ha creado la tabla:

::: {.mycode}
[Ver cómo se ha creado una tabla]{.title}

``` mysql
mysql> SHOW CREATE TABLE alumnos;
```
:::


## Lenguaje de manipulación de datos: DML {#dml}

El DML (Data Manipulation Language) nos permite consultar, manipular, insertar o eliminar los datos.


### Realizar consultas {#realizar-consultas}

A la hora de realizar consultas, podemos crear distintas y de distinto tipo.

::: {.mycode}
[Consultar todos los registros de una tabla]{.title}

``` mysql
mysql> SELECT * FROM alumnos;
```
:::

::: {.mycode}
[Consultar ciertos campos de una tabla]{.title}

``` mysql
mysql> SELECT dni, nombre, nacimiento FROM alumnos;
```
:::


También podemos realizar consultas condicionales:

::: {.mycode}
[Realizar consulta condicional con una fecha]{.title}

``` mysql
mysql> SELECT dni, nombre, nacimiento
            FROM alumnos
            WHERE nacimiento > '1982-01-01';
```
:::


::: {.mycode}
[Realizar consulta condicional y ordenada]{.title}

``` mysql
mysql> SELECT dni, nombre, nacimiento
            FROM alumnos
            WHERE nacimiento > '1970-01-01'
            ORDER BY dni ASC;
```
:::

La complejidad de las consultas dependen de nuestro modelo de datos así como de los datos que queremos obtener:


::: {.mycode size=small}
[Consulta relacionando varias tablas]{.title}

``` mysql
mysql> SELECT a.dni, a.nombre, a.apellido, asig.nombre, ma.nota
            FROM alumnos as a, asignaturas as asig, matriculacion_alumno as ma
            WHERE a.dni = ma.dni_alumno
                AND asig.codigo = ma.codigo_asignatura
                AND ma.nota < 5
            ORDER BY a.dni ;
```
:::


### Inserción y modificación de datos {#insercion-modificacion-datos}


No sólo podemos realizar consultas de obtención de datos, sino que también podremos insertarlos, modificarlos o borrarlos.


::: {.mycode size=scriptsize}
[Insertar datos en una tabla]{.title}

``` mysql
mysql> INSERT INTO alumnos VALUES ('12345678Z', 'Alumno', 'Uno', '555123456','1980-01-01');
```
:::

En caso de que sólo queramos insertar parte de los datos, podremos realizar:


::: {.mycode}
[Insertar sólo datos obligatorios en una tabla]{.title}

``` mysql
mysql> INSERT INTO alumnos(dni,nombre) VALUES ('87654321A', 'Alumno2');
```
:::


A la hora de actualizar datos, deberemos elegir qué campos queremos elegir

::: {.mycode size=small}
[Actualizar ciertos campos en una tabla]{.title}

``` mysql
mysql> UPDATE alumnos SET nacimiento = '1984-01-01' WHERE dni = '87654321A';
```
:::


Y a la hora de eliminar datos, podremos hacerlo de manera condicional.

::: {.mycode}
[Eliminar ciertos registros de una tabla]{.title}

``` mysql
mysql> DELETE FROM alumnos where dni = '87654321A';
```
:::


## Control de transacciones {#control-transacciones}

Como ya se ha visto previamente, los SGBDs deben de seguir el modelo ACID de transacciones para asegurar que los datos mantienen la integridad de los datos y el aislamiento a la hora de realizar transacciones sobre los mismos datos.

Por ello, SQL permite realizar inicios de transacciones ***BEGIN***) para posteriormente aplicar todos los cambios que se han realizado (***COMMIT***) o cancelarlos (***ROLLBACK***).

::: warnbox
MySQL utiliza el método **autocommit** por defecto
:::

#### Empezar una transacción {#empezar-transacciones .unnumbered .unlisted}

Nos sirve a la hora de realizar grandes modificaciones en la base de datos. Se puede realizar de las dos maneras siguientes:

::: {.mycode}
[Hacer una transacción (se puede hacer de 2 maneras)]{.title}

``` mysql
mysql> BEGIN;
-- alternativa:
mysql> START TRANSACTION;
```
:::

A partir de aquí cualquier acción que se realice no será aplicada (aunque sí lo podremos ver en la sesión actual) hasta que no se termine la transacción.


#### Aplicar y terminar la transacción {#aplicar-terminar-transaccion .unnumbered .unlisted}

Para aplicar los cambios realizados a lo largo de la transacción, y para que los cambios sean persistentes, se deberá ejecutar:

::: {.mycode}
[Aplicar y terminar la transacción]{.title}

``` mysql
mysql> COMMIT;
```
:::


Tras esto, los cambios serán realizados y el resto de conexiones verán las modificaciones realizadas.


#### Cancelar transacción {#cancelar-transaccion .unnumbered .unlisted}

En caso de que queramos cancelar las ejecuciones realizadas desde el inicio de la transacción, deberemos ejecutar:

::: {.mycode}
[Cancelar la transacción y todo lo realizado en ella]{.title}

``` mysql
mysql> ROLLBACK;
```
:::

#### Modificar comportamiento autocommit {#modificar-comportamiento-autocommit .unnumbered .unlisted}


El comportamiento por defecto de MySQL es que cualquier ejecución es una transacción, por lo que realizará el bloqueo de datos necesario o realizará la modificación de los datos. Si queremos cambiar este comportamiento para la sesión actual deberemos hacer:


::: {.mycode}
[Modifiar el comportamiento del autocommit]{.title}

``` mysql
mysql> SET autocommit = OFF;
```
:::


