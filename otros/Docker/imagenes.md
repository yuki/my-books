
# Crear imágenes Docker {#crear-imagenes-docker}

Tal como se ha dicho [previamente](#imágenes-docker), una imagen Docker es un archivo inmutable que contiene el servicio que queremos ejecutar, junto con sus dependencias necesarias. Aunque en [hub.docker.com](https://hub.docker.com/) existe infinidad de imágenes, en algún momento nos puede interesar crear una propia, que contenga un servicio propio.

Para crear una imagen tenemos que crear un fichero llamado **Dockerfile**, y las opciones que podemos utilizar en él están en la [documentación oficial](https://docs.docker.com/reference/dockerfile/).

Es recomendable también tener en cuenta la web donde se comenta [hacer uso de buenas prácticas](https://docs.docker.com/build/building/best-practices/) durante la creación de las imágenes.

##  Instrucciones en Dockerfile {#instrucciones-dockerfile}

El número de instrucciones que se pueden utilizar en el fichero Dockerfile es limitada, y están explicadas en la [documentación](https://docs.docker.com/reference/dockerfile/), entre las que podemos destacar:

- **ADD**: Se pueden añadir ficheros o directorios propios a la imagen, para que estén disponibles al levantar el servicio. Por ejemplo, ficheros de configuración o el código de nuestra aplicación. Se pueden utilizar URLs de internet o repositorios GIT como origen
- **CMD**: Este parámetro indica el comando que se va a ejecutar al arrancar el contenedor. Este comando puede contener parámetros. **Sólo puede haber un CMD al crear la imagen**, y de haber más, se usará sólo el último.
- **COPY**: Similar a ADD. [Existe una web comparativa](https://docs.docker.com/build/building/best-practices/#add-or-copy) donde se explican las diferencias.
- **ENTRYPOINT**: Es utilizado cuando el contenedor va a usarse como un ejecutable. Puede ser un *script* creado por nosotros. En la documentación existe un apartado en el que [se explica la interacción entre CMD y ENTRYPOINT](https://docs.docker.com/reference/dockerfile/#understand-how-cmd-and-entrypoint-interact).
- **ENV**: Sirve para setear variables de entorno.
- **EXPOSE**: Informa a Docker de los puertos (y el protocolo) que se van a querer utilizar al arrancar la imagen.
- **FROM**: Para que un fichero Dockerfile sea válido tiene que empezar con una directiva FROM, para indicar cuál es la imagen por defecto a utilizar. Lo habitual suele ser hacer uso de imágenes oficiales. Docker recomienda usar imágenes de [Alpine Linux](https://www.alpinelinux.org/) debido a su bajo consumo de RAM, entre otras cosas.
- **RUN**: Instrucción para ejecutar cualquier comando, que genera una nueva capa en la imagen.
- **VOLUME**: Sirve para exponer los directorios que deben ser volúmenes externos (por ejemplo: directorios de almacenamiento de bases de datos, directorios de configuración...)
- **WORKDIR**: Setea el directorio para los comandos RUN, CMD, ENTRYPOINT, COPY y ADD que se ejecuten posteriormente.

Existen otras instrucciones, pero estas serían las más básicas para crear una imagen propia.

# Ejemplo de Dockerfile {#ejemplo-dockerfile}

Como ejemplo, vamos a utilizar el siguiente fichero **Dockerfile** que tendremos en un directorio de nuestro equipo.

::: mycode
[Fichero Dockerfile de pruebas]{.title}

``` docker
FROM php:8.4-apache
COPY src/ /var/www/html/
```
:::

## Crear imagen {#crear-imagen}

hay que añadir cosas...

