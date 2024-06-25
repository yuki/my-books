

### Crear túneles SSH {#crear-túneles-ssh}

Una de las funcionalidades extra de SSH es la posibilidad de crear "túneles" para securizar protocolos no seguros, o poder acceder a servicios que sólo escuchan en *localhost*.

Pongamos como ejemplo el siguiente escenario:


![](img/temas_comunes/administracion_remota/tunel1.png){width="50%"}


Tenemos un servidor web con Apache y MySQL al que queremos acceder. Por seguridad MySQL **sólo está escuchando en localhost (127.0.0.1)**, por lo que el acceso al servicio MySQL no es posible. Para administrarlo nos tenemos que conectar al servidor, y realizarlo de manera local.

En este punto es donde entra en juego la creación de un túnel seguro al servidor, para poder acceder al servicio remoto. **Para ello es imprescindible poder realizar una conexión SSH** (ya sea mediante usuario o clave pública/privada).

Para crear un túnel, desde el equipo de escritorio, lanzaremos el siguiente comando:

::: mycode
[Crear par de claves pública/privada]{.title}
```console
ruben@vega:~$  ssh usuario@192.168.1.200 -L 6306:127.0.0.1:3306 -N
```
:::

Al ejecutar este comando, habremos creado un túnel que enlaza el puerto remoto 3306 (que sólo se escucha en el “127.0.0.1” del servidor), con el puerto local 6306 del equipo de escritorio. A continuación la explicación del comando y sus parámetros:



- "**ssh usuario@192.168.1.200**": es como una conexión SSH normal. Lo que estamos indicando es que queremos conectarnos con  "usuario" al servidor remoto 192.168.1.200 a través de SSH.
- **-L 6306:127.0.0.1:3306**: Especifica que el puerto local especificado se va redirigir al puerto e IP remota. Para entender esto hay que separar dos partes de los parámetros:

    - **6306**: Especifica la IP y el puerto local. En este caso, antes del puerto no hemos especificado IP, por lo que se creará un puerto 6306 que sólo se pone a la escucha en ***localhost*** en el equipo de escritorio
    - **127.0.0.1:3306**: Esta es la dirección y puerto remoto al que nos queremos conectar. En este caso, es el puerto 3306 que está escuchando en la IP 127.0.0.1 del servidor.

- **-N**: Sirve para que no ejecute ningún comando en el servidor remoto, y por tanto no nos abrirá conexión de terminal.


A nivel visual, y para entender de mejor manera lo realizado, sirva la siguiente imagen y los pasos que se pueden dar en un escenario real:


![](img/temas_comunes/administracion_remota/tunel2.png){width="100%"}


Con una aplicación en el equipo de escritorio queremos conectarnos al servidor MySQL que sólo escucha en el servidor remoto. Ejecutamos el túnel visto anteriormente, y los pasos que podremos realizar son los siguientes:


0. Mediante una aplicación nos podemos conectar al puerto local 6306, que ha sido creado mediante el comando anterior. Este puerto local está redirigido al puerto del servidor remoto. Por lo tanto la conexión  se securiza a través del túnel
1. Como el túnel está establecido, la conexión viaja de manera segura a través de él.
2. Al llegar al servidor remoto, sabe que la conexión debe ir al puerto 3306 de la IP 127.0.0.1, que es lo establecido en el comando.
3. La conexión vuelve al túnel.
4. Viaja por el túnel hasta llegar a la comunicación que se había establecido previamente.



De esta manera, hemos podido realizar una conexión a un servicio remoto a través de SSH y completamente seguro.


\subsubsection{Acceder a un equipo saltando a través de otro.}
Este es un caso especial de túnel, similar a lo explicado previamente. En lugar de querer realizar una conexión a un servicio del equipo al que nos conectamos, en este caso lo usaremos de salto para acceder a otro servidor.

![](img/temas_comunes/administracion_remota/tunel3.png){width="100%"}


En este caso estando en casa nos queremos conectar a un equipo de la oficina. No tenemos VPN, y no hay redirección de puertos directa, pero podemos acceder al firewall perimetral. Por lo tanto, lo podemos utilizar para saltar al servidor que nos interesa.

En este caso, el comando a ejecutar sería:

::: {.mycode size="small"}
[Crear par de claves pública/privada]{.title}
```console
ruben@vega:~$  ssh usuario_firewall@84.85.86.87 -L 2222:172.17.1.200:22 -N
```
:::

De esta manera, ahora desde nuestro equipo podremos realizar una conexión SSH al puerto 2222 que realmente será una redirección que viaja a través del túnel hasta el firewall, y que a su vez redirige al puerto 22 del servidor 172.17.1.200.

::: warnbox
**El servicio remoto al que nos queremos conectar debe escuchar en la IP del equipo al que nos queremos conectar. El equipo que usamos para saltar debe poder conectarse a él.**
:::

`\clearpage`{=latex}

