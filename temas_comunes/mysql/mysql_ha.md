
# Alta Disponibilidad en un SGBD {#alta-disponibilidad-en-un-sgbd}


En lo que se refiere a los SGBDs, y en concreto a MySQL, podemos diferenciar entre los siguientes tipos de alta disponibilidad que veremos a continuación.

## Primario - Replica {#primario-replica}

:::::::::::::: {.columns }
::: {.column width="55%"}

También denominado "Primario → Réplica" (antiguamente denominado "Maestro → Esclavo"). Es un tipo de alta disponibilidad pasiva en el que contamos con dos servidores.

El principal/primario/master es el que recibe todas las modificaciones que se realizan en la base de datos, y por tanto debe de estar en funcionamiento para poder recibir las modificaciones de datos.

:::
::: {.column width="40%" }
![](img/sgbd/primario_replica.png){width="100%"}
:::
::::::::::::::


El secundario/réplica/esclavo, como su nombre indica, recibe los datos replicados del principal. Es posible recibir en este servidor peticiones de "SELECTS" para que así quite carga al principal, pero hay que asegurarse de no recibir ni INSERTS ni UPDATES.

En caso de que exista algún problema con el servidor primario, el servidor de réplica deberá pasar a ser el primario, por lo que habrá que hacer que también reciba los inserts. En caso de que el servidor haya sido configurado en modo "sólo lectura", habrá que quitarlo.

Podemos destacar de este tipo de replicación las siguientes características:

-   Sistema sencillo de replicación.

-   La sincronización es asíncrona por defecto. El servidor secundario no tiene por qué estar todo el rato conectado. Cuando se conecte, pedirá y recibirá todas las modificaciones desde la última realizada.

-   Dependiendo de la configuración realizada en el servidor secundario, se replicará todo, sólo alguna base de datos o sólo alguna tabla.

-   Para no cargar al servidor primario, los backups se pueden realizar sobre el servidor de réplica.

-   Se pueden realizar réplicas a larga distancia, estando el servidor de réplica en otro datacenter.

Hay que tener en cuenta que si el servidor réplica se detiene, **las modificaciones del primario se guardan en unos ficheros llamados *binlogs***. Estos ficheros se suelen configurar para almacenar una cantidad de datos precisa, por lo que si el tiempo de caída del servidor réplica supera el tiempo que los binlogs almacenan información, al retomar la actividad no obtendrá todos los datos del servidor primario.


## Primario - Primario {#primario-primario}

:::::::::::::: {.columns }
::: {.column width="55%"}

Una replicación "Primario ←→ Primario" en MySQL no es más que una replicación "Primario → Réplica" de doble sentido.

Esto quiere decir que ambos servidores pueden recibir todo tipo de consultas y modificaciones. El problema es que podría darse el caso de que dos INSERT simultáneos en ambos servidores obtengan identificadores auto-incrementales idénticos, lo que daría error a la hora de realizar los INSERT.

:::
::: {.column width="40%" }
![](img/sgbd/primario_primario.png){width="100%"}
:::
::::::::::::::


Por lo tanto, para evitar eso, lo que se hace es modificar las variables auto-increment para que en uno de los servidores se den números pares y en el otro impares. Estas variables son:

-   **auto_increment_increment**: es el incremento que se realiza entre valor y valor de "auto_increment". En este caso, debe de ser "2" en ambos servidores porque es el número de servidores que tenemos.

-   **auto_increment_offset**: determina el comienzo del sistema "auto_increment" en nuestro servidor. En este caso, la variable obtendrá valores distintos en los servidores:

    -   "1": en un servidor, por lo tanto, en este siempre habrá valores impares.

    -   "2": en el otro servidor, por lo que los valores serán pares.

Para que ambos servidores reciban peticiones, la aplicación que las pida podrá preguntar a ambos servidores o podremos tener un servidor proxy por delante que realice un balanceo de peticiones a ambos servidores.

## MySQL Cluster {#mysql-cluster-1}

:::::::::::::: {.columns }
::: {.column width="55%"}

Como ya se ha comentado previamente, MySQL Cluster es un SGBD distinto a MySQL Community, y el tipo de Alta Disponibilidad que podemos obtener con él es distinto a los citados previamente. En este caso, el número de servidores mínimos con los que deberemos contar será de 3, y a partir de ahí deberá ser siempre número impar.

