
# Introducción al almacenamiento en el navegador {#introducción-almacenamiento-navegador}

Hasta ahora, todas las aplicaciones desarrolladas han almacenado la información únicamente en memoria. Esto significa que, al cerrar la página o recargar el navegador, todos los datos desaparecen. Sin embargo, muchas aplicaciones necesitan conservar cierta información entre una sesión y la siguiente. Algunos ejemplos son:

- Mantener la sesión iniciada.
- Recordar el idioma elegido por el usuario.
- Guardar el tema claro u oscuro.
- Conservar el contenido de un carrito de la compra.
- Recordar el último documento abierto.

Para resolver este problema, los navegadores modernos ofrecen diferentes mecanismos de almacenamiento en el lado del cliente.

## ¿Cliente o servidor? {#cliente-o-servidor}

Es importante distinguir entre almacenar datos en el navegador y almacenarlos en un servidor.

- **Almacenamiento en el cliente**: Los datos permanecen en el dispositivo del usuario. Podemos elegir las siguientes opciones:
  - localStorage
  - sessionStorage
  - Cookies
- **Almacenamiento en el servidorLos**: Los datos se guardan en una base de datos o en otro sistema gestionado por el servidor.



+----------------+----------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------+
|                | Almacenamiento en Cliente                                                                          | Almacenamiento en servidor                                                                       |
+================+=======================================================================+============================+==================================================================================================+
| Ventajas       | ● Muy rápido.                                                   `<br>`{=html} `\linebreak`{=latex} | ● La información está disponible desde cualquier dispositivo. `<br>`{=html} `\linebreak`{=latex} |
|                | ● No necesita conexión a Internet.                              `<br>`{=html} `\linebreak`{=latex} | ● Mayor capacidad.                                            `<br>`{=html} `\linebreak`{=latex} |
|                | ● Reduce el número de peticiones al servidor.                                                      | ● Mayor control sobre la seguridad.                                                              |
+----------------+----------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------+
| Inconvenientes | ● Los datos pueden eliminarse desde el navegador.               `<br>`{=html} `\linebreak`{=latex} | ● Requiere conexión con el servidor.                          `<br>`{=html} `\linebreak`{=latex} |
|                | ● No se comparten automáticamente entre distintos dispositivos. `<br>`{=html} `\linebreak`{=latex} | ● Es más lento que el almacenamiento local.                   `<br>`{=html} `\linebreak`{=latex} |
|                | ● No deben utilizarse para información confidencial.                                               | ● Flujo más complejo.                                                                            |
+----------------+----------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------+

Table: {tablename=yukitblrcol colspec=X[2,l]X[5,l]X[5,l]}


## ¿Qué mecanismo elegir? {#qué-mecanismo-elegir}

No existe un único sistema válido para todas las situaciones, por lo que es necesario hacer un análisis de qué datos queremos guardar y cuándo queremos acceder a ellos, ya que cada sistema está pensado para un tipo de información diferente.

| Información | Mecanismo recomendado |
|--------------|----------------------|
| Preferencias del usuario | localStorage |
| Datos temporales | sessionStorage |
| Identificador de sesión | Cookie (normalmente creada por el servidor) |
| Información compartida entre dispositivos | Base de datos del servidor |


# Web Storage API {#web-storage-api}

