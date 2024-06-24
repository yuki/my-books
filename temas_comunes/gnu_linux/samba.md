
# SAMBA {#samba}

## Introducción {#introducción}

Samba es una implementación libre del protocolo de archivos compartidos que es utilizado por los sistemas Microsoft Windows para sistemas de tipo UNIX. De esta forma, es posible que ordenadores con GNU/Linux, Mac OS X o Unix en general se vean como servidores o actúen como clientes en redes de Windows.

Samba también permite validar usuarios haciendo de Controlador Principal de Dominio (PDC), como miembro de dominio e incluso como un dominio Active Directory para redes basadas en Windows.

Samba fue desarrollado originalmente para Unix por Andrew Tridgell utilizando un sniffer, o capturador de tráfico, para entender el protocolo usando **ingeniería inversa**.

### SMB/CIFS {#smbcifs}

Server Message Block (**SMB**) y Common Internet File System (**CIFS**) son protocolos de red desarrollados para compartir archivos e impresoras entre nodos de una red. El protocolo SMB fue desarrollado originalmente por IBM y posteriormente ampliado por Microsoft y renombrado como CIFS.

Los términos SMB y CIFS son a menudo intercambiables pero hay características en la implementación de SMB de Microsoft que no son parte del protocolo SMB original. Sin embargo, desde una perspectiva funcional, ambos son protocolos utilizados por Samba.

