
# Sarrera {#introducción}

Web-orri bat erabiltzen dugunean, hainbat ekintza-programa eta zerbitzu sartzen diren ekintza-sekuentzia bat hasten da (batzuk gure ekipoan eta beste batzuk hortik kanpo). Sekuentzia sinplifikatuta honako hau izango litzateke:

1. Erabiltzaileak bisitatu nahi duen web-orriaren URL bat sartzen du nabigatzailean.
2. Gure ekipoak DNS eskaera bat egiten du eskaera zein IP helbidetara egin behar den jakiteko.
3. Nabigatzaileak orria zerbitzariari eskatzen dio.
4. Zerbitzariak eskaera prozesatzen du. Zerbitzarian hainbat prozesu egin ohi dira, hala nola:
   1. Eskaera jasotzea.
   2. Eskaera prozesatzea (programazio-lengoaia bat behar izan dezake: PHP/Ruby/Python/Java...).
   3. Beharrezkoa bada, datu-base batera sartzea.
   4. Zerbitzariak itzuli behar duen informazioa sortzea.
5. Zerbitzariak informazioa itzultzen du.
6. Nabigatzaileak informazio hori (HTML eta CSS kodea) interpretatu eta erabiltzaileari erakusten dio.
7. Informazio horren zati bat gure nabigatzailean exekutatzen den programazio-lengoaia baten bidez sortuta egon daiteke.

::: infobox
3. eta 5. urratsak irudiekin, CSS fitxategiekin, JS fitxategiekin, bideoekin eta abarrekin ere errepikatzen dira.
:::

Gaur egun, lehen mahaigaineko programak ziren aplikazio askok nabigatzaile batetik soilik funtzionatzen dute:

- Posta elektronikoa
- Argazkiak ukitzeko programak
- Enpresa-kudeatzaileak (fakturak/almategia/hitzorduak)
- Jokoak

# Web-garapenaren historia bezero-ingurunean {#historia-desarrollo-web-entorno-cliente}

Gaur egun, nabigatzailean web-garapenaz pentsatzen dugunean, ohikoena **HTML**, **CSS** eta **JavaScript**-en pentsatzea da. Hala ere, ez da beti horrela izan. Historian zehar, teknologia desberdinak erabili dira web-orriei interaktibitatea gehitzeko. Batzuk desagertu egin ziren, eta beste batzuk eboluzionatuz joan ziren gaur egungo estandarrak bihurtu arte.

## Lehen urteak: web-orri estatikoak {#primeros-años}

