
# Escribir código JavaScript {#escribir-código-javascript}

JavaScript puede incorporarse a una página web de diferentes formas. La elección de una u otra dependerá del tamaño del proyecto, de la organización del código y de las necesidades de la aplicación. En este apartado aprenderemos las distintas formas de incluir código JavaScript en un documento HTML y las buenas prácticas recomendadas en el desarrollo web moderno.

Existen dos formas principales de incorporar JavaScript a una página web:

- Código integrado (interno).
- Código en un fichero externo.

## Código integrado {#código-integrado}

El código integrado consiste en escribir el código JavaScript directamente dentro del documento HTML mediante la etiqueta [<script>]{.verbatim}.

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

Cuando el navegador encuentra la etiqueta [<script>]{.verbatim}, interpreta y ejecuta inmediatamente el código contenido en su interior. Dentro de la misma página web puede haber varias etiquetas, que se ejecutarán en orden.

::: infobox
La etiqueta [<script>]{.verbatim} puede tener un atributo [type]{.verbatim}, como [type="text/javascript"]{.verbatim}. Si no se pone, se asume como código JavaScript por defecto.
:::


## Código en un fichero externo {#código-fichero-externo}

La forma más habitual a la hora de escribir código JavaScript es en un fichero independiente con extensión [.js]{.verbatim}, por ejemplo [js/app.js]{.configfile}. Desde el fichero HTML se referencia el archivo JavaScript.


:::::::::::::: {.columns }
::: {.column width="47%"}

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
::: {.column width="47%" }

::: {.mycode size=scriptsize}
[Código js/app.js]{.title}
```javascript
console.log("Hola desde un fichero externo");
```
:::

:::
::::::::::::::


Cuando el navegador recibe el código HTML lo analizará y verá el atributo [src]{.verbatim}, por lo que realizará una nueva petición al servidor para descargar el fichero y así poder ejecutarlo. Es la opción recomendada en prácticamente cualquier proyecto  ya que cuenta con unas ventajas que el código integrado no tiene:

- El código HTML es más limpio.
- Se separa la estructura de la lógica.
- El mismo fichero puede reutilizarse en varias páginas.
- Es más sencillo localizar errores.
- Facilita el trabajo en equipo.
- El navegador puede almacenar el archivo en caché para futuras visitas. No volverá a pedirlo al servidor.

Cuando un proyecto crece puede ser recomendable separar el código en distintos ficheros.

