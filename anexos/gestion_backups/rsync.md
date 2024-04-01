
# Creación de copias de seguridad en GNU/Linux {#creación-de-copias-de-seguridad-en-gnulinux}

Tal como hemos visto, la [gestión de copias de seguridad](#gestion_copias_de_seguridad) es de vital importancia para preservar los datos de nuestra empresa. Debemos interiorizar que el realizar copias de seguridad, tanto en nuestro ámbito personal como profesional, es una parte en la gestión de nuestra información así como el comprobar que se realizan de manera correcta.

Al igual que sucede en Windows, existen múltiples sistemas para realizar copias de seguridad en GNU/Linux, pero uno de los más sencillos de utilizar ya suele venir instalado en la gran mayoría de las distribuciones hoy día: **rsync**.

## Rsync como sistema para sincronizar directorios {#rsync-como-sistema-para-sincronizar-directorios}

Rsync es una aplicación que ofrece la posibilidad de realizar la sincronización de directorios (de manera local o en remoto) de manera eficiente, ya que es capaz de sincronizar sólo las modificaciones realizadas en los ficheros.

Por defecto, **rsync** copia las modificaciones o ficheros nuevos que existen en el directorio de origen y los copia al directorio de destino. Si un fichero es borrado en el directorio origen, **por defecto no se borra en el directorio de destino**.

La manera más sencilla de utilizar rsync es para crear una sincronización de un directorio local a un servidor remoto en el que almacenar una copia de los datos.

::: errorbox
**Esta sincronización remota equivale a realizar una copia completa de todos los datos (de manera recursiva), o lo que es lo mismo, un *full-backup*.**
:::

::: mycode
[Ejemplo para sincronizar dos directorios locales]{.title}
```console
ruben@vega:~$ rsync -av directorio_origen  directorio_destino
```
:::

En el ejemplo anterior lo que hace es sincronizar todo el "directorio\_origen" dentro del "directorio\_destino". En cambio:

::: mycode
[Ejemplo para sincronizar dos directorios locales]{.title}
```console
ruben@vega:~$ rsync -av directorio_origen/  directorio_destino2
```
:::

En este ejemplo, como hemos añadido una barra "/" al final del directorio origen, lo que estamos indicando es que el contenido (y sólo el contenido) se va a sincronizar dentro de "directorio_destino2".

::: errorbox
Hay que tener cuidado con esa "**/**", ya que ponerla o no ponerla da resultados distintos en la sincronización.
:::


### Rsync para sincronizar de manera remota {#rsync-para-sincronizar-de-manera-remota}

Tal como sabemos, nunca deberíamos realizar copias de seguridad de manera local en el mismo disco duro, ni tenerlas en el mismo equipo, por lo que es necesario poder realizar copias de seguridad desde otros servidores o a otros servidores.

Imaginemos que queremos copiar los datos de una carpeta compartida [/home/sistemas]{.configdir} al servidor remoto 10.40.30.200, y dejar una copia en [/home/backups]{.configdir}:

::: mycode
[Sincronizar directorio local a servidor remoto]{.title}
```console
ruben@vega:~$ rsync -av /home/sistemas  root@10.40.30.200:/home/backups
```
:::

Con este comando realizaremos la sincronización al servidor remoto haciendo uso de [SSH](#ssh_server) y conectándonos con el usuario root remoto. Explicación de los distintos apartados del comando:

-   **rsync** es el programa que usamos para realizar la sincronización.

-   **-av** son los parámetros que realizan la sincronización en moodo archivos y en modo "verbose" (nos indica qué está sincronizando).

-   **/home/sistemas** es el directorio con los datos de origen que vamos a sincronizar

-   **root** es el usuario con el que nos vamos a conectar al servidor remoto.

-   **\@10.40.30.200:** es el servidor al que nos vamos a conectar por SSH para realizar en él la copia. **¡OJO!** Es importante esa "@" y los ":" al final.

-   **/home/backups** es el lugar donde dejaremos una copia de los datos a sincronizar.

Tal como se ha comentado, rsync hará uso de SSH para realizar la conexión remota, por lo que los datos se enviarán de manera segura y cifrada.

### Obtener datos remotos {#obtener-datos-remotos}

Si queremos realizar la sincronización en el orden inverso, obtener los datos estando en el servidor de backup y traernos los datos de un servidor remoto, el comando sería:

::: mycode
[Sincronizar directorio remoto a directorio local]{.title}
```console
root@backups:~# rsync -av 10.40.30.5:/home/sistemas  /home/backups
```
:::

En este caso, estando en el servidor de backups, vamos a traernos los datos del servidor 10.40.30.5. En este caso, antes de la IP del servidor no hemos puesto usuario, por lo que se realizará la conexión con el mismo usuario que somos actualmente, en este caso **root**.

### Opciones extra {#opciones-extra}

Hasta ahora hemos visto las opciones más básicas para sincronizar directorios (tanto locales como remotos), pero rsync cuenta con muchas opciones extra que es interesante conocer:

-   **\-z** o **\-\-compress** sirve para comprimir los datos antes de realizar el envío o recepción de los datos. Sólo es útil si vamos a realizar la sincronización de manera remota.

-   **\-\-progress** sirve para ver el progreso de cómo va la transferencia de los ficheros

-   **\-\-delete** sirve para borrar en el destino los ficheros que no existen en el origen.

-   **\-\-exclude "\*txt"** excluye los ficheros que termina con la extensión "txt" al hacer la sincronización.


