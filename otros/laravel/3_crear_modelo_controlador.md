
# Introducción {#introducción-crear-modelo}

Ahora que ya tenemos el entorno creado, es momento de empezar a añadir funcionalidad básica a nuestra aplicación y comenzar a crear nuestra aplicación. Para estos ejemplos se ha decidido crear una pequeña aplicación a modo de blog, con posts y comentarios.

# Artisan {#artisan}

[Artisan](https://laravel.com/docs/11.x/artisan) es la interfaz de línea de comandos que vamos a utilizar para realizar todo tipo de interacción entre el proyecto y el propio *framework* Laravel. Esta interfaz nos va a permitir, entre otras cosas:

-   Crear modelos y controladores.

-   Crear una sesión a la base de datos.

-   Controlar el estado de los "migrations".

-   Hacer uso de los "seeds" en la base de datos.

-   Limpiar la caché de objetos.

Cada comando contará con su ayuda, por lo que es recomendable ir mirando la ayuda y así conocer las distintas opciones para cada uno de ellos.

# Crear modelo {#crear-modelo}

Un blog tiene una serie de "Posts", que son las entradas que los usuarios introducen en el blog. De momento vamos a ignorar el apartado de usuarios, para simplificarlo. Una entrada del blog contará con los siguientes atributos:

-   Título

-   Texto

-   Si está publicada o no

Para crear el modelo, ejecutaremos el siguiente comando. Este comando lo debemos ejecutar dentro del contenedor Docker y dentro de la ruta donde se encuentra el proyecto Laravel, que es [/var/www/html]{.configdir}:

::: mycode
[Crear Modelo]{.title}
```console
root@1b29e46c10ae:/var/www/html# php artisan make:model Post -crms
```
:::


Este comando nos va a crear el modelo Post junto con:

-   **Controlador** de tipo "resource", lo que va a permitir realizar acciones "**CRUD**" (*create*, *read*, *update* y *delete*), necesarias en cualquier aplicación web.

-   ***Migration***: Un fichero para realizar la migración del modelo en la base de datos.

-   ***Seed***: Un fichero de tipo "semilla" para introducir datos en la base de datos.

# Entendiendo las "*migrations*" de base datos {#entendiendo-las-migrations-de-base-datos}

Hoy en día son muchos los *frameworks* que hacen uso de sistemas de tipo ***migration*** a la hora de interactuar en el tiempo con la base de datos. Podríamos definirlo como un **sistema de control de versiones para el esquema de base de datos**.

Este sistema permite ir evolucionando el esquema de base de datos (tablas, columnas de las tablas, funciones\...) a medida que el propio código fuente de la aplicación va evolucionando. De esta manera, si tenemos el código en un punto concreto, con el sistema **migrations** nos va a crear la base de datos tal como se necesita en ese punto.

Al crear nuestro proyecto Laravel, ya contamos con una serie de ficheros de migraciones para la base de datos. Estos ficheros se encuentran en [app/database/migrations/]{.configdir}}, teniendo cada fichero un formato similar a [YYYY_mm_dd_HHMMSS_comentario.php]{.configfile} siendo:

-   **YYYY**: el año que se ha creado el fichero.

-   **mm**: el mes que se ha creado el fichero.

-   **dd**: el día que se ha creado el fichero.

-   **HHMMSS**: la hora, minuto y segundo.

-   **comentario**: un pequeño comentario sobre el contenido del fichero.

De esta manera, los migrations se van a poder ejecutar en orden de fecha de creación, donde normalmente suele ser:

-   **De más antiguo a más nuevo**: Se van creando las tablas, y se van añadiendo modificaciones. Es el ciclo normal de desarrollo, y este es el sistema de uso habitual.

-   **De más nuevo a más antiguo**: Se vuelve atrás en el proyecto, eliminando modificaciones. Utilizado para ir a una versión antigua del proyecto.

Vamos a utilizar como ejemplo el primer fichero que existe en el directorio, que es para hacer uso de la tabla de usuarios del sistema de autenticación de Laravel. El fichero tiene una clase que extiende de la clase **Migration** con dos funciones:

