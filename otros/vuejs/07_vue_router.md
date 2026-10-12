
# Introducción a las aplicaciones SPA {#introducción-aplicaciones-spa}

En las aplicaciones web tradicionales, cada página suele estar asociada a una URL diferente. Cuando el usuario pulsa un enlace, el navegador solicita una nueva página al servidor y carga el documento correspondiente.

Sin embargo, muchas aplicaciones web modernas utilizan una arquitectura denominada **SPA (*Single Page Application*)**. En este tipo de aplicaciones, gran parte de la navegación se realiza sin recargar completamente el documento HTML. Es decir, carga inicialmente un documento HTML y modifica posteriormente su contenido mediante JavaScript, sin necesidad de solicitar un documento HTML completo cada vez que el usuario cambia de vista.

**[Vue Router](https://router.vuejs.org/)** es la solución oficial de enrutamiento para Vue. **Permite asociar diferentes URL con componentes**, gestionar la navegación y construir aplicaciones con múltiples vistas utilizando Vue 3.


Imaginemos una aplicación de gestión de productos con las siguientes direcciones:

- [/]{.verbatim} página principal.
- [/productos]{.verbatim}: listado de productos.
- [/productos/15]{.verbatim}: detalles del producto con identificador 15.
- [/configuracion]{.verbatim} configuración de la aplicación.

En una aplicación tradicional, cada URL podría corresponder a un documento HTML diferente generado por el servidor. En cambio, en una SPA desarrollada con Vue, estas direcciones pueden mostrar diferentes componentes dentro de una misma aplicación. 

Siguiendo con el ejemplo anterior, al acceder a [/productos]{.verbatim}, Vue Router puede seleccionar el componente [ListaProductos.vue]{.verbatim} y mostrarlo dentro de la estructura principal de la aplicación. Y cuando el usuario navegue a [/configuracion]{.verbatim}, Vue Router selecciona otro componente sin necesidad de recargar toda la página.


## Ventajas y limitaciones de una SPA {#ventajas-spa}

A la hora de crear una aplicación SPA, podemos destacar las siguientes ventajas:

- La navegación puede resultar más fluida.
- Se pueden reutilizar componentes y estructuras comunes.
- Es posible mantener parte del estado de la aplicación durante la navegación.
- La interfaz puede actualizarse sin recargar el documento completo.
- Facilita la creación de aplicaciones interactivas y complejas.

En lo referente a las limitaciones, se pueden comentar las siguientes:

- El navegador necesita descargar y ejecutar JavaScript.
- Una aplicación mal optimizada puede tardar en mostrar su contenido inicial.
- La navegación directa a una URL puede requerir configuración específica en el servidor.
- El posicionamiento en buscadores depende de la arquitectura y de cómo se genere y entregue el contenido.
- El desarrollador debe gestionar correctamente los estados, las rutas y los errores de navegación.

Una SPA no implica necesariamente que toda la aplicación deba ejecutarse exclusivamente en el navegador. Existen otras arquitecturas, como la generación estática y la representación en servidor, que pueden combinarse con tecnologías del ecosistema Vue.




