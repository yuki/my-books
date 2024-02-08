
# Crear rutas necesarias {#crear-rutas-necesarias}

Una aplicación web normalmente nos va a permitir crear datos, no sólo visualizarlos. Por lo tanto vamos a tener que crear la vista de un formulario que el usuario pueda utilizar para crear datos a través del controlador.

Tal como hemos dicho, las funcionalidades de la aplicación empiezan por crear una ruta a la que el usuario puede acceder. En este caso, se podrían crear las rutas necesarias para visualizar el formulario de creación, obtener los datos para la creación, edición y actualización de datos\...

En lugar de eso el sistema de rutas de Laravel nos permite simplificarlo, y si tenemos un modelo que sabemos que es de tipo "resource", nos permite crear todas las rutas necesarias para la gestión de los datos. Por lo tanto, las rutas quedarían de la siguiente manera:

::: mycode
[Rutas simplificadas para un modelo de tipo "resource"]{.title}
``` php
<?php
//...
Route::resources([
    'posts' => PostController::class,
]);
```
:::

Si miramos las rutas generadas, veremos que nos ha creado todas las rutas necesarias para interactuar con los posts:

::: mycode
[Mirando todas las rutas creadas]{.title}

``` console
root@1b29e46c10ae:/var/www/html# php artisan route:list
GET|HEAD   posts ............ posts.index › PostController@index
POST       posts ............ posts.store › PostController@store
GET|HEAD   posts/create ..... posts.create › PostController@create
GET|HEAD   posts/{post} ..... posts.show › PostController@show
PUT|PATCH  posts/{post} ..... posts.update › PostController@update
DELETE     posts/{post} ..... posts.destroy › PostController@destroy
GET|HEAD   posts/{post}/edit. posts.edit › PostController@edit
```
:::

Tal como se puede ver, por haber indicado la ruta anterior, automáticamente nos ha creado las rutas para listar, crear, visualizar, actualizar, editar y borrar el recurso. Con una única línea nos evita tener que escribir todas las líneas que supondrían de configuración.

# Crear registro {#crear-registro}

A la hora de crear un registro, Laravel por defecto hace uso de la ruta "create", por lo que deberemos crear un botón en la vista principal que nos mande a la URL "/posts/create", por lo que la vista de creación será [create.blade.php]{.configfile}.

En esta vista debemos crear un formulario, en el que se tendrá en cuenta los siguientes apartados:

-   **Ruta del *action* a ejecutar**: se debe indicar la ruta donde se mandarán los datos, que debe coincidir con la función que guardará los datos en la base de datos. Por defecto, la ruta es "store".

-   **Método**: el método para enviar datos al servidor será POST.

