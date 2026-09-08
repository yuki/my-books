
# Resumen repositorio local y GitHub {#resumen-repositorio-local-github}

Este apartado es un resumen y/o guía rápida con los pasos para establecer un repositorio local y enlazarlo con GitHub.

::: infobox
Este resumen es aplicable para todos los sistemas operativos.
:::

## Clave pública/privada y GitHub {#resumen-clave-publica-privadaa}

Para el [sistema de autenticación](#autenticacion-github) con GitHub es preferible usar el [sistema de clave pública/privada con SSH](#autenticación-github-ssh).

::: errorbox
Este punto sólo es necesario cuando quieres usar un ordenador nuevo.
:::

### Crear clave pública/privada {#resumen-crear-clave-publica-privada}

Crear clave pública/Privada

::: mycode
[Crear par de claves pública/privada]{.title}
``` console
ruben@vega:~$ ssh-keygen
```
:::


### Subir clave pública a GitHub {#resumen-crear-clave-publica-privada}

Sacar por pantalla la clave pública recién creada:

::: mycode
[Sacar por pantalla clave pública]{.title}
``` console
ruben@vega:~$ cat .ssh/*pub
```
:::

Copiar ese texto en nuestro perfil de GitHub, apartado “SSH and GPG Keys”.

![Añadir clave pública en GitHub](img/git/github_public-key.png){width="50%" framed=true}

::: errorbox
Borra de GitHub la clave pública si dejas de usar el ordenador donde la creaste.
:::


## Crear respositorio en GitHub {#resumen-crear-repositorio}

Crea un [repositorio en GitHub](#crear-repositorio):

![Opciones al crear un nuevo repositorio en GitHub](img/git/github-new.png){width="60%" framed="true"}

Al crear el repositorio nos aparece el *quick setup*.

::: warnbox
Asegura tener marcada la opción SSH.
:::

## Crear repositorio local y enlazarlo {#resumen-repositorio-local}

Se va a crear un directorio "repositorios" para guardar todos los proyectos, y ahí crearemos un directorio por repositorio, para después enlazarlo.


### Crear directorios

Crear los directorios:

::: {.mycode}
[Crear directorio general y el del repositorio]{.title}

``` console
ruben@vega:~$ mkdir repositorios
ruben@vega:~$ cd repositorios
ruben@vega:~/repositorios$ mkdir proyecto1
ruben@vega:~/repositorios$ cd proyecto1
ruben@vega:~/repositorios/proyecto1/$ 
```
:::

### Configuración inicial git {#resumen-configuración-inicial}

Configurar nombre y e-mail.

::: {.mycode size=footnotesize}
[Configurar nombre y e-mail]{.title}

``` console
ruben@vega:~/repositorios/proyecto1/ $ git config --global user.name "Ruben Gomez"
ruben@vega:~/repositorios/proyecto1/ $ git config --global user.email ruben@example.com
```
:::


### Enlazar repositorio local con GitHub {#resumen-enlazar-repositorio-local-con-remoto}

A continuación los comandos que aparecen en el *quick setup*.

::: {.mycode size=footnotesize}
[Crear fichero, repositorio y enlazarlo con GitHub]{.title}

``` console
ruben@vega:~/repositorios/proyecto1/$ echo "# Proyecto" >> README.md
ruben@vega:~/repositorios/proyecto1/$ git init
ruben@vega:~/repositorios/proyecto1/$ git add README.md
ruben@vega:~/repositorios/proyecto1/$ git commit -m "first commit"
ruben@vega:~/repositorios/proyecto1/$ git branch -M main
ruben@vega:~/repositorios/proyecto1/$ git remote add origin git@github.com:yuki/proyecto.git
ruben@vega:~/repositorios/proyecto1/$ git push -u origin main
```
:::

La explicación rápida de cada comando:

1. Crear fichero README.md con un encabezado en Markdown
2. [Crear repositorio local](#crear-repositorio-local)
3. Añadir primer fichero al [estado](#estado-de-los-ficheros) *staged*.
4. Crear primer commit.
5. Cambiar el nombre de la rama a **main**.
6. [Enlazar repositorio local con remoto](#enlazar-repositorio-local-con-remoto)
7. Subir cambios locales a remoto.




# Fichero [.gitconfig]{.verbatim} de ejemplo {#fichero-gitconfig-ejemplo}

A continuación un ejemplo de fichero de configuración [.gitconfig]{.configfile}. Este fichero se guarda en la **HOME** del usuario.

Asegura cambiar el apartado [[user]]{.verbatim}

::: {.mycode size=footnotesize}
[Fichero de configuración]{.title}

``` ini
[user]
	name = NOMBRE
	email = NOMBRE@example
[color]
    branch = auto
    diff = auto
    grep = auto
    status = auto
    ui = auto
    interactive = auto
[core]
    excludesfile = ~/.gitignore
    editor = nvim
	autocrlf = input
    pager = less -FRX
[diff]
    tool=nvimdiff
[difftool]
    prompt=false
[difftool "nvimdiff"]
    cmd = "nvim -d \"$REMOTE\" \"$LOCAL\""
[merge]
    tool=nvimdiff
[push]
    defaul=simple
[alias]
  a = add
  c = commit
  co = checkout
  d = diff --color-words
  dn = diff --name-status
  ds = diff --stat
  l = log
  b = branch
  sb = show-branch
  # show ignored files by .gitignore and .git/info/exclude
  i = ls-files --others -i --exclude-standard
  g = log --graph --pretty=oneline --abbrev-commit --decorate
  lg = log --graph --all --pretty=format:'%Cred%h%Creset -%C(auto)%d%Creset \
%s %Cgreen(%cr) %C(bold blue)<%an>%Creset'
  lg2 = log --graph --all --oneline --decorate
  ld = log --graph --all --pretty=format:'%C(yellow)%h%Creset -%C(bold green)%d \
%Creset%s%C(cyan) %ar %Cblue%an' --date-order
  st = status
  limpia = clean -fdx
  l1 = log -1 -p
  track = "for-each-ref \
  --format=\"local: %(refname:short) <--sync--> remote: %(upstream:short)\" refs/heads"

[init]
	defaultBranch = main
[fetch]
	prune = true

```
:::