La versión 1 del protocolo SMB no debería usarse, y en Samba está deshabilitado por defecto, debido a los ataques que hubo por el ransomware [Wannacry](https://es.wikipedia.org/wiki/Ataques_ransomware_WannaCry). Estos ataques utilizaban una vulnerabilidad en servidores que no estaban parcheados.

## Instalación {#instalación}

Para instalar Samba haremos uso de los repositorios oficiales de nuestra distribución, y por tanto, podremos instalarlo haciendo uso del siguiente comando:

::: mycode
[Instalamos SAMBA y parte de las dependencias]{.title}
``` console
root@vega:~# apt install samba cifs-utils smbclient winbind
```
:::


Tras la instalación, nos habrá creado un directorio de configuración [/etc/samba]{.configdir} , cuyo fichero de configuración principal es [/etc/samba/smb.conf]{.configfile} . Tras la instalación, tendremos un fichero de configuración estándar que no podrá realizar demasiado, ya que la configuración es escasa.

## Comprobar configuración {#comprobar-configuración}

Como ya se ha comentado, la configuración principal está en [/etc/samba/smb.conf]{.configfile} , con una configuración estándar, por lo que tendremos que adecuarla a nuestras necesidades.

Para asegurar que las modificaciones que hemos realizado son correctas, podremos hacer uso del siguiente comando:

::: mycode
[Comprobar configuración de Samba]{.title}
``` console
root@vega:~# testparm
```
:::


Es aconsejable ejecutarlo antes de realizar ningún reinicio del servicio, ya que de haber algún error el servicio se quedaría parado, y por tanto dejaríamos sin servicio a los usuarios.

Una vez realizado los cambios y comprobado que el fichero no contiene ningún error (al menos a nivel de sintaxis), reiniciamos el servicio de la siguiente manera:

::: mycode
[Reiniciar servicio de Samba]{.title}
``` console
root@vega:~# systemctl restart smbd
```
:::


El problema con el comando anterior es que Samba cuenta con varios servicios: smbd, nmbd, winbindd... por lo que para evitar que se nos olvide reiniciar uno, o asegurar que toda la configuración se recarga, lo mejor es hacer:

::: mycode
[Recargar toda la configuración de Samba]{.title}
``` console
root@vega:~# smbcontrol all reload-config
```
:::


Una vez reiniciada la configuración, podremos listar los servicios que está compartiendo y/o usando Samba con el siguiente comando:

::: mycode
[Resumen de la configuración de Samba]{.title}
``` console
root@vega:~# smbclient -L localhost
```
:::



## Samba como servidor "standalone" {#samba-como-servidor-standalone}

Samba tiene distintos modos de funcionar, siendo el sistema "standalone" el método por defecto que suele estar configurado en las distribuciones GNU/Linux.

Cuando el servidor está en este modo puede correr por sí solo o puede unirse a dominios de Windows. Es el método más sencillo de funcionar y **es utilizado para compartir carpetas de manera sencilla**.

Este modo "standalone" suele ser utilizado cuando tenemos pocos usuarios y sólo queremos compartir carpetas, como puede ser en casa o una oficina. En el momento en el que tenemos varios usuarios y queremos que nuestro servidor se convierta en un Active Directory **no tendremos que utilizar este modo**.

## Samba como Controlador de Dominio {#samba-como-controlador-de-dominio}

Desde la versión 4, se permite configurar Samba como un servidor de dominio al más puro estilo Active Directory siendo compatible con él, por lo que podremos hacer que nuestros equipos con Windows Pro se puedan conectar al dominio creado en Samba.

### Preparando el servidor {#preparando-el-servidor}

Antes de realizar la configuración del Dominio tenemos que realizar una serie de modificaciones para dejar el servidor preparado.

#### Poner IP estática {#poner-ip-estática}

Tal como hicimos con Windows Server, todo servidor debe de tener puesta una IP estática para poder realizar sus funciones de manera correcta. Para realizar la configuración de IP estática en Ubuntu los pasos están en el [anexo](#configurar_ip_estatica_ubuntu).

#### Modificación del DNS {#modificación-del-dns}

Ubuntu cuenta con un servidor DNS propio configurado en el sistema que nos puede causar problemas a la hora de ejecutar Samba y que entre en servicio su propio DNS, por lo tanto lo que se va a realizar en este apartado es desactivar el DNS de Ubuntu. En otras distribuciones (como sucede en Debian) este proceso no es necesario al no contar con un servidor DNS instalado previamente.

Los pasos para parar y desactivar el DNS son:

::: mycode
[Paramos y deshabilitamos el servicio DNS "resolved"]{.title}
``` console
root@vega:~# systemctl stop systemd-resolved
root@vega:~# systemctl disable systemd-resolved
```
:::


De no ejecutar estos comandos, Samba nos dará errores durante la ejecución. Estos comandos hacen que el DNS actual se pare y se deshabilite para que no se vuelva a activar en el siguiente arranque.

::: errorbox
**¡Reiniciamos el servidor! Así será más fácil realizar los siguientes pasos.**
:::

Tras reiniciar, tenemos que hacer que nuestro servidor utilice el servicio DNS que va a levantar Samba. Para ello, tenemos que borrar el fichero [/etc/resolv.conf]{.configfile} (que realmente es un enlace simbólico creado por el anterior servicio), volverlo a crear y asegurarnos que aparece lo siguiente:


::: mycode
[Configuración del fichero /etc/resolv.conf]{.title}
``` ini
nameserver 127.0.0.1
```
:::



#### Configurar fichero /etc/hosts {#configurar-fichero-etchosts}

Antes de realizar la configuración del Dominio, tenemos que realizar una nueva configuración en el fichero [/etc/hosts]{.configfile} , para que se vea reflejado lo siguiente:

::: mycode
[Configuración del fichero  /etc/hosts]{.title}
``` ini
127.0.0.1      localhost
192.168.1.200  dc.midominio.com dc
```
:::


Donde:

-   **192.168.1.200**: es la IP de nuestro servidor (tendrás que modificar y poner la IP de tu equipo).

-   **dc**: es el nombre del servidor que hemos puesto durante la instalación (cuidado que sale dos veces).

-   **midominio.com**: es el dominio que queremos configurar a continuación en Samba.

Con esto hecho, podremos continuar y configurar Samba como nuestro Controlador de Dominio.

### Configurar Samba como Controlador de Dominio {#configurar-samba-como-controlador-de-dominio}

Para comenzar con la configuración de Samba como un controlador de dominios para sistemas Windows tendremos que parar el servidor Samba:

::: mycode
[Paramos todos los servicios de SAMBA]{.title}
``` console
root@vega:~# smbcontrol all shutdown
```
:::


Esto hace que los servicios de Samba (**smbd** y **nmbd**) se paren. Debido a que el fichero de configuración va a sufrir grandes cambios, y la configuración que tiene tras la instalación no es necesaria, se va a mover el fichero de configuración para guardarlo como backup:

::: mycode
[Movemos el fichero de configuración original de SAMBA]{.title}
``` console
root@vega:~# cd /etc/samba
root@vega:~# mv smb.conf smb.conf_backup
```
:::


Al igual que hicimos con Windows Server a la hora de crear Active Directory, en Samba también vamos a necesitar de un DNS que esté gestionado por el propio controlador de dominio. En nuestro caso, como veremos más adelante, **Samba levantará un DNS propio**, pero tendremos que hacer que nuestro sistema GNU/Linux haga uso de él, tal como se explicará en el siguiente apartado.

Antes de eso, para realizar la configuración inicial del dominio, tenemos que ejecutar:

::: mycode
[Usamos el asistente de creación del dominio]{.title}
``` console
root@vega:~# samba-tool domain provision
```
:::


Nos va a realizar una serie de preguntas, que tendremos que contestar:

-   **Realm**: el nombre del Dominio que queremos crear. Ejemplo: **linuxdc.com**.

-   **Domain**: Nombre de dominio **NETBIOS**. Debe ser una única palabra de máximo 15 caracteres. Por ejemplo linuxdc.

-   **Server Role**: Es el tipo de rol que va a tener nuestro servidor. Puede ser uno de los siguientes:

    -   **dc**: Domain Controller, es decir, controlador de dominio de Windows. Este es el modo que nos va a interesar en nuestro caso, ya que actuará como si se tratara de un Active Directory.

        En el fichero de configuración nos aparecerá como "active directory domain controller"

    -   **member**: Miembro de un dominio. Nos permitiría que Samba sea un miembro de un dominio Windows.

    -   **standalone**: Este es el modo por defecto una vez hemos instalado Samba, tal como se ha comentado previamente.

-   **DNS backend**: Servidor backend de DNS. Al igual que Windows hacía uso de DNS, Samba cuando se convierte en controlador de dominio también. Existe la posibilidad de utilizar un servidor DNS propio (como Bind) pero en caso de usar "**SAMBA_INTERNAL**" Samba levantará un DNS propio.

-   **DNS forwarder IP address**: El DNS al que se preguntará los DNS que desconocemos. Podemos poner el de Google, 8.8.8.8, o cualquier otro DNS público.

-   **Administrator password**: Contraseña del administrador del Controlador de Dominio.

Una vez realizada la configuración inicial, antes de arrancar tenemos que instalar Winbind, que es necesario, y por si acaso lo paramos, para que después lo arranque Samba:

::: mycode
[Paramos el servicio winbind]{.title}
``` console
root@vega:~# systemctl stop winbind
```
:::


Hay que recordar que **ahora mismo tenemos el servicio de Samba parado**, y lo único que hemos realizado ha sido la configuración inicial, por lo que el fichero de configuración [/etc/samba/smb.conf]{.configfile} ha sido modificado teniendo en cuenta las respuestas que hayamos dado previamente.

#### Arranque en modo interactivo {#arranque-en-modo-interactivo}

Tras realizar los pasos anteriores, nuestro servidor está listo para arrancar en modo Domain Controller, para ello en una consola ejecutaremos:

::: mycode
[Arrancamos SAMBA en modo interactivo]{.title}
``` console
root@vega:~# samba -F -i -d1
```
:::


Los parámetros "-F -i -d1" sirve para arrancar Samba y que podamos ver qué está sucediendo durante la ejecución de Samba. Arrancarlo así nos sirve para poder ver si existe algún error en tiempo real. Una vez todo sea correcto, podríamos parar la ejecución de este comando (con **ctrl+c**) y lanzar el demonio de manera normal.

Para ver los puertos que está usando Samba (como el 53 del DNS) podríamos ejecutar el siguiente comando:


::: {.mycode size=scriptsize}
[Comprobamos los puertos utilizados por SAMBA]{.title}
``` console
root@vega:~# ss -puntal | grep smb

Netid  State   Recv-Q  Send-Q   Local Address:Port  Peer Address:Port  Process
tcp    LISTEN  0       50       0.0.0.0:139         0.0.0.0:*    users:(("smbd",pid=6041,fd=47))
tcp    LISTEN  0       50       0.0.0.0:445         0.0.0.0:*    users:(("smbd",pid=6041,fd=46))
tcp    LISTEN  0       50       [::]:139            [::]:*       users:(("smbd",pid=6041,fd=45))
tcp    LISTEN  0       50       [::]:445            [::]:*       users:(("smbd",pid=6041,fd=44))
```
:::



#### Usuarios en Samba Domain Controller {#usuarios-en-samba-domain-controller}

Al igual que sucedía en Active Directory, Samba tiene un sistema para la gestión y creación de usuarios que pertenecen al Domain Controller. A partir de ahora, la gran mayoría de los comandos que ejecutemos serán parámetros del siguiente comando, que es el sistema principal de administración de Samba:

::: mycode
[Comando para controlar nuestro dominio en SAMBA]{.title}
``` console
root@vega:~# samba-tool
```
:::


Para crear los usuarios dentro del dominio gestionado por Samba podremos crearlos de la siguiente manera:

::: mycode
[Crear nuevo usuario en SAMBA]{.title}
``` console
root@vega:~# samba-tool user create profesor1
```
:::


Si queremos visualizar todos los usuarios que existen en Samba podemos hacerlo con:

::: mycode
[Crear nuevo usuario en SAMBA]{.title}
``` console
root@vega:~# samba-tool user list
profesor1
Administrator
Guest
krbtgt
```
:::



Tal como se puede ver, aparece el usuario "profesor1" creado previamente, junto con los usuarios que también se creaban por defecto en Active Directory:

-   **Administrator**: administrador del dominio

-   **Guest**: usuario invitado

-   **krbtgt**: de manera resumida, usuario desactivado que es el encargado del sistema de autenticación (Kerberos).

Toda la gestión de usuarios del dominio Samba se podrá hacer con el comando [samba-tool user]{.commandbox} añadiendo el correspondiente parámetro extra.

::: warnbox
**No hay que confundir la gestión de usuarios de Samba con la propia de Linux, ya que son dos cosas completamente separadas.**
:::

#### Configuración del Controlador de Dominio {#configuración-del-controlador-de-dominio}

Tal como se ha comentado previamente, el comando samba-tool nos permitirá realizar todo tipo de configuraciones, como pueden ser:

-   Gestión de ordenadores del dominio

-   Gestión de usuarios

-   Gestión de grupos

-   ...

### Meter Windows 10 en Samba Domain Controller {#meter-windows-10-en-samba-domain-controller}

Ha llegado el momento de meter un equipo Windows en el Dominio que tenemos gestionado por nuestro servidor Samba. Los pasos a dar serán los mismos que cuando metemos el equipo en un Active Directory.

-   **Cambiar el nombre al equipo**: Esto hará que después sea más fácil realizar la gestión de equipos y saber a quién pertenece el equipo o dónde se sitúa.

-   **Cambiar DNS** del equipo para que haga uso de la IP del servidor Samba.

-   Vamos a "**Panel de Control \> Sistema y Seguridad \> Sistema**": Aquí le damos a "Cambiar configuración" dentro de la configuración de Dominio, y lo añadimos a nuestro Dominio creado previamente. Para añadirlo haremos uso del usuario Administrador que tenemos creado en el Controlador de Dominio Samba. Como pasaba al añadirlo a un Active Directory, el equipo tendrá que reiniciarse.

Una vez añadido el equipo, podremos loguearnos usando el usuario creado previamente.


## Compartiendo carpetas mediante Samba {#compartiendo-carpetas-mediante-samba}

En algunas distribuciones, en la configuración por defecto de Samba ya aparece la compartición de ciertas carpetas. Normalmente suele aparecer la carpetas "home" de los usuarios, pero esta configuración es válida **cuando Samba está en modo "standalone"** siendo la configuración base la siguiente:

::: mycode
[Ejemplo que aparece en /etc/samba/smb.conf]{.title}
``` ini
[homes]
    browseable = No
    comment = Home Directories
    create mask = 0700
    directory mask = 0700
    read only = No
    valid users = %S
```
:::


Si desde un windows nos intentamos conectar a nuestro Samba haciendo uso de **\\\\IP_Samba\\nombre_usuario** donde:

-   **IP_Samba**: es la IP de nuestro servidor Samba

-   **nombre_usuario**: es el usuario que tengamos en la base de datos de Samba veremos que se intentará conectar, y en caso de que coincida la contraseña de windows con la de Samba, podremos visualizar el directorio.

::: infobox
Windows no tiene por qué estar dentro del dominio de Samba para acceder a una unidad compartida por Samba.
:::

Esta configuración **no es válida cuando Samba está en modo controlador de dominio**, pero nos puede servir de base para crear nuestras carpetas compartidas.

### Crear carpeta compartida {#crear-carpeta-compartida}

Para crear una carpeta compartida accesible por los usuarios creados en Samba, podemos modificar el fichero de configuración y añadir una sección que sea similar a la siguiente:

::: mycode
[Configuración para compartir una carpeta en SAMBA]{.title}
``` ini
[sistemas]
    browseable = No
    comment = Carpeta Sistemas compartida
    path = /home/sistemas
    create mask = 0777
    directory mask = 0777
    read only = No
    valid users = profesor1
```
:::

Esta sección cuenta con distintos parámetros que hay que entender:

-   **\[sistemas\]**: es el nombre de la carpeta tal como accederemos desde Windows.

-   **browseable**: indica si la carpeta puede ser "buscada" accediendo al servidor o si debemos conocer cómo se llama la carpeta para acceder a ella directamente.

-   **comment**: comentario sobre la carpeta compartida.

-   **path**: ruta en el servidor GNU/Linux donde realmente se encuentra la carpeta compartida.

-   **create mask**: cuando se crea un fichero en la carpeta compartida, los permisos que tendrá el fichero en GNU/Linux.

-   **directory mask**: cuando se crea un directorio en la carpeta compartida, los permisos que tendrá el fichero en GNU/Linux.

-   **read only**: si queremos que la carpeta compartida sea de modo sólo lectura.

-   **valid users**: usuarios que podrán acceder a la carpeta compartida. Estos usuarios deberán haber sido creados previamente en Samba (mirar apartado de creación de usuarios).

    -   Si queremos que puedan conectarse varios usuarios, deberemos poner el listado separado por espacios.

    -   Si queremos que puedan conectarse a esta carpeta todos los usuarios de un grupo, deberemos poner **\@nombre_grupo** en esta variable.

## Administración remota de Samba, desde Windows {#administración-remota-de-samba-desde-windows}

Para facilitar la administración del **Controlador de Dominio Samba** que acabamos de crear, podemos hacer uso de las "**Herramientas de administración remota del servidor**" desde un equipo Windows.

Desde las actualizaciones de octubre de 2018 podemos hacer la instalación de las herramientas **RSAT** (*Remote Server Administration Tools*) a través de las "**Características opcionales**". Si no, deberíamos instalarlas [esta actualización](https://www.microsoft.com/es-es/download/details.aspx?id=45520).

Para poder usar las herramientas que instalemos tenemos que estar logueados en Windows con un usuario administrador del dominio. Las herramientas instaladas están en "*Panel de Control → Sistema y Seguridad → Herramientas Administrativas*".

