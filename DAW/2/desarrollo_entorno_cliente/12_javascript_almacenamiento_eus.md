
# Nabigatzailean biltegiratzearen sarrera {#introducción-almacenamiento-navegador}

Orain arte garatutako aplikazio guztiek informazioa memorian soilik gorde dute. Horrek esan nahi du orria ixten edo nabigatzailea berriro kargatzen denean datu guztiak desagertu egiten direla. Hala ere, aplikazio askok informazio jakin bat saio batetik hurrengora mantendu behar dute. Adibide batzuk:

- Saioa hasita mantentzea.
- Erabiltzaileak aukeratutako hizkuntza gogoratzea.
- Modu argia edo iluna gordetzea.
- Erosketa-saskiaren edukia mantentzea.
- Azken irekitako dokumentua gogoratzea.

Arazo hori konpontzeko, nabigatzaile modernoek bezeroaren aldeko hainbat biltegiratze-mekanismo eskaintzen dituzte.

## Bezeroa ala zerbitzaria? {#cliente-o-servidor}

Garrantzitsua da nabigatzailean datuak gordetzearen eta zerbitzari batean gordetzearen arteko aldea bereiztea.

- **Bezeroaren biltegiratzea**: Datuak erabiltzailearen gailuan geratzen dira. Aukera hauek erabil ditzakegu:
  - localStorage
  - sessionStorage
  - Cookies
- **Zerbitzariaren biltegiratzea**: Datuak zerbitzariak kudeatutako datu-base batean edo beste sistema batean gordetzen dira.



+---------------+-------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------+
|               | Bezeroaren biltegiratzea                                                                        | Zerbitzariaren biltegiratzea                                                          |
+===============+=======================================================================+=========================+=======================================================================================+
| Abantailak    | ● Oso azkarra.                                               `<br>`{=html} `\linebreak`{=latex} | ● Informazioa edozein gailutatik dago eskuragarri. `<br>`{=html} `\linebreak`{=latex} |
|               | ● Ez du Interneteko konexiorik behar.                        `<br>`{=html} `\linebreak`{=latex} | ● Edukiera handiagoa.                              `<br>`{=html} `\linebreak`{=latex} |
|               | ● Zerbitzarirako eskaera kopurua murrizten du.                                                  | ● Segurtasunaren gaineko kontrol handiagoa.                                           |
+---------------+-------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------+
| Desabantailak | ● Datuak nabigatzailetik ezaba daitezke.                     `<br>`{=html} `\linebreak`{=latex} | ● Zerbitzariarekiko konexioa behar du.             `<br>`{=html} `\linebreak`{=latex} |
|               | ● Ez dira automatikoki partekatzen gailu desberdinen artean. `<br>`{=html} `\linebreak`{=latex} | ● Tokiko biltegiratzea baino motelagoa da.         `<br>`{=html} `\linebreak`{=latex} |
|               | ● Ez dira erabili behar isilpeko informaziorako.                                                | ● Fluxu konplexuagoa.                                                                 |
+---------------+-------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------+

Table: {tablename=yukitblrcol colspec=X[2,l]X[5,l]X[5,l]}


## Zein mekanismo aukeratu? {#qué-mecanismo-elegir}

Ez dago egoera guztietarako balio duen sistema bakar bat. Horregatik, gorde nahi ditugun datuak eta haietara noiz sartu nahi dugun aztertu behar dugu, sistema bakoitza informazio mota desberdin baterako pentsatuta baitago.

| Informazioa | Gomendatutako mekanismoa |
|--------------|----------------------|
| Erabiltzailearen hobespenak | localStorage |
| Aldi baterako datuak | sessionStorage |
| Saio-identifikatzailea | Cookie (normalean zerbitzariak sortua) |
| Gailuen artean partekatutako informazioa | Zerbitzariaren datu-basea |


# Web Storage API {#web-storage-api}

