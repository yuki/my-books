

# Componentes {#angular-componentes}

Los **componentes** son la unidad básica de construcción en Angular. Cada parte visible de nuestra webapp (botones, tarjetas, secciones de una página, layouts...) puede representarse como un componente.

::: infobox
Es conveniente pensar nuestra aplicación diferenciando componentes, de esta manera los podremos reutilizar en caso de que sea necesario.
:::

## Estructura de un componente {#estructura-componente}

Un componente está formado por los siguientes ficheros:

- [.css]{.verbatim} / [.scss]{.verbatim}: Estilos propios del componente, para que de esta manera sea independiente a otros. Dependiendo del formato elegido al generar el proyecto, serán pre-procesados para generar un CSS válido.
- [.html]{.verbatim}: Es la plantilla del componente, en formato HTML, donde se mostrará lo que queremos visualizar.
- [.spec.ts]{.verbatim}: Fichero para realizar pruebas unitarias.
- [.ts]{.verbatim}: Contiene la lógica y la clase del componente.

Al crear nuestra aplicación se ha generado el componente principal llamado **app-root** que está dentro del directorio [src/app/]{.configdir}.

En el fichero [src/app/app.ts]{.verbatim} del proyecto tendremos:

::: {.mycode}
[Componente App]{.title}
``` ts
@Component({
  selector: 'app-root',
  imports: [RouterOutlet],
  templateUrl: './app.html',
  styleUrl: './app.scss'
})
```
:::

Podemos destacar:

- ***selector***: es la manera que usaremos para posteriormente visualizar nuestro componente.
- ***imports***: posibles importaciones que tendrá nuestro componente. Más adelante hablaremos de ello.
- ***templateUrl***: fichero de plantilla HTML. En lugar de ser un fichero, podría ser código HTML directamente, pero para componentes grandes perderíamos facilidad de modificación.
- ***styleUrl***: fichero de estilos. De nuevo, se podrían poner aquí los estilos.

::: exercisebox
Comprueba el contenido de los ficheros [app.html]{.verbatim}, [app.scss]{.verbatim}, [app.spects.ts]{.verbatim} y [app.ts]{.verbatim}. Modifica **app** para que en el HTML aparezca tu nombre en color rojo.
:::


## Vistas con plantillas {#vistas-con-plantillas}

Angular usa un **sistema de enlace de datos (*data binding*)** que permite conectar la lógica con la vista, pudiendo mostrar variables en la vista o llamar a funciones de la clase desde la vista.

