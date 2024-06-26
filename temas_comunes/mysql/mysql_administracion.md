

# Administración básica de MySQL {#administracion-basica-mysql}

Una vez tenemos instalado nuestro SGBD tenemos que aprender los conceptos básicos para poder conectarnos a él, poder configurarlo y llegar a administrarlo.

## Antes de empezar {#antes-de-empezar}

MySQL, al igual que otros SGBD y servidores en general, y más cuando hablamos de Software Libre, cuenta con una documentación online realizada por los creadores del software con la que nos tenemos que familiarizar.

El [manual de referencia de MySQL](https://dev.mysql.com/doc/refman/8.0/en/) cuenta con mucha información acerca del servicio, de la configuración y administración, pero también de cómo utilizar el lenguaje SQL. Por lo tanto, es obligatorio tener soltura buscando información en él.


## Arquitectura Cliente → Servidor en MySQL {#arquitectura-cliente-servidor-mysql}

MySQL funciona en "modo servidor" esperando a las conexiones de un cliente, lo que comúnmente se denomina "arquitectura Cliente → Servidor".

![](img/sgbd/cliente_servidor.png){width="60%"}

El cliente que efectúa la conexión puede encontrarse en la misma máquina donde está situado el servidor (conexión local) o desde una máquina externa (conexión remota).

### Conexión local (Socket) {#conexion-local-socket}

En entornos UNIX existe la posibilidad de realizar la conexión a ciertos servidores que están en la misma máquina desde la que se origina la conexión, mediante lo que se denomina un **Unix domain Socket**.

**Los sockets** en entornos GNU/Linux se pueden ver como un fichero, y **son un medio de comunicación entre procesos que se ejecutan en la misma máquina**.

La configuración estándar de MySQL arranca creando un fichero Socket en la siguiente ruta por defecto [/var/run/mysqld/mysqld.sock]{.configfile}, por lo que la posibilidad de realizar una conexión local mediante dicho socket es posible.

De hecho, nada más realizar la instalación de MySQL es la única manera de poder realizar la conexión y sólo será posible desde el usuario root:

![](img/sgbd/console_1.png){width="80%"}


Como se puede ver, en la imagen, los pasos para poder realizar la conexión han sido:

1. Convertirnos en root
2. Ejecutar el comando [mysql]{.commandbox}.


Este comando es el **cliente** MySQL que realizará la conexión contra el Servidor MySQL. Debido a que no se le ha pasado ningún parámetro al comando, éste realizará un primer intento de conexión a la ruta del socket estándar (indicada anteriormente).

Una vez realizada la conexión veremos que nos aparece un *prompt*  [mysql>]{.inlineconsole} que indica que la conexión se ha realizado correctamente y estamos en el CLI (*Command Line Interface*, Interfaz de Línea de Comandos) donde podremos ejecutar órdenes de configuración, administración o peticiones a las bases de datos.



### Conexión por red (local o remota) {#conexion-red-local-o-remoto}

En la configuración inicial de MySQL también aparece la opción de poder realizar una conexión mediante el protocolo de red **TCP**.

::: {.mycode size=scriptsize}
[Ver puertos de MySQL]{.title}

``` console
root@server1:~# ss -punta | grep -i mysql
tcp   LISTEN 0      151      127.0.0.1:3306    0.0.0.0:*      users:(("mysqld",pid=765,fd=34))
tcp   LISTEN 0      70               *:33060         *:*      users:(("mysqld",pid=765,fd=31))
```
:::


Los puertos de escucha son:

- **3306**: Puerto que escucha únicamente en la IP 127.0.0.1
- **33060**: Nuevo protocolo X (desde la versión 5.7.12) que escucha en todas las IPs del sistema.


Para poder realizar conexiones a través de estos puertos los usuarios con los que intentemos conectarnos deberán poder aceptar dicha conexión. Más adelante veremos cómo realizar estas modificaciones.

Para poder realizar esta conexión también haremos uso del comando  [mysql]{.commandbox}. pero esta vez sí le tendremos que pasar parámetros de conexión. Un ejemplo de cómo conectarnos a un servidor por conexión de red es:


::: mycode
[Conexión por red a MySQL]{.title}

``` console
ruben@server1:~$ mysql -u usuario -h 192.168.1.100 -p
```
:::


Podemos ver que se han pasado 3 parámetros y a continuación el valor que se le pasa a cada parámetro en el comando [mysql]{.commandbox}. Los parámetros son:

- **\-u**  o **\-\-user**, es el usuario con el que vamos a realizar la conexión. Si no se usa éste parámetro, por defecto se le pasará el usuario con el que estamos logueados en el sistema

- **\-h**  o **\-\-host**, es el servidor al que queremos conectarnos mediante conexión por red. Si no se pone este parámetro la conexión se intentará a 127.0.0.1

- **\-p**  o **\-\-password**, para que nos pregunte por la contraseña de conexión del usuario. Si no se pasa este parámetro se entiende que no se va a necesitar contraseña.

## Arranque, parada y estado del Servidor {#arranque-parada-y-estado-del-servidor}

Una vez instalado MySQL tenemos que conocer cuál es su estado y conocer los procedimientos de arranque y parada del servicio.



### Comprobar estado del servidor {#comprobar-estado-del-servidor}

En la instalación de MySQL se ha instalado automáticamente un servicio en [Systemd](#systemd) que nos permitirá conocer el estado de MySQL, si está arrancado o no.

Para ello deberemos ejecutar el siguiente comando:

::: mycode
[Estado del servidor MySQL]{.title}

``` console
ruben@server1:~$ sudo systemctl status mysql
```
:::


Y tras realizar la ejecución del comando, en caso de que el servicio esté arrancado veremos:

<!-- TODO: cambiar captura por texto -->

![](img/sgbd/mysql_status.png){width="80%"}


### Arranque y parada del servidor {#arranque-parada-servidor}

En caso de que queramos parar el servidor, tendremos que hacer uso de Systemd:

::: mycode
[Parar el servidor MySQL]{.title}

``` console
ruben@server1:~$ sudo systemctl stop mysql
```
:::


Y para arrancarlo de nuevo:

::: mycode
[Arrancar el servidor MySQL]{.title}

``` console
ruben@server1:~$ sudo systemctl start mysql
```
:::


## Primeros pasos {#primeros-pasos}

Como suele ser habitual cuando instalamos un servidor, viene con una configuración genérica que dista mucho de ser la ideal en un entorno productivo, y es por ello que tenemos que conocer cómo realizar modificaciones en la configuración para obtener mejores resultados.

Para poder administrar y configurar de manera correcta MySQL tendremos que conocer, al menos, lo siguiente:


- Especificaciones hardware donde está el servidor:
    - Cantidad de memoria RAM
    - Espacio en disco duro
    - Velocidad de escritura/lectura a disco duro
- Tipo de aplicación que va a utilizar MySQL
- Conexiones esperadas
- Cantidad de usuarios que se van a conectar
- Origen de las conexiones
- …


Con esta información podremos realizar un primer análisis para intentar prever si el servidor donde está el servicio MySQL corriendo es suficiente o no. Si la instalación nos corresponde a nosotros, tendremos que conocer parte de las preguntas planteadas anteriormente para realizar la instalación en un servidor que vaya a poder adecuarse a las exigencias pedidas.


### Securizar configuración inicial {#securizar-configuracion-inicial}

Dependiendo del método elegido para instalar MySQL la configuración inicial puede venir con usuarios o bases de datos de prueba que no nos interesan y que se pueden borrar. Para poder securizarlo tenemos el siguiente comando:


::: mycode
[Securizar la instalación]{.title}

``` console
root@server1:~# mysql_secure_installation
```
:::

Este script nos guiará con una serie de preguntas para securizar el servidor, que es muy utilizado en versiones anteriores, pero que no está de más ver las preguntas que nos realiza:


- "**Would you like to setup VALIDATE PASSWORD component?**": Habilita el componente de validación de contraseñas, que sirve para habilitar test de fuerza de las contraseñas, y en caso de no ser lo suficientemente seguras, no se permite crear el usuario con esa contraseña.

  ::: warnbox
  **En versiones anteriores era un PLUGIN**
  :::

  Si lo habilitamos, no preguntará qué tipo de política queremos activar sobre las contraseñas:

  - **LOW**: contraseñas de longitud mínima 8
  - **MEDIUM**: como las LOW pero con números, caracteres especiales y mayúsculas y minúsculas.
  - **STRONG**: como las MEDIUM pero que no se encuentren en un


- Nos pedirá la **contraseña del administrador "root"** de MySQL.  En la instalación de Ubuntu el usuario root se conecta mediante socket, por lo que este paso no cambiará nada.

- "**Remove anonymous users?**": En algunas distribuciones  se crean unos usuarios anónimos, que deberían ser borrados.

- "**Disallow root login remotely?**": De nuevo, en Ubuntu el usuario root sólo se puede conectar en local mediante el socket, pero en otras distribuciones es posible que root pueda conectarse por TCP desde otros servidores y/o equipos. Lo recomendable suele ser que para root no se permitan conexiones remotas.

- "**Remove test database and access to it?**": MySQL suele venir con una base de datos de prueba llamada “test”. Se puede borrar.

- "**Reload privilege tables now?**": Recargar los permisos de los privilegios, ya que hemos realizado cambios en las contraseñas.

## Ficheros de configuración {#ficheros-configuracion}

Como es habitual en GNU/Linux, los ficheros de configuración de los servicios están situados en el path [/etc]{.configdir} en este caso concreto dentro de la ruta [/etc/mysql]{.configdir} MySQL puede leer distintos ficheros de configuración, por lo que dependiendo de la distribución puede variar cuál tengamos, pero el orden suele ser:


- [/etc/my.cnf]{.configfile}: Es el primer fichero de configuración que se busca (en Ubuntu no lo tendremos)
- [/etc/mysql/my.cnf]{.configfile} : Fichero principal de configuración. En Ubuntu es un enlace simbólico a  [/etc/alternatives/my.cnf]{.configfile} que a su vez es un enlace simbólico a [/etc/mysql/mysql.cnf]{.configfile}. Esto es debido a que en versiones antiguas esta última ruta era la oficial.


Si vemos este fichero de configuración veremos que tiene una directiva "**!includedir**", esto significa que se van a incluir todos los ficheros con extensión "**cnf**" de esos directorios.

Estos ficheros de configuración tienen el formato conocido como "INI" y suele ser de este aspecto:

::: mycode
[Ejemplo de fichero de configuración por secciones]{.title}

``` ini
[section]
option1    = value

[section2]
option2     = value
```
:::



Debido a que durante la instalación de MySQL se han instalado otras herramientas, la sección determinará para qué servicio o aplicación será esa parte de la configuración:

- **mysqld**:  servidor MySQL (**mysql d**aemon)
- **mysql**: cliente de consola para realizar la conexión
- **mysqldump**: programa para realizar backups de las bases de datos.


Cuando realicemos modificaciones en la configuración de la configuración, si es para el servidor de MySQL tendremos que realizar un reinicio del servicio para que estas modificaciones sean tenidas en cuenta.

### Analizando la configuración inicial {#analizando-configuracion-inicial}

Tal como hemos comentado previamente, los ficheros de configuración en [/etc/mysql]{.configdir} pueden estar en distintos ficheros, por lo que es recomendable echar un ojo a los ficheros que tenemos tras realizar la instalación. Vamos a analizar parte del fichero: [/etc/mysql/mysql.conf.d/mysqld.cnf]{.configfile}:


::: mycode
[Ejemplo de fichero de configuración de MySQL]{.title}

``` ini
#
# The MySQL database server configuration file.
# ...
[mysqld]
#
# * Basic Settings
#
user            = mysql
# pid-file      = /var/run/mysqld/mysqld.pid
# socket        = /var/run/mysqld/mysqld.sock
# port          = 3306
# datadir       = /var/lib/mysql
bind-address      = 127.0.0.1

#
# * Fine Tuning
#
key_buffer_size         = 16M
# max_connections        = 151

#
# * Logging and Replication
#
# Both location gets rotated by the cronjob.
#
# Log all queries
# Be aware that this log type is a performance killer.
# general_log_file        = /var/log/mysql/query.log
# general_log             = 1
#
# Error log - should be very few entries.
#
log_error = /var/log/mysql/error.log
#
# Here you can see queries with especially long duration
# slow_query_log        = 1
# slow_query_log_file   = /var/log/mysql/mysql-slow.log
# long_query_time = 2
# log-queries-not-using-indexes
```
:::

Como se puede comprobar, en el fichero se pueden comprobar distintos tipos de filas, y el usar un editor que realice resaltado de sintaxis nos puede ayudar a diferenciar las líneas y lo que son. Vamos a realizar una pequeña explicación de varias líneas:


- Líneas que empiezan por "**\#**:  Al igual que sucede con otros ficheros de configuración, en este caso las líneas que empiezan por almohadilla, o "\#", son comentarios. Estas líneas son ignoradas y nos pueden ayudar a comprender la estructura del fichero o podremos poner comentarios para explicar para qué sirve una directiva de configuración.
- **[mysqld]**: Es el comienzo de la sección, y como se ha dicho previamente, esta sección será la que se utilice al arrancar MySQL. Por lo tanto, toda directiva de configuración dentro de esta sección servirá para modificar el comportamiento por defecto del servidor.
- **user**: indica al servidor MySQL con qué usuario arrancará el servidor
- **bind-address**: dirección en la que escuchará el servidor MySQL al arrancar
- **log\_error**: fichero donde aparecerá lo acontecido durante el arranque del servicio y en caso de haber errores nos indicará parte de la razón.


Otras variables que aparecen comentadas en la configuración inicial y por tanto el valor que tiene esa opción de configuración no tiene por qué ser la que se esté utilizando actualmente:


- **pid-file**: fichero donde se escribirá el PID (*Process IDentificator*) durante el arranque.
- **socket**: fichero donde está el socket.
- **port**: puerto en el que escucha MySQL.
- **datadir**: lugar donde se almacena todos los datos de las bases de datos.
- **max\_connections**: número máximo de conexiones que aceptará MySQL
- **general\_log\_file**: lugar donde se escribe el log general en caso de estar activo.
- **general\_log**: activar, o no, el log general. Como se puede comprobar en un comentario previo, puede suponer un problema en el rendimiento del servidor.
- **slow\_query\_log**: log de queries lentas.
- **long\_query\_time**: el tiempo mínimo para que una slow query se loguee.
- **log-queries-not-using-indexes**: loguear las queries que no usan índices.


Como se puede ver en estas variables de configuración, y en las anteriores, el nombre de las mismas suele ser bastante auto-explicativo, por lo que nos podemos hacer una pequeña idea de lo que pueden hacer leyendo el nombre. Eso no quita para que en caso de duda, debemos consultar el [listado completo de variables](https://dev.mysql.com/doc/refman/8.0/en/server-option-variable-reference.html) que puede llegar a tener MySQL.

Como se ha comentado previamente, en caso de realizar una modificación en el fichero de configuración, tendremos que realizar un reinicio del servicio como veremos posteriormente.

### Validando la configuración {#validando-configuracion}

Las variables de configuración que hemos visto hasta ahora cuentan con dos apartados:


- **Nombre de la variable**: puede ser una única palabra (**port**, **socket**) o varias seguidas de guión bajo (**bind\_address**, **slow\_query\_log**).
- **Valor de la variable**: Es el valor que aparece a la derecha del igual ("=") y vemos que pueden tener distintos valores: mysql, 127.0.0.1, 16M , …


Los nombres de las variables es algo que no nos podemos inventar, y es por ello por lo que deben estar bien escritas en el fichero de configuración. En caso de escribir una variable que no exista, el servidor no arrancará si hacemos un reinicio del mismo. Ejemplo:


::: {.mycode size=footnotesize}
[Ejemplo de log de error]{.title}

``` ini
2020-08-01T11:35:50.488392Z 0 [ERROR] [MY-000067] [Server] unknown variable 'mal=32M'
```
:::


Como se puede ver en esta línea de log, hay un error al haber escrito una variable desconocida (en este caso el nombre de la variable es "mal"). Esto hace que el servidor no arranque y por tanto no se pueda acceder a él y haya una pérdida de servicio. Esto no debe suceder en un servidor en producción.

Para evitar este problema, antes de realizar cualquier reinicio del servidor, debemos asegurarnos que el fichero de configuración no contiene variables desconocidas:


::: {.mycode size=footnotesize}
[Confirmar estado de la configuración]{.title}

``` console
root@ubuntu:/etc/mysql/mysql.conf.d# mysqld --validate-config

2020-08-01T12:02:41.763658Z 0 [ERROR] [MY-000067] [Server] unknown variable 'mal=32M'
2020-08-01T12:02:41.763689Z 0 [ERROR] [MY-010119] [Server] Aborting
```
:::


Esta opción nos puede ser útil si realizamos una actualización de MySQL y en la nueva versión ya no existen variables de versiones anteriores (es raro, pero puede haber opciones obsoletas).

::: errorbox
**Esta validación de configuración no hace una comprobación exhaustiva del valor adjudicado a la variable**
:::

Esta validación de configuración no hace una comprobación exhaustiva del valor adjudicado a la variable, por lo que en caso de que la variable sea correcta pero el valor adjudicado sea erróneo, al reiniciar el servidor tendremos que comprobar el log de errores para ver qué sucede. Por ejemplo, de tener lo siguiente en la configuración:

::: {.mycode}
[Error puesto en la configuración]{.title}

``` ini
bind-address            = 127.0.0.1z
```
:::



Al intentar reiniciar, veremos el siguiente error en [/var/log/mysql/error.log]{.configfile}:

::: {.mycode}
[Error en el log]{.title}

``` ini
[ERROR] [MY-010255] [Server] Can't create IP socket: Invalid argument
```
:::


En cambio, si otras variables tienen un valor incorrecto, el servidor arrancará, y el valor que cogerá la variable dependerá de cómo se parsea el fichero de configuración. Por ejemplo:

::: {.mycode}
[Error en la configuración]{.title}

``` ini
key_buffer_size            = 16Mz
max_connections            = -1
```
:::


Para conocer qué valor pueden tener estas variables, lo mejor es ir a la documentación y mirar la variable que queremos modificar o agregar.  Por ejemplo, para [slow_query_log](https://dev.mysql.com/doc/refman/8.0/en/server-system-variables.html#sysvar_slow_query_log) veremos que en la documentación tiene la siguiente tabla:


`\vspace{-10pt}`{=latex}

<!-- TODO: corregir primera fila -->

| Referencia  | Valor  |
|:-----------:|:------:|
| Command-Line Format  | \-\-slow\-query\-log=ON |
| System Variable  | slow\_query\_log  |
| Scope  | Global  |
| Dynamic  | Yes  |
| SET\_VAR Hint Applies  | No  |
| Type  | Boolean  |
| Default Value | OFF |

Table: {tablename=yukitblr}

Esta tabla nos da mucha información acerca de la variable, ya sea para poder ver qué tipo de valor es (Boolean en este caso), su valor por defecto (OFF) y si podremos o no modificarla dinámicamente (Dynamic = Yes). El valor por defecto será el valor que obtendrá la variable si no aparece en el fichero de configuración con un valor puesto por nosotros.

Otro ejemplo, [bind_address](https://dev.mysql.com/doc/refman/8.0/en/server-system-variables.html#sysvar_bind_address):


| Referencia  | Valor  |
|:-----------:|:------:|
| Command-Line Format  | \-\-sbind-addr=addr |
| System Variable  | sbind\_address |
| Scope  | Global  |
| Dynamic  | No  |
| SET\_VAR Hint Applies  | No  |
| Type  | String  |
| Default Value | * |

Table: {tablename=yukitblr}



## Variables de configuración en MySQL {#variables-configuracion-mysql}

Tal como hemos visto, el listado completo de variables tiene cientos de posibles variables que podemos ver o modificar para ajustar el servidor a nuestros intereses. Las variables se deben separar en dos partes:


- **System Var**: Variables que sirven para el arranque del servidor o para ajustar el comportamiento del mismo. Se pueden modificar.
- **Status Var**: Variables para comprobar el estado del servidor. Sólo las podremos leer.

Las variables que podremos modificar se pueden pasar por:


- **Fichero de configuración**: la versión más cómoda, tal como hemos visto previamente. Hará que nuestro servidor siempre arranque con la misma configuración ya que los ficheros estarán escritos en el servidor.
- **Línea de comandos**: al arrancar mysqld, se le pueden pasar como parámetros estas variables con los valores que queramos. Se nos puede olvidar pasar algún parámetro.


Hay variables del sistema que si nos fijamos en la tabla no se puede pasar por fichero o por línea de comandos. Esto es debido a que son variables internas de cómo ha sido compilado MySQL o que tienen en cuenta las librerías del sistemas. Por ejemplo: **version**, **have\_ssl**.


Si nos fijamos en la columna "**Var Scope**" vemos que puede tener los valores:


- **Global** : son variables que afectan a las nuevas conexiones que se realizan.
- **Session** : son variables que afectan a la sesión actual. Si intentamos leer una variable de sesión que no existe, nos mostrará el valor global.
- **Both** : son variables que existen en ambos estados, global y en sesión, y pueden diferir.
- **Varies** : Hay unas pocas variables que tienen esta opción (y también en la columna Dynamic) y nos indica que varía dependiendo de la versión de MySQL que estemos usando.


### Comprobando las variables de estado (STATUS) {#comprobando-variables-estado}

El [listado de variables](https://dev.mysql.com/doc/refman/8.0/en/server-status-variable-reference.html) de estado nos muestra el nombre de las variables por las que podemos preguntar, el tipo de valor que pueden tener y si son globales o de sesión.


Para comprobar el estado de las variables globales del servidor:


::: {.mycode}
[Ver variables de estado]{.title}

``` mysql
mysql> SHOW GLOBAL STATUS;
```
:::


Si nos interesa buscar por el nombre de alguna variable de la sesión y obtener su estado:

::: {.mycode}
[Ver variables de sesión]{.title}

``` mysql
mysql> SHOW SESSION STATUS LIKE '%slow%';
+-----------------------------+-------+
| Variable_name               | Value |
+-----------------------------+-------+
| Slow_launch_threads         | 0     |
| Slow_queries                | 0     |
+-----------------------------+-------+
2 rows in set (0.01 sec)
```
:::

### Comprobando las variables del sistema (System) {#comprobando-variables-sistema}

Hemos visto que en los ficheros de configuración no están todas las variables que hemos visto en la [documentación](https://dev.mysql.com/doc/refman/8.0/en/server-option-variable-reference.html), y no tendría mucho sentido tener que estar yendo a ella para mirar qué variables tenemos y sus posibles valores por defecto. Para ver las variables globales del sistema, **es obligatorio poner GLOBAL**:


::: {.mycode}
[Ver variables globales]{.title}

``` mysql
mysql> SHOW GLOBAL VARIABLES;
```
:::

Si queremos buscar por una variable en concreto en la sesión, poner SESSION es opcional (en lugar de GLOBAL).

De no poner en qué ámbito queremos mirar las variables, se presupone que queremos ver el estado de la variable en la sesión actual.

Si queremos buscar una variable que contenga algo en el nombre podremos hacer uso de:

::: {.mycode}
[Ver variables globales]{.title}

``` mysql
mysql> SHOW VARIABLES like '%slow%';
+----------------------------+---------------------------------+
| Variable_name              | Value                           |
+----------------------------+---------------------------------+
| log_slow_admin_statements  | OFF                             |
| log_slow_extra             | OFF                             |
| log_slow_slave_statements  | OFF                             |
| slow_launch_time           | 2                               |
| slow_query_log             | OFF                             |
| slow_query_log_file        | /var/lib/mysql/ubuntu-slow.log  |
+----------------------------+---------------------------------+
6 rows in set (0.01 sec)
```
:::


De esta manera buscamos las variables que nos puedan interesar y vemos el valor que tienen actualmente en la sesión, para así poder ver si nos interesa cambiarlo.

También podemos hacer uso desde la línea de comandos con el comando [mysqladmin]{.commandbox}, pero no tenemos tanta libertad como desde el CLI de MySQL :


::: {.mycode}
[Ver variables desde la consola]{.title}

``` console
root@server1:~# mysqladmin  variables
```
:::



### Modificar configuración "en caliente" {#modificar-configuracion-en-caliente}

Debido a que un SGBD es un servicio crítico, no siempre podremos realizar una parada de servicio debido a un cambio de configuración. Esto afectaría a todas las conexiones que tiene establecido el servidor, y cualquier intento de consulta sería rechazado durante la parada y el arranque del mismo.

No sólo eso, ya que cuando un SGBD está en funcionamiento, guarda información en memoria RAM (a modo de caché para las peticiones más realizadas, traspasa parte de las tablas a memoria, … ) y en caso de realizar un reinicio, esa memoria se liberaría y por tanto al arrancar se debería volver a pedir los datos a disco duro, haciendo que los primeros instantes de servicio sea lento.

Por ello, **se pueden realizar modificaciones de la configuración sin parar el servicio**, lo que se suele denominar “hacer modificaciones en caliente”.

Bien es cierto que no todas las variables se pueden modificar de esta manera, ya que algunas son necesarias durante el arranque del servicio. Por ejemplo:


- **port**: no podrá ser modificada "en caliente", ya que el puerto debe de ser algo que se necesita durante el arranque.
- **bind\_address**: lo mismo que la anterior.
- **slow\_query\_log**:  si se puede modificar en caliente.


Para conocer si una directiva puede ser modificada en tiempo de ejecución podremos ir al [listado completo de variables](https://dev.mysql.com/doc/refman/8.0/en/server-option-variable-reference.html) y comprobar la columna "Dynamic", si aparece "Yes" es que se podrá modificar. Anteriormente hemos visto cómo la variable [slow_query_log](https://dev.mysql.com/doc/refman/8.0/en/server-system-variables.html#sysvar_slow_query_log) tiene la opción "Dynamic" a "Yes", por lo que se puede modificar el valor dinámicamente, y para cambiarlo haremos:


::: {.mycode}
[Cambiar variable]{.title}

``` mysql
mysql> SET slow_query_log = On;
ERROR 1229 (HY000): Variable 'slow_query_log' is a GLOBAL variable
and should be set with SET GLOBAL


mysql> SET GLOBAL slow_query_log = On;
Query OK, 0 rows affected (0.01 sec)

-- alternativa
mysql> SET @@GLOBAL.slow_query_log = On;
Query OK, 0 rows affected (0.01 sec)
```
:::


Como se puede comprobar, se ha intentado modificar la variable sin poner "GLOBAL", y debido a que "slow\_query\_log" es una variable global, nos ha dado un error. Por eso **es muy importante tener en cuenta qué tipo de variable y para qué ámbito queremos realizar la modificación.** También se puede ver que la modificación se puede realizar de dos maneras.

::: warnbox
**Hay que tener en cuenta que la variable modificada en caliente no se guarda en la configuración y por tanto se perderá en el siguiente reinicio.**
:::

### Persistencia de las modificaciones {#persistencia-modificaciones}

MySQL permite que estas variables que podamos hacer que estas variables persistan tras el arranque haciendo:

::: {.mycode}
[Cambiar variable de manera persistente]{.title}

``` mysql
mysql> SET PERSIST slow_query_log  = ON;
```
:::


Esto lo que hace es crear un fichero en [/var/lib/mysql/mysqld-auto.cnf]{.configfile} con formato [JSON](json) con las variables que se ha dado la orden de persistir.

::: errorbox
**No se aconseja utilizar este método. Mejor modificar la configuración.**
:::

Aunque resulte cómodo, se aconseja realizar la modificación de la variable en el fichero de configuración correspondiente para tener todo de manera más centralizada. Para deshacer esta persistencia:

::: {.mycode}
[Eliminar las variables persistentes]{.title}

``` mysql
mysql> RESET PERSIST;
Query OK, 0 rows affected (0.00 sec)
```
:::


Y eliminará todas las entradas del fichero antes descrito: [/var/lib/mysql/mysqld-auto.cnf]{.configfile}.

