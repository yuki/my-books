
# Concepto de componente {#concepto-componente}

Uno de los conceptos fundamentales de Vue es el **componente**, que se puede definir como una parte independiente y reutilizable de la interfaz de una aplicación. En lugar de construir toda la aplicación dentro de un único archivo, **podemos dividirla en pequeñas piezas que tengan una responsabilidad concreta**.

Una aplicación Vue puede contener decenas, cientos o incluso miles de componentes dependiendo de su tamaño: cabecera, menú, lista de productos, producto, carrito, formulario de creación, pie de página, ...


## Ventajas de utilizar componentes {#ventajas-componentes}

La utilización de componentes proporciona varias ventajas, entre las que podemos destacar:

- **Reutilización**: Un mismo componente puede utilizarse varias veces. Por ejemplo, si tenemos un componente [ProductCard.vue]{.verbatim}, podemos utilizarlo para representar todos los productos de una tienda. Por lo tanto, cada vez que se visualiza un producto, se llamará a ese componente.
- **Mantenimiento**: Si toda la lógica relacionada con una parte de la interfaz está concentrada en un componente, modificarla resulta más sencillo. Por ejemplo, si queremos cambiar el aspecto de todas las tarjetas de producto, sólo necesitamos modificar el [ProductCard.vue]{.verbatim} y se reflejará en todo.
- **Organización**: Los componentes permiten dividir una aplicación compleja en unidades más pequeñas. Esto facilita que diferentes desarrolladores puedan trabajar en distintas partes de una aplicación.
- **Encapsulación**: Un componente puede contener su propia estructura HTML, lógica JavaScript y estilos CSS. De esta forma, podemos mantener agrupado el código relacionado con una determinada funcionalidad.


# *Single File Components* {#single-file-components}

Vue proporciona un formato de archivo denominado ***Single File Component* (SFC)**. Los componentes SFC utilizan normalmente la extensión [.vue]{.verbatim} y permiten mantener en un mismo archivo las diferentes partes que forman un componente:

- **Template**: HTML para la estructura.
- **Script**: JavaScript para la lógica.
- **Style**: CSS para los estilos.







