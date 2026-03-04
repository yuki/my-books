
# Raid-1 Software en GNU/Linux {#raid-software}

Vamos a realizar la configuración de un RAID-1 en un sistema GNU/Linux usando la herramienta [mdadm]{.commandbox}. Debería estar instalado en nuestro sistema (Debian, Ubuntu, Mint, ...), ya que es un comando básico, aunque en otras distribuciones quizá sea necesario instalarlo.

Tenemos que entender que al crear un sistema RAID, lo que se está realizando es una configuración para crear un "**dispositivo virtual**" que internamente hace uso de distintos discos duros físicos (o particiones). Una vez creado ese dispositivo virtual, tendremos que crear en él un sistema de ficheros (ext4, por ejemplo).

## Comprobar discos duros {#mdadm-discos-duros}

Debemos comprobar que en nuestro sistema, aparte del disco duro del sistema, tenemos al menos dos discos:

::: mycode
[Comprobar discos duros]{.title}

``` console
root@vega:~# lsblk
NAME   MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
vda      8:0    0   25G  0 disk
├─vda1   8:1    0    1M  0 part
├─vda2   8:2    0  513M  0 part /boot/efi
└─vda3   8:3    0 24,5G  0 part /
vdb      8:16   0   10G  0 disk
vdc      8:32   0   10G  0 disk
```
:::

Tal como se puede ver, tenemos dos discos duros sin particionar: [vdb]{.verbatim} y [vdc]{.verbatim}, de 10GB cada uno. En otros casos puede ser **sdb**, **sdc**...

::: infobox
Algunas distribuciones GNU/Linux permiten crear un sistema RAID antes de realizar la instalación, y así instalar el sistema operativo sobre el propio RAID.
:::


### Crear particiones {#crear-particiones}

Dependiendo del uso que queramos dar a nuestro sistema RAID y el tamaño de nuestros discos, será necesario crear particiones.

::: infobox
Es posible crear un sistema RAID sólo en una partición y usar el resto del disco de forma normal.
:::

Imaginemos la siguiente situación:

- Dos discos duros de 4TB
- Queremos hacer uso de un RAID-1 para datos que no exceden de 500GB, pero queremos dejar margen de maniobra por si aumenta de tamaño.
- Queremos usar parte del espacio para otros datos sin importancia, y que no pasa nada si se pierden.


En este caso, podríamos hacer lo siguiente:

- Crear en ambos discos particiones de 1TB para montar el sistema RAID-1.
- Dejar el resto del espacio para otros datos (en total 6TB).

Para crear particiones en GNU/Linux existen distintos programas (**Gparted**, por ejemplo), pero esas particiones tienen que ser de un tipo especial que no todos los programas soporten.

Vamos a usar [cfdisk]{.commandbox} para cada uno de los discos:

::: mycode
[Particionar /dev/sdb]{.title}

``` console
root@vega:~# cfdisk /dev/vdb
```
:::

Como el disco está recién instalado, si no tiene una tabla de particiones nos aparecerá lo siguiente:

![](img/anexos/raid_software/cfdisk-1.png){width=45%}

Una vez creada la tabla de particiones veremos un menú para poder crear una partición nueva:

![](img/anexos/raid_software/cfdisk-2.png){width=100%}

Al elegir "Nueva", nos preguntará el tamaño para crear la nueva partición, por ejemplo 5G:

![](img/anexos/raid_software/cfdisk-3.png){width=100%}

Una vez creada vemos que el tipo de partición es "Sistema de ficheros Linux", pero tenemos que cambiar el tipo.

::: errorbox
El tipo de partición tenemos que cambiarla a "Linux RAID".
:::

Para cambiar el tipo de partición le damos a "Tipo" y buscamos **Linux RAID**: 

![](img/anexos/raid_software/cfdisk-4.png){width=55%}