:::
::: {.column width="40%" }
![](img/sgbd/mysql_cluster.png){width="100%"}
:::
::::::::::::::


No entraremos en detalle en este sistema, pero a grandes rasgos podemos pensar de él como un sistema "Primario ←→ Primario" multi servidor. **En este caso la sincronización es síncrona**, es decir, **antes de dar por terminada una sentencia se asegura que está replicada en todos los servidores**.



# Sistema "Primario → Réplica" con MySQL {#sistema-primario-réplica-con-mysql}

Como se ha visto, MySQL permite distintos tipos de replicación y creación de infraestructura en Alta Disponibilidad. En nuestro caso, vamos a optar por la más sencilla de todas ellas, que es la replicación "Primario → Réplica".

Para ello, contaremos con dos servidores Ubuntu 20.04 recién instalados con MySQL Community también recién instalados, y a partir de aquí comenzaremos a realizar la configuración oportuna que necesitaremos para conseguir nuestro objetivo.

## A tener en cuenta {#a-tener-en-cuenta}

Antes de comenzar con la configuración tiene que quedar clara una serie de conceptos:

-   Los datos deben de ser insertados/actualizados en el principal.

-   Una vez realizadas las modificaciones son escritas en los **binary-log** del principal.

-   El servidor réplica, para evitar problemas, debería estar en modo "sólo lectura".

-   El servidor réplica se conecta al primario en busca de las modificaciones (en los binary-log) y ejecutará las órdenes en el propio servidor réplica.

    -   El servidor réplica mantiene la posición del binary-log en la que se encuentra.

    -   MySQL acepta replicación de una serie a una versión superior, pero nunca haciendo saltos de dos versiones.

-   Cada servidor contará con **server-id** distinto.

## Creación del sistema principal/origen {#creación-del-sistema-principalorigen}

Con todo lo citado previamente, los pasos para crear el sistema primario son los siguientes:

1.  Configurar servidor con IP estática

2.  Modificar configuración de MySQL

3.  Crear usuario de replicación

4.  Hacemos backup inicial de los datos.