1991n, [Tim Berners-Lee](https://en.wikipedia.org/wiki/Tim_Berners-Lee) HTMLren garapenean hasi zen [CERN](https://en.wikipedia.org/wiki/CERN) erakundean. HTML lengoaia sortzeaz gain, [HTTP (*HyperText Transfer Protocol*)](https://es.wikipedia.org/wiki/Protocolo_de_transferencia_de_hipertexto) protokoloa eta lehen web-zerbitzaria ere sortu zituen.

![Lehen Web zerbitzaria](img/dec/First_Web_Server.jpg){width=50%}

1993an argitaratu eta estandar gisa proposatu zuen [IETF](https://en.wikipedia.org/wiki/Internet_Engineering_Task_Force) erakundeak. Une horretan, web-orriak **HTML**-z soilik osatuta zeuden. Haien edukia guztiz estatikoa zen: testua, irudiak eta estekak erakusten zituzten, baina ia ez zegoen erabiltzailearekiko interakziorik.

Ondoren, 1996an, **CSS** agertu zen. Horri esker, edukia aurkezpenetik bereizi eta web-orrien itxura bisuala hobetu ahal izan zen.

::: infobox
Garai hartan, edozein prozesamendu konplexu zerbitzarian egin behar zen, nabigatzaileak exekuzio-gaitasun oso mugatua baitzuen.
:::

### Zerbitzari-inguruneko lengoaiak {#primeros-lenguajes-entorno-servidor}

Irakasgai honetan bezero-ingurunean zentratuko bagara ere, interesgarria da jakitea lehen urte haietan, web-orriak *backend*-ean programatuz sortu ahal izateko, garai hartan UNIX inguruneetan ohikoenak ziren lengoaiak erabiltzen zirela, hala nola [C](https://en.wikipedia.org/wiki/C_(programming_language)), [Perl](https://en.wikipedia.org/wiki/Perl) eta, ondoren, [Python](https://en.wikipedia.org/wiki/Python_(programming_language)).

Programazio-lengoaia horiek erabiltzeko, [**CGI** (*Common Gateway Interface*)](https://en.wikipedia.org/wiki/Common_Gateway_Interface) interfazea erabiltzen zen. Interfaze horrek web-zerbitzariei eskaera HTTP prozesatzen zuen kanpoko programa bat exekutatzea ahalbidetzen zien.

Prozesuak honela funtzionatzen zuen HTTP eskaera bakoitzerako:

1. Prozesu berri bat sortzea.
2. Programa kargatzea.
3. Exekutatzea.
4. Prozesua amaitzea.

Horren ondorioz, CPU eta memoria-baliabide asko kontsumitzen zituen.

::: warnbox
CGI erabiltzen hasi zen aplikazio-zerbitzariak edo web-zerbitzarietako moduluak agertu aurretik.
:::

## JavaScript: orri dinamikoen jaiotza {#javascript-nacimiento}

1995ean, [Netscape](https://en.wikipedia.org/wiki/Netscape) enpresak **JavaScript** garatu zuen, web-orriei funtzionalitate txikiak gehitzeko helburuarekin, zerbitzariarekin etengabe komunikatu beharrik gabe.

JavaScript-i esker, honako hauek egin ahal izan ziren:

- Inprimakiak bidali aurretik baliozkotzea.
- Orriko elementuak erakustea edo ezkutatzea.
- Menu interaktiboak sortzea.
- Erabiltzailearen ekintzei berehala erantzutea.

Urteek aurrera egin ahala, JavaScript eboluzionatuz joan zen programazio-lengoaia oso ahaltsua bihurtu arte, web-aplikazio osoak garatzeko gai izanik.

Gaur egun, **nabigatzaile guztiek natiboki exekutatzen duten programazio-lengoaia bakarra da**.

Netscapek bere web-nabigatzailearen kodea askatu zuen eta Mozilla erakundea sortu zuen; erakunde horrek, aldi berean, nabigatzailea berridatzi zuen, eta geroago Firefox bihurtuko zen.

## Java Applets: Java aplikazioak nabigatzailean {#java-applets}

Handik gutxira, oso ezaguna egin zen beste teknologia bat agertu zen: **[Java Applets](https://en.wikipedia.org/wiki/Java_applet)**. Applet bat Java-n idatzitako programa bat zen, web-orri batetik deskargatu eta erabiltzailearen ordenagailuan exekutatzen zena, nabigatzailearen plugin gisa instalatutako **Java Makina Birtualaren (JVM)** bidez.

Applet-ek garai hartako JavaScript-ekin egin zitezkeenak baino aplikazio askoz konplexuagoak garatzeko aukera ematen zuten. Adibidez:

- Jokoak.
- Simulazioak.
- Marrazketa-tresnak.
- Hezkuntza-aplikazioak.
- Hiru dimentsioko bistaratzaileak.

Hala ere, hainbat eragozpen zituzten:

- Beharrezkoa zen ordenagailuan Java instalatzea.
- Nabigatzailearen plugin baten mende zeuden.
- Kargatzeko denbora luzea behar zuten.
- Segurtasun-arazo ugari zituzten.

**2017an zaharkitutzat jo zen**, eta nabigatzaileek Applet-ak exekutatzeko beharrezkoak ziren pluginak onartzeari utzi zioten.

## Adobe Flash: Interneteko animazioak {#adboe-flash}

90eko hamarkadaren amaieran eta 2000ko hamarkadaren zati handi batean, **[Adobe Flash](https://en.wikipedia.org/wiki/Adobe_Flash)** Interneten multimedia-edukiak sortzeko teknologia nagusietako bat bihurtu zen. Flash-ek honako hauek garatzeko aukera ematen zuen:

- Animazioak.
- Jokoak.
- Bideo-erreproduzitzaileak.
- Publizitate interaktiboa.
- Aplikazio osoak.

Urte askotan oso erabilia izan zen, **nabigatzaileek oraindik ez baitzituzten gaitasun horietako asko natiboki eskaintzen**. Hala ere, Flash-ek hainbat arazo zituen:

- Plugin bat instalatzea eskatzen zuen.
- Baliabide asko kontsumitzen zituen.
- Segurtasun-ahultasun ugari zituen.
- Ez zuen behar bezala funtzionatzen gailu mugikor gehienetan.

2010ean, Steve Jobsek [Flash-i buruzko hausnarketak](https://en.wikipedia.org/wiki/Thoughts_on_Flash) izeneko gutun irekia idatzi zuen, eta bertan azaldu zuen zergatik ez zuen Applek Flash iPhone-etan erabiltzea baimentzen. Hasieran kritika ugari izan ziren, eta Appleren aurka argudiatu zitezkeen hainbat arrazoi baziren ere, urte batzuk geroago baieztatu zen Flash-ek baliabide eta bateria asko kontsumitzen zituela eta ez zela segurua.

2020an, Adobek Flash-i laguntza emateari utzi zion, eta nabigatzaileek haren bateragarritasuna erabat ezabatu zuten.

## AJAX: aplikazio azkarragoak {#ajax}

1999an, Microsoft-ek **[AJAX](https://en.wikipedia.org/wiki/Ajax_(programming))** (*Asynchronous JavaScript and XML*) izeneko teknika sortu zuen, 1996ko *iframe* etiketekiko bilakaera gisa; hasiera batean, Internet Explorer 5.0-ra mugatuta zegoen.

AJAXen aurretik, erabiltzaileak ekintza bat egiten zuen bakoitzean beharrezkoa zen orrialde osoa berriro kargatzea. AJAX-i esker, nabigatzailea zerbitzariarekin komunikatu zitekeen atzeko planoan, eta orrialdearen zati bakarra eguneratu. Horri esker, aplikazio askoz azkarragoak eta erabiltzaile-esperientzia hobea zutenak sortu ahal izan ziren.

::: infobox
Jatorriz datuak trukatzeko XML erabiltzen bazuen ere, gaur egun aplikazio gehienek **[JSON](https://en.wikipedia.org/wiki/JSON)** formatua erabiltzen dute.
:::

## jQuery: web-garapena sinplifikatuz {#jquery-simplificando-desarrollo-web}

2006tik aurrera, **[jQuery](https://jquery.com/)** JavaScript liburutegi ezagunenetako bat bihurtu zen. Garai hartan, JavaScript hutsez web-aplikazioak garatzea zaila zen, **nabigatzaile bakoitzak DOMa eta gertaerak modu apur bat desberdinean inplementatzen baitzituen**. Gainera, gaur egun ohikotzat jotzen ditugun funtzionalitate asko, hala nola [querySelector()]{.verbatim}, [fetch()]{.verbatim} edo gertaeren kudeaketa bateratua, oraindik ez zeuden existitzen edo ez zeuden erabilgarri nabigatzaile guztietan.

jQuery-ren helburu nagusia nabigatzaile guztiekin bateragarria zen API sinple bat eskaintzea zen. Horri esker, garatzaileek CSSren antzeko hautatzaileak erabiliz elementuak hauta zitzaketen, orrialde baten edukia alda zezaketen, gertaerak kudea zitzaketen, animazioak sor zitzaketen edo AJAX eskaerak egin zitzaketen, nabigatzaileen arteko desberdintasunez kezkatu beharrik gabe. Horrek beharrezkoa zen kode kopurua nabarmen murrizten zuen eta web-aplikazioen garapena errazten zuen.

Hainbat urtez, jQuery Interneteko webgune gehienetan egon zen, eta frontend garatzaileentzat ia ezinbesteko tresna bihurtu zen. Haren arrakasta hain handia izan zen, ezen popularizatu zituen funtzionalitate asko JavaScript-en eta nabigatzaile modernoetan natiboki txertatu baitziren azkenean.

:::infobox
Popularizatu zituen funtzionalitate asko JavaScript-en eta nabigatzaile modernoetan natiboki txertatu ziren azkenean.
:::

HTML5 agertzearekin, nabigatzailearen APIak estandarizatzearekin eta **Angular**, **React** eta **Vue.js** bezalako frameworken garapenarekin, jQuery erabiltzeko beharra gutxituz joan zen. Gaur egun oraindik badago antzinako proiektu batzuetan, baina web-aplikazio berrietan askoz gutxiago erabiltzen da, nabigatzaile modernoek eta egungo frameworkek irtenbide osatuagoak eta ahaltsuagoak eskaintzen baitituzte.

jQuery ezagunenetako bat izan bazen ere, urte haietan baziren JavaScript zabaltzen saiatzen ziren beste liburutegi batzuk ere:

- **[Prototype](https://en.wikipedia.org/wiki/Prototype_JavaScript_Framework)**, 2005ekoa, oso erabilia Ruby on Rails-ekin batera. DOMari metodoak gehitzen zizkion eta JavaScript sinplifikatzen zuen.
- **script.aculo.us**, Protoype-ren gainean sortua, animazioak, efektu bisualak eta *drag & drop* sortzeko liburutegia zen.
- [Ext JS](https://en.wikipedia.org/wiki/Ext_JS): mahaigaineko programen oso antzeko interfazeak dituzten enpresa-aplikazioetara bideratuta. Oraindik existitzen da, nahiz eta erabilera askoz txikiagoa izan.

## HTML5: nabigatzaileak gaitasunak irabazten ditu {#html5}

:::::::::::::: {.columns }
::: {.column width="85%"}
2007an [HTML5](https://en.wikipedia.org/wiki/HTML5) lehen zirriborroa argitaratu zen, HTML lengoaiaren bilakaera garrantzitsua. HTML5ek aurretik Flash bezalako kanpoko teknologien bidez soilik lor zitezkeen funtzionalitate ugari txertatu zituen.

HTML5-i esker, nabigatzaile modernoak garapen-plataforma askoz osatuago bihurtzen hasi ziren, hainbat baliabide natiboki exekutatzeko APIak txertatu baitzituzten:
:::
::: {.column width="15%" }
![](img/dec/HTML5_logo_and_wordmark.svg){width="100%"}
:::
::::::::::::::

- Bideoa eta audioa pluginik gabe erreproduzitzea (YouTube erabiltzen hasi zen iPhone-rako erreproduzitzaile gisa).
- Marrazkiak egitea [<canvas>]{.verbatim} etiketaren bidez.
- Grafiko bektorialak SVG-rekin.
- Datuak lokalean biltegiratzea.
- Geokokapena.
- Gailuaren hainbat baliabidetara sartzeko APIak.

## JavaScript frameworkak {#frameworks-javascript}

Web-aplikazioak tamainaz handitzen joan ahala, kode guztia JavaScript erabiliz soilik garatzea gero eta zailagoa zen. Horregatik, ***framework*** desberdinak agertu ziren, aplikazio konplexuen garapena errazteko helburuarekin.

Ezagunenetako batzuk hauek dira:

- [Vue.js](https://vuejs.org/)
- [React](https://es.react.dev/)
- [Angular](https://angular.dev/)

Framework horiei esker, kodea antolatu, osagaiak berrerabili eta tamaina handiko aplikazioak errazago gara daitezke.

Gaur egun **[TypeScript](https://en.wikipedia.org/wiki/TypeScript)** ere badago. Goi-mailako programazio-lengoaia bat da, JavaScript-era *transpilatzen* dena. JavaScript-en superset bat da. Gaur egun hainbat [*framework* eta aplikaziok](https://en.wikipedia.org/wiki/List_of_TypeScript_software_and_tools) erabiltzen dute. **TypeScript kodea ez da bezero-ingurunean exekutatzen**.

## WebAssembly: bitarren exekuzioa nabigatzailean {#webassembly}

Azken urteotan, **WebAssembly (Wasm)** izeneko teknologia berri bat agertu da. WebAssembly ez da programazio-lengoaia bat, baizik eta nabigatzaileek oso modu eraginkorrean exekuta dezaketen formatu bitar bat. C, C++, Rust eta Java bezalako programazio-lengoaiak erabiltzea ahalbidetzen du. Lengoaiok konpilatu egiten dira, aplikazioak garatzeko eta ondoren nabigatzailearen barruan exekutatzeko.

Teknologia hau bereziki erabilgarria da errendimendu handia behar duten aplikazioetarako, hala nola:

- Bideo-jokoak.
- Irudi-editoreak.
- 3D modelaketa.
- Simulazio zientifikoak.
- Bideo-edizioa.

WebAssembly-k konpilatutako kodea oso azkar exekuta dezakeen arren, JavaScript beharrezkoa izaten jarraitzen du nabigatzailearekin eta web-orriarekin elkarreragiteko.

# Bezero-zerbitzari arkitektura {#arquitectura-cliente-servidor}

Web-aplikazio gehienek **bezero-zerbitzari** izeneko arkitektura erabiltzen dute. Argi bereizitako bi zatiz osatuta dago.

Hurrengo taulan bezero-ingurunearen eta zerbitzari-ingurunearen artean dauden desberdintasunen laburpena ikus daiteke:

+--------------+---------------------------------------------------------------------------+---------------------------------------------------------------------+
|              | Bezeroa                                                                   | Zerbitzaria                                                         |
+==============+===========================================================================+=====================================================================+
| Izan daiteke | ● Ordenagailua / mugikorra / tableta … `<br>`{=html} `\linebreak`{=latex} | ● Urruneko zerbitzaria                                              |
|              | ● Web nabigatzailea                                                       |                                                                     |
+--------------+---------------------------------------------------------------------------+---------------------------------------------------------------------+
| Funtzioa     | ● Informazioa eskatu.                 `<br>`{=html} `\linebreak`{=latex}  | ● Eskaerak jaso.                 `<br>`{=html} `\linebreak`{=latex} |
|              | ● Interfazea kudeatu.                 `<br>`{=html} `\linebreak`{=latex}  | ● Negozio-logika kudeatu.        `<br>`{=html} `\linebreak`{=latex} |
|              | ● Bezero-kodea exekutatu.             `<br>`{=html} `\linebreak`{=latex}  | ● Datu-baseetara sartu.         `<br>`{=html} `\linebreak`{=latex}  |
|              | ● Erabiltzailearen ekintzak jaso.     `<br>`{=html} `\linebreak`{=latex}  | ● Erantzunak bezeroari bidali.   `<br>`{=html} `\linebreak`{=latex} |
|              | ● "Erabiltzaile bakar batek erabiltzen du"                                | ● Milaka erabiltzaileri erantzun diezaieke.                         |
+--------------+---------------------------------------------------------------------------+---------------------------------------------------------------------+
| Teknologiak  | ● HTML                                `<br>`{=html} `\linebreak`{=latex}  | ● PHP                            `<br>`{=html} `\linebreak`{=latex} |
|              | ● CSS                                 `<br>`{=html} `\linebreak`{=latex}  | ● Python                         `<br>`{=html} `\linebreak`{=latex} |
|              | ● Javascript                          `<br>`{=html} `\linebreak`{=latex}  | ● Ruby on Rails                  `<br>`{=html} `\linebreak`{=latex} |
|              | ● WebAssembly (Wasm)                  `<br>`{=html} `\linebreak`{=latex}  | ● Java                           `<br>`{=html} `\linebreak`{=latex} |
|              |                                                                           | ● NodeJS                                                            |
+--------------+---------------------------------------------------------------------------+---------------------------------------------------------------------+

Table: Bezero- eta zerbitzari-ingurunearen arteko konparaketa sinplifikatua. {tablename=yukitblrcol colspec=X[1]X[2,l]X[2,l]}


Hurrengo irudian arkitekturaren sinplifikazio bat ikus daiteke:

![Bezero-zerbitzari arkitektura](img/dec/cliente-servidor.png){width=100%}

Irudian honako hauek bereiz ditzakegu:

- **Bezeroa**: gure ekipoak eta erabiltzen dugun Web nabigatzaileak osatzen dute.
- **Zerbitzaria**: web-aplikazio moderno batek honako osagai hauek izan ohi ditu:
  - **Web zerbitzaria**: [Apache HTTP Server](https://httpd.apache.org/) edo [Nginx](https://nginx.org/), bi adibide ezagun aipatzearren.
  - Zerbitzari-inguruneko programazio-lengoaia / *framework*
  - **Datu-basea**: datu-base erlazionalen artean ezagunenak hauek dira: [MySQL](https://www.mysql.com/), [MariaDB](https://mariadb.org/) edo [PostgreSQL](https://www.postgresql.org/).

## Bezero-aldeko teknologiak {#tecnologías-lado-cliente}

Aurretik ikusi dugun bezala, gaur egun bezero-ingurunean erabiltzen diren oinarrizko hiru teknologia daude:

- **HTML**: orri baten egitura definitzen du.
- **CSS**: itxura bisuala definitzen du.
- **JavaScript**: Web nabigatzailean modu natiboan exekutatzen den programazio-lengoaia da. Portaera gehitzen du, itxura bisuala modu interaktiboan aldatzea ahalbidetzen du, eskaerak zerbitzariari modu asinkronoan egin diezazkioke, ...

Aurrerago, teknologia horietan sakonduko dugu.

# Web nabigatzaileak {#navegador-web}

Web nabigatzailea erabiltzaileak Interneten nabigatzeko erabiltzen duen programa da. Erabiltzaileak adierazitako eskaerak eta ekintzak gauzatzen ditu, eta zerbitzaritik jasotako fitxategiak interpretatzen ditu.

## Zer egiten du nabigatzaile batek? {#qué-hace-navegador}

Zerbitzariari eskaera egin ondoren, nabigatzaileak honako prozesu hau jarraitzen du:

1. HTMLa deskargatzen du.
2. CSSa deskargatzen du.
3. JavaScript deskargatzen du.
4. DOMa eraikitzen du.
5. Estiloak aplikatzen ditu.
6. JavaScript exekutatzen du.
7. Emaitza erakusten du.

## Errendatze-motorrak {#motores-renderizado}

[StatCounter](https://gs.statcounter.com/browser-market-share/) webgunearen arabera, 2026an gehien erabiltzen diren nabigatzaileak hauek dira:

- [Google Chrome](https://www.google.com/chrome/)
- [Safari](https://www.apple.com/es/safari/)
- [Microsoft Edge](https://explore.microsoft.com/es-es/edge)
- [Mozilla Firefox](https://www.firefox.com/es-ES/)

Web nabigatzaileak oso programa konplexuak dira (**eta gero eta gehiago**), eta horregatik, Weba asmatu zenetik hainbat programa desberdin egon dira; are gehiago, [nabigatzaileen gerra](https://es.wikipedia.org/wiki/Guerra_de_navegadores) bat ere egon zen.

Antzina, Web nabigatzaile bakoitzak errendatze-motor desberdin bat erabiltzen zuen. [Errendatze-motorra](https://es.wikipedia.org/wiki/Motor_de_renderizado) HTML dokumentua hartu eta, CSS eta JavaScript-ekin batera, erabiltzaileak elkarreragiten duen azken itxura bisuala sortzeaz arduratzen da.

::: infobox
Errendatze-motorra HTML dokumentua hartu eta, CSS eta JavaScript-ekin batera, erabiltzaileak elkarreragiten duen azken itxura bisuala sortzeaz arduratzen da.
:::

Errendatze-motor bakoitzak estandarra **"bere erara"** betetzen zuen. Gainera, estandarrak ez zituen zenbait ezaugarri propio gehi zitzaketen. Horren ondorioz, web-orriak oso modu desberdinean ikus zitezkeen erabiltzen zen nabigatzailearen arabera, edo are gehiago, ez funtzionatzea ezaugarri horietako baten bat erabiltzen bazen.

Nabigatzaileek estandarrak betetzen zituzten egiaztatzeko, hainbat test agertu ziren; horien artean, [Acid2](https://en.wikipedia.org/wiki/Acid2) eta [Acid3](https://en.wikipedia.org/wiki/Acid3) nabarmentzen dira.

![Acid2-ren emaitzak nabigatzaile desberdinetan](img/dec/acid2.png){width=40%}

Gaur egun, errendatze-motor bat sortzea zein konplexua den kontuan hartuta, Web nabigatzaile asko badaude ere, ia ez dago errendatze-motorrik. Horrek esan nahi du, Google Chrome, Microsoft Edge edo Opera erabiltzen badituzu ere, hirurek errendatze-motor bera erabiltzen dutela.

- **[Gecko](https://en.wikipedia.org/wiki/Gecko_(software))**: Mozillak sortutako errendatze-motorra da, eta Firefoxek eta haren *fork* desberdinek erabiltzen dute.
- **[WebKit](https://en.wikipedia.org/wiki/WebKit)**: Applek 1998an sortu zuen motor hau, [KHTML](https://en.wikipedia.org/wiki/KHTML) kodearen *fork* bat eginez ([KDE](https://en.wikipedia.org/wiki/KDE) proiektuak sortutako Web nabigatzailea). Gaur egun batez ere Apple gailuetan erabiltzen bada ere, Sonyk haren garapenean lagundu zuen eta PS3an erabili zuen, baita Nintendoren kontsoletan ere.  
  Applek motor hau erabiltzera behartzen du iOS eta iPad gailuetako Web nabigatzaile guztietan. Horrek esan nahi du, nahiz eta Chrome aplikazioa erabili, iOSen errendatze-motorra WebKit dela.
- **[Blink](https://en.wikipedia.org/wiki/Blink_(browser_engine))**: 2013an, Googlek WebKit-en *fork* bat sortuko zuela iragarri zuen, berezko motorra sortzeko eta, horrela, motorra garatzerakoan Applerekiko independenteagoa izateko. Kode irekiko [Chromium](https://en.wikipedia.org/wiki/Chromium_(web_browser)) Web nabigatzaileak erabiltzen duen motorra da. Gaur egun gehien erabiltzen den motorra da, nabigatzaile askok erabiltzen baitute: Microsoft Edge, Opera, Vivaldi, Brave...

![Nabigatzaileei eta errendatze-motorrei buruzko memea. Jatorria: [programmerhumor](https://programmerhumor.io/webdev-memes/when-you-realize-every-new-ai-browser-is-just-chromium-in-disguise-gadg)](img/dec/web_meme.jpg){width=100% framed=true}

Wikipedian [Web nabigatzaileen konparaketa](https://en.wikipedia.org/wiki/Comparison_of_web_browsers) eta [errendatze-motorren konparaketa](https://en.wikipedia.org/wiki/Comparison_of_browser_engines) ikus daitezke.

# Garatzeko tresnak {#herramientas-desarrollo}

Ikasturtean zehar hainbat tresna erabiliko baditugu ere, ikasturtearen hasieran gutxi batzuk baino ez ditugu erabiliko. Hasteko, honako hauek erabiliko ditugu:

- **Editorea**: [Visual Studio Code](https://code.visualstudio.com/) (gomendatutako luzapenak: ESLint, Prettier, Live Server).
- **[Git](https://git-scm.com/)** bertsioak kontrolatzeko sistema gisa.
- **[GitHub](https://github.com/)** urruneko biltegi gisa.
- **Web nabigatzailea**: Firefox, Chrome, ...
  - **Garapen-tresnak**: Nabigatzaile guztiek garapena errazteko tresnak dituzte. Normalean [F12]{.verbatim} edo [Ctrl + Shift + I]{.verbatim} sakatuz irekitzen dira.


<!-- 

# Organización de un proyecto web {#organización-proyecto}

Un proyecto suele organizarse mediante carpetas.

Ejemplo:

```
proyecto/
│
├── index.html
├── css/
│     estilos.css
│
├── js/
│     app.js
│
├── img/
│
├── assets/
│
└── components/
```

Una buena organización facilita el mantenimiento del proyecto. -->
