
# Sarrera {#sge-introducción}

**Informatika** zientziaren arlo bat da, hainbat diziplina teoriko (adibidez, algoritmoen sorrera, konputazioaren teoria, informazioaren teoria, ...) eta diziplina praktiko (hardwarearen diseinua, softwarearen inplementazioa) biltzen dituena.

Programak (edo *softwarea*) sortzerakoan, mota desberdinetakoak identifika ditzakegu:

-   **Sistema-softwarea**: Sistemaren parte diren programak edo aplikazioak dira, sistema hobetzen, kudeatzen... laguntzen digutenak. Adibidez: monitorizazio-aplikazioak, logen auditoretza-aplikazioak, *driver*-ak, ...

-   **Garapen-softwarea**: Kasu honetan, beste aplikazio batzuk sortzen lagunduko diguten aplikazioak izango dira. Adibidez: funtzio-liburutegiak, konpilatzaileak, *debugger*-ak, IDEak...

-   **Erabiltzaile-aplikazioak**: Azken erabiltzaileek egunerokoan erabiliko dituzten aplikazioak dira. Honela bereiz ditzakegu:

    -   **Aplikazio orokorrak**: Edozein erabiltzaile motak edozein unetan erabiliko dituenak dira. Helburu zehatz batekin sortuak dira, baina ez da beharrezkoa ezagutza handirik izatea erabiltzeko. Adibidez: web-nabigatzaileak, posta-bezeroak, bulegotika-aplikazio sinpleak, kalkulagailua, egutegia, ...

    -   **Erabilera espezifikoko aplikazioak**: Kasu honetan, erabiltzaile zehatz baterako sortutako aplikazioak dira, erabilera oso zehatzarekin eta normalean ezagutza jakin batzuk behar izaten dira erabiltzeko.

        Ez dira zertan oso konplexuak izan, baina duten erabilgarritasuna edo egiten dutena garrantzitsua izan daiteke eta prozesu konplexuak izan ditzakete. Adibidez: CAD aplikazioak, birtualizazio-sistemak, aplikazio zientifikoak (R, JupyterLab), enpresa-aplikazioak, ...

Ikasgai honetan enpresa-kudeaketarako software espezializatu mota desberdinak ikusiko ditugu, hala nola ERP eta CRM sistemak, **informazio-sistemak** bezala sailka daitezkeenak.

# Informazio-sistemak {#sistemas-de-información}

Orokorrean, informazio-sistema bat da erakunde baten funtsezko prozesuetan erabiltzeko informazioa kudeatzen, biltzen, berreskuratzen, prozesatzen, biltegiratzen eta banatzen laguntzen duen sistema.

Normalean, informazio-sistema hauek erabiltzeko errazak izaten dira, malgutasun maila bat dute (enpresetara egokitu daitezke), eta informazioa azkar eta erraz gorde eta berreskuratzeko aukera ematen dute.

Horrela, lortutako informazioa baliotsuagoa izango da erakundearentzat, "irudi" zabalagoa izango duelako eta informazio gehiago erlazionatu ahal izango duelako mota honetako softwarea erabili ezean baino.

## Osagaiak {#componentes}

Informazio-sistema batek oinarrizko osagai hauek izan behar ditu, eta elkarrekin modu egokian elkarreragin behar dute funtzionamendu orokor ona izateko:

-   **Hardwarea**, datuak prozesatzeko eta biltegiratzeko erabiltzen den ekipo fisikoa.

-   **Softwarea** eta informazioa eraldatu eta ateratzeko erabiltzen diren prozedurak.

-   Enpresaren jarduerak ordezkatzen dituzten **datuak**.

-   Baliabideak ordenagailuen eta gailuen artean partekatzeko aukera ematen duen **sarea**.

-   Sistema garatzen, mantentzen eta erabiltzen duten **pertsonak**.

Azken puntua oso garrantzitsua da, izan ere, ez du ezertarako balio tresnarik onena, hardware onenean izateak, erabiltzaileek ez badituzte beharrezko ezagutzak.

::: errorbox
**Informazio-sistemak erabiltzen dituzten pertsonek beharrezko ezagutzak izan behar dituzte erabilera egokia bermatzeko.**
:::

Horregatik, informazio-sistema erabiliko duten pertsonek prestakuntza jaso behar dute eta/edo eskuliburuak izan behar dituzte erabilera egokirako, **eta haien iritziak kontuan hartu behar dira enpresaren barne-prozesuak hobetzeko**.

## Datuak vs informazioa {#datos-vs-información}

Datuak erakundean jasotako gertakariak islatzen dituzte eta oraindik prozesatu gabe daude (balioak edo neurketen emaitzak islatzen dituzte). Datu horiek gai zehatz bati buruzko gertakariak edo zenbakiak izango dira, eta lehen begiratuan ez dute zertan esanahi argirik izan behar.

Aldiz, informazioa lortzen da datu horiek behar bezala prozesatu, agregatu eta/edo aurkeztu ondoren, erabilgarriak izan daitezen eta horrela bestela lortu ezin litzatekeen balioa lortzeko.

