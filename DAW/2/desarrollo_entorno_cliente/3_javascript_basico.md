
# Inclusión de código JavaScript {#inclusión-código-javascript}

JavaScript puede incorporarse a una página web de diferentes formas. La elección de una u otra dependerá del tamaño del proyecto, de la organización del código y de las necesidades de la aplicación. En este apartado aprenderemos las distintas formas de incluir código JavaScript en un documento HTML y las buenas prácticas recomendadas en el desarrollo web moderno.

Existen dos formas principales de incorporar JavaScript a una página web:

- Código integrado (interno).
- Código en un fichero externo.

## Código integrado {#código-integrado}

El código integrado consiste en escribir el código JavaScript directamente dentro del documento HTML mediante la etiqueta `<script>`.

::: mycode
[Código JavaScript integrado en HTML]{.title}

```html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Mi primera página</title>
</head>
<body>

    <h1>Hola Mundo</h1>
    <!-- esto es un comentario HTML -->
    <script>
        // esto es un comentario en JavaScript
        console.log("Hola desde JavaScript");
    </script>
</body>
</html>
```
:::

Cuando el navegador encuentra la etiqueta `<script>`, interpreta y ejecuta inmediatamente el código contenido en su interior. Dentro de la misma página web puede haber varias etiquetas, que se ejecutarán en orden.

::: infobox
La etiqueta `<script>` puede tener un atributo `type`, como `type="text/javascript"`. Si no se pone, se asume como código JavaScript por defecto.
:::


## Código en un fichero externo {#código-fichero-externo}

La forma más habitual a la hora de escribir código JavaScript es en un fichero independiente con extensión [.js]{.verbatim}, por ejemplo [js/app.js]{.configfile}. Desde el fichero HTML se referencia el archivo JavaScript.


:::::::::::::: {.columns }
::: {.column width="45%"}

::: {.mycode size=footnotesize}
[Código index.html]{.title}
```html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Mi primera página</title>
</head>
<body>
    <h1>Hola Mundo</h1>
    <script src="js/app.js"></script>
</body>
</html>
```
:::

:::
::: {.column width="52%" }

::: {.mycode size=scriptsize}
[Código js/app.js]{.title}
```javascript
console.log("Hola desde un fichero externo");
```
:::

:::
::::::::::::::


Cuando el navegador recibe el código HTML lo analizará y verá el atributo `src`, por lo que realizará una nueva petición al servidor para descargar el fichero y así poder ejecutarlo. Es la opción recomendada en prácticamente cualquier proyecto  ya que cuenta con unas ventajas que el código integrado no tiene:

- El código HTML es más limpio.
- Se separa la estructura de la lógica.
- El mismo fichero puede reutilizarse en varias páginas.
- Es más sencillo localizar errores.
- Facilita el trabajo en equipo.
- El navegador puede almacenar el archivo en caché para futuras visitas. No volverá a pedirlo al servidor.

Cuando un proyecto crece puede ser recomendable separar el código en distintos ficheros.

::: exercisebox
Escribe el código anterior y busca dónde aparece el log.
:::


### Importancia del orden de carga  

Cuando una página contiene varios archivos JavaScript, **el orden en el que se cargan puede ser muy importante**. El navegador ejecuta los scripts siguiendo el orden en que aparecen en el documento HTML. Teniendo esto en cuenta, **es importante tener en cuenta si existen dependencias entre ficheros**.

Supongamos los siguientes dos ficheros:

:::::::::::::: {.columns }
::: {.column width="45%"}

::: {.mycode size=scriptsize}
[Código js/app.js]{.title}
```javascript
function saludar(nombre) {
    console.log(`Hola ${nombre}`);
}
```
:::

:::
::: {.column width="52%" }

::: {.mycode size=scriptsize}
[Código js/app.js]{.title}
```javascript
saludar("Ana");
```
:::

:::
::::::::::::::

::: exercisebox
¿Cuál sería el orden correcto de cargar los ficheros? Prueba todas las opciones posibles. ¿Qué sucede cuando el orden es incorrecto?
:::
