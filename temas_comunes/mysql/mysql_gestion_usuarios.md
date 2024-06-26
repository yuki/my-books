
# Gestión de usuarios {#mysql-gestion-usuarios}

MySQL permite la creación de cuentas que habilitan la conexión de clientes de usuario al servidor y el acceso a los datos que gestiona el servidor (ya sea conexiones mediante CLI o aplicación).

La función principal del sistema de privilegios de MySQL es la de permitir la conexión que se conecta desde un equipo remoto y asociarla a un usuario con permisos sobre una base de datos para que pueda ejecutar funciones tal que  SELECT, INSERT, UPDATE y DELETE. Un usuario también puede recibir permisos para realizar funciones privilegiadas.

Para controlar qué usuarios pueden conectarse, cada cuenta tendrá asignada un credencial de autenticación, como puede ser la contraseña. Las funciones sobre usuarios más habituales son: CREATE USER, GRANT y REVOKE.

El sistema de privilegios de MySQL asegura que **los usuarios sólo pueden realizar las funciones que le son permitidas**. Cuando un usuario se conecta al servidor MySQL **su identidad es determinada por**:


- El equipo remoto desde el que se realiza la conexión: no es lo mismo que la conexión se realice desde la IP local, desde una IP 192.168.1.100 o desde 172.26.20.2

- El nombre de usuario que se haya especificado.


Cuando se realice la conexión, el sistema otorga privilegios de acuerdo con la  identidad del usuario y desde donde se recibe la conexión, permitiendo, o no, ciertas acciones sobre los datos.


![](img/sgbd/cliente_servidor.png){width="60%"}



## Cuentas de usuarios y contraseñas {#cuentas-usuarios}

