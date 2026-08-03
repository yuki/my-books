
# Programación asíncrona {#programación-asíncrona}

Hasta este momento todos los programas que hemos desarrollado han tenido una característica común: las instrucciones se ejecutan una detrás de otra. Sin embargo, muchas aplicaciones necesitan realizar tareas que pueden tardar un tiempo en completarse:

- Descargar información de un servidor.
- Esperar a que el usuario pulse un botón.
- Mostrar una animación.
- Ejecutar una acción varios segundos después.
- Leer un archivo.
- Obtener la posición GPS del dispositivo.

Si JavaScript esperase a que cada una de estas operaciones finalizara antes de continuar ejecutando el programa, las páginas web quedarían bloqueadas y dejarían de responder al usuario.

Para evitar este problema, JavaScript incorpora un modelo de **programación [asíncrona](https://developer.mozilla.org/en-US/docs/Learn_web_development/Extensions/Async_JS)**, que permite iniciar determinadas tareas y continuar ejecutando el resto del programa mientras dichas tareas finalizan.

## Operaciones síncronas vs asíncronas {#síncrona-vs-asíncrona}

Una operación **síncrona** es aquella que debe finalizar antes de que el programa continúe ejecutando la siguiente instrucción. Es decir, las instrucciones se ejecutan **estrictamente en orden** y hasta que no termina una instrucción no comienza la siguiente.

Una operación **asíncrona** permite que el programa continúe ejecutándose mientras dicha operación finaliza. Cuando la operación termina, JavaScript ejecutará el código correspondiente.

+----------------+-------------------------------------------------------------------------------+-------------------------------------------------------------------------+
|                | Programación Síncrona                                                         | Programación Asíncrona                                                  |
+================+===============================================================================+=========================================================================+
| Resumen        | Las instrucciones esperan unas a otras.                                       | Algunas operaciones se ejecutan en segundo plano.                       |
+----------------+-------------------------------------------------------------------------------+-------------------------------------------------------------------------+
| Ventajas       | ● Es sencilla de comprender.               `<br>`{=html} `\linebreak`{=latex} | ● La interfaz continúa respondiendo. `<br>`{=html} `\linebreak`{=latex} |
|                | ● Las instrucciones siguen un orden claro. `<br>`{=html} `\linebreak`{=latex} | ● Adecuada para operaciones lentas.  `<br>`{=html} `\linebreak`{=latex} |
|                | ● Resulta fácil localizar errores.                                            | ● Adecuada para peticiones online.                                      |
+----------------+-------------------------------------------------------------------------------+-------------------------------------------------------------------------+
| Inconvenientes | El programa puede quedar bloqueado.                                           | Flujo más complejo.                                                     |
+----------------+-------------------------------------------------------------------------------+-------------------------------------------------------------------------+

Table: {tablename=yukitblrcol colspec=X[2,l]X[5,l]X[5,l]}

Imaginemos el siguiente código JavaScript:

::: {.mycode size=footnotesize}
[Código JavaScript]{.title}
```javascript
function tarea(message) {
    // emula tarea que consume tiempo
    let n = 10000000000;
    while (n > 0){
        n--;
    }
    console.log(message);
}

console.log('Empieza');
task('Llamamos API');
console.log('Terminado');
```
:::


Mientras se ejecuta el paso 2, la función tarda tiempo y por tanto todo el resto de procesos **quedan bloquedos y a la espera**. Esto es un proceso a evitar. Cuando utilizamos una aplicación web se realizan continuamente operaciones asíncronas:

- Consultar datos de una web externa
- Cargar imágenes.
- Reproducir un vídeo.
- Esperar un clic del usuario.
- Esperar una pulsación del teclado.



# JavaScript y la programación asíncrona {#javascript-asíncrona}

JavaScript ejecuta el código de forma secuencial, pero incorpora mecanismos para gestionar operaciones asíncronas. Todos estos mecanismos se apoyan en un componente fundamental del lenguaje: el **Event Loop**. Entre estas operaciones podemos destacar:

- Temporizadores
- Eventos
- Promesas
- [async]{.verbatim} / [await]{.verbatim}
- [fetch()]{.verbatim}

## El Event Loop {#event-loop}

El **Event Loop** (bucle de eventos) es el mecanismo encargado de coordinar la ejecución del código JavaScript con las operaciones asíncronas. Aunque internamente es un proceso complejo, podemos entenderlo de forma simplificada. Su trabajo consiste en responder continuamente a la siguiente pregunta:

- ¿Hay alguna tarea pendiente que ya haya terminado?
- Si la respuesta es afirmativa, ejecuta el código asociado a esa tarea.

JavaScript es *single-threaded*, **sólo puede ejecutar una instrucción de código a la vez**, por lo que hasta que no aparecen las tareas asíncronas no entra en juego el **Event Loop**. Puede parecer que se hacen más tareas, pero algunas de ellas son hechas por el navegador. Para entender cómo se ejecuta el código debemos conocer a los "jugadores":

- ***Call Stack***: Donde las funciones son ejecutadas.
- **Web APIs**: Provistas por el navegador para tareas asíncronas como [setTimeout]{.verbatim}, peticiones HTTP, o eventos DOM.
- ***Task Queue (Macro-task queue)***: Mantiene las *callbacks* de tareas largas como las de [setTimeout]{.verbatim} o [setInterval]{.verbatim}.
- ***Micro-task Queue***: Mantiene las *callbacks* de [Promise.then]{.verbatim}, las tareas de [MutationObserver]{.verbatim} y los trabajos de [queueMicrotask]{.verbatim}.
- **Event Loop**: El coordinador que comprueba: "¿Está vacía la pila de llamadas? Si es así, pasa a la siguiente tarea de la cola."

JavaScript da más prioridad a las *micro-task* que a las *macro-task* y se puede comprobar con el siguiente ejemplo:

:::::::::::::: {.columns }
::: {.column width="47%"}

::: mycode
[Ejemplo de [medium.com](https://medium.com/@vigenhovhannisiano/javascript-event-loop-explained-with-simple-diagrams-and-real-examples-8296c85ab964)]{.title}
```javascript
console.log("1");

setTimeout(() => {
  console.log("2 - macro-task");
}, 0);

Promise.resolve().then(() => {
  console.log("3 - micro-task");
});

console.log("4");
```
:::

:::
::: {.column width="47%" }

Aunque todavía no entendamos qué realiza cada parte, la salida va a ser la siguiente:

- 1
- 4
- 3 - micro-task
- 2 - macro-task


:::
::::::::::::::


::: errorbox
JavaScript da más prioridad a las *micro-task* que a las *macro-task*.
:::

![Diagrama Event Loop. Basado en [Medium](https://medium.com/@rakeshraj2097/javascripts-event-loop-the-mind-behind-the-magic-4a56608abab7)](img/dec/event-loop.svg){width="100%"}


Un ejemplo más sencillo en el que se crea un temporizador de dos segundos

::: mycode
[Ejemplo sencillo asíncrono]{.title}
```javascript
console.log("Inicio");
setTimeout(() => {
    console.log("Han pasado dos segundos.");
}, 2000);
console.log("Fin");
```
:::

::: errorbox
Con la programación asíncrona es importante entender que el orden del código no siempre coincide con el orden de ejecución
:::


::: exercisebox
[[18a](https://github.com/yuki/ejercicios/blob/main/daw/dec/18a.html)]{.solution}

Comprueba el funcionamiento de los ejemplos previos.
:::

# Temporizadores {#temporizadores}

Los temporizadores permiten ejecutar código después de un determinado tiempo o de forma repetitiva. Son una de las primeras herramientas de programación asíncrona disponibles en JavaScript.

## [setTimeout()]{.verbatim} {#setTimeout}

La función [setTimeout()]{.verbatim} ejecuta una función una única vez cuando ha transcurrido el tiempo indicado, **en milisegundos** (1000ms == 1s).

::: mycode
[Ejemplo con [setTimeout()]{.verbatim}]{.title}
```javascript
console.log("Inicio");
const id = setTimeout(() => {
    console.log("Han pasado tres segundos.");
}, 3000);
console.log("Fin");
```
:::

La función [setTimeout()]{.verbatim} devuelve un identificador que podremos utilizar para cancelarlo.

## [clearTimeout()]{.verbatim} {#clearTimeout}

Permite cancelar un temporizador antes de que se ejecute.

::: mycode
[Ejemplo con [setTimeout()]{.verbatim}]{.title}
```javascript
const id = setTimeout(() => {
    console.log("Han pasado cinco segundos.");
}, 5000);
clearTimeout(id);
```
:::

Esta función es útil para:

- Cancelar una cuenta atrás.
- Detener una notificación.
- Evitar ejecutar una acción si el usuario cambia de opinión.


## [setInterval()]{.verbatim} {#setInterval}

La función [setInterval()]{.verbatim} ejecuta una función repetidamente, cuando pasen los milisegundos indicados.

:::::::::::::: {.columns }
::: {.column width="47%"}

::: {.mycode size=footnotesize}
[Llama a una función]{.title}
```javascript
setInterval(hola(), 2000);
```
:::

:::
::: {.column width="47%" }

::: {.mycode size=footnotesize}
[Usa función flecha]{.title}
```javascript
setInterval(() => {
    console.log(new Date());
}, 1000);
```
:::

:::
::::::::::::::

El mensaje seguirá apareciendo cada segundo hasta detener el temporizador.

## [clearInterval()]{.verbatim} {#clearInterval}

Permite detener un temporizador creado mediante [setInterval()]{.verbatim}.

::: mycode
[Parar temporizador]{.title}
```javascript
let contador = 0;

const reloj = setInterval(() => {
    contador++;
    console.log(contador);

    if (contador === 10) {
        clearInterval(reloj);
    }
}, 1000);
```
:::

::: exercisebox
[[18b](https://github.com/yuki/ejercicios/blob/main/daw/dec/18b.html)]{.solution}

Comprueba el funcionamiento de los ejemplos con temporizadores.
:::

## Buenas prácticas con temporizadores {#buenas-prácticas-temporizadores}

Es importante hacer uso de buenas prácticas cuando hacemos uso de temporizadores:

- Guardar el identificador devuelto por los temporizadores.
- Cancelar los temporizadores que ya no sean necesarios.
- Evitar intervalos demasiado cortos, ya que pueden afectar al rendimiento de la aplicación.



# Callbacks {#callbacks}

Un ***callback*** es una función que se pasa como argumento a otra función para que sea ejecutada más tarde. Es decir, en lugar de ejecutar una función inmediatamente, se entrega a otra función para que la invoque cuando sea necesario.

En el apartado anterior hemos aprendido a utilizar temporizadores, que a la hora de *setearlos* reciben como primer parámetro una función. Esa función es ejecutada cuando ocurra un determinado evento (en este caso, cuando transcurra un tiempo).

Los callbacks fueron durante muchos años el principal mecanismo para realizar programación asíncrona en JavaScript. Actualmente siguen utilizándose, aunque en muchas situaciones han sido sustituidos por las **promesas** y por [async]{.verbatim} / [await]{.verbatim}, que estudiaremos más adelante.

::: mycode
[Ejemplo de *callback* en temporizador]{.title}

```javascript
function saludar() {
    console.log("Hola");
}
setTimeout(saludar, 3000);
```
:::

En este caso:

- [saludar]{.verbatim} es el callback.
- [setTimeout()]{.verbatim} decidirá cuándo ejecutarlo.

En el ejemplo anterior se ha pasado una función ya existente, pero se puede pasar funciones anónimas y flecha

:::::::::::::: {.columns }
::: {.column width="47%"}

::: {.mycode size=footnotesize}
[Función anónima]{.title}
```javascript
setTimeout(function () {
    console.log("Hola");
}, 3000);
```
:::

:::
::: {.column width="47%" }

::: {.mycode size=footnotesize}
[Función flecha]{.title}
```javascript
setTimeout(() => {
    console.log("Hola");
}, 3000);
```
:::

:::
::::::::::::::


## Cuándo usar callbacks {#cuándo-usar-callbacks}

La palabra inglesa **callback** significa literalmente "llamar de vuelta", por lo que la idea es sencilla, proporcionar a una función otra que será llamada cuando sea necesario.

Sirva como ejemplo la siguiente función que realiza una operación, y tiene como tercer parámetro una función callback para ver qué hacer con el resultado. La función no sabe qué va a pasar con el resultado, pero usará el *callback* para hacerlo.

::: mycode
[Ejemplo de *callback*]{.title}

```javascript
function sumar(a, b, callback) {
    const resultado = a + b;
    callback(resultado);
}
```
:::

A la hora de llamar a la función podemos decidir qué hacer en el *callback* que le pasamos como parámetro.


:::::::::::::: {.columns }
::: {.column width="47%"}

::: {.mycode size=footnotesize}
[Loguea el resultado]{.title}
```javascript
sumar(4, 6, (resultado) => {
    console.log(resultado);
});
```
:::

:::
::: {.column width="47%" }

::: {.mycode size=footnotesize}
[Lo dibuja en un elemento]{.title}
```javascript
sumar(4, 6, (resultado) => {
  let r = document.getElementById("r")
  r.textContent = resultado
});
```
:::

:::
::::::::::::::

En la primera llamada se loguea el resultado, mientras que en la segunda se modifica un elemento HTML.

::: exercisebox
[[18c](https://github.com/yuki/ejercicios/blob/main/daw/dec/18c.html)]{.solution}

Crea una función que reciba un *callback* como parámetro. Llama a la función con un *callback* diferente.
:::


## Callbacks en los eventos {#callbacks-evento}

Ya hemos estado utilizando callbacks sin darnos cuenta.

::: mycode
[*Callback* en evento]{.title}

```javascript
boton.addEventListener("click", () => {
    console.log("Pulsado");
});
```
:::

La función flecha anterior es un callback que el navegador ejecutará cuando el usuario pulse el botón. 

Todos los eventos que hemos visto hasta ahora hacen uso de *callbacks*, y pasa lo mismo con los temporizadores.

::: infobox
Todos los eventos y temporizadores tienen *callbacks*.
:::


## Callback hell {#callback-hell}

Cuando una aplicación comienza a crecer, los callbacks pueden complicar el código. Cuando varios callbacks se anidan unos dentro de otros aparece un problema conocido como **Callback Hell**. También se conoce como *Pyramid of Doom* o Pirámide de la perdición.

El nombre viene del aspecto del código, que recuerda a una pirámide debido al nivel de indentación. Visualmente el código resulta difícil de seguir y además, cualquier modificación puede afectar a varios niveles de la pirámide.


::: mycode
[*Callback hell*]{.title}

```javascript
login(usuario, () => {
    obtenerPerfil(() => {
        obtenerPedidos(() => {
            obtenerFactura(() => {
                console.log("Proceso terminado");
            });
        });
    });
});
```
:::


La gestión de errores mediante callbacks tampoco resulta sencilla. Cada operación debería comprobar si ha ocurrido algún problema antes de continuar. Esto incrementa todavía más la complejidad del código.


## Ventajas e inconvenientes {#callbacks-ventajas-inconvenientes}

Los callbacks supusieron un gran avance en JavaScript porque permitían realizar tareas asíncronas sin bloquear la ejecución del programa. Sin embargo, también presentan algunos inconvenientes que se pueden ver en la siguiente tabla.


+-------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------+
| Ventajas                                                                                              | Inconvenientes                                                               |
+=======================================================================================================+==============================================================================+
| ● Permiten ejecutar código cuando ocurre un evento.                `<br>`{=html} `\linebreak`{=latex} | ● El ódigo puede ser difícil de mantener. `<br>`{=html} `\linebreak`{=latex} |
| ● Evitan bloquear la aplicación.                                   `<br>`{=html} `\linebreak`{=latex} | ● Muchas funciones anidadas.              `<br>`{=html} `\linebreak`{=latex} |
| ● Son sencillos para operaciones pequeñas.                         `<br>`{=html} `\linebreak`{=latex} | ● Gestión de errores complicada.          `<br>`{=html} `\linebreak`{=latex} |
| ● Están disponibles en prácticamente todas las APIs del navegador. `<br>`{=html} `\linebreak`{=latex} | ● Baja legibilidad.                       `<br>`{=html} `\linebreak`{=latex} |
| ● Siguen utilizándose en numerosos métodos de JavaScript.                                             | ● Difícil reutilización del código.                                          |
+-------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------+

Table: {tablename=yukitblr colspec=X[4,l]X[3,l]}


# Promesas (*Promise*) {#promesas}

En el apartado anterior hemos visto que los *callbacks* permiten ejecutar código cuando finaliza una operación asíncrona. Sin embargo, cuando varias operaciones dependen unas de otras, el código puede llegar a ser difícil de leer y mantener.

Para solucionar este problema, ECMAScript 2015 (ES6) incorporó un nuevo mecanismo denominado **Promise** (promesa), que permiten representar el resultado de una operación asíncrona y facilitan el encadenamiento de varias operaciones sin producir el conocido *Callback Hell*. Actualmente son uno de los mecanismos fundamentales de la programación asíncrona en JavaScript.

Cuando creamos una promesa todavía no conocemos el resultado de dicha operación. Sólo sabemos que, en algún momento, ocurrirá una de estas dos situaciones:

- La operación finalizará correctamente.
- La operación producirá un error.

<!-- 
TODO: poner el símil?
Podemos imaginar una promesa como un pedido realizado por Internet. Cuando realizamos el pedido todavía no tenemos el paquete. La empresa se compromete a entregarlo más adelante. Con el paso del tiempo pueden ocurrir dos cosas:

- El paquete llega correctamente.
- El envío falla.

Mientras tanto permanecemos esperando el resultado.
 -->


## Estados de un *Promise* {#estados-promise}

Toda promesa pasa por distintos estados, que se pueden simplificar en el siguiente diagrama:

![Estados de un promise. Basado en [fuente](https://www.aprendejavascript.dev/clase/programacion-asincrona/promises-basico)](img/dec/promise-estados.png){width="75%"}


- ***Pending***: Es el estado inicial. La operación todavía no ha finalizado.
- ***Fulfilled***: La operación ha terminado correctamente. La promesa devuelve un resultado.
- ***Rejected***: La operación ha producido un error. La promesa devuelve el motivo del fallo.


## Crear una Promise {#crear-promise}

La forma para crear una *Promise* es la que aparece en los siguientes ejemplo. La función recibe dos parámetros especiales que son dos funciones (***callbacks***) capaces de resolver o rechazar la promesa:

- [resolve()]{.verbatim}: Indica que la operación ha finalizado correctamente. La promesa pasa a estado *fulfilled*.
- [reject()]{.verbatim}: Indica que la operación ha producido un error. Pasa la promesa a estado *rejected*.


A continuación se crean dos ejemplos:

- Ejemplo sencillo con una condición que resuelve o rechaza la promesa.
- Ejemplo que resolverá o rechazará la promesa al de dos segundos, debido al temporizador, para simular una petición asíncrona (una petición a una web, por ejemplo).

:::::::::::::: {.columns }
::: {.column width="49%"}

::: {.mycode size=footnotesize}
[Crear Promise]{.title}
```javascript
const p=new Promise((resolve,reject)=>{
    // Tareas asíncronas
    // cambiar a false para ver error
    const success = true;
  
    if (success) {
      resolve("éxito");
    } else {
      reject("error");
    }
});
```
:::

:::
::: {.column width="49%" }

::: {.mycode size=footnotesize}
[Crear Promise]{.title}
```javascript
const p=new Promise((resolve,reject)=>{
    // Tareas asíncronas
    // cambiar a false para ver error
    const success = true;
    
    setTimeout(() => {
      if (success) {
        resolve("éxito")
      } else {
        reject("error")
      }
    }, 2000)
});
```
:::

:::
::::::::::::::


## Consumir la Promise {#consumir-promise}

Una vez creada la *Promise* hay que consumirla para poder obtener el valor de la función realizada de manera asíncrona. Para ello tenemos los siguientes métodos:

- [then()]{.verbatim}: Se ejecuta cuando la Promise se resuelve con éxito.
- [catch()]{.verbatim}: Se ejecuta cuando la Promise se rechaza con error.
- [finally()]{.verbatim}: Se ejecuta **siempre**, al terminar el proceso de la promesa (después del [then()]{.verbatim} o el [catch()]{.verbatim}). No recibe parámetros y no puede cambiar el valor de la *promise*. Esta función es útil para:
  - Ocultar indicadores de carga.
  - Liberar recursos.
  - Restaurar la interfaz.

::: mycode
[Consumir Promise]{.title}

```javascript
promesa
  .then((respuesta)=>{
      console.log(`Éxito: ${respuesta}`)
  })
  .catch((error)=> {
      console.log(`Error: ${error}`)
  })
  .finally(()=>{
      console.log("Promesa finalizada.")
  });
```
:::

::: errorbox
[then()]{.verbatim} y [catch]{.verbatim} son mutuamente excluyentes. Se ejecuta sólo una.
:::

::: exercisebox
[[18d](https://github.com/yuki/ejercicios/blob/main/daw/dec/18d.html)]{.solution}

Crea Promises que terminen en distintos estados. Usa [finally()]{.verbatim} como función final.
:::


## Encadenar operaciones {#encadenar-operaciones}

Es posible utilizar varios métodos [then()]{.verbatim} de manera encadenada. Realmente un [then()]{.verbatim} devuelve una nueva Promise, por lo que permite crear una cadena de transformación de resultados, ya que cada uno de ellos puede pasar su resultado al siguiente:


::: mycode
[Encadenar operaciones]{.title}

```javascript
promesa
  .then((respuesta)=>{
      console.log(`Éxito 1: ${respuesta}`)
      return respuesta;
  })
  .then((respuesta)=> {
      r = respuesta.toUpperCase();
      console.log(`Éxito 2: ${r}`);
      return r;
  })
  .then((respuesta)=> {
      r = respuesta.toLowerCase();
      console.log(`Éxito 3: ${r}`);
  });
```
:::

Tal como se puede ver en el ejemplo anterior se realizan las siguientes operaciones:

- En el primer [then()]{.verbatim} recibimos la respuesta de la promesa, y en este caso lo logueamos y hacemos un [return]{.verbatim} de la respuesta. 
- Este texto/objeto se recibe en el siguiente [then()]{.verbatim} como parámetro, que a su vez realiza ciertas operaciones y devuelve otro texto/objeto.
- En el último [then()]{.verbatim} recibimos como parámetro el [return]{.verbatim} del anterior y realizamos una tercera operación.

Todo esto se puede simplificar si hacemos llamadas a funciones ya escritas previamente. 

::: mycode
[Encadenar operaciones]{.title}

```javascript
promesa2
  .then(respuesta => igual(respuesta))
  .then(respuesta => mayus(respuesta))
  .then(respuesta => minus(respuesta));
```
:::

Y podemos mejorar aún más, ya que podemos pasar directamente las funciones que queremos ejecutar en cada momento, y recibirán el resultado del paso anterior sin necesidad de anidar las funciones. Esto sucede porque el contrato de la función recibe un único parámetro y devuelva una promesa, exactamente como la función que ya estamos creando:

::: mycode
[Encadenar operaciones]{.title}

```javascript
promesa3
  .then(igual)
  .then(mayus)
  .then(minus);
```
:::

::: exercisebox
[[18e](https://github.com/yuki/ejercicios/blob/main/daw/dec/18e.html)]{.solution}

Crea promesas con operaciones encadenadas y usa las tres formas de escribir las operaciones.
:::


## Ventajas sobre *callbacks* {#vantajas-sobre-callbacks}

A continuación un ejemplo de cómo se podría realizar las mismas operaciones con callbacks y con Promises:

::: {.mycode size=footnotesize}
[*Callback hell* de login de usuario 123]{.title}

```javascript
login(123, (error,usuario) => {
  if (error) {
    console.log("Error de login");
  } else {
    obtenerPerfil(usuario.id,(error,perfil) => {
      if (error){
        console.log("Error de perfil");
      } else {
        obtenerPedidos(usuario.id, (error, pedidos) => {
            if (error){
              console.log("Error en pedidos");
            } else {
                obtenerFactura(pedidos[0].id,(error,factura) => {
                    if (error){
                        console.log("Error en factura")
                    } else {
                        // obtener total, productos...
                    }
                });
            }
        });
      }
    });
  }
});
```
:::

En este ejemplo de *callback hell* se ha añadido la gestión de errores y comprobaciones que en el [anterior apartado](#callback-hell) no se habían indicado. Tal como se puede ver, esto incrementa la dificultad a la hora de tener que realizar modificaciones en el futuro.

Si por el contrario usamos [Promise]{.verbatim} quedaría de una de las dos siguientes maneras, dependiendo de si usamos la versión "larga" o abreviada.


:::::::::::::: {.columns }
::: {.column width="49%"}

::: {.mycode size=footnotesize}
[Login de usuario]{.title}
```javascript
obtenerUsuario(123)
  .then((usuario) => {
    return obtenerPerfil(usuario.id);
  })
  .then((usuario) => {
    return obtenerPedidos(usuario.id);
  })
  .then((pedidos) => {
    return obtenerFactura(pedidos[0].id);
  })
  .then((factura) => {
    console.log(factura);
  })
  .catch((error) => {
    console.error(error);
  });
```
:::

:::
::: {.column width="49%" }

::: {.mycode size=footnotesize}
[Login de usuario]{.title}
```javascript
obtenerUsuario(123)
  .then(obtenerPerfil)
  .then(obtenerPedidos)
  .then(obtenerFactura)
  .then(mostrarFactura)
  .catch((error) => {
      console.error(error);
  });
```
:::

:::
::::::::::::::


## [Promise.all()]{.verbatim} {#promise-all}

Permite esperar a que finalicen varias promesas para ejecutar después una función, pero sólo se ejecutará cuando todas hayan terminado correctamente:

::: mycode
[Esperar promesas]{.title}
```javascript
Promise.all([
    promesa1,
    promesa2,
    promesa3
])
.then((resultados) => {
    console.log(resultados);
});
```
:::


Si cualquiera de las promesas produce un error, [Promise.all()]{.verbatim} finaliza inmediatamente con dicho error.

## [Promise.race()]{.verbatim} {#promise-race}

Devuelve el resultado de la primera promesa que finalice, da igual cuál sea.

::: mycode
[Esperar promesas]{.title}
```javascript
Promise.race([
    promesa1,
    promesa2
])
.then((resultado) => {
    console.log(resultado);
});
```
:::

## [Promise.allSettled()]{.verbatim} {#promise-allsettled}

Sirve para esperar el resultado de varias *Promise* pero sin importar si algunas fallan. Útil para hacer un reporte de estado, para saber qué funcionó y qué no.

Con [Promise.allSettled()]{.verbatim} siempre vamos a obtener un array de objetos de tipo [{status, value/reason}]{.verbatim}.

- **status**: podrá tener el valor [fulfilled]{.verbatim} para las promesas cumplidas y [rejected]{.verbatim} para las rechazadas
- El segundo campo será:
  - **value**: si la promesa ha tenido éxito, tendremos el resultado.
  - **reason**: si la promesa ha fallado, tendremos el error.

::: exercisebox
[[18f](https://github.com/yuki/ejercicios/blob/main/daw/dec/18f.html)]{.solution}

Crea ejemplos con [Promise.all()]{.verbatim}, [Promise.race()]{.verbatim} y [Promise.allSettled()]{.verbatim}
:::



# [async]{.verbatim} y [await]{.verbatim} {#async-await}

Las promesas solucionaron gran parte de los problemas de los *callbacks*. Sin embargo, cuando varias promesas se encadenan, el código puede seguir siendo más complejo de lo deseable. 

Para simplificar todavía más la programación asíncrona, ECMAScript 2017 incorporó las palabras reservadas [async]{.verbatim} y [await]{.verbatim}, cuyo  objetivo consiste en escribir código asíncrono con un aspecto muy parecido al código secuencial.


::: infobox
El objetivo de [async]{.verbatim} y [await]{.verbatim} es escribir código asíncrono con un aspecto similar al código secuencial.
:::


## Declarar función [async]{.verbatim} {#función-async}

Usando la palabra reservada [async]{.verbatim} declaramos que una función sea asíncrona y **siempre devuelve una promesa**. Podemos crear en funciones estándar o flecha. 

:::::::::::::: {.columns }
::: {.column width="49%"}

::: {.mycode size=footnotesize}
[Función async]{.title}
```javascript
async function saludo() {
    return "Hola";
}
```
:::

:::
::: {.column width="49%" }

::: {.mycode size=footnotesize}
[Función async flecha]{.title}
```javascript
const saludo = async () => {
    return "Hola";
};
```
:::

:::
::::::::::::::

Aunque aparentemente devuelve una cadena, en realidad devuelve una **promesa resuelta** con ese valor.

## Esperar función con [await]{.verbatim} {#función-await}

La palabra reservada [await]{.verbatim} permite esperar el resultado de una promesa. Mientras la promesa no finalice, la función asíncrona permanecerá en espera. Hay que recordar que esto no bloqueará todo el programa, si no que JavaScript dejará de lado esta función y seguirá haciendo caso a otra parte del programas.


:::::::::::::: {.columns }
::: {.column width="47%"}

::: {.mycode size=footnotesize}
[Función async]{.title}
```javascript
function esperar() {
    return new Promise((resolve) => {
        setTimeout(() => {
            resolve("Finalizado");
        }, 2000);
    });
}
```
:::

:::
::: {.column width="47%" }

::: {.mycode size=footnotesize}
[Función async flecha]{.title}
```javascript
async function ejemplo() {
    console.log("Inicio");
    const resultado = await esperar();
    console.log(resultado);
    console.log("Fin");
}

ejemplo();
```
:::

:::
::::::::::::::


En el ejemplo anterior parece que se está ejecutando síncronamente, pero se ha utilizado las funciones de JavaScript que permite no bloquear el resto de la aplicación.

::: exercisebox
[[18g](https://github.com/yuki/ejercicios/blob/main/daw/dec/18g.html)]{.solution}

Crea 3 botones que realicen lo siguiente:

1. Loguee "Botóin 1 pulsado"
2. Llama a la función [task]{.verbatim} del ejercicio [18a](https://github.com/yuki/ejercicios/blob/main/daw/dec/18a.html). Intenta pulsar el botón 1. ¿Qué pasa?
3. Llama a una función [async]{.verbatim} como el ejemplo anterior y espera con [await]{.verbatim}. Intenta pulsar el botón 1. ¿Qué pasa?
:::


A continuación una comparación de cómo sería un ejemplo con promesas y otro con async/await.

:::::::::::::: {.columns }
::: {.column width="49%"}

::: {.mycode size=footnotesize}
[Con promesas]{.title}
```javascript
esperar()
  .then((resultado) => {
    console.log(resultado);
  });
```
:::

:::
::: {.column width="49%" }

::: {.mycode size=footnotesize}
[Función async flecha]{.title}
```javascript
const resultado = await esperar();

console.log(resultado);
```
:::

:::
::::::::::::::


## Tratamiento de errores {#tratamiento-errores}

Cuando una promesa produce un error, normalmente utilizaremos [try...catch]{.verbatim}.

::: mycode
[Función async flecha]{.title}
```javascript
async function ejemplo() {
    try {
        const datos = await obtenerDatos();
        console.log(datos);
    }
    catch(error){
        console.log(error);
    }
}
```
:::

Aunque ya estudiamos [[try...catch]{.verbatim}](#try-catch) anteriormente, a partir de este momento será especialmente importante, ya que constituye el mecanismo habitual para gestionar errores en funciones asíncronas.


## Varias operaciones {#varias-operaciones}

Con las *Promise* hemos visto cómo concatenar operaciones. Ahora podemos hacer llamadas a varias funciones y esperar l resultado, siendo más legible:

:::::::::::::: {.columns }
::: {.column width="40%"}

::: {.mycode size=footnotesize}
[Con promesas]{.title}
```javascript
obtenerDatos()
  .then((datos) => {
    return procesar(datos);
  })
  .then((resultado) => {
    console.log(resultado);
  })
  .catch((error) => {
    console.log(error);
  });
```
:::

:::
::: {.column width="55%" }

::: {.mycode size=footnotesize}
[Función async/await]{.title}
```javascript
async function ejemplo() {
  try {
    const datos = await obtenerDatos();
    const resultado = await procesar(datos);
    console.log(resultado);
  }
  catch(error){
    console.log(error);
  }
}
```
:::

:::
::::::::::::::

El problema de esto es que estamos programando de manera secuencial, por lo que estamos haciendo que el tiempo de ambas funciones se sumen. Para eso es importante recordar que podemos **esperar en paralelo** con [Promise.all]{.verbatim}.

::: {.mycode size=footnotesize}
[Esperando en paralelo]{.title}
```javascript
async function perfilUsuario(id) {
  try {
    const [datos, facturas] = await Promise.all([
        obtenerDatos(id),
        obtenerFacturas(id)
    ])
    console.log(facturas);
  }
  catch(error){
    console.log(error);
  }
}
```
:::


::: exercisebox
[[18h](https://github.com/yuki/ejercicios/blob/main/daw/dec/18h.html)]{.solution}

Crea 3 botones que llamen a funciones diferentes que a su vez usen un temporizador de 3, 2 y 1 un segundo. 
¿Qué forma tarda menos en ejecutarse?

1. Con [Promise]{.verbatim} anidando [then]{.verbatim}
2. Con [async/await]{.verbatim} secuencial.
3. Con [async/await]{.verbatim} con [Promise.all]{.verbatim} en paralelo.

:::

## ¿Cuándo utilizar [async]{.verbatim} y [await]{.verbatim}?

Siempre que trabajemos con promesas y necesitemos realizar varias operaciones consecutivas. Actualmente constituyen el enfoque recomendado para el desarrollo de aplicaciones JavaScript modernas.

