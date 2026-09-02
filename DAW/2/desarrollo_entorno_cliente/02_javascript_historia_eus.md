
# JavaScript-en historia {#historia-javascript}

Gaur egun, [JavaScript](https://en.wikipedia.org/wiki/JavaScript) web-aplikazioak garatzeko gehien erabiltzen den programazio-lengoaia da. Interneteko ia orri guztietan dago presente, eta Web nabigatzaileetan ez ezik, zerbitzarietan eta beste ingurune batzuetan ere exekuta daiteke.

1995ean [Netscape](https://en.wikipedia.org/wiki/Netscape) enpresak sortu zuen JavaScript, baina ez zen aplikazio konplexuak garatzeko helburuarekin sortu. Hasierako helburua askoz apalagoa zen: HTML orri estatikoetan funtzionalitate txikiak gehitzea.

Denborarekin, lengoaia eboluzionatuz joan da, eta gaur egun web-aplikazioak, mahaigaineko aplikazioak, mugikorretarako aplikazioak eta baita zerbitzarietarako programak ere garatzeko plataforma osoa bihurtu da.

**JavaScript** izena arrazoi komertzialengatik aukeratu zen batez ere, garai hartan Javak hartzen ari zen ospe izugarria aprobetxatuz. Izena gorabehera, **JavaScript eta Java guztiz desberdinak diren lengoaiak dira**. Azaleko sintaxi antzekoa partekatzen dute, baina helburu, ezaugarri eta exekuzio-modu desberdinak dituzte.

90eko hamarkadaren bigarren erdian, **[nabigatzaileen gerra](https://es.wikipedia.org/wiki/Guerra_de_navegadores)** izenez ezagutzen dena hasi zen. Fabrikatzaile bakoitzak JavaScript-en ezaugarri berriak gehitzen zituen, estandar komun bati jarraitu gabe. Horren ondorioz:

- Programa bera nabigatzaile batean funtziona zitekeen eta beste batean huts egin.
- Garatzaileek nabigatzaile bakoitzerako berariazko kodea idatzi behar zuten.
- Aplikazioen mantentzea konplexua zen.

::: infobox
Egoera horrek agerian utzi zuen estandar bat sortzeko beharra.
:::

## Lengoaiaren estandarizazioa {#estandarizazio-javascript}

1997an, **ECMA International** erakundeak lengoaiaren lehen zehaztapen ofiziala argitaratu zuen, eta **[ECMAScript](https://en.wikipedia.org/wiki/ECMAScript)** izena eman zion. Une horretatik aurrera, nabigatzaileak estandar bera inplementatzen hasi ziren, eta pixkanaka haien arteko desberdintasunak murriztuz joan ziren. Gaur egun, nabigatzaile moderno guztiek ECMAScript-ek argitaratutako zehaztapenak inplementatzen dituzte.

## JavaScript nabigatzailetik kanpo {#javascript-fuera-navegador}

JavaScript nabigatzaileetarako lengoaia gisa sortu bazen ere, gaur egun beste ingurune askotan exekuta daiteke. Hona hemen adibide batzuk:

- Web zerbitzarietan, [Node.js](https://nodejs.org/es) exekuzio-ingurune gisa erabiliz.
- Mahaigaineko aplikazioak.
- Mugikorretarako aplikazioak.
- Automatizazio-tresnak.
- Administrazio-scriptak.
- IoT gailuak.

Horrek JavaScript gaur egun dagoen lengoaiarik moldakorrenetako bat bihurtu du.

# ECMAScript {#introducción-ecmascript}

JavaScript-i buruz hitz egiten dugunean, ohikoa da **JavaScript** eta **ECMAScript** terminoak bereizi gabe erabiltzea. Hala ere, ez dute zehazki gauza bera esan nahi.

- **ECMAScript** lengoaia nola funtzionatu behar duen definitzen duen **zehaztapena edo estandarra** da. Zehaztapena hemen irakur daiteke: [ECMAScript® 2026 Language Specification](https://262.ecma-international.org/).
- **JavaScript** estandar horren inplementazioa da, exekuzio-motor desberdinek egina.

Web nabigatzaile bat erabiltzen dugunean, inplementatuta duen exekuzio-motorra (*[JavaScript Engine](https://en.wikipedia.org/wiki/List_of_JavaScript_engines)*) erabiliko dugu:

- [SpiderMonkey](https://en.wikipedia.org/wiki/SpiderMonkey): Mozillaren fundazioak sortua eta Firefoxek eta haren deribatuek erabiltzen dutena; [MongoDB](https://en.wikipedia.org/wiki/MongoDB) eta [GNOME](https://en.wikipedia.org/wiki/GNOME) mahaigaineko ingurunean ere erabiltzen da.
- [V8](https://en.wikipedia.org/wiki/V8_(JavaScript_engine)): Googlek 2008an sortua, Chrome-n erabiltzeko. Zerbitzari-ingurunean ere erabiltzen da, batez ere [Node.js](https://nodejs.org/) eta [Electron](https://en.wikipedia.org/wiki/Electron_(software_framework)] oinarri duten aplikazioetan.
- [JavaScriptCore](https://en.wikipedia.org/wiki/WebKit#JavaScriptCore): Safari-k erabiltzen duena.

ECMAren barruan **TC39** izeneko batzorde bat dago, lengoaiaren ezaugarri berriak aztertzeaz, diseinatzeaz eta onartzeaz arduratzen dena. Haren eginkizun nagusien artean hauek daude:

- Funtzionalitate berriak proposatzea.
- Haien bideragarritasuna aztertzea.
- Hobekuntza posibleak eztabaidatzea.
- Estandarraren aldaketak onartzea.

Helburua JavaScript modu ordenatuan eta aurreko bertsioekin bateragarria izanik eboluzionatzea bermatzea da.

## Eboluzioa {#evolución-ecmascript}

2009an **ECMAScript 5 (ES5)** izeneko lengoaiaren bertsio berri bat agertu zen. Bertsio horrek nabigatzaileen arteko egonkortasuna eta bateragarritasuna nabarmen hobetu zituen. Hala ere, aldaketarik garrantzitsuena 2015ean iritsi zen, **ECMAScript 2015 (ES6)** argitaratu zenean, horrek lengoaia eraldatu baitzuen.

2015etik aurrera, urtero argitaratzen dira estandarraren bertsio berriak, hobekuntza txikiak eta funtzionalitate berriak gehituz. Wikipedian [bertsioen historia](https://en.wikipedia.org/wiki/ECMAScript_version_history) ikus daiteke.


## Denbora-lerroa

| Urtea | Gertaera |
|:----:|:---------|
| 1991 | World Wide Web-a sortu zen. |
| 1995 | Brendan Eich-ek JavaScript sortu zuen Netscape Navigator-erako. |
| 1997 | ECMAScript-en lehen zehaztapena argitaratu zen. |
| 1999 | ECMAScript 3 hainbat urtez estandar nagusi bihurtu zen. |
| 2005 | AJAX ezagun egin zen eta web-aplikazio dinamikoagoak agertzen hasi ziren. |
| 2006 | jQuery-k JavaScript-en garapena sinplifikatu zuen. |
| 2009 | ECMAScript 5 argitaratu zen. Objektuetan hobekuntzak, modu "zorrotza", JSONen hobekuntzak, ... |
| 2015 | ECMAScript 2015 (ES6) bertsioak lengoaiaren modernizazio sakona ekarri zuen. [let]{.verbatim} eta [const]{.verbatim} aldagaiak, klaseak, moduluak, promesak, lehenetsitako parametroak... |
| 2016-Gaur egun | ECMAScript-en bertsio berriak urtero argitaratzen dira. |

Table: {tablename=yukitblr colspec=X[-1]X[l]}

## Nabigatzaileen arteko bateragarritasuna {#compatibilidad}

Lengoaiaren bilakaera dela eta, exekuzio-motorrek eta nabigatzaileek ez dute zertan beti azken bertsioa erabili, edo baliteke funtzionalitate berriei lehentasun desberdinak ematea. Nabigatzaileen bateragarritasunak kontsultatzeko, honako webgune hauek erabil ditzakegu:

![ [fetch](https://developer.mozilla.org/es/docs/Web/API/Window/fetch) funtzioaren bateragarritasuna MDNn](img/dec/compatibilidad.png){width=90%}

- [Mozilla Developer Network](https://developer.mozilla.org/es/): Garatzaileek gehien erabiltzen duten dokumentazio ofiziala.
- [ECMAScript Compatibility Table](https://compat-table.github.io/compat-table/es2016plus/): JavaScript lengoaiaren ezaugarrien bateragarritasuna kontsultatzeko.
- [Can I use](https://caniuse.com): HTML, CSS, nabigatzailearen APIak, ... kontsultatzeko.

# JavaScript-en ezaugarriak {#características-javascript}

JavaScript **interpretatutako lengoaia** da. Horrek esan nahi du iturburu-kodea ez dela aurrez konpilatu behar exekutatu ahal izateko. Nabigatzaileak web-orri bat kargatzen duenean, JavaScript kodea interpretatu eta exekutatzen du.

Gaur egun, JavaScript-en motor modernoek askoz teknika aurreratuagoak erabiltzen dituzte, hala nola **Just-In-Time (JIT) konpilazioa**. Teknika horren bidez, kodearen zati bat makina-lengoaiara itzultzen da programa exekutatzen ari den bitartean, errendimendua hobetzeko.

JavaScript-en abantaila handienetako bat da sistema eragile desberdinetan kodea aldatu gabe exekuta daitekeela, betiere sistema eragilean JavaScript motor bat badago.

JavaScript **tipatze dinamikoko lengoaia** da. Horrek esan nahi du aldagai batek datu-mota desberdinak gorde ditzakeela programaren exekuzioan zehar. Gainera, **tipatze ahulekoa** da, lengoaiak berak datu-mota desberdinen arteko bihurketa automatikoak egiten baititu beharrezkotzat jotzen duenean. Bihurketa automatiko horiek eragiketa batzuk errazten dituzte, baina emaitza ustekabeak ere sor ditzakete kontuz ibiltzen ez bada.

::: warnbox
Beharrezkoa denean bihurketa esplizituak egitea gomendatzen da.
:::

Programak **objektuetara bideratutako programazioa** erabiliz garatzea ahalbidetzen du, nahiz eta beste lengoaia batzuetatik, hala nola Java edo C#, desberdin inplementatzen den.

Ezaugarri interesgarri bat da funtzioak beste edozein balio bezala tratatzen direla. Horri esker:

- Aldagaietan gorde daitezke.
- Parametro gisa bidal daitezke.
- Beste funtzio batzuetatik itzul daitezke.
- Objektuen parte izan daitezke.

Ezaugarri hori funtsezkoa da gertaerak, tenporizadoreak edo programazio asinkronoa bezalako kontzeptuak ulertzeko.

Interpretatutako beste lengoaia batzuek bezala, **memoriaren birziklapen automatikoa** (*Garbage Collector*) egiteko sistema bat dauka. Programatzaileak ez du eskuz askatu behar jada beharrezkoak ez diren objektuek erabiltzen duten memoria. JavaScript motorrak automatikoki detektatzen du zer baliabide ez diren erabiltzen ari eta askatu egiten ditu. Horrek nabarmen murrizten du memoria-kudeaketarekin lotutako akatsak sortzeko aukera.

JavaScript modernoaren ezaugarri garrantzitsuenetako bat modu asinkronoan lan egiteko gaitasuna da. Horri esker, zeregin jakin batzuk exekuta daitezke programaren gainerakoa blokeatu gabe. Adibidez:

- Internetetik datuak deskargatzea.
- Zerbitzari baten erantzunaren zain egotea.
- Fitxategiak irakurtzea.
- Tenporizadoreak exekutatzea.

Horri esker, web-aplikazioek erabiltzailearen ekintzei erantzuten jarrai dezakete beste eragiketa batzuk amaitu bitartean.




## Segurtasuna eta mugak {#seguridad-limitaciones}

JavaScript erabiltzailearen nabigatzailean exekutatzeko diseinatu zen; beraz, erabiltzailearen ordenagailuan edo gailuan exekutatzen da, eta ez zerbitzarian. Ezaugarri horrek zenbait abantaila eskaintzen ditu, hala nola interaktibitate handiagoa eta aplikazioen erantzun azkarragoa. Hala ere, segurtasunarekin lotutako erronka garrantzitsuak ere sortzen ditu.

Nabigatzaile modernoek neurriak ezartzen dituzte web-orri batek erabiltzailearen ordenagailura askatasunez sartzea edo irekita dauden beste orri batzuekin interferitzea eragozteko.

## Ingurune isolatua (*Sandbox*) {#entorno-aislado}

Segurtasun-neurri nagusietako bat JavaScript kodea **ingurune isolatu** baten barruan exekutatzea da, *sandbox* (hareatokia) izenez ezagutzen dena. *Sandbox*-ak JavaScript programa batek egin ditzakeen ekintzak mugatzen ditu, sistema eragilera zuzenean sartzea eragotziz. Mekanismo horri esker, web-orri batek ezin du, adibidez:

- Disko gogorreko edozein fitxategi irakurri.
- Sistemako fitxategiak aldatu.
- Programak instalatu.
- Sistema eragilearen aplikazioak exekutatu.
- Beste aplikazio batzuen informaziora askatasunez sartu.
- Hardwarea zuzenean atzitu. Baliabideetara (kamera, mikrofonoa, kokapena, ...) sartu aurretik, erabiltzaileari baimena eskatuko dio.

Murrizketa horiek erabiltzailea web-orri maltzur posibleetatik babesten dute.

## Jatorri bereko politika (*Same-Origin Policy*) {#sop}

Segurtasun-neurri oso garrantzitsu bat **[Jatorri bereko politika (*Same-Origin Policy*)](https://en.wikipedia.org/wiki/Same-origin_policy)** da. Politika horrek web-orri batek beste gune bateko beste web-orri baten informazioa askatasunez atzitzea eragozten du. Erabiltzaileak aldi berean bi web-orri desberdin irekita baditu, horietako bateko kodeak ezin izango du bestearen edukira sartu.

## HTTP eskaeren murrizketak {#cors}

Web-aplikazioak zerbitzariekin komunikatzen dira normalean HTTP eskaeren bidez. Hala ere, nabigatzaileek komunikazio horiei ere murrizketak ezartzen dizkiete. Aplikazio bat orria zerbitzatu duenaz bestelako zerbitzari batera sartzen saiatzen denean, urruneko zerbitzariak berariaz baimendu behar du komunikazio hori, **[CORS (Cross-Origin Resource Sharing)](https://en.wikipedia.org/wiki/Cross-origin_resource_sharing)** izeneko teknika baten bidez.

Zerbitzaria sarbidea baimentzeko konfiguratuta ez badago, nabigatzaileak eskaera blokeatuko du. Neurri horrek web-orri maltzurrek web-zerbitzuetara baimenik gabe sartzea eragozten du.

## JavaScript kodea ikusgai dago {#codigo-visible}

Zerbitzarian erabiltzen diren beste lengoaia batzuek ez bezala, JavaScript kodea erabiltzailearen nabigatzailera iristen da. Edonork ikus dezake nabigatzailearen garapen-tresnak erabiliz, eta, beraz, baita aldatu ere. Horregatik:

- Ez dira pasahitzak sartu behar.
- Ez dira gako pribatuak gorde behar.
- Ez dira isilpeko datuak txertatu behar.
- Ez dira segurtasun-mekanismoak JavaScript kodean soilik oinarrituta inplementatu behar.

Nabigatzailera bidalitako kode guztia publikotzat hartu behar da, nahiz eta kodea lausotzeko (*obfuscation*) tresnak egon.

### Balidazioa zerbitzarian ere egin behar da {#validaciones-servidor}

Aplikazio batek JavaScript erabil dezake formulario bat behar bezala bete den egiaztatzeko: posta elektronikoa balidatzea, eremu bat beteta dagoela ziurtatzea, ...

Aurreko puntua kontuan hartuta, egiaztapen horiek **ez dira nahikoak**, erabiltzaileak JavaScript desgaitu, kodea bera aldatu edo zerbitzariari egindako eskaerak aldatu baititzake. Horregatik, **balidazio garrantzitsu guztiak beti errepikatu behar dira zerbitzarian**.

::: errorbox
Balidazio garrantzitsu guztiak beti errepikatu behar dira zerbitzarian.
:::

JavaScript-en egindako balidazioak erabiltzailearen esperientzia hobetzen du, baina ez du inoiz zerbitzari-aldeko balidazioa ordezkatu behar.

::: warnbox
JavaScript-en egindako balidazioak erabiltzailearen esperientzia hobetzen du, baina ez du inoiz zerbitzari-aldeko balidazioa ordezkatu behar.
:::
