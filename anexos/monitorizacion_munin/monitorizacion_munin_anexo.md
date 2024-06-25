
# Instalar sistema de monitorización Munin {#instalar_munin}

A continuación se detalla cómo realizar la instalación y configuración básica de Munin como sistema de monitorización.

## Introducción {#munin_introduccion}

[Munin](https://munin-monitoring.org/) es un sistema de monitorización que se instala en cada servidor que queramos monitorizar. Es un sistema de monitorización sencillo que automáticamente monitoriza el propio servidor. Munin puede utilizarse para:

-   Monitorizar el propio servidor

-   Crear gráficas con los resultados de monitorización

-   Usar plugins para monitorizar distintos servicios

-   Realizar avisos sencillos por mail por situaciones anómalas

Munin necesita de un servidor web, como puede ser [Apache](https://httpd.apache.org/), para poder visualizar las gráficas que crea con los datos obtenidos de la monitorización. Estas gráficas no son más que datos que se obtienen de la monitorización, que son almacenados en pequeñas bases de datos y que mediante un proceso CRON se generan las imágenes con dichos datos.

Aunque Munin puede ser suficiente para la monitorización de un servidor, no se suele utilizar en casos en los que se tenga más de 10-15 servidores, ya que hay que ir servidor a servidor para realizar la configuración, por lo que dificulta la administración.

Munin posee un sistema básico de monitorización centralizada, pero dista mucho de lo que se puede considerar un sistema de monitorización centralizada real. Tal como se ha dicho, para pocos servidores puede ser suficiente, pero no para infraestructuras grandes.

La ventaja que se obtiene al utilizar Munin es que es una instalación muy sencilla, tal como veremos a continuación, y que por tanto, para infraestructuras pequeñas puede ser útil.

## Instalación {#munin_instalacion}

Para que Munin funcione se va a necesitar instalar el propio Munin y [Apache](https://httpd.apache.org/) como servidor web para mostrar la web en la que se visualizan los datos obtenidos de la monitorización.

Para realizar la instalación, ejecutaremos:

::: mycode
[Instalar Munin y Apache2]{.title}
``` console
root@vega:~# apt install munin apache2
```
:::

Tras la ejecución de este comando, ya se habrá instalado los servicios necesarios para que Munin funcione y el servidor web Apache.

### Configuración de Apache {#munin_configuracion_apache}

La configuración para que Munin se pueda ver a través del servidor web Apache se encuentra en el fichero de configuración [/etc/munin/apache24.conf]{.configfile}. Normalmente esta configuración ya está aplicada en el Apache tras realizar la instalación, y se puede ver que existe un enlace simbólico, que si seguimos desde [/etc/apache2/conf-enabled/munin.conf]{.configfile} nos llevará al fichero mencionado previamente.

Esta configuración permite ver la web de Munin pero sólo si estamos conectados desde el propio servidor, a modo de seguridad sólo permite conexiones desde "localhost". Esto no suele ser lo habitual en servidores, por lo que vamos a modificar la configuración para poder acceder a esta web desde cualquier IP.

::: errorbox
Permitir el acceso desde cualquier IP es un fallo de seguridad. Habría que modificar la configuración y poner autenticación con "auth-basic".
:::

Para ello, modificaremos el fichero arriba mencionado y modificaremos las líneas donde aparece "Require" y pondremos "**Require all granted**". Tras realizar la modificación de la configuración de Apache, deberemos reiniciar el servicio:

::: mycode
[Reiniciamos Apache para que coja la configuración]{.title}
``` console
root@vega:~# systemctl restart apache2
```
:::

Y tras esto, ya deberíamos poder ir al navegador web y poniendo **http://IPSERVIDOR/munin** (donde IPSERVIDOR es la IP del servidor que acabamos de configurar) y ver el interfaz de Munin:

![Interfaz de Munin](img/anexos/monitorizacion_munin/munin-01.png){width="90%" framed=true}


## Configuración

Tras la instalación, Munin por defecto tiene una configuración sencilla que hace una monitorización básica del servidor. La configuración se puede encontrar en [/etc/munin/]{.configdir} y podemos diferenciar 3 ficheros/directorios:

-   **munin.conf**: fichero de configuración principal. En él se puede configurar todo lo relacionado con Munin, avisos, procesos\...

-   **munin-node.conf**: es el fichero de configuración que se utiliza si se utiliza el sistema básico de monitorización centralizada. En este fichero especificaremos desde qué servidores permitiremos que puedan monitorizar el propio servidor.

-   **plugins**: directorio con los plugins activados que se van a utilizar durante la monitorización. En este directorio están los enlaces simbólicos de los plugins que van a ser utilizados durante la monitorización del servidor. Los plugins están en [/usr/share/munin/plugins/]{.configdir}. Normalmente suelen ser scripts en los lenguajes Perl, Python o Shell.

## CRON {#munin_cron}

La monitorización del servidor se realiza a través de un proceso CRON que instala Munin y que por defecto se hace cada 5 minutos. El fichero CRON está situado en [/etc/cron.d/munin]{.configfile}, y cuenta con 4 procesos automáticos que se ejecutan en el servidor:

-   Proceso de monitorización

-   3 procesos de limpieza de caché y ficheros temporales que son creados durante la monitorización


`\clearpage`{=latex}
