

# Arquitectura cliente-servidor en aplicaciones web {#arquitectura-cliente-servidor}

Las mayoría de aplicaciones web *front-end* necesitan comunicarse con un servidor que ofrecen datos a través de APIs REST, normalmente a través del protocolo HTTP.

Separar nuestra aplicación diferenciando entorno cliente/*front end* y servidor/*back end* ofrece una serie de ventajas, entre las que podemos destacar:

- **Separación de código**: La ventaja más apreciable es la separación entre el código que afecta a la interfaz de usuario (ventanas/páginas, interacción, lógica de presentación...) y la lógica de negocio (con el acceso a la base de datos, autenticación, servicios externos, ...).
- **Escalabilidad**: en caso de necesidad, se puede escalar el *back end* sin afectar a la aplicación, ya que el interfaz ya está preparado para realizar peticiones a un *backend*. El *frontend* también se puede cachear en un CDN para no cargar al servidor.
- **Desarrollo en paralelo**: Si el proyecto de la aplicación se diseña de manera adecuada, el desarrollo se puede realizar en paralelo, lo que suele acortar la duración del proyecto.
- **Separación en el despliegue**: Al realizarse el desarrollo en paralelo, el despliegue a los servidores de test/QA y producción se pueden realizar de manera separada, y adecuándose a los ciclos separados.
- **Ventajas en mantenimiento y evolución**: Similar al punto anterior, cada parte puede mantenerse y evolucionar sin afectar a la otra.
- **Reutilización del *backend***: Con el mismo *backend* podemos crear distintas aplicaciones *front end*: web, dispositivo móvil Android, iOS, smartTV...
- **Uso de diferentes tecnologías**: Al separar los desarrollos podemos hacer uso de la tecnología más adecuada para cada parte. Esto da una flexibilidad que en aplicaciones "monolíticas" no suele haber.
- **Posibilidad de reemplazo**: Si un día se decide realizar un cambio en la tecnología, al realizar el cambio en un apartado, no afecta al otro.
- **Especialización de perfiles**: A la hora de buscar profesionales también resulta útil, ya que podemos buscar perfiles muy especializados en las necesidades específicas de cada apartado.


# Inyección de dependencias {#inyección-dependencias}

La [inyección de dependencias](https://angular.dev/guide/di) es un patrón de diseño para organizar y compartir código a lo largo de nuestra aplicación y componentes haciendo uso de "**servicios**". Las ventajas que nos ofrece son:

- **Mejora del mantenimiento del código**: Permite una separación más clara de responsabilidades, lo que facilita la refactorización y reduce la duplicación de código.
- **Escalabilidad**: La funcionalidad modular se puede reutilizar en múltiples contextos y permite una escalabilidad más sencilla.
- **Mejores pruebas**: Permite que las pruebas unitarias utilicen fácilmente dobles de prueba en situaciones donde no es práctico usar una implementación real.


Al igual que al definir un componente, los **servicios** se componen de lo siguiente:

- Un decorador de TypeScript que declara la clase como un servicio de Angular mediante [@Injectable]{.verbatim} y permite definir qué parte de la aplicación puede acceder al servicio a través de la propiedad [providedIn]{.verbatim} (que normalmente es [\'root\']{.verbatim}), permitiendo así el acceso al servicio desde cualquier punto de la aplicación.
- Una clase de TypeScript que define el código que estará disponible cuando se inyecte el servicio.

Entre los tipos de servicios más comunes se incluyen:

- **Clientes de datos**: Simplifican el proceso de realizar solicitudes a un servidor para la recuperación y modificación de datos.
- **Gestión de estado**: Definen el estado compartido entre varios componentes o páginas.
- **Autenticación y autorización**: Gestionan la autenticación de usuarios, el almacenamiento de tokens y el control de acceso.
- **Registro y gestión de errores**: Establecen una API común para registrar o comunicar los estados de error al usuario.
- **Gestión y distribución de eventos**: Gestionan eventos o notificaciones que no están asociados a un componente específico, o bien, distribuyen eventos y notificaciones a los componentes, siguiendo el patrón observador.
- **Funciones de utilidad**: Ofrecen funciones de utilidad reutilizables, como el formateo, la validación o los cálculos de datos.


## Crear servicio {#crear-servicio}

Para crear un servicio el CLI de Angular nos ofrece el siguiente comando:

::: {.mycode}
[Crear servicio]{.title}
``` console
ruben@vega:~/pruebas $ ng generate service calculadora
```
:::

Y nos ha creado el fichero [src/app/calculadora.ts]{.configfile} que contiene:

::: {.mycode}
[Servicio recién creado]{.title}
``` ts
import { Injectable } from '@angular/core';
@Injectable({
  providedIn: 'root'
})
export class Calculadora { }
```
:::

Tal como se puede ver, tenemos:

- ***Import*** del *decorator* [@Injectable()]{.verbatim} que es parte del *core* de Angular.
- Al usar [@Injectable({ providedIn: \'root\' })]{.verbatim} en el servicio:
  - Crea una única instancia (***singleton***) para toda tu aplicación.
  - La hace disponible en todas partes sin necesidad de configuración adicional.
  - Habilita la eliminación de código muerto (*tree-shaking*) para que el servicio solo se incluya en el paquete JavaScript generado si realmente se utiliza.


::: warnbox
[providedIn: \'root\']{.verbatim} cubre la mayoría de los casos pero [existen muchos escenarios posibles](https://angular.dev/guide/di/defining-dependency-providers).
:::

En la clase creada en el servicio se pueden crear las funciones que necesitemos.

::: exercisebox
Crea una función "sumar" que reciba dos parámetros y devuelva el valor.
:::

## Inyectar servicio en un componente {#inyectar-en-componente}

Para inyectar nuestro servicio en un componente debemos hacer uso de [inject()]{.verbatim} e importar el servicio.

::: {.mycode}
[Inyectar servicio]{.title}
``` ts
import { Component, inject } from '@angular/core';
import { Calculadora } from '../calculadora';
//...
export class Prueba {
  calculadora = inject(Calculadora);
  suma = this.calculadora.sumar(2, 3);
}
```
:::

Tal como se puede ver, se ha hecho la inyección del servicio y se ha llamado a la función sumar que se ha creado en el servicio.


::: infobox
Un servicio se puede inyectar en otro servicio: [documentación](https://angular.dev/guide/di/creating-and-using-services#injecting-into-another-service).
:::



# Cómo usar una API REST {#usar-api-rest}

Para realizar las peticiones HTTP a una API (*Application Programming Interface*) necesitamos usar [HTTPClient](https://angular.dev/api/common/http/HttpClient), que se proporciona a través de [provideHttpClient](https://angular.dev/api/common/http/provideHttpClient). Lo habitual es configurar este *provider* en la configuración general de nuestra aplicación, [src/app/app.config.ts]{.configfile} y aseguramos que contiene:


::: {.mycode}
[Añadimos el nuevo provider]{.title}
``` ts
//...
import { provideHttpClient } from '@angular/common/http';
//...
export const appConfig: ApplicationConfig = {
  providers: [
    //...
    provideHttpClient(),
  ]
};
```
:::

Ahora ya podemos inyectar [HTTPClient{}]{.verbatim} dentro de nuestro componente, servicio u otra clase. 

## Crear servicio para API {#servicio-api}

Vamos a crear un nuevo servicio llamado **"Cliente"** para realizar las peticiones a la API en las que se han incluido dos funciones. Para el ejemplo se ha utilizado la [API de eventos culturales de OpenData Euskadi](https://opendata.euskadi.eus/api-culture/?api=culture_events):

::: {.mycode size=footnotesize}
[Nuevo servicio]{.title}
``` ts
import { HttpClient } from '@angular/common/http';
import { inject, Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class Cliente {
  private http = inject(HttpClient);
  private apiUrl = "https://api.euskadi.eus/culture/events/v1.0";
  data = null;
  page = 0;
  elements = 20;

  get_events(): Observable<any[]> {
    this.page = this.page + 1;
    return this.http.get<any>(this.apiUrl+
        '/events?_elements='+this.elements+
        '&_page='+this.page);
  }

  get_event(id:number): Observable<any[]> {
    this.page = this.page + 1;
    return this.http.get<any>(this.apiUrl+
        '/events/'+id);
  }
}
```
:::


En el código anterior se ha hecho uso de [any]{.verbatim} como tipo de objeto de la respuesta, pero lo ideal sería tener en cuenta el modelo de datos recibido y tenerlo en cuenta.


## Usar servicio de API {#usar-api}

Una vez tengamos nuestro servicio creado, es momento de hacer uso de él y ver que funciona.

::: exercisebox
Crea una ruta y un componente para la URL [/events]{.verbatim} .
:::

En este nuevo componente vamos a hacer que al ir a la URL correspondiente se realice la llamada para obtener todos los eventos. La idea es que al cargar el componente, a través de la función [constructor()]{.verbatim} se realiza la llamada a la función del servicio que obtiene todos los eventos, y también lo manda a la consola de log para asegurar que está funcionando.

Por otro lado, en la plantilla se recorre el objeto obtenido en formato JSON y mostramos a modo de ejemplo el nombre del evento. Para ello, modifica la clase y la plantilla:


:::::::::::::: {.columns }
::: {.column width="44%" }


::: {.mycode size=footnotesize}
[Uso del servicio]{.title}
``` ts
export class Events {
  cliente = inject(Cliente);
  data: any = signal(null);
  
  constructor() {
    this.cliente.get_events()
      .subscribe((response) => {
        this.data = response;
        console.log(this.data);
    });
  }
}
```
:::

:::
::: {.column width="44%" }

::: {.mycode size=footnotesize}
[Plantilla]{.title}
``` html
@for (event of data.items; 
  track event.id;
  let idx = $index) {
  <h3>
    <a href="/events/{{event.id}}">
    {{event.nameEs}}
    </a>
  </h3>

  <hr/>
}
```
:::

:::
::::::::::::::

Con esto ya tendríamos el listado de todos los eventos recogidos a través de una función que llama a una API externa.


## Uso de *state* para reutilizar datos {#uso-de-state}

Dependiendo de cómo funcione la API a la que llamemos, es posible que hayamos obtenido los objetos completos, por lo que quizá no sea necesario volver a llamar a la API en ciertas situaciones.

Vamos a continuar con el ejemplo y visualizar un evento concreto. Al obtener el listado de eventos, pueden pasar dos cosas:

- **Obtener sólo el título del evento y su identificador único**: obtendríamos un listado de títulos e IDs, por lo que al querer visualizar un evento, tendríamos que volver a llamar a la API para obtener los datos de ese evento concreto.
- **Obtener eventos y datos completos del listado**: al obtener el listado de eventos, obtendríamos para cada evento todos los datos completos. **Este es el caso de OpenData Euskadi**, por lo que tenemos los datos de cada evento.

::: questionbox
¿Pero qué pasa si cargamos directamente la URL [/events/:id]{.verbatim}?
:::

Estamos ante dos situaciones distintas:

1. Si venimos de la navegación de la aplicación, tenemos los datos del evento, por lo que podemos visualizarlos directamente.
2. Si venimos de la recarga de la web o de un acceso directo, no tenemos los datos, sólo tenemos el [:id]{.verbatim}, por lo que hay que realizar la petición a la API.


Desde el componente **Events**, donde obtenemos todos, vamos a realizar un pequeño cambio para usar[router.navigate]{.verbatim} y ***[state](https://angular.dev/api/router/NavigationExtras#state)*** para pasar el objeto.

:::::::::::::: {.columns }
::: {.column width="44%" }


::: {.mycode size=footnotesize}
[Crear función]{.title}
``` ts
export class Events {
  //...
  goto_event(event: any) {
    this.router.navigate(
      ['/events', event.id],
      { state: { event } }
    );
  }
}
```
:::

:::
::: {.column width="44%" }

::: {.mycode size=footnotesize}
[Plantilla]{.title}
``` html+ng2
<li>
  <a (click)="goto_event(event)">
    +Info
  </a>
</li>
```
:::

:::
::::::::::::::


::: exercisebox
Crea otra ruta [/events/:id]{.verbatim} y el componente para visualizar un evento.
:::

En el nuevo componente vamos a comprobar lo siguiente:

- Obtenemos la ruta actual y comprobamos si tenemos el ***state*** del evento.
  - Eso significaría que venimos del otro componente.
  - Asignamos a la variable local el ***state*** para visualizarlo en la plantilla.
- En caso contrario:
  - Obtenemos el [id]{.verbatim} de la URL
  - Llamamos a la función del servicio de la API para obtener el evento correspondiente.



::: {.mycode size=footnotesize}
[Componente Event]{.title}
``` ts
import { Component, inject, signal } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Cliente } from '../cliente';
//...
export class Event {
  private router = inject(Router);
  private route = inject(ActivatedRoute);
  cliente = inject(Cliente);
  event = signal<any | null>(null);

  constructor() {
    const nav = this.router.currentNavigation();
    const stateEvent = nav?.extras?.state?.['event'];

    if (stateEvent) {
      this.event.set(stateEvent);
      console.log("Event from state:", stateEvent);
    } else {
      // cogemos el parámetro de la ruta
      const id = Number(this.route.snapshot.paramMap.get('id'));
      this.cliente.get_event(id).subscribe({
        next: (data) => this.event.set(data),
        error: (err) => console.error('Error cargando evento', err)
      });
    }
  }
}
```
:::


## Generar cliente API automáticamente {#generar-cliente-automáticamente}

A la hora de crear una API habría que hacer uso de la [especificación OpenAPI](https://en.wikipedia.org/wiki/OpenAPI_Specification) (**OAS**), para generar los archivos de interfaz que son legibles por máquinas para describir, producir, consumir y visualizar servicios web [REST](https://en.wikipedia.org/wiki/REST). Si la API que generamos sigue el estándar, generar un servicio que lo consuma puede ser automático, y lo mismo sucede al revés.

Si miramos la web de [eventos culturales de OpenData Euskadi](https://opendata.euskadi.eus/api-culture/?api=culture_events), que hemos usado previamente, veremos que tiene el logotipo **OAS**. El enlace donde podemos ver la especificación de la API es el siguiente: [cultural-events.json](https://opendata.euskadi.eus/contenidos/recurso_tecnico/data_apirest/es_def/adjuntos/cultural-events.json). Partiendo de este fichero vamos a generar nuestro cliente automáticamente.

Tenemos que instalar el paquete [OpenAPI Generator](https://openapi-generator.tech/) con nuestro gestor de paquetes **npm**: 

::: {.mycode size=small}
[Instalamos OpenAPI Generator]{.title}
``` console
ruben@vega:~/pruebas $ npm install @openapitools/openapi-generator-cli -g
```
:::

Ahora podemos generar en nuestro proyecto Angular el nuevo servicio que automáticamente generará las funciones para llamar a la API:

::: {.mycode}
[Instalamos OpenAPI Generator]{.title}
``` console
ruben@vega:~/pruebas $ openapi-generator-cli generate \
 -i https://opendata.euskadi.eus/.../cultural-events.json \
 -g typescript-angular -o src/app/api
```
:::

Al comando se le pasan los siguientes parámetros:

- [generate]{.verbatim}: para generar el servicio.
- [-i]{.verbatim}: se le indica el fichero o URL que contiene la especificación OpenAPI. En el ejemplo anterior se ha acortado la URL por motivos de espacio.
- [-g]{.verbatim}: qué generador vamos a usar, en este caso [typescript-angular]
- [-o]{.verbatim}: dónde vamos a guardar el resultado


Si ahora queremos hacer uso del nuevo servicio, en el componente **Events** vamos a cambiar todo lo que habíamos añadido del servicio **Cliente** (el antiguo servicio) para que aparezca el nuevo servicio:


::: {.mycode size=footnotesize}
[Uso del servicio]{.title}
``` ts
import { EventsService } from '../api';

export class Events {
  //...
  private eventsService = inject(EventsService)
  
  constructor() {
    this.eventsService.findEvents().subscribe((response) => {
      this.data = response;
      console.log(this.data);
    });
  }
}
```
:::

Como se puede apreciar, los cambios son menores, importar el nuevo servicio, inyectarlo y hacer uso de las nuevas funciones auto-generadas.

::: infobox
Para conocer qué funciones tiene el servicio, se puede generar la [documentación](https://openapi-generator.tech/docs/generators/#documentation-generators) con [-g html2]{.verbatim}.
:::


