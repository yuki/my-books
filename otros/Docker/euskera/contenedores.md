
# Sarrera {#introducción-contenedores}

Gaur egun oso ohikoa da kontainer-sistemak erabiltzea, eta ezagunena *software* garapenaren munduan [Docker](https://docs.docker.com/) da. Sistema honek hainbat abantaila dakartza (aurrerago ikusiko ditugu), eta horri esker, besteak beste, produkzioko ingurunean erabilitako bertsioak garapen-faseetan erabilitako berberak direla egiaztatu dezakegu.

Dokumentu honetan Docker kontainer-sisteman oinarritutako sistema baten instalazioa eta konfigurazioa azalduko dira, zerbitzuak abiarazi ahal izateko eta ezagutu beharreko zenbait konfigurazio egiteko.

# Kontainer-sistemak {#sistemas-de-contenedores}

Kontainer-sistemak birtualizazio-metodo bat dira ("sistema eragile mailako birtualizazioa" bezala ezagutua), eta horren bidez posible da sistema eragilearen nukleoaren birtualizazio-geruza baten gainean hainbat "erabiltzaile-espazio" instantzia exekutatzea.

"Erabiltzaile-espazio" horiei (bertan aplikazioak, zerbitzuak… exekutatuko dira) **kontainerrak** deitzen zaie, eta benetako zerbitzari bat bezala izan daitezkeen arren, sistema eragilearen *kernel*-ak eskaintzen duen isolamendu-mekanismo baten menpe daude. Horrez gain, baliabide-mugak aplika daitezke, hala nola espazioa, memoria, disko-sarbidea…

::: infobox
**Kontainer bar zerbitzuen exekuziorako espazio bat da, eta baliabide-mugak (memoria, disko-sarbidea…) aplika dakizkioke.**
:::

Erabiltzaile baten ikuspegitik, zerbitzu bat makina birtual batean edo kontainer batean exekutatzea antzekoa da. Aldiz, sistema-administratzaile edo garatzaile baten ikuspegitik, kontaineren erabilerak hainbat abantaila dakartza, eta horiek hurrengo ataletan ikusiko ditugu.


## Historia pixka bat {#un-poco-de-historia-contenedores}

Kontainerrak erabiliz aplikazioak hedatzea gaur egun oso modan dagoen arren, ez da kontzeptu berria, 80ko hamarkadatik existitzen baita UNIX sistemetan [chroot](https://es.wikipedia.org/wiki/Chroot) kontzeptuarekin.

**Chroot**, "chroot kaiolak" bezala ere ezaguna, komandoak direktorio baten barruan exekutatzea ahalbidetzen zuen, hasiera batean ibilbide horretatik irten ezin zela suposatuz. Segurtasun-murrizketa oso gutxi zituen, baina kontainer-sistemarako lehen urratsa izan zen.

[LXC](https://es.wikipedia.org/wiki/LXC) 2008an sortu zen, Linux kernelaren hainbat funtzionaltasun erabiliz prozesu desberdinak exekutatu eta bere sare-espazioa izan zezakeen ingurune birtual bat eskaintzeko. LXC-rekin batera tresna ugari sortu ziren kontainer hauek kontrolatzeko, baita txantiloiak sortzeko eta **LXC-rekin programazio-lengoaia desberdinetatik interakzioa ahalbidetzen duen API bat** ere.

Beste teknologia batzuk ere egon dira Linuxen, hala nola [OpenVz](https://es.wikipedia.org/wiki/OpenVZ), baina guk Dockerri erreparatuko diogu, gaur egun ezagunena baita.

## Zer da kontainer bat eta nola sortzen da {#qué-es-un-contenedor-y-cómo-se-crea}

Docker azpiegituraren barruan kontainer bat zer den eta nola sortzen den ulertzeko, hainbat kontzeptu bereizi behar ditugu:

- **Docker irudia**
- **Docker kontainerra**

Ondoren xehetasun handiagoz azalduko dira.

### Docker irudiak {#imágenes-docker}

Kontainer bat sortzeko **"irudi" bat erabiltzea beharrezkoa da, hau da, aplikazioaren kodea eta exekutatzeko behar dituen mendekotasun guztiak biltzen dituen fitxategi immutagarria (aldatu ezin dena)**. Horrela, azkar eta modu fidagarrian exekutatu daiteke, edozein ingurunean.

Irudiak, bere jatorri **irakurketa-soilekoari** esker, **"txantiloi"** gisa har daitezke, aplikazio bat exekutatzeko behar dituen ingurune osoa, une jakin bateko ordezkaritza direlako. **Konsistentzia hori Docker-en ezaugarri nagusietako bat da**.

::: infobox
**Irudi batek interesatzen zaigun zerbitzua eta haren mendekotasunak ditu, eta exekutatzen den zerbitzaritik independenteak dira.**
:::

Irudi bat beste irudi batzuk oinarri gisa erabiliz sor daiteke. Adibidez, [PHPMyAdmin](https://hub.docker.com/_/phpmyadmin) irudiak PHPMyAdmin aplikazioa biltzen du **PHP** (8.1-apache bertsioa) irudiaren gainean, eta honek berriz **Debian** (11-slim bertsioa) irudia erabiltzen du.

::: center
![PHPMyAdmin-ek erabilitako irudien hierarkia. [Iturria.](https://hub.docker.com/layers/library/phpmyadmin/latest/images/sha256-79e38dd8b2ab0e92505aa92040fa49dce4fa921a977b6ce4d030a63b4f120009?context=explore)](img/docker/imagen1.png){width="90%"}
:::

Sortutako irudiei gehienetan etiketak (***tags***) eransten zaizkie bertsioak edo barne-ezaugarriak bereizteko. Sortzaile bakoitzak bere intereseko etiketak sortzen ditu. Adibidez:

- **latest**: Sortutako azken irudiari deritzo.
- php:**8.1-apache**: Irudi honetan PHPren bertsioa 8.1 dela eta Apache ere baduela adierazten du.

Erabili ditzakegu irudi publikoak komunitateak igotako irudiak gordetzen dituen ***registry*** publiko baten bidez deskargatuz. Gehien erabiltzen den *registry* nagusia [Docker Hub](https://hub.docker.com/) da.

::: infobox
**Docker irudiak publikoak edo pribatuak izan daitezke, eta *registry* izeneko biltegi batean gordetzen dira; ezagunena Docker Hub da**
:::

**[Gure irudi pribatuak sor ditzakegu](#crear-imagenes-docker)**, eta horiek gure ekipoetan gorde edo guk sortutako **registry pribatu** batean eduki ditzakegu (ordainpeko zerbitzuak ere badaude).

### Docker kontainerrak {#contenedores-docker}

Docker **exekuzio-denborako ingurune birtualizatu bat, non erabiltzaileek aplikazioak isolatu ditzaketen** kontainer bat da. Kontainer hauek unitate trinkoak eta eramangarriak dira, eta baliabideen mugaketa-sistema aplika dakieke.

::: infobox
**Kontainer bat irudi baten bidez sortzen da; irudi horren exekutagarri den bertsioa da, ingurune birtualizatu batean sortuta.**
:::

Kontainer bat irudi baten bidez sortzen da eta haren exekutagarri den bertsioa da. Horretarako, irudi immutagarriaren gainean idazketa-geruza bat sortzen da, eta hor idatzi daitezke datuak. Irudi base beraren bidez kontainer mugagabeak sor daitezke.

::: center
![Kontainer baten barneko irudia](img/docker/contenedor.png){width="60%"}
:::


**Idazketa-geruza ez da iraunkorra** eta kontainerra ezabatzean galtzen da, hau da, **kontainer baten datuak ezabatzen dira kontainer bera ezabatzean**. Portaera hau saihesteko, [datuen bolumen iraunkorra](#volumen-persistente-de-datos) erabil daiteke, horrela datu horiek ez dira galduko.

::: errorbox
**Kontainer baten barruan sortutako datuak ezabatzen dira kontainerra ezabatzean**
:::

## Kontainerrak vs. Makina birtualak {#contenedores-vs.-máquinas-virtuales}

Makina birtualen erabilera oso hedatua dago, gero eta errazagoa baita hauek sortzea. Honek ez du esan nahi beti aukera onena denik; beraz, konparaketa bat egingo da, makina birtualekin eta kontainer-sistemekin garapena egiterakoan, kontuan hartu beharreko alderdi desberdinak aztertuz.

### Azpiegitura {#infraestructura}

Makina birtualak sortzeak aukera ematen digu ingurune isolatuak sortzeko, bertan nahi dugun Sistema Eragilea instalatzeko eta, horrekin batera, behar dugun softwarea eta zerbitzuak instalatzeko.

Makina birtualak **hardware-mailan** birtualizatzen dira; horretarako beharrezkoa da Sistema Eragile bat hipervisorearekin, birtualizazioa ahalbidetzeko. Bestalde, kontainerrak **aplikazio-geruzan** birtualizatzen dira, eta horrek sistema askoz arinago bihurtzen du, baliabide horiek kontainer barruan exekutatu nahi ditugun zerbitzuetan erabil daitezen.

::: center
![Azpiegitura: Makina Birtualak vs Docker](img/docker/docker_vs_vm.png){width="85%"}
:::

Irudian konparaketa bat ikus daiteke: 3 aplikazio desberdin makina birtualetan edo kontainer desberdinetan martxan jarriz nola geratuko litzatekeen azpiegitura.

Irudian ikus daitekeenez, **zerbitzu bakoitza makina birtual bereizi batean izatean**, sistema eragile osoa birtualizatu behar da, eta horrek **baliabide-kostua (RAM memoria eta disko gogorra) eta konfigurazioan eta segurtasunean denbora-kostua** dakar.

::: infobox
**Kontainerrak erabiliz azpiegitura nabarmen sinplifikatzen da**
:::

Bestalde, kontainer-sistema batean, kontainer bakoitza zerbitzu isolatu bat da, eta hasiera batean bere parametroak konfiguratzeaz bakarrik arduratu beharko gara.

### Garapenean dauden abantailak {#ventajas-durante-el-desarrollo}

Aplikazio bat garatzerakoan ohikoa da probak egitea liburutegi, *framework* edo programazio-lengoaia beraren bertsio desberdinak erabiliz. Horrela, gure aplikazioa bateragarria den ala ez ikus dezakegu.

Makina birtualak erabiltzean, gure banaketak (*distribución*) dituen bertsioen menpe gaude, eta baliteke bertsio berriak edo paraleloan beste bertsio batzuk ezin instalatzea.

Adibidez, gaur egun PHP-ren azken bertsioa 8.4.11 da eta Apache-ren bertsioa 2.4.65:

- **Debian 12**-n soilik PHP 8.2.29 eta Apache 2.4.62 instala daitezke.
- **Ubuntu 24.04**-n PHP 8.3.6 eta Apache 2.4.58 daude eskuragarri.

Docker erabiliz, interesatzen zaigun zerbitzuaren bertsio desberdinekin kontainerrak aldi berean martxan jar ditzakegu, gure aplikazioa/zerbitzua bateragarria den ala ez egiaztatzeko.

::: infobox
**Docker erabiliz, bertsio desberdinekin zerbitzuak aldi berean martxan jar daitezke.**
:::

Bestalde, garatzaile batek sistema eragile desberdin bat erabili nahi badu, ez du kezkatu beharko bere banaketak bertsio berdinak dituen ala ez. Eta Windows/Mac erabiltzen badu, ez du zertan bertsio zehatzak instalatzen ibili.

### Ekoizpenerako abantailak {#ventajas-durante-la-puesta-en-producción}

Aurreko atalari lotuta, ekoizpenean (*producción*) derrigorrezkoa da garapenean erabilitako bertsio berberak erabiltzea bateragarritasuna (*compatibilidad*) bermatzeko.

::: errorbox
**Ekoizpenean (*producción*) bateragarritasuna bermatzeko, beti erabili behar dira garapenean erabilitako zerbitzuen bertsio berberak.**
:::

Zerbitzari bat eguneratuta ez badago, edo zerbitzari berean aplikazio desberdinak baditugu eta horietako bakoitzak softwarearen bertsio desberdinak behar baditu, makina birtualen ingurune batean oso konplexua bihurtzen da, ohikoena makina birtual berriak instalatu behar izatea baita.

::: warnbox
**Ez da beti posible zerbitzari berean software berdinaren bertsio desberdinak edukitzea.**
:::

Kontainer-ingurune batean, lehen azaldu den bezala, ez daukago arazo hori.

### Azkartasuna zabalkundean {#rapidez-en-el-despliegue}

Aurreko guztiarekin lotuta, garapen/ekoizpen ingurune baten zabalkundea (*despliegue*) azkarragoa da kontainerrak erabiliz, zein sistema eragile erabiltzen ari garen kontuan hartu gabe.

::: infobox
**Kontainerrekin zabalkundea azkarragoa da.**
:::

Aurrerago ikusiko da nola jarri martxan zerbitzu desberdinak komando bakar baten bidez.