**[Web Storage API](https://developer.mozilla.org/en-US/docs/Web/API/Web_Storage_API)** nabigatzaile moderno guztiek eskaintzen duten interfaze bat da, **klabe-balio** bikoteen bidez informazioa gordetzeko aukera ematen duena. Bi objektuk osatzen dute:

- [localStorage]{.verbatim}
- [sessionStorage]{.verbatim}

Bien funtzionamendua oso antzekoa da, eta desberdintasun nagusia datuak gordeta zenbat denboran mantentzen diren da.


## klabe-balio sistemak {#clave-valor}

**klabe-balio** sistema baten funtzionamendua honako hauetan oinarritzen da:

- **klabea:** datua identifikatzeko erabiltzen dena da.
- **balioa:** lotutako informazioa dauka, hau da, interesatzen zaigun informazioa.

Gaur egun, sistema oso erabilia da, baita NoSQL datu-baseen sistemetan ere. Jarraian ikusiko ditugun sistemez gain, adibide batzuk baino ez ematearren:

- **[Redis](https://redis.io/)**: Memorian oinarritutako datu-base oso azkarra, cache gisa, saioak biltegiratzeko eta mezu-ilarak kudeatzeko erabiltzen dena.
- **[Valkey](https://valkey.io/)**: Redis-en *fork*-a, 2024an egindako lizentzia-aldaketarekiko desadostasunengatik sortua.
- **[Memcached](https://www.memcached.org/)**: Klabe-balioetan oinarritutako memoriako biltegiratze-sistema, batez ere web-aplikazioak bizkortzeko erabiltzen dena, aldi baterako datuak gordez.
- **[DragonFlyDB](https://github.com/dragonflydb/dragonfly)**: Aurrekoekin bateragarria den sistema.


## Gorde daitezkeen datuak {#tipos-datos-almacenar}

Bai [localStorage]{.verbatim}-k bai [sessionStorage]{.verbatim}-k **testu-kateak** soilik gordetzen dituzte. Zenbakiak, array-ak edo objektuak gorde nahi baditugu, aurretik JSON formatura bihurtu beharko ditugu.

Hurrengo taulan bien arteko desberdintasunen laburpena ikus dezakegu.


## "Jatorri bereko" sarbidea {#acceso-mismo-origen}

Gordetako datuak jatorri (*origin*) bereko orrietatik soilik eskura daitezke. Jatorria honako hauek osatzen dute:

- Protokoloa ([http]{.verbatim} edo [https]{.verbatim})
- Domeinua
- Ataka

Adibidez, "https://www.ejemplo.com" helbidetik gordetako datu batek ezin izango ditu "https://midominio.com" helbidean gordetako datuak atzitu. Portaera hori nabigatzailearen segurtasun-politikaren parte da.


# [localStorage]{.verbatim} erabili {#uso-localstorage}

[[localStorage]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/API/Window/localStorage) funtzioak informazioa nabigatzailean modu iraunkorrean gordetzeko aukera ematen du. Datuak eskuragarri egongo dira nabigatzailea itxi edo ordenagailua itzali ondoren ere. Honako kasu hauetan soilik desagertuko dira:

- Erabiltzaileak eskuz ezabatzen dituenean.
- Programak ezabatzen dituenean.
- Nabigatzailearen datuak garbitzen direnean.

## Informazioa gorde {#localstorage-guardar}

Datu bat gordetzeko, [.setItem]{.verbatim} funtzioa erabili behar dugu. Bi parametro jasotzen ditu: klabe eta balioa. Balioa **beti testu gisa gordeko da**, zenbakia bada ere.

::: mycode
[Informazioa localStorage erabiliz gordetzea]{.title}
```javascript
localStorage.setItem("nombre", "Alice");
localStorage.setItem("edad", 20); // "20"
```
:::

Objektu bat gorde nahi badugu, JSON formatuan gorde beharko dugu [JSON.stringify()]{.verbatim} erabiliz; bestela, datuak ez dira behar bezala gordeko:

::: mycode
[Informazioa localStorage erabiliz gorde]{.title}
```javascript
const alumno = {
    nombre: "Bob",
    edad: 20
};
// Esto guardará "[object Object]"
localStorage.setItem("alumno", alumno);
// forma correcta
localStorage.setItem("alumno", JSON.stringify(alumno));
```
:::

::: errorbox
Objektu bat gorde nahi badugu, JSON formatuan gorde behar dugu [JSON.stringify()]{.verbatim} erabiliz.
:::


Funtzioa klabe berarekin berriro erabiltzen badugu, lehendik dagoen datua gainidatziko du.

::: errorbox
Klabe bera erabiltzen badugu, lehendik dagoen datua gainidatziko du.
:::

Orain, nabigatzailearen garatzaile-tresnen barruan "Application" edo "Biltegiratzea" fitxara joaten bagara, tokiko biltegiratze-atal bat dugula ikusiko dugu, balio honekin:

![localStorage Chrome eta Firefoxen](img/dec/local-storage.png){width="100%" framed=true}

## Informazioa irakurri {#localstorage-leer}

Informazioa irakurtzeko, **klabea ezagutu behar da**:

::: mycode
[localStorage-ko informazioa irakurri]{.title}
```javascript
localStorage.getItem("nombre");

// para un objeto
const texto = localStorage.getItem("alumno");
const alumno = JSON.parse(texto);
console.log(alumno.nombre);
```
:::

Objektu bat irakurri eta lortu nahi badugu, **aurretik gordetako JSON testua parseatu behar dugu**. Horretarako, [JSON.parse()]{.verbatim} funtzioa erabiltzen da, eta objektu bat itzuliko digu. Ondoren, objektua erabili ahal izango dugu.

::: warnbox
Objektu bat lortzeko, irakurritako testuarekin [JSON.parse()]{.verbatim} erabili behar dugu.
:::


## Informazioa ezabatu {#localstorage-eliminar}

Berriro ere, datu bat ezabatzeko klabea ezagutu behar dugu.

::: mycode
[localStorage-ko informazioa ezabatu]{.title}
```javascript
localStorage.removeItem("nombre");
```
:::

Informazio guztia ezabatu nahi badugu, [clear()]{.verbatim} funtzioa dugu. Jatorri horretako informazioa soilik ezabatuko du, baina kontuz erabili behar da.

::: mycode
[localStorage-ko informazio guztia ezabatu]{.title}
```javascript
localStorage.clear();
```
:::

::: warnbox
[clear()]{.verbatim}-ek jatorri horretako informazioa soilik ezabatzen du, baina kontuz erabili behar da.
:::

## Elementu kopurua lortzea {#localstorage-length}

Gauden jatorrian zenbat elementu gordeta ditugun lor dezakegu:

::: mycode
[localStorage-ko elementu kopurua lortu]{.title}
```javascript
localStorage.length;
```
:::

## klabeak lortu {#localstorage-claves}

Elementu kopurua jakinda, gordeta ditugun klabeak zeharkatu ditzakegu, edo haien izena balioarekin batera lor dezakegu.

::: mycode
[localStorage-ko klabeak lortu]{.title}
```javascript
console.log(localStorage.key(0));

for (let i = 0; i < localStorage.length; i++) {
    const clave = localStorage.key(i);
    const valor = localStorage.getItem(clave);
    console.log(clave, valor);

}
```
:::


::: exercisebox
[[20a](https://github.com/yuki/ejercicios/blob/main/daw/dec/20a.html)]{.solution}

Erabili aurretik ikusitako [localStorage]{.verbatim}-eko funtzioak datuak eta objektuak gordetzeko eta lortzeko.
:::


# [sessionStorage]{.verbatim} erabiltzea {#uso-sessionStorage}

[sessionStorage]{.verbatim}-ek [localStorage]{.verbatim}-ek bezala funtzionatzen du ia, baina desberdintasun nagusia da informazioa nabigatzailearen uneko saioan soilik egongo dela eskuragarri. Fitxa edo leihoa ixten denean, datu guztiak automatikoki desagertzen dira.

::: warnbox
[sessionStorage]{.verbatim} erabiltzean, datuak fitxa edo leihoa ixtean desagertzen dira.
:::


[sessionStorage]{.verbatim} honako hauetarako erabil dezakegu:

- Hainbat urratseko laguntzaile baten datuak.
- Erosketa batean aldi baterako informazioa.
- Bilaketa baten emaitzak.
- Aldi baterako iragazkiak.
- Inprimaki baten tarteko datuak.
- Saioan zehar soilik mantendu behar diren hobespenak.


## Informazioa gordetzea {#sessionStorage-guardar}

Aurretik ikusitakoaren berdin funtzionatzen du.


::: mycode
[Datuak sessionStorage erabiliz gorde]{.title}
```html
sessionStorage.setItem("pagina","inicio");
```
:::


## Informazioa irakurtzea {#sessionStorage-leer}

Informazioa irakurtzeko, **klabea ezagutu behar da**:

::: mycode
[Informazioa sessionStorage erabiliz irakurri]{.title}
```javascript
sessionStorage.getItem("nombre");
```
:::


## Informazioa ezabatzea {#sessionStorage-eliminar}

Berriro ere, datu bat ezabatzeko klabea ezagutu behar dugu.

::: mycode
[Informazioa sessionStorage erabiliz ezabatu]{.title}

```javascript
sessionStorage.removeItem("nombre");
// borrar todos
sessionStorage.clear();
```
:::



# Cookie-ak {#cookies}

**Cookieak** webgune batek erabiltzailearen nabigatzailean gorde ditzakeen informazio-zati txikiak dira. [localStorage]{.verbatim} eta [sessionStorage]{.verbatim}-en ez bezala, **cookieak automatikoki bidaltzen zaizkio zerbitzariari HTTP eskaera bakoitzean, domeinu berera egindako eskaeretan**. *Cookie* batek ere **klabe-balio** bikoteen bidez gordetzen du informazioa.

::: infobox
Cookieak automatikoki bidaltzen zaizkio zerbitzariari domeinu berera egindako HTTP eskaera bakoitzean.
:::

Cookieen erabilera nagusiak hauek dira:

- Saioa hasita mantentzea.
- Erabiltzaile-identifikatzaile bat gogoratzea.
- Hobespen sinpleak gordetzea.
- Zerbitzariak ere behar duen informazioa gordetzea.


Cookieak Webaren lehen urteetatik erabiltzen dira, eta gaur egun ere oinarrizko mekanismoa izaten jarraitzen dute. Cookie bakoitzak informazio gehigarria izan ohi du, hala nola:

- Iraungitze-data.
- Domeinua.
- Bidea.
- Segurtasun-aukerak.

Zerbitzari batek cookie bat nabigatzailera bidaltzen duenean, han gordeta geratzen da. Webgune berera egindako hurrengo HTTP eskaeretan, nabigatzaileak automatikoki bidaliko du cookie hori.

[localStorage]{.verbatim} eta [sessionStorage]{.verbatim} modernoagoak eta erabiltzeko errazagoak diren arren, cookieek ezinbestekoak izaten jarraitzen dute, hiru mekanismo horietatik nabigatzaileak HTTP eskaera bakoitzean automatikoki zerbitzariari bidaltzen dion bakarra direlako. Horri esker, zerbitzariak erabiltzailea ezagutu dezake, JavaScript kodeak informazio hori eskuz gehitu beharrik gabe.


## Cookie bat sortu {#crear-cookie}

Cookieak JavaScriptetik sor daitezke [[document.cookie]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/API/Document/cookie) propietatearen bidez. Cookie bat aldatzeko, nahikoa da berriro sortzea, klabe bera erabiliz.


::: mycode
[Cookie sortu]{.title}
```javascript
document.cookie = "usuario=Alice";
document.cookie = "tema=oscuro";
document.cookie = "idioma=es";
```
:::

Exekutatu ondoren, nabigatzaileak cookiea gordeko du, eta garatzaile-tresnen bidez ikus ditzakegu:

![Cookieen ikuspegia](img/dec/cookie.png){width="100%" framed=true}


## Cookieak irakurri {#leer-cookie}

Cookie bat irakurtzeko, [document.cookie]{.verbatim} erabil dezakegu. Cookie bat baino gehiago badugu, puntu eta koma ";" batekin kateatuko dira.

::: mycode
[Cookie irakurri]{.title}
```javascript
console.log(document.cookie);
// tema=oscuro; idioma=es; usuario=Alice
```
:::

## Cookie bat ezabatu {#eliminar-cookie}

Ez dago cookie bat ezabatzeko metodo espezifikorik. Ohikoena da berriro sortzea, iraungitze-data (*expiration data*) iraganekoa dela adieraziz; horrela, nabigatzaileak ezabatu egingo du.


::: mycode
[Cookiea ezabatzeko iraungitze-data aldatu]{.title}
```javascript
document.cookie = "tema=; expires=Thu, 01 Jan 1970 00:00:00 UTC";
```
:::

## Iraungitze-data {#fecha-expiración}

Iraungitze-datarik adierazten ez badugu, cookiea **saio-cookie** bat izango da, eta, beraz, nabigatzailea ixtean desagertuko da. Denbora jakin batean mantentzea nahi badugu, denbora honako modu hauetako batean adierazi behar dugu:

- **[max-age]{.verbatim}**: cookiearen gehienezko iraupena, segundotan.
- **[expires]{.verbatim}**: cookiea noiz iraungiko den, [UTC](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date/toUTCString) formatuan.


::: mycode
[Iraungitze-data gehitu]{.title}
```javascript
document.cookie = "usuario=Alice; max-age=86400";
document.cookie = "tema=oscuro; expires=Tue, 31 Dec 2030 23:59:59 GMT";
```
:::

## Atributu garrantzitsuak {#atributos-cookies}

Cookieek hainbat atributu onartzen dituzte, eta [dokumentazioan](ps://developer.mozilla.org/en-US/docs/Web/API/Document/cookie) ikus ditzakegu. Gehien erabiltzen direnak hauek dira:

| Atributua | Funtzioa |
|----------|---------|
| `expires` | Iraungitze-data. |
| `max-age` | Bizitza-denbora, segundotan. |
| `path` | Cookiea erabilgarri egongo den bidea. |
| `domain` | Baimendutako domeinua. |
| `Secure` | HTTPS bidez soilik bidaliko da. |
| `SameSite` | Cookiea noiz bidaliko den mugatzen du, segurtasuna hobetzeko. |


## Cookieen mugak {#limitaciones-cookies}

Cookieek muga garrantzitsu batzuk dituzte.

- Haien tamaina txikia da (gutxi gorabehera 4 KB cookie bakoitzeko).
- HTTP eskaera guztietan automatikoki bidaltzen dira.
- Gehiegi erabiltzeak sareko trafikoa pixka bat handitu dezake.

Horregatik, ez dira egokiak informazio kopuru handiak gordetzeko.


# localStorage, sessionStorage eta cookieen arteko konparaketa {#comparativa}

Ikusi dugun bezala, nabigatzaile modernoek informazioa gordetzeko hainbat mekanismo eskaintzen dituzte, eta bakoitzak abantailak eta desabantailak ditu. Haien arteko desberdintasunak ezagutzeak egoera bakoitzerako irtenbiderik egokiena aukeratzeko aukera ematen du.

Hurrengo taulak laburpen gisa balio dezake:

|                | localStorage | sessionStorage | Cookies |
|----------------|--------------|----------------|----------|
| Iraunkortasuna | Iraunkorra | Saioan zehar soilik | Konfiguragarria |
| Gutxi gorabeherako tamaina | 5-10 MB | 5-10 MB | 4 KB |
| Zerbitzariari automatikoki bidaltzen zaio | Ez | Ez | Bai |
| JavaScriptetik eskuragarria | Bai | Bai | Bai ([HttpOnly]{.verbatim}) cookieak izan ezik |
| Fitxen artean partekatua | Bai | Ez | Bai |

Table: {tablename=yukitblrcol colspec=XXXX}



# Segurtasuna {#seguridad}

Mekanismo hauetako bat ere ez da erabili behar isilpeko informazioa gordetzeko. Beraz, **inoiz** ez litzateke erabili behar honelako datuak gordetzeko:

- Pasahitzak.
- Banku-txartelen zenbakiak.
- Informazio pertsonal sentikorra.
- klabe pribatuak.

Horregatik, aplikazio profesionalek informazio benetan garrantzitsua zerbitzarian gordetzen dute eta babes-mekanismo gehigarriak erabiltzen dituzte.

Aurretik aipatu dugu nabigatzaileek **Same-Origin Policy (SOP)** aplikatzen dutela; segurtasun-politika horrek web-orri batek beste domeinu bateko beste web-orri batek gordetako datuetara zuzenean sartzea eragozten du. Hala ere, babes horrek ez ditu datuak erabat eskuraezin bihurtzen. Erabiltzailearen ordenagailua programa maltzur batekin kutsatzen bada, nabigatzailearen luzapen batek gehiegizko baimenak lortzen baditu edo erasotzaile batek webgunearen barruan bertan kodea exekutatzea lortzen badu (adibidez, [XSS](https://es.wikipedia.org/wiki/Cross-site_scripting) eraso baten bidez), domeinu horrek gordetako informaziora sar daiteke.

Azken urteotan gai horri buruzko albisteak, *[session hijacking](https://es.wikipedia.org/wiki/Secuestro_de_sesi%C3%B3n)* erabiliz:

- [YouTube-ko sortzaileen cookieak lapurtzeko malware-kanpaina](https://blog.google/threat-analysis-group/phishing-campaign-targets-youtube-creators-cookie-theft-malware/).
- [Linus Tech Tips kanala bahitu zuten saio-tokenak erabiliz](https://www.theverge.com/2023/3/24/23654996/linus-tech-tips-channel-hack-session-token-elon-musk-crypto-scam)
- [Ibai Llanosen bideoak ezabatu zituzten](https://cadenaser.com/nacional/2023/06/11/hackean-el-canal-de-ibais-llanos-en-youtube-borran-todos-sus-videos-y-dejan-reproduciendose-en-bucle-un-curioso-video-cadena-ser/)

