

# Introducción {#git_introducción}

[Git](https://git-scm.com/) es un sistema de control de versiones distribuido creado en 2005 por [Linus Torvalds](https://es.wikipedia.org/wiki/Linus_Torvalds), el mismo creador del [kernel Linux](https://es.wikipedia.org/wiki/N%C3%BAcleo_Linux). En tres días el sistema de control de versiones ya estaba versionando su propio código, y en dos semanas ya tenía gestión de ramas.

El proyecto se inició debido a que el sistema que utilizaban para la gestión del kernel Linux (Bitkeeper, en ese momento software privativo) decidió dejar de dar licencias gratuitas a los desarrolladores de Software Libre.

Linus hizo un análisis de los sistemas de control que existían en ese momento, y al ver que ninguno se adaptaba a las necesidades de un sistema tan complejo como el proyecto Linux, decidió crear uno propio.

Para el 16 de junio de 2005, Git manejaba el código fuente completo del kernel Linux, siendo el sistema utilizado a partir de ese momento. No sólo los cambios a partir de ese momento, si no que habían portado todo el histórico de cambios de los últimos 14 años.

# Características {#características}

Git es un proyecto que ha crecido y ha añadido nuevas características, pero desde el inicio las más importantes fueron:

-   Sistema **distribuido**, por lo que cada desarrollador tiene una copia completa de todo el histórico y los cambios sin necesidad de necesitar acceso a internet.

-   Compatible con los sistemas y protocolos actuales, como HTTPS, FTP y SSH.

-   Debe permitir **desarrollos no lineales**, donde se permita crear ramas y unirlas de manera rápida y eficiente.

-   **Eficiente** con proyectos grandes y gran cantidad de ficheros y desarrolladores. Al final, el propósito inicial era usarlo para el kernel Linux donde había miles de ficheros y desarrolladores.

-   Los identificadores de los commits están basados en criptografía (SHA1). De esta manera no puedan existir dos commits con el mismo ID, y un ID representa única y exclusivamente un commit.

# Instalación {#instalación}

Git está presente en todos los sistemas operativos actuales. Dependiendo del sistema operativo que utilicemos, podremos instalarlo de distintas maneras. En la [web oficial](https://git-scm.com/download/) están las últimas versiones.

Podemos hacer uso de Git a través de sistemas de consola o de aplicaciones gráficas. Hoy en día los entornos de desarrollo más conocidos también lo tienen integrado, por lo que es posible hacer uso de Git desde ellos.

-   Windows:
    -   [Git Bash](https://gitforwindows.org/)
-   MacOS:
    -   MacOS tiene integrado Git dentro de las herramientas de desarrollador de Xcode. Para instalar únicamente Git desde un terminal debemos ejecutar: [xcode-select --install]{.commandbox}
    -   Para tener la última versión se recomienda usar [Brew.sh](https://brew.sh/) e instalarlo a través de él.
-   GNU/Linux:
    -   Hoy en día todas las distribuciones tienen en sus repositorios Git, por lo que lo recomendable es hacer uso del sistema de instalación propio (apt, yast, \...). También es probable que ya esté instalado.


# Primeros pasos {#primeros-pasos}

Una vez instalado, debemos realizar una pequeña configuración que después se utilizará cada vez que realicemos un commit: crear una identidad.

::: mycode
[Añadiendo nuestro nombre y e-mail]{.title}

``` console
ruben@vega:~$ git config --global user.name "Ruben Gomez"
ruben@vega:~$ git config --global user.email ruben@example.com
```
:::

Esta configuración se guarda dentro de un fichero de configuración en la carpeta raíz de nuestro usuario. El fichero es [.gitconfig]{.configfile}. En este fichero podremos añadir configuraciones que se aplicarán a los comandos que realicemos.

A nivel de configuración podemos llegar a tener configuraciones específicas globales, del sistema, del repositorio y del área de trabajo, pero no entraremos en ello.

# Estado de los ficheros {#estado-de-los-ficheros}

Dentro del repositorio, los ficheros que vayamos creando y/o modificando pueden estar en distintos estados. Esto es lo que se denomina "ciclo de vida" o *lifecycle* de un fichero. Los ficheros pueden estar en los siguientes estados:

-   **Sin seguimiento**: Es un fichero nuevo que no está en seguimiento por el sistema de control de versiones. Aunque se realicen cambios en él, no podremos volver a versiones previas. En caso de usar un repositorio remoto, este fichero no estará en él.

-   **Con seguimiento**: Estos ficheros pueden estar en los siguientes estados:

    -   **Sin modificar**: El fichero no ha sufrido modificaciones desde el último commit.

    -   **Modificado**: El fichero tiene modificaciones.

    -   **Preparado**: En inglés "staged". Es un área donde se encuentran los ficheros que van a ir en el siguiente commit.

En esta imagen se puede ver cómo los ficheros pueden cambiar de estado, y desde qué estado pasar a otro:

::: center
![Estado de los ficheros.[Fuente](https://git-scm.com/book/en/v2/Git-Basics-Recording-Changes-to-the-Repository).](img/git/lifecycle.png){width="90%"}
:::

Para entender esto mejor lo veremos a medida que vayamos haciendo uso de los comandos y creando/modificando ficheros.

# Comandos básicos {#comandos-básicos}

Vamos a crear un repositorio para empezar a entender qué es lo que sucede con los ficheros que vamos creando en él, y tratar de entender los comandos más básicos.

## Crear repositorio local {#crear-repositorio-local}

Vamos a crear un repositorio local dentro de un directorio nuevo, donde crearemos un proyecto que queremos versionar. Todo ello lo vamos a hacer dentro de un directorio nuevo llamado [pruebas]{.configdir}.

::: mycode
[Crear un repositorio git]{.title}

``` console
ruben@vega:~$ mkdir pruebas
ruben@vega:~$ cd pruebas
ruben@vega:~/pruebas$ git init
Inicializado repositorio Git vacío en /home/ruben/pruebas/.git/

ruben@vega:~/pruebas$ ls -a
.  ..  .git/
```
:::

Tal como se puede ver, ejecutando [git init]{.commandbox} dentro del directorio, nos inicializa el repositorio. Podemos ver que nos ha creado un directorio [.git]{.configdir}, que es un directorio oculto donde dentro se guarda la configuración y los commits que iremos realizando.

::: errorbox
**No hagas cambios (ni borres nada) dentro del directorio .git**
:::

## Crear primer commit {#crear-primer-commit}

Con nuestro editor de textos favoritos, vamos a crear un fichero [README.md]{.configfile}. Normalmente este fichero es creado para indicar (en formato [Markdown](https://es.wikipedia.org/wiki/Markdown)) información acerca del contenido del proyecto, qué es, para qué sirve, cómo compilarlo/usarlo\...

Una vez creado el fichero vamos a entender qué es lo que está sucediendo dentro del repositorio:

:::mycode
[Comprobar estado del repositorio]{.title}

``` console
ruben@vega:~/pruebas$ git status
En la rama main
No hay commits todavía

Archivos sin seguimiento:
(usa "git add <archivo>..." para incluirlo a lo que será confirmado)
README.md

no hay nada agregado al commit pero hay archivos sin seguimiento
presentes (usa "git add" para hacerles seguimiento)
```
:::


Vemos que el estado del único fichero que hemos creado es "sin seguimiento" (tal como hemos explicado en el punto anterior). Es momento de pasar nuestro fichero a estado "preparado", para ello:

::: mycode
[Preparamos el fichero para hacer commit]{.title}

``` console
ruben@vega:~/pruebas$ git add README.md
ruben@vega:~/pruebas$ git status
En la rama main
No hay commits todavía

Cambios a ser confirmados:
(usa "git rm --cached <archivo>..." para sacar del área de stage)
nuevos archivos: README.md
```
:::

El fichero [README.md]{.configfile} está en el "stage area", por lo que ahora es el momento en el que podemos hacer nuestro primer commit con las modificaciones realizadas:


::: mycode
[Hacemos el commit]{.title}

``` console
ruben@vega:~/pruebas$ git commit -m "Primer commit"
[main (commit-raíz) 45900ae] Primer commit
1 file changed, 3 insertions(+)
create mode 100644 README.md

guruben@vega:~/pruebas$ git status
En la rama main
nada para hacer commit, el árbol de trabajo está limpio
```
:::

Con [git commit -m "Primer commit"]{.commandbox} lo que estamos es "encapsulando" todas las modificaciones de todos los ficheros que están en el área "stage" (en este caso un único fichero), y vamos a generar un commit al que le hemos puesto el mensaje "Primer commit".


## Ver histórico de cambios {#ver-historico-de-cambios}
Si realizamos varios cambios al fichero, o si añadimos un fichero nuevo y realizamos una serie de commits, nos puede interesar saber cómo está yendo el histórico de commits.

Para ello podemos hacer uso del comando [git log]{.commandbox}, que nos mostrará en orden por fecha descendente, todos los commits que ha tenido nuestro repositorio:

::: mycode
[Ver histórico de commits]{.title}
``` console
ruben@vega:~/pruebas$ git log

commit ac00ce47dcdcda01bf33d162890bd98cc4f36ead (HEAD -> main)
Author: Rubén Gómez <ruben@example.com>
Date:   Sun Sep 17 10:52:26 2023 +0200

Añadir hola.java

commit a3f9554e0917dfdd2ce6ccccb5957d44d63c7f6f
Author: Rubén Gómez <ruben@examplel.com>
Date:   Sun Sep 17 10:52:03 2023 +0200

Añadir datos a README

commit 45900aef0300bf88c3a2939b8cf2f6b05de572dc
Author: Rubén Gómez <ruben@example.com>
Date:   Sun Sep 17 10:46:12 2023 +0200

Primer commit
```
:::

De manera gráfica, el histórico de los *commits* podríamos representarlo de la siguiente manera, empezando por la izquierda el commit más antiguo:

::: center
![Estado tras varios commits](img/git/log.png){width="70%"}
:::

## Ver diferencias {#ver-diferencias}

Si estamos realizando modificaciones y queremos saber qué modificaciones hemos realizado en los ficheros, podemos realizar lo siguiente:

::: mycode
[Ver cambios locales]{.title}
``` console
ruben@vega:~/pruebas$ git diff
```
:::

Y obtendríamos algo como esto, donde las líneas que empiezan con "**-**" han sido borradas y las que empiezan con "**+**" son añadidos.

::: center
![Cambios respecto al commit anterior](img/git/diff.png){width="90%"}
:::

Esta diferencia se aprecia de la siguiente manera en entornos de desarrollo como [Visual Studio Code](https://code.visualstudio.com/).

::: center
![Diff en Visual Studio Code](img/git/diff_code.png){width="100%"}
:::