Se obvia el primer paso ya que es configuración del sistema operativo y [aparece en el anexo](#configurar_ip_estatica_ubuntu).

### Configuración del servidor principal {#configuración-del-servidor-principal}

En el fichero de configuración del servidor principal tendremos que modificarlo para que aparezca la siguiente configuración

::: mycode
[Configuración MySQL del primario]{.title}

``` ini
[mysqld]
...
server-id = 1
log_bin = /var/log/mysql/binlog
binlog_expire_logs_seconds     = 2592000
max_binlog_size = 100M
```
:::

Una vez modificado el fichero de configuración, el servidor debe ser reiniciado. Para comprobar si el servidor está en modo "primario" podemos consultarlo de la siguiente manera:


::: mycode
[Comprobar estado del primario]{.title}

``` mysql
mysql> SHOW MASTER STATUS \G
*************************** 1. row ***************************
File: mysql-bin.000001
Position: 1397
Binlog_Do_DB:
Binlog_Ignore_DB:
Executed_Gtid_Set:
1 row in set (0.00 sec)
```
:::


Podemos observar el fichero "mysql-bin" y la posición del mismo del servidor principal.


### Crear usuario de replicación {#crear-usuario-de-replicación}

Como se ha comentado previamente, el servidor réplica se conectará al principal, por lo que tiene que existir un usuario con el que poder conectarse y comprobar el estado de los binlogs.

::: {.mycode size=footnotesize}
[Crear usuario para la replicación]{.title}

``` mysql
CREATE USER 'repl'@'192.168.1.21' IDENTIFIED WITH mysql_native_password BY 'password';
GRANT REPLICATION SLAVE ON *.* TO 'repl'@'192.168.1.21';
FLUSH PRIVILEGES;
```
:::


Hay que tener en cuenta que la IP tendrá que ser la IP del servidor réplica y será con este usuario con el que realizará la conexión. Es obligatorio poner "mysql_native_password" ya que el nuevo sistema de autenticación "caching_sha2_password" necesita de certificados para realizar la conexión.

### Backup inicial del servidor primario/origen {#backup-inicial-del-servidor-primarioorigen}

Una vez configurado el servidor en modo primario, realizaremos el backup inicial que posteriormente será cargado en el servidor réplica. Debido a la configuración que hemos realizado, el servidor réplica deberá conocer a partir de qué posición del binlog obtener las modificaciones después de haberse realizado el backup. Por tanto, el backup debe realizarse de la siguiente manera:

::: {.mycode}
[Hacer backup inicial para la replicación]{.title}

``` console
root@server1:~# mysqldump --all-databases --source-data > dbdump.sql
```
:::


Y como se puede comprobar, el parámetro nuevo es "\-\-source-data", que hará que dentro del fichero de backup aparezca (es posible que en el futuro aparezca como "PRIMARY" o "PRIMARY_LOG\_"):

::: {.mycode size=small}
[Hacer backup inicial para la replicación]{.title}

``` mysql
...
--
-- Position to start replication or point-in-time recovery from
--
CHANGE MASTER TO MASTER_LOG_FILE='mysql-bin.000001', MASTER_LOG_POS=1397;
...
```
:::


Esta información es el punto exacto en el que se ha quedado el binlog (tanto en qué fichero como en qué posición) cuando se ha realizado el backup. Esta información la necesitaremos para posteriormente en el servidor réplica indicarle que es a partir de este punto el que deberá pedir la información a replicar.


## Creación del sistema secundario/réplica {#creación-del-sistema-secundarioréplica}

En el caso del servidor secundario los pasos a realizar son:

1.  Configurar IP estática.

2.  Modificar la configuración de MySQL.

3.  Importar backup.

4.  Configuración de conexión al servidor primario.

5.  Comenzar la replicación.

6.  Comprobar estado de la replicación.

### Modificar configuración en el servidor RÉPLICA {#modificar-configuración-en-el-servidor-réplica}

En este caso, la modificación que debemos de realizar es cambiar el **server-id**, que tendrá que ser distinto al del primario, y podremos poner de manera opcional el nombre del servidor réplica en la variable **report_host**.

::: {.mycode}
[Configuración MySQL del servidor réplica]{.title}

``` ini
[mysqld]
...
server-id = 2
# la opción report_host es opcional
report_host = server2
```
:::



### Importar el backup {#importar-el-backup}

Tal como se realiza de cualquier backup, teniendo el backup en el propio servidor réplica:

::: {.mycode}
[Restaurar backup inicial]{.title}

``` console
root@server1:~# mysql < dbdump.sql
```
:::

### Configuración de conexión al primario {#configuración-de-conexión-al-primario}

Desde el CLI de MySQL debemos realizar la siguiente sentencia, teniendo en cuenta:

-   La IP de nuestro servidor primario.

-   Los datos del usuario de replicación creado previamente.

-   Los datos de binlog que hemos podido obtener del fichero de replicación.

::: {.mycode}
[Configuración de conexión al servidor primario]{.title}

``` mysql
mysql> CHANGE REPLICATION SOURCE TO
          SOURCE_HOST='192.168.1.129',
          SOURCE_USER='repl',
          SOURCE_PASSWORD='password',
          SOURCE_LOG_FILE='mysql-bin.000001',
          SOURCE_LOG_POS=1397;
```
:::

## Comenzar la replicación {#comenzar-la-replicación}

Ahora el servidor réplica tiene que comenzar la replicación a partir de la posición y del fichero del bin-log que se ha configurado. Es de suponer que el servidor primario ha recibido modificaciones, y por tanto, deben ser replicadas.

::: {.mycode}
[Comenzar la replicación]{.title}

``` mysql
mysql> START REPLICA;
```
:::

## Comprobar estado de la replicación {#comprobar-estado-de-la-replicación}

La replicación es un proceso que debe de ser monitorizado y nos debemos asegurar que funciona de manera correcta. Para conocer cuál es el estado de la replicación podremos obtenerlo ejecutando:

::: {.mycode}
[Comprobar estado de la replicación]{.title}

``` mysql
mysql> SHOW REPLICA STATUS \G
*************************** 1. row ***************************
         Replica_IO_State: Waiting for source to send event
              Source_Host: 192.168.200.10
              Source_User: repl
              Source_Port: 3306
            Connect_Retry: 60
          Source_Log_File: mysql-bin.000001
      Read_Source_Log_Pos: 3256
           Relay_Log_File: ubuntu-relay-bin.000003
            Relay_Log_Pos: 324
    Relay_Source_Log_File: mysql-bin.000001
       Replica_IO_Running: Yes
      Replica_SQL_Running: Yes
...
    Seconds_Behind_Source: 0
...
Replica_SQL_Running_State: Replica has read all relay log;
waiting for more updates
```
:::


Como alternativa, también podremos ver desde el servidor primario cuántos servidores réplica tiene, pero la información proporcionada es escasa, pero nos puede servir para obtener información de un servidor no instalado por nosotros.

::: {.mycode}
[Estado de servidores réplica desde el primario]{.title}

``` mysql
mysql> SHOW REPLICAS;
+-----------+---------+------+-----------+---------------------------+
| Server_Id | Host    | Port | Source_Id | Replica_UUID              |
+-----------+---------+------+-----------+---------------------------+
|         2 | server2 | 3306 |         1 | 9fb33895-4c78-11ec-b23... |
+-----------+---------+------+-----------+---------------------------+
1 row in set (0,00 sec)
```
:::


# Ficheros binary logs {#ficheros-binary-logs}

Durante la replicación se han usado los binary logs, y para activarlos se ha tenido que configurar en el servidor primario/origen las siguientes variables de configuración:

-   log_bin = /var/log/mysql/binlog

-   binlog_expire_logs_seconds = 2592000

-   max_binlog_size = 100M

El significado de las variables es el siguiente:

-   **log_bin**: path donde se van a guardar los binlogs. Siendo el ejemplo de arriba, obtendremos unos ficheros tal que:

    -   /var/log/mysql/mysql-bin.000001

    -   /var/log/mysql/mysql-bin.000002

    -   /var/log/mysql/mysql-bin.000003

    -   ...

-   **binlog_expire_logs_seconds**: el número de segundos que pasarán antes de que los binlogs se borren de manera automática. Significa que tendremos tantos ficheros binlog como para poder guardar los cambios acontecidos en la base de datos durante la cantidad de segundos puesta.

    Eso significa, que si nuestra réplica está menos de 30 días sin conectarse al primario (por un fallo de conectividad), podríamos llegar a recuperar la replicación sin necesidad de rehacer nada, sólo consiguiendo que la conectividad vuelva a funcionar. Por otro lado, la cantidad de datos almacenados en esa cantidad de días en los ficheros binlog puede hacer que nuestro servidor ocupe mucho espacio, por lo que se debería pensar en guardar esos binlogs en otra partición o modificar la variable.

-   **max_binlog_size**: tamaño máximo que alcanzará cada fichero binlog. En caso de llegar al tamaño especificado, se creará un nuevo fichero binlog, modificando el índice y el nombre del nuevo fichero. El tamaño máximo que puede tener cada binlog es 1GB.


## Borrado de binlogs {#borrado-de-binlogs}

En caso de necesidad (por falta de espacio en el servidor), podemos realizar el borrado de ficheros binlogs siempre y cuando nos hayamos asegurado que la réplica ya los ha recibido (es decir, la replicación esté correcta, o el binlog por el que vaya la réplica sea mayor al que queremos borrar).

::: warnbox
**Antes de borrar binlogs, debemos asegurar que los servidores réplica están sincronizados**
:::

Podemos realizar el borrado de binlogs indicando el fichero:

::: {.mycode}
[Borrado de binlogs indicando el fichero]{.title}

``` mysql
mysql> PURGE BINARY LOGS TO 'mysql-bin.000010';
```
:::


Como alternativa, también podemos especificar que borre todos los logs anteriores a la fecha y hora indicada, borrando así los ficheros necesarios para ello. De nuevo, nos tendremos que asegurar de que la replicación esté correcta antes de hacerlo.

::: {.mycode}
[Borrado de binlogs indicando la fecha]{.title}

``` mysql
mysql> PURGE BINARY LOGS BEFORE '2020-11-11 00:00:00';
```
:::

