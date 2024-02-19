

# Crear modelo relacionado {#crear-modelo-relacionado}

Siguiendo con nuestro blog, donde ya tenemos una aplicación donde crear posts sólo si estamos logueado, es buen momento de añadir nuevas características. Vamos a incluir la opción de tener comentarios, al menos a nivel relacional.

Sin entrar en los atributos que tiene cada entidad/modelo, la relación que tienen los comentarios respecto a un *post* sería la siguiente:

![\ ](img/laravel/e-r.png){width="50%"}

Es decir, un *post* puede tener muchos comentarios. Un comentario sólo puede pertenecer a un *post*. En principio el único atributo que vamos a permitir es el propio comentario, aparte de la fecha de creación. Para crear el modelo haríamos:

::: {.mycode size=small}
[Crear Modelo]
```console
root@1b29e46c10ae:/var/www/html# php artisan make:model Comentario -crms
```
:::

# Crear migración {#crear-migración}

Al igual que vimos al inicio, este comando nos ha creado el modelo, el controlador de *resource*, el sistema de migración y el fichero para añadir la semilla a la base de datos. A la hora de generar la tabla, tenemos que hacer referencia a qué *post* pertenece el comentario, por lo tanto el *migration* queda:

::: mycode
[Crear migration]{.title}
``` php
<?php
//...
public function up(): void{
    Schema::create('comentarios', function (Blueprint $table) {
        $table->id();
        $table->string('texto');
        $table->unsignedBigInteger('post_id');
        $table->foreign('post_id')->references('id')->on('posts');
        $table->timestamps();
    });
}
```
:::

Tal como se puede ver, a la hora de crear la tabla en el *migration* se ha creado un campo llamado "**post_id**" que después se le ha indicado que es de tipo "clave foránea". En la [documentación](https://laravel.com/docs/10.x/migrations#foreign-key-constraints) se explican distintas opciones para este tipo de casos.

::: exercisebox
**Crea un "seed" para añadir un comentario al primer post**
:::

# Crear relación de modelos {#crear-relación-de-modelos}

Hasta ahora la relación se ha creado a nivel de base de datos, pero es necesario que Laravel a nivel de *framework*, mientras programamos, sea consciente de que los modelos están relacionados entre sí. Para ello, una vez más en la [documentación](https://laravel.com/docs/10.x/eloquent-relationships#one-to-many) se puede ver cómo Eloquent hace uso de los distintos tipos de relaciones.

Para ello, deberemos modificar ambos ficheros de los modelos que entran en juego en esta relación:

-   Relación "**uno a muchos**", donde un *post* puede tener muchos comentarios. Modificaremos el modelo [App/Models/Post.php]{.configfile} para que contenga:

::: mycode
[Añadir relación "uno a muchos" en Post]{.title}
``` php
<?php
//...
use Illuminate\Database\Eloquent\Relations\HasMany;
class Post extends Model{
    use HasFactory;
    public function comentarios(): HasMany {
        return $this->hasMany(Comentario::class);
    }
}
```
:::

-   Relación inversa "***BelongsTo***", donde un comentario pertenece a un *post*. En este caso, modificaremos el modelo [App/Models/Comentario.php]{.configfile}.

::: mycode
[Añadir relación inversa en Comentario]{.title}
```php
<?php
//...
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Comentario extends Model{
    use HasFactory;
    public function post(): BelongsTo{
        return $this->belongsTo(Post::class);
    }
}
```
:::

Tras esto, ya sea a través de una acción o desde Tinker, podremos obtener los comentarios de un *post* específico, perfecto para dibujarlos en la vista donde se visualiza el *post*. Y al revés, dado un comentario, obtener a qué *post* pertenece.