MySQL guarda las cuentas de usuario y sus contraseñas en la tabla **user** de la base de datos del sistema **mysql**. Como ya se ha indicado, una cuenta se define con el nombre de usuario y el host desde el que se establece la conexión. MySQL soporta distintos tipos de autenticación, no sólo contraseñas. La autenticación está gestionado por el [plugin de autenticación de cuentas](https://dev.mysql.com/doc/refman/8.0/en/authentication-plugins.html). Algunos tipos de autenticación que soporta MySQL 8:


- Contraseña
- Autenticación PAM (para Linux y Mac)
- LDAP
- Autenticación mediante socket (conexiones locales)


### Creación de usuarios {#creacion-usuarios}

Como ya se ha explicado, es importante entender que para que la conexión sea correcta no sólo importa el usuario de conexión, sino desde donde se realiza la misma. Es por ello que a la hora de crear un usuario tendremos que conocer este dato ya que es importante. Aparte, tendremos que poner una contraseña, si es necesario, que sea lo suficientemente segura como para que pase el paso realizado en la [securización inicial](securizar-configuracion-inicialq). A la hora de crear usuarios [hay muchas opciones](https://dev.mysql.com/doc/refman/8.0/en/create-user.html).


#### Crear usuario local (SOCKET) {#crear-usuario-socket .unnumbered .unlisted}

El usuario solo se va a conectar desde la propia máquina, conexión mediante socket:

::: {.mycode}
[Crear usuario que sólo se conecte por socket]{.title}

``` mysql
mysql> CREATE USER 'mikeldi'@'localhost' IDENTIFIED WITH auth_socket;
```
:::


#### Crear usuario local (conexión TCP) {#crear-usuario-tcp  .unnumbered .unlisted}
La conexión va a ser local, pero se va a hacer uso del protocolo TCP, y en este caso es necesario introducir contraseña.

::: {.mycode}
[Crear usuario que sólo se conecte por TCP]{.title}

``` mysql
mysql> CREATE USER 'usuario'@'localhost' IDENTIFIED BY 'password';
```
:::


#### Crear usuario para conexión remota (TCP) {#crear-usuario-remoto-tcp .unnumbered .unlisted}

Si queremos que la conexión se pueda realizar desde una IP concreta:

::: {.mycode}
[Crear usuario que sólo pueda conectarse desde una IP]{.title}

``` mysql
mysql> CREATE USER 'usuario2'@'192.168.122.1' IDENTIFIED BY 'password';
```
:::


Si queremos que un usuario se pueda conectar desde cualquier IP:


::: {.mycode}
[Crear usuario que pueda conectarse desde cualquier IP]{.title}

``` mysql
mysql> CREATE USER 'usuario3'@'%' IDENTIFIED BY 'password';
```
:::


#### Crear usuario y que se le expire la contraseña {#crear-usuario-expirar .unnumbered .unlisted}

El usuario se crea con la contraseña del comando, pero cuando se loguee no podrá realizar nada hasta que cambie la contraseña (ver más adelante):

::: {.mycode size=small}
[Crear usuario y que la contraseña expire]{.title}

``` mysql
mysql> CREATE USER 'usuario4'@'%' IDENTIFIED BY 'password' PASSWORD EXPIRE;
```
:::


Si queremos que la contraseña le expire en 10 días:

::: {.mycode size=scriptsize}
[Crear usuario y que la contraseña expire]{.title}

``` mysql
mysql> CREATE USER 'usuario5'@'%' IDENTIFIED BY 'password' PASSWORD EXPIRE INTERVAL 10 DAY;
```
:::


### Conexión de usuarios {#conexion-usuarios}
Dependiendo de cómo se realice la conexión (por socket o TCP) el método de conexión será de una manera u otra.


#### Conexión por socket {#conexion-socket .unnumbered .unlisted}
Para poder conectarnos por socket, tenemos que tener acceso a él, siendo lo habitual conexión local. El usuario utilizado será el usuario del sistema:

::: {.mycode}
[Conexión por socket desde el usuario root]{.title}

``` console
root@server1:~# mysql
```
:::


#### Conexión remota {#conexion-remota .unnumbered .unlisted}

Suponiendo que el servidor MySQL está en la IP 192.168.122.145, la conexión deberá realizarse de la siguiente manera (hay que tener en cuenta el origen de la conexión también).

::: {.mycode}
[Conexión al servidor 192.168.122.145]{.title}

``` console
ruben@server1:~$ mysql -u usuario2 -h 192.168.122.145 -p
```
:::

#### Conocer el usuario de conexión: {#conocer-el-usuario-de-conexión .unnumbered .unlisted}

Para asegurarnos con qué usuario nos hemos conectado:


::: {.mycode}
[Ver el usuario con el que nos hemos conectado]{.title}

``` mysql
mysql> select user();
+------------------------+
| user()                 |
+------------------------+
| usuario2@192.168.122.1 |
+------------------------+
1 row in set (0.00 sec)
```
:::


#### Cambiar la contraseña del propio usuario: {#cambiar-la-contraseña-del-propio-usuario .unnumbered .unlisted}

Si nos conectamos con un usuario que tiene la opción "PASSWORD EXPIRE" activada, para cambiar la contraseña deberemos loguearnos con ese usuario y realizar:


::: {.mycode}
[Cambiar la contraseña]{.title}

``` mysql
mysql> set password='password';
```
:::

### Ver los usuarios que existen {#ver-los-usuarios-que-existen}

Los usuarios se guardan dentro de la tabla user en la base de datos mysql. Para poder ver los usuarios creados:

::: {.mycode}
[Mirar tabla de usuarios]{.title}

``` mysql
mysql> use mysql;
mysql> select * from user;
```
:::


Para poder ver de otra manera los datos de los usuarios:



::: {.mycode}
[Mirar la tabla en modo vertical]{.title}

``` mysql
mysql> select * from user\G
*************************** 1. row ***************************
                 Host: %
                 User: usuario2
          Select_priv: N
          Insert_priv: N
          Update_priv: N
          Delete_priv: N
          Create_priv: N
...
          max_updates: 0
      max_connections: 0
 max_user_connections: 0
               plugin: caching_sha2_password
authentication_string: $A$005$lq-g:Ps27zVBGU8SnP7eg7WK3qnQ6R
     password_expired: N
password_last_changed: 2020-09-05 18:22:11
...
```
:::


### Limitando los recursos de las cuentas {#limitando-los-recursos-de-las-cuentas}

Las cuentas de usuarios pueden tener recursos limitados. Estos límites se pueden poner al crear un usuario:

::: {.mycode size=scriptsize}
[Limitar el número de queries por hora.]{.title}

``` mysql
mysql> CREATE USER 'lim1'@'localhost' IDENTIFIED BY 'frank' WITH MAX_QUERIES_PER_HOUR 20;
```
:::



O se pueden añadir los límites sobre cuentas ya creadas:


::: {.mycode}
[Limitar el número de conexiones a 2 para el usuario]{.title}

``` mysql
mysql> ALTER USER 'usuario'@'localhost' WITH MAX_USER_CONNECTIONS 2;
```
:::


::: {.mycode size=small}
[Limitar el número de conexiones a 20 por hora]{.title}

``` mysql
mysql> ALTER USER 'usuario'@'localhost' WITH MAX_CONNECTIONS_PER_HOUR 20;
```
:::


::: {.mycode}
[Limitar el número de queries a 500 por hora]{.title}

``` mysql
mysql> ALTER USER 'usuario'@'localhost' WITH MAX_QUERIES_PER_HOUR 500;
```
:::


::: {.mycode}
[Limitar el número de updates a 500 por hora]{.title}

``` mysql
mysql> ALTER USER 'usuario'@'localhost' WITH MAX_UPDATES_PER_HOUR 500;
```
:::


### Borrado de usuarios {#borrado-de-usuarios}

Al borrar usuarios la sentencia "DROP USER" borra una o más cuentas y sus privilegios.

Al hacer un "DROP USER", si el usuario tiene establecida una conexión no se borrará el usuario podrá seguir haciendo peticiones. Cuando la conexión se cierre será cuando se borre el usuario, y su siguiente conexión no se podrá establecer.

Al borrar un usuario no se pierden los objetos que el usuario haya creado.

::: {.mycode}
[Borrar usuario]{.title}

``` mysql
mysql> DROP USER 'usuario'@'localhost';
```
:::


### Bloqueo de usuarios {#bloqueo-de-usuarios}

Como borrar un usuario no se puede deshacer, podría ser recomendable bloquear antes la cuenta hasta asegurar al 100% que el usuario que vamos a borrar no se va a volver a necesitar:

::: {.mycode}
[Bloquear un usuario]{.title}

``` mysql
mysql> ALTER USER 'usuario'@'localhost' ACCOUNT LOCK;
```
:::



### Renombrar un usuario {#renombrar-un-usuario}

Podemos renombrar un usuario, cambiando el usuario y el origen de la conexión. Si la cuenta ya existe obtendremos un error.

::: {.mycode}
[Renombrar un usuario]{.title}

``` mysql
mysql> RENAME USER 'usuario'@'localhost' TO 'ruben'@'192.168.122.1';
```
:::

### Cambiar contraseña al usuario {#cambiar-contraseña-al-usuario}

Es interesante realizar modificaciones en las contraseñas de usuarios cada cierto tiempo.


::: {.mycode}
[Cambiar contraseña de un usuario]{.title}

``` mysql
mysql> SET PASSWORD FOR 'ruben'@'192.168.122.1' = 'password2';
```
:::



## Privilegios de usuarios {#privilegios-de-usuarios}

Hasta ahora lo que hemos permitido es que un usuario pueda realizar una conexión, pero un usuario conectado no puede realizar ninguna acción sobre tablas ya que no tiene permisos sobre nada. La sentencia **GRANT** da permisos a las cuentas de usuarios y establece qué operaciones puede realizar.

En la documentación oficial podemos ver todo los [privilegios que pueden tener los usuarios](https://dev.mysql.com/doc/refman/8.0/en/privileges-provided.html).

En la siguiente tabla se muestran sólo unos pocos de los privilegios, y siempre conviene ir a la documentación oficial teniendo en cuenta la versión de MySQL que estamos utilizando, para confirmar los privilegios que existen:


| Privilege | Grant Table Column | Context | 
|---|---|---|
| ALL PRIVILEGES | Synonym for "all privileges" | Server administration |
| ALTER | Alter\_priv | Tables |
| CREATE | Create\_priv | Databases, tables, or indexes |
| CREATE USER | Create\_user\_priv | Server administration |
| CREATE VIEW | Create\_view\_priv | Views |
| DELETE | Delete\_priv | Tables |
| DROP | Drop\_priv | Databases, tables, or views |
| DROP ROLE | Drop\_role\_priv | Server administration |
| GRANT OPTION | Grant\_priv | Databases, tables, or stored routines |
| INDEX | Index\_priv | Tables |
| INSERT | Insert\_priv | Tables or columns |
| SELECT | Select\_priv | Tables or columns |
| ... | ... | ... |

Table: {tablename=yukitblr colspec=X[2,l]X[3,l]X[3,l]}


Tal como se puede ver, existen multitud de privilegios que se les puede otorgar a los usuarios. Vamos a ver cómo añadir y modificar los permisos de los usuarios.

### Añadir permisos a usuarios {#añadir-permisos-a-usuarios}

Existen muchos tipos de privilegios que podemos otorgar a los usuarios, y veremos una pequeña muestra de ellos.

#### Dar todos los permisos a todo MySQL {#dar-todos-los-permisos-a-todo-mysql .unnumbered .unlisted}


::: {.mycode}
[Se le otorgan todos los permisos sobre todo]{.title}

``` mysql
mysql> GRANT ALL ON *.* TO 'nuevo_admin'@'192.168.1.10';
```
:::

#### Dar todos los permisos sobre tablas {#dar-todos-los-permisos-sobre-tablas .unnumbered .unlisted}


::: {.mycode}
[Se le otorgan todos los permisos sobre todas las tablas de la base de datos db1]{.title}

``` mysql
mysql> GRANT ALL ON db1.* TO 'usuario'@'localhost';
```
:::



#### Dar permisos de SELECT {#dar-permisos-de-select .unnumbered .unlisted}

Es decir, el usuario podrá realizar consultas SELECT sobre la tabla alumnos de la base de datos db1.


::: {.mycode}
[Sólo realizar consultas SELECT sobre la tabla alumnos de la base de datos db1.]{.title}

``` mysql
mysql> GRANT SELECT ON db1.alumnos TO 'usuario2'@'%';
```
:::


#### Dar permisos de INSERT {#dar-permisos-de-insert .unnumbered .unlisted}

::: {.mycode}
[El usuario podrá realizar inserciones en la tabla asignaturas.]{.title}

``` mysql
mysql> GRANT INSERT ON db1.asignaturas TO 'usuario2'@'%';
```
:::



#### Delegar permisos (GRANT) {#delegar-permisos-grant .unnumbered .unlisted}

Se puede dar permisos a un usuario para que pueda delegar permisos a otro usuario, pero sólo podrá dar los permisos que él mismo tenga.

::: {.mycode}
[Para que el usuario pueda delegar permisos]{.title}

``` mysql
mysql> GRANT ALL ON prueba.* TO 'usuario3'@'%' WITH GRANT OPTION;
```
:::


### Activar nuevos permisos {#activar-nuevos-permisos}

Los nuevos permisos no son aplicados hasta que no se ejecuta la siguiente sentencia:

::: {.mycode}
[Para aplicar las modificaciones de permisos]{.title}

``` mysql
mysql> FLUSH PRIVILEGES;
```
:::


### Eliminar permisos a usuarios {#eliminar-permisos-a-usuarios}

Se pueden eliminar, o revocar, permisos a usuarios:

::: {.mycode}
[Revocar permisos de INSERT al usuario:]{.title}

``` mysql
mysql> REVOKE INSERT ON prueba.asignaturas FROM 'usuario2'@'%';
```
:::



### Visualizar permisos usuarios {#visualizar-permisos-usuarios}

Ver los permisos de nuestro usuario

::: {.mycode}
[Ver los permisos del usuario actual]{.title}

``` mysql
mysql> SHOW GRANTS;
```
:::

::: {.mycode}
[Ver los permisos de usuario2]{.title}

``` mysql
mysql> SHOW GRANTS FOR 'usuario2'@'%';
```
:::

