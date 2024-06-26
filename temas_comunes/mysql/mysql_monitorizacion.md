
# Monitorización de SGBDs {#monitorización-de-sgbds}

En el caso que nos ocupa, el de los Sistemas Gestores de Bases de Datos, aparte de la [monitorización básica comentada en el anexo](#sistemas_de_monitorizacion), necesitaremos monitorizar el estado del SGBD propiamente dicho. Para ello, de nuevo, se crearía una plantilla específica para cada SGBD que podamos tener en nuestra infraestructura. No será lo mismo monitorizar un servidor basado en MySQL o un Oracle, aunque muchos checks a comprobar deban ser lo mismo, pero la manera en la que se realizará la comprobación en el servidor será distinta.

Entre las comprobaciones que podemos realizar en un SGBD nos podemos encontrar con:

-   Servicio SGBD arrancado

-   Cantidad de RAM utilizada por el SGBD

-   Número de conexiones a las bases de datos

-   Número de hilos en ejecución del SGBD

-   Número de queries en ejecución

-   Número de tablas en memoria

-   Número de tablas bloqueadas

-   ...



## Monitorizar MySQL {#monitorizar-mysql}

Todo lo expuesto [en el anexo](#sistemas_de_monitorizacion) es referente a los sistemas de monitorización en general, y es similar en todos ellos. Tal como se ha comentado previamente, cuando un servidor cuenta con un servicio éste debe ser monitorizado, y dependiendo del servicio a monitorizar se realizará una serie de comprobaciones u otras.

A la hora de monitorizar un sistema gestor de bases de datos deberíamos tener en cuenta al menos las siguientes comprobaciones, y en el caso de MySQL:

-   Número de conexiones actuales (usuarios/conexiones tiene el servicio)

-   Tiempo del servicio activo (uptime)

-   Número de hilos en ejecución

-   Tamaño de memoria utilizado

-   Tamaño de memoria caché utilizado

-   Número de tablas en memoria

-   Número de slow queries

-   Número de conexiones abortadas

-   Número de queries totales

En servidores en alta disponibilidad, deberíamos comprobar, en caso de un clúster:

-   Número de nodos en el clúster

-   Estado general del clúster

-   Latencia entre los nodos del clúster

-   Si el nodo está conectado al clúster

    -   Puede pasar que un nodo "se salga" del clúster (o lo saquemos) para realizar mantenimiento

Si el servidor está dentro de una infraestructura de **Primario → Réplica**:

-   Estado de la replicación

-   Retraso de la replicación

-   Tamaño del binlog

Las comprobaciones expuestas son un mero ejemplo, y existen muchas más que podemos realizar a nuestros sistemas. Para poder realizar este tipo de monitorización podemos hacer uso de scripts propios (ya que muchas de las comprobaciones son consultas a variables de estado de MySQL), scripts creados por otras personas o scripts de monitorización hechos de manera exclusiva para MySQL.



### Scripts propios {#scripts-propios}

Para realizar gran parte de los checks expuestos previamente se puede hacer uso de scripts propios, ya que pueden realizar consultas de las variables de estado para comprobar y determinar si el estado es correcto.

Un ejemplo de script creado *ad hoc* para nuestro sistema podría ser:

::: mycode
[Script propio para monitorizar]{.title}

``` bash
#!/bin/bash
mysql -e "SHOW STATUS LIKE 'Slow_queries';" -N | awk '{print $2}'
```
:::


### Percona monitoring tools {#percona-monitoring-tools}

La alternativa a hacer uso de scripts propios es usar programas o scripts realizados por terceros, que estén ampliamente probados y que tienen detrás un equipo que quizá sea más amplio que el nuestro, y por tanto esté mejor probado.

La empresa Percona tiene un par de soluciones sobre monitorización de SGBDs (no sólo para MySQL, también para [PostgreSQL](https://www.postgresql.org/) y [MongoDB](https://www.mongodb.com/)), que son:

-   [**Percona Monitoring and Management**](https://www.percona.com/software/database-tools/percona-monitoring-and-management): Un sistema completo de monitorización, interfaz web incluída, que podremos [instalar](https://www.percona.com/software/pmm/quickstart) en nuestros propios servidores. Podemos ver aquí una [demo](https://pmmdemo.percona.com/graph/).

    ![](img/sgbd/percona_tools.png){width="100%"}

-   [**Percona Monitoring Plugins**](https://www.percona.com/software/database-tools/percona-monitoring-plugins): En este caso son un conjunto de plugins (o scripts) que podremos utilizar en nuestro sistema de monitorización propio (Nagios, Centreon o Cacti). En la [documentación](https://www.percona.com/doc/percona-monitoring-plugins/LATEST/index.html) explican cómo hacer uso de ellos.

