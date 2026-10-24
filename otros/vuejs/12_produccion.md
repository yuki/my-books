
# Proceso de "compilación" {#proceso-compilación}

Durante el desarrollo de una aplicación Vue 3, utilizamos un **servidor de desarrollo** ([Vite](https://vite.dev/)) que permite visualizar los cambios prácticamente al instante. Sin embargo, este entorno está diseñado para facilitar la programación y la depuración, no para publicar la aplicación en Internet.

Antes de desplegar una aplicación, debemos preparar una versión optimizada para producción. Este proceso incluye la "compilación" de los archivos, la transformación del código, la optimización de los recursos y la generación de los archivos que finalmente se servirán al navegador.

En un proyecto Vue 3 creado con Vite, el proceso de "compilación" genera normalmente una carpeta llamada [dist/]{.configdir}, que contiene los archivos necesarios para ejecutar la aplicación en un **servidor web estático**.

## Desarrollo frente a producción {#desarrollo-frente-producción}

Para diferenciar entre desarrollo y producción sirva la siguiente tabla diferenciando distintas características

| Característica | Desarrollo | Producción |
|---|---|---|
| Objetivo | Facilitar la programación | Publicar la aplicación |
| Servidor | Servidor de desarrollo de Vite | Servidor web o alojamiento estático |
| Código | Preparado para desarrollar y depurar | Compilado y optimizado |
| Errores | Información detallada para depuración | Menos información de depuración |
| Recursos | Pueden servirse por separado durante el desarrollo | Se optimizan y empaquetan cuando corresponde |
| Rendimiento | Prioriza la rapidez durante el desarrollo | Prioriza la carga y ejecución eficientes |

Table: Comparativa entre desarrollo y producción {tablename=yukitblrcol colspec=X[1,l]X[2,l]X[2,l]}


La compilación no convierte Vue en una aplicación de servidor. En una aplicación Vue tradicional, el código se ejecuta principalmente en el navegador del usuario. El servidor web entrega los archivos HTML, CSS y JavaScript, y el navegador ejecuta la aplicación.

Por tanto, debemos distinguir entre **compilar una aplicación** y **desplegarla**:

- **Compilar:** generar los archivos preparados para producción.
- **Desplegar:** publicar esos archivos en un servidor o plataforma de alojamiento para que los usuarios puedan acceder a ellos.

Por ejemplo, podemos compilar una aplicación en nuestro ordenador y después subir el contenido de [dist/]{.configdir} a un servicio de alojamiento estático.

::: infobox
Normalmente se denomina **compilar** al proceso de traducir un código escrito en un lenguaje de programación a código máquina.
:::


# El comando [npm run build]{.verbatim} {#comando-npm-run-build}

En un proyecto Vue 3 creado con Vite, el archivo [package.json]{.configfile} suele incluir varios scripts para realizar las tareas habituales del proyecto.

Un ejemplo simplificado sería el siguiente:

::: mycode
[Scripts en package.json]{.title}

``` json
{
  "scripts": {
    "dev": "vite",
    "build": "vite build",
    "preview": "vite preview"
  }
}
```
:::

Cada comando tiene una finalidad diferente:

- [npm run dev]{.verbatim}: inicia el servidor de desarrollo.
- [npm run build]{.verbatim}: compila la aplicación para producción.
- [npm run preview]{.verbatim}: permite comprobar localmente la versión compilada.

## Compilar la aplicación {#compilar-aplicación}

Para generar la versión de producción, ejecutamos desde la terminal, en la carpeta raíz del proyecto:

::: mycode
["Compilar" proyecto]{.title}

``` bash
npm run build
```
:::

Vite analiza los archivos de la aplicación, procesa las dependencias y genera los recursos necesarios para su publicación.

Si la compilación finaliza correctamente, se crea la carpeta [dist/]{.configdir}, con una estructura similar a esta:

::: mycode
[Estructura de ficheros]{.title}

``` text
mi-aplicacion/
├── ...
└── dist/
    ├── index.html
    └── assets/
        ├── index-a1b2c3.js
        └── index-d4e5f6.css
```
:::

Los nombres de los archivos generados pueden variar. Es habitual que Vite incluya identificadores en los nombres de los recursos para facilitar su almacenamiento en caché y evitar problemas cuando se publica una versión nueva.

La carpeta [dist/]{.configdir} es el resultado que debemos publicar. **No es necesario subir [node_modules/]{.configdir} al alojamiento estático**, ya que las dependencias se incorporan al proceso de compilación según corresponda.


## Comprobar la versión compilada {#comprobar-versión-compilada}

Antes de desplegar la aplicación, podemos probar el resultado mediante:

::: mycode
[Comprobar versión compilada]{.title}

``` bash
npm run preview
```
:::

Vite inicia un servidor local que permite visualizar la versión generada en [dist/]{.configdir}. Este paso resulta útil para detectar errores que podrían no haberse apreciado durante el desarrollo. No obstante, [vite preview]{.verbatim} está pensado para comprobar la compilación localmente; **no sustituye a un servidor de producción**.

::: errorbox
[vite preview]{.verbatim} está pensado para comprobar la compilación localmente; **no sustituye a un servidor de producción**.
:::

Es importante recordar que modificar un archivo de [src/]{.configdir} después de compilar no actualiza automáticamente el contenido de [dist/]{.configdir}. Debemos ejecutar de nuevo [npm run build]{.verbatim} para generar una versión actualizada.


# Variables de entorno {#variables-entorno}

Las aplicaciones suelen necesitar valores de configuración que pueden variar según el entorno en el que se ejecutan. Por ejemplo:

- La dirección de una API REST.
- La URL de un servicio externo.
- Un indicador para activar o desactivar una funcionalidad.
- El modo de funcionamiento de la aplicación.

Podríamos escribir directamente esos valores en el código, pero eso dificultaría mantener configuraciones diferentes para desarrollo y producción.

Para resolver este problema, Vite permite utilizar **variables de entorno**.

## Archivos [.env]{.verbatim} {#archivos-env}

Podemos crear archivos de configuración en la raíz del proyecto:

::: mycode
[Estructura de ficheros]{.title}

``` text
mi-aplicacion/
├── .env
├── .env.development
├── .env.production
├── package.json
├── vite.config.js
└── src/
```
:::

Por ejemplo, el archivo [.env.development]{.configfile} podría contener [VITE_API_URL=http://localhost:3000/api]{.verbatim} mientras que en [.env.production]{.configfile} podría contener [VITE_API_URL=https://api.ejemplo.com]{.verbatim}. De esta forma, podemos utilizar una dirección distinta para la API según el entorno.

En un componente Vue, accederíamos al valor mediante [import.meta.env]{.verbatim}:

::: mycode
[Uso de variables de entorno]{.title}

```vue
<script setup>
const apiUrl = import.meta.env.VITE_API_URL

console.log(apiUrl)
</script>
```
:::

Vite carga los archivos de entorno correspondientes al modo de ejecución. Por defecto, [npm run dev]{.verbatim} utiliza el modo de desarrollo y [npm run build]{.verbatim} utiliza el modo de producción.

También podemos consultar información proporcionada por Vite:

::: mycode
[Uso de variables de entorno]{.title}

```javascript
console.log(import.meta.env.MODE)
console.log(import.meta.env.DEV)
console.log(import.meta.env.PROD)
```
:::

Estas propiedades permiten conocer el modo de ejecución y distinguir entre desarrollo y producción.

## El prefijo [VITE_]{.verbatim} {#prefijo-vite_}

Por defecto, Vite solo expone al código del cliente las variables de entorno que comienzan por el prefijo [VITE_]{.verbatim}. Por ejemplo:

::: mycode
[Variables de entorno]{.title}

``` text
VITE_API_URL=https://api.ejemplo.com
VITE_NOMBRE_APP=Gestor de tareas
DATABASE_PASSWORD=una-clave-secreta
```
:::

En el código del navegador podremos consultar:

::: mycode
[Uso de variables de entorno]{.title}

``` javascript
console.log(import.meta.env.VITE_API_URL)
console.log(import.meta.env.VITE_NOMBRE_APP)
```
:::

Sin embargo, [DATABASE_PASSWORD]{.verbatim} no estará disponible automáticamente mediante [import.meta.env]{.verbatim}.

::: warnbox
El prefijo [VITE_]{.verbatim} no convierte una variable en secreta. Los valores expuestos mediante este mecanismo pueden acabar incorporados al código JavaScript enviado al navegador y, por tanto, ser consultados por cualquier usuario.
:::

Nunca debemos incluir en las variables de entorno del cliente contraseñas de bases de datos, claves privadas, tokens secretos de servicios o credenciales que deban permanecer protegidas.

Si una operación necesita un secreto, debe realizarse en un servidor que controle ese secreto, no directamente en la aplicación Vue.

## Buenas prácticas con las variables de entorno {#buenas-prácticas-variables-entorno}

- Utilizar archivos diferentes para las configuraciones que cambian entre entornos.
- No guardar secretos en variables destinadas al navegador.
- No subir credenciales reales al repositorio.
- Documentar las variables necesarias para ejecutar el proyecto.
- Si se utiliza un archivo [.env.example]{.verbatim}, incluir nombres y valores ficticios, sin credenciales reales.
- Recordar que cambiar una variable de entorno normalmente requiere volver a compilar la aplicación para incorporar el nuevo valor al código generado.


# Configuración de Vite {#configuración-vite}

Vite permite [personalizar](https://vite.dev/config/) el proceso de desarrollo y compilación mediante el archivo [vite.config.js]{.configfile} o, en proyectos configurados con TypeScript, [vite.config.ts]{.configfile}.

Una configuración sencilla puede ser:

::: mycode
[Configuración del fichero vite.config.js]{.title}

``` javascript
import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'

export default defineConfig({
  plugins: [vue()]
})
```
:::

Vue permite añadir *[plugins](https://vite.dev/plugins/)*, y entre ellos está [@vitejs/plugin-vue]{.verbatim} que hace que Vite procese los componentes de archivo único de Vue, es decir, los archivos [.vue]{.configfile}.

## Configurar la ruta base de publicación {#configurar-ruta-base-aplicación}

Una de las opciones importantes para producción es [base]{.verbatim}. Indica la ruta pública desde la que se servirán los recursos de la aplicación.

Si publicamos la aplicación en la raíz de un dominio, como [https://ejemplo.com/]{.verbatim}, normalmente podemos utilizar la configuración predeterminada.

Sin embargo, si la aplicación se publica en una subruta, como [https://ejemplo.com/mi-aplicacion/]{.verbatim}, debemos configurar esa ruta base:

::: mycode
[Configuración del fichero vite.config.js]{.title}

``` javascript
import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'

export default defineConfig({
  plugins: [vue()],
  base: '/mi-aplicacion/'
})
```
:::

Esta configuración ayuda a Vite a generar correctamente las rutas a los archivos JavaScript, CSS y otros recursos durante la compilación. Si la ruta base es incorrecta, la página podría cargar el HTML, pero fallar al intentar descargar los recursos de la aplicación.

## Alias para organizar las importaciones {#alias-organizar-importaciones}

También podemos configurar alias para evitar rutas relativas largas. Por ejemplo, en un proyecto con la siguiente estructura:

:::::::::::::: {.columns}
::: {.column width="25%"}

::: {.mycode size=footnotesize}
[Estructura de ficheros]{.title}

``` text
src/
├── components/
├── views/
├── stores/
├── services/
└── main.js
```
:::

:::
::: {.column width="75%" }

::: {.mycode size=footnotesize}
[Configuración vite.config.js]{.title}

``` javascript
import { fileURLToPath, URL } from 'node:url'
import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'

export default defineConfig({
  plugins: [vue()],
  resolve: {
    alias: {
      '@': fileURLToPath(new URL('./src', import.meta.url))
    }
  }
})
```
:::

:::
::::::::::::::


De esta manera, se ha configurado el alias [@]{.verbatim} para referirnos a la carpeta [src/]{.configdir}. A partir de ese momento, en lugar de escribir:

:::::::::::::: {.columns columnsep=0.5cm}
::: {.column width="53%"}

::: {.mycode size=footnotesize}
[Import ruta relativa]{.title}

``` javascript
import MiComponente 
  from '../../components/MiComponente.vue'
```
:::

:::
::: {.column width="47%" }

::: {.mycode size=footnotesize}
[Import con alias]{.title}

``` javascript
import MiComponente 
  from '@/components/MiComponente.vue'
```
:::

:::
::::::::::::::



El alias mejora la legibilidad y facilita reorganizar los archivos. No es una medida de optimización por sí misma, sino una herramienta para mantener el proyecto organizado.


