
# Comandos de administración básica en GNU/Linux {#comandos-de-administracion-basica-linux}

En este documento vamos a recopilar comandos que nos pueden ser útiles a la hora de usar un sistema GNU/Linux y realizar su administración.

## Comandos sobre el sistema de ficheros {#comandos-sobre-el-sistema-de-ficheros}

A continuación unos comandos básicos para utilizar sobre el sistema de ficheros.


::: mycode
[Listar el contenido del directorio donde nos encontramos]{.title}
``` console
ruben@vega:~$ ls
Descargas   Escritorio  Música      Público
Documentos  Imágenes    Plantillas  Vídeos
```
:::


::: mycode
[Listar el directorio actual, versión "long"]{.title}
``` console
ruben@vega:~$ ls -l
total 36K
drwxr-xr-x 2 ruben ruben 4,0K nov 12  2022 Descargas
drwxr-xr-x 2 ruben ruben 4,0K dic  6 09:50 directorio1
drwxr-xr-x 2 ruben ruben 4,0K nov 12  2022 Documentos
drwxr-xr-x 2 ruben ruben 4,0K nov 12  2022 Escritorio
drwxr-xr-x 2 ruben ruben 4,0K nov 12  2022 Imágenes
drwxr-xr-x 2 ruben ruben 4,0K nov 12  2022 Música
drwxr-xr-x 2 ruben ruben 4,0K nov 12  2022 Plantillas
drwxr-xr-x 2 ruben ruben 4,0K nov 12  2022 Público
drwxr-xr-x 2 ruben ruben 4,0K nov 12  2022 Vídeos
```
:::


::: mycode
[Crear un nuevo directorio]{.title}
``` console
ruben@vega:~$ mkdir directorio1
ruben@vega:~$ ls
Descargas    Documentos  Imágenes  Plantillas  Vídeos
directorio1  Escritorio  Música    Público
```
:::

::: mycode
[Borrar un directorio que está vacío]{.title}
``` console
ruben@vega:~$ rmdir directorio1
```
:::


::: mycode
[Editar un fichero]{.title}
``` console
ruben@vega:~$ nano fichero.txt
```
:::


::: mycode
[Obtener el contenido de un fichero de texto]{.title}
``` console
ruben@vega:~$ cat fichero.txt
hola, qué tal
```
:::


::: mycode
[Paginar el contenido de un fichero de texto]{.title}
``` console
ruben@vega:~$ more fichero.txt
hola, qué tal
```
:::


::: mycode
[Borrar un fichero]{.title}
``` console
ruben@vega:~$ rm fichero.txt
```
:::


::: mycode
[Borrar un directorio y todo el contenido que tiene dentro. ¿Diferencias?]{.title}
``` console
ruben@vega:~$ rm -r directorio2
ruben@vega:~$ rm -fr directorio2
```
:::


::: mycode
[Buscar por un contenido dentro de un fichero]{.title}
``` console
ruben@vega:~$ grep hola fichero.txt
```
:::



## Comandos de red {#comandos-de-red}

Para ver los interfaces de red y las direcciones IP que tienen

::: mycode
[Obtener los interfaces y las IPs]{.title}
``` console
ruben@vega:~$ ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536
link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
inet 127.0.0.1/8 scope host lo

2: enp4s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500
link/ether 1a:8a:1c:ff:25:15 brd ff:ff:ff:ff:ff:ff
inet 192.168.1.99/24 brd 192.168.1.255 scope global enp4s0
```
:::

Para ver la ruta por defecto (el gateway o puerta de enlace).

::: mycode
[Obtener la puerta de enlace]{.title}
``` console
ruben@vega:~$ ip route show default
default via 192.168.1.1 dev enp4s0 onlink
```
:::


Ver los puertos TCP y servicios que están a la escucha en nuestro servidor

::: mycode
[Listar los puertos TCP a la escucha]{.title}
``` console
root@vega:~# ss -pntal
```
:::


## Comandos sobre procesos {#comandos-sobre-procesos}

Listar todos los procesos

::: mycode
[Listar todos los procesos]{.title}
``` console
root@vega:~# ps aux
```
:::


