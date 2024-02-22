
# Usar Visual Studio Code con Laravel {#usar-visual-studio-code-con-laravel}

[Visual Studio Code](https://code.visualstudio.com/) es un entorno de desarrollo integrado (IDE) desarrollado por Microsoft y con licencia MIT, lo que lo hace Software Libre y que cualquiera pueda ver el código fuente, así como realizar modificaciones.

El problema es que Microsoft no ha liberado todo el código fuente, y los binarios que ofrece para descargar hacen uso de ese software, así como la inclusión de sistemas de telemetría. Es por eso que existe un proyecto llamado [VSCodium](https://vscodium.com/) que ofrece los binarios libres de ese código.

Entre las ventajas que ofrece este IDE podemos destacar:

-   Se puede programar para muchos lenguajes de programación, no está especializado en uno sólo.

-   Es extensible mediante *plugins*. Hoy en día existen infinidad de extensiones para todo tipo de desarrollos.

-   Es multiplataforma.

-   Altamente configurable.

-   Configurando la cuenta de GitHub, se puede sincronizar las configuraciones entre distintos dispositivos.

-   Existe una versión [online](https://vscode.dev/).

## Extensiones recomendadas {#extensiones-recomendadas}

Para desarrollar con Laravel, aunque se puede extender a cualquier proyecto que haga uso de un entorno Docker, es recomendable utilizar una serie de extensiones para facilitar el desarrollo con ellos. De todas maneras, Visual Studio Code nos va a recomendar extensiones a medida que lo usemos, ya que observará el tipo de desarrollo que estamos realizando.

Entre las extensiones que se recomiendan están:

-   [Remote Development](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack): Nos instala un grupo de extensiones para poder trabajar contra un servidor remoto.

-   [Laravel Extension Pack](https://marketplace.visualstudio.com/items?itemName=onecentlin.laravel-extension-pack): Es una "meta-extensión", ya que incluye a otras extensiones creadas especialmente para ayudar durante el desarrollo de Laravel.

-   [PHP Extension Pack](https://marketplace.visualstudio.com/items?itemName=xdebug.php-pack): Es un conjunto de extensiones que nos va a permitir trabajar de manera más cómoda durante el desarrollo de código PHP.

-   [Auto Close Tag](https://marketplace.visualstudio.com/items?itemName=formulahendry.auto-close-tag): Muy útil durante el desarrollo de HTML, ya que cuando creamos una etiqueta, automáticamente nos crea la etiqueta de cerrado.

Existe una infinidad de extensiones que nos pueden ayudar durante el desarrollo,

## Conexión al servidor {#conexión-al-servidor}

Si hacemos uso de una máquina virtual para el desarrollo, por no usar GNU/Linux en la máquina anfitriona donde hemos instalado el contenedor de Laravel, Visual Studio Code nos permite conectarnos por SSH a un servidor donde vayamos a realizar el desarrollo.

Para conectarnos usaremos la extensión recién instalada "Remote explorer", nos aseguramos que estamos en la opción "Remotes (Tunnels/SSH)" y crearemos una nueva conexión SSH al servidor a través del icono "+", en el que nos pedirá realizar la conexión SSH:

![](img/laravel/visual_studio_code_ssh.png){width="50%" framed=true}


::: warnbox
Es recomendable hacer uso del \hyperlink{ssh_clave_publica_privada}{sistema de certificados de clave pública/privada} de SSH para realizar la conexión
:::

![](img/laravel/visual_studio_code_ssh2.png){width="90%"}


Nos pedirá dónde queremos guardar la configuración, dejando la ruta por defecto, que es el fichero [.ssh/config]{.configfile} dentro de la "home" de nuestro usuario. Si hemos realizado la configuración de los certificados de clave pública/privada, no nos pedirá la contraseña.

## Conexión al contenedor {#conexión-al-contenedor}

Gracias a la extensión "remote development" instalada previamente, vamos a poder trabajar **dentro del contenedor de Laravel**. De esta manera Visual Studio Code va a tener acceso al intérprete de PHP para poder ayudarnos durante el desarrollo.

Hacer uso de esta funcionalidad es muy útil ya que al estar dentro del contenedor, estamos dentro del entorno de desarrollo de manera "inmersiva", pudiendo instalar componentes o ejecutar órdenes dentro del contenedor.

Para realizar la conexión, deberemos ver los contenedores en la extensión "Remote Explorer", en el apartado "**Dev Containers**":

![](img/laravel/visual_studio_code_container.png){width="50%"  framed=true}


Al acceder al contenedor, en este caso "example-app_laravel.test_1", Visual Studio nos debería abrir el directorio principal donde está situada la aplicación Laravel, [/var/www/html]{.configdir}.


