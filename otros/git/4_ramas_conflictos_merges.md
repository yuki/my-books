 

# Usar ramas en git {#usar-ramas-en-git}

La creación de ramas (llamadas ***branches***) en un repositorio nos permite realizar pruebas, añadir características nuevas, o cambiar de ámbito sin perjudicar el flujo de trabajo principal.

Una rama es una bifurcación del camino principal del desarrollo de una aplicación (o de un commit concreto). Esta rama puede ser una rama pública (existir en GitHub) o ser privada (sólo existir en nuestro repositorio local).

La creación de ramas en Git es instantáneo (al contrario de lo que sucedía con sistemas anteriores), por lo que crearla no supone un esfuerzo ni una pérdida de tiempo para el desarrollo.

::: center
![Un desarrollo con ramas](img/git/ramas.png){width="90%"}
:::

En el dibujo aparecen ramas que posteriormente se unen a la rama *main* principal, pero esto no tiene por qué ser así, y una rama puede mantener un desarrollo paralelo y nunca unirse.

## Crear rama {#crear-rama}

Para crear una rama en el desarrollo, desde el punto en el que nos encontramos, se puede hacer de dos maneras. El resultado es el mismo, pero conviene entender qué es lo que sucede en ambos casos.

-   **Crear rama y luego movernos a ella**: Este caso consta de dos pasos.

::: mycode
[Crear rama "featureA" y movernos a ella]{.title}

```console
ruben@vega:~/pruebas$ git branch featureA
ruben@vega:~/pruebas$ git checkout featureA
Cambiado a rama 'feature1'

ruben@vega:~/pruebas$ git log
commit 170f9ce8c214b82f... (HEAD -> featureA, origin/main, main)
Author: Rubén Gómez <ruben@example.com>
Date:   Sun Sep 17 18:40:37 2023 +0200
...
```
:::

Tal como se puede ver, se ha creado la rama con nombre "featureA", para posteriormente con el comando [git checkout featureA]{.commandbox} cambiarnos a dicha rama.

Con [git log]{.commandbox} podemos comprobar cómo en ese *commit* ahora mismo se encuentran tres puntos de nuestro sistema de repositorios:

-   **HEAD -> featureA**: que es la rama en la que nos encontramos ahora.
-   **origin/main**: la rama "main" del repositorio remoto.
-   **main**: la rama local "main".

Los tres puntos coinciden porque no se han realizado todavía ningún cambio en ninguna rama.

-   **Crear rama y movernos a ella automáticamente**: en este caso los dos pasos se convierten en uno, pero el resultado es el mismo.

::: mycode
[Crear rama "featureB" y movernos a ella directamente]{.title}

``` console
ruben@vega:~/pruebas$ git checkout -b featureB
Cambiado a nueva rama 'featureB'
```
:::


## Cambiar entre ramas {#cambiar-entre-ramas}

Ahora que ya sabemos cómo crear ramas, hay que entender cómo podemos cambiar entre ellas, aunque el comando lo acabamos de ver en el punto anterior: [git checkout branch]{.commandbox}, donde "branch" es el nombre de la rama a la que queremos ir.

Siguiendo con el ejemplo anterior, si queremos volver a la rama "main", deberíamos hacer:

:::mycode
[Volver a la rama "main"]{.title}
``` console
ruben@vega:~/pruebas$ git checkout main
Cambiado a rama 'main'
Tu rama está actualizada con 'origin/main'.
```
:::

Si queremos volver a la rama "featureA":

::: mycode
[Volver a la rama "featureA"]{.title}
``` console
ruben@vega:~/pruebas$ git checkout featureA
Cambiado a rama 'featureA'
```
:::


## Ver estado de las ramas {#ver-estado-de-las-ramas}

Para comprobar cuál es el estado de las ramas, vamos a realizar dos *commits* distintos en la rama "main" y otro en la rama "featureA". Para ver cómo se encuentra ahora el estado de nuestro repositorio, podemos hacer uso del siguiente comando:

::: mycode
[Volver a la rama "featureA"]{.title}
```console
ruben@vega:~/pruebas$ git log --oneline --decorate --graph --all
```
:::

Obtendríamos el siguiente resultado:

::: center
![Ramas actuales](img/git/ramas2.png){width="90%"}
:::

Tal como se puede ver, la bifurcación sucede en el commit "170f9ce", que es donde está situado el último commit del servidor remoto y la rama "featureB" creada previamente (y que no se ha tocado).

Por otro lado, desde ese punto surgen dos ramas:

- **featureA**, con el único commit 1e30067.
- **main**, que tiene 2 commits.


Tras realizar estas modificaciones, a continuación vamos a ver cómo podemos fusionar los cambios de una rama en la otra.


# Fusionar ramas {#fusionar-ramas}

La fusión de ramas (en inglés ***merge***) sucede cuando queremos obtener los cambios realizados en una rama y fusionar dichos cambios con la rama en la que nos encontramos actualmente.  Ahora que tenemos distintas ramas creadas, con sus correspondientes commits, es buen momento para realizar la fusión de las ramas.