-   [@csrf]{.inlineconsole}: es un atributo especial de Blade que genera un atributo oculto "input" en el formulario donde se guarda el token [CSRF](https://es.wikipedia.org/wiki/Cross-site_request_forgery), para posteriormente comprobar que es correcto.

Con todo ello, la vista quedaría de la siguiente forma:

::: {.mycode size=footnotesize}
[Vista del formulario]{.title}
``` html+smarty
@extends('layouts.app')
@section('content')
  <div class="container">
    <form class="mt-2" name="create_platform"
       action="{{route('posts.store')}}" method="POST" enctype="multipart/form-data">
      @csrf
      <div class="form-group mb-3">
        <label for="titulo" class="form-label">Titulo</label>
        <input type="text" class="form-control" id="titulo" name="titulo" required/>
      </div>
      <div class="form-group mb-3">
        <label for="texto" class="form-label">Texto</label>
        <textarea type="textarea" rows="5" class="form-control" id="texto" name="texto">
        </textarea>
      </div>
      <div class="form-check">
        <input class="form-check-input" type="checkbox" id="publicado"
          name="publicado">
        <label class="form-check-label" for="publicado">
        ¿Publicar?
      </label>
      </div>
      <button type="submit" class="btn btn-primary" name="">Crear</button>
    </form>
  </div>
@endsection
```
:::

Al pulsar el botón "Crear" se realizará una petición "**POST**" a la ruta "**posts.store**", por lo tanto es la función que debemos modificar ahora en el controlador, que junto con la función "create", tendrá la siguiente forma:

::: mycode
[Añadiendo funcionalidad al controlador]{.title}
``` php
<?php
//...
public function create(){
    return view('posts.create');
}

public function store(Request $request){
    $post = new Post();
    $post->titulo = $request->titulo;
    $post->texto = $request->texto;
    $post->publicado = $request->has('publicado');
    $post->save();
    return redirect()->route('posts.index');
}
```
:::


# Editar registro {#editar-registro}

Una vez creados los registros nos va a interesar poder editarlos. Para ello, tendremos que añadir a las vistas correspondientes (el listado general y/o desde la vista del post) un botón que nos lleve a la ruta para editar, que es: [/posts/{id}/edit]{.configlink}.

Para poder visualizar los datos, deberemos obtener desde el controlador los datos referentes a ese "id" para poder visualizarlo en el formulario que crearemos en la vista [posts/edit.blade.php]{.configfile}. Después, en la función update deberemos realizar el guardado de las modificaciones.

::: mycode
[Añadiendo funcionalidad al controlador]{.title}
``` php
<?php
//...
public function edit(Post $post){
    return view('posts.edit',['post'=>$post]);
}

public function update(Request $request, Post $post){
    $post->titulo = $request->titulo;
    $post->texto = $request->texto;
    $post->publicado = $request->has('publicado');
    $post->save();
    return view('posts.show',['post'=>$post]);
}
```
:::

Tal como se puede ver, la función de actualizar lo que hace es recibir los datos del formulario y el registro a actualizar. Existe la posibilidad de conocer si [alguno de los campos ha sido modificado](https://laravel.com/docs/10.x/eloquent#updates) antes de realizar la actualización. Después, debemos sustituir los campos y para finalizar guardar los cambios del registro. Por último, volvemos a la vista para visualizar los cambios.

La vista para editar el registro quedaría:

::: {.mycode size=footnotesize}
[Vista del formulario]{.title} 
``` html+smarty
@extends('layouts.app')
@section('content')
<div class="container">
  <form class="mt-2" name="create_platform" action="{{route('posts.update',$post)}}"
    method="POST" enctype="multipart/form-data">
    @csrf
    @method('PUT')
    <div class="form-group mb-3">
      <label for="titulo" class="form-label">Titulo</label>
      <input type="text" class="form-control" id="titulo" name="titulo" required
        value="{{$post->titulo}}"/>
    </div>
    <div class="form-group mb-3">
      <label for="texto" class="form-label">Texto</label>
      <textarea type="textarea" rows="5" class="form-control" id="texto" name="texto">
        {{$post->texto}}
      </textarea>
    </div>
    <div class="form-check">
      <input class="form-check-input" type="checkbox" id="publicado" name="publicado"
        @checked($post->publicado)>
      <label class="form-check-label" for="publicado">
      ¿Publicar?
      </label>
    </div>

    <button type="submit" class="btn btn-primary" name="">Actualizar</button>
  </form>
</div>
@endsection
```
:::

Dado que es el formulario de edición, deben existir datos, de ahí que para cada apartado haya que añadir el parámetro "value" en los *inputs*, el valor dentro del *textarea*, o darle el valor correspondiente al *checkbox*.

También hay que tener en cuenta que debido a cómo funciona el protocolo HTTP con los formularios, [el método PUT no se puede utilizar en formularios diréctamente](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/PUT), por lo que debemos añadir [@method('PUT')]{.inlineconsole} para que lo genere [oculto](https://laravel.com/docs/10.x/blade#method-field) en el formulario.

::: exercisebox
Dado que el formulario de crear y actualizar es prácticamente igual, sería interesante crear una única vista que sirva para ambos métodos.
:::

# Borrar registro {#borrar-registro}

Por último, tenemos que poder eliminar registros, por lo que deberemos añadir un botón que ejecute la acción de borrado que se recibirá en el controlador.
Este botón lo vamos a añadir a la lista de posts, que junto con el botón editar del apartado anterior, quedaría:

::: {.mycode size=footnotesize}
[Vista del index.blade.php]
``` html+smarty
@foreach ($posts as $post)
  {{-- visualizamos los atributos del objeto --}}
  <li class="pt-1">
    <div class="d-flex flex-row">
      <a href="{{route('posts.show',$post)}}"> {{$post->titulo}}</a>.
      Escrito el {{$post->created_at}}
      <a class="btn btn-warning btn-sm" href="{{route('posts.edit',$post)}}"
        role="button">Editar</a>

      <form action="{{route('posts.destroy',$post)}}" method="POST">
        @csrf
        @method('DELETE')
        <button class="btn btn-sm btn-danger" type="submit"
          onclick="return confirm('Are you sure?')">Delete
        </button>
      </form>
    </div>
  </li>
@endforeach
```
:::

Y por último el controlador debe borrar el objeto cuando se llama a la función **delete**:

::: mycode
[Añadiendo funcionalidad al controlador]{.title}
``` php
<?php
//....
public function destroy(Post $post) {
    $post->delete();
    return redirect()->route('posts.index');
}
```
:::
