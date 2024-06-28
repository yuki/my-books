

# Virtualización {#virtualización}

La virtualización es la utilización de un software para imitar las características de un hardware específico y utilizarlo para recrear un sistema real. Normalmente utilizamos la virtualización para crear "**máquinas virtuales**" simulando un equipo informático donde realizaremos la instalación de un sistema operativo.

El sistema de virtualización permite exprimir un único servidor hardware, ya que al crear distintas máquinas virtuales en él, nos va a permitir poder tener distintos sistemas, aplicaciones y servicios.

El software que ejecutamos en cada máquina virtual va a estar separada del hardware real, ya que se comunicará y usará el hardware virtual que se le ha asignado.

## Conceptos en virtualización {#conceptos-en-virtualización}

A la hora de hacer uso de un sistema de virtualización existen dos conceptos básicos que debemos entender y no debemos de mezclar.

-   **Anfitrión**: Es el equipo donde se ejecuta el sistema de virtualización, que nos permitirá crear distintas máquinas virtualizadas.

-   **Invitado/huésped**: En inglés el *guest machine*, es la máquina virtual.

-   **Hypervisor**: También conocido como "virtualizador", es el software que crea y ejecuta las máquinas virtuales. Existen dos tipos de hypervisores:

    -   **Type-1** o **virtualización nativa**: El hypervisor corre directamente sobre el hardware físico del anfitrión y las máquinas virtuales se ejecutarán sobre el hypervisor. Este tipo de hypervisores son capaces de permitir que una máquina virtual interactúe directamente sobre el hardware real. Ejemplos: [KVM](https://en.wikipedia.org/wiki/Kernel-based_Virtual_Machine), [Proxmox](https://en.wikipedia.org/wiki/Proxmox_Virtual_Environment), [VMware ESXi](https://en.wikipedia.org/wiki/VMware_ESXi)

    -   **Type-2**: Sobre el hardware físico se ejecuta un sistema operativo anfitrión, y sobre él se ejecuta una aplicación virtualizadora, como cualquier otro proceso. Las máquinas virtuales en este tipo no conocen nada del hardware real.

-   **Extensiones de virtualización**: Son extensiones de virtualización que tienen los procesadores y permiten la ejecución de un huésped sin penalización en la virtualización. La extensión de Intel se llama **Intel VT-x**, y en AMD se llama **AMD-V**. Existen otras extensiones especializadas que se llaman Intel VT-d y AMD-Vi.

    ::: center
    ![Ejemplo de procesador [Intel i5-14400](https://ark.intel.com/content/www/xl/es/ark/products/236788/intel-core-i5-processor-14400-20m-cache-up-to-4-70-ghz.html)](img/temas_comunes/virtualizacion/extension_intel.png){width="60%" framed=true}
    :::

## Tipos de virtualización {#tipos-de-virtualización}

Cuando hablamos de virtualización podemos diferenciar distintos tipos, dependiendo de a qué nos refiramos, ya que existen virtualizaciones de todo tipo (plataformas hardware, recursos hardware, virtualización de almacenamiento, de red, \...).

Nos vamos a centrar en lo referente a virtualización de plataforma hardware, cuyo fin es el de crear máquinas virtuales. En este sentido podemos diferenciar dos tipos:

-   Virtualización completa

-   Paravirtualización

El tipo más habitual es el de la virtualización completa, para el que hacemos uso de las **extensiones de virtualización** y que conseguiremos que el rendimiento de la máquina sea mejor, ya que no va a haber prácticamente penalización.

Hoy día sólo podemos hacer uso de la paravirtualización con GNU/Linux.

