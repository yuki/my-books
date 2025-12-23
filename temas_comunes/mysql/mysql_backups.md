
# Gestión de backups en MySQL {#gestión-de-backups-en-mysql}

Con la instalación del servidor de MySQL se realiza la instalación de ciertas aplicaciones de administración del servidor, entre las que se encuentran el programa para la realización de backups: **mysqldump**.

Existen distintas maneras de realizar un backup en MySQL, entre las que se pueden destacar:

-   **Backup completo**: Backup de todas las bases de datos que se encuentran instaladas en el servidor, incluyendo las del sistema.

-   **Backup de base de datos**: Se realizaría el backup de la base de datos en concreto elegida.

-   **Backup de tabla**: En este caso realizaríamos el backup de las tablas de una base de datos que nos interese.

Una vez elegido el tipo de backup que vamos a realizar deberemos elegir la herramienta que usaremos para llevar a cabo la estrategia planteada:

-   **mysqldump**: Script incluido en las herramientas instaladas junto con MySQL. Por defecto realiza backups en formato de texto plano que podemos guardar en un fichero. Nos permite realizar backup completos, de ciertas bases de datos o de tablas concretas.

-   **Percona XtraBackup**: Herramienta creada por la empresa [Percona](https://www.percona.com/software/mysql-database/percona-xtrabackup) que nos permite realizar copias de seguridad sin realizar bloqueos en la base de datos.

-   **Otras herramientas**: Existen multitud de herramientas para realizar backups para MySQL. Antes de hacer uso de ellas, deberemos asegurarnos que cumplen con nuestras necesidades.

Hay que tener en cuenta que los backups de los datos de las bases de datos no realiza un backup de los ficheros de configuración que se sitúan en [/etc/mysql]{.configdir} por lo que el backup de esta configuración debe realizarse por algún otro método, ya que la configuración del servidor también es muy importante.



## Herramienta propia: mysqldump {#herramienta-propia-mysqldump}

Vamos a hacer uso de la herramienta propia que se instala junto a MySQL, que es mysqldump. Este programa es muy sencillo de utilizar ya que los parámetros que reciben son similares al propio CLI.

Por otro lado, el fichero generado con este programa es un fichero de texto que puede ser visualizado con cualquier editor en caso de necesidad, y fácilmente importado en cualquier otro servidor.


::: mycode
[Ayuda del comando mysqldump]{.title}

``` console
root@ubuntu:~# mysqldump
Usage: mysqldump [OPTIONS] database [tables]
OR     mysqldump [OPTIONS] --databases [OPTIONS] DB1 [DB2 DB3...]
OR     mysqldump [OPTIONS] --all-databases [OPTIONS]
For more options, use mysqldump --help
```
:::


Tal como podemos ver, si ejecutamos el script, nos da una ligera idea de cómo podemos realizar un backup con con el mismo. En caso de que el backup sea de una máquina remota para traerlo a local, podremos hacer uso de varios parámetros, por ejemplo [mysqldump -u USER -h IP_REMOTA -p]{.commandbox}, como cuando usamos el CLI.


### Backup completo {#backup-completo}

Un backup completo de MySQL hará que se guarde toda la información de las bases de datos internas del sistema, en las que se incluyen los usuarios y sus privilegios.

Este sistema es el método más sencillo si queremos realizar después una restauración completa en un nuevo servidor.

::: mycode
[Hacer backup completo]{.title}

``` console
root@ubuntu:~# mysqldump --all-databases > backup-completo.sql
```
:::


De esta manera, le hemos indicado al script mysqldump que realice un backup de todas las bases de datos y el contenido obtenido lo vuelque al fichero backup-completo.sql. Este fichero generado es un fichero de texto que contendrá las bases de datos del sistema, usuarios, privilegios...



### Backup de base de datos {#backup-de-base-de-datos}

Podemos realizar el backup únicamente de una, o varias, bases de datos que nos pueda interesar. Para poder realizar el backup de la base de datos que nos interese se hace uso del parámetro "**--databases**" seguido del nombre de las bases de datos, o en su forma abreviada "**-B**". Los dos siguientes comandos son iguales:

::: mycode
[Hacer backup de sólo las bases de datos DB1 y DB2]{.title}

``` console
root@ubuntu:~# mysqldump --databases DB1 DB2 > backup-db1-db2.sql
root@ubuntu:~# mysqldump -B DB1 DB2 > backup2-db1-db2.sql
```
:::


Al crear el backup de una, o varias, base de datos de la anterior manera, en el fichero de backup nos aparecerá algo tal que:

::: mycode
[Información interna del backup]{.title}

``` mysql
CREATE DATABASE /*!32312 IF NOT EXISTS*/ `DB1`;
USE `DB1`;
```
:::

De esta manera, lo que nos está indicando el backup es que a la hora de restaurar, en caso de que no exista DB1 se creará previamente. Posteriormente realizará el borrado de las tablas y las volverá a crear para realizar el insert de datos.

También podremos obviar el argumento, por lo que en caso de introducir un único parámetro, lo tomará com la base de datos de la que realizar copia de seguridad.

::: mycode
[Hacer backup de una única base de datos]{.title}

``` console
root@ubuntu:~# mysqldump DB1 > backup-DB1.sql
```
:::


Al hacer el backup de esta manera, en el fichero no aparecerá la creación de la base de datos, por lo que a la hora de realizar la importación tendremos que hacerlo sobre una base de datos ya creada.


### Backup de una tabla {#backup-de-una-tabla}

Puede darse casos que nos interese realizar backups de una única tabla, o poder hacer backups de una tabla de manera más seguida, y para ello podremos ejecutar:

::: mycode
[Hacer backup de una sola tabla]{.title}

``` console
root@ubuntu:~# mysqldump DB1 asignaturas > backup-DB1-asignaturas.sql
```
:::



De esta manera hacemos backup de la tabla "asignaturas" de la base de datos DB1.


## Importar un backup {#importar-un-backup}

Tal como hemos visto existen distintas maneras de realizar un backup, por lo que dependiendo de cómo es el backup que queremos importar, se hará de una manera u otra.

Hay que entender que la importación de un backup puede suponer la pérdida de datos de las bases de datos del servidor donde importamos el backup, por lo que hay que asegurarse muy bien qué queremos restaurar y dónde lo vamos a restaurar para no haya pérdida de datos donde no queremos.

::: warnbox
**Importar datos de un backup puede suponer la pérdida de datos en el servidor donde se realiza la importación.**
:::

También es lógico pensar que dependiendo de la herramienta utilizada para realizar el backup la importación del mismo no tiene por qué ser igual, ya que distintas herramientas pueden dar lugar a distintos tipos de ficheros.

::: warnbox
**Antes de restaurar un backup confirma cómo se hizo y cómo haces la importación.**
:::


### Importar backups de mysqldump {#importar-backups-de-mysqldump}

Como se ha comentado previamente, mysqldump se instala junto con el servidor, y debido a que es una herramienta sencilla de usar, su importación también es sencilla. Para realizar la importación de este tipo de backups haremos uso del propio CLI [mysql]{.commandbox}.


#### Importar un backup completo {#importar-un-backup-completo}

**Al importar un backup completo haremos la sustitución de todas las tablas internas de MySQL** por los datos que haya en el backup. Por lo tanto, nos tendremos que asegurar muy bien de que el servidor donde realizaremos la importación de datos es un servidor sin datos importantes.

Para importar un backup completo haremos:

::: mycode
[Importar un backup completo]{.title}

``` console
root@ubuntu:~# mysql < backup-completo.sql
```
:::


Con esto estaremos indicando que el contenido del fichero de backup se importe sobre la conexión que hemos realizado, en este caso en local.


#### Importar un backup de una base de datos {#importar-un-backup-de-una-base-de-datos}

Tal como hemos visto antes, a la hora de crear el backup de una, o varias, base de datos se puede realizar añadiendo el parámetro "--databases", "-B" o sin especificar nada, sólo la base de datos. Dependiendo de cómo se haya creado el backup, la importación variará:

-   Si el backup se ha realizado con "**--databases**" o "**-B**" en el propio backup aparece:

    <!-- FIXME: corregir los espacios -->

    ::: mycode
    ["Create database" en el propio fichero de backup]{.title}

    ``` console
CREATE DATABASE /*!32312 IF NOT EXISTS*/ `DB1`;
    ```
    :::


    y para realizar la importación:

    ::: mycode
    [Importar un backup completo]{.title}

    ``` console
root@ubuntu:~# mysql < backup-DB1.sql
    ```
    :::


-   Si no hemos especificado más que el nombre de la base de datos, en el backup no aparece la creación o uso de la base de datos, por lo que tendremos que indicarlo en la importación, y **la base de datos "restaurado" debe existir previamente**.

    ::: mycode
    [Importar un backup completo en una base de datos llamada "restaurado"]{.title}

    ``` console
root@ubuntu:~# mysql restaurado < backup-DB1.sql
    ```
    :::


#### Importar un backup de una tabla {#importar-un-backup-de-una-tabla}

Por último, si queremos importar un backup donde sólo existen tablas, a la hora de importar deberemos indicar en qué base datos queremos realizar la importación, ya que en el backup no aparece dicha información. Por ejemplo:

::: mycode
[Importar un backup de una tabla en la base de datos "restauracion"]{.title}

``` console
root@ubuntu:~# mysql restauracion < backup-db1-asignaturas.sql
```
:::


De esta manera estamos indicando al CLI que el contenido del fichero de backup se importe sobre la base de datos *restauración*. Lógicamente esta base de datos debe estar creada previamente.

