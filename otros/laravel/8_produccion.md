
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

## Crear contenedor temporal {#crear-contenedor-temporal}

Para poder crear y levantar los contenedores necesarios necesitamos del fichero de configuración donde están las contraseñas. Para este ejemplo, copiaremos el fichero [.env.example]{.configfile} a [.env]{.configfile} y modificaremos los apartados oportunos (normalmente, el apartado de la base de datos).

::: warnbox
Es importante asegurar que el fichero .env esté configurado de manera correcta.
:::

Ahora, levantaremos un contenedor intermedio para instalar las dependencias necesarias a través de **composer**. Para ello, debemos ejecutar lo siguiente:

::: {.mycode size=small}
[Levantamos contenedor temporal]{.title}
``` console
ruben@vega:~/proyecto_produccion$ docker run --rm  -v "$(pwd)":/opt -w /opt \
  -it laravelsail/php83-composer:latest /bin/bash

root@b58c9150c04d:/opt# composer install

root@b58c9150c04d:/opt# php artisan key:generate
````
:::

Los últimos dos comandos ejecutados se realizan dentro del contenedor y sirven para instalar las dependencias y para generar la variable de entorno **APP_KEY** dentro del fichero [.env]{.configfile}.

Tras esto, todos los paquetes necesarios de Laravel deberían estar instalados. Al terminar la ejecución, saldremos de este conendor y automáticamente se borrará, ya que no es necesario volver a usarlo.


## Crear contenedor final {#crear-contenedor-final}

Por último, levantaremos el que será el contenedor de Laravel de igual manera que hemos hecho durante el desarrollo:


::: {.mycode size=footnotesize}
[Levantamos el contenedor de Laravel]{.title}
```console
ruben@vega:~/proyecto_produccion$ ./vendor/bin/sail up
```
:::

### Instalación de las dependencias finales {#instalacion-dependencias}

Y tenemos que entrar en el contenedor para realizar las últimas tareas para asegurar que el proyecto funciona:

::: {.mycode size=footnotesize}
[Tareas finales]{.title}
```console
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

-   [npm install]{.commandbox} : instalamos las depedencias necesarias a través del gestor de dependencias [NPM](https://www.npmjs.com/).

-   [npm run build]{.commandbox} : es necesario generar los assets de javascript y CSS para que la aplicación funcione.

-   [chmod 777 -R storage/]{.commandbox} : Modificamos los permisos de ciertos ficheros para que el servidor web pueda escribir datos.

Tras esto, el contenedor debería estar funcionando y ya sólo queda lanzar los *migration* y los *seeder* correspondientes.

