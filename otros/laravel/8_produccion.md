
# Directorios ignorados del proyecto {#directorios-ignorados-del-proyecto}

Al crear el proyecto, se nos ha creado un fichero [.gitignore]{.configfile} en el que aparecen distintos directorios que están ignorados a la hora de añadir el proyecto a un repositorio Git.

Estos ficheros y directorios no es necesario que estén subidos al repositorio, ya sea porque son ficheros que deben ser generados o porque contienen configuración y contraseñas.

A continuación un listado de algunos ficheros y directorios y la explicación de por qué están ignorados.

-   [node_modules]{.configdir} : Es el directorio donde se guardan los paquetes, y sus dependencias, que se han descargado a través del gestor de paquetes [NPM](https://www.npmjs.com/). Esta configuración aparece en el fichero de configuración [package.json]{.configfile} .

-   [public/build]{.configdir} : En este directorio se guardan los ficheros (javascript y css, entre otros) que se generan a través del comando [npm run build]{.commandbox} . Este comando debe ejecutarse antes de la puesta en producción

-   [vendor]{.configdir} : En este caso es el directorio de las librerías que son necesarias a través del gestor de paquetes [Composer](https://getcomposer.org/). Estas librerías, y sus dependencias, son las que el proyecto Laravel necesita y aparecen en el fichero [composer.json]{.configfile} .

-   [.env]{.configfile} : Es el fichero de configuración general de la aplicación y donde aparecen los servicios y sus contraseñas. Nunca debería subirse un fichero de configuración con contraseñas al repositorio. Para asegurar que no faltan configuraciones, se podría subir un fichero igual al [.env]{.configfile}, pero sin que aparezcan las contraseñas.

-   [.vscode]{.configdir} : No es recomendable subir ficheros de configuración de IDEs, ya que cada desarrollador puede querer configuraciones propias.

# Poner proyecto en producción {#poner-proyecto-en-producción}

La puesta en producción de un proyecto es un punto crítico, ya que cualquier fallo o problema puede ocasionar que nuestra aplicación no funcione de manera correcta. Es por eso, que siempre debería haber un "guión" para indicar los pasos a realizar y que no se nos olvide ninguno durante la puesta en producción.

Los pasos a seguir dependerán de la aplicación o servicio que vayamos a poner en producción. Para el caso de Laravel, y tal como hemos estado realizando el desarrollo, serán los siguientes:

-   Clonar el proyecto.

-   Crear contenedores temporales.

-   Realizar la instalación de las dependencias necesarias.

-   Ejecutar la construcción de los ficheros *assets* necesarios (javascripts y css).

-   Crear contenedores finales.

-   Ejecutar *migrations* y/o *seeds* necesarios.

-   Testear que todo funciona de manera correcta.

Para esta explicación se partirá de una instalación de Ubuntu LTS con Docker y Docker Compose instalado. Hay que tener en cuenta que la puesta en producción utilizando otro sistema de instalación puede variar en alguno de los pasos.

::: warnbox
Los pasos de la puesta en producción pueden variar dependiendo del sistema de instalación utilizado, pero serán parecidos a los explicados aquí.
:::

## Clonar el proyecto {#clonar-el-proyecto}

Este paso no tiene mayor dificultad, ya que se presupone que tenemos nuestro proyecto en un repositorio Git en algún tipo de plataforma centralizada (como puede ser Github o GitLab).

El clonado del repositorio lo realizaremos como cualquier otro proyecto, por lo que no se explicará cómo realizarlo. Hay que recordar que en este clonado faltarán ficheros y directorios tal como se ha explicado previamente.

## Crear contenedores temporales {#crear-contenedores-temporales}

Para poder crear y levantar los contenedores necesarios necesitamos del fichero de configuración donde están las contraseñas. Para este ejemplo, copiaremos el fichero [.env]{.configfile} del directorio de desarrollo.

::: warnbox
En producción suele haber un SGBD en otro servidor configurado para varios proyectos, por eso, entre otras cosas, el fichero de configuración será distinto.
:::

Ahora, levantaremos los contenedores a través del comando [docker compose up -d]{.commandbox}. Debido a que nos siguen faltando directorios de las dependencias, el servidor MySQL no se levantará, pero más adelante se solucionará.

Por lo tanto, deberemos ejecutar lo siguiente:

::: {.mycode size=small}
[Usamos el instalador de Laravel]{.title}
``` console
ruben@vega:~/proyecto_produccion$ docker compose up -d
WARN[0000] The "WWWUSER" variable is not set. Defaulting to a blank string.
WARN[0000] The "WWWGROUP" variable is not set. Defaulting to a blank string.
[+] Running 3/2
 ✓ Network proyecto_produccion_sail              Created    0.1s
 ✓ Container proyecto_produccion-mysql-1         Created    0.0s
 ✓ Container proyecto_produccion-laravel.test-1  Created    0.0s
Attaching to proyecto_produccion-laravel.test-1, proyecto_produccion-mysql-1
````
:::

Tal como se ha comentado, el contenedor de MySQL no se va a levantar debido a que en el fichero de configuración [docker-compose.yml]{.configfile} aparecen configuraciones de ficheros dentro del directorio [vendor]{.configdir} que todavía no existen.


## Instalación de las dependencias necesarias {#instalacion-de-las-dependencias-necesarias}

Las dependencias que se necesitan instalar son componentes del *framework* Laravel, y por tanto para ello necesitamos entrar al contenedor y ejecutar ciertos comandos, tal como se va a mostrar a continuación. Más adelante se explicarán los comandos realizados.

::: {.mycode size=footnotesize}
[Usamos el instalador de Laravel]{.title}
```console
ruben@vega:~/proyecto_produccion$ docker compose exec -it laravel.test /bin/bash

root@469e75d4a713:/var/www/html# composer install
Installing dependencies from lock file (including require-dev)
Verifying lock file contents can be installed on current platform.
Package operations: 111 installs, 0 updates, 0 removals
...
root@469e75d4a713:/var/www/html# npm install
added 37 packages, and audited 38 packages in 1s
...
Run `npm audit` for details.
root@469e75d4a713:/var/www/html# npm run build
> build
> vite build
...
✓ built in 3.85s
root@469e75d4a713:/var/www/html# chmod 777 -R storage/
```
:::

A continuación la explicación de los comandos ejecutados, ya que es importante entender qué se ha realizado:

-   [docker compose exec -it laravel.test /bin/bash]{.commandbox} : con este comando vamos a entrar dentro del contenedor de Laravel, donde debemos realizar la instalación de las dependencias.

-   [composer install]{.commandbox} : instalamos las depedencias necesarias a través del gestor de dependencias [Composer](https://getcomposer.org/).

-   [npm install]{.commandbox} : instalamos las depedencias necesarias a través del gestor de dependencias [NPM](https://www.npmjs.com/).

-   [npm run build]{.commandbox} : es necesario generar los assets de javascript y CSS para que la aplicación funcione.

-   [chmod 777 -R storage/]{.commandbox} : Modificamos los permisos de ciertos ficheros para que el servidor web pueda escribir datos.

## Crear contenedores finales {#crear-contenedores-finales}

Ahora que ya tenemos las dependencias instaladas, es momento de poder parar los contenedores temporales, eliminarlos y levantar los contenedores finales. Para ello, realizaremos los siguientes pasos, desde nuestra consola de Ubuntu:

::: {.mycode size=footnotesize}
[Usamos el instalador de Laravel]{.title}
```console
ruben@vega:~/proyecto_produccion$ docker compose down -v
✓ Container proyecto_produccion-laravel.test-1  Removed    0.9s
✓ Container proyecto_produccion-mysql-1         Removed    0.0s
✓ Volume proyecto_produccion-mysql              Removed    0.0s
✓ Network proyecto_produccion_sail              Removed

ruben@vega:~/proyecto_produccion$ ./vendor/bin/sail up -d
```
:::

Los comandos realizados son:

-   [docker compose down -v]{.commandbox} : tira abajo los contenedores temporales y borra los volúmenes que utilizan los contenedores. El parámetro [-v]{.inlineconsole} es necesario para borrar el volumen de MySQL ya que durante el arranque del contenedor anterior ha tenido errores y por tanto

-   [./vendor/bin/sail up -d]{.commandbox} : este comando ya lo conocemos, y es para levantar los contenedores necesarios de la aplicación.

A partir de este momento la aplicación estará funcionando y habrá que ejecutar las migraciones y/o los *seeds* necesarios para ajustar la base de datos a la realidad de nuestra aplicación.

