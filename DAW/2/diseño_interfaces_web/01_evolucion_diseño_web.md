
# Introducción {#introducción-evolución-diseño-web}

Cuando navegamos por Internet es fácil pensar que las páginas web siempre han tenido un aspecto similar al actual. Sin embargo, el diseño web ha evolucionado enormemente desde la creación de la [World Wide Web](https://es.wikipedia.org/wiki/World_Wide_Web) a principios de los años noventa.

Las primeras páginas eran muy sencillas y estaban formadas casi exclusivamente por texto. Con el paso de los años aparecieron nuevas tecnologías que permitieron incorporar imágenes, estilos, animaciones e interfaces mucho más elaboradas.

Conocer esta evolución permite comprender por qué existen determinadas tecnologías, cómo han surgido los estándares actuales y cuáles son las buenas prácticas que deben seguirse en el desarrollo de interfaces web.


# Historia del diseño web {#historia-diseño-web}
<!-- Copiado de DAW/2/desarrollo_entorno_cliente/01_introduccion.md -->

## Los primeros años: páginas web estáticas {#primeros-años}

En 1991 [Tim Berners-Lee](https://en.wikipedia.org/wiki/Tim_Berners-Lee) comienza el desarrollo de HTML en el [CERN](https://en.wikipedia.org/wiki/CERN). No sólo creó el lenguaje HTML si no que creó el protocolo [HTTP (*HyperText Transfer Protocol*)](https://es.wikipedia.org/wiki/Protocolo_de_transferencia_de_hipertexto) y el primer servidor web.

![Primer servidor Web](img/dec/First_Web_Server.jpg){width=50%}

<!-- FIN copiado de DAW/2/desarrollo_entorno_cliente/01_introduccion.md -->

Las primeras páginas web estaban escritas en HTML y tenían una estructura extremadamente simple. No existía ninguna separación entre contenido y presentación. El propio HTML indicaba tanto la estructura como la apariencia del documento.

Durante estos primeros años aparecieron navegadores como:

- [WorldWideWeb](https://es.wikipedia.org/wiki/WorldWideWeb)
- [Mosaic](https://es.wikipedia.org/wiki/Mosaic)
- [Netscape Navigator](https://es.wikipedia.org/wiki/Netscape_Navigator)

## La guerra de los navegadores (1995-2000) {#guerra-navegadores}

A mediados de los años noventa Internet comenzó a crecer rápidamente. Microsoft lanzó **Internet Explorer**, mientras que Netscape seguía dominando el mercado. Ambas empresas comenzaron una intensa competencia por incorporar nuevas características antes que su rival. 

Este periodo se conoce como la **[guerra de navegadores](https://es.wikipedia.org/wiki/Guerra_de_navegadores)** debido a que cada navegador implementaba nuevas etiquetas HTML propias. Como consecuencia:

- Una página podía funcionar correctamente en un navegador y presentar errores en otro.
- Los desarrolladores debían crear versiones específicas para distintos navegadores.
- El mantenimiento de los sitios web resultaba complicado.

Era habitual que las webs tuviesen mensajes como "Sitio optimizado para Internet Explorer" o "Compatible con Netscape Navigator" debido a esta problemática.


### Tablas para maquetar el contenido {#tablas-maquetar-contenido}

Como todavía no existía CSS con un soporte amplio, muchos desarrolladores utilizaban las tablas HTML para organizar el contenido.

::: mycode
[Tabla para maquetar]{.title}

```html
<table>
    <tr>
        <td>Menú</td>
        <td>Contenido</td>
    </tr>
</table>
```
:::


Las tablas habían sido diseñadas para mostrar datos tabulares, no para crear diseños completos, pero durante años fueron la herramienta principal para construir páginas web. **Hoy en día esta práctica está totalmente desaconsejada**.

## La aparición de CSS {#aparición-css}

En 1996 apareció **[CSS](https://es.wikipedia.org/wiki/CSS) (Cascading Style Sheets)**, cuyo objetivo fue resolver uno de los principales problemas del desarrollo web: **separar el contenido de la presentación**.

:::::::::::::: {.columns }
::: {.column width="47%"}

::: {.mycode}
[HTML]{.title}
```html
<h1>Título</h1>
```
:::

:::
::: {.column width="47%" }

::: {.mycode}
[CSS]{.title}
```css
h1{
    color: blue;
    text-align:center;
}
```
:::

:::
::::::::::::::

Desde ese momento:

- **HTML** describía la **estructura**.
- **CSS** controlaba el **aspecto visual**.

Esta separación ofrecía numerosas ventajas:

- Código más limpio.
- Mayor facilidad de mantenimiento.
- Reutilización de estilos.
- Mejor accesibilidad.
- Diseño uniforme en todo el sitio web.

Aunque CSS apareció en **1996**, pasaron varios años hasta que los navegadores comenzaron a implementarlo correctamente.


## La Web 2.0 {#web-2-0}

A comienzos de los años 2000 Internet cambió profundamente. Los usuarios dejaron de ser simples lectores para convertirse también en creadores de contenido. A este periodo se le conoce como **Web 2.0**.

Las páginas web comenzaron a incorporar:

- Blogs.
- Redes sociales.
- Wikis.
- Comentarios.
- Foros.
- Comercio electrónico.

El diseño también evolucionó considerablemente. Se hicieron populares:

- Grandes botones.
- Sombras.
- Degradados.
- Bordes redondeados.
- Iconos coloridos.
- Menús más elaborados.


## HTML5 y CSS3 {#html5-css3}

En torno a 2010 comenzaron a consolidarse dos grandes estándares: **HTML5** y **CSS3**, que transformaron completamente el desarrollo web. Entre las novedades más importantes encontramos:

+-----------------------------------------------------------------+----------------------------------------------------------+
| HTML5                                                           | CSS3                                                     |
+=================================================================+==========================================================+
| ● Etiquetas semánticas.      `<br>`{=html} `\linebreak`{=latex} | ● Bordes redondeados. `<br>`{=html} `\linebreak`{=latex} |
| ● Vídeo nativo.              `<br>`{=html} `\linebreak`{=latex} | ● Sombras.            `<br>`{=html} `\linebreak`{=latex} |
| ● Audio nativo.              `<br>`{=html} `\linebreak`{=latex} | ● Gradientes.         `<br>`{=html} `\linebreak`{=latex} |
| ● Canvas.                    `<br>`{=html} `\linebreak`{=latex} | ● Animaciones.        `<br>`{=html} `\linebreak`{=latex} |
| ● SVG.                       `<br>`{=html} `\linebreak`{=latex} | ● Transformaciones.   `<br>`{=html} `\linebreak`{=latex} |
| ● Formularios más completos.                                    | ● Media Queries.                                         |
+-----------------------------------------------------------------+----------------------------------------------------------+

Table: {tablename=yukitblr colspec=X[1,l]X[1,l]}

## El auge de los dispositivos móviles {#auge-dispositivos-móviles}

En 2007 apareció el primer iPhone, y aunque ya había dispositivos móviles que permitían navegar por Internet, ninguno llegaba a la calidad de renderizado de este, ya que era un **navegador real**. Poco después comenzaron a popularizarse los teléfonos inteligentes, lo que hizo que cambiase completamente la forma de navegar por Internet.

Los diseñadores ya no podían crear páginas únicamente para monitores de escritorio, ya que ahora era necesario pensar en:

- Pantallas pequeñas.
- Pantallas táctiles.
- Distintas resoluciones.
- Diferentes orientaciones.

### *Responsive Web Design* {#responsive-web-design}

En 2010 Ethan Marcotte popularizó el término **[Responsive Web Design](https://en.wikipedia.org/wiki/Responsive_web_design)**. Su propuesta consistía en crear páginas capaces de adaptarse automáticamente al tamaño de cualquier pantalla.

Para ello comenzaron a utilizarse:

- Diseños fluidos.
- Media Queries.
- Imágenes adaptables.
- Unidades relativas.

Actualmente el diseño responsive es un requisito imprescindible en prácticamente cualquier sitio web.

![Fuente: [Wikipedia](https://en.wikipedia.org/wiki/Responsive_web_design) y [Stéphanie Walter](https://stephaniewalter.design/)](img/diw/Content-is-like-water.svg){width="70%"}


## La llegada de Flexbox y CSS Grid {#llegada-flexbox-grid}

Durante muchos años crear diseños complejos mediante CSS resultaba complicado. Se utilizaban técnicas como *float*, tablas y posicionamientos absolutos.

Estas soluciones eran poco flexibles y difíciles de mantener. Esto cambió con la llegada  de [flexbox]{.verbatim} y [CSS Grid]{.verbatim}, que permitió un salto de calidad y mantenimiento en la maquetación. Hoy en día ambos sistemas constituyen la base del diseño moderno.


## Evolución en el diseño {#evolución-diseño}

Durante muchos años las interfaces intentaban imitar objetos reales. Esta filosofía recibe el nombre de **[skeuomorfismo](https://en.wikipedia.org/wiki/Skeuomorph\#Virtual_examples)**:

- Los botones parecían botones físicos.
- Las carpetas parecían carpetas reales.
- Los calendarios imitaban calendarios de papel.

![Ejemplo skeuomorfismo en iOS 6. Fuente: [AppleInsider](https://appleinsider.com/articles/22/08/23/what-apple-learned-from-skeuomorphism-and-why-it-still-matters)](img/diw/skeumorphism.jpg){width="70%"}

A partir de 2012 comenzó a imponerse una tendencia completamente distinta denominada **Flat Design**. Sus características principales son:

- Colores sólidos.
- Pocos efectos visuales.
- Ausencia de texturas.
- Sombras mínimas.
- Diseño limpio.
- Iconos sencillos.

Microsoft fue uno de los primeros grandes impulsores de este estilo con Windows Phone. Posteriormente Apple y Google adoptaron diseños similares. En 2014 Google presentó **Material Design**, que no se trataba únicamente de un conjunto de estilos visuales, sino de un completo sistema de diseño. Material Design define:

- Colores.
- Tipografías.
- Animaciones.
- Iconografía.
- Espaciados.
- Componentes reutilizables.

Su objetivo era ofrecer una experiencia consistente en todas las aplicaciones de Google. Hoy continúa evolucionando y es uno de los sistemas de diseño más influyentes del desarrollo web.

## Mirando hacia el futuro {#mirando-futuro}

El diseño web continúa evolucionando constantemente. Algunas tendencias actuales son:

- Modo oscuro (*Dark Mode*).
- Aplicaciones web progresivas (PWA).
- Microanimaciones y animaciones discretas.
- Diseño basado en componentes.
- Sistemas de diseño compartidos.
- Accesibilidad desde las primeras fases del desarrollo.
- Alto rendimiento.

Aunque las herramientas cambian con rapidez, los principios fundamentales de un buen diseño permanecen prácticamente inalterables.


::: infobox
Una página web desarrollada hace más de veinte años sigue pudiendo visualizarse en un navegador moderno. Esta compatibilidad hacia atrás ha sido una de las claves del enorme éxito de la Web.
:::

