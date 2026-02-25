
# Un poco de historia {#un-poco-de-historia}

Windows Server es la línea de productos de Microsoft **enfocada a servidores** que se inició con la primera versión: Windows Server 2003.

Anteriormente, Microsoft contaba con una línea también dedicada a estaciones de trabajo y servidores en red cuyo nombre era Windows NT, por lo que se puede considerar que **Windows Server es la continuación de NT** con el cambio de nombre.

# Proceso de instalación de Windows Server 2022 {#proceso-de-instalación-de-windows-server-2022}

Para realizar la instalación de Windows Server 2022 necesitaremos el medio desde el que realizaremos la instalación. Microsoft permite la descarga desde su [página oficial](https://www.microsoft.com/es-es/evalcenter/evaluate-windows-server-2022) una evaluación de 180 días que podremos descargar en varios formatos:

-   **Azure**: Es el sistema "en la nube" de Microsoft. Se puede probar Windows Server a través de una cuenta gratuita y posteriormente gestionar los sistemas virtualizados que se creen en la nube.
-   **ISO**: Una imagen ISO que podremos utilizar grabándolo en un DVD, a través de un USB o usarlo en un sistema de virtualización propio.
-   **VHD**: Formato de archivo que representa una unidad de disco duro virtual.

Para realizar una instalación completa en nuestro sistema de virtualización elegiremos el archivo ISO. Para poder descargarlo tendremos que rellenar un formulario, elegir el idioma y posteriormente comenzará la descarga.


## Requisitos previos {#requisitos-previos}

Antes de realizar la instalación debemos conocer cuáles son los requisitos mínimos de hardware que necesita Windows Server para así asegurar que la máquina virtual (o el hardware donde lo vamos a instalar) es 100% compatible. En este caso, y tal como nos indica la [web de Microsoft](https://docs.microsoft.com/es-es/windows-server/get-started/hardware-requirements), los requisitos son:

-   **Procesador** de 64 bits a 1,4 GHz, compatible con el conjunto de instrucciones x64
    -   Admite DEP y NX
    -   Admite CMPXCHG16b, LAHF/SAHF y PrefetchW
    -   Admite la traducción de direcciones de segundo nivel (EPT o NPT)
-   **RAM**: 512 MB (**2 GB** para la opción de instalación Servidor con Experiencia de escritorio). Se admite RAM tipo ECC (código de corrección de errores)
-   **Espacio en disco**: mínimo 32GB. Windows Server no admite discos ATA, PATA, IDE y EIDE para unidades de arranque, página o datos.
-   **Adaptador de red** de 1 gigabit/s


Dado que estos son los requisitos mínimos, nuestra máquina virtual deberá cumplirlos, pero en un sistema que vaya a estar en producción deberemos realizar un análisis de requisitos para asegurar que el hardware (ya sea virtual o físico) cumple las necesidades de los servicios que alojará:

-   ¿El servidor va a contar con un servidor web?
    -   ¿Cuántas visitas se esperan?
    -   ¿Qué tipo de web va a servir? ¿Programada en Java, PHP, ...?
-   ¿El servidor va a contar con un sistema gestor de base de datos?
    -   ¿Cuántas bases de datos va a tener?
    -   ¿Cuántas conexiones simultáneas esperamos?
    -   ¿Cuántas peticiones estimamos que va a recibir?
-   ¿El servidor va a servir para compartir ficheros?
    -   ¿Cuántos usuarios van a acceder?
    -   ¿Peticiones estimadas?
-   ...

Por tanto, antes de realizar la instalación, deberemos confirmar que conocemos para qué se va a utilizar el servidor, cuántos servicios se van a utilizar y la carga esperada.


## Instalación de Windows Server 2022 {#instalación-de-windows-server-2022}

El asistente de instalación de Windows Server nos va a llevar por una serie de pasos que detallaremos a continuación.

::: warnbox
Nos aseguramos que la máquina virtual arranque desde la ISO
:::


### Elección del idioma {#elección-del-idioma}

El primer paso del asistente será elegir el idioma principal que usaremos en el sistema operativo.
Antes de realizar la descarga de la ISO hemos elegido el idioma español, por lo que el asistente nos aparecerá por defecto en ese idioma. Podremos elegir:


:::::::::::::: {.columns }
::: {.column width="60%"}
-   Idioma que va a instalar
-   Formato de hora y moneda
-   Teclado o método de entrada

En nuestro caso dejaremos las opciones tal como nos aparece por defecto, pero de utilizar el servidor en un sistema internacional, convendría hacer uso del sistema en inglés.
:::
::: {.column width="36%" }
![](img/temas_comunes/windows_server/1_instalacion.png){width="100%"}
:::
::::::::::::::


### Elección del sistema operativo {#elección-del-sistema-operativo}

Windows Server 2022 tiene distintos modos a la hora de ser instalado, tal como podemos ver en la siguiente captura de pantalla del proceso de instalación:

::: center
![](img/temas_comunes/windows_server/2_instalacion.png){width="55%"}
:::

Existen dos opciones principales a la hora de elegir, ya que cada una de ellas permitirá instalarlo con o sin experiencia de escritorio. Las opciones principales son:

-   **Standard Evaluation**: Útil para empresas medianas o pequeñas, que no requieran de grandes sistemas de virtualización.
-   **Datacenter Evaluation**: No habrá límite a la hora de crear máquinas virtuales con un host Hyper-V por cada licencia.


Existen más diferencias, y es por eso que Microsoft tiene una página dedicada con la [comparación de ambas versiones](https://docs.microsoft.com/es-es/windows-server/get-started/editions-comparison-windows-server-2022). Por lo tanto, antes de realizar la instalación para nuestro sistema, debemos realizar una estimación de los requisitos para así poder elegir de manera adecuada.

Nosotros vamos a elegir la versión "Standard Evaluation" con experiencia de escritorio ya que podremos realizar la configuración desde el propio servidor. Dependiendo del caso, habrá que analizar cuál es la mejor opción antes de realizar la instalación.

Al darle a "Siguiente" nos aparecerán los términos de la licencia.

### Tipo de instalación {#tipo-de-instalación}

Tras aceptar la licencia nos aparecerá el tipo de instalación que deseamos realizar:

::: center
![](img/temas_comunes/windows_server/3_instalacion.png){width="50%"}
:::

-   **Actualización**: Para realizar actualizaciones sobre sistemas compatibles ya instalados.
-   **Personalizada**: Tal como indica la imagen anterior, los archivos, las configuraciones y las aplicaciones no se migran. En caso de realizar una instalación nueva (como en nuestro caso), **utilizaremos esta opción**.

Debemos tener en cuenta cuál es la situación en la que nos encontramos y decidir cuál es la mejor opción de las que se nos ofrece. Por eso es importante realizar la lectura de cada opción que nos aparece en todos los pasos de la instalación. Y más cuando se trata de la instalación de un sistema operativo de servidor

::: warnbox
**Es importante leer qué nos indica cada paso durante la instalación**
:::

### Particionado de discos duros {#particionado-de-discos-duros}

Dado que nuestra máquina virtual es nueva, y no tiene ningún sistema operativo previo, vamos a tener que realizar la instalación en el disco duro que se ha añadido a la máquina virtual.

Dependiendo del tamaño que hayamos elegido, o incluso los discos duros que tengamos, nos aparecerán en la nueva pantalla del programa de instalación.

:::::::::::::: {.columns }
::: {.column width="60%"}
En nuestro caso la máquina virtual cuenta con un único disco duro de 40GB de almacenamiento, en donde realizaremos la instalación de la manera predeterminada que Windows Server elija particionarlo. Por lo tanto, seleccionaremos el disco duro y le daremos al botón de "Siguiente".
:::
::: {.column width="36%" }
![](img/temas_comunes/windows_server/4_instalacion.png){width="100%"}
:::
::::::::::::::


### Terminar el proceso de instalación {#terminar-el-proceso-de-instalación}

:::::::::::::: {.columns }
::: {.column width="60%"}
Tras haber seleccionado y haber completado todos los pasos que se han descrito hasta ahora, el proceso de instalación comenzará.

Este paso de la instalación requerirá de cierto tiempo que dependerá del hardware que tengamos disponible, ya que se realizará la copia de los ficheros de sistema, realizará las instalaciones pertinentes y por último instalará las actualizaciones necesarias.
:::
::: {.column width="36%" }
![](img/temas_comunes/windows_server/5_instalacion.png){width="100%"}
:::
::::::::::::::


### Personalizar la configuración {#personalizar-la-configuración}

Al terminar el proceso anterior, el último paso nos permitirá realizar la configuración de la contraseña del usuario **Administrador**.


Tal como se puede ver a continuación, el nombre de usuario no podrá ser modificado, y nos pedirá la contraseña y la confirmación de la contraseña.

![](img/temas_comunes/windows_server/6_instalacion.png){width="50%"}


Cabe recordar que esta contraseña es muy importante, ya que con ella realizaremos la configuración de todo el sistema, y por tanto debe ser una contraseña segura y debemos guardarla a buen recaudo. Al darle a "Finalizar" el servidor se reiniciará.

## Post-instalación {#post-instalación}

Una vez realizada la instalación conviene retirar la imagen ISO del sistema de virtualización, así como incluso retirar el lector DVD virtual, ya que en principio no será necesario volverlo a usar.

Tras el primer arranque nos aparecerá la siguiente pantalla para realizar el login con el usuario Administrador, en donde introduciremos la contraseña que hemos puesto en el paso anterior. Una vez introducida, la siguiente pantalla será la pantalla de inicio donde podremos ver el panel de administrador del servidor.

:::::::::::::: {.columns }
::: {.column width="48%"}
![](img/temas_comunes/windows_server/7_instalacion.png){width="100%" framed=true}
:::
::: {.column width="48%" }
![](img/temas_comunes/windows_server/8_instalacion.png){width="100%" framed=true}
:::
::::::::::::::

<!-- ::: center
[Windows Server 2022 recién instalado.]{.footnotesize}
::: -->


# Windows Server 2022 como servidor de red {#windows-server-2022-como-servidor-de-red}

Windows Server 2022 tras la instalación no es más que un sistema operativo "normal", que potencialmente se puede convertir en un Sistema Operativo de red, con funcionalidad para administrar usuarios, creación de grupos, permisos, ... Para realizar estas funciones debemos de configurar el Sistema Operativo.

Como se ha observado, durante la instalación del Sistema Operativo apenas se realizan preguntas, por lo que es el propio instalador el que ha tomado ciertas decisiones por nosotros, como son:

-   Obtención de IP (a través de DHCP o Dynamic Host Configuration Protocol)
-   Nombre del equipo

Estos datos los modificaremos más adelante.

## Entendiendo conceptos en Windows Server {#entendiendo-conceptos-en-windows-server}

Durante la instalación y promoción del servidor como controlador de dominio y configuración de Active Directory, existen ciertos conceptos que son intrínsecos a cómo va a funcionar Windows Server como servidor y que deben de ser entendidos.

### Active Directory {#active-directory}

***Active Directory*** (AD), o **Directorio Activo**, son los términos que utiliza Microsoft para referirse a su implementación de servicio de directorio en una red distribuida de computadores. Utiliza distintos protocolos, principalmente [LDAP](https://es.wikipedia.org/wiki/Protocolo_ligero_de_acceso_a_directorios), [DNS](https://es.wikipedia.org/wiki/Sistema_de_nombres_de_dominio), [HDCP](https://es.wikipedia.org/wiki/Protocolo_de_configuraci%C3%B3n_din%C3%A1mica_de_host) y [Kerberos](https://es.wikipedia.org/wiki/Kerberos).

De forma sencilla se puede decir que es un servicio establecido en uno o varios servidores en donde se crean objetos tales como usuarios, equipos o grupos, con el objetivo de administrar los inicios de sesión en los equipos conectados a la red, así como también la administración de políticas en toda la red.

Su estructura jerárquica permite mantener una serie de objetos relacionados con componentes de una red, como usuarios, grupos de usuarios, permisos y asignación de recursos y políticas de acceso. (Fuente: [wikipedia](https://es.wikipedia.org/wiki/Active_Directory)).


### Dominio {#dominio}

Un dominio es una colección de objetos dentro del directorio que forman un subconjunto administrativo. Pueden existir diferentes dominios dentro de un bosque, cada uno de ellos con su propia colección de objetos y unidades organizativas.

Para poner nombre a los dominios se utiliza el protocolo DNS. Por este motivo, Active Directory necesita al menos un servidor DNS instalado en la red

### Unidad Organizativa (UO) {#unidad-organizativa-uo}

En inglés Organizational Unit (OU). Es la unidad jerárquica inferior al dominio que puede tener objetos y/u otras UO. Más adelante las usaremos para la creación de GPOs.

::: infobox
**Las Unidades Organizativas (UO) son contenedores dentro del Active Directory**
:::

### Objeto {#objeto}

La palabra Objeto se utiliza como nombre genérico para referirnos a cualquiera de los componentes que forman parte del directorio, como una impresora o una carpeta compartida, pero también un usuario, un grupo, etc. Incluso podemos utilizar la palabra objeto para referirnos a una Unidad organizativa.

Cada objeto dispondrá de una serie de características específicas (según la clase a la que pertenezca) y un nombre que permitirá identificarlo de forma precisa. En general, los objetos se organizan en tres categorías:

-   **Usuarios**: identificados a través de un nombre (y, casi siempre, una contraseña), que pueden organizarse en grupos, para simplificar la administración.
-   **Recursos**: que son los diferentes elementos a los que pueden acceder, o no, los usuarios según sus privilegios. Por ejemplo, carpetas compartidas, impresoras, etc.
-   **Servicios**: que son las diferentes funciones a las que los usuarios pueden tener acceso. Por ejemplo, el correo electrónico.


### Controlador de dominio {#controlador-de-dominio}

Un Controlador de Dominio (domain controller) contiene la base de datos de objetos del directorio para un determinado dominio, incluida la información relativa a la seguridad. Además, será responsable de la autenticación de objetos dentro de su ámbito de control.

En un dominio dado, puede haber varios controladores de dominio asociados, de modo que cada uno de ellos represente un rol diferente dentro del directorio. Sin embargo, a todos los efectos, todos los controladores de dominio, dentro del mismo dominio, tendrán la misma importancia.

### Árbol {#árbol}

Un Árbol es simplemente una colección de dominios que dependen de una raíz común y se encuentran organizados como una determinada jerarquía. Dicha jerarquía también quedará representada por un espacio de nombres DNS común.

De esta forma, sabremos que los dominios **empresa.com** e **informatica.empresa.com** forman parte del mismo árbol, mientras que **empresa.com** y **linux.com** no.

Si un determinado usuario es creado dentro de un dominio, éste será reconocido automáticamente en todos los dominios que dependan jerárquicamente del dominio al que pertenece.

### Bosque {#bosque}

El Bosque es el mayor contenedor lógico dentro de Active Directory, abarcando a todos los dominios dentro de su ámbito. Los dominios están interconectados por Relaciones de confianza transitivas que se construyen automáticamente (consultar más adelante el concepto de Relación de confianza). De esta forma, todos los dominios de un bosque confían automáticamente unos en otros y los diferentes árboles podrán compartir sus recursos.

::: center
![](img/temas_comunes/windows_server/bosque_directorio_activo.png){width="60%"}
:::

Como ya hemos dicho, los dominios pueden estar organizados jerárquicamente en un árbol que comparte un espacio de nombres DNS común. A su vez, **diferentes árboles pueden estar integrados en un bosque**. Al tratarse de **árboles diferentes, no compartirán el mismo espacio de nombres**.



### Relaciones de confianza {#relaciones-de-confianza}

En el contexto de Active Directory, las Relaciones de confianza son un método de comunicación seguro entre dominios, árboles y bosques. Las relaciones de confianza permiten a los usuarios de un dominio del Directorio Activo autenticarse en otro dominio del directorio.

## Configurando Windows Server como servidor en Red {#configurando-windows-server-como-servidor-en-red}

Antes de promocionar el servidor a controlador de dominio, y por tanto convertirlo en un servidor en red, debemos realizar unos pasos previos de configuración. Los pasos que tendremos que realizar serán los siguientes:

-   Configurar una **IP estática** al equipo: Todos los servidores en una red (tanto pública como privada) debe de tener una IP estática en la misma. Deberemos de conocer el direccionamiento de la red, y confirmar que la IP que vamos a configurar no está siendo utilizada por otro equipo.

    -   El cambio de IP se realiza en "**Configuración de Red e Internet**", en este caso "Protocolo de Internet versión 4" y poniendo la IP correspondiente a nuestra red.

        ::: center
        ![](img/temas_comunes/windows_server/cambiar_ip_windows.png){width="100%"}
        :::

    -   También vamos a configurar como **Servidor DNS preferido** la IP localhost, "127.0.0.1", para que posteriormente Active Directory ejerza de DNS local.

::: {#cambiar_nombre_equipo}
:::
-   Cambiar el **nombre del equipo**: Para que los servidores sean fácilmente identificables, debemos proporcionarles un nombre de equipo que indique cuáles son sus funciones. En nuestro caso, podemos llamarlo "**AD**" (de Active Directory) o "**DC**" (de *Domain Controller*). Tras realizar el cambio, el servidor deberá reiniciarse. El cambio se puede realizar desde varias partes de Windows Server, como por ejemplo:

    -   Click derecho en Inicio → Sistema
    -   Panel de control → Sistema y Seguridad → Sistema → Cambiar Configuración

    ![](img/temas_comunes/windows_server/cambiar_nombre_windows.png){width="100%"}


-   Asegurar que la zona horaria es la adecuada
    -   Comprobar servicio de hora
    -   Comprobar que la actualización de la hora es automática



## Instalar Active Directory {#instalar-active-directory}

Para promocionar el servidor a controlador de dominio de Active Directory debemos de realizar la instalación del rol. Para ello, iremos al "**Administrador del Servidor**".

::: center
![](img/temas_comunes/windows_server/administrador_del_servidor.png){width="100%" framed=true}
:::

Haremos click en "Administrar", "Agregar roles y características" y nos saldrá una nueva ventana, con un aviso del asistente y al darle a "Siguiente", elegiremos la primera opción, "**Instalación basada en características y roles**" y volveremos a darle a "Siguiente" en el asistente:


:::::::::::::: {.columns }
::: {.column width="46%"}
![](img/temas_comunes/windows_server/active_directory_1.png){width="100%"}
:::
::: {.column width="46%" }
![](img/temas_comunes/windows_server/active_directory_2.png){width="100%"}
:::
::::::::::::::


:::::::::::::: {.columns }
::: {.column width="58%"}

El siguiente paso será elegir el servidor dónde queremos realizar la instalación del rol de Active Directory. De primeras, puede parecer raro que nos pregunte en dónde queremos realizar la instalación, pero es fácil de entender cuando desde un servidor podremos llegar a controlar otros. De momento, sólo nos aparecerá el propio servidor donde estamos realizando la instalación, por lo que lo dejamos seleccionado y le damos a "Siguiente".

:::
::: {.column width="40%" }
![](img/temas_comunes/windows_server/active_directory_3.png){width="100%"}
:::
::::::::::::::


En el siguiente apartado podremos realizar la elección del rol que queremos añadir a nuestro servidor, y en este caso deberemos hacer click y asegurarnos que la opción está seleccionada en la opción "**Servicios de dominio de Active Directory**".

::: center
![](img/temas_comunes/windows_server/active_directory_4.png){width="60%"}
:::

Al hacer click en ella, nos saldrá una nueva ventana en la que nos avisa que se van a añadir herramientas necesarias para este rol, por lo que le daremos a "Agregar características" en esa nueva ventana. Le daremos a "Siguiente" para pasar al siguiente paso de la instalación.

El siguiente paso es el de "**Características**", en la que aparecen distintas opciones con su descripción. De momento no vamos a realizar ninguna instalación en este apartado. Le daremos a Siguiente.

En el último paso nos aparecerá una confirmación de los pasos que se van a realizar y sólo nos quedará darle a "**Instalar**":

::: center
![](img/temas_comunes/windows_server/active_directory_5.png){width="80%"}
:::

Tras esperar unos segundos, el proceso terminará y el botón de "Instalar" se cambiará por el de "Cerrar".

## Configurar Active Directory {#configurar-active-directory}

Tras realizar la instalación del rol de **Active Directory** en nuestro Windows Server, aparecerá un mensaje en la consola de administrador para que realicemos la configuración del mismo.

::: center
![](img/temas_comunes/windows_server/configurar_active_directory_1.png){width="100%" framed=true}
:::

En el desplegable haremos click en "**Promover este servidor a controlador de dominio**", y nos abrirá una nueva ventana en la que tendremos que realizar una serie de pasos para realizar la configuración del Active Directory recién instalado.

### Tipos de implementación {#tipos-de-implementación}

En el primer paso a la hora de configurar Active Directory aparecen tres opciones distintas que debemos de entender antes de proceder con la configuración. En la siguiente pantalla aparecen las tres opciones:

::: center
![](img/temas_comunes/windows_server/configurar_active_directory_2.png){width="60%"}
:::

-   **Agregar un controlador de dominio a un dominio existente**: lo utilizaremos cuando queramos tener Alta Disponibilidad en nuestra infraestructura, ya que el nuevo servidor actuará de réplica del servidor que actúe de controlador actualmente.
-   **Agregar un dominio a un bosque existente**: cuando necesitemos añadir un nuevo dominio (para realizar diferenciación a otro que ya tengamos instalado) a un bosque ya existente.
-   **Agregar un nuevo bosque**: Utilizado para realizar instalaciones nuevas creando un nuevo dominio.



### Nombre de dominio raíz {#nombre-de-dominio-raíz}

A la hora de elegir un dominio para nuestro Active Directory existen varias opciones:

-   Elegir un **TLD** (Top Level Domain) válido, registrado a tu empresa. Ejemplo: **miempresa.com**
-   Usar un **subdominio de un TLD** válido. Ejemplo: corp.miempresa.com
    Usar un **TLD no válido**. Ejemplo: miempresa.local, miempresa.corp, ...
-   En principio, y salvo que tengamos una razón para ello, elegiremos la primera opción y le daremos al botón de "Siguiente".

Dado que estamos realizando una instalación nueva, utilizaremos la última opción.


### Opciones del controlador de dominio {#opciones-del-controlador-de-dominio}

En el siguiente paso de configuración del Active Directory tendremos distintas opciones que debemos entender para proceder a su configuración:

::: center
![](img/temas_comunes/windows_server/configurar_active_directory_3.png){width="60%"}
:::

Los niveles funcionales determinan las funcionalidades disponibles de dominio o bosque de Active Directory, y determinan los sistemas operativos Windows Server que se pueden ejecutar en los controladores. Normalmente, **deberíamos elegir las últimas versiones disponibles** para poder utilizar el mayor número de características posibles. En caso de que necesitemos compatibilidad con versiones anteriores, entonces elegiremos la versión correspondiente.

También nos va a pedir la contraseña de restauración de servicios de directorio DSRM. Con ella podremos iniciar sesión cuando no se esté ejecutando el servicio de Active Directory, ya sea porque se ha detenido o porque hemos tenido que iniciar en modo DSRM el servidor.

### Otras opciones {#otras-opciones}

Una vez realizado el paso anterior, y tras darle a "Siguiente", nos aparecerán nuevos pasos que podremos pasarlos sin realizar modificaciones, ya que las configuraciones por defecto se corresponden al dominio que hayamos introducido o rutas donde se almacena la información. El último paso será para revisar y realizar la instalación:

:::::::::::::: {.columns }
::: {.column width="32%"}
![](img/temas_comunes/windows_server/configurar_active_directory_4.png){width="100%"}
:::
::: {.column width="32%"}
![](img/temas_comunes/windows_server/configurar_active_directory_5.png){width="100%"}
:::
::: {.column width="32%"}
![](img/temas_comunes/windows_server/configurar_active_directory_6.png){width="100%"}
:::
::::::::::::::


Tras estos pasos revisaremos las opciones y le daremos a "Instalar".


# Añadir un equipo Windows 10 al dominio {#añadir-un-equipo-windows-10-al-dominio}

Tras seguir los pasos previos, podremos añadir equipos al dominio creado en Active Directory y hacer uso de las configuraciones, usuarios y restricciones que iremos creando en apartados sucesivos. Para que un equipo Windows pueda pertenecer a un Active Directory debe ser de la familia "**Pro**", como por ejemplo: Windows 7 Pro, Windows 10 Pro...

## Instalación de Windows 10 Pro {#instalación-de-windows-10-pro}

Para realizar la instalación de un equipo con Windows 10, podremos hacer uso de la ISO que podremos descargar desde la [página de Microsoft](https://www.microsoft.com/es-es/software-download/windows10ISO).

:::::::::::::: {.columns }
::: {.column width="58%"}
No se van a explicar todos los pasos, ya que el sistema de instalación es sencillo. El único apartado donde deberemos fijarnos es en la pantalla de la derecha.

Tal como se ve en la imagen, elegiremos la opción "Windows 10 Pro", y continuaremos.

Al finalizar la instalación, el equipo se reiniciará y podremos introducir el usuario y contraseña que hemos creado durante la instalación.
:::
::: {.column width="40%"}
![](img/temas_comunes/windows_server/windows_10_1.png){width="100%"}
:::
::::::::::::::

::: infobox
**El usuario creado en la instalación es una cuenta LOCAL del equipo**
:::


## Pasos previos {#pasos-previos}

El equipo Windows 10 Pro deberá estar situado en la misma red del Windows Server, o permitir todas las conexiones que sean necesarias de estar en otra red.

Es recomendable modificar el nombre del equipo para que posteriormente sea más fácil de encontrarlo dentro del Active Directory, ya que el nombre por defecto de instalación es aleatorio. Para realizar el cambio, podremos seguir los [pasos indicados previamente para Windows Server](#cambiar_nombre_equipo), y en este caso elegiremos el nombre "win10".

Y por último, en la configuración de red del equipo Windows 10 configuraremos el servidor DNS preferido para que sea la IP del Windows Server 2022. Este cambio se podría realizar de manera automática si modificamos la configuración del DHCP de la red.

::: center
![](img/temas_comunes/windows_server/windows_10_2.png){width="50%"}
:::

## Añadir el equipo al dominio {#añadir-el-equipo-al-dominio}

Tras realizar los pasos previos, para añadir un equipo a un dominio de Active Directory tendremos que ir a la **Propiedades del Sistema** de Windows (dependiendo de la versión de Windows se puede llegar a esta pantalla de varias maneras).

Le daremos a "Cambiar". Si no hemos cambiado el nombre al equipo, podremos hacerlo en la nueva ventana, y a la par seleccionaremos el "Dominio" que hemos creado previamente, le daremos a "Aceptar" y nos aparecerá una nueva ventana donde **introduciremos el usuario "Administrador" y contraseña del Windows Server 2022**.

:::::::::::::: {.columns }
::: {.column width="32%"}
![](img/temas_comunes/windows_server/windows_10_meter_dominio_1.png){width="100%"}
:::
::: {.column width="32%"}
![](img/temas_comunes/windows_server/windows_10_meter_dominio_2.png){width="100%"}
:::
::: {.column width="32%"}
![](img/temas_comunes/windows_server/windows_10_meter_dominio_3.png){width="100%"}
:::
::::::::::::::



El equipo se conectará al servidor Windows Server 2022, comprobará que los datos son correctos, añadirá el equipo al Active Directory y nos pedirá reiniciar.



## Diferenciar usuario local y usuario de Active Directory {#diferenciar-usuario-local-y-usuario-de-active-directory}

Una vez que el equipo Windows 10 se ha añadido al Active Directory, nos vamos a poder loguear a él de dos maneras distintas:

-   **Usuario local**: Tras la instalación de Windows 10 sólo existe un usuario, que es el que hemos creado durante la instalación y es **Administrador local**. Este usuario no deberíamos utilizarlo salvo que el equipo tuviese algún problema que no se pudiese solventar desde Windows Server, quizá porque se haya salido del dominio, no tiene conexión a la red, ...

-   **Usuario de Active Directory**: La gestión de usuarios va a ser centralizada en Active Directory tal como vamos a ver en el apartado de gestión de grupos y usuarios, por lo que cualquier usuario que sea creado en Active Directory ahora mismo podría hacer login en este equipo.



:::::::::::::: {.columns }
::: {.column width="65%"}
A partir de ahora, cuando nos vuelva a salir la pantalla para introducir el usuario y contraseña, nos aparecerá a la izquierda el usuario que hayamos creado durante la instalación de Windows 10 y la opción "**Otro Usuario**". Al seleccionar esta opción, tendremos que introducir un usuario y la contraseña de un usuario **que exista en Active Directory**.
:::
::: {.column width="32%"}
![](img/temas_comunes/windows_server/windows_10_meter_dominio_4.png){width="100%"}
:::
::::::::::::::


Tal como se puede ver, ya nos viene marcado que al introducir el usuario se va a iniciar la sesión en el dominio creado anteriormente. También podremos indicar lo siguiente como nombre de usuario:

-   **usuario@example.com**: cuando necesitemos iniciar sesión con "usuario" del dominio "example.com".

-   **ruben@dominio.com**: cuando queramos usar como inicio de sesión el usuario "ruben" del dominio "dominio.com".

-   **.\\usuario**: donde el punto hace referencia a iniciar sesión local y "usuario" es el usuario administrador local que hemos creado durante la instalación.



# Gestión de grupos y usuarios {#gestión-de-grupos-y-usuarios}

Para crear usuario y grupos, dentro del "**Administrador del Servidor**", en el desplegable "**Herramientas**", elegiremos la opción "**Usuarios y equipos de Active Directory**", y nos aparecerá la siguiente ventana:

::: center
![](img/temas_comunes/windows_server/configurar_active_directory_7.png){width="70%"}
:::

Tal como se puede observar, a la izquierda tenemos un desplegable del dominio que hemos creado durante la instalación de Active Directory, y al seleccionar "Users" nos aparece a la derecha los **usuarios** y **grupos de seguridad** que el sistema ha creado por defecto.



## Grupos dentro del Active Directory {#grupos-dentro-del-active-directory}

Los grupos dentro del Active Directory son objetos que **pueden contener usuarios, contactos, equipos u otros grupos**.

::: warnbox
**No hay que confundir grupos con las Unidades Organizativas.**
:::

Al agregar un objeto a un grupo, ese objeto recibe todos los derechos asignados al grupo y todos los permisos asignados al grupo para todos los recursos compartidos.

Podemos utilizar los grupos para simplificar algunas tareas, como:

-   **Simplificar la administración**: Podemos asignar permisos al grupo y éstos afectarán a todos sus miembros.

-   Delegar la **administración**: Podemos utilizar la directiva de grupo para asignar derechos de usuario una sola vez y, más tarde, agregar los usuarios a los que queramos delegar esos derechos.

-   **Crear listas de distribución de correo electrónico**: Sólo se utilizan con los grupos de distribución que comentaremos más abajo.

Para crear grupos debemos tener clara la infraestructura de la empresa, los usuarios que tenemos y los grupos a los que va a pertenecer cada usuario. Esto es importante ya que la organización de los usuarios es una labor tediosa que en caso de tener que rehacerse se pierde tiempo en realizarlo.

Por otro lado, hay que recordar que cuando creemos el grupo el nombre será único dentro del dominio.

### Tipos de grupos {#tipos-de-grupos}

Windows Server admite dos tipos de grupos:

-   **Distribución**: Se usa para crear listas de distribución de correo electrónico. Sólo se pueden usar con aplicaciones de correo electrónico (como Exchange Server) para enviar correo electrónico a colecciones de usuarios. Los grupos de distribución no tienen seguridad habilitada.

-   **Seguridad**: Se usan para proporcionar de manera eficaz la asignación del acceso a los recursos de la red. Con los grupos de seguridad se pueden asignar derechos de usuario a grupos de seguridad en Active Directory permisos a grupos de seguridad de recursos.

### Ámbito de grupos {#ámbito-de-grupos}

Los grupos se caracterizan por un **ámbito** que identifica el grado en el que se aplica el grupo en el árbol de dominios o en el bosque. **El ámbito del grupo define dónde se pueden conceder permisos al grupo**. Los siguientes tres ámbitos de grupo se definen mediante Active Directory:

-   **Dominio Local**: Sólamente se puede otorgar permisos sobre los recursos que se sitúan en el dominio donde está ubicado el grupo de dominio local.

-   **Global**: Puede otorgar permisos sobre los recursos de cualquier dominio del bosque, o dominios de confianza.

-   **Universal**: Puede otorgar permisos sobre cualquier dominio del mismo bosque o de bosques de confianza.

### Grupos de seguridad predeterminados {#grupos-de-seguridad-predeterminados}

Los grupos predeterminados, como el grupo administradores del dominio, son grupos de seguridad que se crean automáticamente al crear un dominio en Active Directory. Se pueden utilizar estos grupos predefinidos para controlar el acceso a los recursos compartidos y para delegar roles administrativos específicos para todo el dominio.

A muchos grupos predeterminados se les asigna automáticamente un conjunto de derechos de usuario que autorizan a los miembros del grupo a realizar acciones específicas en un dominio, cómo iniciar sesión en un sistema local o realizar copias de seguridad de archivos y carpetas. Por ejemplo, un miembro del grupo operadores de copia de seguridad tiene el derecho de realizar operaciones de copia de seguridad para todos los controladores de dominio del dominio.

Los grupos predeterminados se encuentran en el contenedor **Builtin** y en el contenedor usuarios de usuarios y equipos de Active Directory.

### Crear un grupo para usuarios {#crear-un-grupo-para-usuarios}

Windows Server ya trae una serie de grupos creados por defecto y cada uno de ellos cuenta con sus características.

Para crear un grupo propio tendremos que ir a "**Usuarios y equipos de Active Directory**", seleccionar **Users** y hacer click derecho para elegir "**Nuevo**":

::: center
![](img/temas_comunes/windows_server/crear_grupo.png){width="50%"}
:::

Al darle a la opción "Grupo" tal como aparece en el menú desplegable, nos aparecerá una nueva ventana donde podremos elegir el nombre del grupo y las opciones comentadas previamente: qué "Ámbito de grupo" queremos que sea y el "Tipo de grupo":

::: center
![](img/temas_comunes/windows_server/crear_grupo2.png){width="50%"}
:::

Tras poner las opciones que mejor nos convenga, nos aparecerá el nuevo grupo, al que posteriormente podremos añadir usuarios.

## Usuarios {#usuarios}

En Windows Server, una cuenta de usuario es un objeto que posibilita el acceso a los recursos del dominio de dos modos diferentes:

-   Permite **autenticar la identidad de un usuario**, porque sólo podrán iniciar una sesión aquellos usuarios que dispongan de una cuenta en el sistema asociada a una determinada contraseña.

-   Permite **autorizar**, o **denegar**, el acceso a los recursos del dominio, porque, una vez que el usuario haya iniciado su sesión sólo tendrá acceso a los recursos para los que haya recibido los permisos correspondientes.

Cada cuenta de usuario dispone de un **identificador** de seguridad (**SID** o Security IDentifier) **que es único en el dominio**.

### Usuarios predeterminados {#usuarios-predeterminados}

Cuando se crea el dominio, se crean también dos nuevas cuentas:

-   **Administrador**: Tiene control total sobre el dominio y no se podrá eliminar ni retirar del grupo Administradores (aunque sí podemos cambiarle el nombre o deshabilitarla).

-   **Invitado**: Está deshabilitada de forma predeterminada y, aunque no se recomienda, puede habilitarse, por ejemplo, para permitir el acceso a los usuarios que aún no tienen cuenta en el sistema o que la tienen deshabilitada. De forma predeterminada no requiere contraseña, aunque esta característica, como cualquier otra, puede ser modificada por el administrador.

### Agregar cuenta de usuario no-administrador {#agregar-cuenta-de-usuario-no-administrador}

Para crear un nuevo usuario, por ejemplo **user1**, tendremos que elegir dónde lo queremos guardar. Haremos igual que con el grupo, click derecho y elegir la opción "Usuario" en este caso:

::: center
![](img/temas_comunes/windows_server/crear_usuario.png){width="50%"}
:::

Al seleccionar la opción de "Usuario", nos aparecerá una nueva ventana donde podremos rellenar:

:::::::::::::: {.columns }
::: {.column width="60%"}

-   **Nombre de pila**: Nombre del usuario. Este nombre se puede repetir en el servidor.
-   **Iniciales**: Formato abreviado del nombre y apellidos
-   **Apellidos**: Los apellidos del usuario
-   **Nombre completo**: Se autocompleta con lo rellenado en el nombre y los apellidos

:::
::: {.column width="37%"}
![](img/temas_comunes/windows_server/crear_usuario2.png){width="100%"}
:::
::::::::::::::


-   **Nombre de inicio de sesión de usuario**: El nombre que el usuario deberá introducir al encender el ordenador y aparecer la pantalla de inicio de sesión.

    ::: warnbox
    **El nombre de inicio de sesión no debe repetirse.**
    :::

-   **Nombre de inicio de sesión de usuario (Anterior a Windows 2000)**: Debería coincidir con el nombre de inicio de sesión.

Tras darle a "Siguiente" nos aparecerá la pantalla donde debemos introducir:

-   **Contraseña**: La contraseña que el usuario deberá introducir al iniciar sesión.

-   **Confirmar contraseña**: Debe coincidir.

Y aparecen cuatro opciones que podemos marcar dependiendo de lo que necesitemos:




:::::::::::::: {.columns }
::: {.column width="60%"}

<!-- \item[\ding{111}] -->
- Si permitimos que el usuario pueda cambiar la contraseña la siguiente vez que inicie sesión (al estar creando el usuario, será en el primer inicio de sesión).

- NO permitir que el usuario pueda cambiar la contraseña. Por lo tanto, en caso de querer modificarla se deberá realizar desde el servidor.

:::
::: {.column width="37%" }
![](img/temas_comunes/windows_server/crear_usuario3.png){width="100%"}
:::
::::::::::::::

- Que no expire la contraseña, ya que por defecto caducan pasados 42 días.

- Deshabilitar la cuenta.

Al darle a "Siguiente" nos aparecerá el último paso que será el de confirmar la creación del usuario.

::: infobox
**Todas estas opciones pueden ser modificadas una vez creado el usuario.**
:::

## Cuentas de equipo {#cuentas-de-equipo}

Una cuenta de equipo sirve para autenticar a los diferentes equipos que se conectan al dominio, permitiendo o denegando su acceso a los diferentes recursos del dominio.

Del mismo modo que con las cuentas de usuario, las cuentas de equipo deben ser únicas en el dominio. Aunque una cuenta de equipo se puede crear de forma manual, lo habitual es que se crean en el momento en el que el equipo se une al dominio.



# GPO: Directivas de grupos {#gpo-directivas-de-grupos}

Las GPO (*Group Policy Objets*) en castellano conocidas como "Objetos de Políticas de Grupo" (o simplemente directivas de grupo), son los objetos que incluye una serie de directivas (o políticas) que pueden aplicarse de manera centralizada a equipos y usuarios. Cada GPO establece una configuración del objeto al que afecta. Por ejemplo:

-   Montar una unidad de red correspondiente
-   Modificar configuración del firewall
-   Ocultar el panel de control
-   ...

::: infobox
**Las Directivas de Grupos controlan lo que los usuarios y los equipos pueden y no pueden hacer.**
:::

Las GPO se vinculan a nuestra estructura de árbol al nivel al que deseamos configurar. Si vinculamos una GPO en el nombre de nuestro árbol, esta GPO afectará a todo el árbol. Si por el contrario vinculamos nuestra GPO en un nombre de dominio, esa GPO solo afectará a dicho dominio. **Las GPO se pueden vincular en sitios, dominios y unidades organizativas**. Tal como se puede ver, y pese a su nombre, las GPO **no se pueden asociar a un grupo de usuarios**.

Para crear una GPO, tendremos que ir al "Administrador del Servidor" y en "Herramientas" elegir "Administración de directivas de grupo" (también conocido como **GPMC.exe**), lo que nos abrirá la siguiente ventana:

::: center
![](img/temas_comunes/windows_server/gpo_administrar.png){width="70%"}
:::

Las GPOs no se aplican de manera inmediata, ya que el equipo debe reiniciarse o el usuario cerrar sesión. Podemos hacer que desde el equipo un usuario ejecute la orden "**gpupdate.exe**" y esto forzará la actualización de las GPO, pero requiere de la intervención del usuario. Más adelante vamos a ver cómo forzar la actualización de las GPO de manera remota desde el servidor.

## Nivel de aplicación {#nivel-de-aplicación}

Dado que en un bosque podemos tener distintas GPOs que puedan afectar a un mismo objeto, debemos conocer que las directivas se aplican en este orden:

1.  **Objeto de directiva de grupo local**: cada equipo tiene exactamente un objeto de directiva de grupo almacenado de forma local. Este objeto controla el procesamiento de las directivas de grupo de equipo y usuario.

2.  **Sitio**: todos los GPO vinculados al sitio al que pertenece el equipo se procesan a continuación. El procesamiento se efectúa en el orden especificado por el administrador en la ficha **Objetos de directivas de grupo vinculados** del sitio en la Consola de administración de directivas de grupo (GPMC, Group Policy Management Console). La GPO con el **orden de vínculos** más bajo es la última en procesarse y, por tanto, tiene la máxima prioridad.

3.  **Dominio**: el procesamiento de varias GPO vinculadas a un dominio se efectúa en el orden especificado por el administrador, en la ficha **Objetos de directivas de grupo vinculados** del dominio en GPMC. La GPO con el **orden de vínculos** más bajo es la última en procesarse y, por tanto, tiene la máxima prioridad.

4.  **Unidades organizativas**: los GPO vinculados a la unidad organizativa que se encuentra en el nivel más alto de la jerarquía de Active Directory se procesan primero, luego las GPO vinculadas a su unidad organizativa secundaria y así sucesivamente. Por último, se procesan los GPO vinculados a la unidad organizativa que contiene el usuario o el equipo.

    ![](img/temas_comunes/windows_server/gpo.jpg){width="70%"}


La Directiva de Grupo se aplica de manera jerárquica desde el grupo menos restrictivo (Sitio) al grupo más restrictivo (Unidad Organizativa). La Directiva de Grupo también es acumulativa.

El comportamiento respecto a la herencia y prioridad entre GPO en contenedores anidados puede ser refinado mediante los siguientes dos parámetros de configuración:

-   **Exigido** (enforced). Este parámetro puede activarse independientemente a cada vínculo de un GPO. Si un vínculo de un GPO a un contenedor tiene este parámetro activado, sus políticas no pueden ser sobrescritas por GPO que se apliquen posteriormente.

-   **Bloquear herencia** (de directivas) (Block Policy inheritance). Este parámetro pertenece a los contenedores del Directorio Activo. En particular, si un contenedor tiene este parámetro activado, se desactiva la herencia de las políticas establecidas en contenedores superiores, excepto aquellas que corresponden a GPO vinculados con el parámetro Exigido.

Para poder crear o modificar directivas de grupo deberemos ir al asistente de "Administración del Servidor → Herramientas → Administración de directivas de grupo" o desde el comando **GPMC.exe**.



## Ejemplos prácticos {#ejemplos-prácticos}

A continuación se van a detallar la creación de distintas GPO que podremos utilizar de base para crear otras.

### Añadir una unidad de red a usuarios {#añadir-una-unidad-de-red-a-usuarios}

Es habitual que en una red los usuarios tengan que conectarse a unidades de red. Los usuarios finales no tienen por qué saber cómo conectarse a una unidad de red, y por tanto si les facilitamos el trabajo será más fácil que puedan acceder. En una red con Active Directory podemos indicar que los usuarios tengan distintas unidades de red conectadas en el equipo y con una letra correspondiente en el momento en el que se loguean.

Para el ejemplo se ha creado una Unidad Organizativa llamada "Usuarios" y dentro otra llamada "Sistemas" y dentro tenemos un usuario llamado "sysadmin1" que hemos añadido al grupo "sistemas":

::: center
![](img/temas_comunes/windows_server/gpo_1_1.png){width="100%"}
:::


#### Crear una carpeta compartida {#crear-una-carpeta-compartida}

Se ha creado una carpeta que hemos dejado en el escritorio del usuario administrador, aunque lo ideal es ponerlo en una ruta más acorde, pero como prueba nos sirve. Esta carpeta va a ser compartida con el grupo "sistemas" que hemos creado previamente:

::: center
![](img/temas_comunes/windows_server/gpo_1_2.png){width="80%" framed=true}
:::

Tras realizar estos pasos, un usuario que pertenezca al grupo "sistemas" podría conectarse a la carpeta compartida, pero debería conocer la ruta. Vamos a automatizar esto a través de la GPO.


#### Crear GPO {#crear-gpo}

Tal como hemos comentado previamente, la GPO va a permitir que cuando el usuario inicie sesión le aparezca la carpeta compartida como una unidad nueva con la letra que especifiquemos.
Los pasos para crear la GPO son:

1.  Ir a "Administración de directivas de grupo"


:::::::::::::: {.columns }
::: {.column width="60%"}
2.  Crear GPO en la unidad organizativa en la que queremos que esté asociado.
3.  Nos aparecerá una nueva ventana en la que podremos introducir un nombre para la GPO que vamos a crear. Este nombre debería darnos información de para qué sirve la GPO, por lo tanto, hay que elegir un nombre representativo, por ejemplo: "montar unidad para sysadmins"
:::
::: {.column width="37%" }
![](img/temas_comunes/windows_server/gpo_1_3.png){width="100%" framed=true}
:::
::::::::::::::


4.  Una vez creada, debemos configurar qué acciones queremos que realice. Para ello, haremos click derecho encima de la GPO y le daremos a "Editar", lo que nos abrirá una nueva ventana con el programa de edición de directivas de grupo, con la directiva que hemos seleccionado.

    ::: center
    ![](img/temas_comunes/windows_server/gpo_1_4.png){width="100%" framed=true}
    :::

    Tal como se puede ver en la imagen, arriba a la izquierda aparece el nombre de la GPO y el servidor en el que está creada. Debajo aparece si va a ser de tipo Configuración del equipo o configuración para usuario.

5.  Vamos a crear una configuración para usuarios, por lo tanto iremos a "*Configuraciones de usuario → Preferencias → Configuración de Windows → Asignaciones de unidades". Le damos a "Nueva → Unidad asignada*" y deberemos rellenar los datos indicando:

    a.  Ubicación de los datos
    b.  Etiqueta
    c.  Letra de unidad


:::::::::::::: {.columns }
::: {.column width="46%"}
![](img/temas_comunes/windows_server/gpo_1_5.png){width="100%" framed=true}

:::
::: {.column width="46%" }
![](img/temas_comunes/windows_server/gpo_1_6.png){width="100%"}
:::
::::::::::::::


Una vez hecho esto, cuando cualquier usuario que esté creado en la Unidad Organizativa "sistemas" inicie sesión, tendrá una unidad compartida en el apartado "Este equipo":

::: center
![](img/temas_comunes/windows_server/gpo_1_7.png){width="35%" framed=true}
:::

De esta manera, realizando una única configuración será válida para todos los usuarios que tengamos en esa Unidad Organizativa. El resumen de la GPO es:

::: center
![](img/temas_comunes/windows_server/gpo_1_8.png){width="80%" framed=true}
:::



### Permitir conexiones ping {#permitir-conexiones-ping}

Es habitual que los equipos Windows 10 no permitan realizar conexiones del protocolo ICMP (ping) ya que el firewall las rechaza. Por otro lado, para tener controlado los equipos que están encendidos en la red es interesante que esté habilitado.

Dado que ir configurando equipo a equipo el firewall es una tarea tediosa, el realizar la configuración de manera automática mediante una GPO es sencillo y nos permite ver cómo podemos realizar configuraciones que en este caso afectan al equipo y no al usuario.


:::::::::::::: {.columns }
::: {.column width="58%"}
En este caso vamos a crear una GPO que afecte a todos los equipos del dominio, por lo tanto haremos click derecho sobre el dominio y crearemos la GPO en él, poniéndole un nombre como "**Habilitar ping**".

Editamos la GPO y esta vez tenemos que desplegar los menús hasta llegar a: "*Configuración del equipo → Directivas → Configuración de Windows → Configuración de Seguridad → Windows Defender Firewall con seguridad avanzada → Windows Defender Firewall con seguridad avanzada → **Reglas de entrada***".
:::
::: {.column width="40%" }
![](img/temas_comunes/windows_server/gpo_2_1.png){width="100%" framed=true}
:::
::::::::::::::


Al llegar a este punto, haremos click derecho y le daremos a "Nueva regla" y vamos a seguir el asistente de creación de una nueva regla personalizada que permita el protocolo ICMPv4 de entrada desde cualquier equipo.

::: center
![](img/temas_comunes/windows_server/gpo_2_2.png){width="80%" framed=true}
:::

Una vez creada la GPO se aplicará cuando los equipos reinicien. Para evitar tener que reiniciar al crear nuevas GPO, vamos a crear la siguiente GPO que permitirá la administración del equipo de manera remota.



### Administración remota de equipos {#administración-remota-de-equipos}

Tal como hemos dicho anteriormente, las GPOs no se aplican de manera inmediata, y dependiendo de si son de equipo o de usuario se deberá reiniciar o cerrar sesión.

Para poder actualizar las GPOs de manera remota vamos a crear una GPO que va a permitir la conexión desde el servidor a los equipos y que permitirá recibir la orden de actualizar las GPOs entre otras cosas. Para tener ordenados los equipos, vamos a crear una "OU" llamada "equipos" y dentro de ella otras "OU" para cada departamento que queramos. Los equipos que tengamos en la red los deberemos ordenar en estas Unidades Organizativas creadas, y de esta manera podremos mandar la actualización a los equipos que nos interese.

Vamos a crear una nueva GPO llamada "Permitir actualizar GPOs desde servidor" y la vamos a crear en la "OU" de "equipos".

La ruta para crear es: "*Configuración del equipo → Directivas → Plantillas Administrativas → Red → Conexiones de red → Firewall De Windows Defender → Perfil de dominio → **Firewall de Windows Defender: permitir excepción de administración remota entrante***", la cual habilitaremos pero sólo permitiendo la IP de nuestro servidor. El resumen de la GPO sería el que aparece en la imagen:

::: center
![](img/temas_comunes/windows_server/gpo_3_1.png){width="80%" framed=true}
:::

Para aplicar esta GPO el equipo remoto deberá reiniciarse. A partir de este momento, cuando ya se haya aplicado la GPO podremos forzar la actualización de las GPO desde el servidor desde el propio "Administrador de directivas de grupo", haciendo click derecho sobre la OU donde están los equipos que nos interesa y dando a "Actualización de directiva de grupo"


:::::::::::::: {.columns }
::: {.column width="48%"}
![](img/temas_comunes/windows_server/gpo_3_2.png){width="100%" framed=true}
:::
::: {.column width="48%" }
![](img/temas_comunes/windows_server/gpo_3_3.png){width="100%" framed=true}
:::
::::::::::::::


Tras confirmar que queremos actualizar las directivas para el número de equipos que estén en esa Unidad Organizativa, nos aparecerá un mensaje de confirmación de que el proceso se ha realizado de manera correcta:

::: center
![](img/temas_comunes/windows_server/gpo_3_4.png){width="50%"}
:::

Debemos fijarnos que en la columna central no aparece ningún código de error. Este proceso hará que las GPOs se recarguen en una tarea que se va a ejecutar en el equipo remoto en los **próximos 10 minutos**. Si queremos que sea inmediato podemos forzar la actualización mediante un comando en powershell.

También podremos administrar los equipos desde el programa de "Usuarios y equipos de Active Directory", eligiendo el equipo que queramos y darle a "Administrar":

::: center
![](img/temas_comunes/windows_server/gpo_3_5.png){width="50%" framed=true}
:::

Lo que nos abrirá el asistente de administración remota:

::: center
![](img/temas_comunes/windows_server/gpo_3_6.png){width="75%"}
:::

Y desde aquí podremos realizar parte de la administración remota del equipo.


### Habilitar acceso al escritorio remoto {#habilitar-acceso-al-escritorio-remoto}

En una red no siempre tenemos acceso a los equipos de los usuarios, por encontrarse en otras sedes, oficinas o situaciones geográficas. Es por esto por lo que el poder acceder a los equipos de los usuarios **supone una ventaja administrativa a nivel global**.

Para ello, podemos crear una GPO para que los equipos que están en nuestro Active Directory se les active el acceso remoto para poder así conectarnos a ellos.

Los pasos a dar cuando creamos la GPO son:

1.  **Habilitar escritorio remoto**: "*Configuración del equipo → Directivas → Plantillas administrativas → Componentes de Windows → Servicios de Escritorio remoto → Host de sesión de Escritorio remoto → Conexiones → Permitir que los usuarios se conecten de forma remota mediante Servicios de Escritorio remoto*"

    ::: center
    ![](img/temas_comunes/windows_server/gpo_4_1.png){width="80%" framed=true}
    :::

2.  Habilitar el acceso en el firewall al puerto necesario (RDP, que es 3389). Existe una plantilla para ello en: "*Configuración del equipo → Directivas → Plantillas administrativas → Red → Conexiones de Red → Firewall de Windows Defender → Perfil de dominio*" y aceptar conexiones desde la IP del servidor.

    ::: center
    ![](img/temas_comunes/windows_server/gpo_4_2.png){width="80%" framed=true}
    :::

    ::: infobox
    **Por defecto sólo los usuarios administradores pueden realizar conexiones de acceso remoto.**
    :::

3.  Si queremos que cualquier otro usuario que no sea el Administrador pueda realizar conexiones mediante escritorio remoto, crearemos un grupo nuevo, por ejemplo "**escritorio remoto**".

    Este grupo debe ser admitido en los equipos remotos dentro del grupo local "**Usuarios de escritorio remoto**". Esto lo haremos a través de la GPO utilizando la directiva: "*Configuración del equipo → Preferencias → Configuración del Panel de control → Usuarios y grupos locales*". Hacemos click derecho, para crear nuevo grupo local, y seleccionaremos:

    -   **Nombre de grupo**: Usuarios de escritorio remoto (integrado).

    -   **Miembros**: El nuevo grupo que hemos creado

::: warnbox
**Recuerda que para que funcione tienes que forzar que se actualice la GPO de manera remota o con "gpupdate.exe".**
:::

# Alta Disponibilidad en Active Directory {#alta-disponibilidad-en-active-directory}

Cuando hablamos de Alta Disponibilidad hacemos referencia al diseño de una infraestructura de servicios y de servidores en la que no existe un único punto de fallo. Hasta ahora, nuestro dominio está controlado por un único servidor que realiza la función de Controlador de Dominio, por lo que en caso de catástrofe, perderíamos la posibilidad de configurar el dominio, añadir nuevos usuarios...

Para evitar ese único punto de fallo, es conveniente realizar la instalación de un nuevo servidor y configurarlo para que actúe como servidor réplica del controlador de dominio principal.

## Instalación del servidor réplica {#instalación-del-servidor-réplica}

La instalación del servidor réplica será igual que la del primer controlador de dominio, tal como hemos visto [anteriormente](#proceso-de-instalación-de-windows-server-2022). Lógicamente nos aseguraremos que el servidor cuente con otro nombre y otra dirección IP que no coincida con el servidor principal.

También realizaremos la instalación del rol de "**Servicios de dominio de Active Directory**" ya que lo vamos a necesitar más adelante.

## Meter servidor en el dominio actual {#meter-servidor-en-el-dominio-actual}

El primer paso es meter el nuevo servidor como un equipo más en el dominio del que queremos ser réplica. Los pasos a dar son los vistos anteriormente [para un equipo Windows 10](#pasos_previos_windows_cliente).

Tras realizar el reinicio correspondiente, vamos a promocionar el nuevo servidor para que actúe como servidor réplica.

## Configurar nuevo Active Directory como servidor réplica {#configurar-nuevo-active-directory-como-servidor-réplica}

Para promocionar el nuevo servidor Active Directory para que actúe como servidor réplica del dominio debemos ir al "Administrador del servidor" y pinchar sobre el aviso para promocionarlo, tal como hicimos en el servidor principal.

Al darle a promocionar, nos aparecerá en la nueva ventana la opción de "**Agregar un controlador de dominio a un dominio existente**" seleccionada, con el dominio correspondiente al que nos hemos metido previamente. Le daremos a "Cambiar" y meteremos las credenciales de Administrador del dominio. De esta manera, tendremos la ventana tal como aparece en la siguiente imagen y podremos dar a "Siguiente".

:::::::::::::: {.columns }
::: {.column width="48%"}
![](img/temas_comunes/windows_server/HA_active_directory_1.png){width="100%"}
:::
::: {.column width="48%" }
![](img/temas_comunes/windows_server/HA_active_directory_2.png){width="100%"}
:::
::::::::::::::


En este paso podremos elegir si queremos que nuestro servidor sea configurado en modo "sólo lectura" (por lo que realizará la réplica de datos, pero no podremos crear nada en él) y nos preguntará por la contraseña DSRM para este servidor. Una vez introducida, continuamos hasta llegar al siguiente paso.


:::::::::::::: {.columns }
::: {.column width="48%"}
En este paso nos permitirá realizar las opciones del DNS que necesitemos. En nuestro caso, vamos a continuar al siguiente paso sin realizar modificaciones en este apartado, por lo que llegaremos a las "opciones adicionales":

Tal como se puede ver en la captura de pantalla, podremos elegir desde qué servidor queremos realizar la réplica de los datos. 
:::
::: {.column width="48%" }
![](img/temas_comunes/windows_server/HA_active_directory_3.png){width="100%"}
:::
::::::::::::::

En nuestra infraestructura sólo tenemos otro servidor, por lo que no importa si seleccionamos el servidor o la opción "Cualquier controlador de dominio". Esta opción es útil cuando ya tengamos previamente dos o más servidores, ya que por conectividad nos puede interesar que realice la réplica desde uno en concreto.


Los siguientes pasos los dejaremos tal como están hasta realizar la instalación y que el servidor se reinicie.

## Comprobación del funcionamiento de la réplica {#comprobación-del-funcionamiento-de-la-réplica}

Una vez reiniciado el servidor réplica, veremos que al iniciar sesión nos aparecerán los grupos, usuarios y GPOs que teníamos en el servidor principal. Si vamos al gestor de "Usuarios y equipos de Active Directory" veremos que el nuevo servidor aparece dentro del apartado "Domain Controller":

::: center
![](img/temas_comunes/windows_server/HA_active_directory_4.png){width="80%"}
:::

Si creamos un nuevo usuario en cualquiera de los dos servidores, comprobaremos cómo en el otro servidor nos aparece también. De ser así, la réplica está funcionando de manera correcta.

## Configuración final {#configuración-final}

Para dejar nuestra configuración final correcta debemos de realizar una pequeña modificación en los DNS de los servidores y también en los clientes.

El cambio de configuración es que los servidores tienen que tener al otro servidor como DNS principal, y a sí mismos como DNS secundarios. Es decir, configuración cruzada:

::: center
![](img/temas_comunes/windows_server/HA_active_directory_5.png){width="50%"}
:::

Tal como se puede ver en la imagen, contamos con dos servidores para el dominio "example.com", ambos se replican entre sí y cada uno tiene como DNS principal al otro servidor.

Por otro lado, en lo referente a los equipos, la configuración debe ser igual: deben de tener como DNS principal uno de los servidores y como DNS secundario el otro . De esta manera, si el servidor que actúa como DNS principal cae, los equipos realizarán las peticiones al otro servidor. Esta modificación de DNS lo habitual es que se realice mediante el servidor DHCP en lugar de ir equipo por equipo (ya que es una tarea tediosa y fácilmente automatizable).

# Copias de seguridad en Windows Server 2022 {#copias-de-seguridad-en-windows-server-2022}

Windows Server 2022 no tiene instalado por defecto la característica de copias de seguridad, por lo que deberemos instalarla. Para ello abriremos el "Administrador del Servidor", le daremos a "Agregar Roles y Características", iremos hasta el apartado de características y seleccionaremos la opción de "Copias de seguridad de Windows Server":

::: center
![](img/temas_comunes/windows_server/backup_1.png){width="65%"}
:::

Una vez instalado podremos comenzar con el proceso de copias de seguridad. Pero antes, deberemos haber realizado una serie de pasos.

## Configurar copia de seguridad en Windows Server {#configurar-copia-de-seguridad-en-windows-server}

Una vez hecha la instalación, podemos ejecutar el asistente de copias de seguridad que está situado en la carpeta de "Herramientas Administrativas".

::: center
![](img/temas_comunes/windows_server/backup_2.png){width="65%"}
:::

Ahora ya podremos configurar el tipo de copia de seguridad que necesitemos. Para ello haremos click en la acción de "Programar copia de seguridad" o haciendo click derecho encima de "Copia de seguridad local", y nos abrirá un asistente con una serie de pasos:

::: center
![](img/temas_comunes/windows_server/backup_3.png){width="60%"}
:::

Este asistente nos permitirá hacer dos tipos de copias de seguridad:

-   **Servidor completo**: Esta opción nos permitirá realizar una copia de todo el servidor, de las aplicaciones que están instaladas y del estado del sistema

-   **Personalizada**: En caso de elegir esta opción, podremos elegir volúmenes, directorios o archivos de los que queremos guardar una copia de seguridad.

Una vez elegido el tipo de copia, podremos **elegir la hora** a la que queremos que se haga el backup, y si queremos que sea una vez al día o varias veces.

Posteriormente podremos elegir el volumen de destino donde guardaremos la copia de seguridad. El asistente de Windows Server nos deja tres opciones:

-   **Disco duro dedicado**: Este es el método más fiable cuando realizamos copias de seguridad locales. Para ello necesitaremos tener un segundo disco duro en el servidor, que sólo será accesible por el programa de copias de seguridad.

-   **En un volumen**: Esta opción no es recomendada, ya que de perderse el volumen, perdemos los datos y la copia de seguridad.

-   **En una carpeta de red compartida**: es el método ideal para realizar copias de seguridad que no sea en local. El problema que trae consigo es que sólo serán accesibles los datos de la última copia de seguridad.

Una vez terminado el asistente el programa configurará la tarea de realizar las copias de seguridad a las horas elegidas. También podremos forzar copias de seguridad "de una vez" en cualquier momento.

## Restauración de copia de seguridad {#restauración-de-copia-de-seguridad}

Como hemos dicho previamente, tras una copia de seguridad podremos realizar la restauración de los datos cuando así sea necesario. También hemos comentado previamente que es recomendable que cada cierto tiempo deberíamos realizar la restauración de datos en un servidor de pruebas para confirmar que las copias de seguridad se están realizando de manera correcta.

En el caso de las copias de seguridad realizadas en Windows Server podremos realizar dos tipos de restauraciones:

-   **Parcial**: Nos permitirá realizar una restauración de determinadas opciones a elegir, y podremos realizar la restauración en el mismo servidor, u en otra ruta que deseemos. Podremos restaurar:

    -   **Archivos y carpetas**: podremos recorrer la estructura de ficheros y restaurar los ficheros o carpetas que nos interesen.

    -   **Volúmen**: podríamos recuperar un volumen completo como puede ser "C:".

    -   **Aplicaciones**: restaurar aplicaciones que estuviesen instaladas

    -   **Estado del sistema**: el estado del sistema completo tal como estaba en el momento de la copia de seguridad.

-   **Completa**: Este es el caso más catastrófico, y sería en caso de rotura del disco duro original de la instalación. En este caso, tendríamos que coger el disco duro del backup, meterlo en otro servidor, introducir la ISO de Windows Server y en lugar de darle a "Instalar Ahora" darle a "Reparar el equipo".

# Comandos PowerShell para Windows Server {#comandos-powershell-para-windows-server}

:::::::::::::: {.columns }
::: {.column width="83%"}
En Windows 7 y Windows Server 2008 R2 Microsoft añadió una auténtica interfaz de consola (en inglés command-line interface o **CLI**) que permite la ejecución de comandos para poder administrar tanto un equipo de usuario como un servidor. Esta interfaz es conocida como [PowerShell](https://en.wikipedia.org/wiki/PowerShell) y viene instalado en todos los equipos Windows desde entonces.
:::
::: {.column width="15%" }
![](img/temas_comunes/windows_server/powershell.png){width="100%"}
:::
::::::::::::::

Esta interfaz de consola está diseñada para su uso por parte de administradores de sistemas, con el propósito de automatizar tareas o realizar scripts con tareas repetitivas. Como curiosidad, PowerShell es Software Libre y se puede [descargar](https://github.com/PowerShell/PowerShell) y utilizar también en Mac OS y Linux.

En este apartado vamos a hacer uso de distintos comandos que nos van a ser útiles para tener información acerca del estado del Servidor, del Bosque, del Dominio, de usuarios de nuestro Active Directory y de las GPO que hayamos creado.

Para obtener ayuda y saber cómo se ejecuta, así como los parámetros que tienen los comandos, podremos hacer uso del comando **get-help**. Por ejemplo, para obtener la ayuda del comando Get-ADForest deberíamos hacer:

::: {.mycode}
[Obtener ayuda del comando Get-ADForest]{.title}

``` powershell
get-help Get-ADForest
```
:::

Tras ejecutar este comando es posible que nos pregunte si queremos actualizar los sistemas de ayuda (se descarga los manuales de los comandos).

## Sobre Active Directory {#sobre-active-directory}

A continuación vamos a ver comandos que tienen que ver con el Active Directory propiamente dicho:

A continuación vamos a ver comandos que tienen que ver con el Active Directory propiamente dicho.

Listar todos los comandos posibles a ejecutar que tienen que ver con Active Directory:


::: {.mycode}
[Listar todos los comandos sobre Active Directory]{.title}

``` powershell
get-command -Module ActiveDirectory
```
:::


Información del Bosque:


::: {.mycode}
[Información del bosque]{.title}

``` powershell
Get-ADForest
```
:::

Información del Dominio que tiene el controlador de dominio:

::: {.mycode}
[Información del bosque]{.title}

``` powershell
Get-ADDomain
```
:::


## Sobre usuarios {#sobre-usuarios}

Comandos que tienen que ver con los usuarios creados dentro del Active Directory.

Listar todos los usuarios del Active Directory:

::: {.mycode}
[Listar usuario del Active Directory]{.title}

``` powershell
Get-ADUser -filter *
```
:::


Listar todos los usuarios del Active Directory, pero sólo obtener los nombres:


::: {.mycode}
[Listar sólo los nombres de usuarios del Active Directory]{.title}

``` powershell
Get-ADUser -filter * | select name
```
:::


Listar todos los usuarios del dominio **example.com** del Active Directory:

::: {.mycode}
[Listar sólo los  usuarios de un dominio Active Directory]{.title}

``` powershell
Get-ADUser -filter * -SearchBase "dc=example,dc=com"
```
:::


Listar todos los usuarios de un OU concreto (tiene que existir esa unidad organizativa) dentro del dominio example.com (en este caso) Active Directory:

::: {.mycode}
[Listar sólo los  usuarios de una OU del Active Directory]{.title}

``` powershell
Get-ADUser -filter * -SearchBase "OU=usuarios,dc=example,dc=com"
```
:::


Crear el usuario "usuario1" (como no tiene contraseña, se creará deshabilitado):

::: {.mycode}
[Crear usuario]{.title}

``` powershell
New-ADUser usuario1
```
:::


Crear el usuario "usuario2" con la contraseña "MIk3ld1":


::: {.mycode}
[Crear usuario con la contraseña]{.title}

``` powershell
New-ADUser usuario2 -AccountPassword(ConvertTo-SecureString "P4s5w0rd"
-AsPlainText -Force) -Enabled $true
```
:::



Crear el usuario “usuario3” con la contraseña “MIk3ld1” y que al hacer login le pida cambiar la contraseña:

::: {.mycode}
[Crear usuario con la contraseña y opciones extra]{.title}

``` powershell
New-ADUser usuario2 -AccountPassword(ConvertTo-SecureString "P4s5w0rd"
-AsPlainText -Force) -Enabled $true -ChangePasswordAtLogon $true
```
:::


Listar todos los usuarios cuyo usuario contengan “usu”:

::: {.mycode}
[Listar usuarios]{.title}

``` powershell
Get-ADUser -filter {name -like "*usu*"}
```
:::


Listar información interna de un usuario:

::: {.mycode}
[Obtener información de un usuario]{.title}

``` powershell
Get-ADUser usuario1
```
:::



Listar los  usuarios deshabilitados:

::: {.mycode}
[Obtener usuarios deshabilitados]{.title}

``` powershell
Search-ADAccount -AccountDisabled | select name
```
:::



Deshabilitar al usuario “usuario3”:

::: {.mycode}
[Deshabilitar un usuario]{.title}

``` powershell
Disable-ADAccount -Identity usuario3
```
:::




Habilitar al usuario “usuario3”:

::: {.mycode}
[Habilitar un usuario]{.title}

``` powershell
Enable-ADAccount -Identity usuario3
```
:::



Listar usuarios bloqueados:

::: {.mycode}
[Listar usuarios bloqueados]{.title}

``` powershell
Search-ADAccount -LockedOut
```
:::



Forzar el cambio de contraseña al usuario “usuario1” en el siguiente login:

::: {.mycode}
[Forzar cambio de contraseña]{.title}

``` powershell
Set-ADUser -Identity usuario1 -ChangePasswordAtLogon $true
```
:::



## Sobre grupos {#sobre-grupos}

Comandos que tienen que ver con los grupos creados dentro del Active Directory.

Listar todos los grupos de un Active Directory:

::: {.mycode}
[Listar grupos]{.title}

``` powershell
Get-ADGroup -Filter *
```
:::


Listar información de un grupo:

::: {.mycode}
[Listar información de un grupo]{.title}

``` powershell
Get-ADGroup usuarios_oficina
```
:::


Listar usuarios de un grupo:

::: {.mycode}
[Listar usuarios de un grupo]{.title}

``` powershell
Get-ADGroupMember -Identity usuarios_oficina | select name
```
:::


Añadir usuarios de un grupo (existe la opción de importar usuarios de un fichero CSV):

::: {.mycode}
[Añadir usuarios a un grupo]{.title}

``` powershell
Add-ADGroupMember -Identity usuarios_oficina -Members user1, user2
```
:::



## Sobre ordenadores {#sobre-ordenadores}

Comandos que tienen que ver con los ordenadores asociados al Active Directory.

Listar los ordenadores que pertenecen a un Active Directory:

::: {.mycode}
[Listar ordenadores de un Active Directory]{.title}

``` powershell
Get-AdComputer -filter *
```
:::



Listar ordenadores con Sistema Operativo Windows 10 de un Active Directory:

::: {.mycode}
[Listar ordenadores con Windows 10 en un AD]{.title}

``` powershell
Get-AdComputer -filter  {OperatingSystem -Like '*Windows 10*'}
```
:::



Apagar ordenador, incluso aunque haya un usuario conectado:

::: {.mycode}
[Apagar un ordenador de manera remota]{.title}

``` powershell
Stop-Computer -ComputerName WIN10 -Force
```
:::



Reiniciar ordenador, incluso aunque haya un usuario conectado:

::: {.mycode}
[Reiniciar un ordenador de manera remota]{.title}

``` powershell
Restart-Computer -ComputerName WIN10 -Force
```
:::



## Sobre GPO {#sobre-gpo}

Listar todos los comandos posibles a ejecutar que tienen que ver con las GPO (group policy objects):

::: {.mycode}
[Posibles comandos sobre GPOs]{.title}

``` powershell
get-command -Module grouppolicy
```
:::



Listar todos los GPO (group policy objects):

::: {.mycode}
[Posibles comandos sobre GPOs]{.title}

``` powershell
get-gpo -All
```
:::



Crear un fichero HTML en c: con las configuraciones de todas las GPO:

::: {.mycode}
[Todas las configuraciones de GPOs en formato HTML]{.title}

``` powershell
get-GPOreport -Domain example.com -ALL ReportType Html -path c:\gpo.html
```
:::



::: {#forzar_gpo}
:::
Forzar la actualización inmediata de las GPOs en el equipo remoto "win10"

::: {.mycode}
[Forzar actualización de GPOs de manera remota]{.title}

``` powershell
Invoke-GPUpdate -Computer win10 -Force -RandomDelayInMinutes 0
```
:::



## Otros comandos {#otros-comandos}

Información del sistema:

::: {.mycode}
[Información del sistema]{.title}

``` powershell
systeminfo
```
:::



Listar todos los procesos que están corriendo:

::: {.mycode}
[Listar todos los procesos]{.title}

``` powershell
Get-Process
```
:::



Listar los servicios:

::: {.mycode}
[Listar todos los servicios]{.title}

``` powershell
Get-Service
```
:::



Comprobar conexión al puerto 3389 del equipo remoto win10:

::: {.mycode}
[Comprobar puerto remoto]{.title}

``` powershell
Test-NetConnection win10 -CommonTCPPort 3389
```
:::