La **[Web Storage API](https://developer.mozilla.org/en-US/docs/Web/API/Web_Storage_API)** es una interfaz proporcionada por todos los navegadores modernos que permite almacenar información mediante pares **clave-valor**. Está formada por dos objetos:

- [localStorage]{.verbatim}
- [sessionStorage]{.verbatim}

El funcionamiento de ambas es muy parecido, siendo la diferencia principal el tiempo durante el que permanecen almacenados los datos.


## Sistemas clave-valor {#clave-valor}

Un sistema **clave-valor** funciona a través de:

- **clave:**: es la manera de identificar el dato.
- **valor:**: contiene la información asociada, la información que nos interesa.

Hoy en día es un sistema muy utilizado, incluso en sistemas de bases de datos NoSQL. Por poner sólo unos ejemplos aparte de los sistemas que veremos después:

- **[Redis](https://redis.io/)**: Base de datos en memoria muy rápida, utilizada como caché, almacenamiento de sesiones y colas de mensajes.
- **[Valkey](https://valkey.io/)**: *Fork* de Redis por discrepancias por el cambio de licencia realizado en 2024.
- **[Memcached](https://www.memcached.org/)**: Sistema de almacenamiento en memoria basado en clave-valor, empleado principalmente para acelerar aplicaciones web almacenando datos temporales.
- **[DragonFlyDB](https://github.com/dragonflydb/dragonfly)**: sistema compatible con las anteriores.


## Datos que pueden almacenar {#tipos-datos-almacenar}

Tanto [localStorage]{.verbatim} como [sessionStorage]{.verbatim} almacenan únicamente **cadenas de texto**. Si queremos guardar números, arrays u objetos será necesario convertirlos previamente a formato JSON.

En la siguiente tabla podemos ver un resumen de las diferencias entre ambas


## Acceso desde "mismo origen" {#acceso-mismo-origen}

Los datos almacenados sólo son accesibles desde páginas que pertenezcan al mismo origen (*origin*). El origen está formado por:

- Protocolo ([http]{.verbatim} o [https]{.verbatim})
- Dominio
- Puerto

Por ejemplo, un dato almacenado desde "https://www.ejemplo.com" no podrá acceder a los datos almacenados por "https://midominio.com". Este comportamiento forma parte de la política de seguridad del navegador.


# Uso de [localStorage]{.verbatim} {#uso-localstorage}

La función [[localStorage]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/API/Window/localStorage) permite almacenar información de forma permanente en el navegador. Los datos permanecerán disponibles incluso después de cerrar el navegador o apagar el ordenador. Solo desaparecerán cuando:

- El usuario los elimine manualmente.
- El programa los elimine.
- Se limpien los datos del navegador.

## Guardar información {#localstorage-guardar}

Para guardar un dato debemos usar la función [.setItem]{.verbatim}, que recibe dos parámetros: la clave y el valor. El valor **siempre se guardará como texto**, aunque sea un número.

::: mycode
[Guardar información con localStorage]{.title}
```javascript
localStorage.setItem("nombre", "Alice");
localStorage.setItem("edad", 20); // "20"
```
:::

Si queremos guardar un objeto deberemos guardarlo en formato JSON con [JSON.stringify()]{.verbatim}, porque de no ser así, no se guardarán los datos:

::: mycode
[Guardar información con localStorage]{.title}
```javascript
const alumno = {
    nombre: "Bob",
    edad: 20
};
// Esto guardará "[object Object]"
localStorage.setItem("alumno", alumno);
// forma correcta
localStorage.setItem("alumno", JSON.stringify(alumno));
```
:::

::: errorbox
Si queremos guardar un objeto debemos guardarlo en formato JSON usando [JSON.stringify()]{.verbatim}.
:::


Si volvemos a usar la función con la misma clave, sobrescribirá el dato existente.

::: errorbox
Si usamos la misma clave sobreescribirá el dato existente.
:::

Si ahora vamos a la pestaña "Application" o "Almacenamiento" dentro de las herramientas del desarrollador del navegador, veremos que tenemos una sección de almacenamiento local con el valor:

![localStorage en Chrome y Firefox](img/dec/local-storage.png){width="100%" framed=true}

## Leer información {#localstorage-leer}

Para leer la información **es necesario conocer la clave**:

::: mycode
[Leer información con localStorage]{.title}
```javascript
localStorage.getItem("nombre");

// para un objeto
const texto = localStorage.getItem("alumno");
const alumno = JSON.parse(texto);
console.log(alumno.nombre);
```
:::

Si queremos leer y obtener un objeto **tenemos que parsear el texto JSON** guardado previamente. Para ello se usa la función [JSON.parse()]{.verbatim} que nos devolverá un objeto. Después ya podremos usar el objeto.

::: warnbox
Para obtener un objeto debemos usar [JSON.parse()]{.verbatim} con el texto leído.
:::


## Eliminar información {#localstorage-eliminar}

De nuevo, para borrar un dato necesitamos conocer la clave.

::: mycode
[Borrar información con localStorage]{.title}
```javascript
localStorage.removeItem("nombre");
```
:::

Si queremos eliminar toda información tenemos la función [clear()]{.verbatim}. Sólo borrará la información para ese origen, pero debe usarse con cuidado.

::: mycode
[Borrar información con localStorage]{.title}
```javascript
localStorage.clear();
```
:::

::: warnbox
[clear()]{.verbatim} sólo borra información para ese origen, pero hay que usarlo con cuidado.
:::

## Obtener número de elementos {#localstorage-length}

Podemos obtener cuántos elementos tenemos guardados para el origen en el que nos encontramos:

::: mycode
[Obtener número de elementos localStorage]{.title}
```javascript
localStorage.length;
```
:::

## Obtener claves {#localstorage-claves}

Sabiendo el número de elementos podemos recorrer las claves que tenemos guardadas, u obtener el nombre de ellas junto con el valor.

::: mycode
[Obtener claves de localStorage]{.title}
```javascript
console.log(localStorage.key(0));

for (let i = 0; i < localStorage.length; i++) {
    const clave = localStorage.key(i);
    const valor = localStorage.getItem(clave);
    console.log(clave, valor);

}
```
:::


::: exercisebox
[[20a](https://github.com/yuki/ejercicios/blob/main/daw/dec/20a.html)]{.solution}

Usa las funciones vistas previamente de [localStorage]{.verbatim} para guardar y obtener datos y objetos.
:::


# Uso de [sessionStorage]{.verbatim} {#uso-sessionStorage}

[sessionStorage]{.verbatim} funciona prácticamente igual que [localStorage]{.verbatim}, siendo la principal diferencia que la información únicamente permanece disponible durante la sesión actual del navegador. Cuando la pestaña o ventana se cierra, todos los datos desaparecen automáticamente.

::: warnbox
Con [sessionStorage]{.verbatim} los datos desaparecen al cerrar la pestaña o ventana.
:::


Podemos usar [sessionStorage]{.verbatim} para:

- Datos de un asistente de varios pasos.
- Información temporal durante una compra.
- Resultados de una búsqueda.
- Filtros temporales.
- Datos intermedios de un formulario.
- Preferencias que sólo deben mantenerse durante la sesión.


## Guardar información {#sessionStorage-guardar}

Funciona igual que lo visto previamente.


::: mycode
[Guardar dato con sessionStorage]{.title}
```html
sessionStorage.setItem("pagina","inicio");
```
:::


## Leer información {#sessionStorage-leer}

Para leer la información **es necesario conocer la clave**:

::: mycode
[Leer información con sessionStorage]{.title}
```javascript
sessionStorage.getItem("nombre");
```
:::


## Eliminar información {#sessionStorage-eliminar}

De nuevo, para borrar un dato necesitamos conocer la clave.

::: mycode
[Borrar información con sessionStorage]{.title}

```javascript
sessionStorage.removeItem("nombre");
// borrar todos
sessionStorage.clear();
```
:::



# Cookies {#cookies}

Las **cookies** son pequeños fragmentos de información que un sitio web puede almacenar en el navegador del usuario. A diferencia de [localStorage]{.verbatim} y [sessionStorage]{.verbatim}, **las cookies se envían automáticamente al servidor en cada petición HTTP realizada al mismo dominio**. Una *cookie* también almacena información mediante pares **clave-valor**.

::: infobox
Las cookies se envían automáticamente al servidor en cada petición HTTP realizada al mismo dominio.
:::

El uso principal de las cookies es:

- Mantener una sesión iniciada.
- Recordar un identificador de usuario.
- Guardar preferencias sencillas.
- Almacenar información que también necesita el servidor.


Las cookies se utilizan desde los primeros años de la Web y continúan siendo un mecanismo fundamental hoy día. Cada cookie suele tener información adicional como:

- Fecha de expiración.
- Dominio.
- Ruta.
- Opciones de seguridad.

Cuando un servidor envía una cookie al navegador, ésta queda almacenada. En las siguientes peticiones HTTP al mismo sitio web, el navegador enviará automáticamente dicha cookie.

Aunque [localStorage]{.verbatim} y [sessionStorage]{.verbatim} son más modernos y sencillos de utilizar, las cookies siguen siendo imprescindibles porque son el único mecanismo de los tres que el navegador envía automáticamente al servidor con cada petición HTTP. Gracias a ello, el servidor puede reconocer al usuario sin necesidad de que el código JavaScript añada esa información manualmente.


## Crear una cookie {#crear-cookie}

Las cookies pueden crearse desde JavaScript mediante la propiedad [[document.cookie]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/API/Document/cookie). Para modificar una cookie sólo hay que volver a crearla utilizando la misma clave.


::: mycode
[Crear cookie]{.title}
```javascript
document.cookie = "usuario=Alice";
document.cookie = "tema=oscuro";
document.cookie = "idioma=es";
```
:::

Una vez ejecutado, el navegador almacenará la cookie y podremos verlas a través de las herramientas del desarrollador:

![Vista de las cookies](img/dec/cookie.png){width="100%" framed=true}


## Leer las cookies {#leer-cookie}

Para leer una cookie podemos acceder usando [document.cookie]{.verbatim}. Si tenemos más de una cookie, se concatenarán con un punto y coma ";".

::: mycode
[Leer cookie]{.title}
```javascript
console.log(document.cookie);
// tema=oscuro; idioma=es; usuario=Alice
```
:::

## Eliminar una cookie {#eliminar-cookie}

No existe un método específico para eliminar una cookie. Lo habitual es crearla de nuevo indicando una fecha de expiración ya pasada y de esta manera el navegador la eliminará.


::: mycode
[Modificar fecha de expiración para borra cookie]{.title}
```javascript
document.cookie = "tema=; expires=Thu, 01 Jan 1970 00:00:00 UTC";
```
:::

## Fecha de expiración {#fecha-expiración}

Si no indicamos ninguna fecha de expiración, la cookie será una **cookie de sesión**, por lo que desaparecerá al cerrar el navegador. Si queremos que  permanezca durante un tiempo determinado debemos indicar el tiempo de alguna de estas maneras:

- **[max-age]{.verbatim}**: tiempo máximo en segundos de la cookie.
- **[expires]{.verbatim}**: cuándo va a caducar la cookie, en formato [UTC](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date/toUTCString).


::: mycode
[Añadir fecha expiración]{.title}
```javascript
document.cookie = "usuario=Alice; max-age=86400";
document.cookie = "tema=oscuro; expires=Tue, 31 Dec 2030 23:59:59 GMT";
```
:::

## Atributos importantes {#atributos-cookies}

Las cookies admiten varios atributos que podemos ver en la [documentación](ps://developer.mozilla.org/en-US/docs/Web/API/Document/cookie). Los más utilizados son:

| Atributo | Función |
|----------|---------|
| `expires` | Fecha de expiración. |
| `max-age` | Tiempo de vida en segundos. |
| `path` | Ruta donde estará disponible la cookie. |
| `domain` | Dominio autorizado. |
| `Secure` | Solo se enviará mediante HTTPS. |
| `SameSite` | Limita cuándo se envía la cookie para mejorar la seguridad. |


## Limitaciones de las cookies {#limitaciones-cookies}

Las cookies presentan algunas limitaciones importantes.

- Su tamaño es reducido (aproximadamente 4 KB por cookie).
- Se envían automáticamente en todas las peticiones HTTP.
- Un uso excesivo puede aumentar ligeramente el tráfico de red.

Por estos motivos no son adecuadas para almacenar grandes cantidades de información.


# Comparativa entre localStorage, sessionStorage y cookies {#comparativa}

Tal como se ha visto, los navegadores modernos ofrecen varios mecanismos para almacenar información, y cada uno de ellos presenta ventajas e inconvenientes. Conocer sus diferencias permite elegir la solución más adecuada en cada situación.

Sirva la siguiente tabla como resumen:

|                | localStorage | sessionStorage | Cookies |
|----------------|--------------|----------------|----------|
| Persistencia | Permanente | Solo durante la sesión | Configurable |
| Tamaño aproximado | 5-10 MB | 5-10 MB | 4 KB |
| Se envía automáticamente al servidor | No | No | Sí |
| Accesible desde JavaScript | Sí | Sí | Sí (salvo cookies [HttpOnly]{.verbatim}) |
| Compartido entre pestañas | Sí | No | Sí |

Table: {tablename=yukitblrcol colspec=XXXX}



# Seguridad {#seguridad}

Ninguno de estos mecanismos debe utilizarse para almacenar información confidencial. Por lo que **nunca** debería usarse para almacenar datos del estilo:

- Contraseñas.
- Números de tarjetas bancarias.
- Información personal sensible.
- Claves privadas.

Por este motivo, las aplicaciones profesionales almacenan la información realmente importante en el servidor y utilizan mecanismos adicionales de protección.

Ya se ha comentado previamente que los navegadores aplican la **Same-Origin Policy (SOP)**, una política de seguridad que impide que una página web acceda directamente a los datos almacenados por otra página de un dominio diferente.No obstante, esta protección no hace que los datos sean completamente inaccesibles. Si el equipo del usuario resulta infectado por un programa malicioso, una extensión del navegador obtiene permisos excesivos o un atacante consigue ejecutar código dentro del propio sitio web (por ejemplo, mediante un ataque [XSS](https://es.wikipedia.org/wiki/Cross-site_scripting)), podría acceder a la información almacenada por ese dominio.

Noticias en los últimos años al respecto usando *[session hijacking](https://es.wikipedia.org/wiki/Secuestro_de_sesi%C3%B3n)*:

- [Campaña con malware para robar las cookies a creadores de Youtube](https://blog.google/threat-analysis-group/phishing-campaign-targets-youtube-creators-cookie-theft-malware/).
- [El canal de Linus Tech Tips secuestrado usando tokens de sesión](https://www.theverge.com/2023/3/24/23654996/linus-tech-tips-channel-hack-session-token-elon-musk-crypto-scam)
- [Borran los vídeos de Ibai Llanos](https://cadenaser.com/nacional/2023/06/11/hackean-el-canal-de-ibais-llanos-en-youtube-borran-todos-sus-videos-y-dejan-reproduciendose-en-bucle-un-curioso-video-cadena-ser/)

