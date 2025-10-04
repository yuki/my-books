
# Esqueleto del proyecto

Al crear un proyecto con Ionic, se genera una estructura de directorios organizada. La más importante es la carpeta [src]{.configdir}, donde se encuentran los ficheros que vamos a desarrollar para la aplicación.

En la raiz del proyecto existen distintos ficheros que son habituales en otros proyectos modernos de desarrollo web, y otros que son específicos de Ionic.

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


# Páginas y navegación entre vistas {#paginas-navegacion}

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


## Navegación básica entre páginas {#navegacion-basica}

Para poder navegar entre páginas, vamos a modificar la primera vista [src/app/home/home.page.html]{.configdir} añadiendo un enlace a la página recién creada:

::: {.mycode}
[Añadir enlace a la nueva página]{.title}
``` html
<a href="/contacto">Contacto</a>
```
:::

::: exercisebox
Añade en la nueva página un enlace a la *home*.
:::


# Componentes UI básicos {#componentes-ui-basicos}

Para poder realizar nuestra aplicación Ionic nos proporciona una [colección de componentes UI](https://ionicframework.com/docs/components) que se adaptará al tipo de dispositivo en el que nos encontremos.

Para cada componente se explica cómo utilizarlo (pudiendo elegir el *framework* correspondiente) y también con una previsualización de cómo quedaría en su correspondiente sistema.


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


# Ejemplo de componente y tema {#ejemplo-toggle-dark}

A modo de ejemplo se va a explicar cómo añadir a la vista *home* un *toggle* para alternar el tema entre modo claro y oscuro, basado en la [documentación](https://ionicframework.com/docs/theming/dark-mode).

Lo primero es añadir el ***toggle*** a la vista [src/app/contacto/contacto.page.html]{.configdir}:

::: {.mycode}
[Añadir toggle a la vista]{.title}
``` ng2
<ion-list [inset]="true">
  <ion-item>
    <ion-toggle (ionChange)="toggleChange($event)" 
                justify="space-between">
      Dark Mode
    </ion-toggle>
  </ion-item>
</ion-list>
```
:::


::: warnbox
Cuidado al copiar-pegar código, ya que no se realizan los *imports*, y dará error.
:::

Nos aseguramos que en el fichero [src/app/contacto/contacto.page.ts]{.configdir} se han añadido los *imports* correspondientes a cada componente nuevo que estamos utilizando, y aparte añadimos la lógica necesaria:

::: {.mycode size=small}
[Añadir lógica]{.title}
``` typescript
export class HomePage {
  paletteToggle = false;
  constructor() {}

  // Check/uncheck the toggle and update the palette based on isDark
  initializeDarkPalette(isDark: boolean) {
    this.paletteToggle = isDark;
    this.toggleDarkPalette(isDark);
  }

  // Add or remove the "ion-palette-dark" class on the html element
  toggleDarkPalette(shouldAdd: boolean) {
    document.documentElement.classList.toggle('ion-palette-dark', shouldAdd);
  }

  // Listen for the toggle check/uncheck to toggle the dark palette
  toggleChange(event: CustomEvent) {
    this.toggleDarkPalette(event.detail.checked);
  }
}
```
:::

Sólo nos queda modificar cómo vamos a hacer uso del sistema *dark mode*, ya que en Ionic existen tres modos distintos:

- **[always](https://ionicframework.com/docs/theming/dark-mode#always)**: nuestra aplicación siempre estará en modo oscuro.
- **[system](https://ionicframework.com/docs/theming/dark-mode#system)**: tiene en cuenta el modo en el que se encuentra nuestro sistema.
- **[class](https://ionicframework.com/docs/theming/dark-mode#css-class)**: usando una clase CSS, apropiada para el caso que nos ocupa.


Para modificar este comportamiento debemos comprobar el fichero [src/global.css]{.configfile} y asegurar que descomentamos el fichero adecuado.


::: {.mycode}
[Añadir lógica]{.title}
``` scss
//  @import "@ionic/angular/css/palettes/dark.always.css"; 
@import "@ionic/angular/css/palettes/dark.class.css";
// @import '@ionic/angular/css/palettes/dark.system.css';
```
:::


:::::::::::::: {.columns }
::: {.column width="15%"}
:::
::: {.column width="30%" }
![](img/ionic/ejemplo_toggle_dark_mode_1.png){width="100%" framed=true}
:::
::: {.column width="10%"}
:::
::: {.column width="30%" }
![](img/ionic/ejemplo_toggle_dark_mode_2.png){width="100%" framed=true}
:::
::: {.column width="15%"}
:::
::::::::::::::

::: center
[Cómo quedan las modificaciones realizadas]{.footnotesize}
:::