::: mycode
[Fichero Migration]{.title}
``` php
<?php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void {
        Schema::create('users', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('email')->unique();
            $table->timestamp('email_verified_at')->nullable();
            $table->string('password');
            $table->rememberToken();
            $table->timestamps();
        });
    }

    public function down(): void {
        Schema::dropIfExists('users');
    }
};
```
:::

La función [up()]{.inlineconsole} se ejecutará cuando realizamos la migración, mientra que la función [down()]{.inlineconsole} se usará cuando realicemos un "***rollback***" (echar para atrás una migración).

::: warnbox
**Por convenio, el nombre de los modelos suelen ser en singular, mientras que las tablas se deben crear en plural. [Pero se puede cambiar el nombre de la tabla](https://laravel.com/docs/11.x/eloquent\#table-names).**
:::

## Opciones de las migraciones {#opciones-de-las-migraciones}

En la [documentación oficial](https://laravel.com/docs/11.x/migrations#tables) se explican cómo funcionan los *migrations*, las funcionalidades básicas y avanzadas que tienen, así como los distintos [tipos de columnas](https://laravel.com/docs/11.x/migrations#available-column-types) que podemos utilizar.

Teniendo en cuenta lo visto en el punto anterior, podemos visualizar que las acciones del *migration* contiene varias líneas, y vamos a destacar lo siguiente para el fichero [2014_10_12_000000_create_users_table.php]{.configfile}:

-   Crea una tabla llamada "**users**", que contiene varias columnas

-   **id**: es un alias al método **bigIncrements**. Va a generar una columna de tipo "*big integer*" sin signo, que se va a ir incrementando y que va a ser **clave primaria**.

-   **string**: existen varias columnas de tipo "string", que son "name", "email" y "password". Es lo equivalente a "varchar", sin indicar en este caso el número de longitud. Se le puede indicar como segundo parámetro.

-   **unique()**: el contenido de este campo (en el ejemplo el **email**) debe ser único en la tabla.

-   **timestamp**: crea un campo de tipo TIMESTAMP.

-   **nullable**: permite que este campo sea **null**.

-   **timestamps()**: Este es un método especial que crea dos campos en la base de datos: "**created_at"** y "**updated_at**". De esta manera sabemos cuándo se ha creado y modificado el registro en la base de datos.

::: exercisebox
Añade a la migración del modelo Post, la generación de los campos: “título”, “texto” y “publicado”. Recuerda mirar la documentación oficial.
:::

## Uso de las migraciones {#uso-de-las-migraciones}

Una vez tenemos distintos ficheros de migraciones, hay que saber cómo aplicarlos y qué sucede con ellos. De nuevo, en la [documentación](https://laravel.com/docs/11.x/migrations#running-migrations) aparecen distintos ejemplos, de los cuales se van a destacar sólo unos a continuación:

### Desplegar migraciones {#desplegar-migraciones}

Para realizar el despliegue de todas las migraciones debemos ejecutar el siguiente comando:

::: mycode
[Ejecutar migraciones]{.title}
``` console
root@1b29e46c10ae:/var/www/html# php artisan migrate
   INFO  Preparing database.
Creating migration table ............................. 52ms DONE

   INFO  Running migrations.
2014_10_12_000000_create_users_table ..............   108ms DONE
2014_10_12_100000_create_password_reset_tokens_table  127ms DONE
2019_08_19_000000_create_failed_jobs_table .........   88ms DONE
2019_12_14_000001_create_personal_access_tokens_table 140ms DONE
2023_09_26_094514_create_posts_table ...............   74ms DONE
```
:::

### Comprobar estado de las migraciones {#comprobar-estado-de-las-migraciones}

Para comprobar el estado de las migraciones podemos realizarlo de la siguiente manera:

::: mycode
[Estado de las migraciones]{.title}
``` console
root@1b29e46c10ae:/var/www/html# php artisan migrate:status

Migration name ................................ Batch / Status
2014_10_12_000000_create_users_table ................. [1] Ran
2014_10_12_100000_create_password_reset_tokens_table . [1] Ran
2019_08_19_000000_create_failed_jobs_table ........... [1] Ran
2019_12_14_000001_create_personal_access_tokens_table  [1] Ran
2023_09_26_094514_create_posts_table ................. [1] Ran
```
:::

Si queremos ver a nivel de base de datos qué ha pasado, podemos ejecutar una sesión y visualizar la propia base de datos. Veremos cómo se ha creado la base de datos, las tablas, y una tabla especial llamada **migrations**, que contiene qué ficheros se han desplegado.

::: mycode
[Ejecutar migraciones]{.title}
``` mysql
root@1b29e46c10ae:/var/www/html# php artisan db

mysql> use example_app;
Database changed

mysql> show tables;
+------------------------+
| Tables_in_example_app  |
+------------------------+
| failed_jobs            |
| migrations             |
| password_reset_tokens  |
| personal_access_tokens |
| posts                  |
| users                  |
+------------------------+
6 rows in set (0.00 sec)

mysql> select * from migrations;
+----+-------------------------------------------------------+-------+
| id | migration                                             | batch |
+----+-------------------------------------------------------+-------+
|  1 | 2014_10_12_000000_create_users_table                  |     1 |
|  2 | 2014_10_12_100000_create_password_reset_tokens_table  |     1 |
|  3 | 2019_08_19_000000_create_failed_jobs_table            |     1 |
|  4 | 2019_12_14_000001_create_personal_access_tokens_table |     1 |
|  5 | 2023_09_26_094514_create_posts_table                  |     1 |
+----+-------------------------------------------------------+-------+
5 rows in set (0.00 sec)
```
:::

### *Rollback* la última migración {#rollback-la-última-migración}

En un momento dado nos puede interesar echar atrás la última migración, y para ello contamos con la opción ***rollback***. Este sistema puede que deshaga las migraciones de varios ficheros.

::: mycode
[Ejecutar migraciones]{.title}
``` mysql
root@1b29e46c10ae:/var/www/html# php artisan migrate:rollback

INFO  Rolling back migrations.
2023_09_26_094514_create_posts_table ................  27ms DONE
2019_12_14_000001_create_personal_access_tokens_table  26ms DONE
2019_08_19_000000_create_failed_jobs_table ..........  25ms DONE
2014_10_12_100000_create_password_reset_tokens_table   24ms DONE
2014_10_12_000000_create_users_table ................  27ms DONE
```
:::

En este caso, como el migrate hizo todos los ficheros, el *rollback* se ha ejecutado de todos los ficheros pero **en orden inverso al de creación**.

### Limpiar, *reset* y recarga de migraciones {#limpiar-reset-y-recarga-de-migraciones}

Para asegurar que el sistema de migraciones está funcionando bien, para hacer pruebas, o para realizar despliegues limpios quizá nos interese borrar todas las migraciones de la aplicación o realizar una recarga de las mismas.

-   **db:wipe**: borra todas las tablas, vistas y tipos.

-   **migrate:fresh**: borra todas las tablas de la base de datos y aplica de nuevo todas migraciones.

-   **migrate:reset**: deshace todas las migraciones de la aplicación. Básicamente es dejar la base de datos limpia. **En este caso no se borra la tabla "*migration*"**.

-   **migrate:refresh**: deshace todas las migraciones de la aplicación y las vuelve a aplicar en orden.

## Uso de las semillas {#uso-de-las-semillas}

A la hora de crear una aplicación es posible que nos interese que tras realizar un primer despliegue existan datos en la base de datos. Ya sea porque estos datos son necesarios para el correcto funcionamiento de la aplicación o para darle una funcionalidad básica.

Para poblar de datos la base de datos existe el sistema de semillas, o ***[seeds](https://laravel.com/docs/11.x/seeding)***. Este sistema funciona a través de sus propios ficheros, que se pueden crear por modelo (tal como hemos hecho en este capítulo), o de manera general en una semilla propia.

Con la generación del modelo se ha creado también el fichero al que vamos a añadirle el código necesario para que cree un primer post de pruebas: [app/database/seeders/PostSeeder.php]{.configfile}.

::: mycode
[*Seed* del PostSeeder.php]{.title}
``` php
<?php
namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class PostSeeder extends Seeder {
    public function run(): void {
        DB::table('posts')->insert([
            "titulo"=>"Primer post",
            "texto"=>"Este es el texto del primer post",
            "publicado"=>true,
            "created_at"=>now(),
        ]);
    }
}
```
:::

Para poder hacer uso del modelo "**DB**" es necesario hacer uso de la librería "**`Illuminate\Support\Facades\DB`**". Ahora sólo queda ejecutar el *seed* tal como se explica en la [documentación](https://laravel.com/docs/11.x/seeding):

::: mycode
[Ejecutar el seed]{.title}
``` console
root@1b29e46c10ae:/var/www/html# php artisan db:seed PostSeeder
INFO  Seeding database.
```
:::

Si se comprueba la base de datos, se verá cómo en la tabla aparecen los datos del *seed*.

# Rutas de la aplicación {#rutas-de-la-aplicación}

Aunque ya tenemos un controlador y datos en la aplicación, hasta ahora son inaccesibles. Lo único que vemos en la aplicación es la página de bienvenida al proyecto y si ponemos cualquier ruta en la URL nos aparece un error "404 Not Found".

Esto es debido al sistema de enrutado de la aplicación, que sólo permite acceder al *path* "/" que nos muestra la plantilla de bienvenida. Esta configuración se puede ver en el fichero [routes/web.php]{.configfile}.

::: mycode
[Rutas de la aplicación web de Laravel]{.title}
``` php
<?php
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});
```
:::

Cualquier intento de acceso a algo que no sea esa ruta dará un error 404. Este es un sistema de seguridad para controlar a qué se tiene acceso en la aplicación, y por eso que debemos modificar este fichero para poder acceder a nuestro nuevo controlador.

::: mycode
[Añadiendo rutas para el nuevo controlador]{.title}
``` php
<?php
// ...
use App\Http\Controllers\PostController;
Route::controller(PostController::class)->group(function () {
    Route::get('/posts', 'index')->name('posts.index');
    Route::get('/posts/{post}', 'show')->name('posts.show');
});
```
:::

Este código indica que se va a utilizar la clase "PostController" para el grupo de las rutas que aparecen en ese trozo de código. Si vamos al fichero [App/Http/Controllers/PostController.php]{.configfile} veremos que por defecto todas las funciones están vacías, y es por eso que no nos devuelve ningún dato.

Por lo tanto, la idea es:

-   **/posts**: irá a la función "index" del controlador. Esta función normalmente lista el contenido de la tabla de base de datos que hace referencia al modelo. En nuestro caso, mostrará todos los posts del blog (normalmente en formato paginado).

-   **/posts/{post}**: esta ruta será la utilizada cuando queramos ir a ver un registro del modelo concreto. En este caso "{post}" indicará el "id" dentro de la base de datos que se le pasará a la función "show".

Existe un comando para visualizar qué rutas están configuradas en nuestra aplicación: 

::: mycode
[Añadiendo rutas para el nuevo controlador]{.title}
``` console
root@1b29e46c10ae:/var/www/html# php artisan route:list

  GET|HEAD       / ................................................. 
  GET|HEAD       posts ........... posts.index › PostController@index
  GET|HEAD       posts/{post} ...... posts.show › PostController@show
  GET|HEAD       storage/{path} ....................... storage.local
  GET|HEAD       up ................................................. 
                                                   Showing [5] routes
```
:::


En el siguiente apartado, cuando modifiquemos el controlador quedará más claro.

## Tipos de rutas {#tipos-de-rutas}

Hay que entender que las rutas funcionan en base al protocolo HTTP. Esto quiere decir que existen distintas maneras de acceder a la misma URL dependiendo del tipo de petición que se realice en base a lo que realicemos con el navegador.

Normalmente, cuando navegamos por internet, las peticiones que se realizan son de tipo **GET**, ya que estamos pidiendo información al servidor web. En cambio, cuando rellenamos un formulario y le damos a enviar, se hace uso del "verbo" **POST**, ya que se envían datos al servidor.

Las peticiones HTTP que se pueden utilizar son:

-   **GET**: Se realiza una petición a la ruta especificada. Estas peticiones sólo obtienen información.

-   **POST**: Se envían datos al servidor, que van incluidos dentro del cuerpo de la petición. Lo habitual cuando utilizamos formularios. Se utiliza para crear nuevos recursos.

-   **PUT**: Similar a POST, pero en este caso suele estar orientado a modificar datos previamente creados.

-   **PATCH**: Como PUT, sobreescribe completamente un recurso existente.

-   **DELETE**: Borra el recurso especificado.

Es conveniente mirar la [documentación](https://laravel.com/docs/11.x/routing) cuando queramos realizar algún tipo de petición distinto de GET, ya que nos ayudará a comprender mejor qué es lo que está sucediendo.


# Controladores y Vistas {#controladores-y-vistas}

Ahora que ya tenemos las rutas creadas, es momento de que los datos se visualicen en la aplicación. Para ello es necesario entender cómo funciona el sistema de plantillas utilizado por Laravel, llamado **[Blade](https://laravel.com/docs/11.x/blade)**, que junto con el sistema de **enrutado** visto previamente, relaciona la URL a la que se llama con el controlador y la vista correspondientes.

## Obtener datos en el controlador {#obtener-datos-en-el-controlador}

El ejemplo va a consistir en obtener todos los posts de la base de datos y hacer un listado con ellos. Por otro lado, al seleccionar un post concreto, se mostrará dicho post. Para ello vamos a modificar el controlador para modificar las dos funciones que se utilizan en las rutas:

::: mycode
[Funciones modificadas en el controlador Post]{.title}
```php
<?php
// ...
use App\Models\Post;
// ...
class PostController extends Controller{
    public function index(){
        $posts = Post::orderBy('created_at')->get();
        return view('posts.index',['posts' => $posts]);
    }
    //...
    public function show(Post $post){
        return view('posts.show',['post'=>$post]);
    }
```
:::

El problema de este código es que estamos llamando a unas vistas que todavía no hemos creado, y les estamos pasando como variables a la vista los datos obtenidos dentro de un array. Podremos pasar tantas variables como queramos.

## Generar vista {#generar-vista}

El sistema de plantillas y vistas Blade se guardan en la ruta [resources/views]{.configdir}, y en el primer caso lo que estamos diciendo es que haga uso de "posts.index", que quiere decir el fichero "index.blade.php" del directorio "posts". Por lo tanto, deberemos crear un fichero en la ruta [resources/views/posts/index.blade.php]{.configfile}, que corresponde a la vista que estamos llamando.

::: infobox
**Es recomendable para cada Modelo/Controlador crear un directorio de vistas**
:::

Ahora es momento de visualizar los datos en la vista. Para ello, recorreremos el listado obtenido y lo visualizaremos, todo ello en la vista. El sistema de plantillas [Blade](https://laravel.com/docs/11.x/blade) permite introducir funcionalidad similar a PHP en la vista mezclado con HTML. También permite incrustar código PHP directamente, pero intentaremos evitarlo.

El sistema de plantillas tiene una serie de palabras reservadas similar a la de los lenguajes de programación más habituales. En este ejemplo se va a recorrer con un bucle for la lista, se crea una variable de indexación, y así poder visualizar los atributos:

::: mycode
[Vista "index.blade.php"]{.title}
```html+smarty
<ul>
  {{--esto es un comentario: recorremos el listado de posts--}}
  @foreach ($posts as $post)
    {{-- visualizamos los atributos del objeto --}}
    <li>
      <a href="{{route('posts.show',$post)}}"> {{$post->titulo}}</a>.
      Escrito el {{$post->created_at}}
    </li>
  @endforeach
</ul>
```
:::

Si ahora visualizamos la ruta "/posts" obtendremos el listado. Es importante destacar que para el enlace que nos lleva a visualizar un post concreto **se ha hecho uso del sistema ed rutas** al que se le pasa como parámetro el post.

::: exercisebox
Crea la vista para visualizar toda la información del post en "show.blade.php".
:::

# *Soft Deleting* {#soft-deleting}

Laravel, a través de su ORM Eloquent, nos permite hacer uso del sistema "*[soft deleting](https://laravel.com/docs/11.x/eloquent#soft-deleting)*", que en lugar de borrar los registros de la base de datos, lo que hace es marcarlo como borrado. Esto lo hace a través de una columna en la base de datos, indicando con una fecha cuándo se ha borrado.

Es habitual hacer uso de estos sistemas, por si el borrado ha sido erróneo, y de esta manera poder recuperar registros (ya que realmente no se han borrado).

Para hacer uso de este sistema debemos indicarlo en el modelo, para ello le indicaremos que se va a usar "**SoftDeletes**":

::: mycode
[Indicar en el modelo el uso de Softdeletes]{.title}
``` php
<?php
//...
use Illuminate\Database\Eloquent\SoftDeletes;
class Post extends Model{
    use SoftDeletes;
    //...
}
```
:::

Y también debemos indicarlo en la generación de la base de datos (o en un nuevo *migration*). De esta manera, se creará la columna correspondiente que es necesaria.

::: mycode
[Indicar en el "migration" el uso de Softdeletes]{.title}
``` php
<?php
//...
public function up(): void {
    Schema::create('posts', function (Blueprint $table) {
        $table->id();
        $table->string("titulo",128);
        $table->string("texto",5000);
        $table->boolean("publicado");
        $table->softDeletes();
        $table->timestamps();
    });
}
```
:::

Si ejecutamos los *migrations*, veremos que la tabla tiene un campo "**deleted_at**", que por defecto estará a NULL. Si ahora borramos un registro, se actualizará esa columna con la fecha del momento en el que se ha realizado la acción de borrado. **Estos registros pueden ser recuperados**.

# Debug {#debug}

Durante el desarrollo es habitual hacer uso de sistemas de *debug*, por ejemplo para poder ver el contenido de variables y parar la ejecución del algoritmo que estamos programando.

Laravel cuenta con una función llamada [dd()]{.inlineconsole} que podemos utilizar en cualquier momento. Por ejemplo, si lo usamos en el controlador creado previamente:

::: mycode
[Añadida llamada al debug]{.title}
``` php
<?php
 public function index(){
    $posts = Post::all();
    dd($posts);
    return view('posts.index',['posts' => $posts]);
}
```
:::

En este caso, se ejecutará la petición de obtener todos los *posts*, y acto seguido la función [dd($posts)]{.inlineconsole} lo que hará será mostrar por pantalla el contenido de la variable y terminará la ejecución del código.

# Consola Tinker {#consola-tinker}

Hoy en día muchos *frameworks* tienen algún sistema de consola interactiva con la que poder utilizar las funcionalidades del mismo. De esta manera, podemos realizar comprobaciones, interactuar con los modelos, objetos\... pero sin tener que hacerlo desde el código de la web.

En el caso de Laravel la consola se llama [Tinker](https://laravel.com/docs/11.x/artisan#tinker). Para asegurarnos que cuenta con toda la información actualizada, debemos ejecutar un comando previo.

::: mycode
[Llamar a Tinker con Artisan]{.title}
``` console
root@1b29e46c10ae:/var/www/html# composer dump-autoload
Generating optimized autoload files
> Illuminate\Foundation\ComposerScripts::postAutoloadDump
> @php artisan package:discover --ansi

   INFO  Discovering packages.
...
root@1b29e46c10ae:/var/www/html# php artisan tinker
Psy Shell v0.11.21 (PHP 8.2.10 — cli) by Justin Hileman
```
:::


Una vez dentro, podremos hacer uso de los modelos, por ejemplo, para ver los datos que tenemos en la base de datos.

::: mycode
[Obtenemos los Posts en Tinker]{.title}
``` psysh
>>> Post::all();
[!] Aliasing 'Post' to 'App\Models\Post' for this Tinker session.
= Illuminate\Database\Eloquent\Collection {#7247
    all: [
    App\Models\Post {#7249
        id: 1,
        titulo: "Primer post",
        texto: "Este es el texto del primer post",
        publicado: 1,
        created_at: "2023-10-01 16:57:30",
        updated_at: null,
    },
    ],
}
```
:::

