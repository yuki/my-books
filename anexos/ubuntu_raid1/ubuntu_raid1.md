
# Configurar RAID 1 durante la instalación de Ubuntu {#configurar-raid-1-durante-la-instalación-de-ubuntu}

Tal como hemos podido ver anteriormente, durante la [instalación de Ubuntu 20.04](#instalar_ubuntu_lts), en el paso 7 podemos realizar la instalación en el disco duro que tengamos instalado en el servidor físico o en la máquina virtual.

En este paso podemos realizar distintas configuraciones:

![](img/anexos/ubuntu_raid1/01_storage_layout.png){width="50%"}


-   Usar el disco entero.

    -   Nos permitirá crear un sistema con LVM (por defecto activado) y con posibilidad de cifrar la partición creada.

-   Crear un diseño de almacenamiento personalizado.

En la segunda opción podremos:

-   Crear particiones a nuestro gusto.

-   Elegir el sistema de ficheros de las particiones.

-   Crear sistema RAID por software.

## Pasos previos {#pasos-previos}

Dado que vamos a crear un sistema RAID 1 durante la instalación de Ubuntu, necesitaremos al menos **dos discos duros** en nuestro servidor antes de comenzar con la instalación.

En nuestro sistema virtualizado hemos añadido dos discos duros de igual tamaño (15GB), en los cuales crearemos particiones para posteriormente sobre ellas realizar el RAID 1.

## Entendiendo las particiones a realizar {#entendiendo-las-particiones-a-realizar}

En este apartado vamos a explicar la teoría que está detrás del sistema de particionado que vamos a necesitar crear y que posteriormente realizaremos en el sistema de instalación de Ubuntu.

### Situación inicial: discos duros sin particionar {#situación-inicial-discos-duros-sin-particionar}

Como ya se ha comentado, en nuestro servidor vamos a contar con dos discos duros de igual tamaño. Esto suele ser lo habitual, pero lo importante es que las particiones que vayamos a crear sean del tamaño exacto, aunque un disco duro sea de mayor tamaño (aunque lógicamente, ese espacio quedará desaprovechado).

En la siguiente imagen vemos que tenemos dos discos duros de 15GB de tamaño cada uno:


![](img/anexos/ubuntu_raid1/raid1_01.png){width="40%"}


### Particionado inicial {#particionado-inicial}

A continuación vamos a tener que pensar cómo van a ser las particiones que vamos a necesitar en nuestro servidor. En nuestro caso vamos a crear dos:

-   **14GB**: Sistema operativo.

-   **1GB**: (o hasta completar) SWAP.

Como se puede entender, al tener una única partición, todo el sistema raiz "/" va a ir en ella, mientras que la otra partición será la usada para el área de intercambio.

Es importante entender que en este paso sólo **vamos a crear las particiones pero sin darles formato**. Por lo tanto, nuestros discos duros ahora tendrían este aspecto:


![](img/anexos/ubuntu_raid1/raid1_02.png){width="40%"}


### Crear particiones RAID {#crear-particiones-raid}

El siguiente paso es crear las particiones "virtuales" RAID. Vamos a crear una primera partición RAID que va a incluir las particiones de 14GB de ambos discos duros, y la segunda partición virtual incluirá las particiones de 1GB.


![](img/anexos/ubuntu_raid1/raid1_03.png){width="40%"}


De esta manera, tendremos unas particiones MD0 y MD1 que son particiones virtuales.

### Formatear particiones RAID con el formato adecuado {#formatear-particiones-raid-con-el-formato-adecuado}

El último paso de la instalación es hacer uso de las particiones RAID creadas y formatearlas con el sistema de ficheros acorde a las necesidades que tengamos, y elegir el punto de montaje adecuado.


![](img/anexos/ubuntu_raid1/raid1_04.png){width="40%"}


En nuestro caso va a ser:

-   **MD0**: sistema de ficheros ext4 y lo vamos a utilizar como sistema de ficheros raíz "/".

-   **MD1**: formateado como SWAP y actuará como área de intercambio.

Tras este paso, la instalación del sistema operativo puede continuar de la manera habitual.

## Realizando el particionado en el instalador de Ubuntu {#realizando-el-particionado-en-el-instalador-de-ubuntu}

Tras haber entendido las particiones que vamos a realizar, ahora es el momento de proceder en el instalador de Ubuntu. Vamos a seguir los mismos pasos que hemos explicado en el apartado anterior, de esta manera aplicaremos lo aprendido a nivel teórico.

### Situación inicial: discos duros sin particionar {#situación-inicial-discos-duros-sin-particionar-1}

Tal como hemos comentado previamente, en el paso 7 de la instalación, elegiremos la opción de crear un "diseño de almacenamiento personalizado". Tras entrar en esta opción, el instalador tendrá el siguiente aspecto:


![](img/anexos/ubuntu_raid1/ubuntu_raid1_01.png){width="40%"}


Tal como se puede ver, tenemos dos discos duros en el sistema: **vda** y **vdb**. El nombre de los discos viene de **V**irtual **D**isk, dado que la instalación la estamos realizando en una máquina virtual.

### Particionado inicial {#particionado-inicial-1}

En este paso vamos a crear en cada uno de ellos la partición de 14GB y el resto del espacio la usaremos para la segunda partición.

#### Marcar discos como dispositivos de arranque {#marcar-discos-como-dispositivos-de-arranque}

Por cómo funciona el sistema de arranque de Linux, antes de realizar las particiones vamos a marcar que ambos discos duros sean dispositivos de arranque ("Boot Device"). Para ello pulsaremos "Intro" en cada uno de los discos y elegiremos la opción correspondiente (imágenes de cada disco):


:::::::::::::: {.columns }
::: {.column width="15%"}
:::
::: {.column width="25%"}
![](img/anexos/ubuntu_raid1/ubuntu_raid1_02-1.png){width="100%"}
:::
::: {.column width="30%" }
![](img/anexos/ubuntu_raid1/ubuntu_raid1_02-2.png){width="100%"}
:::
::: {.column width="15%"}
:::
::::::::::::::


De esta manera, el instalador de Ubuntu creará una pequeña partición al inicio del disco donde al terminar se realizará la instalación del sistema de arranque GRUB en ambos discos duros.

#### Crear particiones {#crear-particiones}

Ahora es el momento de crear las particiones, y los pasos serán seleccionar el disco duro, pulsar "Intro", se nos desplegará un pequeño menú y vamos a elegir la opción *"Add GPT Partition"* y rellenaremos el tamaño de la partición que nos interese en el momento y el formato lo dejaremos en *"Leave unformatted"* (dejar sin formatear).

:::::::::::::: {.columns }
::: {.column width="50%"}
![](img/anexos/ubuntu_raid1/ubuntu_raid1_03.png){width="100%"}
:::
::: {.column width="45%" }
![](img/anexos/ubuntu_raid1/ubuntu_raid1_04.png){width="100%"}
:::
::::::::::::::


Estos pasos lo realizaremos en cada disco duro con las particiones que vamos a necesitar, quedando al finalizar el sistema así:

::: center
![](img/anexos/ubuntu_raid1/ubuntu_raid1_05.png){width="40%"}
:::

Tal como se puede ver, cada disco duro tiene dos particiones con el tamaño deseado que no están siendo utilizadas, y en la parte de abajo aparecen las particiones denominadas "BIOS grub spacer".

### Crear particiones RAID {#crear-particiones-raid-1}

El siguiente paso es crear las particiones RAID en las que haremos que el sistema cree un RAID 1 haciendo uso de las particiones de los discos duros físicos. Seleccionaremos la opción "*Create software RAID (md)*" y nos aparecerá una ventana en la que podremos elegir:


:::::::::::::: {.columns }
::: {.column width="50%"}
-   **Nombre**: de la partición que vamos a crear. Es habitual que estas particiones empiecen por "**md**", ya que viene de "*multiple device*".
-   **Nivel RAID**: Podremos elegir entre las versiones 0, 1, 5, 6 y 10 de RAID. Por defecto está seleccionada la opción RAID 1.
-   **Dispositivos**: sobre el que aplicaremos el RAID.


:::
::: {.column width="45%" }
![](img/anexos/ubuntu_raid1/ubuntu_raid1_06.png){width="100%"}
:::
::::::::::::::

Crearemos primero **md0** seleccionando las particiones de 14GB tal como aparece en la siguiente imagen:

Y a continuación crearemos **md1** con las particiones restantes. Tal como se puede ver a continuación, las particiones de 14GB ya no aparecen, porque están siendo usadas en el otro RAID.


![](img/anexos/ubuntu_raid1/ubuntu_raid1_07.png){width="45%"}


Tras la creación de los dispositivos "md", nos aparecerán como dispositivos disponibles para usarlas en el siguiente paso:


![](img/anexos/ubuntu_raid1/ubuntu_raid1_08.png){width="45%"}


### Formatear particiones RAID con el formato adecuado {#formatear-particiones-raid-con-el-formato-adecuado-1}

Aunque este paso lo vamos a realizar sobre las particiones RAID creadas previamente, es un paso que es habitual realizar cuando queremos que nuestra instalación tenga un sistema de particiones propio.

Tenemos que pensar que las particiones RAID ahora son como particiones normales, a las que les vamos a querer dar un formato y utilizarlas para realizar la instalación.

Vamos a seleccionar la primera, **md0**, posicionándonos encima de ella y dándole a "Intro" y posteriormente dándole a "*Add GPT partition*":


![](img/anexos/ubuntu_raid1/ubuntu_raid1_09.png){width="40%"}


Dejaremos el tamaño en blanco, indicando que usaremos todo el espacio libre, lo vamos a formatear con el sistema de ficheros **ext4** y se va a montar como el sistema de ficheros "/".

En **md1** también le daremos a crear nueva partición, y haremos lo mismo pero usando el formato **swap**. Quedando una vez terminado el sistema de particiones de la siguiente manera:


![](img/anexos/ubuntu_raid1/ubuntu_raid1_10.png){width="40%"}


Y tras esto podremos continuar la instalación de manera normal.

`\clearpage`{=latex}
