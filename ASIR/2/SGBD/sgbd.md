
# Introducción {#introducción}

Hoy en día es habitual que los datos que usamos estén almacenados en una Base de Datos. Da igual que ese dato lo estemos utilizando desde un navegador web, en una aplicación de móvil o una videojuego. Cada consulta que realicemos al dato y cada posible modificación o eliminación del mismo realizará una petición (consulta o modificación) a un Sistema Gestor de Base de Datos.

Cada consulta realizada, cada petición de actualización o cada eliminación de datos, tendrá que ser procesada por el Gestor de Base de Datos y analizada para comprobar que lo que se va a realizar, como los permisos de quién pide la acción son adecuados, para posteriormente realizar la acción.

Los datos almacenados en una base de datos son de gran importancia en una empresa, por lo que la continuidad del servicio, así como la seguridad de los accesos recae en los administradores de Bases de Datos (DBA o DataBase Administrator) que deberán asegurar que el funcionamiento sea el esperado, así como la gestión de copias de seguridad de los mismos.

A lo largo de esta asignatura recordaremos los conceptos básicos de las bases de datos, comprenderemos la importancia y las funciones que desempeñan un Sistema Gestor de Base de Datos, aprenderemos a administrar el SGBD, crear y gestionar backups así como montar un sistema en [Alta Disponibilidad](#altadisponibilidad).

# Repaso {#repaso}

A modo de repaso rápido de la asignatura Gestión de Bases de Datos, veremos rápidamente unos conceptos que nos deberían ser conocidos.

## ¿Qué es una Base de Datos? {#qué-es-una-base-de-datos}

Recordemos que una base de datos es un conjunto de datos que suelen pertenecer a un mismo contexto y que está almacenado para poder ser consultado posteriormente. Aunque actualmente una base de datos se asocia a un sistema informático, una biblioteca también puede considerarse una base de datos, ya que almacena libros que se pueden consultar, y el bibliotecario (el que te da acceso a los libros, si es que perteneces a la biblioteca) podría ser el símil del sistema gestor de la base de datos.

Actualmente las bases de datos se encuentran en todos los lugares, no sólo en servidores específicamente creados para ellos. Algunos ejemplos:

-   Cada vez que usamos una aplicación de móvil, la propia aplicación cuenta con una base de datos interna (aparte de los datos que pueda consultar a bases de datos externas)

-   Las páginas web que visitamos almacenan datos en pequeñas bases de datos en los propios navegadores que usamos.

-   Aplicaciones de escritorio que guardan las preferencias del usuario en bases de datos.

No todas las bases de datos tienen por qué ser gestionadas por sistemas gestores (como los ejemplos puestos previamente), ya que el acceso a los datos quizá no sea necesario que esté controlado, pero en entornos empresariales es lo habitual.

## Tipos de Bases de Datos {#tipos-de-bases-de-datos}

Las bases de datos se pueden clasificar de varias maneras, teniendo en cuenta el contexto que estemos manejando, las necesidades que tengamos, el tipo de datos que estemos utilizando...

Nos vamos a centrar en la clasificación teniendo en cuenta los distintos modelos de administración de los datos, concrétamente en el **modelo relacional**, aunque veremos otros también utilizados.

### Bases de datos relacionales {#bases-de-datos-relacionales}

Es el modelo más utilizado actualmente para representar problemas reales y administrarlos de manera dinámica. El paradigma nació en **1970** de la mano de [Edgar Frank Codd](https://es.wikipedia.org/wiki/Edgar_Frank_Codd) cuya idea es el uso de "relaciones".



:::::::::::::: {.columns }
::: {.column width="60%"}
En este modelo, el lugar y la forma en que se almacenen los datos no tienen relevancia (que sí tenían otros modelos previos).

Para que una base de datos sea considerada relacional debe de seguir el modelo relacional, por lo que antes de introducir datos, para crear la base de datos **habremos realizado los pasos necesarios para pasar del modelo entidad-relación al modelo relacional**. Es por ello que hay que acordarse siempre de realizar la **normalización de la base datos**.

:::
::: {.column width="36%" }
![Origen: [wikipedia](https://commons.wikimedia.org/wiki/File:Ejemplo_Diagrama_E-R_extendido.PNG)](img/sgbd/ejemplo_diagrama_E-R_extendido.png){width="100%"}
:::
::::::::::::::



Para este tipo de bases de datos el lenguaje de consultas utilizado es el **SQL** (en inglés *Structured Query Language*; en castellano: lenguaje de consulta estructurada) el cual abordaremos más adelante.

### No relacionales {#no-relacionales}

Antes y después de la aparición del modelo relacional han existido distintos modelos de base de datos (jerárquico, de red, multidimensionales... ), por lo que hay que entender que el relacional no es el único modelo existente, aunque sí el más utilizado.

#### Bases de datos Documentales {#bases-de-datos-documentales}

Las bases de datos documentales son aquellas que se encargan de almacenar datos de tipo documento, también conocidos como datos semi-estructurados.

En el dato almacenado puede existir una estructura fija, o que puede ser modificada en el tiempo. Normalmente esta información suele estar almacenada en [JSON](#json) o XML.

Este tipo de bases de datos entran dentro de las denominadas [NoSQL](https://es.wikipedia.org/wiki/NoSQL), cuyos datos no requieren estructuras fijas como tablas y cuyo acceso suele realizarse mediante el sistema "clave-valor".

Las bases de datos NoSQL están altamente optimizadas para las operaciones recuperar y agregar, y normalmente no ofrecen mucho más que la funcionalidad de almacenar los registros. No suele ser habitual el poder realizar consultas de tipo JOIN, por lo que este tipo de operaciones se realizaría desde la aplicación que realiza las consultas de obtención de datos.

No entraremos en este modelo de base de datos, debido a sus diferencias con el modelo relacional, pero es obligatorio conocer que existen y que son utilizadas en aplicaciones como las redes sociales (por ejemplo).

Algunos ejemplos de gestores NoSQL son: [MongoDB](https://es.wikipedia.org/wiki/MongoDB), [Elasticsearch](https://es.wikipedia.org/wiki/Elasticsearch), ...



# Sistemas Gestores de Bases de Datos {#sistemas-gestores-de-bases-de-datos}


:::::::::::::: {.columns }
::: {.column width="80%"}

Un Sistema Gestor de Base de Datos es un conjunto de programas que permiten el almacenamiento, modificación y consulta de datos de una base de datos. Teniendo en cuenta los permisos del solicitante se le otorgarán ciertos privilegios lo que hará que se le permitirá acceder (o no) a ciertas funciones que podrá realizar sobre los datos.

Estos sistemas proporcionan distintas tareas para mantener la integridad de los datos, administrar el acceso y la opción de recuperar información en caso de que el sistema se corrompa.

:::
::: {.column width="17%" }
![Origen: [wikipedia](https://commons.wikimedia.org/wiki/File:Componentes_de_un_base_de_datos.jpg)](img/sgbd/Componentes_de_un_base_de_datos.jpg){width="100%"}
:::
::::::::::::::


Tal como se puede ver en la imagen, el ejemplo de uso habitual de un Sistema Gestor de Base de Datos se puede resumir de la siguiente forma:

-   El usuario se comunica con el SGBD (Sistema Gestor de Base de Datos, o en inglés DBMS: DataBase Management System).

-   El SGBD comprueba que el usuario tiene permisos para acceder a los datos.

-   El SGBD conoce cómo están almacenados los datos por lo que hará uso del método de acceso adecuado de cómo se han guardado los datos.

-   Se recuperan los datos del dispositivo físico concreto donde estén almacenados los datos, teniendo en cuenta los datos pedidos por el usuario y el método de acceso.

-   Se le entregan los datos al usuario.

Todas estas tareas deben de realizarse de la manera más rápida posible, por lo que la optimización de cada una de las partes debe de ser adecuada.



## Componentes de un SGBD {#componentes-de-un-sgbd}

Normalmente un SGBD tiene los siguientes componentes:

-   El **motor de la base de datos** acepta peticiones lógicas de los otros subsistemas del SGBD, las convierte en su equivalente físico y accede a la base de datos y diccionario de datos en el dispositivo de almacenamiento.

-   El **subsistema de definición de datos** ayuda a crear y mantener el diccionario de datos y define la estructura del fichero que soporta la base de datos.

-   El **subsistema de manipulación** de datos ayuda al usuario a añadir, cambiar y borrar información de la base de datos y la consulta para extraer información. El subsistema de manipulación de datos suele ser la interfaz principal del usuario con la base de datos, y normalmente se hace uso del lenguaje SQL.

-   El **subsistema de administración** ayuda a gestionar la base de datos ofreciendo funcionalidades como almacenamiento y recuperación, gestión de la seguridad, optimización de preguntas, control de concurrencia y gestión de cambios.

Dependiendo del SGBD que utilicemos, podremos contar con otros apartados que vienen incluídos, o programas externos que podremos utilizar para ampliar alguna funcionalidad del mismo.

## Modelo ACID de transacciones {#modelo-acid-de-transacciones}

En bases de datos se denomina **ACID** a las características de los parámetros que permiten clasificar las transacciones de los sistemas de gestión de bases de datos, donde ACID es un acrónimo en inglés de ***A**tomicity, **C**onsistency, **I**solation and **D**urability* (en castellano: Atomicidad, Consistencia, Aislamiento y Durabilidad).

Las definiciones son:

-   **Atomicidad**: Una transacción es una unidad lógica de trabajo que contiene una o varias sentencias SQL. El principio básico de una transacción es el todo o nada, una operación atómica tiene éxito o falla como un todo.

    -   Un SGBD ha de ser capaz de asegurar la integridad de los datos ante la concurrencia de varios usuarios a la vez.

    -   Un SGBD debe de ser capaz de agrupar varias sentencias SQL,de tal manera que puedan ser validadas (**commit**) o desechadas (**rollback**) como una unidad.

    -   **Ejemplo**: en el caso de una transacción bancaria o se ejecuta tanto el depósito y la deducción o ninguna acción es realizada

-   **Consistencia**: (Integridad). Es la propiedad que asegura que sólo se empieza aquello que se puede acabar. Por lo tanto se ejecutan aquellas operaciones que no van a romper las reglas y directrices de Integridad de la base de datos.

    -   El SGBD debe asegurar que cualquier transacción llevará a la base de datos desde un estado válido a otro también válido.

    -   El SGBD debe asegurar que los datos son exactos y consistentes, es decir que estén siempre intactos, sean siempre los esperados y que de ninguna manera cambian ni se deformen. De esta manera podemos garantizar que la información que se presenta al usuario será siempre la misma.

-   **Isolation / Aislamiento**: Esta propiedad asegura que una operación no puede afectar a otras.

    -   Esto asegura que la realización de dos transacciones sobre la misma información sean independientes y no generen ningún tipo de error.

    -   Esta propiedad define cómo y cuándo los cambios producidos por una operación se hacen visibles para las demás operaciones concurrentes.

    -   El aislamiento puede alcanzarse en distintos niveles, siendo el parámetro esencial a la hora de seleccionar SGBDs.

-   **Durabilidad / Persistencia**: Esta propiedad asegura que una vez realizada la operación, ésta persistirá y no se podrá deshacer aunque falle el sistema y que de esta forma los datos sobrevivan.



## Software SGBD {#software-sgbd}

Actualmente existen distintos SGBD que podemos instalar en nuestros servidores. Cada uno de ellos cuentan con sus características propias, por lo que tendremos que conocer las necesidades que tenemos a la hora de elegir entre ellas.

-   [MySQL](https://es.wikipedia.org/wiki/MySQL): base de datos relacional, desarrollada por Oracle desde que en 2008 ésta se hiciera con Sun Microsystems y de licencia libre (aunque también cuenta con una versión no-libre).

-   [PostgreSQL](https://es.wikipedia.org/wiki/PostgreSQL): base de datos relacional, desarrollada por PostgreSQL Global Development Group y de licencia libre.

-   [SQL Server](https://es.wikipedia.org/wiki/Microsoft_SQL_Server): base de datos relacional, desarrollada por Microsoft.

-   [Oracle Database](https://es.wikipedia.org/wiki/Oracle_Database): base de datos de tipo objeto-relacional desarrollada por Oracle Corporation.

-   [DB2](https://en.wikipedia.org/wiki/IBM_Db2_Family): base de datos relacional, desarrollada por IBM.

-   [MongoDB](https://es.wikipedia.org/wiki/MongoDB): base de datos documental, desarrollada por MongoDB y de licencia libre.

-   [Cassandra](https://es.wikipedia.org/wiki/Apache_Cassandra): base de datos NoSQL distribuida y basada en el modelo clave-valor, desarrollada por Apache y de licencia libre.

-   [Elasticsearch](https://es.wikipedia.org/wiki/Elasticsearch): base de datos documental que cuenta con un servidor de búsqueda de texto completo.

Existen otros SGBD (tanto relacionales como no), pero el listado muestra las más conocidas y utilizadas a día de hoy. La elección del SGBD que vayamos a utilizar en nuestro proyecto debería ir acompañado de un análisis profundo de las características de cada uno de ellos, así como de las necesidades que requerimos.