Hasta ahora los cambios realizados en el disco son "virtuales", no se han aplicado. Por lo tanto, **hay que darle a "Escribir" para guardar los cambios**.

::: warnbox
Recuerda que hay que hacer estos cambios en cada disco que participe en el RAID.
:::

Al final de todo el proceso, tendríamos lo siguiente:

:::::::::::::: {.columns }
::: {.column width="45%"}
![Particiones creadas](img/anexos/raid_software/raid-particiones-1.svg){width="100%"}
:::
::: {.column width="45%" }
![Creado RAID-1 sobre las particiones](img/anexos/raid_software/raid-particiones-2.svg){width="100%"}
:::
::::::::::::::


## Crear RAID-1 {#crear-raid}

Para crear el RAID haremos uso del siguiente comando:


::: {.mycode size=footnotesize}
[Comprobar discos duros]{.title}

``` console
root@vega:~# mdadm --create  /dev/md0  --level=1 --raid-devices=2 /dev/vdb /dev/vdc
mdadm: Note: this array has metadata at the start and
    may not be suitable as a boot device.  If you plan to
    store '/boot' on this device please ensure that
    your boot-loader understands md/v1.x metadata, or use
    --metadata=0.90
mdadm: size set to 10476544K
Continue creating array?
```
:::

Es importante tener en cuenta el aviso que nos da: si tenemos pensado arrancar el sistema estando en un RAID, el gestor de arranque debe soportarlo. En principio, no debería haber problemas.

::: warnbox
Si nuestro sistema operativo arranca desde un RAID el gestor de arranque debe soportarlo.
:::


El comando que hemos utilizado cuenta con los siguientes parámetros:

- [mdadm]{.verbatim}: es el comando que nos va a permitir crear y gestionar nuestros RAID.
- [\-\-create /dev/md0]{.verbatim}: es el parámetro para crear un nuevo RAID, y que creará un nuevo "dispositivo virtual" dentro de Linux en /dev/md0
- [\-\-level=1]{.verbatim}: el sistema RAID que queremos crear, en nuestro caso un RAID-1.
- [\-\-raid-devices=2]{.verbatim}: cuántos dispositivos van a formar parte de nuestro RAID.
- [/dev/vdb /dev/vdc]{.verbatim}: los discos duros o particiones que van a participar en nuestro RAID.

::: errorbox
Tras reiniciar quizá se haya renombrado el raid de /dev/md0 a /dev/md127
:::

Aunque es posible que nuestro RAID se renombre, existen opciones para que esto no pase, pero lo ignoraremos de momento.


## Comprobar estado del RAID {#raid-estado}

Cuando se crea un RAID empieza el proceso para crear el dispositivo virtual, en el caso anterior [/dev/md0]{.verbatim}. Los discos duros que forman un RAID pueden fallar, o puede haber habido algún fallo en los mismos, por lo que es importante saber si el RAID está funcionando de manera correcta.

Para ver el estado podemos utilizar dos comandos:

### Estado general {#raid-estado-general}

Al usar un sistema RAID en GNU/Linux podemos comprobar el estado general de todos los sistemas RAID utilizando el "fichero" [/proc/mdstat]{.configfile}:

::: {.mycode size=footnotesize}
[Comprobar estado RAID-1]{.title}

``` console
root@vega:~# cat /proc/mdstat
Personalities : [linear] [raid0] [raid1] [raid6] [raid5] [raid4] [raid10]
md0 : active raid1 vdc[1] vdb[0]
      10476544 blocks super 1.2 [2/2] [UU]
      [==>..................]  resync = 13.5% (1420032/10476544) finish=0.7min 
      speed=202861K/sec

unused devices: <none>
```
:::

Si nos fijamos, en este estado nos está diciendo que el sistema se está sincronizado. Esto puede suceder porque acabamos de crear el RAID o porque acabamos de cambiar un disco nuevo.

Cuando termina la sincronización, aparecería de la siguiente manera:

