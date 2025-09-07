
# Interfaces rotatorios {#interfaces-rotatorios}

En esta tarea vamos a aprender los conceptos básicos de la creación de interfaces sencillas a través del IDE Android Studio y ver sus particularidades, **tanto en XML como con Jetpack Compose**. Para ello se van a crear dos interfaces distintas que deberán tener sus versiones especiales en modo **apaisado/landscape**, reordenando los componentes.

Los interfaces deben cumplir:

- Tener los mismos componentes en modo vertical y apaisado
- El modo apaisado debe ser distinto al modo vertical, haciendo que los componentes aprovechen todo el espacio.
- Los componentes deben de hacer uso de **constraints** y **cadenas** para su correcto posicionamiento (no puede haber valores absolutos de posición) en la vista XML.
- Los proyectos deben ser para un SDK mínimo de la API 31.


La tarea consiste en realizar **dos aplicaciones en Android** con dos tipos de interfaces y realizar un documento técnico donde se describan las particularidades de cada una.

**La aplicación Android no tiene que tener toda la funcionalidad, sólo el interfaz (salvo que se indique lo contrario).**


## Calculadora {#calculadora}

Crear un interfaz de una aplicación de calculadora como la que aparece en los apuntes. **Los botones de los números deben de ser funcionales** (al pulsar debe de modificarse el texto mostrado), pero no hace falta que haga las operaciones.

En la aplicación  Compose haced que los botones no sean estándares, si no más cuadrados como una calculadora real. Y también cambiad los colores (no tienen que ser iguales a los de los apuntes, pero que exista diferencia entre los números y las acciones). **¡Reutilizad el código usando funciones!**

En la vista *landscape*, sois libres de elegir cómo queréis que sea la vista.

**Al rotar el dispositivo se tiene que mantener el texto mostrado. **


## Acplicación de música {#musicapp}

Hay que crear un interfaz simulando una aplicación de música en la que deben de aparecer los siguientes componentes:

- Imagen del disco (para pruebas podéis poner una de un disco que os guste)
- Texto del título de la canción
- Texto del nombre del grupo
- Barra deslizadora del tiempo (tiene que estar en el 25%) que dura la canción (con - textos de cuánto tiempo ha avanzado y cuánto queda)
- Botones (tienen que ser imágenes):
  - Canción anterior
  - Play/Pause (**este botón debe funcionar y cambiar su estado mostrando/simulando que la canción suena o no**)
  - Canción siguiente
- Barra deslizadora con el volumen (tiene que estar en el 70%) y tiene que tener al lado al menos un icono para indicar que es para el volumen.
- Botones (tienen que ser imágenes) para:
  - Compartir canción
  - Ver letra de la canción
  - Ver listado de canciones siguientes

Al rotar el dispositivo los componentes deben de situarse de una manera adecuada para que la aplicación siga siendo funcional. Se recomienda:

- Dividir la pantalla al 50%:
  - En un lado incluir la imagen de la canción.
  - En el otro lado, el resto de botones/componentes

## Entrega

Hay que crear un documento técnico ([Cómo hacer buena documentación](https://yuki.github.io/my-books/como_hacer_documentacion.html)) en el que aparte de los apartados obligatorios (portada, índice, introducción, conclusiones/resumen) debe aparecer:

- Crear dispositivo Android emulado
  - El dispositivo tiene que ser el "Pixel 8 Pro", con API 31

- Calculadora
  - Especificar el diseño elegido para la colocación de los botones
    - El por qué de la colocación en la vista apaisada
    - Añadir imágenes del diseño y blueprint de XML en horizontal y vertical
    - Añadir imágenes de la vista previa de Compose en horizontal y vertical
  - Explicar cómo habéis realizado el código de darle funcionalidad a los botones
  - Explicar cómo funciona el guardar el estado de la vista al rotar la imagen
  - Enlace al repositorio github/gitlab del proyecto (comprobad que es un repositorio público). Cada app tiene que estar en una rama distinta.

- Aplicación de música
  - El nombre de la aplicación se tiene que llamar “MusicApp”
  - Especificar el diseño elegido para la colocación de los botones
    - El por qué de la colocación en la vista apaisada
    - Añadir imágenes del diseño y blueprint en horizontal y vertical
    - Añadir imágenes de la vista previa de Compose en horizontal y vertical
  - Explicar cómo le habéis dado la funcionalidad al botón play/pause
  - Enlace al repositorio github/gitlab del proyecto. Cada app tiene que estar en una rama distinta.

- Opinión
  - Apartado expresando vuestra opinión con la diferencia de crear el mismo interfaz en XML y Jetpack Compose, y cuál os parece más simple, cómodo, fácil de entender, fácil de comprobar el resultado, la funcionalidad… 












