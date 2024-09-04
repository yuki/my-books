

# Introducción {#introducción-wsl}

[WSL](https://learn.microsoft.com/es-es/windows/wsl/) (del inglés *Windows Subsystem for Linux*) es una capa de compatibilidad que ha desarrollado Microsoft para correr ejecutables creados para sistemas Linux de manera nativa en Windows.

Desde el año 2019 la versión por defecto es la 2, que introdujo muchos cambios en el sistema, ya que esta versión corre dentro de una capa de virtualización creada a través de un subconjunto del virtualizador [Hyper-V](https://es.wikipedia.org/wiki/Hyper-V). Esto hace que el kernel que se está ejecutando sea mucho más compatible con los binarios de Linux que la versión 1. A pesar de usar virtualización, también mejora el rendimiento respecto a la versión anterior.

Por defecto WSL no viene instalado en el sistema en Windows 10, por lo que es necesario realizar la instalación para poder ejecutar las aplicaciones que deseemos (como Docker, por ejemplo).

# Instalación {#instalación-wsl}

Para realizar la instalación necesitaremos una versión compatible de Windows (10 build 19041 o posterior). Hoy en día no debería ser problema si tenemos el sistema actualizado.

Para realizar la instalación necesitaremos de permisos de administrador, y lo realizaremos, para mayor comodidad, desde una consola de PowerShell o la [nueva terminal de Windows](https://github.com/microsoft/terminal). Para ello, abrimos la consola con permisos de administrador y ejecutamos:

::: {.mycode}
[Instalación de WSL en Windows 10]{.title}

``` powershell
PS C:\\Windows\system32> wsl --install
```
:::


Tras la instalación es necesario reiniciar el sistema para que aplique cambios y levante los servicios necesarios. Una vez reiniciado nos aparecerá una ventana donde nos pedirá que introduzcamos el usuario y la contraseña para el sistema Linux recién instalado.

::: infobox
Por defecto, la distribución que se instala es Ubuntu.
:::

# Configuraciones {#configuraciones-wsl}

Tras realizar la instalación podremos observar que Windows ha realizado una serie de configuraciones para adecuar la nueva instalación del servicio.

-   Al tener las instancias levantadas, se genera un nuevo interfaz de red Hyper-V, con una red 172.25.240.0/20.

-   Tal como se ha dicho, en WSL-2 las instancias realmente son máquinas virtuales Hyper-V. La configuración de las instancias se encuentran en el directorio [AppData]{.configdir} del usuario que las crea. Por ejemplo, para Debian, se encuentra el disco duro dentro de [./AppData/Local/Packages/TheDebianProject.../LocalState/ext4.vhdx]{.configfile}

    ::: errorbox
El directorio AppData está oculto por defecto en el explorador de ficheros de Windows.
    :::

-   Dentro de las instancias se puede acceder al disco duro de Windows a través de [/mnt/c]{.configdir}, o la unidad correspondiente.

-   Desde Windows se puede acceder al sistema de ficheros de las instancias a través del explorador de ficheros, ya que nos aparecen las instancias que tenemos creadas.

## Configuración avanzada {#configuración-avanzada}

Para realizar una configuración avanzada, existe una [documentación](https://learn.microsoft.com/en-us/windows/wsl/wsl-config) desde dos puntos de vista:

-   [wsl.conf]{.configfile}: fichero de configuración que se sitúa en el directorio [/etc]{.configdir} en las distribuciones. **Esta configuración sólo afecta en la distribución correspondiente** donde se haya realizado. Más adelante veremos un ejemplo para el uso de Docker.

-   [.wslconfig]{.configfile}: **fichero en el directorio del usuario de Windows**. Este fichero tendrá la configuración que afectará a todas las distribuciones que hayamos instalado con WSL 2.

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
```
:::


::: {.mycode}
[Eliminar una distribución instalada]{.title}

``` powershell
PS C:\Users\ruben> wsl --unregister Ubuntu
```
:::


::: {.mycode}
[Clonar una instancia de una distribución instalada]{.title}

``` powershell
PS C:\Users\ruben> wsl --export Ubuntu ubuntu.tar

PS C:\Users\ruben> wsl --import Ubuntu2 ubuntu2_files ./ubuntu.tar
```
:::


::: {.mycode}
[Apagar las instancias]{.title}

``` powershell
PS C:\Users\ruben> wsl --shutdown
```
:::



# Docker dentro de WSL {#docker-dentro-de-wsl}

Microsoft tiene un apartado en su [documentación](https://learn.microsoft.com/es-es/windows/wsl/tutorials/wsl-containers) para utilizar Docker dentro de WSL. El "problema" es que este sistema hace uso de [Docker Desktop](https://www.docker.com/products/docker-desktop/) en lugar del servicio (o *engine*) que se puede instalar en distribuciones GNU/Linux por defecto.

Si no queremos hacer uso de [Docker Desktop](#instalacion-docker-windows-mac), dentro de la instancia que nos interese utilizar con Docker deberemos crear un fichero en [/etc/wsl.conf]{.configfile} con el siguiente contenido.

::: {.mycode}
[Configuración del fichero wsl.conf]{.title}

``` yaml
[boot]
systemd=true
```
:::


Salimos de la distribución y tenemos que forzar su reinicio. Una vez realizado estos pasos, si volvemos a entrar en la instancia, [systemd]{.commandbox} estará funcionando y por tanto podremos hacer uso del Docker Engine.

