
# Introducción a Laravel {#introducción-a-laravel}

[Laravel](https://laravel.com/) es un *framework* para crear aplicaciones y servicios web haciendo uso del lenguaje de programación [PHP](https://es.wikipedia.org/wiki/PHP), buscando la simplicidad y evitar el "*spaghetti code*". Hace uso de la arquitectura "modelo-vista-controlador" (MVS) y es un proyecto de código abierto.

## Características {#características}

Entre las características que tiene Laravel, se pueden destacar:

-   Sistema de enrutamiento, también RESTful.

-   Motor de plantillas web llamado [Blade](https://laravel.com/docs/10.x/blade). Nos permite:

    -   Crear plantillas que pueden incluir otras plantillas.

    -   Hacer uso de PHP dentro de las plantillas.

    -   Permite cachear las plantillas hasta que se modifiquen.

-   Creador de queries a la base de datos llamada [Fluent](https://laravel.com/docs/10.x/queries).

-   [Eloquent](https://laravel.com/docs/10.x/eloquent) como ORM (*object-relational mapper*).

-   Uso de "*migrations*" para crear la base de datos a modo de sistema de control de versiones.

-   Sistema de enrutado de la aplicación para relacionar rutas de acceso con controladores.

-   Posibilidad de usar "semillas" (en inglés "*seeds*") en la base de datos para importar datos, ya sea de test o datos iniciales necesarios.

-   Permite hacer uso de paquetes de [Composer](https://getcomposer.org/).

-   Soporte para usar servicios de caché.

-   Posibilidad de paginación automática.

Estas características las iremos utilizando para crear nuestro primer proyecto y para posteriormente aprender a crear una API que podrá ser accedida desde cualquier tipo de aplicación: un interfaz web, una aplicación móvil, desde línea de comandos\...
