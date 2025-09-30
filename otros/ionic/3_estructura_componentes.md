
# Esqueleto del proyecto

Al crear un proyecto con Ionic, se genera una estructura de directorios organizada. La más importante es la carpeta [src]{.configdir}, donde se encuentran los ficheros que vamos a desarrollar para la aplicación.

En la raíz del proyecto existen distintos ficheros que son habituales en otros proyectos modernos de desarrollo web, y otros que son específicos de Ionic.

::: exercisebox
Genera un nuevo proyecto de tipo "blank" para utilizar a partir de ahora.
:::

El fichero principal del proyecto es [ionic.config.json]{.configdir}, que de momento sólo contiene lo siguiente:

::: {.mycode}
[Fichero de configuración principal]{.title}

``` json
{
  "name": "Blank",
  "integrations": {
    "capacitor": {}
  },
  "type": "angular-standalone"
}
```
:::

No vamos a adentrarnos en el resto de momento, pero es interesante echarles un ojo, ya que el contenido puede darnos una idea de configuraciones globales utilizadas.


# Páginas y navegación entre vistas {#paginas-navegación}

En Ionic, cada **pantalla** de la aplicación es una **página**. Al crear una pantalla nueva se nos van a generar unos ficheros asociados a la misma.

## Crear una página {#crear-una-pagina}

Vamos a utilizar el asistente de generación de Ionic, para poder ver las distintas opciones que nos ofrece:

::: {.mycode}
[Crear pantalla nueva]{.title}

``` console
ruben@vega:~$ ionic generate
? What would you like to generate? page
? Name/path of page: contacto
> ng generate page contacto --project=app
CREATE src/app/contacto/contacto.page.scss (0 bytes)
CREATE src/app/contacto/contacto.page.html (306 bytes)
CREATE src/app/contacto/contacto.page.spec.ts (457 bytes)
CREATE src/app/contacto/contacto.page.ts (551 bytes)
UPDATE src/app/app.routes.ts (370 bytes)
[OK] Generated page!
```
:::

Al ejecutar [ionic generate]{.commandbox} el asistente nos pregunta qué queremos crear, donde hemos seleccionado la opción [page]{.verbatim}. Le hemos dado el nombre de la nueva página y se puede ver que ha generado unos ficheros.

::: infobox
El asistente utiliza por debajo el CLI de Angular (**ng**).
:::

Al crear la página nos genera un directorio con el nombre de la página, [src/app/contacto]{.configdir}, y dentro varios ficheros, con distintas extensiones:

- [page.scss]{.verbatim}: Estilos de la página en formato [SCSS](https://en.wikipedia.org/wiki/Sass_(style_sheet_language)) que posteriormente deben ser procesados para generar un CSS válido. Podemos generar CSS propio para cada página, para que de esta manera sea independiente a otras.
- [page.html]{.verbatim}: Es la plantilla de la página, en formato HTML.
- [page.spec.ts]{.verbatim}: Fichero para realizar pruebas unitarias.
- [page.ts]{.verbatim}: Realmente es un componente Angular, en el que se especifica los ficheros a utilizar y contiene la lógica del mismo. Al usarlo con Ionic, ha añadido ciertos *import* que no son habituales en Angular:

::: {.mycode}
[Fichero del módulo]{.title}
``` typescript
import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { IonContent, IonHeader, IonTitle, IonToolbar }
    from '@ionic/angular/standalone';

@Component({
  selector: 'app-contacto',
  templateUrl: './contacto.page.html',
  styleUrls: ['./contacto.page.scss'],
  standalone: true,
  imports: [IonContent, IonHeader, IonTitle, IonToolbar,
            CommonModule, FormsModule]
})
export class ContactoPage implements OnInit {
  constructor() { }
  ngOnInit() {
  }
}
```
:::


Al crear la página también ha modificado el fichero [src/app/app.routes.ts]{.configfile} añadiendo una nueva ruta. Más adelante hablaremos del sistema de rutas.

::: questionbox
¿Tenemos alguna página más en nuestro proyecto "blank"?
:::

::: exercisebox
Crea un componente. ¿Qué diferencias hay con la *page* recién creada?
:::


## Navegación básica entre páginas {#navegación-básica}

Para poder navegar entre páginas, vamos a modificar la primera vista [src/app/home/home.page.html]{.configdir} añadiendo un enlace a la página recién creada:

::: {.mycode}
[Añadir enlace a la nueva página]{.title}
``` html+ng2
<a href="/contacto">Contacto</a>
```
:::

::: exercisebox
Añade en la nueva página un enlace a la *home*.
:::

# Estilos y colores {#estilos-colores}

Ionic permite personalizar el aspecto de la aplicación usando **CSS utilities** y **variables globales**. Por defecto cuenta con un [estilo predeterminado](https://ionicframework.com/docs/theming/basics) que cuenta con colores y valores predefinidos, pero que podemos sobreescribir.

En el archivo [src/theme/variables.scss]{.configfile} podemos sobreescribir los valores de los colores principales:

::: {.mycode}
[Fichero del módulo]{.title}
``` scss
:root {
  --ion-color-primary: rgb(37, 219, 207);
  --ion-color-secondary: #3dc2ff;
  --ion-color-tertiary: #5260ff;
}
```
:::