Desde **Angular 16**, para las variables que van a cambiar en el tiempo, se hace uso de [signals](https://angular.dev/guide/signals) para rastrear cómo y dónde se cambian los estados de una aplicación. De esta manera el *framework* optimiza las actualizaciones en el renderizado de las vistas.

Las [signals]{.verbatim} pueden contener cualquier tipo de dato, que puede ser leído a través de la función *getter*, y pueden ser tanto de lectura-escritura o de sólo lectura.

### Interpolación {#variables-vista}

De esta manera podemos mostrar de manera sencilla las propiedades de un componente en su vista (*template*).


:::::::::::::: {.columns }
::: {.column width="44%" }

::: {.mycode size=footnotesize}
[Modificar app.ts]{.title}
``` typescript
export class App {
  contador = signal(0);
}
```
:::

:::
::: {.column width="44%" }

::: {.mycode size=footnotesize}
[Modificar app.html]{.title}
``` html+ng2
<p>{{contador()}}</p>
```
:::

:::
::::::::::::::


### Propiedades y atributos dinámicos {#propiedades-dinámicas}

Para poder modificar propiedades y atributos del DOM (*Document Object Model*) del *template* HTML, debemos especificarlo entre corchetes [[]]{.verbatim}. En el siguiente ejemplo el botón va a aparecer como deshabilitado debido a que así se ha especificado desde la clase.

:::::::::::::: {.columns }
::: {.column width="44%" }

::: {.mycode size=footnotesize}
[Modificar app.ts]{.title}
``` typescript
export class App {
  contador = signal(0);
  public isDisabled = signal(false);
}
```
:::

:::
::: {.column width="44%" }

::: {.mycode size=footnotesize}
[Modificar home.page.html]{.title}
``` html+ng2
<button [disabled]="isDisabled()">
  Pulsa
</button>
```
:::

:::
::::::::::::::

::: questionbox
¿Qué sucede al poner [isDisabled]{.verbatim} a [true]{.verbatim}?
:::

### *Event listeners* {#event-listeners}

Para manejar interacción desde la vista, a través d un *event binding*, podemos llamar a un método de la clase desde la vista, de esta manera se permite la interacción del usuario.

Siguiendo con el ejemplo anterior, se va a crear otro botón que al pulsarlo modifique la propiedad de la clase que hacía que estuviese deshabilitado.

:::::::::::::: {.columns }
::: {.column width="44%" }

::: {.mycode size=footnotesize}
[Modificar app.ts]{.title}
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
<button [disabled]="isDisabled()"
        (click)="incrementar()">
  Pulsa
</button>
```
:::

:::
::::::::::::::



### Control de datos {#control-de-datos}

En las vistas también podremos realizar un control de los datos que se visualizan.

#### Condicionales {#angular-condicionales}

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

#### Bucles {#angular-bucles}

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
[Modificar app.ts]{.title}
``` typescript
frutas = ['Manzana', 'Pera',
          'Naranja', 'Banana',
          'Kiwi'];
```
:::

:::
::: {.column width="44%" }

::: {.mycode size=footnotesize}
[Modificar app.html]{.title}
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


### *Pipes* {#angular-pipes}

Las *pipes* (o "tuberías") son un operador especial que se puede usar en las vistas para transformar datos de manera declarativa. Existen [funciones ya predefinidas](https://angular.dev/guide/templates/pipes#built-in-pipes) y podemos crear nuestras funciones. Este sistema está basado en los *[pipes](https://en.wikipedia.org/wiki/Pipeline_(Unix))* de Unix y su carácter "[|]{.verbatim}".


:::::::::::::: {.columns }
::: {.column width="44%" }

::: {.mycode size=footnotesize}
[Modificar app.ts]{.title}
``` typescript
import { DatePipe,
    DecimalPipe,
    CurrencyPipe,
  } from '@angular/common';
```
:::

:::
::: {.column width="44%" }

::: {.mycode size=footnotesize}
[Uso de pipes en la vista]{.title}
``` html+ng2
<!--Jan 1, 2025 -->
<p>{{"2025-01-01" | date}}</p>
<!--1,234.0000 -->
<p>{{ 1234 | number:'1.4' }}</p>
<!--€1,234.00 -->
<p>{{ 1234 | currency:'EUR' }}</p>
```
:::

:::
::::::::::::::


::: errorbox
Faltan los [imports]{.verbatim} en el [@Component]{.verbatim}.
:::


### Variables {#variables-en-template}

Podemos crear [variables en la vista](https://angular.dev/guide/templates/variables) para poder ser usadas, y así quizá favorecer la sintaxis. Para poder declarar la variable se hará uso de [@let]{.verbatim}.

::: {.mycode}
[Uso de variables en la vista]{.title}
``` html
@let i = 1;
<p>{{i+i}}</p> <!--2 -->
```
:::

## Crear un componente {#crear-componente}

Para crear un componente nuevo vamos a hacer uso del CLI. Para ver todas las opciones se puede usar [ng generate \-\-help]{.commandbox}


::: {.mycode}
[Crear componente]{.title}
``` console
ruben@vega:~/pruebas $ ng generate component prueba
CREATE src/app/prueba/prueba.scss (0 bytes)
CREATE src/app/prueba/prueba.spec.ts (528 bytes)
CREATE src/app/prueba/prueba.ts (186 bytes)
CREATE src/app/prueba/prueba.html (21 bytes)
```
:::

Tal como se puede ver en la salida del comando, nos ha generado los cuatro ficheros dentro del directorio [src/app/prueba]{.configdir}. Cada componente es independiente y se mantiene en su directorio.

::: infobox
Podemos crear componentes dentro de una estructura jerárquica de directorios propia, para ordenar los componentes por características: [ng generate componente user/profile]{.commandbox}
:::



## Uso de componentes {#uso-componentes}

Para visualizar un componente creado debemos añadirlo a la vista donde queramos que aparezca, pudiendo ser la vista principal o la de otro componente.

Para añadirlo, usaremos el nombre que le hayamos dado en el apartado ***selector*** al componente, y lo añadiremos como una etiqueta HTML más.

::: {.mycode}
[Añadir un componente a una vista]{.title}
``` xml
<app-prueba />
```
:::


### Recibir parámetros {#recibir-parámetros-componente}

Imaginemos que tenemos una aplicación que contiene varios listados, que por aspecto visual son iguales. Podemos generar un único componente que reciba la lista como parámetro y la visualice por pantalla. De esta manera, no duplicaremos código, y si queremos cambiar todos los listados, sólo debemos cambiar un único componente.


Generamos los datos en el componente padre y llamamos al componente hijo pasándole el listado como parámetro:

:::::::::::::: {.columns }
::: {.column width="44%" }

::: {.mycode size=footnotesize}
[Modificar app.ts]{.title}
``` typescript
export class App {
  listado = [1, 2, 3];
}
```
:::

:::
::: {.column width="44%" }

::: {.mycode size=footnotesize}
[Modificar app.html]{.title}
``` html+ng2
<app-prueba [lista]="listado"/>
```
:::

:::
::::::::::::::


Y ahora en el componente "hijo", debemos leer el parámetro mediante [input()]{.verbatim}, indicando el tipo de datos que esperamos recibir, en este caso [number[]]{.verbatim}.

Puede ser interesante inicializar el valor, de ahí que dentro del [input()]{.verbatim} hayamos puesto [[3,2,1]]{.verbatim}, por si no recibe el parámetro desde el padre.

:::::::::::::: {.columns }
::: {.column width="44%" }

::: {.mycode size=footnotesize}
[Modificar prueba.ts]{.title}
``` typescript
export class Prueba {
  lista = input<number[]>([3,2,1]);
}
```
:::

:::
::: {.column width="44%" }

::: {.mycode size=footnotesize}
[Modificar prueba.html]{.title}
``` html
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

::: exercisebox
Pasa la variable [contador]{.verbatim} como parámetro y comprueba cómo se modifica en ambos componentes al pulsar el botón en [App]{.verbatim}.
:::

Si queremos que un **parámetro sea [obligatorio](https://angular.dev/guide/components/inputs#required-inputs)**, lo haríamos con [input.required()]{.verbatim}.


::: infobox
La función [input]{.verbatim} realmente hace uso de señales **de sólo lectura**.
:::


### Parámetros *model* {#parámetros-model}

Los parámetros [model()]{.verbatim} son *inputs* especiales que permiten propagar cambios de vuelta al componente padre. De esta manera, si desde el componente hijo necesitamos actualizar un valor del padre, al realizar el cambio el padre recibirá el cambio.

Confirmamos en el componente padre que tenemos un valor que le pasamos al hijo. Desde el componente padre también podemos modificar ese valor con un botón:

:::::::::::::: {.columns }
::: {.column width="44%" }

::: {.mycode size=footnotesize}
[Modificar app.ts]{.title}
``` typescript
export class HomePage {
  contador = signal(0);
  incrementar() {
    this.contador.update(
      (n) => n + 1
    );
  }
}
```
:::

:::
::: {.column width="44%" }

::: {.mycode size=footnotesize}
[Modificar app.html]{.title}
``` html+ng2
<p>{{contador()}}</p>
<button [disabled]="isDisabled()"
        (click)="incrementar()">
    Pulsa
</button>
<app-prueba
    [lista]="listado"
    [(contador)]="contador"/>
```
:::

:::
::::::::::::::

Ahora desde el componente hijo vamos a recibir el valor mediante [model()]{.verbatim}:

:::::::::::::: {.columns }
::: {.column width="44%" }

::: {.mycode size=footnotesize}
[Modificar prueba.ts]{.title}
``` typescript
export class Prueba {
  contador = model<number>(0);

  incrementar() {
    this.contador.update((n) => n+1);
  }
}
```
:::

:::
::: {.column width="44%" }

::: {.mycode size=footnotesize}
[Modificar incrementar.page.html]{.title}
``` html+ng2
<p>{{contador()}}</p>

<button (click)="incrementar()">
    Pulsa
</button>
```
:::

:::
::::::::::::::


## Proyección de contenido con ng-content {#contenidos-ng-content}

Es posible que necesitemos crear componentes que sólo van a ser contenedores de contenido, en los que quizá no exista ninguna lógica aparte del aspecto visual. Para estos casos existe [[ng-content]{.verbatim}](https://angular.dev/guide/components/content-projection).


Desde el componente padre llamamos al componente hijo añadiendo contenido, y en el hijo simplemente ponemos [ng-content]{.verbatim} para visualizarlo.

:::::::::::::: {.columns }
::: {.column width="44%" }

::: {.mycode size=footnotesize}
[Llamada al componente hijo]{.title}
``` html
<custom-card>
  <p>Contenido proyectado</p>
</custom-card>
```
:::

:::
::: {.column width="44%" }

::: {.mycode size=footnotesize}
[En el componente hijo]{.title}
``` html
<div class="card-shadow">
  <ng-content />
</div>
```
:::

:::
::::::::::::::






## Ciclo de vida de un componente
Cada componente Angular pasa por una serie de fases o *hooks* desde que se crea hasta que se destruye, lo que es conocido como el [*lifecycle* del componente](https://angular.dev/guide/components/lifecycle).


El ciclo de vida varía ligeramente al crearse el componente o durante sus actualizaciones posteriores. La explicación para todos los *hooks* se pueden encontrar en la [documentación oficial](https://angular.dev/guide/components/lifecycle).

:::::::::::::: {.columns }
::: {.column width="45%" }
![](img/angular/angular-lifecycle.png){width=100%}
:::
::: {.column width="45%" }
![](img/angular/angular-lifecycle2.png){width=100%}
:::
::::::::::::::

::: center
[*Lifecycle* de componente. Fuente: [Angular.dev](https://angular.dev/guide/components/lifecycle) ]{.footnotesize}
:::

Vamos a especificar las funciones más importantes que se ejecutan durante la creación/ejecución del componente. Tal como se puede ver en el dibujo previo, el ciclo de vida de los componentes varía en función de si es recién creado o si detecta alguna actualización:


| Hook | Cuándo se ejecuta | Uso principal |
|-------|--------------------|---------------|
| [constructor]{.verbatim} | Al crearse el componente | La función estándar de la clase TypeScript |
| [ngOnInit()]{.verbatim} | Al inicializar el componente | Cargar datos o inicializar variables. Sólo se ejecuta una vez, antes de inicializar el *template*. |
| [ngOnChanges()]{.verbatim} | Cuando cambian propiedades de entrada ([@Input]{.verbatim}) | Reaccionar a cambios desde el componente padre. |
| [ngOnDestroy()]{.verbatim} | Antes de eliminar el componente (ocultarse o navegar a otra página) | Limpiar recursos o detener suscripciones.  |

Table: {tablename=yukitblr colspec=X[2]X[3]X[3]}


# Rutas y navegación {#rutas-navegación}

Al navegar a una URL (del inglés *Uniform Resource Locator*) con nuestro navegador, éste realiza una petición de red al servidor web y el retorno suele ser una página HTML. Al hacer click sobre un enlace, el ciclo vuelve a empezar.

Angular permite crear aplicaciones de una sola página (SPA) y esto hace que el comportamiento citado sea diferente. En este caso, lo habitual suele ser realizar la petición al servidor web a la primera página, [index.html]{.verbatim}, y el **enrutador de Angular**, desde el lado cliente, controla el cambio de URL.

El enrutamiento en Angular se compone de tres partes principales:

- Las rutas definen qué componente se muestra cuando un usuario visita una URL específica.
- Los ***outlets*** son marcadores de posición en las plantillas que cargan y renderizan componentes dinámicamente según la ruta activa.
- Los enlaces permiten a los usuarios navegar entre las diferentes rutas de la aplicación sin recargar la página completa.


## Configuración básica del router {#configuración-router}

Para usar el sistema de rutas, debemos asegurar que  [provideRouter]{.verbatim} está en la configuración principal ([app.config.ts]{.configfile}) y se importa un conjunto de **rutas**, en este caso a través del fichero [app.routes.ts]{.configfile}.

::: {.mycode size=footnotesize}
[Configuración de la aplicación]{.title}
``` ts
import { ApplicationConfig, provideBrowserGlobalErrorListeners,
         provideZoneChangeDetection } from '@angular/core';
import { provideRouter } from '@angular/router';
import { routes } from './app.routes';

export const appConfig: ApplicationConfig = {
  providers: [
    provideBrowserGlobalErrorListeners(),
    provideZoneChangeDetection({ eventCoalescing: true }),
    provideRouter(routes)
  ]
};
```
:::

En el componente principal [app]{.verbatim} deberíamos tener la configuración y en su template lo siguiente:

:::::::::::::: {.columns }
::: {.column width="44%" }

::: {.mycode}
[Componente principal]{.title}
``` ts
import { RouterOutlet }
  from '@angular/router';

@Component({
  imports: [RouterOutlet],
  // ...
})
```
:::

:::
::: {.column width="44%" }

::: {.mycode}
[Plantilla del componente]{.title}
``` html
<router-outlet />
```
:::

:::
::::::::::::::


La directiva [<router-outlet/>]{.verbatim} es un marcador de posición que indica la ubicación donde el enrutador debe renderizar el componente para la URL actual. Con los siguientes apartados se entenderá mejor


## Ejemplo de rutas y navegación básica {#ejemplo-básico-rutas}

Para entender cómo se crean las rutas necesarias de nuestra aplicación, vamos a suponer que nuestra aplicación cuenta con las siguientes URLs:

- [/]{.verbatim}: página principal de la aplicación.
- [/home]{.verbatim}: página principal del usuario.
- [/login]{.verbatim}: página para poder loguearnos en la aplicación.

Para ello, en el fichero de rutas ([app.routes.ts]{.configfile}) añadiremos lo siguiente:

::: {.mycode size=footnotesize}
[Ejemplo de rutas]{.title}
``` ts
import { Routes } from '@angular/router';
import { Home } from './home/home';
import { Login } from './user/login/login';

export const routes: Routes = [
    {
        path: 'home',
        component: Home,
        title: 'Home Page'
    },
    {
        path: 'login',
        component: Login,
        title: 'Login Page'
    }
];
```
:::

El apartado [title]{.verbatim} de la configuración es opcional y sirve para modificar el título de la página, para que así sea más accesible.

::: exercisebox
Crea los dos componentes necesarios: [Home]{.verbatim} y [Login]{.verbatim} .
:::

Para poder navegar entre las rutas creadas se va a usar [RouterLink]{.verbatim}, por lo que en el template de nuestro componente principal vamos a crear unos enlaces de la siguiente manera:


:::::::::::::: {.columns }
::: {.column width="44%" }

::: {.mycode size=footnotesize}
[Vista principal]{.title}
``` html
<ul>
  <li>
    <a routerLink="/home">Home</a>
  </li>
  <li>
    <a routerLink="/login">Login</a>
  </li>
</ul>
<router-outlet />
<div id="footer">footer</div>
```
:::

:::
::: {.column width="44%" }
![](img/angular/angular-rutas.png){width="100%" framed=true}
:::
::::::::::::::

Y añadiendo un poco de CSS para pruebas, nuestra vista debería quedar tal como aparece en la imagen.

::: infobox
Al navegar a [/login]{.verbatim} el sistema de rutas carga el componente **Login** en la posición de [<router-outlet />]{.verbatim}. Lo mismo al navegar a [/home]{.verbatim}.
:::


## Definir parámetros en la URL {#definir-parámetros}

En las aplicaciones web actuales es habitual tener URLs parametrizadas, que son rutas dinámicas que posibilitan mostrar datos diferentes teniendo en cuenta los parámetros de la URL.

Vamos a hacer un ejemplo con URLs del estilo:

- [/user/:id/:social]{.verbatim}: nos mostrará la red [:social]{.verbatim} del usuario [:id]{.verbatim}.
- [/user/:id]{.verbatim}: donde [:id]{.verbatim} es el parámetro y que nos mostrará la página del usuario concreto.

Debemos añadir las rutas para que llamen a los componentes correspondientes:

::: {.mycode}
[Nuevas rutas]{.title}
``` ts
export const routes: Routes = [
    {
        path: 'user/:id/:social',
        component: Social
    },
    {
        path: 'user/:id/',
        component: UserProfile
    },
];
```
:::

Y ahora en los componentes correspondientes se debe realizar la lectura de los parámetros para poder ser usados. Para ello se va a usar [ActivatedRoute](https://angular.dev/guide/routing/read-route-state)

::: {.mycode}
[Componente]{.title}
``` ts
import { ActivatedRoute } from '@angular/router';
// ...
export class UserProfile {
  readonly id: string | null;
  private route = inject(ActivatedRoute);

  constructor() {
    this.id = this.route.snapshot.paramMap.get('id');
  }
}
```
:::

::: exercisebox
Es momento de realizar lo mismo para el componente **Social**.
:::



## Ruta *Wildcard* {#ruta-wildcard}

Para manejar URLs inexistentes, se debe usar la ruta comodín [**]{.verbatim}, y **debe colocarse la última** dentro del array de rutas en el fichero [app.routes.ts]{.configfile}.

::: {.mycode}
[Rutas]{.title}
``` ts
export const routes: Routes = [
  //...
  {
      path: '**',
      component: NotFound
  },
];
```
:::



## Orden de las rutas {#orden-rutas}

Aunque no se ha dicho explícitamente, **las rutas deben tener un orden concreto** para que el funcionamiento sea el esperado. El router de Angular evalúa las rutas **de arriba hacia abajo**, siguiendo el orden en que aparecen en el array de configuración.

Cuando el usuario navega a una URL, Angular busca la **primera ruta que coincide** con ese patrón, y deja de buscar. Es por eso que es importante **[poner las rutas más específicas antes](https://angular.dev/guide/routing/define-routes#how-angular-matches-urls)**.


::: infobox
Las rutas deben seguir un orden: de más específicas a menos.
:::

