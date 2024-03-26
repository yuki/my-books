
# Introducción a GNU/Linux

## Un poco de historia

Para conocer cómo nació el movimiento GNU y el kernel Linux debemos conocer un poco de historia de la informática y cómo evolucionó en los primeros años.

### El nacimiento de Unix

1964-1969

:   Los laboratorios **Bell** empiezan un proyecto con el **MIT** (Instituto Tecnológico de Massachusetts) y **General Electric** para desarrollar un sistema de **tiempo compartido** ("time-sharing computing"): se llamaría **Multics** (Multiplexed Information and Computing Service).

    Hasta este momento, los sistemas utilizados eran de un único proceso, la CPU no era compartida por múltiples procesos sino que se ejecutaba por lotes (se les mandaba los procesos a ejecutar y se ejecutaban en orden).

    Multics obtuvo licencia libre en el 2007. En Diciembre del 2016 salió la última versión 12.6f.

1969

:   Uno de los desarrolladores de Multics, [Ken Thompson](https://en.wikipedia.org/wiki/Ken_Thompson), decidió escribir su propio sistema operativo. Ken Thompson es conocido también por crear el lenguaje de programación **B**, el sistema de codificación de caracteres UTF-8 y el lenguaje de programación Go, entre otras cosas.

    A Ken Thompson se le une [Dennis Ritchie](https://en.wikipedia.org/wiki/Dennis_Ritchie) y otros, y empiezan a programar un sistema de ficheros jerárquico, el concepto de procesos de computación, ficheros de dispositivos, un intérprete de comandos, ... El resultado de lo programado era más pequeño y simple que Multics, lo que se convertiría en Unix. En Agosto ya tendrían el sistema operativo, se auto-gestiona, tenía un assembler, un editor y una shell de comandos.

    Dennis Ritchie es conocido también por crear junto con Ken el lenguaje de programación **C** (aparece por primera vez en 1972).

    ![Ken y Dennis. Origen: [Wikipedia](https://en.wikipedia.org/wiki/Ken_Thompson)](img/temas_comunes/gnu_linux/Ken_Thompson_and_Dennis_Ritchie--1973.jpg){width=60%}

    

1970

:   En ese momento el nuevo sistema operativo se llamaba **Unics** (*Uniplexed Information and Computing Service*, un juego de palabras en contraposición a Multics). No tenían todavía dinero de la organización en el desarrollo (era desarrollado por los programadores) y tampoco era multitarea todavía.

    A finales de año el sistema ya era conocido como **UNIX**, y se había portado a la máquina PDP-11.

    **Las primeras versiones de Unix incluían el código fuente** para que las universidades lo pudiesen modificar y así poder extenderlo a sus necesidades.

1971

:   El sistema se empieza a hacer complejo y como querían que más usuarios lo usasen, crean el sistema de manuales que es utilizado hoy en día (mediante el comando **"man"**).

    ![Dennis Ritchie y Ken Thompson trabajando en un PDP-11. Origen: [Wikipedia](https://en.wikipedia.org/wiki/Ken_Thompson). ](img/temas_comunes/gnu_linux/Ken_Thompson_(sitting)_and_Dennis_Ritchie_at_PDP-11_(2876612463).jpg){width="80%"}

1973

:   La versión 4 del sistema es reescrita completamente en C. Hasta este momento el sistema había estado escrito en ensamblador, por lo que no era portable entre distintos tipos de máquinas, aunque la primera versión portada a otra plataforma fue en 1978. Se cree que había "más de 20" instalaciones del sistema.

1974

:   La versión 5 se licencia para ser utilizada en **instituciones educativas**.

1975

:   La versión 6 se licencia para poder ser utilizadas por empresas por \$20.000 de la época.

1977

:   La universidad de Berkeley lanza su primera versión de Unix bajo la Berkeley Software Distribution (BSD).

1979

:   Con la salida de Unix v7, se comienza a portar a los distintos "microordenadores" de la época y a los distintos microprocesadores (Motorola 68000, Intel 8086, ... ).

1980

:   Microsoft anuncia su primer Unix para microcomputadoras de 16 bits (Xenix).

### El nacimiento de GNU (GNU's Not Unix)

1971

:   [Richard Stallman](https://en.wikipedia.org/wiki/Richard_Stallman) comienza su carrera en el MIT en el laboratorio de inteligencia artificial.

    Es conocido no sólo por el movimiento GNU, si no también por crear GCC y Emacs entre otra gran cantidad de software.

    En esa época el software se distribuía de manera abierta para poder ser modificado. Lo habitual era realizar modificaciones para mejorar el software y distribuirlo entre compañeros y universidades.


:::::::::::::: {.columns }
::: {.column width="60%"}
1982

:   Richard Stallman quiere modificar el firmware de unas impresoras y el fabricante le pide que firme un acuerdo de no divulgación si le enseñan el código. Esto hace que Stallman se enfurezca y es cuando decide que la situación actual debe cambiar y volver al sistema de intercambio de software anterior.


1983
:   Se anuncia el nacimiento del proyecto **GNU**, cuya finalidad es la de construir un sistema operativo completamente libre, compatible con Unix. La idea es dar a los usuarios la libertad y el control de sus ordenadores.

:::
::: {.column width="33%" }
![Richard Stallman: [Wikimedia](https://commons.wikimedia.org/wiki/File:Richard_Stallman_2016_Talk_in_Madrid_06.jpg)](img/temas_comunes/gnu_linux/Richard_Stallman_2016_Talk_in_Madrid_06.jpg){width=100%}
:::
::::::::::::::



1985
:   Se lanza el [manifiesto GNU](https://www.gnu.org/gnu/manifesto.es.html), y ya cuenta con un editor de texto (Emacs), compilador de C, una shell, varias utilidades … El núcleo inicial todavía no es funcional.


1986
:   Richard Stallman escribe y publica la definición de lo que es Free Software (Software Libre) a través de la [Free Software Foundation](https://es.wikipedia.org/wiki/Free_Software_Foundation).

    Más adelante veremos a qué se refiere sobre libertad en el software.



### El nacimiento de Minix

1987

:   Andrew S. Tanenbaum crea Minix como propósito educativo y para enseñar cómo funciona un sistema operativo.

1991

:   Sale la versión 1.5 de Minix y es portada a distintas arquitecturas (IBM, Motorola 68000, Amiga, Apple Macintosh, ...).

1992

:   Debate con Linus Torvalds sobre la arquitectura del kernel Linux (núcleo monolítico) en lugar de usar un micronúcleo.

### El nacimiento de Linux

1991

:   Un estudiante en la universidad de Helsinki, [Linus Torvalds](https://en.wikipedia.org/wiki/Linus_Torvalds), comienza un proyecto personal escrito para su nuevo ordenador, un PC con procesador 80386.

    El desarrollo comienza bajo **Minix**, usando el compilador **GCC** del movimiento GNU (GCC = GNU Compiler Collection).

    El proyecto termina convirtiéndose en un kernel de un sistema operativo y escribió al grupo de noticias de Minix diciendo:


    <!-- FIXME: arreglar el cuadro de Linus -->
    :::::::::::::: {.columns }
    ::: {.column width="60%"}

    "Hola a todos los que estáis ahí fuera usando minix.

    Estoy haciendo un sistema operativo (libre), (solamente por aficion, no será grande ni profesional como el GNU) para clones 386(486) AT.

    ...
    
    PD. Sí – está libre de cualquier código de minix, y tiene un sistema de ficheros multi-hilo. NO es portable (usa el cambio de tareas del 386 etc), y probablemente nunca soporte otra cosa que no sean los discos duros AT, porque es todo lo que tengo :-(. "
    :::
    ::: {.column width="30%" }
    ![Linus torvalds. Origen: [Wikipedia](https://en.wikipedia.org/wiki/Linus_Torvalds)](img/temas_comunes/gnu_linux/Linus_Torvalds.jpeg){width=100%}
    :::
    ::::::::::::::


1992

:   Originalmente la licencia de Linux era propia e impedía el uso comercial de Linux. En la versión 0.99 esto cambia y se cambia a la licencia GNU Public License (**GPL**).

1993

:   El proyecto cuenta con más de 100 desarrolladores. El kernel se adapta al entorno del proyecto GNU. Nace la distribución **Debian** (una de las más importantes a día de hoy)

    ![[Debian](https://www.debian.org)](img/temas_comunes/gnu_linux/debian-logo.jpg){width="50%"}
    

1994

:   Se libera la versión 1.0. El proyecto XFree86 se une y Linux consigue interfaz gráfico. Nacen las primeras distribuciones comerciales **Red Hat** y **Suse**.

1998

:   Empresas como **IBM**, **Compaq** y **Oracle** anuncian que apoyan a Linux. Nace el interfaz gráfico **KDE**.

1999

:   Nace el interfaz gráfico **GNOME** como reemplazo a KDE, ya que KDE hacía uso de una librería propietaria en aquel momento (QT).

2001

:   Steve Ballmer (CEO de Microsoft) dice: **"Linux es un cáncer"**.

2002

:   Se libera OpenOffice (originalmente suite ofimática de Sun Microsystems). Nace Mozilla (hoy día: Firefox).

2003

:   IBM lanza un anuncio para la Linux Foundation: <https://www.youtube.com/watch?v=x7ozaFbqg00>

2004

:   Nace **Ubuntu** (basándose en Debian) y Steve Ballmer (CEO de Microsoft) dice que Linux infringe muchas de sus patentes.

2008

:   Nace **[Android](https://es.wikipedia.org/wiki/Android)**, sistema operativo con kernel Linux. Actualmente es el sistema operativo de móviles que más terminales tiene.

2009

:   Red Hat iguala a Sun Microsystem en capitalización bursátil (un gran logro simbólico).

2014

:   Satya Nadella (CEO de Microsoft) muestra en una presentación la siguiente transparencia:

    ![Origen: [Wikipedia](https://commons.wikimedia.org/wiki/File:Microsoft_Linux.jpg)](img/temas_comunes/gnu_linux/Microsoft_Linux.jpg){width="50%"}

2016

:   Microsoft anuncia [WSL](https://es.wikipedia.org/wiki/Windows_Subsystem_for_Linux) (*Windows Subsystem for Linux*) y se puede instalar en Windows 10 y Windows Server 2019. Permite correr ejecutables de Linux nativamente.

### Cronograma de sistemas Unix

En el siguiente cronograma se puede ver la línea temporal de los sistemas Unix:

![Origen: [Wikipedia](https://commons.wikimedia.org/wiki/File:Evolución_UNIX.png)](img/temas_comunes/gnu_linux/Evolución_UNIX.png){width="70%"}


## Resumen

Linux es conocido como un sistema operativo libre pero el nombre de Linux se centra única y exclusivamente en el **kernel** (o **núcleo**) del sistema operativo.

El sistema operativo completo debería llamarse **GNU/Linux**, ya que el kernel es una "pequeña" parte (aunque muy importante) dentro de todo el sistema operativo. El resto de herramientas utilizadas en el sistema operativo pertenecen al proyecto GNU.

# Licencias Libres

## Free Software / Software Libre {#free-software--software-libre}

En 1986 Richard Stallman saca a la luz la definición de lo que es Free Software (Software Libre) a través de la [Free Software Foundation](https://es.wikipedia.org/wiki/Free_Software_Foundation):

::: infobox
**La palabra "free" no se refiere a gratis, se refiere a libertad.**

(*The word free in our name does not refer to price; it refers to freedom.*)
:::


Las libertad en el software se refiere a:


1. La libertad de ejecutar el programa, **para cualquier propósito**.

2. La libertad de **estudiar cómo trabaja el programa, y cambiarlo para que haga lo que usted quiera**. El acceso al código fuente es una condición necesaria para ello.

3. La libertad de **redistribuir copias** para que pueda ayudar al prójimo.

4. La libertad de **mejorar el programa y publicar sus mejoras, y versiones modificadas en general**, para que se beneficie toda la comunidad. El acceso al código fuente es una condición necesaria.


El movimiento del Free Software es un movimiento que tiene que ver más con la filosofía y la ética que con la tecnología en sí misma.

### Copyleft y GNU Public License (GPL)

Es una práctica legal que consiste en el ejercicio del derecho de autor (copyright en inglés) con el objetivo de propiciar el libre uso y distribución de una obra, exigiendo que los concesionarios preserven las mismas libertades al distribuir sus copias y derivados ([Wikipedia](https://es.wikipedia.org/wiki/Copyleft)).

![Mapa conceptual del Software Libre: [Wikipedia](https://commons.wikimedia.org/wiki/File:Mapa_conceptual_del_software_libre.png)](img/temas_comunes/gnu_linux/Mapa_conceptual_del_software_libre.png){width="100%"}

Con esto nació la licencia GNU GPL, la cual permite al usuario final la libertad de usar, estudiar, compartir y modificar el software recibido. Tiene que quedar claro que un programa comercial puede ser Software Libre.

### Diferencias con el Open Source

Los programas Open Source son aquellos que podemos ver el código fuente pero esto no quiere decir que podamos modificarlo o adaptarlo a nuestras necesidades.

El Open Source es menos restrictivo que el Software Libre y se puede decir que todo Software Libre es Open Source, pero no todo Open Source tiene por qué ser libre.

### Licencias libres más conocidas

Un listado de las licencias libres más utilizadas (en la [Wikipedia](https://es.wikipedia.org/wiki/Anexo:Comparaci%C3%B3n_de_licencias_de_software_libre) existe una tabla comparativa):

-   [GNU GPL](https://es.wikipedia.org/wiki/GNU_General_Public_License)

-   [BSD](https://es.wikipedia.org/wiki/Licencia_BSD)

-   [MIT](https://es.wikipedia.org/wiki/Licencia_MIT)

-   [Licencia Apache](https://es.wikipedia.org/wiki/Apache_License)

-   [Licencia PHP](https://es.wikipedia.org/wiki/Licencia_PHP)

-   [Creative Commons](https://es.wikipedia.org/wiki/Licencias_Creative_Commons) (no todas las versiones). Más utilizadas en contenido multimedia.

# Sistema de ficheros en GNU/Linux

El sistema de ficheros en GNU/Linux, al igual que en Unix, es jerárquico, comenzando en la raíz denominada "/". Partiendo de esta raíz, el resto del sistema de ficheros nace en forma de ramificaciones generando lo que se denominan "rutas de ficheros", que es el camino completo para llegar al mismo.

## Filesystem Hierarchy Standard

Debido a que en GNU/Linux todo se representa como ficheros (discos, dispositivos, programas, ... ) es necesario que exista un orden a la hora de ser almacenados. Con esa intención nace en 1993 el estándar de la jerarquía de ficheros de Linux, enfocado a reestructurar los archivos. Posteriormente se unieron otros derivados de UNIX (la comunidad de desarrollo de BSD) por lo que terminó adoptando el nombre FHS.

Aún siendo un estándar, no todas las distribuciones lo siguen al pie de la letra, y otros Unix, como MacOS, tienen sus propias rutas especiales.

## Directorios importantes

A continuación se exponen los directorios más importantes del sistema junto con la descripción del contenido que deben de tener:

-   **/boot/**: archivos de arranque del kernel, normalmente junto con la configuración utilizada para compilarlos.

-   **/dev/**: contiene archivos especiales de bloque que representan los dispositivos del hardware que está corriendo el sistema operativo

-   **/etc/**: contiene los archivos de configuración del servidor y de los servicios que corren en él. Está subdividido en directorios por servicios o configuraciones.

-   **/home/**: los directorios de trabajo de los usuarios normales del sistema

-   **/lib/**: librerías que hacen funcionar a los programas

-   **/root/**: es la home del usuario root

-   **/var/**: archivos variables del sistema

    -   **/var/lib/**: aquí se suelen guardar los ficheros de los programas que "crecen": bases de datos, ficheros caché...

    -   **/var/log/**: los logs del sistema

Junto a todos estos directorios, se ha separado los lugares en los que van los binarios, o ejecutables de los programas. Lo habitual es que se encuentren en estas rutas:

-   **/bin/**: aplicaciones esenciales del sistema

-   **/sbin/**: aplicaciones que en principio sólo debería ejecutar el usuario root o programas de administración del sistema

-   **/usr/bin/**: ejecutables de usuario

-   **/usr/sbin/**: ejecutables de superusuario

Aunque las rutas de los ejecutables denotan quién debería ejecutar el programa, en la vida real no tiene por qué ser una limitación.

## Dispositivos de almacenamiento y discos duros

En sistemas operativos Windows es habitual que cada partición cuente con una letra para acceder a ella, al igual que ocurre cuando introducimos un dispositivo de almacenamiento externo (un pendrive).

Tal como se ha comentado, en sistemas Unix el sistema de ficheros es una jerarquía, y por tanto todo dispositivo de almacenamiento nuevo deberá estar montado bajo la raíz "/". Hoy día, en distribuciones con escritorio, al introducir un pendrive éste es auto-montado (es accesible) desde la ruta **/media/**, donde aparecerán tantos directorios como discos hayamos conectado.

### Almacenamiento permanente

Si queremos que un disco duro nuevo sea permanente en nuestro sistema, podremos montarlo en cualquier lugar de la estructura jerárquica. Debido a este sistema, el usuario final no se tendrá que preocupar en almacenar los ficheros en una ruta distinta, si no que será el administrador el que haya hecho que esa ruta ahora pertenezca a un disco duro nuevo.

Imaginemos que el sistema operativo se ha instalado en un disco duro pequeño de 32Gb de espacio y se está llenando, y el directorio que más ocupa es el directorio de los usuarios. Podremos añadir al servidor un nuevo disco duro montado en /home y por tanto a partir de ahora los datos guardados en /home estarán en un nuevo disco duro más grande.

::: mycode
[Ejemplo de discos en un sistema con "lsblk"]{.title}
``` console
root@vega:~# lsblk
NAME                       MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
sda                          8:0    0   1,8T  0 disk
└─sda1                       8:1    0   1,8T  0 part /home/backup

sdb                          8:16   0   3,6T  0 disk
└─sdb1                       8:17   0   3,6T  0 part /home/disco4tb
sdc                          8:32   0 447,1G  0 disk
├─sdc1                       8:33   0   529M  0 part
├─sdc2                       8:34   0   100M  0 part
├─sdc3                       8:35   0    16M  0 part
└─sdc4                       8:36   0 446,5G  0 part
nvme0n1                    259:0    0 931,5G  0 disk
├─nvme0n1p1                259:1    0   512M  0 part
└─nvme0n1p2                259:2    0   800G  0 part /home
nvme1n1                    259:3    0 931,5G  0 disk
├─nvme1n1p1                259:4    0   512M  0 part /boot/efi
├─nvme1n1p2                259:5    0    90G  0 part /
├─nvme1n1p3                259:6    0   300G  0 part
│ ├─VMs-ubuntu--20.04--so1 254:0    0    10G  0 lvm
│ ├─VMs-manjaro            254:2    0    20G  0 lvm
│ └─VMs-win10              254:3    0    35G  0 lvm
└─nvme1n1p4                259:7    0 156,2G  0 part
```
:::

# Gestión de usuarios locales en GNU/Linux

En las distribuciones GNU/Linux lo habitual suele ser que existan al menos dos usuarios tras una instalación:

-   **root**: usuario administrador o súper usuario.

-   **usuario no-privilegiado**: durante la instalación de la distribución nos suele preguntar para crear un usuario del sistema, que no tendrá privilegios.

El usuario root, como se ha dicho previamente, es el administrador del sistema, tiene permisos para realizar cualquier tarea dentro de nuestro sistema: instalar paquetes, desinstalarlos, modificar cualquier fichero, realizar formateos\... Por lo tanto, el **realizar tareas como usuario root puede ser peligroso si cometemos algún fallo**.

Las buenas prácticas nos dicen que las tareas cotidianas del sistema deberíamos realizarlas como usuario normal y **sólo convertirnos en root cuando sea estrictamente necesario**.

## Creación de usuarios locales

Tras instalar el sistema, veremos que se nos han creado varios usuarios en el sistema, aparte del usuario **root** y el usuario **no-privilegiado**. Para poder ver los usuarios que existen en nuestro sistema podemos verlo en el fichero [/etc/passwd]{.configfile} o podríamos obtener un listado ejecutando el siguiente comando:

::: mycode
[Listar usuarios del sistema]{.title}
``` console
root@vega:~# cut -d: -f1 /etc/passwd
```
:::

Para crear un usuario:

::: {.mycode size=small}
[Crear usuarios del sistema]{.title}
``` console
root@vega:~# adduser ruben

Añadiendo el usuario `ruben' ...
Añadiendo el nuevo grupo `ruben' (1001) ...
Añadiendo el nuevo usuario `ruben' (1001) con grupo `ruben' ...
Creando el directorio personal `/home/ruben' ...
Copiando los ficheros desde `/etc/skel' ...
Nueva contraseña:
Vuelva a escribir la nueva contraseña:
passwd: contraseña actualizada correctamente
Cambiando la información de usuario para ruben
Introduzca el nuevo valor, o pulse INTRO para usar el valor predeterminado
    Nombre completo []:
    Número de habitación []:
    Teléfono del trabajo []:
    Teléfono de casa []:
    Otro []:
¿Es correcta la información? [S/n]
```
:::

Y la línea que nos creará en el fichero [ /etc/passwd ]{.configfile} es:

::: mycode
[Línea de un usuario en /etc/passwd]{.title}
``` bash
ruben:x:1001:1001:ruben,,,:/home/ruben:/bin/bash
```
:::


El fichero [ /etc/passwd ]{.configfile} nos muestra los datos de los usuarios, siendo un fichero que tiene distintos datos separados por ":", siendo cada apartado:

![](img/temas_comunes/gnu_linux/usuario_tabla.png){width="70%"}

En las primeras versiones GNU/Linux la contraseña de los usuarios aparecía en el propio fichero /etc/passwd, lo que suponía un problema en la seguridad, ya que no estaban cifradas. Actualmente, las contraseñas de los usuarios se almacenan cifradas en el fichero [/etc/shadow]{.configfile}. El fichero es similar al passwd, estando separados los apartados por ":"

![](img/temas_comunes/gnu_linux/shadow_tabla.png){width="70%"}


En el apartado de la contraseña podemos saber cierta información acerca de la misma ya que tiene el siguiente formato: **"\$id\$salt\$hashed"**

-   **id**: el algoritmo utilizado para cifrar la contraseña

    -   \$1\$ -- MD5

    -   \$2a\$ -- Blowfish

    -   \$2y\$ -- Eksblowfish

    -   \$5\$ -- SHA-256

    -   \$6\$ -- SHA-512

Aparte, también podemos encontrarnos con:

-   **Contraseña vacía**: Si no hay contraseña, al pedirnos la contraseña a la hora de hacer login será suficiente con pulsar "intro".

-   **!**, **\***: la cuenta está bloqueada para la contraseña. El usuario no podrá loguearse utilizando la contraseña. Resulta útil si queremos bloquear el acceso con contraseña pero no con otros métodos (clave pública SSH).

-   **\*LK\***: cuenta bloqueda. El usuario no podrá loguearse.

-   **\*NP\***, **!!**: Nunca se ha puesto una contraseña

## Gestión de grupos

En algunas distribuciones GNU/Linux, al crear un usuario directamente nos crea un grupo para el nuevo usuario. En otras, el usuario pertenece al grupo "users".

Para saber los grupos a los que pertenece un usuario podemos ejecutar el comando [groups]{.commandbox}. Los grupos del sistema aparecen en el fichero [ /etc/group ]{.configfile}, y al igual que los ficheros vistos previamente, están separados por "**:**".

::: center
![](img/temas_comunes/gnu_linux/grupo_tabla.png){width="60%"}
:::

## Permisos de ficheros

En GNU/Linux los ficheros cuentan con 3 tipos de permisos:

-   lectura (**r**ead): el usuario puede leer el fichero

-   escritura (**w**rite): el usuario puede escribir en el fichero

-   ejecución (e**x**ecute): el usuario puede el fichero o puede ver el contenido de un directorio

Todos ello para los distintos usuarios que pueden existir en el sistema:

-   **dueño del fichero**: la persona que ha creado el fichero

-   **grupo**: los usuarios pertenecientes al grupo al que pertenece el fichero tendrán ciertos privilegios

-   **el resto de usuarios**: los permisos que tendrán el resto de usuarios que no son ni el dueño ni pertenecen al grupo

Todo ello se puede visualizar en el sistema de ficheros si listamos los permisos del fichero:

::: mycode
[Ver los permisos de un fichero]{.title}
``` console
ruben@vega:~$ ls -lh fichero.txt
-rw-r--r-- 1 ruben ruben 0 dic  8 19:17 fichero.txt
```
:::

Los permisos se pueden ver en los primeros 10 caracteres:

![](img/temas_comunes/gnu_linux/permisos_fichero.png){width="70%"}


Existen los distintos tipos de ficheros:

- **-**: fichero normal
- **d**: directorio
- **b**: dispositivo de bloque (ejemplo: /dev/sda*)
- **c**: dispositivo de carácter (las consolas. ejemplo: /dev/tty*)
- **s**: socket local
- **p**: tubería (pipe)
- **l**: enlace simbólico (link)


### Permisos especiales {#permisos-especiales}

Existen otros permisos especiales:


- **SUID**: permiso especial que permite que el fichero sea ejecutado con los permisos del dueño del fichero (aunque lo ejecute otro usuario). Se visualiza con una “S” en el permiso de ejecución del dueño  [-rwsrw-r-\-]{.inlineconsole} .

<!-- %% TODO: modificar los fondos de los permisos -->

- **SGID**: permiso especial que permite que el fichero sea ejecutado como el grupo. Aparece una "S" en el permiso de ejecución del grupo: [-rwxr\-s\-\-\-]{.inlineconsole}.

- **STICKY**: si el bit sticky está activado en un **directorio** sólo el usuario root, el dueño del directorio o el dueño del fichero puede borrar ficheros dentro de dicho directorio. Aparece una "t" en el permiso de ejecución del resto de usuarios:[drwxrwxrwt]{.inlineconsole}. Muchas distribuciones usan este permiso en el directorio [/tmp]{.configdir}


### Cambiando permisos y dueños a los ficheros y a los directorios {#cambiando-permisos-ficheros-directorios}

Para cambiar los permisos a los ficheros y a los directorios se hace con el comando **chmod**.

Para cambiar permisos de dueño a los ficheros y a los directorios se hace con el comando **chown**.

## La importancia de "sudo" {#la-importancia-de-sudo}

En muchas distribuciones GNU/Linux el usuario no-privilegiado que se crea tiene permiso de "sudo" para poder ejecutar comandos como si se tratara del **root** (u otro usuario) para poder realizar tareas de administración. Es habitual que en estas distribuciones **el usuario root no suela tener contraseña**.

Cuando un usuario necesite realizar una tarea como administrador, deberá usar "sudo" antes del comando:

::: mycode
[Editar un fichero con permisos de root]{.title}
``` console
ruben@vega:~$ sudo nano /etc/passwd
```
:::

Tras realizar este comando, el sistema nos pedirá la contraseña del usuario con el que lo estemos ejecutando y comprobará que el usuario tiene permisos de "sudo" para poder ejecutar el comando (en este caso: nano).

El comando "**sudo**" viene de "**su**per user **do**" (que en inglés sería: "super usuario haz"), y aunque su uso habitual es el de permitir realizar cualquier comando de administración, la configuración permite mucho más, pudiendo permitir a ciertos usuarios sólo realizar ciertas tareas. Por ejemplo:

-   Usuario **ruben**: tendría permisos para poder realizar cualquier comando del sistema.

-   Usuario **dba**: sólo tendría permisos para poder realizar el reinicio del sistema de base de datos.

-   Usuario **adminweb**: sólo tendría permisos para poder realizar el reinicio del servidor web.

-   ...

De esta manera, la gestión de nuestro servidor estaría basada en múltiples usuarios y cada usuario sólo sería capaz de realizar pequeñas tareas, por lo que la seguridad del servidor sería mayor y limitaría lo que los usuarios puedan realizar.

### Configurando "sudoers"

Los permisos de sudo se realizan en el fichero [/etc/sudoers]{.configfile} , y para su edición se hace uso del comando **visudo**, el cual abre el fichero y se asegura que a la hora de guardar la sintaxis es correcta.

Si realizamos cualquier modificación sobre el fichero, éste será tenido en cuenta la próxima vez que se realice la ejecución del comando "sudo", por lo tanto, no hay que realizar ningún reinicio de servicio.

El fichero [/etc/sudoers]{.configfile} tiene permisos de sólo lectura para el usuario root y el grupo root:

::: mycode
[Permisos del fichero /etc/sudoers]{.title}
``` console
root@vega:# ls -lh /etc/sudoers
-r--r----- 1 root root 669 jun  5  2017 /etc/sudoers
```
:::

Un fichero sudoers suele tener el siguiente aspecto:

<!-- FIXME: añadir icono en el título -->

::: {.mycode size=footnotesize}
[Contenido del fichero /etc/sudoers]{.title}
``` bash
Defaults    env_reset
Defaults    mail_badpass
Defaults    secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

# User privilege specification
root    ALL=(ALL:ALL) ALL

# Allow members of group sudo to execute any command
%sudo   ALL=(ALL:ALL) ALL

# See sudoers(5) for more information on "#include" directives:

#includedir /etc/sudoers.d
```
:::


La línea que más importa en este fichero es la que indica "**%sudo ALL=(ALL:ALL) ALL**" y es explicada en su comentario anterior. Lo que quiere decir es que cualquier usuario que pertenezca al grupo "sudo" podrá realizar cualquier comando del sistema como superusuario. La sintaxis de la línea es:

-   **%sudo**: cualquier usuario que pertenezca al grupo "sudo"

-   **ALL**= : desde cualquier host o IP

-   **(ALL:ALL)**: el usuario que ejecuta puede ejecutar el comando como cualquier usuario y cualquier grupo

-   **ALL**: puede ejecutar cualquier comando

Un ejemplo limitando el uso de sudo a un único comando a un usuario:

::: mycode
[Añadimos configuración al fichero /etc/sudoers]{.title}
``` bash
ruben    ALL=(ALL:ALL) NOPASSWD:/bin/systemctl suspend
```
:::

Con esta línea lo que estamos permitiendo es que el usuario "ruben" puede ejecutar el comando "/bin/systemctl suspend" (suspender el equipo) y sin necesidad de meter contraseña al hacer sudo, gracias a la opción "NOPASSWD").

## Diferencias entre "sudo", "su" y "su -"

Como ya se ha comentado en el apartado anterior, "sudo" permite la ejecución de comandos como cualquier usuario, siendo lo habitual ejecutarlo como root. Ahora bien, en entornos donde el usuario root tiene contraseña, nos puede interesar convertirnos en él para realizar tareas sin tener que estar ejecutando "sudo" a cada comando. Al ser root, tendremos que tener especial cuidado.

### Variables de entorno

En cualquier sistema operativo existen las denominadas "variables de entorno". Son variables que cada usuario tiene y sirven para indicar ciertos parámetros que se están utilizando (la SHELL que se está usando), o parámetros que se van a usar a la hora de ejecutar comandos o realizar tareas, ya que se consultan a ellas. En GNU/Linux las variables de entorno se pueden consultar ejecutando:

::: mycode
[Vemos las variables de entorno del usuario ruben]{.title}

``` console
ruben@vega:~$ printenv
LANG=es_ES.utf8
LOGNAME=ruben
XDG_VTNR=2
COLORTERM=truecolor
PWD=/home/ruben
DESKTOP_SESSION=gnome
USERNAME=ruben
SHELL=/usr/bin/zsh
PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games
...
```
:::

Una variable de entorno puede consultarse haciendo:

::: mycode
[Consultamos el contenido de la variable PATH]{.title}

``` bash 
ruben@vega:~$ echo $PATH
/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games
```
:::

Como se puede ver, es con un "**\$**" y el nombre de la variable en mayúsculas. Existen muchas variables de entorno, y podríamos crear las nuestras propias si así lo necesitáramos.

### La importancia de "su -"

Con el comando "**su**" nos podemos convertir en cualquier otro usuario del sistema siempre y cuando **conozcamos su contraseña**. Hay que notar la diferencia respecto a "**sudo**" que cuando lo ejecutamos nos pide **nuestra contraseña**.

**Al ejecutar "su" nos convertimos en el usuario root** (o ejecutando "su usuario2", nos convertimos en el usuario2), **pero no hacemos uso de sus variables de entorno**, si no que seguimos con las variables de entorno del usuario que éramos previamente.
Para convertirnos en el usuario y que obtengamos sus variables de entorno es necesario ejecutar "**su -**", o lo que es lo mismo: "**su -l**", que el manual nos dice: "*Start the shell as a login shell with an environment similar to a real login*". Por ejemplo:

::: mycode
[Consultamos el contenido de la variable PATH en distintas situaciones]{.title}

``` bash
ruben@vega:~$ echo $PATH
/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games

ruben@vega:~$ su
Contraseña:

root@vega:/home/ruben# echo $PATH
/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games

root@vega:/home/ruben# exit

ruben@vega:~$ su -
Contraseña:

root@vega:~# echo $PATH
/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
```
:::

El usuario "ruben" tiene unos valores en la variable de entorno PATH (es la variable que se encarga de tener las rutas de los ejecutables de los programas). Al convertirse en root haciendo uso de "su", y mirar la variable PATH, podemos observar que es igual que el usuario prueba.

Ahora bien, si a la hora de convertirse en root hace uso de "su -", se puede ver cómo la variable PATH obtiene otros valores, siendo lo más significativo que aparecen las rutas "/usr/local/sbin" y "/usr/sbin" que son las rutas donde se almacenan los ejecutables que (en principio) sólo deberían ejecutarse como administrador del sistema.
