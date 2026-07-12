
# Introducción {#introducción}

Cuando utilizamos una página web comienza una secuencia de acciones en las que entran en juego distintos programas y servicios (algunos en nuestro equipo y otros fuera de él). La secuencia simplificada sería la siguiente:

1. El usuario introduce una URL de la página web que quiere visitar en el navegador.
2. Nuestro equipo realizar una petición DNS para conocer la dirección IP a la que realizar la solicitud.
3. El navegador solicita la página al servidor.
4. El servidor procesa la petición. En el servidor se suelen realizar distintos procesos como:
   1. Recibir la petición.
   2. Procesar la petición (puede requerir de un lenguaje de programación: PHP/Ruby/Python/Java...).
   3. Se accede a una base de datos si es necesario.
   4. El servidor genera la información que tiene que devolver.
5. El servidor devuelve la información.
6. El navegador interpreta esa información (código HTML y CSS) y la muestra al usuario.
7. Esa información puede contar con parte de información creada en un lenguajes de programación que se ejecute en nuestro navegador.

::: infobox
Los pasos 3 a 5 se repiten también para imágenes, ficheros CSS, JS, vídeos...
:::

Actualmente muchas aplicaciones que antes eran programas de escritorio funcionan completamente desde un navegador:

- Correo electrónico
- Programas de retoque fotográfico
- Gestores empresariales (facturas/almacen/citas)
- Juegos

# Historia del desarrollo web en entorno cliente {#historia-desarrollo-web-entorno-cliente}

Hoy en día, cuando pensamos en el desarrollo web en el navegador, lo normal es pensar en **HTML**, **CSS** y **JavaScript**. Sin embargo, no siempre ha sido así. A lo largo de la historia se han utilizado diferentes tecnologías para añadir interactividad a las páginas web. Algunas desaparecieron y otras evolucionaron hasta convertirse en los estándares actuales.

## Los primeros años: páginas web estáticas {#primeros-años}

