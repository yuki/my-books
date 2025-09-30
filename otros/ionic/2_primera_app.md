
# Crear primera aplicación {#crear-primera-app}

En esta sección se va a explicar cómo crear una primera aplicación de pruebas y cómo usarla a través del navegador web, compilarla para Android e iOS.


## Preparar proyecto {#generar-proyecto}

Anteriormente se ha definido cómo instalar **Node.js**, por lo que es imprescindible asegurar que lo tenemos instalado.

Se va a realizar un resumen de la [documentación oficial](https://ionicframework.com/docs/intro/cli), por lo que para futuras versiones es conveniente ver si ha habido cambios.


## Generar aplicación {#instalar-ionic-cli}

Estando dentro del contenedor, vamos a instalar el paquete de Ionic a través del gestor **npm**:

::: {.mycode}
[Instalar dependencias]{.title}

``` console
ruben@vega:~$ npm install -g @ionic/cli

ruben@vega:~$ npm -g ls
/usr/local/lib
+-- @ionic/cli@7.2.1
+-- corepack@0.34.0
`-- npm@11.6.0

ruben@vega:~$ ionic version
7.2.1
```
:::

De esta manera tenemos instalado, **de manera global**, el CLI de Ionic, por lo que ya podremos crear nuestra primera aplicación. A la hora de crear un proyecto, podemos pasar utilizar ciertos parámetros, o dejar que el asistente nos pregunte:


::: {.mycode}
[Crear proyecto]{.title}

``` console
ruben@vega:~$ ionic start
```
:::

Nos realizará una serie de preguntas para generar el proyecto:

- **Use the app creation wizard?**: Sirve para utilizar el asistente web para generar el proyecto y así poder  enlazarlo con GitHub, GitLab o Bitbucket. Vamos a elegir **NO**, para poder seguir con el CLI.
- **Framework**: Podemos elegir entre Angular, React o Vue. Elegiremos **Angular**.
- **Project name**: Elegiremos el nombre del proyecto.
- **Starter template**: Nos deja elegir entre distintos templates como referencia:
  - **tabs**: una aplicación con tres pestañas en el pie de página.
  - **sidemenu**: la aplicación cuenta con un panel lateral, que dependiendo del tamaño de la pantalla se visualizará o estará oculto.
  - **blank**: una aplicación vacía.
  - **list**: la aplicación tiene un listado.
- **Tipo de componentes**: al elegir Angular, nos pregunta si queremos crear componentes **Standalone** o de tipo NgModules. Elegiremos **Standalone**, ya que es la opción por defecto actual con Angular.


Una vez terminado el asistente nos creará un directorio con el nombre elegido, dentro de él el esqueleto del proyecto, instalará las dependencias necesarias y nos creará un proyecto **git** para poder subirlo a nuestro repositorio central.

::: exercisebox
Es un buen momento para usar Visual Studio Code y acceder al directorio del proyecto.
:::


## Ejecutar proyecto {#ejecutar-proyecto}

Una vez generado el proyecto, es momento de ejecutar el proyecto, en este caso, de momento será una aplicación web:

::: {.mycode}
[Instalar dependencias]{.title}

``` console
ruben@vega:~/Test $ ionic serve
> ng run app:serve --port=8100
# ...
[INFO] Development server running!
       Local: http://localhost:8100

       Use Ctrl+C to quit this process
[ng]   -  Local:   http://localhost:8100/
[ng]   -  press h + enter to show help
```
:::

De esta manera se generarán los assets (CSS y javascripts) necesarios para que la aplicación funcione. Si todo va bien, arrancará el servidor y podremos conectarnos al puerto **8100**.


# Compilar para Android {#compilar-android}

Para poder compilar el proyecto para Android necesitamos realizar los siguientes pasos, tal como nos dice la [documentación oficial](https://capacitorjs.com/docs/android):

- Instalar dependencias
  - [npm install \@capacitor/android]{.commandbox}
- Añadir al proyecto la intención de compilar para Android
  - [ionic capacitor add android]{.commandbox}
- Sincronizamos los assets en el proyecto Android
  - [ionic capacitor sync]{.commandbox}
- Abrimos el proyecto en Android Studio
  - [ionic capacitor open android]{.commandbox}

Desde Android Studio debemos generar el proyecto, ya que no lo genera por defecto, y ya se podrá compilar y se abrirá el emulador.

# Compilar para iOS {#compilar-ios}

Los pasos son muy parecidos a los realizados para Android, y se pueden ver en la [documentación](https://capacitorjs.com/docs/ios):

- Instalar dependencias
  - [npm install \@capacitor/ios]{.commandbox}
- Necesitamos tener instalado [CocoaPods](https://cocoapods.org/), y para ello necesitamos una versión actualizada del lenguaje de programación [Ruby](https://www.ruby-lang.org/) (se recomienda usar [Brew](https://brew.sh/) para realizar la instalación).
  - [gem install cocoapods]{.commandbox}
- Añadir al proyecto la intención de compilar para iOS
  - [ionic capacitor add ios]{.commandbox}
- Sincronizamos los assets en el proyecto iOS
  - [ionic capacitor sync]{.commandbox}
- Compilar proyecto, previamente nos pregunta por el emulador que queremos utilizar:
  - [ionic capacitor run ios]{.commandbox}

# Usar la aplicación {#usar-aplicación}

Aunque sólo hemos generado una aplicación de pruebas, podemos ver el resultado en distintas plataformas. Con el mismo código, las vistas generadas son ligeramente diferentes, simulando una aplicación nativa.

:::::::::::::: {.columns }
::: {.column width="30%"}
![](img/ionic/test_web.png){width="100%" framed=true}
:::
::: {.column width="30%" }
![](img/ionic/test_android.png){width="100%"}
:::
::: {.column width="30%" }
![](img/ionic/test_ios.png){width="100%"}
:::
::::::::::::::

::: center
[Misma aplicación en navegador, Android e iOS]{.footnotesize}
:::


