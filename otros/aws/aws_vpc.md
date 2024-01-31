
# Introducción {#introducción-vpc}

VPC, por sus siglas en inglés *Virtual Private Cloud*, es la infraestructura de red privada virtual que se va a crear en la nube de AWS para nosotros, donde se podrán crear los servicios y añadir los recursos que posteriormente vamos a ver.

Podemos tener distintas redes virtuales VPC, y en cada una de ellas alojar los servicios que nos interesen. De esta manera, podemos diferenciar proyectos o clientes, a través de distintos VPC, ya que cada uno de ellos está separado completamente del resto.

Aunque no vamos a realizar modificaciones al VPC creado por defecto en el laboratorio, es interesante conocer qué características existen y las posibilidades que podemos tener.

# Características {#características-vpc}

El VPC creado en nuestro laboratorio cuenta con un direccionamiento privado con la red **172.31.0.0/16** que está situado en la zona de disponibilidad "**us-east-1**" (Norte de Virginia de Estados Unidos, tal como se ha dicho previamente). Una de las limitaciones de AWS Academy es que no podremos crear un VPC en otra zona de disponibilidad.

::: infobox
**En una cuenta AWS normal se pueden crear VPC en distintas zonas geográficas.**
:::

Aunque no vamos a profundizar, conviene entender distintas características que nos podemos encontrar y que podemos contratar o modificar.

::: errorbox
**El apartado VPC puede ser uno de los más complejos de entender dentro de todo AWS. Es por eso que no vamos a profundizar en ello.**
:::

## Subredes, tablas enrutamiento y acceso a internet {#subredes-tablas-enrutamiento-y-acceso-a-internet}

Para entender y modificar este apartado hay que tener conocimientos profundos de redes, por lo que hay que tenerlo en cuenta si se decide realizar algún tipo de modificación en estos apartados.

-   **Subredes**: El VPC que tenemos por defecto consta de distintas subredes, cada una de ellas creada en una zona de disponibilidad diferente dentro de la región. Esto permite la alta disponibilidad de nuestros servicios.

-   **Enrutamiento**: Básicamente nos indica qué se debe hacer con las rutas dentro de la red. Como de la red local de casa, tenemos dos apartados:

    -   **La propia red**: Es decir, el direccionamiento del propio VPC, 172.31.0.0/16. Es como si fuese la red de casa.

    -   **0.0.0.0**: Es el resto de direcciones que no coinciden con la red local, y que lo que hará con ellas será redirigirlas al "*internet gateway*". Sucede lo mismo en nuestra casa, que las direcciones que no son la propia red se mandan al router.

-   **Internet *gateway***: Es el sistema que permite la conexión entre el VPC e internet.

::: errorbox
**No vamos a realizar ninguna modificación de la configuración que tenemos por defecto.**
:::