En 1991 [Tim Berners-Lee](https://en.wikipedia.org/wiki/Tim_Berners-Lee) comienza el desarrollo de HTML en el [CERN](https://en.wikipedia.org/wiki/CERN). No sólo creó el lenguaje HTML si no que creó el protocolo [HTTP (*HyperText Transfer Protocol*)](https://es.wikipedia.org/wiki/Protocolo_de_transferencia_de_hipertexto) y el primer servidor web.

![Primer servidor Web](img/dec/First_Web_Server.jpg){width=50%}

En 1993 se publica y se propone como estándar por el [IETF](https://en.wikipedia.org/wiki/Internet_Engineering_Task_Force). En este momento las páginas web estaban formadas únicamente por **HTML**. Su contenido era completamente estático: mostraban texto, imágenes y enlaces, pero apenas existía interacción con el usuario.

Posteriormente, 1996, apareció **CSS**, que permitió separar el contenido de la presentación y mejorar el aspecto visual de las páginas.

::: infobox
En esta época, cualquier procesamiento complejo debía realizarse en el servidor, ya que el navegador apenas tenía capacidad de ejecución.
:::

### Lenguajes en entorno servidor {#primeros-lenguajes-entorno-servidor}

Aunque en esta asignatura nos vamos a centrar en el entorno cliente, es interesante conocer que en estos primeros años, para poder hacer las páginas web programando en el *backend*, se hacía uso de los lenguajes más habituales de la época en entornos UNIX, como son [C](https://en.wikipedia.org/wiki/C_(programming_language)), [Perl](https://en.wikipedia.org/wiki/Perl) y posteriormente [Python](https://en.wikipedia.org/wiki/Python_(programming_language)).

Para usar estos lenguajes de programación se usaba el interfaz [**CGI** (*Common Gateway Interface*)](https://en.wikipedia.org/wiki/Common_Gateway_Interface), que permitía a los servidores web ejecutar un programa externo que procesaba la petición HTTP.

El proceso funcionaba de la siguiente manera para cada petición HTTP:

1. Crear un nuevo proceso.
2. Cargar el programa.
3. Ejecutarlo.
4. Finalizar el proceso.

Esto hacía que consumiese mucha CPU y recursos de memoria.

::: warnbox
El uso de CGI fue antes de los servidores de aplicaciones o módulos en los servidores web.
:::

## JavaScript: el nacimiento de las páginas dinámicas {#javascript-nacimiento}

En 1995, la empresa [Netscape](https://en.wikipedia.org/wiki/Netscape) desarrolló **JavaScript** con el objetivo de añadir pequeñas funcionalidades a las páginas web sin necesidad de comunicarse continuamente con el servidor.

Gracias a JavaScript fue posible:

- Validar formularios antes de enviarlos.
- Mostrar u ocultar elementos de la página.
- Crear menús interactivos.
- Responder inmediatamente a las acciones del usuario.

Con el paso de los años, JavaScript fue evolucionando hasta convertirse en un lenguaje de programación muy potente, capaz de desarrollar aplicaciones web completas.

Actualmente **es el único lenguaje de programación que todos los navegadores ejecutan de forma nativa**.

Netscape liberó el código de su navegador web y creó la organización Mozilla, que a su vez reescribió el navegador que posteriormente se convertiría en Firefox.

## Java Applets: aplicaciones Java en el navegador {#java-applets}

Poco después apareció otra tecnología muy popular: los **[Java Applets](https://en.wikipedia.org/wiki/Java_applet)**. Un Applet era un programa escrito en Java que se descargaba desde una página web y se ejecutaba en el ordenador del usuario mediante una **Máquina Virtual de Java (JVM)** instalada como complemento del navegador.

Los Applets permitían desarrollar aplicaciones mucho más complejas que las posibles con el JavaScript de aquella época. Por ejemplo:

- Juegos.
- Simulaciones.
- Herramientas de dibujo.
- Aplicaciones educativas.
- Visualizadores en tres dimensiones.

Sin embargo, presentaban varios inconvenientes:

- Era necesario instalar Java en el ordenador.
- Dependían de un complemento del navegador.
- Su tiempo de carga era elevado.
- Presentaban numerosos problemas de seguridad.

**En 2017 se declaró obsoleto**, y los navegadores dejaron de soportar los complementos necesarios para ejecutar Applets.

## Adobe Flash: las animaciones de Internet {#adboe-flash}

A finales de los años 90 y durante gran parte de los años 2000, **[Adobe Flash](https://en.wikipedia.org/wiki/Adobe_Flash)** se convirtió en la tecnología dominante para crear contenido multimedia en Internet. Flash permitía desarrollar:

- Animaciones.
- Juegos.
- Reproductores de vídeo.
- Publicidad interactiva.
- Aplicaciones completas.

Durante muchos años fue muy utilizado porque **los navegadores todavía no ofrecían muchas de estas capacidades de forma nativa**. Sin embargo, Flash tenía varios problemas:

- Requería instalar un complemento.
- Consumía muchos recursos.
- Presentaba frecuentes vulnerabilidades de seguridad.
- No funcionaba correctamente en la gran mayoría de dispositivos móviles.

En 2010 Steve Jobs escribió una carta abierta llamada [Reflexiones sobre Flash](https://en.wikipedia.org/wiki/Thoughts_on_Flash) explicando por qué Apple no permitía Flash en los iPhone. Aunque hubo mucha crítica inicial, y había acusaciones que se podían argumentar contra Apple, años después se confirmaría que Flash consumía muchos recursos, batería y que era inseguro.

En 2020 Adobe dejó de dar soporte a Flash y los navegadores eliminaron completamente su compatibilidad.

## AJAX: aplicaciones más rápidas {#ajax}

En 1999 Microsoft crea la técnica llamada **[AJAX](https://en.wikipedia.org/wiki/Ajax_(programming))** (*Asynchronous JavaScript and XML*), como evolución a las etiquetas *iframe* de 1996, todo ello exclusivo de Internet Explorer 5.0.

Antes de AJAX, cada vez que el usuario realizaba una acción era necesario recargar completamente la página. Gracias a AJAX, el navegador podía comunicarse con el servidor en segundo plano y actualizar únicamente una parte de la página. Esto permitió crear aplicaciones mucho más rápidas y con una mejor experiencia de usuario.

::: infobox
Aunque originalmente utilizaba XML para intercambiar datos, actualmente la mayoría de aplicaciones utilizan el formato **[JSON](https://en.wikipedia.org/wiki/JSON)**.
:::

## jQuery: simplificando el desarrollo web {#jquery-simplificando-desarrollo-web}

A partir de 2006, **[jQuery](https://jquery.com/)** se convirtió en una de las bibliotecas de JavaScript más populares. En aquella época, desarrollar aplicaciones web con JavaScript puro resultaba complicado porque **cada navegador implementaba el DOM y los eventos de forma ligeramente diferente**. Además, muchas funcionalidades que hoy consideramos habituales, como `querySelector()`, `fetch()` o una gestión uniforme de eventos, todavía no existían o no estaban disponibles en todos los navegadores.

El principal objetivo de jQuery era ofrecer una API sencilla y compatible con todos los navegadores. Gracias a ello, los desarrolladores podían seleccionar elementos utilizando selectores similares a CSS, modificar el contenido de una página, gestionar eventos, crear animaciones o realizar peticiones AJAX sin preocuparse por las diferencias entre navegadores. Esto reducía considerablemente la cantidad de código necesario y facilitaba el desarrollo de aplicaciones web.

Durante varios años, jQuery estuvo presente en la mayoría de los sitios web de Internet y fue una herramienta casi imprescindible para cualquier desarrollador frontend. Su éxito fue tan grande que muchas de las funcionalidades que popularizó terminaron incorporándose de forma nativa a JavaScript y a los navegadores modernos.

:::infobox
Muchas de las funcionalidades que popularizó terminaron incorporándose de forma nativa a JavaScript y a los navegadores modernos.
:::

Con la aparición de HTML5, la estandarización de las APIs del navegador y el desarrollo de frameworks como **Angular**, **React** y **Vue.js**, la necesidad de utilizar jQuery fue disminuyendo. En la actualidad sigue presente en algunos proyectos antiguos, pero en las nuevas aplicaciones web es mucho menos frecuente, ya que los navegadores modernos y los frameworks actuales ofrecen soluciones más completas y potentes.

Aunque jQuery fue la más conocida, durante esos años hubo otras librerías que trataban de extender JavaScript:

- **[Prototype](https://en.wikipedia.org/wiki/Prototype_JavaScript_Framework)**, de 2005, muy utilizada junto con Ruby on Rails. Añadía métodos al DOM y simplificaba JavaScript.
- **script.aculo.us**, creada sobre Protoype, era una librería para crear animaciones, efectos visuales y *drag & drop*.
- [Ext JS](https://en.wikipedia.org/wiki/Ext_JS): Orientada a aplicaciones empresariales con interfaces muy similares a programas de escritorio. Sigue existiendo, aunque con un uso mucho menor.

## HTML5: el navegador gana capacidades {#html5}

:::::::::::::: {.columns }
::: {.column width="75%"}
En 2007 se publicó el primer borrador de [HTML5](https://en.wikipedia.org/wiki/HTML5), una importante evolución del lenguaje HTML. HTML5 incorporó numerosas funcionalidades que antes solo podían conseguirse mediante tecnologías externas como Flash.

Gracias a HTML5, los navegadores modernos comenzaron a convertirse en una plataforma de desarrollo mucho más completa gracias a que incorporaron APIs para ejecutar de forma nativa:
:::
::: {.column width="15%" }
![](img/dec/HTML5_logo_and_wordmark.svg){width="100%"}
:::
::::::::::::::

- Reproducción de vídeo y audio sin complementos (Youtube empezó a usarlo como reproductor para el iPhone).
- Dibujos mediante la etiqueta `<canvas>`.
- Gráficos vectoriales con SVG.
- Almacenamiento local de datos.
- Geolocalización.
- APIs para acceder a diferentes recursos del dispositivo.

## Frameworks de JavaScript {#frameworks-javascript}

A medida que las aplicaciones web crecían en tamaño, desarrollar todo el código únicamente con JavaScript resultaba cada vez más complicado. Por este motivo aparecieron diferentes ***frameworks***, cuyo objetivo era facilitar el desarrollo de aplicaciones complejas.

Algunos de los más conocidos son:

- [Vue.js](https://vuejs.org/)
- [React](https://es.react.dev/)
- [Angular](https://angular.dev/)

Estos frameworks permiten organizar el código, reutilizar componentes y desarrollar aplicaciones de gran tamaño de forma más sencilla.

Hoy en día también existe **[TypeScript](https://en.wikipedia.org/wiki/TypeScript)**, que es un lenguaje de programación de alto nivel que se *transpila* a JavaScript. Es un superset de JavaScript. Hoy en día distintos [*frameworks* y aplicaciones](https://en.wikipedia.org/wiki/List_of_TypeScript_software_and_tools) lo utilizan. **El código TypeScript no se ejecuta en entorno cliente**.

## WebAssembly: ejecución de binarios en el navegador {#webassembly}

En los últimos años ha aparecido una nueva tecnología llamada **WebAssembly (Wasm)**. WebAssembly no es un lenguaje de programación, sino un formato binario que los navegadores pueden ejecutar de forma muy eficiente. Permite utilizar lenguajes de programación como C, C++, Rust, Java que se compilan para desarrollar aplicaciones que posteriormente se ejecutan dentro del navegador.

Esta tecnología es especialmente útil para aplicaciones que requieren un alto rendimiento, como:

- Videojuegos.
- Editores de imagen.
- Modelado 3D.
- Simulaciones científicas.
- Edición de vídeo.

Aunque WebAssembly puede ejecutar código compilado muy rápidamente, JavaScript sigue siendo necesario para interactuar con el navegador y con la página web.

# Arquitectura cliente-servidor {#arquitectura-cliente-servidor}

La mayoría de aplicaciones web utilizan una arquitectura denominada **cliente-servidor**. Está formada por dos partes claramente diferenciadas.

En la siguiente tabla se puede ver un resumen de las diferencias existentes entre el entorno cliente y el servidor:

```{=html}
<table " data-tablename="yukitblrcol"
    class="table table-striped table-responsive table-hover table-bordered border-secondary-subtle">
    <thead>
        <tr>
            <th></th>
            <th>Cliente</th>
            <th>Servidor</th>
        </tr>
    </thead>
    <tbody class="table-group-divider">
        <tr>
            <td>Puede ser</td>
            <td>
                <ul>
                    <li>Ordenador / móvil / tablet …</li>
                    <li>Navegador Web</li>
                </ul>
            </td>
            <td>
                <ul>
                    <li>Servidor remoto</li>
                </ul>
            </td>
        </tr>
        <tr>
            <td>Función</td>
            <td>
                <ul>
                    <li>Solicitar información.</li>
                    <li>Gestiona la interfaz.</li>
                    <li>Ejecutar código cliente.</li>
                    <li>Recoger las acciones del usuario.</li>
                    <li>“Sólo lo usa un usuario”</li>
                </ul>
            </td>
            <td>
                <ul>
                    <li>Recibir peticiones.</li>
                    <li>Gestiona la lógica de negocio.</li>
                    <li>Acceder a bases de datos.</li>
                    <li>Enviar respuestas al cliente.</li>
                    <li>Puede atender miles de usuarios.</li>
                </ul>
            </td>
        </tr>
        <tr>
            <td>Tecnologías</td>
            <td>
                <ul>
                    <li>HTML</li>
                    <li>CSS</li>
                    <li>Javascript</li>
                    <li>WebAssembly (Wasm)</li>
                </ul>
            </td>
            <td>
                <ul>
                    <li>PHP</li>
                    <li>Python</li>
                    <li>Ruby on Rails</li>
                    <li>Java</li>
                    <li>NodeJS</li>
                </ul>
            </td>
        </tr>
    </tbody>
</table>
```

```{=latex}
\begin{yukitblrcol}{X[1]X[2,l]X[2,l]}
& Cliente & Servidor \\
Puede ser &  
      ▪ Ordenador / móvil / tablet … \linebreak
      ▪ Navegador Web
   & 
      ▪ Servidor remoto
   \\ 
Función  & 
      ▪ Solicitar información. \linebreak
      ▪ Gestiona la interfaz. \linebreak
      ▪ Ejecutar código cliente. \linebreak
      ▪ Recoger las acciones del usuario. \linebreak
      ▪ “Sólo lo usa un usuario”.
   &
      ▪ Recibir peticiones. \linebreak
      ▪ Gestiona la lógica de negocio. \linebreak
      ▪ Acceder a bases de datos. \linebreak
      ▪ Enviar respuestas al cliente. \linebreak
      ▪ Puede atender miles de usuarios.
   \\
Tecnologías  &
      ▪ HTML \linebreak
      ▪ CSS \linebreak
      ▪ Javascript \linebreak
      ▪ WebAssembly (Wasm)
   &
      ▪ PHP \linebreak
      ▪ Python \linebreak
      ▪ Ruby on Rails \linebreak
      ▪ Java \linebreak
      ▪ NodeJS
   \\
\end{yukitblrcol}
```

::: center
[Comparativa simplificada entre entorno Cliente y Servidor]{.footnotesize}
:::

En la siguiente imagen se puede ver una simplificación de la arquitectura:

![Arquitectura cliente-servidor](img/dec/cliente-servidor.png){width=100%}

En  la imagen podemos  diferenciar:

- **Cliente**: Formado por nuestro equipo y el navegador web que usemos.
- **Servidor**: Una aplicación web moderna suele contar con:
  - **Servidor Web**: [Apache HTTP Server](https://httpd.apache.org/) o [Nginx](https://nginx.org/), por poner dos ejemplos muy conocidos.
  - Lenguaje de programación entorno servidor / *framework*
  - **Base de datos**: en las bases de datos relacionales las más conocidas son: [MySQL](https://www.mysql.com/), [MariaDB](https://mariadb.org/) o [PostgreSQL](https://www.postgresql.org/).

## Tecnologías del lado del cliente {#tecnologías-lado-cliente}

Tal como hemos visto previamente, actualmente existen tres tecnologías fundamentales que se usan en el entorno cliente:

- **HTML**: define la estructura de una página.
- **CSS**: define el aspecto visual.
- **JavaScript**: es un lenguaje de programación que se ejecuta en el navegador Web de forma nativa que añade comportamiento, permite modificar el aspecto visual de manera interactiva, puede realizar peticiones al servidor de manera asíncrona, ...

Más adelante nos adentraremos más en ellos.

# Navegadores Web {#navegador-web}

El navegador Web es el programa que utiliza el usuario para navegar en Internet, realizando las peticiones y acciones que dicta el usuario e interpretar los archivos recibidos desde el servidor.

## ¿Qué hace un navegador? {#qué-hace-navegador}

Tras ejecutar la petición al servidor, el proceso que sigue el navegador es el siguiente:

1. Descarga el HTML.
2. Descarga el CSS.
3. Descarga JavaScript.
4. Construye el DOM.
5. Aplica los estilos.
6. Ejecuta JavaScript.
7. Muestra el resultado.

## Motores de renderizado {#motores-renderizado}

Según [StatCounter](https://gs.statcounter.com/browser-market-share/), a 2026 los navegadores más utilizados son:

- [Google Chrome](https://www.google.com/chrome/)
- [Safari](https://www.apple.com/es/safari/)
- [Microsoft Edge](https://explore.microsoft.com/es-es/edge)
- [Mozilla Firefox](https://www.firefox.com/es-ES/)

Los navegadores web son programas muy complejos (**y cada vez más**) y es por eso que desde que se inventó la Web han existido distintos programas, e incluso hubo [una guerra de navegadores](https://es.wikipedia.org/wiki/Guerra_de_navegadores).

Antiguamente cada navegador web utilizaba un motor de renderizado distinto. El [motor de renderizado](https://es.wikipedia.org/wiki/Motor_de_renderizado) es el encargado de coger el documento HTML, y junto con el CSS y el JavaScript, y generar el aspecto visual final con el que interactúa el usuario.

::: infobox
El motor de renderizado es el encargado de coger el documento HTML, y junto con el CSS y el JavaScript, y generar el aspecto visual final con el que interactúa el usuario.
:::

Cada motor de renderizado cumplía "a su manera" el estándar. Aparte, podían añadir ciertas características propias no estándar, lo que en hacía que las páginas webs se pudiesen llegar a ver de manera muy diferente dependiendo del navegador a utilizar, o que incluso no funcionase si se hacía uso de alguna de esas características.

Para comprobar si los navegadores cumplían con los estándares aparecieron distintos tests, entre los que se pueden destacar el [Acid2](https://en.wikipedia.org/wiki/Acid2) y [Acid3](https://en.wikipedia.org/wiki/Acid3).

![Resultados de Acid2 en distintos navegadores](img/dec/acid2.png)

Hoy en día, debido a lo complejo que es crear un motor de renderizado, aunque existen muchos navegadores web, no existen apenas motores de renderizado. Esto quiere decir, que aunque uses Google Chrome o Microsoft Edge u Opera, los tres hacen uso del mismo motor de renderizado.

- **[Gecko](https://en.wikipedia.org/wiki/Gecko_(software))**: El motor de renderizado creado por Mozilla y utilizado por Firefox y sus distintos *forks*.
- **[WebKit](https://en.wikipedia.org/wiki/WebKit)**: Apple creó este motor en 1998 haciendo un fork del código de [KHTML](https://en.wikipedia.org/wiki/KHTML) (navegador web creado por el proyecto [KDE](https://en.wikipedia.org/wiki/KDE)). Aunque actualmente principalmente se usa en dispositivos Apple, Sony ayudó en su desarrollo y lo usó en PS3, y también en las consolas de Nintendo.
  Apple obliga a hacer uso de este motor en todos los navegadores web de dispositivos iOS e iPad. Esto quiere decir que aunque uses la aplicación Chrome, el motor de renderizado en iOS es Webkit.
- **[Blink](https://en.wikipedia.org/wiki/Blink_(browser_engine))**: En 2013 Google anuncia que crea un fork de Webkit para crear su propio motor y de esta manera ser más independiente de Apple en el desarrollo del motor. Es el motor utilizado en el navegador web de código abierto [Chromium](https://en.wikipedia.org/wiki/Chromium_(web_browser)). Hoy día es el motor más usado ya que muchos navegadores hacen uso de él: Microsoft Edge, Opera, Vivaldi, Brave...

![Meme de navegadores y motores de renderizado. Origen: [programmerhumor](https://programmerhumor.io/webdev-memes/when-you-realize-every-new-ai-browser-is-just-chromium-in-disguise-gadg)](img/dec/web_meme.jpg){width=100% framed=true}

En la Wikipedia se puede ver una [comparativa de navegadores web](https://en.wikipedia.org/wiki/Comparison_of_web_browsers) y otra [comparativa de los motores de renderizado](https://en.wikipedia.org/wiki/Comparison_of_browser_engines).

# Herramientas para desarrollar {#herramientas-desarrollo}

Aunque a lo largo del curso usaremos distintas herramientas, al inicio de curso sólo haremos uso de unas pocas. Para empezar haremos uso de:

- **Editor**: [Visual Studio Code](https://code.visualstudio.com/) (extensiones recomendadas: ESLint, Prettier, Live Server).
- **[Git](https://git-scm.com/)** como sistema de control de versiones.
- **[GitHub](https://github.com/)** como repositorio remoto.
- **Navegador web**: Firefox, Chrome, ...
  - **Herramientas de desarrollador**: Todos los navegadores incluyen herramientas para facilitar el desarrollo. Normalmente se abren pulsando `F12` o `Ctrl + Shift + I`.

<!-- 

# Organización de un proyecto web {#organización-proyecto}

Un proyecto suele organizarse mediante carpetas.

Ejemplo:

```
proyecto/
│
├── index.html
├── css/
│     estilos.css
│
├── js/
│     app.js
│
├── img/
│
├── assets/
│
└── components/
```

Una buena organización facilita el mantenimiento del proyecto. -->
