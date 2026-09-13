
# Introducción a Mise-en-place {#introducción-mise}

[Mise-en-place](https://mise.jdx.dev/) es una herramienta para gestionar el entorno de desarrollo de un proyecto. Permite instalar y seleccionar diferentes versiones de herramientas como [Node.js](https://nodejs.org/es), [Python](https://www.python.org/), [Ruby](https://www.ruby-lang.org/en/), [Go](https://go.dev/) o [Bun](https://bun.sh/), de manera que cada proyecto pueda utilizar las versiones que necesita sin depender de la configuración global del sistema.

Una de sus principales características es que la configuración puede almacenarse dentro del propio proyecto, normalmente en un fichero [mise.toml]{.configfile}. De esta forma, podemos indicar, por ejemplo, que un proyecto [Vue.js](https://vuejs.org/) debe utilizar una determinada versión de *Node.js*. Al trabajar con el proyecto, **Mise** se encarga de utilizar las versiones especificadas, evitando tener que cambiar manualmente la versión instalada en el sistema.

Además de gestionar versiones de herramientas, Mise puede encargarse de otras tareas relacionadas con el entorno de desarrollo, como:

- **Definir variables de entorno**: ideal para diferenciar entornos de desarrollo, test o producción, indicando contra qué base de datos coger los datos, o el número de hilos a ejecutar.
- **Crear comandos y/o tareas**: permite ejecutar comandos/tareas para dejar el entorno listo para el desarrollo, o para pasar a producción.
- **Integrarlo en nuestro CI** (*continuous integration*): permite ejecutar acciones durante las acciones automatizadas de CI como en [GitHub Actions](https://github.com/features/actions) o [GitLab CI/CD](https://docs.gitlab.com/ci/).
- **Integración con IDE**: permite integrar [mise]{.verbatim} y las herramientas con nuestro IDE favorito.
- **Gestión de ficheros de configuración *dotfiles***: aparte de la integración con herramientas, en [Septiembre del 2026](https://jdx.dev/posts/2026-09-07-dotfiles-that-save-themselves/) anunciaron la gestión de ficheros de configuración muy habitual en GNU/Linux y MacOS denominada ***dotfiles***, para así poder gestionar esta configuración si contamos con distintas máquinas durante el desarrollo, y que todas tengan la misma configuración.

Es por eso que no debemos entender a Mise únicamente como un sustituto de herramientas como nvm, sino como un **gestor del entorno de desarrollo**.

::: infobox
[mise]{.verbatim} es un gestor del entorno de desarrollo, que nos facilita las tareas del día a día.
:::


## ¿Por qué utilizar un gestor de herramientas? {#por-qué-usar-gestor-herramientas}

Un desarrollador de software es habitual que trabaje en distintos proyectos, y cada uno de ellos hará uso de distintas herramientas y en versiones distintas. Una aplicación antigua podría depender de una versión concreta de *Node.js* mientras que un proyecto nuevo, por ejemplo desarrollado con Vue.js, puede requerir una versión más reciente. Instalar y cambiar manualmente estas versiones puede provocar conflictos y dificultar la configuración del equipo de desarrollo.

Un gestor como **Mise** permite asociar las herramientas y versiones necesarias al propio proyecto. Esto **facilita que todos los desarrolladores trabajen con un entorno idéntico** y reduce los problemas causados por utilizar versiones diferentes de *Node.js*, *npm* u otras herramientas. La configuración puede almacenarse además junto al código fuente en el sistema de control de versiones, como [Git](https://git-scm.com/), facilitando la reproducción del entorno en otro equipo.

::: infobox
Un gestor de herramientas facilita que todos los desarrolladores trabajen con un entorno idéntico.
:::


## Instalación de Mise {#instalación-de-mise}

*Mise-en-place* está disponible para los principales sistemas operativos y puede instalarse mediante diferentes métodos, tal como se explica en la [documentación](https://mise.jdx.dev/installing-mise.html). Dependiendo del sistema operativo, tendremos diferentes opciones:

- **GNU/Linux**: algunas distribuciones permiten la instalación mediante el repositorio propio o añadiendo uno nuevo.
- **Windows**: permite instalarlo con [scoop](https://scoop.sh/), [winget](https://learn.microsoft.com/es-es/windows/package-manager/winget/) o [chocolatey](https://chocolatey.org/install).
- **MacOS**: se puede instalar con [brew](https://brew.sh/).

Para GNU/Linux y MacOS también se puede usar el instalador proporcionado por el proyecto:

::: {.mycode size=footnotesize}
[Instalar mise]{.title}

``` console
ruben@archy:~$ curl https://mise.run | sh

mise: installed successfully to /home/ruben/.local/bin/mise
mise: run the following to activate mise in your shell:
echo "eval \"\$(/home/ruben/.local/bin/mise activate bash)\"" >> ~/.bashrc

mise: run `mise doctor` to verify this is set up correctly
```
:::

El instalador realiza las siguientes tareas:

- Descarga el binario y lo guarda dentro del directorio [$HOME/.local/bin/]{.configdir}.
- Nos indica que tenemos que ejecutar un comando para activar Mise
  - El comando a ejecutar lo que hace guardar el comando para activar Mise, [mise activate bash]{.verbatim}, dentro del fichero de configuración de nuestra ***SHELL***.
    - Normalmente el fichero [.bashrc]{.configfile} o [.zshrc]{.configfile}.
  - En el ejemplo anterior se ha ejecutado en una terminal **bash**. 
  - Existen comandos para **zsh**, **fish** y **powershell** de Windows.

Para asegurar que funciona podemos recargar la configuración de la terminal, o cerrarla y abrir una nueva y ejecutar:

::: mycode
[Comprobar instalación]{.title}

``` console
ruben@archy:~$ mise doctor
```
:::


## Desinstalación {#desinstalación}

Si en algún momento queremos desinstalar Mise y todo lo que hayamos descargado con él, si lo hemos instalado con el instalador explicado en el apartado anterior, la manera más sencilla sería:

::: mycode
[Comprobar instalación]{.title}

``` console
ruben@archy:~$ mise implode
```
:::

Después **borrar la línea de activación de Mise** que hayamos añadido en nuestro fichero de configuración [.bashrc]{.configfile} o [.zshrc]{.configfile} ([no el fichero completo]{color=red}).


# Herramientas {#herramientas}

Mise permite instalar [cientos de herramientas](https://mise.jdx.dev/registry.html\#tools), no sólo de desarrollo, por lo que a través de este gestor podemos centralizar muchas herramientas que podamos necesitar en nuestro sistema.

Para explicar cómo instalar una herramienta, gestionarla y demás operaciones vamos a usar Node.js como ejemplo.

## Instalar Node.js {#herramientas-instalar-nodejs}

Una de las principales utilidades de [mise]{.verbatim} en un proyecto JavaScript es gestionar las versiones de Node.js. En lugar de instalarlo directamente mediante el gestor de paquetes del sistema, podemos dejar que [mise]{.verbatim} se encargue de instalar y seleccionar la versión que necesita cada proyecto.

Para consultar las versiones de Node.js que podemos instalar utilizaremos:

::: mycode
[Comprobar versiones de Node]{.title}

``` console
ruben@archy:~$ mise ls-remote node
```
:::


Este comando muestra las versiones disponibles para su instalación. Nos aparecerá, dependiendo del proyecto, versiones en formato X.Y.Z. Podemos elegir qué versión o sub-versión instalar y dependiendo de lo indicado, [mise]{.verbatim} elegirá la última dentro de la rama indicada.


::: mycode
[Instalar distintas versiones de Node]{.title}

``` console
ruben@archy:~$ mise install node@24.18
✓ installed 1 tool in 2.9s: node@24.18.1

ruben@archy:~$ mise install node@24
✓ installed 1 tool in 2.7s: node@24.21.0

ruben@archy:~$ mise install node@latest
✓ installed 1 tool in 3.1s: node@26.8.2

ruben@archy:~$ mise ls
Tool  Version  Source  Requested 
node  24.18.1 
node  24.21.0 
node  26.8.2
```
:::

En el ejemplo anterior se han instalado tres versiones de Node:

- **24.18**: se ha indicado la sub-version, por lo tanto ha cogido la versión más nueva de esa numeración, siendo la 24.18.1
- **24**: al no indicar ninguna sub-versión, ha cogido la última versión disponible, en este momento la 24.21.0
- **latest**: se descarga la última versión disponible, en este momento la 26.8.2

Tal como se puede ver, se pueden instalar distintas versiones de la misma herramienta, lo que es ideal para hacer pruebas a la hora de querer actualizar de versión y testear nuestro proyecto.

Las herramientas descargadas por defecto se instalan en el directorio del usuario, concretamente en GNU/Linux y MacOS en [~/.local/share/mise]{.configdir}. Por lo tanto, si un equipo lo usan distintos desarrolladores, cada usuario puede tener sus herramientas instaladas sin molestar al resto.

::: mycode
[Instalar distintas versiones de Node]{.title}

``` console
ruben@archy:~$ ls ~/.local/share/mise
downloads  installs  migrations  shims
```
:::

## Seleccionar versión de Node.js {#herramientas-seleccionar-versión}

Hasta ahora lo único que hemos hecho ha sido instalar la herramienta indicada, pero no se ha configurado para poder ser usada. Para ello debemos:

::: mycode
[Seleccionar versión]{.title}

``` console
ruben@archy:~$ mise use node@24
mise ~/.config/mise/config.toml tools: node@24.21.0

ruben@archy:~$ mise ls
Tool  Version  Source                      Requested 
node  24.18.1 
node  24.21.0  ~/.config/mise/config.toml  24
node  26.8.2  
```
:::


Con el comando anterior se ha indicado que se use la versión 24 (sin especificar sub-versión), así que coge la última y realiza la configuración en el fichero [~/.config/mise/config.toml]{.configfile} **porque hemos ejecutado el comando desde nuestra [$HOME]{.configdir}**. Ahora ya se puede usar Node.js **dentro de nuestra terminal**:

::: mycode
[Comprobar versión]{.title}

``` console
ruben@archy:~$ node -v
v24.21.0
```
:::

Si seleccionamos una herramienta en cualquier otro directorio nos creará un fichero local [mise.toml]{.configfile} y ahí se indicará la versión a utilizar. De esta manera, el fichero creado lo podemos añadir a nuestro repositorio de proyecto:

::: mycode
[Seleccionar versión en un proyecto]{.title}

``` console
ruben@archy:~/repositorios/proy1 $ mise use node@26
mise ~/repositorios/proy1/mise.toml tools: node@26.8.2

ruben@archy:~/repositorios/proy1 $ cat mise.toml 
[tools]
node = "26"
```
:::

Si queremos modificar la versión global debemos hacer lo siguiente:

::: mycode
[Usar versión global]{.title}

``` console
ruben@archy:~/repositorios/proy1 $ mise use --global node@24
```
:::


De esta manera tenemos dos versiones de Node.js disponibles:

- La versión **global**: será la v24, que será usada en cualquier parte de nuestro sistema.
- La versión **por directorio**: al entrar a un directorio que contenga un fichero [mise.toml]{.verbatim} será leído y cambiará a la versión indicada en el proyecto.

::: infobox
Podemos usar una versión para la configuración **global** y otras distintas **para cada proyecto**.
:::



## Borrar versión de Node.js {#herramientas-borrar-versión}

Si tenemos alguna versión de una herramienta que ya no vayamos a usar y queremos eliminarla podemos hacer lo siguiente:

::: mycode
[Eliminar versión]{.title}

``` console
ruben@archy:~/repositorios/proy1 $ mise uninstall node@24.18
✓ removed 1 tool in 199ms: node@24.18.1

ruben@archy:~/repositorios/proy1 $ mise ls
Tool  Version  Source                          Requested 
node  24.21.0 
node  26.8.2   ~/repositorios/proy1/mise.toml  26
```
:::

Así libramos espacio de nuestro sistema.


# Entornos de proyecto {#mise-entornos-de-proyecto}

Una de las características más interesantes de [mise]{.verbatim} es la posibilidad de guardar la configuración de las herramientas de un proyecto en un fichero llamado [mise.toml]{.configfile} tal como hemos visto anteriormente. Este fichero utiliza el formato TOML y permite indicar qué versiones de las herramientas deben utilizarse en ese proyecto.


## Fichero [mise.toml]{.configfile} {#mise-fichero-mise.toml}

En un proyecto podemos crear el fichero [mise.toml]{.configfile} en el que podemos especificar las herramientas y las versiones que necesitamos.


::: mycode
[Fichero mise.toml]{.title}

``` toml
[tools]
node = "24"
bun = "1.4"
```
:::

De esta forma, cualquier persona que obtenga el proyecto puede saber qué versión principal de Node.js se espera utilizar. [mise]{.verbatim} leerá automáticamente este fichero cuando trabajemos dentro del directorio del proyecto y cambiará a las versiones correspondientes de las herramientas.


## Instalar herramientas definidas {#mise-instalar-herramientas-definidas}

Si nos descargamos un proyecto que contiene un fichero [mise.toml]{.configfile} debemos asegurar que tenemos instaladas las versiones especificadas. Para ello podemos ejecutar el siguiente comando:

::: mycode
[Instalar herramientas necesarias]{.title}

``` console
ruben@archy:~/repositorios/proy1 $ mise install
✓ installed 1 tool · 1 already installed in 1.4s: bun@1.4.2
```
:::

En este caso se ha descargado una herramienta que no teníamos instalada ([bun]{.verbatim}) mientras que otra ya lo estaba. Podemos comprobar las herramientas utilizadas en el proyecto de la siguiente manera:


::: mycode
[Comprobar herramientas usadas]{.title}

``` console
ruben@archy:~/repositorios/proy1 $ mise current
node 26.8.2
bun 1.4.2
```
:::



# Resumen de comandos {#mise-resumen-comandos}

A continuación una lista de los comandos más utilizados con [mise]{.verbatim}:

| Comando                               | Función                                                  |
| ------------------------------------- | -------------------------------------------------------- |
| `mise ls`                             | Mostrar herramientas instaladas y gestionadas            |
| `mise ls --current`                   | Mostrar las herramientas seleccionadas para el proyecto  |
| `mise ls-remote node`                 | Consultar versiones disponibles de Node.js               |
| `mise outdated`                       | Comprobar si existen actualizaciones                     |
| `mise config ls`                      | Mostrar los ficheros de configuración utilizados         |
| `mise use node@24`                    | Seleccionar Node.js 24 para el proyecto                  |
| `mise use --global node@24`           | Establecer Node.js 24 como versión global                |
| `mise install`                        | Instalar las herramientas declaradas en la configuración |
| `mise install node@24`                | Instalar Node.js 24 sin declararlo en el proyecto        |
| `mise uninstall node@22`              | Eliminar una versión instalada                           |
| `mise unuse node`                     | Eliminar Node.js de la configuración                     |
| `mise upgrade node`                   | Actualizar Node.js dentro de la versión solicitada       |
| `mise exec node@22 -- node --version` | Ejecutar un comando con una versión concreta             |
| `mise tasks ls`                       | Mostrar las tareas disponibles                           |
| `mise run dev`                        | Ejecutar una tarea del proyecto                          |
| `mise doctor`                         | Comprobar el estado de la instalación                    |

Table: Resumen de comandos {tablename=yukitblr colspec=X[l]X[l]}

<!-- 
Cheatsheets:

https://toolsbase.dev/en/reference/mise-commands

 -->

