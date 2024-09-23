
# Alternativas a Docker {#alternativas-docker}

Aunque Docker actualmente sea la herramienta más extendida para la creación de sistemas de contenedores, en el 2015 se creó la ***[Open Container Initiative](https://es.wikipedia.org/wiki/Open_Container_Initiative)*** (OCI). Es un proyecto de la Fundación Linux para diseñar un estándar abierto para asegurar que las plataformas de contenedores no estén vinculadas a ninguna empresa o proyecto concreto.

Actualmente se han creado tres especificaciones para el desarrollo y uso de contenedores, cuya documentación se puede encontrar en [Github](https://github.com/opencontainers) y en la web de la [OCI](https://opencontainers.org/):

* **Formato de imagen**: Es la [especificación](https://github.com/opencontainers/image-spec/blob/v1.1.0/spec.md) de cómo debe ser el formato para construir, transportar y preparar la imagen con la que después se creará el contenedor. 
* **Entorno de ejecución**: Es la especificación de referencia para el comportamiento y la configuración de bajo nivel de los entornos de ejecución de contenedores. El programa de referencia es **[runc](https://github.com/opencontainers/runc)**, que normalmente es llamado desde aplicaciones de más alto nivel como [containerd](https://containerd.io/) o [cri-o](https://cri-o.io/).

* **Distribución**: Define el [protocolo](https://github.com/opencontainers/distribution-spec/blob/main/spec.md) API para facilitar y estandarizar la distribución de contenido. Sería la parte para crear un *registry* (del estilo [Docker Hub](https://hub.docker.com/)), o un repositorio de imágenes.


## Containerd y runc {#containerd-runc}

La alternativa más ***cruda*** es hacer uso de los sistemas que nos proporciona la OCI, como son:

* **Containerd**: El servicio de ejecución para los contenedores.
* **runc**: el comando de consola que nos permite crear y lanzar los contenedores.

Este sistema, aunque pueda ser el más "directo", ya que hace uso de los comandos directos del sistema, puede ser el más complejo. En algunos casos para realizar ciertas tareas habrá que ejecutar distintas acciones que con Docker, y otras alternativas, son más directas.


## Nerdctl {#nerdctl}

[Nerdctl](https://github.com/containerd/nerdctl) es un programa de línea de comandos para **containerd** compatible con Docker. Tal como dice **nerdctl** en su *[FAQ](https://github.com/containerd/nerdctl/blob/main/docs/faq.md)*, el objetivo es facilitar y experimentar con las características más punteras que tiene *containerd* que no tiene Docker.

Como a nivel de línea de comandos es compatible con Docker, cualquier tarea que sepamos hacer con Docker, lo podremos realizar con nerdctl:

::: mycode
[Comprobar estado de contenedores con nerdctl]{.title}

``` console
ruben@vega:~$ nerdctl ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
```
:::


## Podman {#podman}

[Podman](https://podman.io/) es un sistema para manejar contenedores, imágenes, *[pods](https://kubernetes.io/docs/concepts/workloads/pods/#what-is-a-pod)*, control de [Kubernetes](https://kubernetes.io/docs/home/) de manera local. Es desarrollado por [Red Hat](https://es.wikipedia.org/wiki/Red_Hat).

Podman cuenta con un interfaz gráfico similar a Docker Desktop, y al igual que este, en entornos Windows y MacOS, creará una máquina virtual con un sistema Linux donde correrá internamente Podman.

![Aplicación de escritorio de Podman](img/docker/podman.png){width="100%"}


