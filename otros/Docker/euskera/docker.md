

# Docker {#docker}

[Docker](https://www.docker.com/) 2013an sortutako Software Libreko proiektu bat da, aplikazioak eta zerbitzuak kontainerren bidez modu azkar eta errazean hedatzeko aukera ematen duena, aurrerago ikusiko dugun bezala.

Kontainer hauek abstrakzio-geruza bat eskaintzen dute eta aplikazioak sistema eragilearen gainerako ataletatik isolatzeko aukera ematen dute, Linux kernelaren ezaugarri jakin batzuk erabiliz.

Kontainer barruan, honako isolamendu mailak azpimarra daitezke:

 - Prozesu zuhaitza
 - Muntatutako fitxategi-sistemak
 - Erabiltzailearen IDa
 - Baliabideen isolamendua (PUZ/*CPU*, memoria, S/I blokeak...)
 - Sare isolatua

Beste edozein *software* motatan bezala, Dockerrek ezaugarri hauek guztiak erabiltzeko, beste aplikazio eta zerbitzu batzuetan oinarritzen da.

::: center
![Dockerrek erabiltzen dituen teknologia. Iturria: [Wikipedia](https://en.wikipedia.org/wiki/File:Docker-linux-interfaces.svg)](img/docker/docker_interfaces.png){width="75%"}
:::


2015ean Docker enpresak ***[Open Container Initiative](https://en.wikipedia.org/wiki/Open_Container_Initiative)*** sortu zuen, gaur egun Linux Foundation-en menpe dagoen proiektua, sistema eragile mailako birtualizaziorako estandar ireki bat diseinatzeko asmoarekin.

## Instalazioa {#instalación-docker}

Sistema eragilearen arabera, Docker modu ezberdinetan instala daiteke. GNU/Linux sistema eragileetan banaketa bakoitzak bere pakete propioa dauka instalazioa egiteko.

:::mycode
[Docker instalazioa Ubuntu-n]{.title}

``` console
ruben@vega:~$ sudo apt install docker.io
```
:::

::: errorbox
Ubuntu eta Debian-en pakete-izena "docker.io" da.
:::

### Windows eta/edo Mac-en instalazioa {#instalacion-docker-windows-mac}

Windows eta MacOS sistemetan [Docker Desktop](https://docs.docker.com/get-docker/) instalatzeko aukera dago; bertsio honek makina birtual bat erabiltzen du instalazioa errazteko. Hala ere, CLI ere instalatzen da, eta aurrerago ikusiko ditugun komandoak erabiltzeko aukera ematen du.

![Docker Desktop](img/docker/docker_desktop.png){width="90%" framed=true}

[Windows](https://docs.docker.com/desktop/install/windows-install/#system-requirements) kasuan, [BIOS/UEFI-n birtualizazioaren luzapenak gaituta izatea beharrezkoa da](https://www.virtualmetric.com/blog/how-to-enable-hardware-virtualization), eta bi aukera hauetako bat konfiguratu behar da Docker Desktop instalatu aurretik:

- [WSL2](#introducción-wsl) erabiltzea.
- UHyper-V eta Windows kontainer-sistema erabiltzea.



## Konfigurazioa {#configuración-docker}


Instalazioa egin ondoren ikusiko dugu Docker zerbitzuak interfaze berri bat sortu duela gure makinan, zeinaren IPa **172.17.0.1/16** den, lehenetsitako helbideratzearen arabera.

:::mycode
[IP berria]{.title}

``` console
ruben@vega:~$ ip a
...
3: docker0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue
    link/ether 02:42:9c:1f:e2:90 brd ff:ff:ff:ff:ff:ff
    inet 172.17.0.1/16 brd 172.17.255.255 scope global docker0
      valid_lft forever preferred_lft forever
```
:::

IP honek **zubi** lana egingo du (makina birtualetan gertatzen den antzera) kontainer berriak abiatzen ditugunean. Kontainerrak 172.17.0.0/16 sarearen barruan egongo dira, hau da, ekipoaren sare nagusitik isolatuta.

::: infobox
**Abiatu ditugun kontainerrak 172.17.0.0/16 sarean egongo dira**
:::

## Docker erabiltzea pribilegiorik gabeko erabiltzaile batekin {#usar-docker-con-usuario-sin-privilegios}

Docker erabiltzeko root/administratzaile baimenik ez duen erabiltzaile batekin, erabiltzaile hori talde baten barruan gehitu behar da. Docker non erabiltzen dugunaren arabera, modu batean edo bestean egin beharko dugu.

### Linux

Kasu honetan, erabiltzaileak izan behar duen taldea "**docker**" da, eta erabiltzaileari modu ezberdinetan gehi diezaiokegu:

- [/etc/group]{.configfile} fitxategia editatuz, eta erabiltzailea taldean gehituz
- Ondoren jartzen ditugun komandoak exekutatuz:

:::mycode
[Gehitu docker taldea erabiltzaileari]{.title}

```console
ruben@vega:~$ sudo addgroup ruben docker
[sudo] password for ruben:
Adding user `ruben' to group `docker' ...
Adding user ruben to group docker
Done.

ruben@vega:~$ newgrp docker
```
:::

Hemendik aurrera, Docker erabili ahal izango da taldera gehitu diogun erabiltzailearekin.

### Windows

Windowsen erabiltzaile batek Docker Desktop erabili ahal izateko, "**docker-users**" taldekoa izan behar du. Gehitzeko, **administratzaile baimenekin** PowerShell batetik exekutatuko dugu:

::: {.mycode}
[Gehitu docker-users taldea erabiltzaileari]{.title}

``` powershell
PS C:\Users\ruben> net localgroup "docker-users" "usuario" /add
```
:::

## Lehen urratsak {#primeros-pasos}

[docker]{.commandbox} komandoak aukera asko ditu, beraz gomendagarria da parametro gabe exekutatzea. Horrela aukera guztiak eta bakoitzaren laguntza sinplifikatu bat ikus daitezke.


:::mycode
[Docker komandoaren aukera batzuk]{.title}

```console
ruben@vega:~$ docker
Usage:  docker [OPTIONS] COMMAND

Management Commands:
builder     Manage builds
completion  Generate the autocompletion script for the specified shell
config      Manage Docker configs
container   Manage containers
context     Manage contexts
image       Manage images
manifest    Manage Docker image manifests and manifest lists
network     Manage networks
node        Manage Swarm nodes
plugin      Manage plugins
secret      Manage Docker secrets
service     Manage services
stack       Manage Docker stacks
swarm       Manage Swarm
system      Manage Docker
trust       Manage trust on Docker images
volume      Manage volumes

Commands:
...
```
:::

Aukera hauetako bakoitzari [\-\-help]{.inlineconsole} parametroa gehi dakioke laguntza erakusteko. Moztu den bigarren atal batean komando gehiago sartzen dira.

Docker zerbitzua martxan dagoela ziurtatzeko, [docker info]{.commandbox} erabil dezakegu, zerbitzuari buruzko informazio ugari erakutsiko diguna. Baina benetan nahi duguna bada egiaztatzea ea kontainerren bat martxan dagoen, errazagoa da [docker ps]{.commandbox} erabiltzea (hau da [docker container ls]{.commandbox}-en bertsio sinplifikatua):



::: mycode
[Docker eta abiarazitako kontainerren egoera egiaztatzea]{.title}

``` console
ruben@vega:~$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES

ruben@vega:~$ docker container ls
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
```
:::

Kasu honetan, ez dago kontainerrik abiarazita, eta zerrendako zutabeen goiburuak soilik erakusten dira.

## Gure lehen kontainerra abiarazten {#levantando-nuestro-primer-contenedor}

Orain gure lehen kontainerra sortzeko unea da. Horretarako, kontsola erabiltzen ari garenez, [docker]{.commandbox} komandoa erabili behar da parametro sorta batekin. Kasu honetan, **Apache HTTPD** zerbitzua abiaraztea aukeratu da:

::: mycode
[Lehen kontainerra abiarazten]{.title}

``` console
ruben@vega:~$ docker run -p 80:80 httpd
AH00558: httpd: Could not reliably determine the server's ...
AH00558: httpd: Could not reliably determine the server's ...
[Fri Mar 24 18:25:14.194246 2023] [mpm_event:notice] ...
[Fri Mar 24 18:25:14.194347 2023] [core:notice] [pid  ...
172.17.0.1 - - [24/Mar/2023:18:25:41 +0000] "GET / HTTP/1.1" 304 -
```
:::

Apache zerbitzuaren log-ak ikusten ditugu abiaraztean, eta nabigatzailean [http://localhost](http://localhost) helbidera joanez gero, hauxe erakusten du:

::: center
![](img/docker/apache.png){width="60%"}
:::

Eta komandoak zer egiten duen ulertzeko, parametroak hauek dira:

- **docker**: Docker kontsolako bezeroa.
- **run**: Komando bat exekutatzen du kontainer berri batean (eta ez badago sortzen du).
- **-p 80:80**: Zerbitzariaren 80 portuan argitaratzen du kontainerrean erabiltzen den 80 portua. Pentsa daiteke **port-forward** bezala egitea dela firewall batean.
- **httpd**: Abiaraziko den kontainerraren **irudia** da. Kasu honetan, [Apache HTTPD](https://hub.docker.com/_/httpd) zerbitzariaren irudia da.

Eta docker-aren egoerak zer erakusten duen begiratuz gero, kontainerra abiarazita agertzen dela ikus dezakegu.

::: {.mycode size=scriptsize}
[Docker eta abiarazitako kontainerren egoera egiaztatzea]{.title}

``` console
ruben@vega:~$ docker ps
CONTAINER ID   IMAGE     COMMAND       CREATED         STATUS         PORTS               NAMES
a1c3362b0d6c   httpd     "httpd-..."   3 seconds ago   Up 2 seconds   0.0.0.0:80->80/tcp  great
```
:::

PORTS zutabean ikus daiteke nola agertzen den **`0.0.0.0:80`** portua (sistema eragileko edozein IP-rentzat 80 portuan entzuten duena), eta hori kontainerraren barneko **`80/TCP`** portura birbideratzea dela.

## Kontainerrak *background*ean eta aukera gehiago {#contenedores-en-background-y-más-opciones}

Aurreko adibidean ikus daitekeenez, kontainerra lehen planoan geratzen da, Apache-ren log-ak erakutsiz. Honek garapenean gertatzen ari dena ikusteko balio dezake, baina ideia ona da kontainerra ***background*** moduan abiaraztea, eta behar dugunean log-ak kontsultatzea.

Jarraian Apache kontainer berri bat abiaraziko da parametro berriekin:

:::mycode
[8080 portuan Web kontainer bat sortzea]{.title}

``` console
ruben@vega:~$ docker run --name mi-apache -d -p 8080:80 httpd
```
:::

Parametro berriak honako hauek dira:

- **`--name mi-apache`**: Modu honetan kontainerari izen bat ematen zaio, sortutako kontainer guztien artean azkar identifikatzeko.
- **`-d`**: Parametro honek komandoa ***detach*** moduan exekutatzea ahalbidetzen du, eta horrela kontainerraren exekuzioa ***background***-era bidaltzen du.
- **`-p 8080:80`**: Kontainerrean erabiltzen den 80. ataka zerbitzarian 8080. atakara publikatzen du. Pentsa daiteke firewall batean **port-forward** bat egitea bezalaxe.

## Kontainerrak gelditu, abiarazi eta ezabatu {#parar-arrancar-y-borrar-contenedores}

Orain arte kontainerrak sortzen ikasi dugu, baina batzuetan interesgarria izan daiteke ez erabiltzen ari garen kontainer bat gelditzea, edo bere funtzioa bete duenean, ezabatzea.

### Kontainerrak gelditzea {#parar-contenedores}

Kontainer bat gelditzeko, bere izena edo IDa (bakarra dena) ezagutu behar dugu. Datu hauek [docker ps]{.commandbox} komandoaren bidez lor daitezke.

Horrela, honako hau exekutatu dezakegu:

::: {.mycode size=small}
[Kontainerra gelditu]{.title}

```console
ruben@vega:~$ docker stop mi-apache
```
:::

### Gelditutako kontainer bat abiarazi {#arrancar-un-contenedor-parado}

Kontainer bat gelditu ondoren, edo zerbitzaria berrabiarazten denean, gelditutako kontainer bat abiarazi nahi badugu, bere IDa edo izena ere ezagutu behar dugu.

Kontainer guztiak ikusteko (abiarazitakoak eta gelditutakoak), [docker ps -a]{.commandbox} komandoaren bidez egin dezakegu.

Zerrenda horri esker, geldituta dagoen kontainer bat berriro abiarazi dezakegu [docker start mi-apache]{.commandbox} komandoarekin, non "mi-apache" abiarazi nahi dugun kontainera den.

### Kontainer bat ezabatu {#borrar-un-contenedor}

Kontainer bat ezabatu nahi badugu, geldituta egon behar da, Docker-ek ez baitu exekuzioan dagoen kontainer bat ezabatzen utziko.

Interesgarria da proba kontainerrak edo ez erabiliko diren kontainerrak ezabatzea, baliabideak askatzeko.

Horretarako, aurreko kasuekin antzeko moduan, [docker rm mi-apache]{.commandbox} komandoa erabili behar da.

# Ingurune-aldagaiak {#variables-de-entorno-docker}

Kontainer batzuek aukera dute ingurune-aldagaiak jasotzeko sortzean. Aldagai hauek kontainerraren portaeran eragin dezakete, edo lehenetsi ezarpenetatik bestelako moduan abiarazi ahal izateko.

Docker irudiaren sortzaileak behar dituen ingurune-aldagaiak sor ditzake, gero bere aplikazioan erabiltzeko. Adibidez, [PHPMyAdmin](https://hub.docker.com/_/phpmyadmin) aplikazioaren irudia erabiliko da.

Hurrengo adibidean PHPMyAdmin kontainer bi sortuko dira, ataka, izen eta **PMA_ARBITRARY** ingurune-aldagaiarekin desberdinduta:

- Lehenengo kontainera 8081 atakan egongo da, "myadmin-1" izena izango du eta ingurune-aldagaia ez da hasieratuko.
- Bigarren kontainera 8082 atakan egongo da, "myadmin-2" izena izango du eta **PMA_ARBITRARY** aldagaia "1"-era hasieratuko da, [PHPMyAdmin irudiaren dokumentazioan](https://hub.docker.com/_/phpmyadmin) agertzen den moduan.

Horretarako, honako komando hauek exekutatu dira:

::: {.mycode size=footnotesize }
[PHPMyAdmin-en bi kontainerrak sortzen]{.title}

``` console
ruben@vega:~$ docker run --name myadmin-1 -d -p 8081:80 phpmyadmin

ruben@vega:~$ docker run --name myadmin-2 -e PMA_ARBITRARY=1 -d -p 8082:80 phpmyadmin
```
:::

Ikusten denez, bigarren kontainerrean **`-e`** parametro berria pasatu zaio, hau da, hurrengoaren ingurune-aldagaia dela adierazten duena (ingelesez ***environment***). Kasu honetan, ingurune-aldagaia **PMA_ARBITRARY** da, eta **1** balioarekin hasieratu da.

Orain gure web nabigatzailean zerbitzariaren IPko 8081 eta 8082 atakak bisitatuz gero, webak erakusten digun formularioan desberdintasun txiki bat nabarituko dugu.

8081 atakako formularioan (non aldagaia ez den hasieratu) erabiltzaile-izena eta pasahitza bakarrik sartu daitezke. Aldiz, 8082 atakako formularioan, **PMA_ARBITRARY** aldagaia hasieratuta, eta irudiaren dokumentazioak adierazten duen moduan, MySQL zerbitzariaren IP adierazi ahal izango dugu, konektatu nahi dugun zerbitzaria izanik.

:::::::::::::: {.columns }
::: {.column width="10%"}
:::
::: {.column width="35%"}
![\ ](img/docker/phpmyadmin1.png){width="100%" .center}
:::
::: {.column width="10%"}
:::
::: {.column width="35%"}
![](img/docker/phpmyadmin2.png){width="100%" .center}
:::
::: {.column width="10%"}
:::
::::::::::::::

::: center
[Ezkerrean 8081 atakako formularioa, aldagaia hasieratu gabe. Eskuman, 8082 ataka aldagaiarekin hasieratuta.]{.footnotesize}
:::

Aldagaiek zerbitzuaren portaeran (edo sortzean) eragina izan dezaketenez, garrantzitsua da dokumentazioa irakurtzea eta erabilgarriak izan daitezkeen aldagaiak identifikatzea.

::: infobox
**Docker irudien dokumentazioa irakurtzea gomendatzen da, ingurune-aldagai posibleak identifikatzeko eta guretzat erabilgarriak diren ikusteko.**
:::

# Datuen bolumen iraunkorra {#volumen-persistente-de-datos}

Orain arte Apache zerbitzua abiarazten duen irudi baten bidez kontainer bat sortu dugu, bere orrialde lehenetsia erakutsiz. Kontainer barruan gure HTML orrialdea idatzi genezake, baina kontuan izan behar dugu **kontainer baten datuak kontainerra ezabatzen denean desagertzen direla**.

Kontainer barruan egindako aldaketak mantendu nahi baditugu, **datu-bolumenak** erabiltzea beharrezkoa da. Hau ez da bestelako zerbait, **sistema eragileko diskoaren bide bat kontainer barruko bide batean muntatzea** baizik.

Kontainerrei esleitutako bolumen hauek bi motatakoak izan daitezke:

- **Irakurketa bakarrik**: Irakurri bakarreko bolumen bat esleitzea interesgarria izan daiteke konfigurazio-fitxategiak edo ikusgai jarri nahi dugun weba pasatzerakoan.
- **Irakurketa-Idazketa**: Kasu honetan bolumenean idatz daiteke. Adibidez, datu-base batek informazioa gordetzen duen direktorioa edo erabiltzaileek igotako irudiak gordetzen dituen weba.

Modu honetan, kontainer bakoitzari esleitu beharreko bolumen kopurua irudiaren, abiarazten den zerbitzuaren eta kontainer barruan sortu edo esleituko ditugun datuekin egin nahi dugunaren arabera zehaztu behar da.

Hurrengo irudian bi kontainer eta bi bolumen dituen azpiegitura ikus daiteke:

- **Web Kontainerra**: Irakurri-bakarreko bolumen bat esleitzen zaio, jatorrizko bidea [/opt/www-data]{.configdir} dena, kontainer barruan [/var/www/html]{.configdir} dagoena.
- **MySQL Kontainerra**: Datu-basearen datuak gordetzea beharrezkoa denez, idazketa baimentzen duen bolumen bat esleitzen zaio. Beraz, kontainer barruan [/var/lib/mysql]{.configdir} sortzen dena, benetan anfitrioi sistema eragilean [/opt/mysql-data]{.configdir} gordetzen da.

::: center
![Bi bolumen adibide desberdin kontainerretan esleituta](img/docker/volumes.png){width="50%"}
:::

## Bolumen idazgarria gehitu kontainer bat sortzerakoan {#añadir-volumen-de-escritura-al-crear-un-contenedor}

Kontainer bat sortzerakoan bolumen bat gehitzean, lehenetsita irakurketa-idazketa moduan sortzen da. Kontainer barruan bide zehatz batean egindako edozein idazketa, fitxategia anfitrioi sistema eragileko bide adierazian sortzea ekarriko du.

::: {.mycode size=small}
[Idazketa-bolumena gehitu kontainer bat sortzerakoan]{.title}

``` console
ruben@vega:~$ ls /opt/mysql-data
ruben@vega:~$ docker run -d -p 3306:3306 --name mi-db \
    -v /opt/mysql-data:/var/lib/mysql \
    -e MYSQL_ROOT_PASSWORD=my-secret-pw \
    mysql:latest
ruben@vega:~$ ls /opt/mysql-data
auto.cnf      client-key.pem      '#innodb_temp'      server-cert.pem   ...
```
:::

Adibide honetan, [MySQL](https://hub.docker.com/_/mysql) irudia erabiliz kontainer bat sortu da, bolumen bat esleituta (**lehenetsita idazketa baimentzen duen moduan esleitzen da**) eta gero pasahitzarekin konektatzeko beharrezko parametro batekin.

- **-v /opt/mysql-data:/var/lib/mysql**: **`-v`** parametroaren bidez kontainerrei bolumen bat pasatuko zaiela adierazten zaie. Gero, anfitrioi sistema eragileko bidea [/opt/mysql-data]{.configdir} zehazten da, kontainer barruan [/var/lib/mysql]{.configdir} muntatuko dena.

- **-e MYSQL_ROOT_PASSWORD=my-secret-pw**: "**-e**" parametroak kontainerrei **ingurune-aldagaiak** pasatzeko balio du. Kasu honetan, eta [MySQL irudiaren webgunean](https://hub.docker.com/_/mysql) azaltzen den bezala, hau da datu-basea hasieratzen den bitartean **root** erabiltzailearen pasahitza esleitzeko modua.

Kontainerra sortu ondoren, eta [docker ps]{.commandbox} komandoa erabiliz kontainerra martxan dagoela ziurtatu ondoren, anfitrioi sistema eragiletik edo beste edozein lekutik aurretik zehaztutako pasahitzarekin konekta daiteke.

::: {.mycode size=small}
[MySQL-ren status ikusten]{.title}

``` console
ruben@vega:~$ mysql -h127.0.0.1 -uroot -P3306 -p
    Enter password:
    ...
    MySQL [(none)]> show databases;
    +--------------------+
    | Database           |
    +--------------------+
    | information_schema |
    | mysql              |
    | performance_schema |
    | sys                |
    +--------------------+
    4 rows in set (0,007 sec)
```
:::

## Irakurketa-bakarrik moduan bolumena gehitu {#añadir-volumen-en-modo-sólo-lectura}

Jarraian azalduko dira pausoak PHPz sortutako web sinple bat daukan kontainer bat martxan jartzeko, web hori anfitrioi sistema eragileko [/opt/www-data]{.configdir} bidean dagoena.

::: mycode
[Irakurketa bakarreko bolumena gehitu kontainer bat sortzerakoan]{.titulo}

``` console
ruben@vega:~$ ls /opt/www-data
index.php
ruben@vega:~$ docker run -d -p 80:80 --name mi-web \
    -v /opt/www-data:/var/www/html:ro \
    php:8.2.4-apache
```
:::

Kontainer hau sortzean esleitutako parametro berria hau da:

- **`-v /opt/www-data:/var/www/html:ro`**: Bolumen bat esleituko diogula adierazteko, anfitrioi sistema eragileko [/opt/www-data]{.configdir} bidea kontainer barruko helbidearekin lotuz eta **irakurketa-bakarrik** moduan ezarriz [/var/www/html]{.configdir}.

Geroago, [Docker kontainer baten barruan nola sartu](#entrar-dentro-de-un-contenedor-docker) ikusiko dugunean, komando hau erabil daiteke kontainer barruko bidea bisitatzeko eta benetan irakurketa-bakarrik moduan dagoela egiaztatzeko.

## Docker kontainer baten barruan sartzea {#entrar-dentro-de-un-contenedor-docker}

Normalean ez da beharrezkoa kontainer baten barruan sartzea, izan ere, aurretik esan bezala, bertan egindako aldaketa guztiak galtzen dira (bolumen iraunkor baten barruan ez bada).

Hala ere, probak egiteko edo irudi baten funtzionamendu zuzena egiaztatzeko, kontainer baten barruan sartzea interesgarria izan daiteke. Horretarako, exekutatu beharreko komandoa hau da:

::: mycode
[Kontainer batean sartu]{.title}

``` console
ruben@vega:~$ docker exec -it mi-db /bin/bash
```
:::

Erabilitako parametroak hauek dira:

- **`exec`**: Martxan dagoen kontainer baten barruan komando bat exekutatu nahi dugula adierazten du.
- **`-it`**: Bi parametro elkartuta dira; sarrera irekita mantentzeko (modu interaktiboa) eta TTY (kontsola) bat sortzeko balio dute.
- **`mi-db`**: Sartu nahi dugun kontainerraren izena da. Halaber, kontainerraren **ID**a ere adierazi daiteke.
- **`/bin/bash`**: Exekutatu nahi dugun komandoa da. Kasu honetan, **bash** shell bat. Zenbait kasutan shell hau ez dago instalatuta eta **`/bin/sh`** erabili behar da.

Kontuan hartu behar da kontainer baten barruan aplikazioa/zerbitzua funtzionatzeko beharrezkoa den software minimoa bakarrik dagoela, beraz, komando asko ez dira existituko.

# Beste komando erabilgarri batzuk {#otros-comandos-utiles}

Kontainer baten informazio osoa lortzeko, bere egoera, erabilitako bolumenak, portuak, ...

::: mycode
[Kontainer baten informazioa lortu]{.title}

``` console
ruben@vega:~$ docker inspect mi-db
```
:::

Lokalean deskargatutako irudiak zerrendatu. Irudiak lokalean edukita, ez da berriro deskargatu beharko, eta horregatik, irudi horietako bat erabiltzen duen kontainer berri bat sortzea askoz azkarragoa izango da.

::: mycode
[Lokalean dauden irudien zerrenda]{.titulo}

``` console
ruben@vega:~$ docker image ls
REPOSITORY       TAG            IMAGE ID       CREATED        SIZE
php              8.2.4-apache   de23bf333100   3 days ago     460MB
httpd            latest         192d41583429   3 days ago     145MB
mysql            latest         483a8bc460a9   3 days ago     530MB
```
:::

Kontainer batean erabiltzen ez den irudi bat ezabatu.

::: mycode
[Irudi zehatz bat ezabatu]{.titulo}

``` console
ruben@vega:~$ docker image rm httpd
```
:::

Kontainer bat ***detached*** moduan dagoenean ez dira log-ak agertzen, eta horiek ikusteko komando berezi bat daukagu.

::: mycode
[Kontainer baten logak ikusi]{.titulo}

``` console
ruben@vega:~$ docker logs mi-web -f
172.17.0.1 - - [26/Mar/2023:18:05:29 +0000] "GET / HTTP/1.1" 200 248
172.17.0.1 - - [26/Mar/2023:18:05:29 +0000] "GET / HTTP/1.1" 200 248
172.17.0.1 - - [26/Mar/2023:18:05:29 +0000] "GET / HTTP/1.1" 200 248
```
:::


Sisteman dauden bolumenak zerrendatu. Zerrendan kontainerrak (aktiboak zein geldituak) erabiltzen ari direnak edo dagoeneko existitzen ez diren kontainerretan erabili direnak agertzen dira.

::: {.mycode size=small}
[Bolumenak zerrendatu]{.titulo}

``` console
ruben@vega:~$ docker volume ls
DRIVER    VOLUME NAME
local     0d6c400a6407f5cdea81a2f0158222fdd87d7f3b3e2b5969ca466d743fc71f5c
local     1d2f52018e17af0689e070a55337154c1dd68517c54435ecc24d597f7509d43c
local     6b72797227ef4708ca23ee1dfcb4b651b42eeacefd4166b898407ad4aadda10c
```
:::


Baliabide guztiak (kontainerrak, irudiak, bolumenak) garbitu nahi baditugu, eta ez badira erabiltzen ari, hurrengo komandoa erabil daiteke.

::: mycode
[Erabili gabe dauden baliabideak ezabatu
]{.titulo}

``` console
ruben@vega:~$ docker system prune -a
WARNING! This will remove:
- all stopped containers
- all networks not used by at least one container
- all images without at least one container associated to them
- all build cache

Are you sure you want to continue? [y/N] y
```
:::

::: errorbox
**Aurreko komandoak gelditutako kontainerrak ezabatzea eragiten du**
:::


Kontainer bakoitzaren erabilera-estatistikak ezagutzeko.  

::: {.mycode size=scriptsize}
[Kontainerren estatistikak ikusi]{.titulo}

``` console
ruben@vega:~$ docker stats
CONTAINER ID  NAME    CPU %   MEM USAGE / LIMIT     MEM %   NET I/O          BLOCK I/O   PIDS
2fcf97530766  mi-web  0.00%   54.62MiB / 15.47GiB   0.34%   9.44MB / 172kB   0B / 0B     6
413d6e9f590f  mi-db   0.55%   357.9MiB / 15.47GiB   2.26%   319kB / 280B     0B / 0B     38
```
:::


# Docker kontainer baten bizi-zikloa {#ciclo-de-vida-de-un-contenedor-docker}

Kontainer batek bizi-ziklo bat du, eta horretan hainbat egoera izan ditzake. Egoeren artean pasatzeko, Docker-en komando desberdinak erabili behar dira.

::: center
![Kontainer baten egoerak](img/docker/lifecycle.png){width="100%"}
:::

Irudian oinarrizko egoerak eta haietatik igarotzeko behar diren komandoak irudikatzen dira.