Datuen eta informazioaren arteko adibiderik argiena edozein **ikerketa zientifikotan** ikus daiteke: datuak lortu ondoren, metodo zientifikoaren bidez ondorio batera iristen da eta horrela informazioa lortzen da.

Adibidez, karbono dioxidoaren (CO$_{2}$) neurketak atmosferan, datuak lortzen dira eta ondorengo irudia informazioa da:


![Azken milaka urteetako CO2 neurketak. Iturria: [NASA](https://climate.nasa.gov/en-espanol/signos-vitales/dioxido-de-carbono/)](img/sge/co2.png){width="70%"}


## Helburua {#objetivo}

Informazio-sistemen helburua, eta kasu honetan, enpresa-kudeaketarako erabiltzen direnen helburua, ekintzak azkarrago eta eraginkorrago egitea da, eta, beraz, enpresarentzat ekonomikoki ere onuragarriagoa izan beharko luke.

Informazioaren eta komunikazioaren teknologiak enpresetan erabiltzea **funtsezko elementu bihurtu da, ardatz eta abantaila lehiakorraren iturri gisa**.

Gaur egun, informatika erabiltzen ez duen enpresa batek bere estrategia baldintzatzen du, eta oso litekeena da negozio-aukerak galtzea, bai eta bere produktuak eta zerbitzuak garatzeko aukera ere.

Horregatik, informatika eta enpresa-kudeaketarako software espezializatua erabiltzeak enpresei lagundu diezaieke:

-   Abantaila lehiakorrak lortzen.

-   Enpresaren barne-eraginkortasuna hobetzen: kostuak murriztu, produktibitatea hobetu, informazioaren antolaketa hobetu, ...

-   Erabakiak hartzea erraztu eta hobetu, informazioa biltzearen bidez.

-   Negozio-estrategia berriak garatzeko.

## Baldintzak {#requisitos}

Informazioa erabilgarria izan dadin erakunde batean erabakiak hartzeko, hainbat baldintza bete behar ditu:

-   **Zehaztasuna**: zehatza eta akatsik gabea izan behar du.

-   **Ulermena**: erabiltzailearentzat ulergarria izan behar du.

-   **Osotasuna**: garrantzitsuak izan daitezkeen gertakari guztiak jaso behar ditu.

-   **Ekonomikotasuna**: informazioa lortzeko kostua txikiagoa izan behar du lortutako onurak baino.

-   **Konfiantza**: erabilitako datuen eta informazio-iturriaren kalitatea bermatu behar du.

-   **Garrantzia**: erabakiak hartzeko erabilgarria izan behar du.

-   **Xehetasun maila**: aurkezpen eta formatu egokiarekin eman behar da, erabilerraza eta maneiagarria izan dadin.

-   **Une egokian**: informazioa dagokion pertsonari eta une egokian eman behar zaio.

-   **Egiaztagarritasuna**: informazioa une oro egiaztatu eta konproba daiteke.

::: warnbox
Kontuan izan: **informazio gehiegi izateak ere kalte egin dezake**.
:::

## Jarduerak {#actividades}

Informazio-sistema bat erabiltzean, bertan egin daitezkeen jarduerak honela laburbil daitezke:

-   **Bilketa**: Datu gordinen bilketa da. Datu horiek erakundearen barrukoak, kanpokoak, automatikoki edo eskuz bilduak izan daitezke.

-   **Biltegiratzea**: Datuak egituratuta gorde behar dira ondorengo erabilerarako. Bestalde, **beren iraunkortasuna arriskuan ez dagoela ziurtatu behar dugu**, horretarako biltegiratze-sistema egokia izan behar dugu. Horretarako, **eskuragarritasun handiko sistema** eta **backup** sistema ona konfiguratu behar ditugu.

    Era berean, ziurtatu behar da **datuetarako sarbidea mugatua eta ziurtatua izango dela sarbide-kontrol eta autentifikazio sistemen bidez**.

-   **Prozesamendua**: Gakoa da, datuak informazio bihurtzen diren unea, eta horrela erakundeari erabakiak hartzen laguntzeko funtzioa betetzen du.

-   **Banaketa**: Sistemak informazioa behar duten pertsonen artean banatzeko aukera emango du.

## Informazio-sistemen motak {#tipos-de-sistemas-de-información}

Informazio-sistema mota desberdinak badaude ere, eta sailkapena hainbat funtzionalitate eta/edo helbururen arabera egin daitekeen arren, bi motatan zentratuko gara:

-   **ERP**: *Enterprise Resource Planning* edo enpresako baliabideen plangintza. Enpresa baten prozesu guztiak kudeatzeko aukera ematen duten sistema integratuak dira: kontrol ekonomiko-finantzarioa, logistika, ekoizpena, mantentze-lanak, giza baliabideak, ...

-   **CRM**: *Customer Relationship Management*, bezeroekin harremanak kudeatzeko eta kontaktu komertzial guztiak kudeatzeko sistemak.


