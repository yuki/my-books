
# Direccionamiento IPv4 {#direccionamiento-ipv4}

La **dirección IP** es el identificador (que debe ser único) de un dispositivo dentro de una red. Los dispositivos pertenecientes a la misma red podrán comunicarse entre sí mediante dicha dirección IP. Todas las características que conforman esta IP están explicados en el **protocolo IP** ([Internet Protocol](https://es.wikipedia.org/wiki/Protocolo_de_internet)).

Debido a que en el origen de la creación del protocolo IPv4 no se pensaba que llegase a haber tantos dispositivos conectados a internet, **el límite que se puso para el número de posibles direcciones está llegando a su fin**. Es por ello que ya existe un nuevo protocolo, **IPv6** desde hace tiempo, que sustituirá a IPv4 en un futuro, pero para ello debe de realizarse una transición que no termina de finalizar, aunque ya es posible hacer uso de ello.

El direccionamiento IP proporciona un mecanismo para la asignación de identificadores a cada dispositivo conectado a una red. Antes de dar información más técnica, exponemos los principales conceptos:

-   Una dirección IP es un conjunto de bits (que formarán 4 números decimales), que sirve para identificar de forma única a un dispositivo dentro de la red.

-   La asignación de dicha IP se puede realizar de dos maneras:

    -   **Estática**: El administrador del dispositivo deberá configurar la dirección de manera manual teniendo en cuenta los parámetros necesarios que se ajusten a la red a la que se quiere conectar.

    -   **Dinámica**: Una vez el dispositivo se conecte de manera física a la red (por cable, o en caso de ser de manera inalámbrica, realizando la conexión al SSID e introduciendo la contraseña) habrá un servicio (**DHCP**) que le otorgará una IP.

El protocolo IPv4 permite la existencia de dos tipos de direcciones:

-   **Direcciones públicas**: Son las utilizadas en Internet. Cualquier dispositivo que se conecte de manera directa a Internet debe tener un direccionamiento público. Existe la organización [ICANN](https://es.wikipedia.org/wiki/Corporaci%C3%B3n_de_Internet_para_la_Asignaci%C3%B3n_de_Nombres_y_N%C3%BAmeros) que se encarga de repartir estos direccionamientos entre los proveedores de internet.

-   **Direcciones privadas**: Son direcciones asignadas a dispositivos que se encuentran dentro de una red que no tiene visibilidad desde Internet. Los dispositivos que tienen este tipo de direccionamiento privado no pueden acceder a internet a través de su IP, por lo que debe de haber un dispositivo que le oculte su IP privada y se la "cambie" por una IP del rango público (el **router** realizando **NAT**, lo veremos más adelante).

## Formato de una dirección IPv4 {#formato-direccion-ipv4}

Como ya se ha comentado, una IP es un conjunto de bits, concretamente 32, que normalmente son representados en 4 grupos de 8 bits pasados a decimal, que es lo que normalmente estamos acostumbrados a ver:

-   Dirección IP en formato de 32 bits:

    ::: center
    ```11000000101010000000000101100100```
    :::

-   IP en formato de bits, separados en grupos de 8 bits:

    ::: center
    `11000000 10101000 00000001 01100100`
    :::

-   Dirección IP en formato decimal:

    ::: center
    `  192  .  168  .  1  .  100  `
    :::

Al tener 32 bits, se realizan 4 grupos de 8 bits, por lo que obtendremos **$2^{8}$** posibles combinaciones en cada grupo. Por lo que nos lleva a poder representar cualquier número desde 0 (`00000000`) hasta 255 (`11111111`) en cada bloque.

## Máscara de red {#mascara-de-red}

Una dirección IP no sólo contiene la dirección única de un dispositivo, sino que también contiene la red a la que pertenece dicho dispositivo. Esto nos lleva a ver que una IP pertenece a una jerarquía, ya que pertenece a una red "superior". A simple vista no podemos saber a qué red pertenece una IP, pero el formato es el siguiente:

::: center
![](img/temas_comunes/direccionamiento_ipv4/mascara_de_red.png){width="80%"}
:::

Dependiendo del número de bits que sea "n", el número "m" variará a la par hasta que ambos sumen los 32 bits que debe de tener una dirección IP. Aquí es donde entra en juego la **máscara de red**.

La máscara de red es un número binario de 32 bits que nos permitirá conocer qué número es "n" y "m" en una dirección IP, para así obtener el prefijo de la red y conocer cuántos dispositivos puede llegar a existir en la red.

Al igual que la IP, **una máscara de red son 32 bits** que contendrán a la izquierda "n" unos y a la derecha "m" ceros.

:::::: errorbox
**En la máscara de red a la izquierda irán los "1" y a la derecha los "0". ¡NUNCA SE MEZCLAN!**
::::::


Por ejemplo:

-   **IP decimal**:`\hspace{22pt}`{=latex} `192.168.1.100`

-   **IP binario**:`\hspace{25pt}`{=latex} `11000000101010000000000101100100`

-   **Máscara de red**: `11111111111111110000000000000000`

Si contamos el número de unos que tenemos en el lado izquierdo de la máscara de red veremos que tenemos 16, por lo que los primeros 16 bits de la IP serán los que nos digan a qué red pertenece esa IP. En este caso, y para favorecer el visionado, realizamos una separación de los bits:

-   **IP binario**:`\hspace{25pt}`{=latex} `11000000 10101000 00000001 01100100`

-   **Máscara de red**: `11111111 11111111 00000000 00000000`

Con esto obtenemos:

-   **Prefijo de la red**: `192.168`

-   **Identificador del dispositivo:** `1.100`

Si observamos, la máscara de red, al ser 32 bits, también se puede escribir en formato decimal, aplicando al igual que antes, la creación de 4 grupos de 8 bits. En el ejemplo anterior **la máscara sería: `255.255.0.0`** .

Existe un tercer método para escribir la máscara de red: "**/n**", donde "**n**" es un número indicando el número de **unos** (y por tanto, los bits que identifican el prefijo de la red) que tiene la máscara de red. En nuestro caso, la máscara también se puede escribir como **/16**, ya que es el número de unos que tiene nuestra máscara.

## Nombre de la red, broadcast y dispositivos {#nombre-red-broadcast-dispositivos}

De una máscara y una IP podemos obtener más información. Para conocer el **número de posibles IPs que puede llegar a haber en esa red** tendremos que realizar el cálculo de $2^{m}$, donde "m" es el número de ceros que tiene la máscara.

En nuestro ejemplo es $2^{16} = 65536$ posibles IPs. **De estas IPs existen dos IPs especiales**:

-   **Nombre de la red**: El nombre de la red sirve para identificar y diferenciar las distintas redes que pueden llegar a existir.

    Es muy importante nombrarlas de manera correcta ya que nos dará la información necesaria para conocer el prefijo de la red y el número posible de dispositivos que puede haber.

    Para crear el nombre de la red lo haremos usando el prefijo de la red y el resto de bits ponerlos a 0. En nuestro ejemplo:

    ::: center
    **`11000000 10101000 00000000 00000000 = 192.168.0.0`**
    :::

    **Al nombre de la red siempre se le debe añadir la máscara**, por lo que quedaría: **`192.168.0.0 /16`**

    ::: errorbox
    **Si no se pone la máscara de red, podría ser una IP suelta de cualquier red.**
    :::

-   **Broadcast**: Sirve para poder mandar un mensaje a todos los dispositivos de la red. Para formar esta dirección usamos el prefijo de la red y el resto de bits ponerlos a 1, por lo que en nuestro ejemplo quedaría:

    ::: center
    **`11000000 10101000 11111111 11111111 = 192.168.255.255`**
    :::

Teniendo esto en cuenta, al total de posibles IPs de una red tendremos que restarle 2 para darnos el número total de dispositivos que podremos tener en una red:

::: infobox
**Para saber el número de posibles IPs de una red:**

$2^{m} - 2$

**siendo "m" el número de `0` de la máscara**
:::

En nuestro ejemplo vemos que "m" es 16 (porque en la máscara tenemos 16 ceros), y sabemos que tenemos 2 IPs especiales (**el nombre de la red** y **el broadcast**) que tendremos que restar para tener el número total de dispositivos (tablets, ordenadores, móviles conectados) que podrá llegar a tener esa red: $2^{16} - 2 = 65534$ posibles dispositivos. El rango de estos dispositivos será desde la IP **`192.168.1.1`** hasta **`192.168.255.254`**.

## Bloques de IPs reservadas {#bloques-ips-reservadas}

Dentro de todas las posibles IPs y redes que podemos llegar a crear, existen unos bloque que están [reservados](https://en.wikipedia.org/wiki/Reserved_IP_addresses) por unas razones u otras:

-   **Redes públicas**: son todas las IPs que no entran en los siguientes bloques, y por tanto, son las utilizadas públicamente en Internet.

-   **Redes privadas**: Son redes que sólo pueden existir en el ámbito privado y no se podrá configurar de cara internet.

-   **Reservado**: Existen varios bloques que están reservados por diversas razones, de los cuales veremos los ejemplos más característicos.

Es importante conocer los bloques reservados para no cometer errores a la hora de crear redes. El listado completo se puede encontrar en la [Wikipedia](https://es.wikipedia.org/wiki/IPv4#Direcciones_de_uso_especial).

### Bloque reservado: 127.0.0.0 /8 {#bloque-reservado-127000-8}

La primera dirección de este bloque, 127.0.0.1, es el utilizado como bucle local (o **loobpack**). Este conjunto de IPs hacen referencia al propio equipo en el que nos encontramos y se suelen utilizar para hacer pruebas locales.

### Redes privadas {#redes-privadas}

Una red privada es una red de computadoras que usa el espacio de direcciones IP especificadas más adelante. A los equipos o terminales se les puede asignar direcciones de este espacio cuando deban comunicarse con otros terminales dentro de la red interna/privada.

Los nombre de las redes privadas son:

-   **`10.0.0.0 /8`**

-   **`172.16.0.0 /12`**

-   **`192.168.0.0 /16`**

Estas redes privadas no son siempre utilizadas con su máxima máscara posible, ya que en la mayoría de los casos se estarían desperdiciando IPs.

El utilizar en nuestra red privada un rango que no sea uno de estos tres signfica que estamos yendo en contra de las reglas establecidas por la ICANN.

### Reservado para despliegues Carrier Grade NAT {#reservado-cgnat}

En abril de 2012, el IANA asignó el rango **100.64.0.0/10** para uso en escenarios de [Carrier Grade NAT](https://es.wikipedia.org/wiki/Carrier_Grade_NAT) en el [RFC 6598](https://www.rfc-editor.org/rfc/rfc6598).

Este bloque de direcciones no debe ser usado en redes privadas o en la Internet pública: ha sido pensado para operaciones de uso interno en redes de teleoperadores. El tamaño del bloque de direcciones (aproximadamente 4 millones de direcciones, $2^{22}$) ha sido seleccionado para ser suficientemente grande para acomodar todos los dispositivos de acceso de un solo operador en un punto de presencia en una red de área metropolitana como la de Tokio (Fuente: [Wikipedia](https://es.wikipedia.org/wiki/Carrier_Grade_NAT)).

### Bloque reservado para el futuro {#bloques-reservados-futuro}

Existe el bloque completo **`240.0.0.0 /8`** cuyas IPs están reservadas para pruebas y para el futuro. Es conocido como la "clase E".

### Otros bloques {#otros-bloques}

Como ya se ha comentado, en la [Wikipedia](https://en.wikipedia.org/wiki/Reserved_IP_addresses) se pueden encontrar todos los bloques reservados que no son públicos y la razón por las que han sido reservados.

## Clases de IP {#clases-ip}

Durante el inicio de la expansión de internet y la creación de redes se crearon clases que nos indican el número de subredes que deberían existir, la máscara y más información que se puede encontrar en la [Wikipedia](https://en.wikipedia.org/wiki/Classful_network). **Hoy en día se considera obsoleta**.

::: errorbox
**Este sistema fue el utilizado desde 1981 hasta 1993. ¡Hoy en día está obsoleto!.**
:::

-   **Clase A**: se asigna el primer octeto para identificar la red, reservando los tres últimos octetos (24 bits) para que sean asignados a los hosts, de modo que la cantidad máxima de hosts es $2^{24} - 2$ . El bit más significativo (el de más a la izquierda) empieza por 0. Sería desde `0.0.0.0` hasta `127.255.255.255`.

-   **Clase B**: se asignan los dos primeros octetos para identificar la red, reservando los dos octetos finales (16 bits) para que sean asignados a los hosts. Los primeros bits más significativos son 10. Sería desde `128.0.0.0` hasta `191.255.255.255`.

-   **Clase C**: se asignan los tres primeros octetos para identificar la red, reservando el octeto final (8 bits) para que sea asignado a los hosts, de modo que la cantidad máxima de hosts por cada red es $2^{8} - 2$ . Los primeros bits más significativos son 110. Sería desde `192.0.0.0` hasta `223.255.255.255`.

-   **Clase D**: serían las IPs que empiezan por 1110. Desde `224.0.0.0` hasta `239.255.255.255`.
-   **Clase E**: serían las IPs que empiezan por 1111. Desde `240.0.0.0` hasta `255.255.255.255`.


## Configurar IPv4 {#configurar-ipv4}

Una vez sabemos cómo funciona IPv4, es el momento de aplicarlo en el sistema operativo en el que nos encontremos.

### IPv4 en Windows {#ipv4-windows}

Por defecto, la configuración de red en Windows solicita una dirección IP de manera automática cuando el cable está conectado en el interfaz de red.

Para conocer la configuración actual de la red podemos utilizar el comando [ipconfig]{.commandbox} desde el terminal de windows. Si le pasamos el parámetro "/all" ( [ipconfig /all]{.commandbox} ), el resultado del comando nos dará más información, como es la configuración del DNS, la dirección física (MAC), \...

::: center
![](img/temas_comunes/direccionamiento_ipv4/ipconfig.png){width="80%"}
:::

Si queremos realizar la modificación de la red, podremos hacer uso del icono de red que está al lado de la hora. Para ver toda la configuración, podemos ir al "Panel de Control → Redes e Internet → **Configuración de Red e Internet**". Elegimos "Protocolo de Internet versión 4", le damos a "Propiedades" y podremos realizar la configuración siguiente:

::: center
![](img/temas_comunes/direccionamiento_ipv4/cambiar_ip_windows.png){width="70%"}
:::

En la imagen se puede ver la configuración realizada:

-   **Dirección IP**: La dirección IP que queremos que tenga el equipo.

-   **Máscara de subred**: La máscara de red a la que pertenece la IP que hemos configurado.

-   **Puerta de enlace predeterminada**: Para que el equipo tenga conexión con otras redes, debemos indicar qué IP tiene el ***gatway***.

Aparte, podemos realizar la configuración del servidor DNS primario y secundario.
