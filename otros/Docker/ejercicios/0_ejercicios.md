
# Creación de contenedores básicos

Crea los siguientes contenedores con las parámetros especificados:

- Crear contenedor "nginx" que use el puerto 8098 del sistema operativo
  - Acceder en el navegador al puerto 8098

- Crear contenedor "httpd" que use el puerto 9876 del istema operativo
  - acceder en el navegador al puerto 9876

- Listar las imágenes que tenemos descargadas

- Mirar los contenedores en Docker Desktop

- Crear contenedor y nombre "mi-contenedor" con imagen nginx, puerto 98

- Parar contenedor nginx del puerto 8098
  - Borrar contenedor

- Parar contenedor httpd del puerto 9876
  - Borrar contenedor


# Contenedores de bases de datos

No creéis volúmenes. Una vez creado cada contenedor, conectaros a él con MySQL Workbench.

- Crear contenedor con MySQL escuchando en el puerto 3306, pero la versión de MYSQL sea 8.0.35. El nombre del contenedor se llame "db8.0.35"

- Crear contenedor con MySQL que en el sistema operativo escuche en el puerto 3344, con la versión MySQL 8.0.0. El nombre del contenedor se llama "db8"


# Volúmenes persistentes

Crea los siguientes contenedores con volúmenes persistentes de datos:

- Crea un contenedor MySQL 8.0.30 en Docker con un volumen persistente en tu equipo.

- Crea 2 contenedores con la imagen **[webdevops/php-apache](https://hub.docker.com/r/webdevops/php-apache)** con versión 8.3 y 7.2. Ten en cuenta:
  - Crear un directorio con el fichero "index.php" que exponga la información de la función de PHP "phpinfo()"
  - Hacer que ese directorio sea el "/app" de dentro del contenedor en modo "solo lectura" uno y otro en modo "lectura-escritura".
- Repite el ejercicio con la imagen **[webdevops/php-nginx](https://hub.docker.com/r/webdevops/php-nginx)**


# Entrar a contenedores

Nunca se debería hacer modificaciones a un contenedor, porque su ciclo de vida puede ser corto, pero es interesante entrar para investigar o ver cómo se ha creado (software instalado como ejecutables, librerías... rutas creadas...).

- Entrar en contenedores Apache y MySQL:
 - ¿Cuál es la ruta a la que entramos por defecto en cada uno?


# Portainer: contenedor para ver/administrar Docker

Investiga qué es Portainer, ver cómo se instala y sus necesidades. Busca tanto su web oficial como su repositorio de código fuente.

Usar Portainer para hacer las siguientes acciones con los contenedores levantados:

- Entrar a ellos a través de la consola
- Mirar estadísticas (CPU, uso de red....)
- Mirar Logs (registros), del contenedor (de esta manera podemos ver qué sucede dentro)


# MySQL y PHPMyAdmin

- Crea un contenedor con MySQL (tiene que escuchar en el puerto 3306)
- Crea un contenedor con PHPMyAdmin que escuche en el puerto 7654 (dentro del contenedor es el 80)
- Conecta desde PHPMyAdmin a MySQL (en "servidor" pon la IP del servidor).

