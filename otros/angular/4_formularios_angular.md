

# Introducción a los formularios {#introducción-formularios-angular}

Los [formularios](https://angular.dev/guide/forms) son una parte esencial en cualquier aplicación web. En Angular existen **dos enfoques principales** para gestionarlos. Ambos permiten capturar y validar datos del usuario, pero se diferencian en la forma de definir la estructura, las validaciones y el control sobre los datos.

Los enfoques principales son:

- **Formularios reactivos** (*Reactive Forms*)
- **Formularios basados en plantillas** (*Template-Driven Forms*)

<!-- ::: infobox
Es recomendable leer la [documentación](https://angular.dev/guide/forms) para entender las diferencias completas entre ambos enfoques.
::: -->


## Formularios reactivos {#formularios-reactivos}

Los [formularios reactivos](https://angular.dev/guide/forms/reactive-forms) ofrecen un enfoque basado en modelos para gestionar las entradas de formularios cuyos valores cambian con el tiempo.

Proporcionan acceso directo y explícito al modelo de objetos del formulario subyacente. En comparación con los formularios basados ​​en plantillas, **son más robustos**: son más escalables, reutilizables y fáciles de probar. Si los formularios son una parte fundamental de la aplicación, este sería el enfoque a utilizar.

### Crear formulario básico {#formulario-básico}

<!-- Los pasos para crear un formulario básico son:

1. Crear un nuevo componente e importar la librería para formularios reactivos [ReactiveFormsModule]{.verbatim}. Para este ejemplo el componente se llama "formulario", y al crearlo nos aseguramos que importamos las librerías.
2. Instanciar un nuevo [FormControl]{.verbatim}.
3. Registrar el [FormControl]{.verbatim} en la plantilla. -->

Usando un componente **Formulario** recién creado, se han añadido unos ***imports***, creado una variable y se ha modificado la visata:

:::::::::::::: {.columns }
::: {.column width="44%" }

::: {.mycode size=footnotesize}
[Componente de formulario]{.title}
``` ts
import { Component }
    from '@angular/core';
import {FormControl,
        ReactiveFormsModule}
    from '@angular/forms';

@Component({
  selector: 'app-formulario',
  imports: [ReactiveFormsModule],
  templateUrl: './formulario.html',
  styleUrl: './formulario.scss'
})
export class Formulario {
  name = new FormControl('');
}
```
:::

:::
::: {.column width="44%" }

::: {.mycode size=footnotesize}
[Vista de formulario]{.title}
``` html+ng2
<label for="name">Nombre: </label>
<input id="name" type="text"
    [formControl]="name">

<p>Valor: {{ name.value }}</p>
```
:::

:::
::::::::::::::

De esta manera se ha creado un formulario que al modificar el valor se visualiza en la propia vista.



## Formularios basados en plantillas {#formularios-plantillas}


Utiliza directivas en la plantilla para crear y manipular el modelo de objetos subyacente. Son útiles para agregar un formulario sencillo a una aplicación, como un formulario de suscripción a una lista de correo electrónico. Son fáciles de agregar a una aplicación, pero no escalan tan bien como los formularios reactivos. Si los requisitos y lógica de formulario son básicos que se pueden gestionar únicamente en la plantilla, esta sería la mejor opción.



Los **formularios basados en plantillas** se apoyan en la **vista (HTML)** y utilizan directivas de Angular para enlazar los datos mediante `ngModel`. Son ideales para **formularios sencillos** y de tamaño reducido.

### Configuración
Para usar este tipo de formularios es necesario importar el módulo `FormsModule` en el módulo principal (normalmente `app.module.ts`):

Los **formularios basados en plantillas** se controlan principalmente desde el HTML mediante directivas de Angular que enlazan datos (por ejemplo `ngModel`). Son adecuados para formularios sencillos o de menor complejidad.


