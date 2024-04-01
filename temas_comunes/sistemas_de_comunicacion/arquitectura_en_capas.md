
# Arquitectura en capas {#arquitectura-en-capas}

Un sistema de comunicación se pueden diferenciar en distintos niveles en los que cada uno realiza una función independiente, pero que a su vez interactúan con los niveles limítrofes.


![](img/temas_comunes/sistemas_de_comunicacion/comunicacion-esquema.png){width="40%"}


Este ejemplo es un modelo simplificado de comunicación, y dentro de una arquitectura de red de ordenadores pueden existir más capas en las que pueden existir distintas funciones extra que no aparecen en este esquema.

## Origen {#origen-arquitectura-en-capas}

Al comienzo de las redes de ordenadores cada empresa creaba su propio sistema de comunicación creando su propio hardware y software, lo que hacía imposible la interconexión entre equipamiento de distintas empresas.

Estos sistemas de comunicación constan de unas reglas que los nodos deben conocer para poder comunicarse entre sí, y a ese conjunto de reglas se les denomina **protocolo de comunicación**.

Para que eso hoy en día no suceda ya que las redes están definidas en varios estándares, como veremos más adelante.

::: infobox
Un **estándar** es un conjunto de normas que pueden abarcar distintos niveles (tanto software como hardware) que ha sido aceptado, o creado, por la gran mayoría de las empresas del sector para poder realizar la interconexión e intercomunicación entre sí.
:::

## Ventajas de la división en capas {#ventajas-division-capas}

La división en capas nos permite:

-   Dividir el proceso de comunicación en procesos más pequeños.

-   Aislar las funciones de cada capa. De esta manera, en caso de realizar modificaciones en la misma, no afecta al resto de capas.

-   Ocultar la implementación al resto de capas. Siguiendo con el punto anterior, una capa utilizará los servicios de su capa inferior sin saber cómo realiza sus funciones.

-   Cada capa puede constar de distintos estándares, facilitando la interconexión de distintas tecnologías

Una arquitectura de red en capas se implementa por medio de distintos protocolos, formando una familia de protocolos para facilitar la comunicación de distintos sistemas y equipos en la red.

::: infobox
Una arquitectura en capas nos permite que cada capa actúe de manera independiente y que incluya sus propios protocolos. Cada capa dispone de una serie de servicios que ofrece a su capa limítrofe superior.
:::

