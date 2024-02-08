

# *Middlewares* {#middlewares}

Un *middleware* en Laravel es un mecanismo que inspecciona y filtra las peticiones HTTP que llegan a la aplicación. El ejemplo más claro, y que veremos después, es comprobar si un usuario está autenticado mientras usa la aplicación. En caso de no estar autenticado, le mandará a la página de login/registro.

Se pueden crear otros *middlewares* que nuestra aplicación necesite, como por ejemplo registrar todas las peticiones que llegan a la aplicación, validaciones [CSRF](https://es.wikipedia.org/wiki/Cross-site_request_forgery) de formularios, validación de cabeceras\...

Los *middlewares* se sitúan en la ruta `\configdir{app/Http/Middleware/}`{=latex}, donde ya existen varios tras realizar la instalación del *framework* Laravel. Para que entren en funcionamiento, se debe realizar la configuración en el fichero de rutas, ya que se activarán dependiendo de las rutas en las que lo indiquemos.

Aparte de estar creados en la ruta especificada, también deben de estar configurados dentro del fichero [app/Http/kernel.php]{.configfile}, donde ya están configurados para su apartado correspondiente, y donde se han creado unos *alias* que hacen referencia a ellos.

# Configurando el *middleware* de autenticación {#configurando-el-middleware-de-autenticación}

El sistema de autenticación de Laravel es el ejemplo más claro de *middleware* que podemos utilizar, ya que por defecto viene instalado, pero no está configurado. En pasos anteriores hemos creado el interfaz para poder registrar usuarios y realizar el login en la aplicación.

Ahora es el momento de realizar la activación del sistema de autenticación, y que si no se ha hecho el login, no se pueda ver la aplicación y nos envíe a la página de registro.

Para ello, debemos realizar la modificación de rutas, en la que debemos indicar qué rutas queremos que estén dentro del *middleware* de autenticación. En este caso vamos a elegir que para toda la aplicación sea necesario estar autenticado:

::: mycode
[Rutas bajo el *middleware* de autenticación]{.title}
``` php
<?php
//...
Route::middleware(['auth'])->group(function () {
    Route::resources([
      'posts' => PostController::class,
    ]);
});
```
:::

## Comprobar rutas bajo *middlewares* {#comprobar-rutas-bajo-middlewares}

Si queremos comprobar qué rutas están bajo la influencia de un *middleware*, necesitaremos mirar las rutas en modo *verbose*:

::: mycode
[Vista de las rutas en modo *verbose]{.title}
``` console
root@1b29e46c10ae:/var/www/html# php artisan route:list -v
...
GET|HEAD  posts ............. posts.index › PostController@index
 → web
 → App\Http\Middleware\Authenticate
POST      posts ............. posts.store › PostController@store
 → web
 → App\Http\Middleware\Authenticate
DELETE    posts/{post} ...... posts.destroy › PostController@destroy
 → web
 → App\Http\Middleware\Authenticate
...
```
:::

Se puede comprobar que estas rutas se aplican para la parte "web" de nuestra aplicación, y que antes de ser ejecutadas pasarán por el *middleware* "**Authenticate**".

# Realizar excepciones {#realizar-excepciones}

No siempre vamos a querer que toda la aplicación esté bajo el sistema de autenticación, ya que lo habitual es que sólo sea necesario para las acciones que puedan suponer un riesgo de seguridad (edición de datos, borrado de datos, apartados sensibles,\...), por lo tanto es interesante que haya rutas que no requieran de estar autenticado.

Para ver cómo funciona, vamos a añadir excepciones al listado de todos los posts y a la visualización de cada post por separado. Para ello, al fichero de rutas añadiremos:

::: mycode
[Rutas que están exentas del *middleware* de autenticación]{.title}
``` php
<?php
//...
Route::controller(PostController::class)->group(function () {
    Route::get('/posts', 'index')->name('posts.index');
    Route::get('/posts/{post}', 'show')->name('posts.show');
})->withoutMiddleware([Auth::class]);
```
:::

Tal como se puede ver, hemos creado dos rutas del controlador "PostController" que se les indica "`->withoutMiddleware`", para que no se aplique, en este caso, la comprobación de autenticación.

# Comprobar si el usuario está autenticado {#comprobar-si-el-usuario-está-autenticado}

Por último, debemos asegurar que los botones de edición o borrado sólo aparezcan cuando el usuario esté logueado. Para ello tenemos el sistema [@auth ... @endauth]{.inlineconsole}. Si modificamos el fichero [posts/index.blade.php]{.configfile} para evitar que aparezcan los botones de edición y borrado de un post, quedaría:

::: {.mycode size=small}
[Comprobar si se está autenticado]{.title}
``` html+smarty
@auth
  <a class="btn btn-warning btn-sm" href="{{route('posts.edit',$post)}}"
   role="button">Editar</a>

  <form action="{{route('posts.destroy',$post)}}" method="POST"
    enctype="multipart/form-data">
    @csrf
    @method('DELETE')
    <button class="btn btn-sm btn-danger" type="submit"
      onclick="return confirm('Are you sure?')">Delete
    </button>
  </form>
@endauth
```
:::