::: infobox
**Merge es coger los cambios de una rama y fusionarlos con la actual.**
:::

Dependiendo de cómo haya sido el desarrollo de las ramas, la fusión podrá terminar en un "dibujo" distinto. Por ejemplo, el caso más sencillo es que en la bifurcación sólo la rama nueva tiene nuevos commits, por lo que al realizar la fusión quedaría:

![Merge de rama con commits sobre rama "main"](img/git/merge_facil.png){width="60%"}


Tras realizar el merge, en este caso es como si la rama "FeatureA" no hubiese existido.

En cambio, si en la rama main, tal como se ha sugerido en el punto anterior, también se realizan modificaciones, el dibujo quedará tal que así:


![Merge donde hay commits en ambas ramas](img/git/merge_serio.png){width="70%"}



Para realizar la fusión, debemos seguir estos pasos:

- Colocarnos en la rama en la que queremos fusionar los cambios de otra rama. Normalmente, nos va a interesar añadir los cambios a la rama "main".
- Realizar la fusión.



::: mycode
[Volver a la rama "main"]{.title}
``` console
ruben@vega:~/pruebas$ git checkout main
ruben@vega:~/pruebas$ git merge featureA -m "Merge de FeatureA en main"
```
:::

De esta manera, crearemos un nuevo commit con el texto "Merge de FeatureA en main", que indicará la fusión de la rama "featureA" sobre la rama Main. El dibujo en la vida real queda de la siguiente manera:

![Merge donde hay commits en ambas ramas](img/git/merge_final.png){width="90%"}


Una vez realizado el *merge*, podemos subir los cambios al repositorio central. La rama "featuresA" es una rama local, por lo que a nivel de GitHub esa rama nunca ha existido, aunque podemos ver en el interfaz web que el gráfico sí ha sufrido una ramificación:

![Gráfico en el interfaz de GitHub](img/git/merge_github.png){width="90%" framed="true"}


# Resolver conflictos en un *merge* {#resolver-conflictos-en-un-merge}

Cuando se realiza un *merge* puede existir la posibilidad de crear un conflicto. Un conflicto sucede cuando al fusionar dos ramas en ambas se ha tocado las mismas líneas, y git no sabe qué hacer con los cambios. Para evitar problemas, se genera un conflicto que debe ser resuelto por el desarrollador.

::: infobox
**Un conflicto surge al fusionar dos ramas que tiene cambios en la misma porción de código. El desarrollador es el encargado de arreglar el conflicto.**
:::

Pongamos como ejemplo un caso similar al apartado anterior. Se ha creado la rama "featureC" y se ha modificado un par de líneas de una función y se ha hecho commit. En la rama "main" se ha hecho lo mismo.


![Merge con conflicto](img/git/merge_conflict.png){width="60%"}


A la hora de ir a realizar el *merge*, git nos avisa que existe un conflicto en el fichero [hola.java]{.configfile} y que debemos resolverlo:

::: mycode
[Volver a la rama "main"]{.title}

```console
ruben@vega:~/pruebas$ git merge FeatureC
Auto-fusionando hola.java
CONFLICTO (contenido): Conflicto de fusión en hola.java
Fusión automática falló; arregle los conflictos y luego realice
 un commit con el resultado.
```
:::


Para resolver el conflicto deberemos editar el fichero que nos indica. En este caso, si lo editamos, veremos lo siguiente:

::: mycode
[Editando el fichero con conflicto]{.title}
``` java
class HolaMundo {
    public static void main(String[] args) {
        System.out.println("¡Hola, Mundo!");

        <<<<<<< HEAD
        // esto es cambiado en la rama main
        System.out.println("Sacando información desde la rama main");
        =======
        // estamos en la rama FeatureC
        System.out.println("Esto sale en la rama C");
        >>>>>>> FeatureC
    }
}
```
:::

Tal como se puede ver, es una clase con una función en Java simulando el típico programa "Hola Mundo", pero **aparecen una serie de líneas que nos están indicando dónde está el conflicto**:

-   **$<$ $<$ $<$ $<$ $<$ $<$ HEAD**: Comienzan la parte en la que hay conflicto de la rama en la que nos encontramos. En este caso, la rama "main".

-   **=======**: Es la separación de los apartados que entran en conflicto.

-   **$>$ $>$ $>$ $>$ $>$ $>$ FeatureC**: Es el final de la parte que entra en conflicto. Desde el punto anterior hasta este, en este caso, es de la rama "FeatureC".

**Para resolver el conflicto deberemos borrar esas líneas especiales, quedarnos con las partes del código que nos interesen y realizar un nuevo commit**. Es por eso que para la resolución de los conflictos quizá tengan que participar los desarrolladores que han realizado los cambios que han creado el conflicto.

::: infobox
**Para resolver el conflicto deberemos borrar esas líneas especiales, quedarnos con las partes del código que nos interesen y realizar un nuevo commit**
:::

:::center
![Merge con conflicto resuelto](img/git/merge_conflict_solved.png){width="90%"}
:::