Desde el comienzo de las redes de ordenadores han existido distintas familias de protocolos, y se puede considerar que hubo una [guerra de protocolos durante las décadas de 1970 a 1990](https://en.wikipedia.org/wiki/Protocol_Wars). Empresas, organizaciones y países se posicionaban sobre cuál sería el mejor protocolo de comunicaciones y el que saldría ganador para el uso a nivel internacional.

Por destacar algunos protocolos que ya no se usan:

-   **[SNA](https://en.wikipedia.org/wiki/Systems_Network_Architecture)** creado en 1974 por IBM.

-   **[NetBEUI](https://en.wikipedia.org/wiki/NetBIOS_Frames)** de Microsoft. Que evolucionó a NetBIOS sobre TCP/IP que hoy día se usa en Windows Server.

-   **[IPX/SPX](https://en.wikipedia.org/wiki/IPX/SPX)** de Novell.

## Modelo de referencia OSI {#modelo-osi}

El modelo de interconexión de sistemas abiertos, conocido como "modelo **OSI**" (***O**pen **S**ystems **I**nterconnection* en inglés) es un **modelo de referencia (teórico)** que busca estandarizar las funciones de comunicación para un sistema informático siendo agnóstico a la tecnología utilizada para realizar la implementación y a los protocolos utilizados en cada capa.

El diseño comenzó en 1977 tratando de terminar con la [guerra de protocolos](https://en.wikipedia.org/wiki/Protocol_Wars) comentada previamente, y la Organización Internacional de Estandarización (*International Organization for Standardization*, o **ISO** en inglés) terminó por definir el estándar ISO-7498 en 1984.

### Capas en el modelo OSI {#capas-modelo-osi}

El modelo OSI está compuesto por siete capas numeradas del 1 al 7 siendo la 1 la más baja y haciendo referencia a la parte física de la red.

Dentro de cada una de las capas a las unidades de datos se les llama de manera distinta, por lo que es conveniente referirse de manera correcta a ellas. Más adelante también aprenderemos que existen distintos componentes *hardware* que actúan en algunas de las capas.

```{=html}
<table class="table table-striped table-hover table-bordered ">
<colgroup>
<col style="width: 20%">
<col style="width: 20%">
<col style="width: 60%">
</colgroup>
<thead>
<tr class="header">
<th>Capa</th>
<th>Nombre de la unidad de datos</th>
<th>Función</th>
</tr>
</thead>
<tbody class="table-group-divider">
<tr class="odd">
<td>7ª - Aplicación</td>
<td>Datos</td>
<td>APIs de alto nivel, como compartir recursos y acceso remoto a archivos.</td>
</tr>
<tr class="even">
<td>6ª - Presentación</td>
<td>Datos</td>
<td>Traducción de datos entre un servicio de red y una aplicación, que incluye la codificación de caracteres, la compresión de datos y el cifrado y descifrado de datos.</td>
</tr>
<tr class="odd">
<td>5ª - Sesión</td>
<td>Datos</td>
<td>Manejo de sesiones de comunicación, por ejemplo el continuo intercambio de información en forma de múltiples transmisiones hacia ambos lados entre dos nodos.</td>
</tr>
<tr class="even">
<td>4ª - Transporte</td>
<td>Segmento, Datagrama</td>
<td>Transmisión de segmentos de datos confiable entre puntos de red, incluyendo la segmentación, el acknowledgement y la multiplexación. Aquí actúan los protocolos <strong>TCP</strong> y <strong>UDP</strong>, junto con los <strong>puertos</strong>.</td>
</tr>
<tr class="odd">
<td>3ª - Red</td>
<td>Paquete</td>
<td>Estructura y manejo de una red multinodo. Incluye el direccionamiento, el ruteo y el control de tráfico. Aquí actúan los <strong>routers</strong>.</td>
</tr>
<tr class="even">
<td>2ª - Enlace de datos</td>
<td>Trama</td>
<td>Transmisión de datos confiable entre dos nodos conectados mediante una capa física. Aquí actúan los <strong>switches</strong>.</td>
</tr>
<tr class="odd">
<td>1ª - Física</td>
<td>Bit, Baudios</td>
<td>Transmisión y recepción de flujos de bits sin procesar por un medio físico.</td>
</tr>
</tbody>
</table>

```
<!-- FIXME: arreglar tablas 

| Capa | Nombre de la unidad de datos | Función |
|--------------|-----------|------------|
| 7ª - Aplicación | Datos |  APIs de alto nivel, como compartir recursos y acceso remoto a archivos. |
| 6ª - Presentación | Datos | Traducción de datos entre un servicio de red y una aplicación, que incluye la codificación de caracteres, la compresión de datos y el cifrado y descifrado de datos.|
| 5ª - Sesión | Datos | Manejo de sesiones de comunicación, por ejemplo el continuo intercambio de información en forma de múltiples transmisiones hacia ambos lados entre dos nodos. |
| 4ª - Transporte | Segmento, Datagrama  | Transmisión de segmentos de datos confiable entre puntos de red, incluyendo la segmentación, el acknowledgement y la multiplexación. Aquí actúan los protocolos **TCP** y **UDP**, junto con los **puertos**. |
| 3ª - Red | Paquete | Estructura y manejo de una red multinodo. Incluye el direccionamiento, el ruteo y el control de tráfico. Aquí actúan los **routers**.|
| 2ª - Enlace de datos | Trama | Transmisión de datos confiable entre dos nodos conectados mediante una capa física. Aquí actúan los **switches**.|
| 1ª - Física | Bit, Baudios | Transmisión y recepción de flujos de bits sin procesar por un medio físico.|


 -->

```{=latex}
\begin{yukitblr}{X X X[3,l]}
    Capa & Nombre de la unidad de datos & Función \\

    7ª - Aplicación & Datos
    & APIs de alto nivel, como compartir recursos y acceso remoto a archivos. \\

    6ª - Presentación & Datos
    & Traducción de datos entre un servicio de red y una aplicación, que incluye la codificación de caracteres, la compresión de datos y el cifrado y descifrado de datos.
    \\

    5ª - Sesión & Datos
    & Manejo de sesiones de comunicación, por ejemplo el continuo intercambio de información en forma de múltiples transmisiones hacia ambos lados entre dos nodos.
    \\

    4ª - Transporte & Segmento, Datagrama
    & Transmisión de segmentos de datos confiable entre puntos de red, incluyendo la segmentación, el acknowledgement y la multiplexación. Aquí actúan los protocolos \textbf{TCP} y \textbf{UDP}, junto con los \textbf{puertos}.
    \\

    3ª - Red & Paquete
    & Estructura y manejo de una red multinodo. Incluye el direccionamiento, el ruteo y el control de tráfico. Aquí actúan los \textbf{routers}.
    \\

    2ª - Enlace de datos & Trama
    & Transmisión de datos confiable entre dos nodos conectados mediante una capa física. Aquí actúan los \textbf{switches}.
    \\

    1ª - Física & Bit, Baudios
    & Transmisión y recepción de flujos de bits sin procesar por un medio físico.
    \\
\end{yukitblr}
```



## Pila de protocolos TCP/IP {#pila-protocolos-tcp-ip}

Durante el surgimiento de las redes de comunicaciones entre ordenadores cada fabricante creaba su propio estándar, lo que hacía que la comunicación entre ellos no fuese posible. En 1974 [Vint Cerf](https://en.wikipedia.org/wiki/Vint_Cerf) and [Bob Kahn](https://en.wikipedia.org/wiki/Bob_Kahn) describen un protocolo para compartir recursos usando envío de paquetes a través de una red de comunicación. Es el comienzo del protocolo **TCP**.

En 1984 fue el protocolo elegido por parte del Departamento de Defensa de Estados Unidos, y poco tiempo después se convirtió en el estándar de facto de la comunicación de red que posteriormente dio lugar a Internet.

Tal como se puede ver, la pila de protocolos TCP/IP es funcional, al contrario que ocurre con el modelo OSI que sólo es teórico.

La pila TCP/IP cuenta con cuatro capas:

<!-- FIXME: arreglar tablas
| Capa | Protocolos conocidos | Función |
|--------------|-----------|------------|
| 4ª - Aplicación | HTTP, FTP, POP, SMTP, ...  | Es la capa más cercana al usuario, utilizada por las aplicaciones a la hora de enviar datos. |
| 3ª - Transporte | TCP, UDP | Estructura y manejo de una red multinodo. Incluye el direccionamiento, el ruteo y el control de tráfico. |
| 2ª - Internet | IPv4, IPv6 | Transmisión de datos confiable entre dos nodos conectados mediante una capa física.|
| 1ª - Acceso al medio | Ethernet, IEEE 802, 802.11 (wifi) | Es una mezcla de las capas 1 y 2 del modelo OSI.|

-->

```{=html}
<table class="table table-striped table-hover table-bordered ">
<colgroup>
<col style="width: 20%">
<col style="width: 20%">
<col style="width: 60%">
</colgroup>
<thead>
<tr class="header">
<th>Capa</th>
<th>Protocolos conocidos</th>
<th>Función</th>
</tr>
</thead>
<tbody class="table-group-divider">
<tr class="odd">
<td>4ª - Aplicación</td>
<td>HTTP, FTP, POP, SMTP, …</td>
<td>Es la capa más cercana al usuario, utilizada por las aplicaciones a la hora de enviar datos.</td>
</tr>
<tr class="even">
<td>3ª - Transporte</td>
<td>TCP, UDP</td>
<td>Estructura y manejo de una red multinodo. Incluye el direccionamiento, el ruteo y el control de tráfico.</td>
</tr>
<tr class="odd">
<td>2ª - Internet</td>
<td>IPv4, IPv6</td>
<td>Transmisión de datos confiable entre dos nodos conectados mediante una capa física.</td>
</tr>
<tr class="even">
<td>1ª - Acceso al medio</td>
<td>Ethernet, IEEE 802, 802.11 (wifi)</td>
<td>Es una mezcla de las capas 1 y 2 del modelo OSI.</td>
</tr>
</tbody>
</table>
```


```{=latex}
\begin{yukitblr}{X X X[3,l]}
    Capa & Protocolos conocidos & Función \\

    4ª - Aplicación
    & HTTP, FTP, POP, SMTP, ...
    & Es la capa más cercana al usuario, utilizada por las aplicaciones a la hora de enviar datos
    \\

    3ª - Transporte
    & TCP, UDP
    & Estructura y manejo de una red multinodo. Incluye el direccionamiento, el ruteo y el control de tráfico.
    \\

    2ª - Internet
    & IPv4, IPv6
    & Transmisión de datos confiable entre dos nodos conectados mediante una capa física.
    \\

    1ª - Acceso al medio
    & Ethernet, IEEE 802, 802.11 (wifi)
    & Es una mezcla de las capas 1 y 2 del modelo OSI.
    \\
\end{yukitblr}
```
### Protocolo TCP {#protocolo-tcp}

El objetivo del protocolo TCP es crear conexiones dentro de una red de datos compuesta por redes de ordenadores para intercambiar datos. La ventaja es que el protocolo busca garantizar que los datos son entregados a su destino sin errores y en el mismo orden en el que se transmitieron.

Por otro lado, también proporciona un mecanismo para distinguir distintas aplicaciones dentro de una misma máquina, a través del concepto de **puerto**.

Hoy día TCP es el protocolo más utilizado dentro de las aplicaciones que hacen uso de comunicación en red. Por ejemplo, los protocolos HTTP, SMTP, SSH, FTP\... hacen uso de TCP como protocolo de transporte (**capa 4 del modelo OSI**).

#### Establecer comunicación {#establecer-comunicacion}

A la hora de establecer una comunicación usando el protocolo TCP lo habitual es que en el lado del **servidor (el receptor de la comunicación)** exista un servicio que esté "*escuchando*" en un puerto previamente levantado (por ejemplo, un servidor web que escucha en el **puerto 80 y 443**).

El cliente comenzará la comunicación enviando un paquete **SYN** a la IP del servidor y al puerto con el que se quiere comunicar, a lo que si todo ha ido bien, el servidor responderá con la respuesta **SYN/ACK**.

:::::::::::::: {.columns }
::: {.column width="65%"}
Finalmente, el cliente debería responderle al servidor con un ACK, completando así la **negociación en tres pasos** (SYN, SYN/ACK y ACK) y la fase de establecimiento de conexión.

De esta manera, comenzará la transferencia de datos, a lo que se le añade una serie de mecanismos que determinan la fiabilidad y robustez del protocolo. Entre ellos están incluidos:
:::
::: {.column width="35%" }
![](img/temas_comunes/sistemas_de_comunicacion/tcp-handshake.png){width="90%"}
:::
::::::::::::::



-   Uso del número de secuencia para ordenar los segmentos TCP recibidos y detectar paquetes duplicados.

-   *Checksums* para detectar errores.

-   Indicación por parte del receptor que ha recibido los paquetes para detectar pérdidas.

-   Temporizadores para detectar retrasos o necesidad de reenvío de información.

#### Cierre de la comunicación {#cierre-comunicacion}

:::::::::::::: {.columns }
::: {.column width="65%"}
La fase de finalización de la conexión utiliza una negociación en cuatro pasos (four-way handshake), terminando la conexión desde cada lado independientemente.

Cuando uno de los dos extremos de la conexión desea parar su "mitad" de conexión transmite un segmento con el flag FIN en 1, que el otro interlocutor asentirá con un ACK. Por tanto, una desconexión típica requiere un par de segmentos FIN y ACK desde cada lado de la conexión.
:::
::: {.column width="35%" }
![](img/temas_comunes/sistemas_de_comunicacion/tcp-fin.png){width="90%"}
:::
::::::::::::::

Una conexión puede estar "medio abierta" en el caso de que uno de los lados la finalice pero el otro no. El lado que ha dado por finalizada la conexión no puede enviar más datos pero la otra parte si podrá.

#### Puertos TCP {#puertos-tcp}

TCP usa el concepto de número de puerto para identificar a las aplicaciones emisoras y receptoras. Cada lado de la conexión TCP tiene asociado un número de puerto (de 16 bits sin signo, con lo que existen 65536 puertos posibles) asignado por la aplicación emisora o receptora.

Los **puertos bien conocidos** son asignados por la Internet Assigned Numbers Authority (IANA), van del 0 al 1023 y son usados normalmente por el sistema o por procesos con privilegios. Algunos ejemplos son: FTP (21), SSH (22), Telnet (23), SMTP (25) y HTTP (80).

Los **puertos registrados** son normalmente empleados por las aplicaciones de usuario de forma temporal cuando conectan con los servidores, pero también pueden representar servicios que hayan sido registrados por un tercero (rango de puertos registrados: 1024 al 49151).

Los **puertos dinámicos/privados** también pueden ser usados por las aplicaciones de usuario, pero este caso es menos común. Los puertos dinámicos/privados no tienen significado fuera de la conexión TCP en la que fueron usados (rango de puertos dinámicos/privados: 49152 al 65535).