::: exercisebox
[[01](https://github.com/yuki/ejercicios/blob/main/daw/dec/01.html)]{.solution}

Escribe el código anterior y busca dónde aparece el log.
:::


### Carga de varios ficheros {#carga-ficheros-externos}

Cuando una página contiene varios archivos JavaScript, **el orden en el que se cargan puede ser muy importante**. El navegador ejecuta los scripts siguiendo el orden en que aparecen en el documento HTML. Teniendo esto en cuenta, **es importante tener en cuenta si existen dependencias entre ficheros**.

Supongamos los siguientes dos ficheros:

:::::::::::::: {.columns }
::: {.column width="47%"}

::: {.mycode size=scriptsize}
[Código js/funciones.js]{.title}
```javascript
function saludar(nombre) {
    console.log(`Hola ${nombre}`);
}
```
:::

:::
::: {.column width="47%" }

::: {.mycode size=scriptsize}
[Código js/app.js]{.title}
```javascript
saludar("Rubén");
```
:::

:::
::::::::::::::

::: exercisebox
[[02a](https://github.com/yuki/ejercicios/blob/main/daw/dec/02a.html) y [02b](https://github.com/yuki/ejercicios/blob/main/daw/dec/02b.html)]{.solution}

¿Cuál sería el orden correcto de cargar los ficheros? Prueba todas las opciones posibles. ¿Qué sucede cuando el orden es incorrecto?
:::

## ¿Dónde cargar el JavaScript? {#dónde-cargar-javascript}

Tradicionalmente existían dos posibilidades.

- Dentro del **[<head>]{verbatim}**: Este método puede provocar problemas. Mientras el navegador descarga deja de construir la página HTML. Como consecuencia, el usuario puede percibir una carga más lenta, y si realiza alguna ejecución, como el HTML no está construido, puede haber errores.
- Antes de cerrar **[<body>]{verbatim}**: Durante muchos años la recomendación fue colocar los scripts justo antes del cierre del elemento [<body>]{verbatim}.

:::::::::::::: {.columns }
::: {.column width="47%"}

::: {.mycode size=scriptsize}
[Código en el head]{.title}
```html
<head>
    <script src="03.js"></script>
</head>
<body>
    <h1 id="titulo">Título</h1>
```
:::

:::
::: {.column width="47%" }

::: {.mycode size=scriptsize}
[Antes de cerrar body]{.title}
```html
<body>
    <h1 id="titulo">Título</h1>
...
    <script src="03.js"></script>
</body>
```
:::

:::
::::::::::::::

::: exercisebox
[[03a](https://github.com/yuki/ejercicios/blob/main/daw/dec/03a.html) y [03b](https://github.com/yuki/ejercicios/blob/main/daw/dec/03b.html)]{.solution}

¿Qué diferencia hay al cargar el siguiente código en el [head]{.verbatim} o al terminar el [body]{.verbatim}?

[console.log(document.getElementById("titulo"))]{.verbatim}
:::


### Atributo defer {#atributos-al-cargar}

Actualmente, la práctica más recomendada consiste en utilizar el atributo [defer]{.verbatim}. Esto mejora el rendimiento y evita muchos errores relacionados con elementos HTML que todavía no existen, ya que:

- el navegador continúa construyendo el documento HTML;
- el archivo JavaScript se descarga en segundo plano;
- el código no se ejecuta hasta que el documento HTML ha terminado de cargarse.

::: {.mycode}
[Usando defer como atributo]{.title}
```html
<head>
  <script src="app.js" defer></script>
</head>
```
:::

::: exercisebox
[[03c](https://github.com/yuki/ejercicios/blob/main/daw/dec/03c.html)]{.solution}

Modifica el ejercicio anterior usando [defer]{.verbatim} en el [head]{.verbatim}.
:::

### Atributo async {#atributo-async}

También existe el atributo [async]{.verbatim}. En este caso el navegador descarga el archivo en paralelo, pero lo ejecuta **tan pronto como termina la descarga**, incluso aunque el documento HTML todavía no haya finalizado. El orden de ejecución entre varios scripts con [async]{.verbatim} **no está garantizado**.

Por ello suele utilizarse únicamente para scripts independientes, como:

- herramientas de análisis de visitas;
- publicidad;
- sistemas de estadísticas.

::: errorbox
No es recomendable utilizar [async]{.verbatim} para scripts que dependen unos de otros.
:::

## Comparación y buenas prácticas {#comparativa}

Tal como se ha podido ver, existen distintas maneras a la hora de cargar el código JavaScript, por lo que es importante entender dónde poner el código y que quizá sea necesario usar atributos al cargar los ficheros.

En la siguiente imagen se puede ver una representación visual de los distintos métodos de carga:

![Fuente: [MDN](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/script)](img/dec/async-defer.jpg){width=100%}


En la siguiente tabla se resumen también cómo se pueden usar.

| Método | ¿Bloquea la carga del HTML? | ¿Respeta el orden? | Uso recomendado |
|---------|----------------------------|--------------------|-----------------|
| [<script>]{.verbatim} clásico | Sí | Sí | Solo ejemplos sencillos. |
| [<script defer>]{.verbatim} | No | Sí | Opción recomendada. |
| [<script async>]{.verbatim} | No | No necesariamente | Scripts independientes. |

Table: {tablename=yukitblr colspec=XXXX}
