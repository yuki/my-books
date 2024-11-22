
# Introducción {#introducción}

Las **API** (en inglés "*application programming interface*") son hoy en día una parte fundamental de servicios y aplicaciones. Nos permite obtener datos, comunicar aplicaciones entre sí, y realizar una separación entre la parte lógica de la aplicación y la parte visual, pudiendo ser esta última una aplicación web, una de móvil, de televisión\...

Es por eso que aprender y entender cómo crear una API es una parte fundamental que todo programador debe conocer, ya que de esta manera vamos a entender de mejor manera cómo funcionan. Esto nos será muy útil también, incluso, para utilizarlas.

Por todo ello, a continuación se va a explicar cómo hacer que nuestra aplicación cuente con API, para poder ser utilizada desde otra aplicación o para ser utilizada para obtener datos desde otro tipo de interfaz. Para ello, cabe recordar que las peticiones y los resultados deben ir en formato [JSON](https://es.wikipedia.org/wiki/JSON).

# Rutas para la API {#rutas-para-la-api}

Hasta ahora hemos hecho uso del fichero [routes/web.php]{.configfile} para añadir rutas a nuestra aplicación. En versiones anteriores de Laravel existía un fichero [routes/api.php]{.configfile}, pero han decidido que por defecto no es necesario.

Para que nuestra aplicación cuente con el sistema de API debemos ejecutar:

::: {.mycode}
[Crear sistema API]{.title}
```console
root@5cff1feaf785:/var/www/html# php artisan install:api
```
:::

Si observamos el fichero, vemos ya existe una ruta creada:

::: {.mycode size=small}
[Contenido del fichero api.php]{.title}
```php
<?php
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');
```
:::

Si obtenemos el listado de rutas, veremos que ya existe una ruta para conocer el estado del usuario. A continuación vamos a añadir las rutas correspondientes para toda la gestión de los “posts” de nuestra aplicación.

Debemos recordar que para poder añadir las nuevas rutas, hay que incluir el controlador correspondiente, en este caso el **PostController**.

::: warnbox
Para sólo generar las rutas de la API se llama a **Route::apiresources**
:::

::: mycode
[Añadir nuevas rutas al fichero api.php]{.title}
```php
<?php
...
use App\Http\Controllers\PostController;
Route::apiresources([
    'posts' => PostController::class,
]);
```
:::

Si ahora visualizamos el listado de rutas completo veremos las nuevas rutas. Si sólo nos interesan las rutas específicas a la API, podemos añadir un parámetro indicando sólo parte de la ruta, como se muestra a continuación:


::: {.mycode size=small}
[Listar nuevas rutas]{.title}
```console
root@5cff1feaf785:/var/www/html# php artisan route:list --path=api

GET|HEAD        api/posts ............ posts.index › PostController@index
POST            api/posts ............ posts.store › PostController@store
GET|HEAD        api/posts/{post} ..... posts.show › PostController@show
PUT|PATCH       api/posts/{post} ..... posts.update › PostController@update
DELETE          api/posts/{post} ..... posts.destroy › PostController@destroy
GET|HEAD        api/user ....................................................
```
:::

<!--

FIXME: TODO: ESTO ES NECESARIO?

Por otro lado, dado que la API es un sistema en el que no vamos a guardar un estado (ya que haremos uso de ***tokens***), debemos hacer dos pequeños cambios a ficheros de configuración general.


En [app/Http/kernel.php]{.configfile} hay que modificar la sección de la API dejando:

::: {.mycode size=small}
[Modificar kernel.php]{.title}
``` php
<?php
//...
'api' => [
    \Laravel\Sanctum\Http\Middleware\EnsureFrontendRequestsAreStateful::class,
    \Illuminate\Routing\Middleware\ThrottleRequests::class.':api',
    \Illuminate\Routing\Middleware\SubstituteBindings::class,
],
```
:::

También hay que deshabilitar el [CSRF](https://en.wikipedia.org/wiki/Cross-site\_request\_forgery) para estas rutas. Para ello modificamos el fichero [app/Http/Middleware/VerifyCsrfToken.php]{.configfile} dejando:

::: mycode
[Quitamos la protección CSRF a las rutas de la API]{.title}
```php
<?php
//...
    protected $except = [
        'api/*'
    ];
```
:::

-->

# Uso de controladores para la API {#uso-de-controladores-para-la-api}

Para que la modificación previa funcione es necesario modificar el controlador, ya que actualmente sólo devuelve la vista en formato código HTML. Por tanto, si queremos utilizar el mismo controlador, deberemos modificar las funciones. En el caso de la función "index" del PostController queda:

::: mycode
[Modificar la función de PostController]{.title}
``` php
<?php
...
public function index(Request $request) {
    $posts = Post::orderBy('created_at')->get();
    if ($request->expectsJson()) {
        return response()->json($posts);
    } else {
        return view('posts.index',['posts' => $posts]);
    }
}
```
:::

Tal como se puede ver, la función recibe dos modificaciones:

-   **Añadir parámetro "Request"**: De esta manera, podremos conocer si la petición viene desde la web, o si por el contrario se espera la respuesta en formato JSON.

-   **Comprobar qué se espera**: Tal como se puede ver, se ha añadido un "if" donde se mira si la petición se espera en formato JSON ("expectsJson()"). En caso afirmativo, se devuelve la respuesta correspondiente en formato JSON.

Para comprobar que recibimos un JSON a la petición deseada, podemos ejecutar el siguiente comando:

::: mycode
[Modificar api.php para el nuevo controlador]{.title}
```console
ruben@vega:~$ curl -s  http://localhost/posts
{"posts":[{"id":1,"titulo":"Primer post","texto":"Este es...”}]}
```
:::


::: errorbox
**Es recomendable hacer uso de controladores específicos para la API**
:::


## Crear controladores específicos {#crear-controladores-específicos}

Debido a que las API se suelen versionar, es recomendable mantener los controladores de la web y de la API separados. Esto permite seguir el principio ***KISS*** (*Keep It Simple, Stupid!*). De esta manera se va a poder realizar modificaciones en un apartado de nuestra aplicación sin temer que podemos romper otra parte.

Es por ello, que lo ideal es crear controladores específicos para las funcionalidades que va a tener la API, y que se encuentren separados. Para ello realizaremos lo siguiente:

-   **Deshacer los cambios** de la función "index" vistos en el apartado anterior.

-   **Crear nuevo controlador** que será específico para la API:

    ::: {.mycode size=small}
    [Crear nuevo PostController exclusivo para la API]{.title}
    ``` console
    # php artisan make:controller API/PostController --api --model=Post
    ```
    :::

    Es necesario explicar lo siguiente:

    -   **"API/PostController"**: Esto indica cuál es la ruta donde se creará el fichero, que en este caso es [app/Http/Controllers/API/PostController.php]{.configfile}.

    -   **`--api`**: Este parámetro va a generar un controlador que carece de las funciones "create" y "edit", ya que no son necesarias en una API, dado que son exclusivas a visualizar los formularios en un interfaz web.

    -   **`--model=Post`**: Para que el nuevo fichero del controlador ya tenga el include del modelo necesario.

-   **Modificar la ruta para la API** y que de esta manera haga uso del nuevo controlador exclusivo. El cambio es el siguiente:

    ::: mycode
    [Modificar api.php para el nuevo controlador]{.title}
    ```php
    <?php
    ...
    use App\Http\Controllers\API\PostController;
    ```
    :::

-   Modificar nuevo controlador, para que devuelva los datos correspondientes:

    ::: mycode
    [Modificar el nuevo controlador PostController]{.title}
    ```php
    <?php
    ...
    use Illuminate\Http\Response;
    public function index(){
        $posts = Post::orderBy('created_at')->get();
        return response()->json(['posts'=>$posts])
            ->setStatusCode(Response::HTTP_OK);
    }
    ```
    :::

    En este caso no hemos realizado ninguna comprobación, pero en una API de verdad debemos comprobar si se han encontrado resultados, y dependiendo de ellos devolver un **estado de respuesta distinto**.

    La [librería](https://github.com/symfony/symfony/blob/6.3/src/Symfony/Component/HttpFoundation/Response.php) contiene una gran cantidad de variables para hacer referencia a los posibles códigos que podemos devolver, así como el texto que acompañan al código.

# Comprobar funcionamiento {#comprobar-funcionamiento}

Es momento de comprobar que todo funciona de manera correcta, y para ello debemos realizar una petición a la URL [http://localhost/api/posts](http://localhost/api/posts) teniendo en cuenta el ejemplo que hemos estado realizando.

Para realizar la prueba podemos hacerlo de distintas formas, cada una de ellas dependiendo de la motivación que tengamos:

-   Utilizando un interfaz gráfico como [Postman](https://www.postman.com/) o Firecamp (versión [web](https://firecamp.dev/) o [escritorio](https://github.com/firecamp-dev/firecamp)), que nos va a facilitar hacer peticiones complejas a la API.

    ![](img/laravel/postman.png){width="70%"}

-   Desde el propio **navegador web**. Veremos los datos JSON devueltos en formato texto directamente. Para comprobar que funciona, puede ser más que suficiente.

-   Desde una **consola Linux**, haciendo uso del comando **curl**, podemos también comprobar de manera rápida si el *endpoint* está funcionando:

::: mycode
[Modificar api.php para el nuevo controlador]{.title}
```console
ruben@vega:~$ curl -s  http://localhost/api/posts
{"posts":[{"id":1,"titulo":"Primer post111","texto":"Este es...”}]}
```
:::

Si queremos tener un resultado más visual, podremos hacer uso del comando "**jq**", que deberemos instalarlo. De esta manera, podremos hacer:

::: mycode
[Modificar api.php para el nuevo controlador]{.title}
```console
ruben@vega:~$ curl -s  http://localhost/api/posts | jq
{
  "posts": [
    {
      "id": 1,
      "titulo": "Primer post",
      "texto": "Este es el texto del primer post",
      "publicado": 1,
      "deleted_at": null,
      "created_at": "2024-10-29T17:09:56.000000Z",
      "updated_at": "2024-10-29T18:09:56.000000Z"
    }
  ]
}
```
:::

# Gestionar excepciones {#gestionar-excepciones}

Laravel gestiona las excepciones generando por defecto un *stacktrace* con la excepción y un error 404, por lo que en caso de existir alguna excepción en la API, el errorcode será correcto, pero devolverá información interna del *framework*.

Vamos a utilizar como ejemplo la función **show** del nuevo controlador creado. El código para esta función es:

::: mycode
[Modificar la función show de API/PostController]{.title}
``` php
<?php
...
public function show(Post $post) {
    return response()->json($post)->setStatusCode(Response::HTTP_OK);
}
```
:::


Si ahora realizamos la petición a la API de un **id** existente, nos devolverá el JSON con el contenido. En cambio, con un **id** no existente **obtendremos un json con el *stacktrace* de la excepción**.

::: exercisebox
Realizar petición a la API de un ID de un post inexistente y ver el resultado.
:::

Para evitar eso, debemos modificar el fichero [bootstrap/app.php]{.configfile} y asegurar que le añadimos lo siguiente:

::: {.mycode size=small}
[Modificar bootstrap/app.php]{.title}
``` php
<?php
...
use Illuminate\Http\Request;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;
...

->withExceptions(function (Exceptions $exceptions) {
  $exceptions->render(function (NotFoundHttpException $e, Request $request) {
      if ($request->is('api/*')) {
          return response()->json([
              'message' => 'Record not found.'
          ], 404);
      }
  });
})->create();
```
:::


# Autenticación {#autenticación}

Para poder realizar ciertas acciones a través de la API es lógico pensar que también deberemos estar autenticados, y para eso es necesario asegurar que al acceder a las rutas lo estemos. Para todo ello, vamos a crear un controlador propio donde tener en cuenta los datos que se envían al acceder a la API.

La idea general es que una aplicación al hacer uso de una API debe tener en cuenta:

-   Si el usuario no está registrado, poder registrarse.

-   Si el usuario está registrado, se podrá loguear con lo que recibirá un ***token***.

-   A partir de este momento, cada acción que quiera realizar, deberá ir acompañado del token para demostrar que está autenticado.

-   Los *tokens* pueden tener una vida útil. Por lo tanto, si el token expira, deberá volver a loguearse.

## Crear controlador de autenticación {#crear-controlador-de-autenticación}

Se va a crear un controlador propio para tener el control de las acciones que se pueden realizar a través de la API, y así asegurar cuál es el estado de los tokens y/o del usuario que pide realizar una acción.

Para crear un controlador propio que sólo será usado para la API:

::: {.mycode size=footnotesize}
[Crear nuevo controlador]{.title}
``` console
root@5cff1feaf785:/var/www/html# php artisan make:controller API/AuthController
INFO  Controller [app/Http/Controllers/API/AuthController.php] created successfully.
```
:::

En este controlador vamos a tener tres funciones:

-   **register**: para que el usuario se pueda registrar.

-   **login**: para que el usuario se pueda loguear y recibir un token.

-   **logout**: para que el usuario se pueda desloguear y de esta manera el token se revoque.

El controlador, quedaría de la siguiente manera.

::: errorbox
**Es importante entender qué hace cada una de las funciones**
:::

::: {.mycode size=footnotesize}
[Nuevo AuthController para la API]{.title}
```php
<?php
namespace App\Http\Controllers\API;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\ValidationException;
use Illuminate\Http\Response;

class AuthController extends Controller {

    public function register(Request $request){
        $validatedData = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:8',
        ]);

        $user = User::create([
            'name' => $validatedData['name'],
            'email' => $validatedData['email'],
            'password' => Hash::make($validatedData['password']),
        ]);

        return response()->json([
            'name' => $user->name,
            'email' => $user->email,
        ])->setStatusCode(Response::HTTP_CREATED);
    }

    public function login(Request $request){
        $request->validate([
            'email' => 'required|email',
            'password' => 'required',
            'device_name' => 'required',
        ]);

        $user = User::where('email',  $request->email)->first();

        if (! $user || !Hash::check($request->password, $user->password)){
            return response()->json([
                'message' => ['Username or password incorrect'],
            ])->setStatusCode(Response::HTTP_UNAUTHORIZED);
        }
        // FIXME: queremos dejar más dispositivos?
        // $user->tokens()->delete();

        return response()->json([
            'status' => 'success',
            'message' => 'User logged in successfully',
            'name' => $user->name,
            'token' => $user->createToken($request->device_name)->plainTextToken,
        ]);
    }

    public function logout(Request $request){
        $request->user()->currentAccessToken()->delete();
        return response()->json([
            'status' => 'success',
            'message' => 'User logged out successfully'
        ])->setStatusCode(Response::HTTP_OK);
    }
}
```
:::

Es importante notar un comentario que se ha dejado en la función "**login**". Dependiendo de si queremos que la API permita tener varios tokens para un mismo usuario o no (posibles logins desde distintos dispositivos), deberemos dejar comentado o descomentar la línea indicada.

Tal como se puede ver, a la hora de realizar la acción de ***login***, se llama a `createToken($request->device_name)`, por lo que es necesario que el Modelo tenga acceso a esa función. Por ello, nos aseguramos que [app/Models/User.php]{.configfile} cuente con:

::: {.mycode}
[Modificar modelo User]{.title}
```php
<?php
namespace App\Models;
//...
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    /** @use HasFactory<\Database\Factories\UserFactory> */
    use HasApiTokens, HasFactory, Notifiable;
    //...
}
```
:::


Para que estas funciones entren en juego, debemos modificar el fichero de rutas [api.php]{.configfile}.

::: mycode
[Rutas de autenticación para la API]{.title}
``` php
<?php
use App\Http\Controllers\API\AuthController;
//...
Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);
Route::post('/logout', [AuthController::class, 'logout'])
    ->middleware('auth:sanctum');
```
:::

## Modificar rutas {#modificar-rutas}

Tal como hemos hecho anteriormente, para que la aplicación funcione bajo el sistema de autenticación, y que automáticamente nos indique que no estamos autenticados, debemos realizar la modificación del fichero de rutas [api.php]{.configfile}


De manera similar a la aplicación web, deberemos indicar qué rutas queremos que se puedan obtener sin estar autenticado y cuáles no.

::: mycode
[Rutas autenticadas para la API]{.title}
```php
<?php
//...
Route::middleware(['auth:sanctum'])->group(function () {
    Route::apiresources([
        'posts' => PostController::class,
    ]);
});

Route::controller(PostController::class)->group(function () {
    Route::get('/posts', 'index')->name('posts.index');
    Route::get('/posts/{post}', 'show')->name('posts.show');
})->withoutMiddleware(['auth:sanctum']);
```
:::

## Pruebas de funcionamiento {#pruebas-de-funcionamiento}

Para que la autenticación funcione, podemos realizar pruebas a través de Postman, de manera similar a como hemos hecho anteriormente. Ahora hay que tener en cuenta que la petición va a ser de tipo **POST**, y dado que queremos crear un *post*, tendremos que realizar el paso de parámetros.

Por lo tanto, los pasos que debemos realizar son:

-   Realizar prueba de login. Debemos pasar los parámetros y obtendremos el token y una serie de datos extra, que podremos utilizar en nuestra aplicación.

    -   email

    -   password

    -   device_name

    ::: center
    ![](img/laravel/postman_login.png){width="80%"}
    :::

-   Con ese token podremos realizar la prueba de añadir un nuevo *post* a través de la API.

    ::: center
    ![](img/laravel/postman_create.png){width="80%"}
    :::

    Deberemos indicar:

    -   Los parámetros necesarios para la creación del *post*: "título", "texto" y "publicado".

    -   El tipo de token de autenticación en la pestaña "Auth" de Postman tiene que ser de tipo "**Bearer Token**".

# Visualizar API {#visualizar-api}

Suele ser habitual tener un interfaz donde se muestra el funcionamiento de nuestra API, o cuáles son los *endpoints* de la misma. Es decir, qué URL se pueden consultar, qué método hay que utilizar, si es necesario el paso de parámetros, \...

Hoy en día existe la especificación [OpenAPI](https://www.openapis.org/) para la generación de la API, y sobre ella existen distintos interfaces web. Uno de los interfaces más utilizados es [Swagger UI](https://swagger.io/tools/swagger-ui/) que nos muestra un bonito interfaz y a la vez es posible utilizarlo para realizar consultas a la API.

Para poder instalarlo en nuestro proyecto Laravel, necesitamos realizar la instalación de unas dependencias y la posterior instalación en el proyecto.

::: {.mycode size=small}
[Instalación de dependencias]{.title}
```console
root@5cff1feaf785:/var/www/html# composer require "darkaonline/l5-swagger"
root@5cff1feaf785:/var/www/html# php artisan vendor:publish \
    --provider "L5Swagger\L5SwaggerServiceProvider"
```
:::

Para poder generar el interfaz de manera correcta añadimos comentarios a las funciones. En uno de los controladores añadiremos la siguiente cabecera, que nos va a servir para definir el tipo de autenticación:

::: mycode
[Cabecera para la API]{.title}
```php
<?php
//...
/**
* @OA\Info(title="API", version="1.0"),
* @OA\SecurityScheme(
*     in="header",
*     scheme="bearer",
*     bearerFormat="JWT",
*     securityScheme="bearerAuth",
*     type="http",
* ),
*/
```
:::

Para documentar la función **index**, encima de ella añadiremos lo siguiente. Hay que darse cuenta que en este caso sólo hemos documentado la respuesta "200".

::: mycode
[Comentario para /api/posts]{.title}
```php
<?php
//...
/**
* @OA\Get(
*     path="/api/posts",
*     summary="Mostrar posts",
*     @OA\Response(
*         response=200,
*         description="Mostrar todos los posts."
*     ),
*     @OA\Response(
*         response="default",
*         description="Ha ocurrido un error."
*     )
* )
*/
public function index(){
//...
```
:::

Para documentar la función de guardar un *post* desde la API, usaremos los siguientes comentarios:

::: mycode
[Comentario para función POST /api/posts]{.title}
```php
<?php
//...
    /**
* @OA\Post(
*     path="/api/posts",
*     summary="Create a post",
*     @OA\Parameter(
*         name="titulo",
*         in="query",
*         description="The title of the post",
*         required=true,
*         @OA\Schema(
*             type="string"
*         )
*     ),
*     @OA\Response(
*         response=200,
*         description="successful operation",
*         @OA\JsonContent(
*             type="string"
*         ),
*     ),
*     @OA\Response(
*         response=401,
*         description="Unauthenticated"
*     ),
*     security={
    *         {"bearerAuth": {}}
    *     }
* )
*/
public function store(Request $request){
```
:::

Por último, vamos a poner otro ejemplo, para documentar el obtener un *post* concreto. Para ello los comentarios serán:

::: mycode
[Comentario para función GET]{.title}
```php
<?php
//...
/**
* @OA\Get(
*     path="/api/posts/{id}",
*     summary="Mostrar un post concreto",
*     @OA\Parameter(
*          name="id",
*          description="Project id",
*          required=true,
*          in="path",
*          @OA\Schema(
*              type="integer"
*          )
*     ),
*     @OA\Response(
*         response=200,
*         description="Mostrar el post especificado."
*     ),
*     @OA\Response(
*         response="default",
*         description="Ha ocurrido un error."
*     )
* )
*/
public function show(Post $post){
```
:::

No se han añadido todos los parámetros en todos los casos, ya que resulta redundante y es fácil añadir los que faltan.

Para conocer todas las funcionalidades de los comentarios, es recomendable mirar la [documentación](https://github.com/zircote/swagger-php#usage). Desde aquí nos mostrará el enlace para la [documentación oficial de Swagger PHP](https://zircote.github.io/swagger-php/#links), o lo que nos puede resultar más interesante, que es un conjunto de [ejemplos](https://github.com/zircote/swagger-php/tree/master/Examples) junto con el [resultado en forma de web](https://petstore.swagger.io/#/).

Tras esto, ejecutaremos el comando que recorrerá los controladores para generar el fichero [storage/api-docs/api-docs.json]{.configfile}. Este es el fichero que el interfaz web tendrá en cuenta a la hora de generar la web que podemos ver a continuación.

El comando es el siguiente:

::: mycode
[Generamos el fichero json para Swagger]{.title}
```console
root@5cff1feaf785:/var/www/html# php artisan l5-swagger:generate
Regenerating docs default
```
:::

Tras ejecutar el comando anterior, si vamos a la url [http://localhost/api/documentation](http://localhost/api/documentation) tendremos acceso y veremos el interfaz para nuestra API:

![](img/laravel/swagger.png){width="80%" framed=true}


::: exercisebox
Completar los comentarios añadiendo los parámetros que faltan a la función de crear y los necesarios para la función de borrado de posts.
:::

