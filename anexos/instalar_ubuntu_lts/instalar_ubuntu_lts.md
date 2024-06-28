
::: {#instalar_ubuntu_lts}
:::

# Instalar Ubuntu 22.04 LTS {#instalar-ubuntu-22.04-lts}

En este anexo realizaremos la instalación de la distribución Ubuntu 22.04 LTS en su versión para servidores. En este anexo no se va a explicar cómo realizar la creación de una máquina virtual donde se aloja el sistema operativo, ya que existen distintos tipos de virtualizadores.

No se realizará una guía "paso a paso", sino que se centrará en las partes más importantes de la instalación y en las que más dudas puedan surgir.

## Descargar Ubuntu 22.04 {#descargar-ubuntu-22.04}

La ISO la obtendremos de la [web oficial](https://ubuntu.com/#download) y seleccionaremos la versión 22.04 LTS de Ubuntu Server. Esta ISO contendrá el sistema base de Ubuntu y nos guiará para realizar la instalación del sistema operativo.

Una vez descargada la ISO tendremos que cargarla en el sistema de virtualización elegido y arrancar la máquina virtual.

## Instalar Ubuntu 22.04 {#instalar-ubuntu-22.04}

Tras arrancar la máquina virtual nos aparecerá un menú para seleccionar el idioma durante la instalación y le daremos a "Instalar Ubuntu Server".

![](img/anexos/instalar_ubuntu_lts/ubuntu_1.png){width="80%"}


A partir de aquí comenzará el instalador y los pasos que nos aparecerán serán los siguientes (algunos de estos pasos puede que no estén 100% traducidos al castellano):

1.  Elegir el idioma del sistema

2.  Actualización del instalador:

    -   Si la máquina virtual se puede conectar a internet, comprobará si existe una actualización del propio instalador de Ubuntu.

    -   Podemos darle a "Continuar sin actualizar"

3.  Configuración del idioma del teclado

4.  Configuración de la red

5.  Configuración del proxy de red

6.  Configuración del "mirror" o servidor espejo desde donde descargarse los [paquetes de software](#paquete_de_software) para las actualizaciones posteriores.

7.  Selección del disco duro donde realizar la instalación

8.  Elegir el particionado de disco.

9.  Configuración del perfil. Introduciremos el nombre de usuario, el nombre del servidor y la contraseña del usuario que vamos a crear.

10. Configuración de SSH Server. Aceptaremos que se instale el servidor SSH durante la instalación. En caso de no seleccionar esta opción, posteriormente podremos realizar la instalación.

11. "Featured Server Snaps". En esta pantalla nos permite instalar software muy popular en servidores.

Una vez le demos a continuar, comenzará la instalación en el disco duro. Debido a que durante la instalación tenemos conexión a internet, el propio instalador se descarga las últimas versiones de los paquetes de software desde los repositorios oficiales.

Al terminar la instalación, tendremos que reiniciar la máquina virtual.

## Post-instalación {#post-instalación}

Tras realizar el reinicio de la máquina virtual nos encontraremos con que el sistema arranca en el sistema recién instalado, y que tendremos que loguearnos introduciendo el usuario y la contraseña utilizadas en la instalación.

### Actualización del sistema {#actualización-del-sistema}

Por si acaso, realizaremos la actualización del índice del repositorio, actualizaremos el sistema y en caso necesario realizaremos un nuevo reinicio:

::: {.mycode}
[Actualizar Ubuntu]{.title}

``` console
root@ubuntu:~# apt update
...
root@ubuntu:~# apt upgrade
...
```
:::


Con estos comandos nos aseguramos que el sistema está actualizado a los últimos paquetes que están en el repositorio.

::: {#configurar_ip_estatica_ubuntu}
:::

### Poner IP estática {#poner-ip-estática}

Debido a la configuración de red de nuestro servidor, la IP está puesta en modo dinámica, esto quiere decir que nuestro equipo ha cogido la IP por configuración de DHCP de nuestra red. Debido a que un servidor debe de tener IP estática, tenemos que realizar la modificación adecuada para ponerle la IP estática que mejor nos convenga. Para ello editaremos el fichero de configuración situado en la siguiente ruta: [/etc/netplan/00-installer-config.yaml]{.configfile}

Lo modificaremos para que sea parecido a (siempre teniendo en cuenta la IP y gateway de nuestra red):

::: {.mycode}
[Configurando IP estática en Ubuntu]{.title}

``` yaml
network:
  ethernets:
    enp0s3:
      dhcp4: false
      addresses: [192.168.1.199/24]
      routes:
      - to: default
        via: 192.168.1.1
      nameservers:
        addresses: [8.8.8.8,1.1.1.1]
  version: 2
```
:::


El fichero de configuración que hemos modificado es de tipo [YAML](https://es.wikipedia.org/wiki/YAML), que es un formato de texto que suele ser utilizado en programación o en ficheros de configuración. Este tipo de ficheros tiene en cuenta los espacios para el uso de la identación, y no suele permitir el uso de tabuladores.

Para aplicar los cambios realizados en el fichero de configuración deberemos ejecutar el siguiente comando que aplicará los cambios:


::: {.mycode}
[Aplicar configuración de IP]{.title}

``` console
root@ubuntu:~# netplan apply
```
:::

`\clearpage`{=latex}