::: {.mycode size=footnotesize}
[Comprobar estado RAID-1]{.title}

``` console
root@vega:~# cat /proc/mdstat
Personalities : [linear] [raid0] [raid1] [raid6] [raid5] [raid4] [raid10]
md0 : active raid1 vdc[1] vdb[0]
      10476544 blocks super 1.2 [2/2] [UU]

unused devices: <none>
```
:::

Si miramos un RAID degradado, con un disco que se ha quitado, nos aparecerá algo como lo siguiente:

::: {.mycode size=footnotesize}
[RAID-1 con fallo]{.title}

``` console
root@vega:~# cat /proc/mdstat
Personalities : [linear] [raid0] [raid1] [raid6] [raid5] [raid4] [raid10] 
md127 : inactive vdb[1](S)
      10476544 blocks super 1.2
```
:::

Comprueba el estado **inactive**, esto significa que el estado del RAID se ha parado para evitar más errores hasta que se arregle.



### Estado de un único RAID {#raid-estado-uno}

Con el comando [mdadm]{.commandbox} también podemos ver el estado de un único sistema RAID. Para ello necesitamos conocer cuál es su nombre, en nuestro caso [md0]{.verbatim}.


::: {.mycode size=footnotesize}
[Comprobar estado RAID-1]{.title}

``` console
root@vega:~# mdadm --detail /dev/md0
/dev/md0:
           Version : 1.2
     Creation Time : Mon Mar  2 17:45:17 2026
        Raid Level : raid1
        Array Size : 10476544 (9.99 GiB 10.73 GB)
     Used Dev Size : 10476544 (9.99 GiB 10.73 GB)
      Raid Devices : 2
     Total Devices : 2
       Persistence : Superblock is persistent

       Update Time : Mon Mar  2 17:46:09 2026
             State : clean 
    Active Devices : 2
   Working Devices : 2
    Failed Devices : 0
     Spare Devices : 0

Consistency Policy : resync

              Name : mint:0  (local to host mint)
              UUID : 34ca56f7:9f58fb2c:bd4295b8:56d40413
            Events : 17

    Number   Major   Minor   RaidDevice State
       0     253       16        0      active sync   /dev/vdb
       1     253       32        1      active sync   /dev/vdc
```
:::

Si el RAID estuviese en estado de sincronización veríamos algo como "**Resync Status : 60% complete**".

Para ver que el RAID está bien podemos ver también la línea **"State: clean"**. En caso de error podríamos ver **"State: inactive"**


## Crear sistema de ficheros {#crear-sistema-ficheros-en-raid}

El sistema RAID que hemos creado es la gestión interna de los discos, pero tenemos que crear un sistema de ficheros sobre él.

::: warnbox
Una vez creado el sistema RAID hay que crear encima un sistema de ficheros
:::

Para ello podemos hacer uso de Gparted seleccionando [md0]{.verbatim} como disco.


![](img/anexos/raid_software/gparted-raid.png){width=85% framed=true}

Tras realizar la creación del sistema de ficheros, la imagen de todos los pasos que hemos creado sería el siguiente:

![](img/anexos/raid_software/raid-final.svg){width=65%}

Por lo tanto, el resumen final sería:

1. Crear particiones si es necesario.
2. Crear sistema RAID en las particiones/discos correspondientes.
3. Crear sistema de ficheros sobre el RAID creado.
4. Usar el sistema de ficheros de manera habitual.


# Ejercicio propuesto {#ejercicio-raid}

Para entender mejor cómo funciona los sistemas RAID se propone realizar el siguiente ejercicio:

1. Crear 3 discos duros en una máquina virtual de 15GB cada uno.
2. Crear sistema RAID-1 de 10GB en el que participen los 3 discos duros.
3. Crear sistema RAID-5 con el espacio restante.


![](img/anexos/raid_software/raid-ejercicio.svg){width=65%}


4. Crear sistemas de ficheros sobre los RAID recién creados.

