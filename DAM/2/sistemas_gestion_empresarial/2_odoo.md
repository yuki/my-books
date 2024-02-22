
# Introducción {#odoo-introducción}

[Odoo](https://es.wikipedia.org/wiki/Odoo), antes conocido como *OpenERP* es un software de planificación de recursos empresariales con licencia dual. Existe una versión de código abierto y una versión con licencia comercial con características y servicios exclusivos.

Odoo también cuenta con un apartado de CRM (en inglés *customer relationship management*, o gestión de relaciones con el cliente), pudiendo también crear una web de comercio electrónico, facturación, \...

# Instalación {#instalación}

Tal como hemos visto en el tema anterior, la instalación de un sistema se puede realizar de distintas maneras, por lo que deberemos atender a las necesidades del proyecto para realizar una instalación adecuada.

En nuestro caso, se va a optar por realizar una instalación a través de servicios Docker, de esta manera podemos realizar pruebas con distintas versiones (tanto de Odoo como de la base de datos).

::: infobox
La alternativa sería realizar la instalación en una máquina virtual o haciendo uso de los distintos instaladores que existen en la [web oficial](https://www.odoo.com/es_ES/page/download)
:::

Para realizar la instalación seguiremos las indicaciones que aparecen en la web de [Docker Hub](https://hub.docker.com/_/odoo) haciendo pequeñas modificaciones.

## Servicios independientes {#servicios-independientes}

Es el sistema más básico, que requiere de levantar dos contenedores Docker:

-   Contenedor de base de datos **PostgreSQL**. Podremos elegir entre las distintas versiones del gestor de base de datos, pero haremos caso a las recomendaciones de la web. Habría que tener especial cuidado con el usuario y la contraseña que utilizamos.

    En este caso también se ha expuesto el puerto 5432 que es el puerto por defecto de PostgreSQL:

::: mycode
[Crear y arrancar el contenedor de la base de datos]{.title}
```console
ruben@vega:~$ docker run -d -e POSTGRES_USER=odoo \
-e POSTGRES_PASSWORD=odoo -e POSTGRES_DB=postgres \
-p 5432:5432 --name odoo_db postgres:15
```
:::

-   Contenedor con el propio **Odoo**. Este contenedor tendrá los servicios y librerías necesarias para poder hacer funcionar la aplicación web.

::: mycode
[Crear y arrancar el contenedor de la base de datos]{.title}
```console
ruben@vega:~$ docker run -p 8069:8069 --name odoo \
--link odoo_db:db -t odoo
```
:::

## Docker Compose {#docker-compose}

Docker Compose es una herramienta para correr servicios multi-contenedor y se crea a través de un fichero en formato YAML. Es una manera de crear,parar,reconstruir una arquitectura de servicios de manera rápida y sencilla.

Se debe crear un fichero [compose.yaml]{.configfile} y lo ideal es que esté dentro de un directorio con el nombre del "stack de servicios", ya que coge el directorio como parte del nombre a la hora de crear los contenedores.

::: mycode
[Contenido de fichero compose.yaml]{.title}
```yaml
version: '3.1'
services:
  web:
    image: odoo:16.0
    depends_on:
      - db
    ports:
      - "8070:8069"
  db:
    image: postgres:15
    environment:
      - POSTGRES_DB=postgres
      - POSTGRES_PASSWORD=odoo
      - POSTGRES_USER=odoo
    ports:
      - "5433:5432"
```
:::

Para arrancar los servicios se realiza, desde el mismo directorio donde se encuentra el fichero, con el siguiente comando

::: mycode
[Levantar docker compose]{.title}
```console
ruben@vega:~$ docker compose up
```
:::

::: errorbox 
En Julio del 2023 se migró a Compose v2, tal como se indica en la [web oficial](https://docs.docker.com/compose/). Dependiendo de la versión que tengamos instalada será `docker compose up` o `docker-compose up`
:::


## Herramientas extra {#herramientas-extra}
Para poder acceder a la base de datos podemos hacer uso de un cliente externo. De esta manera no tendremos que entrar al contenedor y tendremos un interfaz gráfico con el que poder administrarla.

Podemos utilizar:

- **DBeaver**: Es una aplicación de escritorio que permite conectarnos a distintos SGBDs. Existe versión [community](https://dbeaver.io/) y otra con [licencia](https://dbeaver.com/buy/) que permite también conectarse a bases de datos NO-SQL.

- **[pgAdmin](https://www.pgadmin.org/)**: Es una aplicación que permite administrar PostgreSQL a través del servidor web.

::: mycode
[Crear y arrancar el contenedor pgAdmin]{.title}
```console
ruben@vega:~$ docker run -p 8090:80 \
-e 'PGADMIN_DEFAULT_EMAIL=user@domain.com' \
-e 'PGADMIN_DEFAULT_PASSWORD=SuperSecret' \
--name pgadmin4 -d dpage/pgadmin4
```
:::

