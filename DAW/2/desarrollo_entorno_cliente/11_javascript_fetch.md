
# Fetch API {#fetch-api}

La **Fetch API** es una interfaz proporcionada por el navegador que permite realizar peticiones HTTP de forma asíncrona. Su función principal es comunicarse con servidores web para de esta manera:

- Descargar información.
- Enviar formularios.
- Consultar una API REST.
- Subir archivos.
- Eliminar información de un servidor.

La función [fetch()]{.verbatim} devuelve una **Promise**, por lo tanto vamos a poder ver todo lo visto en el capítulo anterior: [.then]{.verbatim}, [.catch]{.verbatim}, [async]{.verbatim} y/o [await]{.verbatim}.

## Evolución de las comunicaciones asíncronas en JavaScript {#evolución-peticiones-javascript}

En los primeros años de JavaScript no existía una forma sencilla de realizar peticiones HTTP desde el navegador sin recargar la página completa. Para ello apareció **[XMLHttpRequest](https://es.wikipedia.org/wiki/XMLHttpRequest) (XHR)**, una API introducida por Microsoft en Internet Explorer 5.0 en 1999 (utilizando  [ActiveX](https://es.wikipedia.org/wiki/ActiveX)). Después le siguió Mozilla en 2002 y Safari en 2004. En 2006 el [W3C](https://en.wikipedia.org/wiki/World_Wide_Web_Consortium) presentó el primer borrador para crear un estándar.

A partir de esta tecnología surgió el término **AJAX** (*Asynchronous JavaScript and XML*). Es importante destacar que **AJAX no es una librería ni una función**, sino una técnica de desarrollo que consiste en utilizar JavaScript y XMLHttpRequest para intercambiar información con el servidor sin recargar la página. 

En aquella época el uso de XML era el formato estándar de facto para la comunicación "entre máquinas" (por red), de ahí que en su nombre hace referencia a XML. Con el tiempo el formato **JSON** sustituyó casi por completo a XML debido a su sencillez.

Durante la época de mayor popularidad de AJAX, la compatibilidad entre navegadores era uno de los principales problemas para los desarrolladores. Aunque todos ofrecían la API XMLHttpRequest, existían diferencias en su implementación y comportamiento, especialmente entre Internet Explorer, Firefox, Opera y los primeros navegadores basados en WebKit.

**[jQuery](https://en.wikipedia.org/wiki/JQuery)** simplificó enormemente esta tarea al proporcionar una interfaz única para realizar peticiones AJAX mediante funciones como [\$.ajax()]{.verbatim}, [\$.get()]{.verbatim} o [\$.post()]{.verbatim}. De esta forma, el mismo código funcionaba de manera muy similar en los distintos navegadores, evitando que el desarrollador tuviera que programar soluciones específicas para cada uno de ellos.

Con la llegada de ECMAScript moderno apareció la **Fetch API**, que ofrece una forma mucho más sencilla y legible de realizar peticiones HTTP y es un estándar que todos los navegadores cumplen.


| Tecnología | ¿Qué es? | Situación actual |
|------------|----------|------------------|
| **XMLHttpRequest (XHR)** | API del navegador para realizar peticiones HTTP. | Sigue siendo compatible, pero cada vez se utiliza menos. |
| **AJAX** | Técnica de desarrollo basada originalmente en `XMLHttpRequest`. | El concepto sigue vigente, aunque normalmente se implementa mediante `fetch()`. |
| **Fetch API** | API moderna para realizar peticiones HTTP basada en Promesas. | Es la opción recomendada en el desarrollo web actual. |

Table: {tablename=yukitblr colspec=X[1,l]X[2,l]X[2,l]}

## Hacer petición simple {#hacer-petición-simple}

La forma más sencilla consiste en indicar únicamente la dirección del recurso/servidor y tal como se ha dicho, como devuelve un *Promise*, en este caso vamos a usar [then]{.verbatim} para obtener la respuesta.

::: mycode
[Hacer petición fetch]{.title}
```javascript
fetch("https://jsonplaceholder.typicode.com/users")
.then((respuesta) => {
    console.log(respuesta);
});
```
:::

La variable [respuesta]{.verbatim} contiene la información sobre la respuesta HTTP realizada al servidor, **no contiene los datos que necesitamos**.

::: errorbox
Al hacer [fetch]{.verbatim} primero obtenemos la respuesta HTTP, **no contiene los datos que buscamos**.
:::

### El objeto [Response]{.verbatim} {#objeto-response}

La respuesta devuelta por [fetch()]{.verbatim} es un objeto de tipo [Response]{.verbatim}. Este objeto contiene información como:

- [status]{.verbatim}: [Código de respuesta](https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Status) de la petición HTTP.
  - 200: petición correcta.
  - 201: recurso creado.
  - 301: movido permanentemente.
  - 401: no autorizado.
  - 404: recurso no encontrado.
  - 418: soy una tetera
  - 500: error interno del servidor.
- [ok]{.verbatim}: devuelve un booleano para saber si la petición ha sido correcta (entre 200 y 299)
- [headers]{.verbatim}: Cabeceras HTTP.
- Tipo de contenido.
- Cuerpo de la respuesta.

::: mycode
[Hacer petición fetch]{.title}
```javascript
fetch("https://jsonplaceholder.typicode.com/users")
    .then((respuesta) => {
        console.log(respuesta.status);
        console.log(respuesta.ok);
        if (!respuesta.ok) {
            throw new Error("Error en la petición.");
        }
    });
```
:::

### Obtener el contenido {#obtener-contenido}

Para obtener los datos que se han solicitado al servidor primero debemos convertir la respuesta a un formato adecuado. Podemos elegir entre los siguientes [métodos](https://developer.mozilla.org/en-US/docs/Web/API/Response#instance_methods):

- [json()]{.verbatim}: convierte los datos a formato JSON. **Método para comunicaciones con APIs**.
- [text()]{.verbatim}: obtiene como texto plano.
- [blob()]{.verbatim}: para archivos binarios (imágenes, vídeos, archivos).
- [arrayBuffer()]{.verbatim}: para binarios crudos, manipulación avanzada de archivos.
- [formData()]{.verbatim}: para formularios.


Elegiremos el formato JSON, ya que de esta manera podremos acceder de manera más sencilla a los datos ya que se convertirán en un objeto fácil de manejar con JavaScript.

La llamada a [json()]{.verbatim} también devuelve una promesa, y por eso necesitamos un segundo [then()]{.verbatim} o un segundo [await]{.verbatim} dependiendo del modo elegido.

::: errorbox
La llamada a [json()]{.verbatim} también devuelve una promesa.
:::

:::::::::::::: {.columns }
::: {.column width="40%"}

::: {.mycode size=footnotesize}
[Con Promise]{.title}
```javascript
fetch(URL)
  .then((respuesta) => {
    return respuesta.json();
  })
  .then((datos)=>{
    console.log(datos)
  })
  .catch((error)=> {
    console.log(error);
  });
```
:::

:::
::: {.column width="55%" }

::: {.mycode size=footnotesize}
[Con async / await]{.title}
```javascript
async function cargarUsuarios() {
  const respuesta = await fetch(URL);
  const usuarios = await respuesta.json();
  console.log(usuarios);
}

cargarUsuarios();
```
:::

:::
::::::::::::::


## Gestión de errores {#gestión-errores-fetch}

Para la gestión de errores a la hora de realizar peticiones usaremos [try...catch]{.verbatim}.

::: mycode
[Gestionar errores de peticiones]{.title}
```javascript
const URL = "https://jsonplaceholder.typicode.com/users";

async function cargarDatos() {
    try {
        const respuesta = await fetch(URL);
        const datos = await respuesta.json();
        console.log(datos);
    }
    catch(error){
        console.error(error);
    }
}
```
:::

::: exercisebox
[[19a](https://github.com/yuki/ejercicios/blob/main/daw/dec/19a.html)]{.solution}

Crea 2 botones que llamen a sendas API usando promesas y async/await para obtener los datos respectivamente.
:::


# Comunicación con APIs REST {#comunicación-api-rest}

Una de las aplicaciones más importantes de Fetch consiste en comunicarse con **APIs REST**. Actualmente la mayoría de aplicaciones web, móviles y de escritorio utilizan este tipo de servicios para intercambiar información.

Una [API](https://en.wikipedia.org/wiki/API) (*Application Programming Interface*) es un conjunto de reglas que permite que dos programas se comuniquen entre sí. Una API define:

- Qué operaciones pueden realizarse.
- Cómo deben enviarse los datos.
- Qué respuestas devolverá el servidor.


## Recursos API {#recursos-api}

Una API suele organizar la información en recursos, y cada uno de esos recursos cuenta con una URL específica. Tomando como ejemplo la API pública [{JSON} Placeholder](https://jsonplaceholder.typicode.com/) con datos *fake*, los recursos serían:

- [/users](https://jsonplaceholder.typicode.com/users): obtener todos los usuarios.
  - [/users/1](https://jsonplaceholder.typicode.com/users): obtener el usuario con ID 1.
- [/posts](https://jsonplaceholder.typicode.com/posts): obtener todos los *posts*
  - [/posts/1/comments](https://jsonplaceholder.typicode.com/posts/1/comments): obtener los comentarios del *post* con ID 1.
- [/comments](https://jsonplaceholder.typicode.com/comments): obtener todos los comentarios.

Normalmente las API públicas suelen tener un interfaz web con los modelos de datos y los métodos/recursos que podemos consumir. Lo habitual es que hagan uso de la especificación [OpenAPI](https://es.wikipedia.org/wiki/Especificaci%C3%B3n_OpenAPI). Por ejemplo:

- [Swagger](https://swagger.io/): interfaz web. Podemos ver un ejemplo en [OpenData Euskadi](https://opendata.euskadi.eus/api-culture/?api=culture_events#/).
- [Scalar](https://github.com/scalar/scalar): interfaz web más moderno.

<!-- TODO: quitar scalar? -->

## ¿Qué significa REST? {#qué-es-rest}

[REST](https://en.wikipedia.org/wiki/REST) (*Representational State Transfer*) es un estilo de diseño para crear servicios web. En una API REST cada recurso dispone de una dirección (URL) y se manipula mediante los métodos HTTP.

Los [métodos HTTP](https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Methods) que se utilizan para comunicarse con una API son los siguientes, aunque hay alguno más:

| Método | URL | Acción |
|--------|--------------|------------------------------|
| GET    | /users       | Devuelve todos los usuarios. |
| GET    | /users/15    | Devuelve el usuario con ID 15. |
| POST   | /users       | Crea un nuevo usuario. |
| PUT    | /users/15    | Sustituye un recurso existente. |
| PATCH  | /users/15    | Modifica parcialmente un recurso. |
| DELETE | /users/15    | Eliminar dicho usuario. |

Table: {tablename=yukitblr colspec=X[1,l]X[1,l]X[2,l]}

A Junio de 2026 existe una propuesta para un nuevo método [QUERY](https://http.dev/query) especificado en [RFC 10008](https://datatracker.ietf.org/doc/rfc10008/). Hay un vídeo explicativo de [[midudev](https://www.youtube.com/watch?v=b0oiR_UOvVg)]{.youtube} explicando cómo funcionará en el futuro.


# Consumo de una API REST completa {#consumo-api-rest}

Hasta este momento hemos aprendido a realizar peticiones HTTP mediante [fetch()]{.verbatim} y a procesar las respuestas utilizando promesas y [async]{.verbatim} / [await]{.verbatim}. Vamos a desarrollar un ejemplo completo que reúne los conceptos vistos previamente. Para ello utilizaremos la API pública [{JSON} Placeholder](https://jsonplaceholder.typicode.com/) y construiremos una pequeña aplicación capaz de:

- Obtener información del servidor.
- Mostrar los datos en una tabla HTML.
- Crear nuevos registros.
- Modificar registros existentes.
- Eliminar registros.

## Obtener datos con [GET]{.verbatim} {#obtener-datos-get}

Vamos a descargar la lista de usuarios, para ello se realiza una petición [fetch()]{.verbatim} como se ha visto previamente:

::: mycode
[Obtener usuarios]{.title}
```javascript
async function cargarUsuarios() {
    try {
        const respuesta = await fetch(
            "https://jsonplaceholder.typicode.com/users"
        );
        if (!respuesta.ok) {
            throw new Error("Error al obtener los usuarios.");
        }
        const usuarios = await respuesta.json();
        console.log(usuarios);
    }
    catch (error) {
        console.error(error);
    }
}
```
:::


## Mostrar datos {#mostrar-datos}

Una vez obtenidos los usuarios podemos recorrer el array e insertarlos dentro de una tabla HTML.


:::::::::::::: {.columns }
::: {.column width="40%"}

::: {.mycode size=footnotesize}
[Tabla HTML]{.title}
```html
<table>
  <thead>
    <tr>
      <th>Id</th>
      <th>Nombre</th>
      <th>Email</th>
    </tr>
  </thead>
  <tbody id="usuarios">
  </tbody>
</table>
```
:::

:::
::: {.column width="55%" }

::: {.mycode size=footnotesize}
[Insertar datos en tabla]{.title}
```javascript
for (const usuario of usuarios) {
  const fila = document.createElement("tr");
  // TODO: cambiar innerHTML por createElement
  fila.innerHTML = `
      <td>${usuario.id}</td>
      <td>${usuario.name}</td>
      <td>${usuario.email}</td>
  `;
  tbody.appendChild(fila);
}
```
:::

:::
::::::::::::::


## Crear un nuevo registro con [POST]{.verbatim} {#crear-registro}

Para crear un nuevo usuario debemos usar el método **POST**. Los datos los podemos obtener a través de un formulario ([convenientemente validado](#validación-javascript)).


::: {.mycode size=footnotesize}
[Insertar datos en tabla]{.title}
```javascript
const usuario = {
    name: "Alice",
    email: "alice@example.com"
};
const respuesta = await fetch(
    "https://jsonplaceholder.typicode.com/users",
    {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(usuario)
    }
);
```
:::

A continuación se explica la diferencia de este método [fetch()]{.verbatim} ya que es ligeramente diferente a lo visto anteriormente, ya que ahora recibe un segundo parámetro con [opciones](https://developer.mozilla.org/en-US/docs/Web/API/Window/fetch#options):

- **URL**: como se ha visto hasta ahora, hay que indicar la URL a la que realizaremos la petición.
- **[options]{.verbatim}**: un objeto con distintas opciones:
  - **[method]{.verbatim}**: método utilizado cuando se realice la petición, en este caso **POST**.
  - **[headers]{.verbatim}**: [cabeceras HTTP](https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Headers) que se pueden enviar al realizar la petición.
    - **[Content-Type]{.verbatim}**: el tipo de contenido que se va a enviar. Normalmente al usar APIs se usa JSON.
  - **[body]{.verbatim}**: el contenido que se envía junto a la petición, en este caso los datos de un nuevo usuario.

Los objetos JavaScript no pueden enviarse directamente mediante HTTP, primero deben convertirse en una cadena JSON. Por ello está la función [JSON.stringify()]{.verbatim} que convierte el objeto a formato JSON.


## Modificar un registro ([PUT]{.verbatim} / [PATCH]{.verbatim}) {#modificar-registro}

A la hora de modificar un registro de información podemos hacer uso de dos métodos:

- **PUT**: sustituye completamente el recurso.
- **PATCH**: permite modificar únicamente algunos campos.


:::::::::::::: {.columns columnsep="0.5cm"}
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[Método PUT]{.title}
```javascript
await fetch(
  "https://URL/users/3",
  {
    method: "PUT",
    headers: {
      "Content-Type":"application/json"
    },
    body: JSON.stringify({
      id:3,
      name:"María",
      email:"maria@example.com",
      // resto de campos
    })
  }
);
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[Método PATCH]{.title}
```javascript
await fetch(
  "https://URL/users/3",  
  {
    method: "PATCH",
    headers: {
      "Content-Type":"application/json"
    },
    body: JSON.stringify({
      email:"nuevo@email.com"
    })
  }
);
```
:::

:::
::::::::::::::

::: warnbox
[{JSON} Placeholder](https://jsonplaceholder.typicode.com/) no permite realizar modificaciones ni borrar datos, pero responderá correctamente a las peticiones.
:::

## Eliminar un registro con [DELETE]{.verbatim} {#eliminar-registro}

Para eliminar un recurso utilizamos el método HTTP **DELETE**. Si la operación finaliza correctamente, el recurso habrá sido eliminado.


::: mycode
[Método DELETE]{.title}
```javascript
await fetch(
    "https://jsonplaceholder.typicode.com/users/3",
    {
        method:"DELETE"
    }
);
```
:::

::: errorbox
En los últimos ejemplos no se ha utilizado [try...catch]{.verbatim} ni se ha comprobado el estado de la petición para simplificarlos, **pero deben usarse**.
:::

::: exercisebox
[[19b](https://github.com/yuki/ejercicios/blob/main/daw/dec/19b.html)]{.solution}

TODO: añadir todo el texto para el ejercicio.
:::


# Herramientas de desarrollo para APIs REST {#herramientas-desarrollo-APIs}

Hasta ahora hemos aprendido a realizar peticiones HTTP utilizando [fetch()]{.verbatim}. Sin embargo, cuando una aplicación no funciona correctamente, resulta imprescindible conocer qué está ocurriendo entre el navegador y el servidor.

## Herramientas de desarrolladores del navegador {#herramientas-navegador}

Todos los navegadores modernos incorporan un conjunto de herramientas conocidas como **Herramientas de desarrollo** (*Developer Tools* o simplemente *DevTools*).

Estas herramientas permiten inspeccionar el código HTML, las hojas de estilo CSS, el código JavaScript, las peticiones HTTP y el rendimiento de una página web. Nos vamos a centrar especialmente en la pestaña **Network**, ya que es una herramienta imprescindible para trabajar con APIs REST, ya que nos muestra todas las comunicaciones que realiza el navegador con los distintos servidores

Cada vez que una página descarga un archivo o realiza una petición HTTP aparecerá un nuevo registro. Por ejemplo:

- Una página HTML.
- Un archivo CSS.
- Un archivo JavaScript.
- Una imagen.
- Una fuente tipográfica.
- Una petición [fetch()]{.verbatim}.
- Una llamada AJAX.

### Información obtenida {#información-obtenida}

Cuando una aplicación no cargue datos, o devuelva errores o muestre información correcta es posible que en la pestaña *Network* veamos qué está sucediendo. Entre la información que nos muestra, podemos destacar:

- Método HTTP de la petición.
- Status: estado de la petición.
- Tipo de documento
- Quién ha inicializado la comunicación (puede aparecer la línea del HTML, del JavScript, o un CSS si es una imagen o una fuente).
- Tamaño de la respuesta.
- Tiempo empleado para procesar la respuesta.

Hay más columnas que podemos añadir y de esta manera obtener todavía más información.

### Filtrar resultados {#filtrar-resultados}

El navegador nos permite filtrar entre los tipos de peticiones y buscando por el nombre. A la hora de trabajar con APIs el filtro que nos interesa es "Fetch/XHR", que es la que mostrará sólo las peticiones realizadas por JavaScript.


### Inspección de peticiones HTTP {#inspección-peticiones}

Al seleccionar una petición aparecen varias pestañas con información detallada.

Las más importantes son:

- **Headers**: Contiene la información general de la petición. Se diferencia en los siguientes apartados:
  - **Response Headers**: En esta sección aparecen las cabeceras recibidas **desde el servidor**.
  - **Request Headers**: Las cabeceras **enviadas por el navegador**.
- **Payload**: Si la petición envía datos (por ejemplo mediante [POST]{.verbatim} o [PUT]{.verbatim}), podremos consultar exactamente qué información se ha enviado.
- **Preview**: Muestra la respuesta ya interpretada. Si es un HTML, el documento, si es una imagen, la propia imagen, o si es JSON, podemos verlo organizado.
- **Response**: Muestra el contenido exactamente como lo envía el servidor.



## Herramientas para probar APIs

Durante el desarrollo de una aplicación no siempre resulta práctico realizar las pruebas desde el navegador o desde la propia aplicación que estamos realizando. En muchas ocasiones es conveniente utilizar herramientas que permitan enviar peticiones HTTP directamente a una API y analizar las respuestas obtenidas.

Estas aplicaciones facilitan el envío de peticiones, permiten añadir cabeceras HTTP, parámetros, autenticación y visualizar de forma clara las respuestas del servidor, así como guardar las peticiones en colecciones por proyectos/*endpoints*.

Entre las aplicaciones existentes podemos destacar [Postman](https://www.postman.com/), Firecamp (versión [web](https://firecamp.dev/) o [escritorio](https://github.com/firecamp-dev/firecamp)), [Bruno](https://www.usebruno.com/) o [Insomnia](https://insomnia.rest/).


![](img/laravel/postman.png){width="70%"}


Desde una **consola Linux**, haciendo uso del comando **curl**, también podemos comprobar de manera rápida si el *endpoint* está funcionando:

::: mycode
[Uso de curl en consola]{.title}
```console
ruben@vega:~$ curl -s  http://localhost/api/posts
{"posts":[{"id":1,"titulo":"Primer post111","texto":"Este es...”}]}
```
:::

Si queremos tener un resultado más visual, podremos hacer uso del comando "**jq**", que deberemos instalarlo. De esta manera, podremos hacer:

::: mycode
[Uso de jq para formatear la salida]{.title}
```console
ruben@vega:~$ curl -s  http://localhost/api/posts | jq
{
  "posts": [
    {
      "id": 1,
      "titulo": "Primer post",
      "texto": "Este es el texto del primer post",
      "publicado": 1,
      "deleted_at": null,
      "created_at": "2024-10-29T17:09:56.000000Z",
      "updated_at": "2024-10-29T18:09:56.000000Z"
    }
  ]
}
```
:::

Aunque estas herramientas son muy útiles para desarrollar y depurar APIs, conviene recordar que no sustituyen a [fetch()]{.verbatim}. Su objetivo es comprobar que un servicio web funciona correctamente antes de integrarlo en nuestra aplicación JavaScript. Una vez verificada la API con estas herramientas, el siguiente paso consiste en acceder a ella desde nuestro código utilizando la **Fetch API**.

