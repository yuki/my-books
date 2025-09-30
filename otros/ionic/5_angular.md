
# Introducción {#introducción-angular}

**[Angular](https://angular.dev/)** es un *framework* desarrollado por **Google** para crear aplicaciones web de tipo ***single-page*** basadas en componentes. A veces también se llama "Angular 2+" debido a que la primera versión de Angular, nombrada AngularJS, usaba JavaScript como lenguaje.

Las **SPA** (*single-page applications*) permiten que el usuario interactúe con la aplicación reescribiendo la web actual, o partes, con datos obtenidos del servidor. De esta manera, permite construir interfaces dinámicas, estructuradas y mantenibles usando **TypeScript** como lenguaje principal.


## Arquitectura básica de Angular {#arquitectura-básica-angular}
Una aplicación Angular se compone principalmente de:

- **Componentes** ([Component]{.verbatim}): representan las pantallas o partes visuales. En la [documentación oficial](https://angular.dev/guide/components) existe mucha información acerca de cómo funcionan, por lo que es recomendable ir a ella para ver todos los detalles.
- **Servicios** ([Service]{.verbatim}): contienen la lógica o manipulan datos.
- **Plantillas (*templates*)**: definen el HTML de cada componente.
- **Rutas (*Routing*)**: gestionan la navegación entre páginas.

Estos elementos trabajan juntos siguiendo el patrón **MVC** (Modelo - Vista - Controlador) adaptado al entorno web.

En las últimas versiones de Angular los componentes por defecto son *standalone* (facilita la migración a otras aplicaciones) mientras que anteriormente eran de tipo **NgModule**.


## Ciclo de vida de un componente
Cada componente Angular pasa por una serie de fases o *hooks* desde que se crea hasta que se destruye, lo que es conocido como el [*lifecycle* del componente](https://angular.dev/guide/components/lifecycle).

Vamos a especificar los puntos más importantes del mismo:


| Hook | Cuándo se ejecuta | Uso principal |
|-------|--------------------|---------------|
| [constructor]{.verbatim} | Al crearse el componente | La función estándar de la clase TypeScript |
| [ngOnInit()]{.verbatim} | Al inicializar el componente | Cargar datos o inicializar variables. Sólo se ejecuta una vez, antes de inicializar el *template*. |
| [ngOnChanges()]{.verbatim} | Cuando cambian propiedades de entrada ([@Input]{.verbatim}) | Reaccionar a cambios desde el componente padre. |
| [ngOnDestroy()]{.verbatim} | Antes de eliminar el componente (ocultarse o navegar a otra página) | Limpiar recursos o detener suscripciones.  |

Table: {tablename=yukitblr colspec=X[2]X[3]X[3]}


El ciclo de vida varía ligeramente al crearse el componente o durante sus actualizaciones posteriores. La explicación para todos los *hooks* se pueden encontrar en la [documentación oficial](https://angular.dev/guide/components/lifecycle).

:::::::::::::: {.columns }
::: {.column width="44%" }
![](img/ionic/angular-lifecycle.png){width=100%}
:::
::: {.column width="44%" }
![](img/ionic/angular-lifecycle2.png){width=100%}
:::
::::::::::::::

::: center
[*Lifecycle* de componente. Fuente: [Angular.dev](https://angular.dev/guide/components/lifecycle) ]{.footnotesize}
:::


# Vistas con plantillas {#vistas-con-plantillas}

Angular usa un **sistema de enlace de datos (*data binding*)** que permite conectar la lógica con la vista, pudiendo mostrar variables en la vista o llamar a funciones de la clase desde la vista.

Desde **Angular 16**, para las variables que van a cambiar en el tiempo, se hace uso de [signals](https://angular.dev/guide/signals) para rastrear cómo y dónde se cambian los estados de una aplicación. De esta manera el *framework* optimiza las actualizaciones en el renderizado de las vistas.

Las [signals]{.verbatim} pueden contener cualquier tipo de dato, que puede ser leído a través de la función *getter*, y pueden ser tanto de lectura-escritura o de sólo lectura.

## Interpolación {#variables-vista}

De esta manera podemos mostrar de manera sencilla las propiedades de un componente en su vista (*template*).


:::::::::::::: {.columns }
::: {.column width="44%" }

::: {.mycode size=footnotesize}
[Modificar home.page.ts]{.title}
``` typescript
export class HomePage {
  contador = signal(0);
  constructor() {}
}
```
:::

:::
::: {.column width="44%" }

::: {.mycode size=footnotesize}
[Modificar home.page.html]{.title}
``` html+ng2
<p>Valor: {{contador()}}</p>
```
:::

:::
::::::::::::::


## Propiedades y atributos dinámicos {#propiedades-dinámicas}

Para poder modificar propiedades y atributos del DOM (*Document Object Model*) del *template* HTML, debemos especificarlo entre corchetes [[]]{.verbatim}. En el siguiente ejemplo el botón va a aparecer como deshabilitado debido a que así se ha especificado desde la clase.

:::::::::::::: {.columns }
::: {.column width="44%" }

::: {.mycode size=footnotesize}
[Modificar home.page.ts]{.title}
``` typescript
export class HomePage {
  public isDisabled = signal(false);
  constructor() {}
}
```
:::

:::
::: {.column width="44%" }

::: {.mycode size=footnotesize}
[Modificar home.page.html]{.title}
``` html+ng2
<ion-button 
  [disabled]="isDisabled()">
    Pulsa
</ion-button>
```
:::

:::
::::::::::::::

## *Event listeners* {#event-listeners}

Para manejar interacción desde la vista, a través d un *event binding*, podemos llamar a un método de la clase desde la vista, de esta manera se permite la interacción del usuario.

Siguiendo con el ejemplo anterior, se va a crear otro botón que al pulsarlo modifique la propiedad de la clase que hacía que estuviese deshabilitado.

:::::::::::::: {.columns }
::: {.column width="44%" }

::: {.mycode size=footnotesize}
[Modificar home.page.ts]{.title}
``` typescript
incrementar() {
  this.contador.update((n) => n + 1);
}
```
:::

:::
::: {.column width="44%" }

::: {.mycode size=footnotesize}
[Modificar home.page.html]{.title}
``` html+ng2
<ion-button (click)="incrementar()">
    Incrementar
</ion-button>
```
:::

:::
::::::::::::::

<!-- TODO: two-way binding -->


## Control de datos {#control-de-datos}

En las vistas también podremos realizar un control de los datos que se visualizan.

### Condicionales {#angular-condicionales}

Para poder controlar qué se visualiza en la vista, al igual que sucede en el *backend*, se puede realizar un control condicional con [@if]{.verbatim},[@else]{.verbatim} o [@else if]{.verbatim}. También existe el bloque [[@switch]{.verbatim}](https://angular.dev/guide/templates/control-flow#conditionally-display-content-with-the-switch-block) para condicionales de muchas opciones.

:::::::::::::: {.columns }
::: {.column width="44%" }


::: {.mycode size=footnotesize}
[Control en la vista]{.title}
``` html
@if (isGod()) {
  <h2>God settings</h2>
  <!-- ... -->
} @else if (isAdmin()){
  <h2>Admin settings</h2>
  <!-- ... -->  
} @else{
  <h2>User settings</h2>
  <!-- ... -->  
}
```
:::

:::
::: {.column width="44%" }

::: {.mycode size=footnotesize}
[Control en la vista]{.title}
``` typescript
@switch (userPermissions) {
  @case ('admin') {
    <app-admin-dashboard />
  }
  @case ('reviewer') {
    <app-reviewer-dashboard />
  }
  @case ('editor') {
    <app-editor-dashboard />
  }
  @default {
    <app-viewer-dashboard />
  }
}
```
:::

:::
::::::::::::::


::: errorbox
En versiones antiguas de Angular existían [NgIf]{.verbatim} y [NgFor]{.verbatim}, pero están **obsoletas**. 
:::

Para realizar repeticiones en la vista, como en el caso de una lista, podemos hacer uso del bucle [@for]{.verbatim}. En la [documentación](https://angular.dev/api/core/@for#index-and-other-contextual-variables) nos muestra que en el bucle podemos hacer uso de variables implícitas que siempre están disponibles como:

- [$count]{.verbatim}: Número de items en la colección que estamos iterando.
- [$index]{.verbatim}: Índice actual de la lista (empieza en [0]{.verbatim}).
- [$first]{.verbatim}: [True]{.verbatim} si el elemento actual es el primero de la lista.
- [$last]{.verbatim}: [True]{.verbatim} si el elemento actual es el último.
- [$even]{.verbatim}: [True]{.verbatim} si el índice actual es impar.
- [$odd]{.verbatim}: [True]{.verbatim} si el índice actual es par.

:::::::::::::: {.columns }
::: {.column width="44%" }

::: {.mycode size=footnotesize}
[Modificar home.page.ts]{.title}
``` typescript
frutas = ['Manzana', 'Pera', '
        Naranja', 'Banana', 
        'Kiwi'];
```
:::

:::
::: {.column width="44%" }

::: {.mycode size=footnotesize}
[Modificar home.page.html]{.title}
``` html
@for (fruta of frutas; track fruta; 
      let idx = $index) {
  <p class="{{$even ? 'even':''}}">
    {{fruta}} + {{idx}}
  </p>
}
```
:::

:::
::::::::::::::

La palabra reservada [track]{.verbatim} sirve para generar una **clave única** para cada elemento de la colección. De esta manera cuando la colección cambie Angular tendrá un sistema eficiente para actualizar el DOM.


## *Pipes* {#angular-pipes}

Las *pipes* (o "tuberías") son un operador especial que se puede usar en las vistas para transformar datos de manera declarativa. Existen [funciones ya predefinidas](https://angular.dev/guide/templates/pipes#built-in-pipes) y podemos crear nuestras funciones. Este sistema está basado en los *[pipes](https://en.wikipedia.org/wiki/Pipeline_(Unix))* de Unix y su caracter "[|]{.verbatim}".


::: {.mycode}
[Uso de pipes en la vista]{.title}
``` html+ng2
<p>{{"2025-01-01" | date}}</p> <!--Jan 1, 2025 -->
<p>{{ 1234 | number:'1.4' }}</p> <!--1,234.0000 -->
<p>{{ 1234 | currency:'EUR' }}</p> <!--€1,234.00 -->
```
:::

::: warnbox
Hay que realizar los imports correspondientes.
:::


## Variables {#variables-en-template}

Podemos crear [variables en la vista](https://angular.dev/guide/templates/variables) para poder ser usadas, y así quizá favorecer la sintaxis. Para poder declarar la variable se hará uso de [@let]{.verbatim}.

::: {.mycode}
[Uso de variables en la vista]{.title}
``` xml
@let i = 1;
<p>{{i+i}}</p> <!--2 -->
```
:::


# Uso de componentes {#uso-componentes}

Para visualizar un componente creado debemos añadirlo a la vista donde queramos que aparezca, pudiendo ser la vista principal o la de otro componente.

Para añadirlo, usaremos el nombre que le hayamos dado en el apartado ***selector*** al componente, y lo añadiremos como una etiqueta HTML más.

::: {.mycode}
[Añadir un componente a una vista]{.title}
``` xml
<app-contacto />
```
:::

::: infobox
Es conveniente pensar nuestra aplicación diferenciando componentes, de esta manera los podremos reutilizar en caso de que sea necesario.
:::

## Recibir parámetros {#recibir-parámetros-componente}

Imaginemos que tenemos una aplicación que contiene varios listados, que por aspecto visual son iguales. Podemos generar un único componente que reciba la lista como parámetro y la visualice por pantalla. De esta manera, no duplicaremos código, y si queremos cambiar todos los listados, sólo debemos cambiar un único componente.


Generamos los datos en el componente padre y llamamos al componente hijo pasándole el listado como parámetro:

:::::::::::::: {.columns }
::: {.column width="44%" }

::: {.mycode size=footnotesize}
[Modificar home.page.ts]{.title}
``` typescript
export class HomePage {
  listado = [1, 2, 3];
  constructor() {}
}
```
:::

:::
::: {.column width="44%" }

::: {.mycode size=footnotesize}
[Modificar home.page.html]{.title}
``` html+ng2
<app-listado [lista]="listado"/>
```
:::

:::
::::::::::::::


Y ahora en el componente hijo, que hemos llamado "**app-listado**", debemos leer el parámetro mediante [input()]{.verbatim}, indicando el tipo de datos que esperamos recibir, en este caso [number[]]{.verbatim}.

Puede ser interesante inicializar el valor, de ahí que dentro del [input()]{.verbatim} hayamos puesto [[3,2,1]]{.verbatim}, por si no recibe el parámetro desde el padre.

:::::::::::::: {.columns }
::: {.column width="44%" }

::: {.mycode size=footnotesize}
[Modificar home.page.ts]{.title}
``` typescript
export class ListadoComponent {
  //recibimos el parámetro indicando
  // tipo y con valor por defecto
  lista = input<number[]>([3,2,1]);
  constructor() { }
}
```
:::

:::
::: {.column width="44%" }

::: {.mycode size=footnotesize}
[Modificar home.page.html]{.title}
``` typescript
@if (lista().length > 0) {
  @for (item of lista();track item){
    <p>{{item}}</p>
  }
} @else {
  <p>Sin elementos en la lista</p>
}
```
:::

:::
::::::::::::::

Si queremos que un **parámetro sea [obligatorio](https://angular.dev/guide/components/inputs#required-inputs)**, lo haríamos con [input.required()]{.verbatim}.


::: infobox
La función [input]{.verbatim} realmente hace uso de señales **de sólo lectura**.
:::


## Parámetros *model* {#parámetros-model}

Los parámetros [model()]{.verbatim} son *inputs* especiales que permiten propagar cambios de vuelta al componente padre.



