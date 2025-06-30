
# Glosario {#glosario}

A continuación se expone un glosario de términos con sus correspondientes definiciones:

::: {#altadisponibilidad}
:::

Alta Disponibilidad:
:   Es un diseño de arquitectura de sistemas y la implementación que asegura que el servicio instalado y otorgado sea funcional sin que haya parada en el mismo. Esta arquitectura trata de que no haya ningún [*single point of failure* (punto único de fallo)](#spf) en la misma.


::: {#cluster}
:::
Clúster:
: Se denomina clúster a un conjunto de ordenadores unidos entre sí mediante conectividad de red que actúan como si de un único servidor se tratara. Dependiendo del tipo de clúster que se va a crear, debe de ser pensado desde el diseño del servicio, ya que es la aplicación o servicio quién se encarga de crear el clúster (como ocurre con MySQL Cluster).


::: {#dependencia_software}
:::
Dependendencia de software:
:   Cuando se crea cualquier tipo de software lo habitual es hacer uso de otro software (librerías de seguridad, acceso a disco, codecs de vídeo, librerías 3D...) que son necesarias para el correcto funcionamiento de nuestro programa. Este otro software (que puede ser propio o ajeno) se denomina **dependencia**, ya que sin él, nuestro programa no funcionará y es necesario que exista en el sistema para hacer funciona nuestro programa.

    En las [distribuciones GNU/Linux](#distribucion_gnu_linux) se hace uso de los denominados [paquetes de software](#paquete_de_software) en los cuales se indican las dependencias que necesitan para funcionar y que por tanto se instalarán a la par que el programa elegido, por lo que nos aseguramos que el software instalado funcionará en cuanto termine la instalación.

    En caso de descargar un software ajeno de los [repositorios](#repositorio_de_software) oficiales de la distribución, es posible que necesitemos completar esas dependencias por nuestra cuenta, pero hoy en día es habitual que los creadores de software lo tengan en cuenta y esas dependencias estén en los repositorios oficiales.


::: {#distribucion_gnu_linux}
:::
Distribución GNU/Linux:
:   Es una distribución de software basada en el núcleo Linux que incluye software [GNU](#gnu) para componer un Sistema Operativo que pueda ser utilizado por los usuarios. Cada distribución suele [empaquetar el software](#paquete_de_software) en un formato propio que aparte del propio software indica las [dependencias](#dependencia_de_software) de software que necesita para funcionar, por lo que hace que la instalación del software se realice de manera sencilla. El software de la distribución está almacenado en los [repositorios de software](#repositorio_de_software) oficiales de la distribución.

    Las distribuciones suelen estar orientadas para un uso generalizado, pero es cierto que algunas, por su historia o por su manera de entender el empaquetado de software, se necesitan más conocimientos, pero hoy en día no es lo habitual.

    Existen muchas distribuciones GNU/Linux, pero las que podríamos destacar son [Ubuntu](#ubuntu), Debian, Red Hat y CentOS, que son las de mayor uso hoy en día a nivel profesional.


::: {#escalado_horizontal}
:::
Escalado Horizontal:
:   Se llama escalado horizontal a la infraestructura que crece de manera horizontal añadiendo más servidores del mismo servicio. Estos servidores serán accesibles mediante un proxy o de manera directa, y todos contarán con el mismo servicio (web, base de datos, ...). No confundir con un clúster, ya que la relación de los servidores en el escalado horizontal no tienen por qué ir en clúster.


::: {#escalado_vertical}
:::
Escalado Vertical:
:   Es el incremento de hardware de un servidor. Supongamos que un servidor empieza a tener problemas de carga, pues con el escalado vertical se le añadiría más RAM, más procesador y/o discos duros más rápidos (en caso de ser una máquina virtual sería sencillo, en caso contrario habría que realizar la migración a un servidor nuevo).


::: {#gnu}
:::
GNU:
:   Del acrónimo **GNU's Not Unix** (GNU no es Unix) es un sistema operativo y un conjunto de programas libres cuyo origen surgió de la idea de crear un sistema operativo Unix basado en [Software Libre](#software_libre).

    El desarrollo de GNU nació en 1983 por Richard Stallman comenzando por el compilador GCC, al que se fueron uniendo todo tipo de software y creando la Free Software Foundation (o FSF, fundación por el software libre) la cual creó la [licencia libre](#licencias_libres) más conocida actualmente: la **GPL** (GNU General Public License).

    El proyecto GNU avanzó en el tiempo y creó el kernel Hurd, pero bien es cierto que nunca llegó a ser funcional del todo y actualmente el kernel más utilizado es Linux, pero no es el único, ya que el software GNU también es usado en conjunto con otros kernels como son los **\*BSD**, de ahí la importancia que cuando hacemos referencia al sistema operativo se haga uso de [GNU/Linux](#gnu_linux).


::: {#gnu_linux}
:::

:::::::::::::: {.columns }
::: {.column width="77%"}
GNU/Linux:
:   Aunque comúnmente solemos llamar a las [distribuciones](#distribucion_gnu_linux) como "Linux" esto no suele ser correcto ya que en la distribución aparte del kernel va un conjunto enorme de software del proyecto GNU. Por lo tanto, lo ideal siempre es hacer uso del nombre completo GNU/Linux.

    El proyecto [GNU](#gnu) y sus herramientas y software son usados con otros kernels como son los \*BSD en distribuciones como FreeBSD u OpenBSD. También existen versiones con kernel BSD para la distribución Debian, por lo que en ese caso sería "Debian GNU/BSD".
:::
::: {.column width="21%" }
![](img/anexos/glosario/Gnulinux.svg.png){width=100%}
:::
::::::::::::::


::: {#json}
:::
JSON:
:   Es un formato de texto sencillo para el intercambio de datos. Aunque originalmente fue creado como notación de objetos para Javascript, su amplia utilización ha hecho que sea utilizado como alternativa a XML.

::: {#licencias_libres}
:::
Licencias libres:
:   Una licencia de software es un contrato entre el creador (o el titular de los derechos de autor) del software y el usuario. Todo software que usamos suele exigir la lectura de esta licencia y es por ello muy importante conocer qué se puede y no se puede hacer con dicho software.

    Las licencias libres son aquellas que nos permiten hacer con el software lo que las cuatro libertades del [Software Libre](#software_libre) exige.

    Entre las licencias libres más utilizadas hoy en día están la GPL (General Public License del proyecto [GNU](#gnu)), la Apache License, algunas de las versiones de las licencias Creative Commons, ...

::: {#linux}
:::
Linux:
:   Creado originalmente por Linus Torvalds en 1991 y actualmente desarrollado por cientos de desarrolladores de todo el mundo, Linux es el núcleo (o kernel) gratuito y libre similar al núcleo de los sistemas operativos Unix.

    Comenzó como un proyecto personal de Linus (siendo estudiante universitario) para su ordenador 386 y actualmente está portado a [decenas de plataformas hardware](https://es.wikipedia.org/wiki/Portabilidad_del_n%C3%BAcleo_Linux_y_arquitecturas_soportadas). Es el proyecto más grande y ambicioso del [Software Libre](#software_libre), aunque originalmente no se permitía el uso comercial del mismo (hasta la versión 0.12).

    Al poco tiempo de comenzar su desarrollo el proyecto [GNU](#gnu) lo adoptó como su kernel naciendo lo que actualmente conocemos como [GNU/Linux](#gnu_linux) y con ello cientos de [distribuciones](#distribucion_gnu_linux).

    Es un núcleo de tipo monolítico que permite la carga de módulos en tiempo de ejecución

::: {#lts}
:::
LTS:
:   Del inglés ***L**ong **T**erm **S**upport* (en castellano "soporte a largo plazo"), es una característica en informática que hace referencia a versiones especiales de software que contarán con un soporte más largo del habitual, por lo que serán las versiones idóneas para usar en servidores.

    Estas versiones suelen contar con actualizaciones de seguridad, pero no con cambios notorios en la forma del software para fomentar la fiabilidad del mismo. Lo habitual es utilizar este tipo de versiones en servidores, que aunque puedan no tener las últimas modificaciones de las versiones más recientes del software, nos aseguramos la fiabilidad. Esto hace que tengamos que decidir si es necesario contar con las características de las últimas versiones (ya sea nuevos servicios, opciones nuevas, velocidad, ... ) o si preferimos contar con una versión que tendrá un ciclo de vida más longevo pero con actualizaciones de seguridad.

    Es habitual verlo en proyectos de [Software Libre](#software_libre), como ejemplos podemos tomar el kernel [Linux](#linux) (actualmente la versión 5.4.58 es la denominada LTS) y la distribución [Ubuntu](#ubuntu) (en este caso la versión 20.04).

::: {#paquete_de_software}
:::
Paquete de Software:
:   Un paquete de software no es más que una manera de poder distribuir el software creado. En [distribuciones GNU/Linux](#distribucion_gnu_linux) estos paquetes determinan las [dependencias](#dependencia_software) que necesitan para que su instalación sea lo más sencilla posible.

    Lo habitual es que estos paquetes estén gestionados mediante un sistema de gestión propio para conocer cuáles están instalados, sus dependencias, desinstalarlos de manera sencila\...

    No sólo se usa en distribuciones GNU/Linux, ya que varios lenguajes de programación hacen lo propio para distribuir software en forma de paquetes. Como ejemplos:

    - En distribuciones GNU/Linux tenemos APT, Yum, Zypper, Portage, \...

    - En lenguajes de programación tenemos Gem para Ruby, Eggs para Python, CPAN en Perl, \...

::: {#repositorio_de_software}
:::
Repositorio de Software:
:   Se podría denominar repositorio como el almacén donde se guardan los [paquetes de software](#paquete_de_software). Las [distribuciones GNU/Linux](#distribucion_gnu_linux) cuentan con sus repositorios oficiales, donde se almacena el software para cada versión que tiene la distribución.

    Aparte del software que podemos instalar, también cuentan con un índice para saber los paquetes y las versiones que se almacena en ellos. Este índice es necesario que lo actualicemos de manera periódica (en Ubuntu ejecutando: "apt update") ya que gracias a él sabremos si tenemos que realizar actualizaciones de los paquetes instalados.

    También podemos utilizar repositorios externos al de la distribución, repositorios oficiales de un software por ejemplo, que nos permiten instalar la última versión de ese software sobre nuestra distribución. Cuando un paquete con el mismo nombre existe en distintos repositorios, siempre se instalará del repositorio que tenga la versión más nueva.

    No es buena práctica, y **está completamente desaconsejado**, mezclar repositorios de distribuciones distintas aunque el gestor de paquetes sea el mismo (usar repositorios de Debian en Ubuntu o viceversa).


::: {#spf}
:::
Single Point of Failure:
:   O punto único de fallo, es un componente de un sistema que tras un fallo en su funcionamiento ocasiona un fallo global en el sistema completo, dejándolo inoperante. Un SPOF puede ser un componente de hardware, software o eléctrico.


::: {#software_libre}
:::
Software Libre:
:   El movimiento del Software Libre fue creado por Richard Stallman a la par que creaba el proyecto [GNU](#gnu). Para que un software sea considerado como Software Libre debe contener una [licencia libre](#licencias_libres) que debe otorgar las cuatro libertades siguientes:

    - Libertad de usar el software para cualquier propósito.
    - Libertad de estudiar el software y su funcionamiento interno (es por ello necesario poder acceder al código fuente).
    - Libertad de distribuir el software con quien queramos.
    - Libertad de poder modificar y mejorar el software según nos interese.

    Es muy importante tener en cuenta que Software Libre no significa gratis, ya que en inglés el término viene de Free Software donde "Free" puede significar libre y gratis. Es cierto que la gran mayoría del Software Libre puede ser gratis, pero no todo el software gratis es Software Libre.

::: {#ssh_server}
:::
SSH Server:
:   De **S**ecure **SH**ell, es el nombre de un protocolo y del programa (tanto servidor, como cliente) cuya función principal es la de acceder de manera remota a través de un canal seguro a un servidor.

    SSH permite no sólo la conexión a un servidor sino también la transferencia de ficheros y creación de túneles cifrados por los que pueden viajar otros protocolos. El puerto habitual de uso para este protocolo es el **22**.

::: {#systemd}
:::
Systemd:
:   es un conjunto de demonios de administración de sistema, bibliotecas y herramientas diseñados como una plataforma de administración y configuración central para interactuar con el núcleo del Sistema operativo [GNU/Linux](#gnu_linux).

::: {#ubuntu}
:::
<!--
  \itemimage{Ubuntu:}{r}{0.21}

  img/ubuntu.svg.png
  [Ubuntu: Wikipedia](https://es.wikipedia.org/wiki/Ubuntu)
-->

:::::::::::::: {.columns }
::: {.column width="77%"}
Ubuntu:
:   Es una [distribución de GNU/Linux](#distribucion_gnu_linux) originalmente basada en Debian y creada por la compañía Canonical en el 2004. En su momento fue una de las distribuciones que apostaron por un sistema de instalación sencillo y con la intención de detectar el máximo hardware posible para acercarse a la gran cantidad de usuarios posibles.

    Hoy en día es una de las distribuciones más utilizadas tanto a nivel de escritorio como a nivel de servidores ya que cuenta con dos versiones separadas a la hora de realizar la instalación (aunque realmente es la misma distribución).

    Una de sus ventajas es la creación de versiones [LTS](#lts) cada dos años, que son versiones que garantizan su soporte técnico durante más tiempo por lo que supone una ventaja a la hora de realizar la instalación en servidores. Con ellos nos aseguramos que el software va a ser actualizado ante fallos de seguridad durante más tiempo que las versiones que no son LTS.
:::
::: {.column width="21%" }
![](img/anexos/glosario/ubuntu.svg.png){width=100%}
:::
::::::::::::::
