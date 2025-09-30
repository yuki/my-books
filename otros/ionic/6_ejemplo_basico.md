
# Componentes UI básicos {#componentes-ui-básicos}

Para poder realizar nuestra aplicación Ionic nos proporciona una [colección de componentes UI](https://ionicframework.com/docs/components) que se adaptará al tipo de dispositivo en el que nos encontremos.

Para cada componente se explica cómo utilizarlo (pudiendo elegir el *framework* correspondiente) y también con una previsualización de cómo quedaría en su correspondiente sistema.

# Ejemplo de componente y tema {#ejemplo-toggle-dark}

A modo de ejemplo se va a explicar cómo añadir a la vista *home* un *toggle* para alternar el tema entre modo claro y oscuro, basado en la [documentación](https://ionicframework.com/docs/theming/dark-mode).

Lo primero es añadir el ***toggle*** a la vista [src/app/contacto/contacto.page.html]{.configdir}:

::: {.mycode}
[Añadir toggle a la vista]{.title}
``` html+ng2
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


