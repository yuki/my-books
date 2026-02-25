
# Clonezilla {#clonezilla}

**[Clonezilla](https://clonezilla.org/)** es una herramienta de **Software Libre** diseñada para la **clonación y creación de imágenes de discos y particiones**. Está basada en GNU/Linux y se ejecuta normalmente desde un sistema arrancable (USB), sin necesidad de instalarla en el sistema.

Es ampliamente utilizada en:

- Administración de sistemas
- Centros educativos
- Empresas
- Laboratorios informáticos
- Servicios técnicos

Clonezilla utiliza herramientas internas para copiar únicamente los bloques utilizados, lo que hace el proceso más eficiente que una copia sector por sector tradicional. Esto hace que en principio la clonación se realice más rápido y en caso de generar una imagen **ocupe menos espacio que el disco duro de origen**.

## Versiones {#versiones}

Clonezilla dispone de dos versiones principales:

- **Clonezilla Live**:
  - Diseñada para clonar un único equipo.
  - Se ejecuta desde USB o CD/DVD.
  - Ideal para mantenimiento técnico.
  - Permite crear imágenes y restaurarlas.
  - Soporta múltiples sistemas de archivos.
- **Clonezilla Server Edition**:
  - Permite clonar múltiples equipos simultáneamente.
  - Utiliza tecnología multicast.
  - Necesita infraestructura de red.
  - Pensada para entornos empresariales o educativos.


En este documento nos vamos a centrar en la Versión Live-*stable* (la versión 3.3.1) que se puede obtener en su [página de descarga](https://clonezilla.org/downloads.php).


# Uso básico de Clonezilla {#uso-básico}

Una vez descargada la ISO de Clonezilla lo ideal es hacer uso de un USB con Ventoy para arrancar el equipo con él. Para ello habrá que realizar cambios en el sistema UEFI.

Al arrancar nos mostrará un menú como el siguiente, que realmente es el menú GRUB de arranque Linux modificado con distintas opciones:

![](img/clonezilla/clonezilla-1.png){width=50% framed=true}


Podemos elegir la primera opción y cargará el sistema operativo (basado en [Debian](https://www.debian.org/)) que detectará el hardware del equipo en el que está corriendo. Nos permitirá elegir el idioma del sistema y cambiar el teclado (por defecto en inglés), para después mostrarnos el siguiente menú:

![](img/clonezilla/clonezilla-2.png){width=50% framed=true}

Si ya hemos usado alguna vez Clonezilla o conocemos los comandos, podemos acceder a un terminal (*Enter_shell*) para poder usarlo de manera más rápido. Si por el contrario elegimos la opción ***Start_Clonezilla***, que nos llevará al siguiente menú:

![](img/clonezilla/clonezilla-3.png){width=75% framed=true}


Este menú cuenta con cuatro opciones que vamos a detallar a continuación.


## Device-image {#device-image}

Esta es la opción para crear una imagen de un disco duro completo o una partición del mismo, o usar una imagen que ya tenemos hecha para volcarla a un disco o partición.

La imagen que vamos a utilizar, o crear, debe estar en alguna parte, y por tanto nos permite elegir entre distintos medios:

- Un dispositivo conectado (otro disco duro o un USB)
- Servidor SSH
- Servidor de ficheros (Samba, NFS, WebDav)
- Un *bucket* S3 de AWS.


## Device-device {#device-device}

En esta opción nos permite clonar un disco o partición a otro disco o partición que esté en el mismo equipo. Es importante no confundir cuál es el disco de origen de los datos y cuál es el destino (que borrará todo su contenido).

::: errorbox
Hay que tener cuidado al seleccionar el disco/partición origen y destino. ¡Si nos confundimos perderíamos todos los datos!
:::


## Remote-source {#remote-source}

Con esta opción generaremos un servidor que nos permitirá clonar un disco/partición local y se quedará a la espera de que un cliente se conecte (que será el destino donde se clonará el contenido seleccionado).


![](img/clonezilla/remote-source-dest.svg){width=50%}

Al elegir esta opción deberemos seleccionar el disco/partición y después nos hará una serie de preguntas acerca del estado del mismo. 


## Remote-dest {#remote-dest}

Esta será la opción que debemos elegir en el equipo destino donde queremos escribir los datos. Nos pedirá la IP del servidor origen de los datos y si queremos restaurar una partición o un disco completo.



## Lite-server y Lite-client {#lite}

Estas opciones son similares a la anterior, pero sirven cuando queremos hacer un clonado masivo de equipos. Si estamos en una red aislada, **Clonezilla lite-server** es capaz de desplegar su propio servidor DHCP y PXE para que los clientes se autoconfiguren y empiecen con el clonado automáticamente.

