
# Añadiendo servicios extra {#añadiendo-servicios-extra}

Tal como se ha podido ver, pfSense cuenta con una serie de servicios que vienen instalados y algunos pre-configurados para una configuración básica (NAT, DHCP Server, Reglas de filtrado, ... ). Una de las ventajas que tiene pfSense, gracias a ser Software Libre, es que la comunidad trabaja en ampliar las funcionalidades añadiendo nuevos servicios que pueden ser instalados mediante paquetes que están específicamente adaptados para poder ser configurados a través del interfaz web de pfSense.

Entre el software que podemos instalar desde el gestor de paquetes, que se encuentra en "**System → Package Manager**", está:

-   **acme**: Sistema automático para desplegar **certificados** [Let's Encrypt](https://letsencrypt.org/es/)

-   **cron**: Utilidad para ejecutar comandos en un horario específico

-   **frr**: Demonio de enrutado dinámico para BGP, OSPF.

-   **haproxy**: Balanceador de carga TCP/HTTP(S).

-   **nrpe**: servidor NRPE para poder monitorizar el estado de PfSense desde Nagios

-   **squid**: Proxy caché para filtrar contenido web.

-   **squidGuard**: filtrado de URLs, para limitar la conexión a páginas no autorizadas (denegar el acceso a páginas porno, anuncios, casinos online, ... ).
