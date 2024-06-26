
# MySQL como Sistema Gestor de Base de Datos {#mysql-como-sistema-gestor-de-base-de-datos}

El SGBD que usaremos durante esta asignatura es MySQL.


## Introducción {#introducción-1}

:::::::::::::: {.columns }
::: {.column width="70%"}

MySQL es un sistema de gestión de bases de datos relacional desarrollado actualmente por Oracle Corporation, conocida empresa que también tiene su sistema SGBD Oracle privativo. MySQL cuenta con una **licencia dual**: Licencia Pública General ([GPL](#licencias_libres)) y licencia comercial, por lo que en su página web podremos encontrar ambas versiones (la primera de código abierto y gratuita, y la segunda con opción de pago, con servicios extra y soporte).

:::
::: {.column width="25%" }
![](img/sgbd/MySQL_logo.png){width="100%"}
:::
::::::::::::::

Actualmente MySQL está considerada como la base de datos relacional de código abierto más popular y se puede instalar en los tres sistemas operativos más conocidos actualmente.



### Un poco de historia {#un-poco-de-historia}

MySQL fue inicialmente desarrollado por MySQL AB (empresa fundada por David Axmark, Allan Larsson y Michael Widenius). MySQL AB fue adquirida por Sun Microsystems en 2008, y ésta a su vez fue comprada por Oracle Corporation en 2010.

Es cierto que aunque en sus primeras versiones carecía de características como la integridad referencial y transacciones (debido al motor MyISAM utilizado en la creación de tablas), que son características muy importantes en un SGBD (y que [PostgreSQL](https://es.wikipedia.org/wiki/PostgreSQL) sí tenía), no impidió que cogiera fama en los denominados entornos LAMP (Linux + Apache + MySQL + PHP).

Poco antes de la compra de Oracle, desde la comunidad libre se realizó un fork (una copia completa) del código fuente de MySQL que dió origen a **MariaDB**. Desde ese momento, ambos SGBD han tenido vidas paralelas, pero el origen es el mismo.

Muchas distribuciones GNU/Linux contaban con MySQL como sistema SGBD para poder ser instalado, pero a medida que el desarrollo de MariaDB fue ganando adeptos muchas distribuciones realizaron el cambio, por lo que en ciertas distribuciones no es posible instalar MySQL desde los [repositorios oficiales](#repositorio_de_software). De hecho, algunas distribuciones mantienen el [paquete](#paquete_de_software) MySQL pero siendo un alias para que se instale MariaDB.

Desde la compañía [Percona](https://www.percona.com/) también crearon un fork de MySQL en el que añaden mejoras creadas por ellos y también venden soporte para el mismo.

Como veremos a continuación, el no poder realizar la instalación desde los repositorios oficiales no nos impedirá tener MySQL instalado en nuestro sistema.

### Versiones de MySQL {#versiones-de-mysql}

MySQL cuenta con distintas versiones de SGBDs que hay que conocer para saber qué versión se necesita en cada caso concreto. Nos vamos a centrar en las versiones **Community** (las de licenciamiento libre), pero estas versiones también cuentan con su versión con licencia comercial.

#### MySQL Community Server {#mysql-community-server}

Es el SGBD que vamos a utilizar. Es la versión "clásica" de MySQL como SGBD, que permite crear bases de datos, introducir datos, manipularlos, ... Esta versión cuenta con la opción de crear un sistema replicado "Primario → Réplica" o "Primario ←→ Primario" como veremos a lo largo del curso.

#### MySQL Cluster {#mysql-cluster}

Originalmente MySQL no soportaba crear clusters de servidores, sólo el sistema de replicación que soporta la versión "Community Server", por lo que surgió la necesidad de poder crear un sistema clusterizado de 3 nodos o más que se gestionasen entre ellos, mantuvieran la información replicada... Eso se pudo realizar gracias a la librería Galera, que sirve para sincronizar la replicación de múltiples padres.

Hay que recordar que **MySQL Server es distinto a MySQL Cluster**, aunque desde un punto de vista de usuario que no entiende pueda parecer lo mismo.

#### MySQL Router {#mysql-router}

MySQL Router provee un enrutado transparente entre la aplicación de un usuario y cualquier servidor de MySQL. Puede sernos útil en sistemas de alta disponibilidad o de escalado para enrutar el tráfico al backend que más nos interese.

#### MySQL Workbench {#mysql-workbench}

Es un interfaz gráfico que nos proporciona herramientas para comprobar el estado de MySQL en el sistema remoto que tengamos que administrar. Existen versiones para distintos sistemas operativos y podremos instalarlo para conectarnos a servidores MySQL Remotos.

## Características de MySQL Community Server {#características-de-mysql-community-server}

MySQL cuenta con una serie de características que hace que sea utilizado como SGBD de manera generalizada actualmente. Entre las características a destacar:

-   **Facilidad de uso**: Es un SGBD sencillo de utilizar en comparación con otras alternativas libres o privativas (PostgreSQL u Oracle respectivamente)

-   **Soporte de motores de almacenamiento**: Hasta la versión 5.5 se hacía uso del motor MyISAM que no tenía integridad referencial, pero eso se cambió por el uso del motor **InnoDB** que es el utilizado actualmente. [Soporta varios motores](https://dev.mysql.com/doc/refman/8.0/en/storage-engines.html), entre los que podemos destacar:

    -   **InnoDB**: el utilizado por defecto actualmente. Es ACID compliant, seguro en transacciones, posibilidad para realizar commit y rollback.

    -   **MyISAM**: debería usarse sólo para tablas de lectura, ya que no soporta transacciones, pero es muy rápido.

    -   **Memoria**: se guarda toda la información en RAM, por lo que no sirve para persistencia de datos, pero hace que la información sea más rápida al acceder a ella

    -   **CSV**: las tablas realmente son ficheros de texto en formato CSV. No soporta indexado.

-   **Diseño multi-thread**: por lo que permite hacer uso de múltiples hilos de CPU en caso de que estén disponibles.

-   **Replicación**: Permite crear entornos de replicación Primario → Réplica y Primario ←→ Primario.

-   **Multiplataforma**: Funciona en distintas plataformas (distintas versiones de GNU/Linux, MacOS, Windows, FreeBSD, ...).

-   **Software Libre**: Tiene [licencia libre](#licencias_libres) lo que hace que podamos ver cómo funciona, y realizar modificaciones al código. Con ello se ha conseguido:

    -   **Mucho soporte de la comunidad**: Existen muchas herramientas realizadas por la comunidad que facilitan el uso y/o la administración de servidores MySQL.



## Instalación de MySQL Community Server {#instalación-de-mysql-community-server}

Como ya se ha mencionado antes, en algunas distribuciones MySQL ha sido sustituido por MariaDB (como en el caso de Debian), mientras que en otras se puede realizar la instalación de cualquiera de las dos (el caso de [Ubuntu](#ubuntu)).

Aunque haremos uso de la distribución Ubuntu, también se va a explicar brevemente cómo se haría la instalación en sistemas donde no podemos contar con el paquete en el repositorio oficial.

### Sin paquete en el repositorio oficial {#sin-paquete-en-el-repositorio-oficial}

En caso de que nuestra distribución no cuente con el paquete en los repositorios oficiales, la instalación no será tan directa, pero eso no significa que sea difícil. La versión Community Server la podremos encontrar en su [web de descarga](https://dev.mysql.com/downloads/mysql/), y desde aquí podremos descargarnos la versión que necesitemos para el sistema operativo que queramos.

En el caso de que queramos instalarlo en una distribución de GNU/Linux como Debian, Red Hat o Suse podremos hacer uso de los repositorios oficiales de MySQL para realizar la instalación. En el caso de Debian, sería:





- Descargar el paquete para poder configurar el repositorio oficial de MySQL para Debian/Ubuntu.
- Instalar el paquete:

::: mycode
[Instalar paquete MySQL descargado de la web oficial]{.title}

``` console
ruben@server1:~$ sudo dpkg -i mysql-apt-config_0.8.15-1_all.deb
```
:::

- Elegir en el menú que nos aparecerá:
  - En qué distribución estamos (ya que el mismo paquete sirve para Debian y Ubuntu).

    ![](img/sgbd/install_1.png){width="60%" framed=true}

  - Qué versión vas a querer instalar (dependiendo de la distribución y la versión en la que nos encontremos nos dejará unas versiones u otras).

    ![](img/sgbd/install_2.png){width="60%" framed=true}

- Instalar mysql-server (tal como veremos a continuación en Ubuntu).



### En Ubuntu 20.04 {#en-ubuntu-20.04}

La versión [LTS](#lts) de Ubuntu 20.04 cuenta con la versión **8.0 de MySQL** (concretamente la **8.0.21** en el momento en el que es creado este documento).

Debido a que contamos con esta versión, que es la última versión de MySQL podremos realizar la instalación de la siguiente manera:

::: mycode
[Instalar paquete MySQL del repositorio de la distribución]{.title}

``` console
ruben@server1:~$ sudo apt install mysql-server-8.0
```
:::

