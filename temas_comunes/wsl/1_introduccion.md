

# Introducción {#introducción-wsl}

[WSL](https://learn.microsoft.com/es-es/windows/wsl/) (del inglés *Windows Subsystem for Linux*) es una capa de compatibilidad que ha desarrollado Microsoft para correr ejecutables creados para sistemas Linux de manera nativa en Windows.

Desde el año 2019 la versión por defecto es la 2, que introdujo muchos cambios en el sistema, ya que esta versión corre dentro de una capa de virtualización creada a través de un **subconjunto del virtualizador [Hyper-V](https://es.wikipedia.org/wiki/Hyper-V)**. Esto hace que el kernel que se está ejecutando sea mucho más compatible con los binarios de Linux que la versión 1. A pesar de usar virtualización, también mejora el rendimiento respecto a la versión anterior.

Por defecto WSL no viene instalado en el sistema en Windows 10, por lo que es necesario realizar la instalación para poder ejecutar las aplicaciones que deseemos (como Docker, por ejemplo). En versiones Windows 11 sí viene instalado.

# Instalación {#instalación-wsl}

Para realizar la instalación necesitaremos una versión compatible de Windows (10 build 19041 o posterior). Hoy en día no debería ser problema si tenemos el sistema actualizado.

Para realizar la instalación necesitaremos de permisos de administrador, y lo realizaremos, para mayor comodidad, desde una consola de PowerShell o la [nueva terminal de Windows](https://github.com/microsoft/terminal). Para ello, abrimos la consola con permisos de administrador y ejecutamos:

::: {.mycode}
[Instalación de WSL en Windows 10]{.title}

``` powershell
PS C:\Users\ruben> wsl --install
```
:::


Tras la instalación es necesario reiniciar el sistema para que aplique cambios y levante los servicios necesarios. Una vez reiniciado nos aparecerá una ventana donde nos pedirá que introduzcamos el usuario y la contraseña para el sistema Linux recién instalado.

::: infobox
Por defecto, la distribución que se instala es Ubuntu.
:::

# Configuraciones {#configuraciones-wsl}

Tras realizar la instalación podremos observar que Windows ha realizado una serie de configuraciones para adecuar la nueva instalación del servicio.

- Al tener las instancias levantadas, se genera un nuevo interfaz de red Hyper-V, con una red 172.25.240.0/20.
- Tal como se ha dicho, en WSL-2 las instancias realmente son máquinas virtuales Hyper-V. La configuración de las instancias se encuentran en el directorio [AppData]{.configdir} del usuario que las crea. Por ejemplo, para Debian, se encuentra el disco duro dentro de [./AppData/Local/Packages/TheDebianProject.../LocalState/ext4.vhdx]{.configfile}

  ::: warnbox
El directorio AppData está oculto por defecto en el explorador de ficheros de Windows.
  :::

- Dentro de las instancias se puede acceder al disco duro de Windows a través de [/mnt/c]{.configdir}, o la unidad correspondiente.
- Desde Windows se puede acceder al sistema de ficheros de las instancias a través del explorador de ficheros, ya que nos aparecen las instancias que tenemos creadas.

Para poder realizar una configuración general de todo el ecosistema WSL se puede realizar desde una aplicación (disponible desde verano del 2024):

![Aplicación de configuración de WSL](img/temas_comunes/wsl/configuracion.png){width="100%" framed=true}

En esta aplicación se pueden modificar aspectos tan interesantes como:

- Procesadores lógicos dentro del WSL
- Tamaño máximo de la memoria
- Modo de red (NAT, mirrored, o proxy)


## Configuración avanzada {#configuración-avanzada}

Para realizar una configuración avanzada, existe una [documentación](https://learn.microsoft.com/en-us/windows/wsl/wsl-config) desde dos puntos de vista:

-   [wsl.conf]{.configfile}: fichero de configuración que se sitúa en el directorio [/etc]{.configdir} en las distribuciones. **Esta configuración sólo afecta en la distribución correspondiente** donde se haya realizado. Más adelante veremos un ejemplo para el uso de Docker.

-   [.wslconfig]{.configfile}: **fichero en el directorio del usuario de Windows**. Este fichero tendrá la configuración que afectará a todas las distribuciones que hayamos instalado con WSL 2.


# WSL con usuarios no privilegiados

WSL hace uso de ciertas características que necesitan de permisos de administrador. En caso de no tener permisos de administrador, por defecto sólo se hará uso de WSL versión 1, por lo que el rendimiento de los subsistemas es peor.

Por lo tanto, para poder utilizar WSL2 **se necesita tener acceso a los credenciales de administrador** y ejecutar los siguientes comandos:

::: {.mycode}
[Usar WSL2 en usuarios no privilegiados]{.title}

``` powershell
PS C:\Users\usuario> wsl --update

PS C:\Users\usuario> wsl --set-default-version 2
```
:::


# Comandos útiles {#comandos-útiles}

Una vez realizada la instalación, existen ciertos comandos que nos pueden ser útil a la hora de hacer uso de WSL. No se van a detallar todos, ya que con [wsl --help]{.commandbox} obtendremos la ayuda del comando y muchas más opciones.


::: {.mycode}
[Mostrar todas las distribuciones que se pueden instalar]{.title}

``` powershell
PS C:\Users\ruben> wsl -l -o
```
:::


::: {.mycode}
[Instalar una distribución Debian]{.title}

``` powershell
PS C:\Users\ruben> wsl --install -d Debian
```
:::


::: {.mycode}
[Mostrar las distribuciones instaladas]{.title}

``` powershell
PS C:\Users\ruben> wsl -l -v
```
:::



::: {.mycode}
[Ejecutar una distribución instalada y entrar en ella]{.title}

``` powershell
PS C:\Users\ruben> wsl -d Debian
ruben@DESKTOP-1RVJ3UP:/mnt/c/Users/ruben$
```
:::


::: {.mycode}
[Terminar/Apagar una distribución]{.title}

``` powershell
PS C:\Users\ruben> wsl -t Debian
```
:::



::: {.mycode}
[Apagar todas las instancias]{.title}

``` powershell
PS C:\Users\ruben> wsl --shutdown
```
:::


::: {.mycode}
[Eliminar una distribución instalada]{.title}

``` powershell
PS C:\Users\ruben> wsl --unregister Debian
```
:::


::: {.mycode}
[Clonar una instancia de una distribución instalada]{.title}

``` powershell
PS C:\Users\ruben> wsl --export Ubuntu ubuntu.tar

PS C:\Users\ruben> wsl --import Ubuntu2 ubuntu2_files ./ubuntu.tar
```
:::




# Acceder al sistema de ficheros de los subsistemas

Microsoft ha creado la posibilidad de poder acceder al sistema de ficheros de los Linux que levantemos con WSL a través del explorador de ficheros de Windows. Esto permite copiar/pegar ficheros entre las distribuciones que hayamos creado y el propio sistema base. En la siguiente imagen se ve el explorador de archivos con tres subsistemas Linux creados:

![Contenido de "/home/ruben" de Ubuntu desde el explorador Windows](img/temas_comunes/wsl/explorador_archivos.png){width="60%" framed=true}

Como alternativa, desde dentro del subsistema Linux [podemos ejecutar aplicaciones Windows](https://learn.microsoft.com/en-us/windows/wsl/filesystems#run-windows-tools-from-linux), por lo que estando en cualquier ruta, podemos llamar al comando [explorer.exe .]{.commandbox} que nos abrirá el explorador de Windows en esa misma ruta:

![Abrir explorador Windows desde Linux](img/temas_comunes/wsl/explorador_archivos_2.png){width="60%"}


## Rendimiento de los sistemas de ficheros en WSL

Por cómo funciona WSL y la gestión de sistemas de ficheros entre el sistema anfitrión Windows y el subsistema Linux, tenemos que tener claro que **existen dos sistemas de ficheros independientes, pero accesibles entre ellos**:

- **Sistema de ficheros de Windows**: Es el sistema de ficheros de nuestro equipo Windows. Hay que tener en cuenta, que cuando entramos al subsistema Linux, por defecto nos encontramos en ese mismo sistema de ficheros:
  
::: {.mycode}
[Al entrar al subsistema Linux, estamos en el sistema de ficheros de Windows]{.title}

``` powershell
PS C:\Users\ruben\Desktop> wsl -d Ubuntu
ruben@DESKTOP-1RVJ3UP:/mnt/c/Users/ruben/Desktop$
```
:::

  Tal como se puede ver, al entrar en Ubuntu, la ruta en la que nos encontramos es [/mnt/c/Users/ruben/Desktop]{.configdir}, que es el sistema de ficheros de Windows (`C:`) **montado en la ruta de Linux** `/mnt/c`. Por eso, desde Linux tendremos acceso a todo el sistema de ficheros de Windows desde esa ruta.

- **Sistema de ficheros del subsistema Linux**: La máquina virtual de Linux que hemos creado tiene su propio sistema de ficheros, que como en cualquier Linux, está en `/`. 

::: {.mycode}
[Pasamos al sistema de ficheros real de Linux]{.title}

``` powershell
ruben@DESKTOP-1RVJ3UP:/mnt/c/Users/ruben/Desktop$ cd
ruben@DESKTOP-1RVJ3UP:~$ pwd
/home/ruben
```
:::

  Tal como se puede ver, con el comando [pwd]{.commandbox}, ahora nos encontramos en el sistema de ficheros de Linux real.


A la hora de hacer uso de aplicaciones en el susbsistema Linux, es recomendable hacerlo dentro del sistema de ficheros de Linux, no en el sistema montado, debido a que el [rendimiento](https://learn.microsoft.com/en-us/windows/wsl/filesystems#file-storage-and-performance-across-file-systems) en el sistema montado es mucho peor. Por tanto, nos debemos asegurar que la aplicación está en la ruta correcta.
 
::: errorbox
**Usar el sistema de ficheros de Windows montado en el subsistema Linux perjudica el rendimiento.**
:::


# Docker dentro de WSL {#docker-dentro-de-wsl}

Si queremos tener Docker dentro de un subsistema Linux, existen dos posibilidades completamente diferenciadas:

- Utilizar **[Docker Desktop](#instalacion-docker-windows-mac) en Windows**. Docker Desktop usará WSL por debajo y tenemos la posibilidad de que los subsistemas hagan uso del Docker engine creado instalado en Docker Desktop. Este es el modo aconsejado por la [documentación de Microsoft](https://learn.microsoft.com/es-es/windows/wsl/tutorials/wsl-containers).
- Instalar el Docker Engine dentro de un subsistema Linux.

Este último método lo explicamos a continuación.

##  Instalar Docker Engine en WSL {#docker-engine-dentro-de-wsl}

En algunos casos nos puede interesar no hacer uso de [Docker Desktop](#instalacion-docker-windows-mac), porque lo que queremos es tener la posibilidad de un control total de Docker, como si de una instalación de máquina virtual completa de Linux se tratara. Es por ello que debemos realizar una pequña modificación en el funcionamiento del subsistema Linux correspondiente.

::: warnbox
Es más sencillo hacer uso de Docker Desktop en lugar de este sistema.
:::

Supongamos que hemos creado el subsistema Linux de la distribución Ubuntu, deberemos entrar en ella, y tendremos que crear un fichero en [/etc/wsl.conf]{.configfile} con el siguiente contenido.

::: {.mycode}
[Configuración del fichero wsl.conf]{.title}

``` yaml
[boot]
systemd=true
```
:::


Salimos de la distribución y tenemos que forzar su reinicio. Una vez realizado estos pasos, si volvemos a entrar en la instancia, [systemd]{.commandbox} estará funcionando y por tanto podremos instalar y hacer uso del Docker Engine como si fuese una máquina virtual creada al modo tradicional.