Listar todos los procesos en forma de árbol (para saber de quién son hijos)

::: mycode
[Listar todos los procesos en forma de árbol]{.title}
``` console
root@vega:~# pstree -p
```
:::


Matar un proceso (donde PID es el identificador del proceso).

::: mycode
[Matar un proceso]{.title}
``` console
root@vega:~# kill -9 PID
```
:::



## Estado de la carga y memoria del servidor {#estado-de-la-carga-y-memoria-del-servidor}

Para ver los procesos y su estado por consumo de CPU, RAM...

::: mycode
[Ver el estado del servidor]{.title}
``` console
root@vega:~# top
```
:::


Para ver los procesos y su estado por consumo de CPU, RAM... es necesario instalar este paquete

::: mycode
[Ver el estado del servidor]{.title}
``` console
root@vega:~# htop
```
:::


## Comandos sobre servicios (systemd/systemctl) {#comandos-sobre-servicios}

GNU/Linux cuenta con un sistema unificado (**systemd**) para administrar el sistema y los servicios que tenemos en nuestro servidor. Dado que es una pieza fundamental en el sistema operativo, debemos de conocer ciertos comandos para poder desempeñar tareas con él.

Listar todos los servicios/unidades

::: mycode
[Listar todos los servicios]{.title}
``` console
root@vega:~# systemctl
```
:::


Comprobar si algún servicio ha fallado

::: mycode
[Comprobar servicios que han fallado]{.title}
``` console
root@vega:~# systemctl --failed
```
:::


Comprobar el estado de un servicio concreto (en este caso, ssh)

::: mycode
[Comprobar servicios que han fallado]{.title}
``` console
root@vega:~# systemctl status ssh
```
:::



Parar un servicio concreto

::: mycode
[Parar un servicio concreto]{.title}
``` console
root@vega:~# systemctl stop ssh
```
:::


Arrancar un servicio concreto

::: mycode
[Arrancar un servicio concreto]{.title}
``` console
root@vega:~# systemctl start ssh
```
:::


Ver los logs de todo el sistema

::: mycode
[Ver los logs del sistema]{.title}
``` console
root@vega:~# journalctl
```
:::


Ver los logs de un servicio concreto (en este caso, ssh)

::: mycode
[Ver los logs del sistema]{.title}
``` console
root@vega:~# journalctl -u ssh
```
:::



Ver los logs del kernel


::: mycode
[Ver los logs del kernel]{.title}
``` console
root@vega:~# journalctl -k
```
:::


## Comandos para instalar/desinstalar paquetes {#comandos-para-instalar-paquetes}

Los comandos que se van a exponer aquí sirven para las distribuciones que utilizan el sistema de paquetes [APT (Advanced Packaging Tool)](https://es.wikipedia.org/wiki/Advanced_Packaging_Tool) que está presente en las distribuciones derivadas de [Debian](https://www.debian.org/), como por ejemplo Ubuntu.


::: mycode
[Sincroniza el índice de paquetes local con lo que está en los repositorios remotos configurados en **/etc/apt/sources.list**]{.title}
``` console
root@vega:~# apt update
```
:::


::: mycode
[Instala las versiones más nuevas de los paquetes que ya tenemos instalados]{.title}
``` console
root@vega:~# apt upgrade
```
:::


::: mycode
[Instala las versiones más nuevas de los paquetes  teniendo en cuenta las dependencias de los mismos y solucionando posibles conflictos.]{.title}
``` console
root@vega:~# apt full-upgrade
```
:::


## Comandos para apagar/reiniciar {#comandos-para-apagar-reiniciar}

Para realizar el apagado o reinicio de un equipo se pueden utilizar varios comandos distintos.

::: mycode
[Reiniciar el equipo]{.title}
``` console
root@vega:~# reboot
```
:::



::: mycode
[Apagar el equipo en un minuto]{.title}
``` console
root@vega:~# shutdown
```
:::


::: mycode
[Apagar el equipo ahora]{.title}
``` console
root@vega:~# shutdown now
```
:::



::: mycode
[Suspender el equipo]{.title}
``` console
root@vega:~# systemctl suspend
```
:::


