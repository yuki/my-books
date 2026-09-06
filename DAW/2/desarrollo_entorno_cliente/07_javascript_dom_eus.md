
# DOM-a (*Document Object Model*) {#el-dom}

Nabigatzaile batek web-orri bat kargatzen duenean, ez du zuzenean HTML kodearekin lan egiten. Horren ordez, dokumentua aztertu eta ***Document Object Model*** edo, besterik gabe, **[DOM](https://developer.mozilla.org/en-US/docs/Web/API/Document_Object_Model)** izeneko barne-errepresentazio bat eraikitzen du.

DOMak HTML elementu guztiak (baita XML eta SVG elementuak ere) JavaScript objektu bihurtzen ditu (beren atributuak dituztenak), eta nodoen zuhaitz baten edo ***DOM tree*** baten bidez irudikatzen ditu. DOMa, berez, [web API](https://developer.mozilla.org/en-US/docs/Web/API) bat eta [estandarra](https://dom.spec.whatwg.org/) da, eta DOMaren bidez JavaScript-ek honako hauek egin ditzake:

- Orrialde baten edukia irakurri.
- Edukia aldatu.
- Estiloak aldatu.
- Elementuak sortu/ezabatu.
- Erabiltzailearen ekintzei erantzun.

Ikus dezagun ondorengo HTMLa eta zer DOM zuhaitz sortzen den.

:::::::::::::: {.columns }
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```html
<!DOCTYPE html>
<html>
    <head>
        <title>Ejemplo</title>
    </head>
    
    <body>
        <h1>Mi página</h1>
        <p>Bienvenido.</p>
    </body>
</html>
```
:::

:::
::: {.column width="50%" }

![DOM hierarkia](img/dec/dom.svg){width="100%"}

:::
::::::::::::::

DOMaren ezaugarri garrantzitsuenetako bat edozein unetan alda daitekeela da. Orrialde batek testu bat automatikoki alda dezake, elementu berriak erakutsi edo edukia ezabatu, orria berriro kargatu beharrik gabe. **Portaera hori web aplikazio modernoen oinarria da**.

Web-orri batean teknologia bakoitzak funtzio desberdina betetzen du.

| Teknologia | Funtzioa |
|------------|---------|
| HTML | Dokumentuaren egitura definitzen du. |
| CSS | Aurkezpena eta itxura bisuala definitzen ditu. |
| JavaScript | Portaera eta interakzioa gehitzen ditu. |

DOMak JavaScript-ek HTML edukia aldatzeko eta CSS bidez aldaketa bisualak aplikatzeko aukera ematen duen zubia osatzen du. Edozein nabigatzaileren garatzaile-tresnek DOMa ikuskatzeko aukera ematen dute: **F12** sakatu eta **Elements** fitxa (edo **Inspector**, nabigatzailearen arabera) hautatuz gero, HTML dokumentutik abiatuta sortutako zuhaitz osoa ikus daiteke.

::: infobox
Nabigatzailearen "garatzaile-tresnak" erabiliz DOM zuhaitza ikus dezakegu.
:::

## DOM zuhaitzaren egitura {#estructura-árbol-dom}

DOMak elementu guztiak familia-harremanen bidez antolatzen ditu.

Nodo bakoitzak honako hauek izan ditzake:

- Guraso bat (***parent***): aurreko adibidean [<h1>]{.verbatim}-en gurasoa [<body>]{.verbatim} da.
- Seme bat edo gehiago (***children***): [<body>]{.verbatim}-ek bi seme ditu.
- Anai-arrebak (***siblings***): [<h1>]{.verbatim}-ek hierarkia-maila bereko anaia bat du, [<p>]{.verbatim} dena.

Harreman horiek ulertzeak dokumentuan zehar nabigatzea asko errazten du. Elementu bakoitzak zuhaitzaren barruan duen kokapena ezagutzen du, eta horri esker dokumentuaren egitura osoa zeharka daiteke. Antzeko adibide bat fitxategi-sistema baten egitura litzateke: fitxategi bat ausaz aukeratuta, semeak dituen ikus dezakegu (direktorio bat bada), anai-arrebak dituen (bide berean dauden beste fitxategiak) edo guraso-direktoriora igo gaitezkeen.

::: infobox
DOM zuhaitza fitxategi-sistema batekin konparatu dezakegu: elementua ezagututa, beste edozein elementutara joan gaitezke.
:::

## Nodo motak {#tipos-nodos}

Normalean HTML elementuekin lan egingo badugu ere, DOMak hainbat nodo mota ditu:

- Dokumentua.
- HTML elementuak.
- Iruzkinak.
- Testua.

Ondorengo adibidean **elementua** den [<p>]{.verbatim} nodo bat da. ["Bienvenido"]{.verbatim} testuak ere beste **nodo** bat osatzen du.


::: {.mycode size=footnotesize}
[HTML]{.title}
```html
<p>Bienvenido.</p>
```
:::

### Erro-nodoa: [document]{.verbatim} {#objeto-document}

DOM osoa [document]{.verbatim} izeneko objektu global baten bidez irudikatzen da, eta objektu hori orrialdeko edozein elementutara sartzeko abiapuntua da. Hierarkiako mailarik gorenean dagoen nodoa da, erro-nodoa, "[guztien gurasoa](https://es.wikipedia.org/wiki/Od%C3%ADn)".

Erro-nodo horren barruan, HTML guztiek izango dituzten hainbat propietate daude. Horien artean, honako hauek nabarmendu daitezke:

- [head]{.verbatim}: nodo hau **irakurtzeko soilik** da eta dokumentuaren [<head>]{.verbatim} itzultzen du.
- [body]{.verbatim}: dokumentuaren gorputza adierazten du, eta bertan izango ditugu elkarreragin nahi dugun nodoak eta elementuak.
- [title]{.verbatim}: uneko dokumentuaren izenburua da; lortu edo aldatu egin dezakegu.


::: exercisebox
[[15a](https://github.com/yuki/ejercicios/blob/main/daw/dec/15a.html)]{.solution}

Sortu oinarrizko HTML bat eta lortu [document]{.verbatim}-en azaldutako propietateak. Aldatu orriaren [title]{.verbatim}a.
:::


# DOM zuhaitzean zehar nabigatzea {#navegar-árbol-dom}

Elementu bat aldatu aurretik, DOMaren barruan aurkitu behar dugu. Behin hautatuta, elementu horretatik gainerako elementuetara (gurasoa, semeak, anai-arrebak) nabiga dezakegu, bide erlatibo gisa erabiliz. Aurretik esan bezala, DOMa fitxategi-sistema bat balitz bezala irudika dezakegu.

## Elementuak hautatzea {#selección-elementos}

JavaScript-ek [hainbat metodo](https://developer.mozilla.org/en-US/docs/Web/API/Document) eskaintzen ditu zeregin hori egiteko, eta guztiak [document]{.verbatim} objektuarenak dira.

### Identifikatzaile bakarraren bidez hautatzea {#selección-identificador}

HTMLaren barruan, etiketek dokumentu osoan bakarra izan behar duen identifikatzaile bat izan dezakete, [id]{.verbatim} izenekoa.

:::::::::::::: {.columns columnsep="0.5cm"}
::: {.column width="40%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```html
<h1 id="titulo">Mi página</h1>
```
:::

:::
::: {.column width="60%" }

::: {.mycode size=footnotesize}
["id"-rekin aukeratu]{.title}
```javascript
const titulo = document.getElementById("titulo");
```
:::

:::
::::::::::::::

Orain [titulo]{.verbatim} aldagaiak [<h1>]{.verbatim} elementuari dagokion objektua dauka.

::: warnbox
Elementurik aurkitzen ez bada, emaitza [null]{.verbatim} izango da.
:::

### CSS hautatzaile baten bidez hautatzea {#selección-css}

Metodo honekin ia edozein CSS hautatzaile hautatu ahal izango dugu.

:::::::::::::: {.columns columnsep="0.5cm"}
::: {.column width="40%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```html
<h1 id="titulo">Mi página</h1>
<p class="vip">Muy VIP</p>
<p>otro texto</p>
```
:::

:::
::: {.column width="60%" }

::: {.mycode size=footnotesize}
[CSS-rekin aukeratu]{.title}
```javascript
const titulo = document.querySelector("#titulo");
const vip = document.querySelector(".vip");
const p = document.querySelector("p");
```
:::

:::
::::::::::::::

Garrantzitsua da jakitea **baldintza betetzen duen lehen elementua** baino ez digula itzultzen.

::: errorbox
[querySelector()]{.verbatim}-ek baldintza betetzen duen lehen elementua baino ez digu itzultzen.
:::


### Hainbat elementu hautatzea {#seleccionar-varios-elementos}

Hautatzaile bat betetzen duten elementu guztiak lortu nahi baditugu, [querySelectorAll()]{.verbatim} erabiliko dugu:

::: {.mycode size=footnotesize}
[Selección por CSS-rekin aukeratu]{.title}
```javascript
const parrafos = document.querySelectorAll("p");

for (const parrafo of parrafos) {
    console.log(parrafo);
}
```
:::

Ikus daitekeen bezala, [p]{verbatim} motako elementu guztiak hautatzean, zeharkatu ahal izango dugun elementu-array bat lortuko dugu, eta elementu bakoitzarekin nahi dugun zeregina egin ahal izango dugu.


### Zein metodo erabili? {#método-utilizar-seleccionar}

Gaur egun, garatzaile gehienek hiru metodo baino ez dituzte erabiltzen:

| Metodoa  | Itzultzen du  | Erabilera   | Lortzen du |
|---------|----------|--------|--------|
| [getElementById()]{.verbatim} | [Element](https://developer.mozilla.org/en-US/docs/Web/API/Element) | [document]{.verbatim}  |  Elementu bat, haren identifikatzailearen bidez. |
| [querySelector()]{.verbatim}  | [Element](https://developer.mozilla.org/en-US/docs/Web/API/Element) | Edozein nodo  |  CSS hautatzaile bat betetzen duen lehen elementua. | 
| [querySelectorAll()]{.verbatim} |  [NodeList](https://developer.mozilla.org/en-US/docs/Web/API/NodeList) | Edozein nodo  | CSS hautatzaile bat betetzen duten elementu guztiak. |

Table: {tablename=yukitblr colspec=X[2]X[1]X[1]X[3]}

Beste metodo zaharrago batzuk ere badaude ([[getElementsByTagName()]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/API/Document/getElementsByTagName), [[getElementsByClassName()]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/API/Document/getElementsByClassName), etab.), baina gaur egun gutxiagotan erabiltzen dira.


::: exercisebox
[[15b](https://github.com/yuki/ejercicios/blob/main/daw/dec/15b.html)]{.solution}

Sortu HTML bat eta erabili orain arte ikusitako metodoak [document]{.verbatim}-etik eta hainbat elementu dituen nodo batetik abiatuta zeharkatzeko.
:::

## DOMeko elementuak zeharkatzea {#recorrer-dom}

Aurreko atalean DOMaren barruan elementuak aurkitzen ikasi dugu. Elementu bat aurkitu ondoren, DOM zuhaitzean zehar ere mugi gaitezke, elementuen artean dauden ahaidetasun-harremanak erabiliz. Elementu baten bidez honako hauetara sar gaitezke:

- Elementu gurasoa.
- Seme-alabak.
- Lehen seme-alaba.
- Azken seme-alaba.
- Anai-arrebak diren elementuak.

Propietate horiek bereziki erabilgarriak dira elementu batek dokumentuaren barruan duen kokapena ezagutzen dugunean eta bertatik abiatuta mugitu nahi dugunean.

Hurrengo adibideetarako, ondorengo HTMLa hartuko dugu abiapuntutzat:

::: mycode
[HTML lista batekin]{.title}
```html
<ul id="lista">
    <li id="html">HTML</li>
    <li id="css">CSS</li>
    <li id="javascript">JavaScript</li>
</ul>
```
:::

### Elementuaren gurasoa lortu {#obtener-padre}

Elementu guztiek, erro-nodoak izan ezik, elementu guraso bat dute. Horretara [parentElement]{.verbatim} propietatearen bidez sar gaitezke.

::: mycode
[Gurasoa lortu]{.title}
```javascript
const elemento = document.querySelector("#html");
console.log(elemento.parentElement);
```
:::

### Lehenengo semea lortu {#obtener-primer-hijo}

Lehen semea den elementua lortzeko, [firstElementChild]{.verbatim} erabiliko dugu.

::: mycode
[Lehenengo semea lortu]{.title}
```javascript
const lista = document.getElementById("lista");
console.log(lista.firstElementChild);
```
:::

::: questionbox
Zergatik [firstElementChild]{.verbatim} eta ez [firstChild]{.verbatim}?
:::

[firstChild]{.verbatim} propietateak **lehen nodoa** itzultzen du, haren mota edozein dela ere. Adibidez, dokumentuak lehen elementuaren aurretik zuriuneak edo lerro-jauziak baditu, [firstChild]{.verbatim}-ek testu-nodo bat itzul dezake. Aldiz, [firstElementChild]{.verbatim}-ek beti lehen **HTML elementua** itzultzen du; beraz, haren portaera aurresangarriagoa izan ohi da.


### Azken semea lortu {#obtener-último-hijo}

Azken semea den elementua lortzeko, [lastElementChild]{.verbatim} erabiliko dugu.

::: mycode
[Azkenengo semea lortu]{.title}
```javascript
const lista = document.getElementById("lista");
console.log(lista.lastElementChild);
```
:::

### Seme guztiak lortu {#obtener-hijos}

[children]{.verbatim} propietateak zuzeneko seme-alaba diren elementu guztiak itzultzen ditu, eta begizta baten bidez zeharka ditzakegu.

::: mycode
[Seme guztiak]{.title}
```javascript
const lista = document.getElementById("lista");
console.log(lista.children);

for (const elemento of lista.children) {
    console.log(elemento.textContent);
}
```
:::

### Hurrengo anaia lortu {#obtener-hermano-siguiente}

Maila bereko hurrengo elementura, hau da, anai-arrebara, [nextElementSibling]{.verbatim} bidez sar gaitezke:

::: mycode
[Hurrengo anaia lortu]{.title}
```javascript
const lista = document.getElementById("lista");
const hijo = lista.firstElementChild;
console.log(hijo.nextElementSibling);
```
:::


### Aurreko anaia lortu {#obtener-hermano-anterior}

Aurreko kasuaren antzera, aurreko anai-arrebara sartzeko propietate bat ere badago.

::: mycode
[Aurreko anaia lortu]{.title}
```javascript
const e = document.querySelector("li:last-child");
console.log(e.previousElementSibling);
```
:::

### Hainbat anai zeharkatu {#recorrer-varios-hermanos}

Zerrenda bateko elementu guztiak zeharka ditzakegu, anai-arreba batetik hurrengora mugituz.

::: mycode
[Hainbat anai-arreba zeharkatzea]{.title}
```javascript
let elemento = lista.firstElementChild;

while (elemento) {
    console.log(elemento.textContent);
    elemento = elemento.nextElementSibling;
}
```
:::


### Nabigazioaren laburpena {#resumen-navegación}

Ondorengo taulak elementuak zeharkatzeari buruzko laburpen bat izateko balio du.

| Propietatea | Deskribapena |
|-----------|-------------|
| [parentElement]{.verbatim} | Elementu gurasoa itzultzen du. |
| [children]{.verbatim} | Zuzeneko seme-alaba guztiak itzultzen ditu. |
| [firstElementChild]{.verbatim} | Lehen seme-alaba itzultzen du. |
| [lastElementChild]{.verbatim} | Azken seme-alaba itzultzen du. |
| [nextElementSibling]{.verbatim} | Hurrengo anai-arreba itzultzen du. |
| [previousElementSibling]{.verbatim} | Aurreko anai-arreba itzultzen du. |


::: exercisebox
[[15b2](https://github.com/yuki/ejercicios/blob/main/daw/dec/15b2.html)]{.solution}

Sortu zerrenda bat eta erabili orain arte ikusitako metodoak zerrendan zehar nabigatzeko eta gurasoa, seme-alabak eta anai-arrebak lortzeko.
:::


# Edukiaren aldaketa {#modificación-contenido}

DOMeko elementu bat aurkitu ondoren, hurrengo urratsa haren edukia aldatzea da. JavaScript-ek hainbat propietate eskaintzen ditu zeregin hori egiteko:

- [textContent]{.verbatim}
- [innerHTML]{.verbatim}
- [innerText]{.verbatim}

Hirurek elementu baten edukia aldatzeko aukera ematen badute ere, haien artean alde garrantzitsuak daude.

## [textContent]{.verbatim} propietatea {#textcontent}

[textContent]{.verbatim} propietateak elementu batean dagoen testu guztia lortzeko edo aldatzeko aukera ematen du. Demagun ondorengo HTMLa.

:::::::::::::: {.columns }
::: {.column width="45%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```html
<h1 id="ti">Hola</h1>
<p id="hola">
  Ey <span>Alice</span>
</p>
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[JavaScript]{.title}
```javascript
const ti = document.querySelector("#ti");
console.log(ti.textContent);
ti.textContent = "JavaScript";
```
:::

:::
::::::::::::::

Ikus daitekeen bezala, elementuaren testua lortu eta alda dezakegu.

::: questionbox
- Zer gertatzen da [hola]{.verbatim} elementuaren testua aldatzen badugu?
- Zer gertatzen da [<b>Hola</b>]{.verbatim}-rekin ordezkatzen badugu?
:::


::: errorbox
[textContent]{.verbatim}-ek ez du HTML kodea interpretatzen.
:::


## [innerHTML]{.verbatim} propietatea {#innerHTML}

[innerHTML]{.verbatim}-ek elementu baten HTML edukia irakurtzeko edo aldatzeko aukera ematen du. Oso erosoa da osagai bat aldatzeko eta HTML berria gehitzeko; arazoa da **segurtasun-arazoak sor ditzakeela JavaScript kode maltzurra exekutatuz, sartutako kodea interpretatzen duelako**.

:::::::::::::: {.columns }
::: {.column width="40%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```html
<h1 id="ti">Hola</h1>
<p id="hola">
  Ey <span>Alice</span>
</p>
<p id="nuevo"></p>
```
:::

:::
::: {.column width="55%" }

::: {.mycode size=footnotesize}
[JavaScript]{.title}
```javascript
const h = document.querySelector("#hola");
h.innerHTML = "<strong>Alice</strong>";
const n = document.querySelector("#nuevo");
n.innerHTML = `
  <h2>Noticias</h2>
  <p>bla bla</p>
`;
```
:::

:::
::::::::::::::



::: exercisebox
[[15c](https://github.com/yuki/ejercicios/blob/main/daw/dec/15c.html)]{.solution}

- [innerHTML]{.verbatim} erabili  bi elementu aldatzeko eta sartu HTML kodea.
- Erabili [<img src="img.png" onload="alert('hacked!');">]{.verbatim}
- Zer gertatzen da azken instrukzio horrekin? (existitzen den irudi bat erabili behar duzu).
:::

::: errorbox
[innerHTML]{.verbatim}-ek segurtasun-arazoak sor ditzake, sartutako kodea interpretatzen duelako.
:::

## [innerText]{.verbatim} propietatea {#propiedad-innertext}

[innerText]{.verbatim}-ek ere testuarekin lan egiten du, baina ikusgai dagoen edukia soilik hartzen du kontuan. Hau da, ezkutatutako (*hidden*) testua eta estilo-kodea edo [<script>]{.verbatim} etiketetako kodea ez ditu kontuan hartzen. [MDNren dokumentazioan](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/innerText) adibide bat dago.


::: exercisebox
- [MDN-ren dokumentazioa](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/innerText) eta [playground](https://developer.mozilla.org/en-US/play?uuid=bdfb68097c54aa07d71556591c5119502c820ef7&state=jVJNb9swDP0rBHdZgS5ekWEYHMWHtQHaywZsOfSgi2qztVeFEiR6aVAU2K%2FZD9svGWR7sZGsRS%2F64CPfIx%2F4iLVsLOao6nnx3bWhJCBLG2LJVVbPC83KQ1MtNcYO1VhoBlBRdpa6J8CbHoLH%2FgtQOutCDoGqRR96GhKFHmRMS793EgzHWxc2ObTeUyhNpGmVykYpFb3hvptUO%2FQCsDb3BAasc%2FdgRN0EyAakdluQuomd1hRoIjQsFHwgoQpuyLrtbNDzhidynfxSY9VEb80uZ8fJhcuri4vVF1ivrtf7EpX5dNbz4hvF1gq420743LFMHU0xE8iMowwZX1vxrWiE4LZxqfHsk8bkZnp%2FeJ%2FiZCrHdlf8%2BfVbZf94jkQbZgprenhOco8fCn58rR6eYhkj5oin%2BCPdpeMoMGzCEipXtmmLZnckq36hPu%2BuqrfjHp0sNPdFRwa8WP8fu0aqg8FeJDoyIdFoPuKf%2FTS2TTP1nc8mCQvNByyHyXt40XkmNW0Ic7TNXS349Bc%3D&srcPrefix=%2Fen-US%2Fdocs%2FWeb%2FAPI%2FHTMLElement%2FinnerText%2F) erabili [innerText]{.verbatim} zer egiten duen ikusteko.
- Aldatu adibidea [innerHTML]{.verbatim} eta [textContent]{.verbatim} erabil ditzan.
- Zein alde dago haien artean?
:::

# Elementuen atributuak {#atributos-elementos}

HTML elementuek haien ezaugarriak deskribatzen dituzten atributuak dituzte. JavaScript erabiliz, atributu horiek kontsultatu, aldatu, gehitu edo ezabatu ahal izango ditugu.

JavaScript-etik elementuen HTML atributuetara eta DOMeko objektuaren propietateetara sar gaitezke. Printzipioz, **nabigatzaileak biak sinkronizatuta mantentzen ditu** aldaketak egiten baditugu.


## Atributuak lortu {#obtener-atributos}

Elementu batean *set* eginda dauden atributuen izenak lortu nahi baditugu, [getAttributeNames()]{.verbatim} erabil dezakegu. Metodo horrek izenak dituen array bat itzuliko digu, eta, beraz, aurretik ikusitako begiztetako baten bidez zeharka dezakegu.

Atributu zehatz baten edukia lortu nahi badugu, [getAttribute("nombre")]{.verbatim} erabiliko dugu.

::: warnbox
Atributua existitzen ez bada, [null]{.verbatim} itzuliko digu.
:::

:::::::::::::: {.columns }
::: {.column width="38%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```html
<img src="img.png" id="foto">

<a href="https://kernel.org">
    Visitar
</a>

<input type="text">
```
:::

:::
::: {.column width="57%" }

::: {.mycode size=footnotesize}
[Atributuak lortu]{.title}
```javascript
const imagen = document.querySelector("#foto");
let nombres = imagen.getAttributeNames();

for (let n of nombres){
    console.log(n);
    imagen.getAttribute(n);
}

//acceder directamente al id
console.log(imagen.id);
```
:::

:::
::::::::::::::

Atributuak ezagutzen baditugu, zuzenean objektuaren bidez atzi ditzakegu.


## Atributuak aldatu {#modificar-atributos}

Elementu baten atributuak alda ditzakegu edo atributu berriak sor ditzakegu [setAttribute()]{.verbatim} funtzioa erabiliz.

::: mycode
[Atributuak aldatu]{.title}
```javascript
const enlace = document.querySelector("a");
//modifica el atributo HTML
enlace.setAttribute("target","_blank");

//modifica el objeto DOM
enlace.href="https://www.google.com";
```
:::

## Atributu pertsonalizatuak sortu {#crear-atributos}

Nahiz eta ezerk ez eragotzi nahi dugun izenarekin atributu pertsonalizatuak sortzea, **jardunbide egokiek eta estandarrak adierazten digute [data-]{.verbatim}-rekin hasi behar dugula haien izena**. [Dokumentazioak](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Global_attributes/data-*) adierazten digu horrela informazio hori HTMLaren eta DOMaren artean trukatuko dela.

::: mycode
[Atributu pertsonalizatuak]{.title}
```javascript
const enlace = document.querySelector("a");

enlace.setAttribute("data-grado","DAW");
enlace.setAttribute("data-curso",2);

//obtener todos los atributos personalizados
console.log(enlace.dataset);
//acceder a un atributo personalizado concreto
console.log(enlace.dataset.grado);
console.log(enlace.dataset.curso);
```
:::

Atributu horiek oso erabilgarriak dira elementu batekin lotutako informazioa gordetzeko.

## Atributuak ezabatu {#eliminar-atributos}

Sortu ditzakegun bezala, atributu zehatz bat ere ezaba dezakegu.

::: mycode
[Atributuak ezabatu]{.title}
```javascript
enlace.removeAttribute("target");
```
:::

## Existitzen den egiaztatu {#atributo-existe}

Atributu bat existitzen den egiaztatzeko, [hasAttribute()]{.verbatim} erabil dezakegu, eta balio boolear bat itzuliko digu.

::: mycode
[Existitzen den egiaztatu]{.title}
```javascript
console.log(enlace.hasAttribute("href"));
```
:::


::: exercisebox
[[15d](https://github.com/yuki/ejercicios/blob/main/daw/dec/15d.html)]{.solution}

Erabili atributuei buruz ikusitako funtzioak.
:::

# CSS klaseen kudeaketa {#clases-css}

CSS klaseek elementu baten itxura bisuala aldatzeko aukera ematen dute. JavaScript-ek klaseak dinamikoki gehitu, ezabatu edo txandakatu ditzake. Horrela, elementuak dinamikoki erakutsi/ezkutatu, informazioa nabarmendu, koloreak aldatu, erabiltzailearen ekintzen arabera interfazea aldatu eta abar egin dezakegu.

Klaseekin edozein ekintza egiteko, [classList]{.verbatim} propietatea erabili behar da. Propietate horrek hainbat funtzio ditu, eta jarraian ikusiko ditugu.

::: infobox
[classList]{.verbatim}, funtzio barik,  klaseen array bat itzultzen du.
:::

Hurrengo adibideetan ondorengo kodea erabiliko da:


:::::::::::::: {.columns }
::: {.column width="38%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```html
<p id="mensaje">
    Bienvenido
</p>
```
:::

:::
::: {.column width="57%" }

::: {.mycode size=footnotesize}
[CSS]{.title}
```css
.destacado {
    color: red;
    font-weight: bold;
}
.italica {
    font-style: italic;
}
```
:::

:::
::::::::::::::


## Klaseak gehitu {#añadir-clases}

Elementu zehatz bati klase bat gehitu nahi badiogu, [classList.add()]{.verbatim} erabil dezakegu.

::: {.mycode size=footnotesize}
[Klaseak gehitu]{.title}
```javascript
const mensaje = document.querySelector("#mensaje");
mensaje.classList.add("destacado");
```
:::

## Klase bat txandakatu {#alternar-clase}

[classList.toggle()]{.verbatim} metodoak klasea gehitzen du elementuak ez badu, eta badu, ezabatu egiten du.

::: {.mycode size=footnotesize}
[Klase bat txandakatu]{.title}
```javascript
const mensaje = document.querySelector("#mensaje");
mensaje.classList.toggle("italica");
```
:::


## Klase bat existitzen den egiaztatu {#comprobar-clase}

Elementu batek klase bat duen jakiteko, [classList.contains()]{.verbatim} funtzioa erabil dezakegu; funtzio horrek balio boolear bat itzultzen du.

::: {.mycode size=footnotesize}
[Egiaztatu klasea dagoen]{.title}
```javascript
const mensaje = document.querySelector("#mensaje");
console.log(mensaje.classList.contains("italica"));
```
:::

## Klase bat ordezkatu {#reemplazar-clase}

Klase bat beste batekin aldatu nahi badugu, [classList.replace()]{.verbatim} funtzioa dugu.

::: {.mycode size=footnotesize}
[Klasea ordezkatu]{.title}
```javascript
const mensaje = document.querySelector("#mensaje");
mensaje.classList.replace(
    "destacado", // reemplaza esta clase
    "normal"     // por esta otra
);
```
:::

## Hainbat klase gehitu {#añadir-varias-clases}

Hainbat klase banan-banan gehitu beharrean, [classList.add()]{.verbatim} erabil dezakegu.

::: {.mycode size=footnotesize}
[Klasea gehitu]{.title}
```javascript
const mensaje = document.querySelector("#mensaje");
mensaje.classList.add(
    "rojo",
    "grande",
    "centrado"
);
```
:::

## [className]{.verbatim} atributua {#atributo-classname}

[className]{.verbatim} atributuak bi funtzio ditu:

- Dauden klase guztiak itzultzen dizkigu.
- Klase guztiak aldatzeko aukera ematen digu.

::: {.mycode size=footnotesize}
[Klase guztiak aldatu]{.title}
```javascript
const mensaje = document.querySelector("#mensaje");
// obtener todas las clases
console.log(mensaje.className);

mensaje.className = "destacado italica";
```
:::

## Laburpena {#resumen-clases}

| Metodoa | Funtzioa |
|---------|---------|
| [classList]{.verbatim } | Klaseen array bat itzultzen du. |
| [classList.add()]{.verbatim } | Klase bat gehitzen du. |
| [classList.remove()]{.verbatim } | Klase bat ezabatzen du. |
| [classList.toggle()]{.verbatim } | Klase bat gehitu edo ezabatzen du. |
| [classList.contains()]{.verbatim } | Klase bat existitzen den egiaztatzen du. |
| [classList.replace()]{.verbatim } | Klase bat beste batekin ordezkatzen du. |
| [className]{.verbatim } | Klase guztiak lortzen ditu edo ordezkatzen ditu. |


::: exercisebox
[[15e](https://github.com/yuki/ejercicios/blob/main/daw/dec/15e.html)]{.solution}

Erabili aurreko funtzioak elementu baten klaseak aldatzeko.
:::


# DOMeko elementuen kudeaketa {#crear-eliminar-elementos-dom}

Orain arte, orrian lehendik zeuden elementuak aldatzen ikasi dugu. Normalean, web-aplikazio batean elementu berriak sortu, edozein kokapenetan txertatu edo beharrezkoak ez direnean ezabatu ere nahi izango dugu. Adibidez:

- Zereginen zerrendari elementu berri bat gehitzea.
- Taula batean errenkada bat sortzea.
- Jakinarazpen bat erakustea.
- Mezu bat ezabatzea.
- API batetik lortutako informazioarekin txartel bat sortzea.

JavaScript-ek hainbat metodo eskaintzen ditu zeregin horiek egiteko.

## Elementu bat sortzea {#crear-elemento}

Elementu bat sortzeko [createElement()]{.verbatim} funtzioa erabiltzen da. Demagun paragrafo bat sortu nahi dugula. Prozesuak hainbat urrats ditu:

1. **Elementua sortzea**: Une honetan elementua **oraindik ez da orrian agertzen**, elementua sortu egin delako eta memorian soilik existitzen delako.
2. **Edukia gehitzea**: Sortu ondoren, edukia gehitu edo haren propietateak alda ditzakegu.
3. **Dokumentuan txertatzea**: Nabigatzaileak erakuts dezan, DOMean txertatu behar dugu. Elementua non txertatu nahi dugun pentsatu beharko dugu; beste elementu baten barruan edo [body]{.verbatim}-n izan daiteke.



::: mycode
[Elementu bat gehitu]{.title}
```javascript
// crear elemento
const parrafo = document.createElement("p");

// añadir contenido
parrafo.textContent = "Hola mundo";

// modificar sus propiedades
parrafo.className = "importante";

// insertarlo en el documento
document.body.append(parrafo);
```
:::

Kasu honetan paragrafo bat sortu da, edukia eman zaio, klase berri bat gehitu zaio eta [body]{.verbatim}-aren amaieran gehitu da.

Adibide konplexuago bat egingo dugu, elementuen egitura guztiz berria sortuz:

:::::::::::::: {.columns }
::: {.column width="65%"}


::: {.mycode size=footnotesize}
[Elementuak sortu]{.title}
```javascript
const tarjeta = document.createElement("div");
const titulo = document.createElement("h2");
const descripcion = document.createElement("p");

titulo.textContent = "JavaScript";
descripcion.textContent = "Creado en...";

tarjeta.append(titulo);
tarjeta.append(descripcion);
document.body.append(tarjeta);
```
:::

:::
::: {.column width="35%" }

::: {.mycode size=footnotesize}
[HTML generado]{.title}
```html
<body>
<!-- ... -->
  <div>
    <h2>JavaScript</h2>

    <p>Creado en...</p>
  </div>
</body>
```
:::

:::
::::::::::::::


### Zein metodo erabili? {#método-utilizar-crear}

Aurretik [[innerHTML]{.verbatim}](#innerHTML) metodoa ikusi dugu, eta orain [createElement()]{.verbatim} metodoa. Bi teknikak baliagarriak badira ere, alde garrantzitsuak dituzte.

| createElement() | innerHTML |
|-------------------|-------------|
| DOMeko objektuak sortzen ditu. | HTML kodea txertatzen du. |
| Seguruagoa da. | Segurtasun-arriskuak sor ditzake. |
| Oso egokia da eduki dinamikoa sortzeko. | Erosoa da HTML kopuru handia sortzeko. |
| Elementu bakoitza banaka aldatzeko aukera ematen du. | Elementuaren edukia ordezkatzen du. |

Aplikazio modernoetan **[createElement()]{.verbatim}** erabili behar da elementuak datuetatik abiatuta dinamikoki sortzen direnean.

::: infobox
Aplikazio modernoetan **[createElement()]{.verbatim}** erabili behar da.
:::



### Sortutako elementua txertatzea {#dónde-insertar-elemento}

Elementu berri bat (edo elementuen zuhaitz txiki bat) sortzen dugunean, non txertatu erabaki behar dugu. Horretarako, hainbat metodo ditugu:

| Metodoa | Non? |
|---------|---------|
| [append()]{.verbatim } | Azken seme-alaba gisa txertatzen du. |
| [prepend()]{.verbatim } | Hasieran txertatzen du, lehen seme-alaba gisa. |
| [before()]{.verbatim } | Elementuaren aurretik txertatzen du. |
| [after()]{.verbatim } | Elementuaren ondoren txertatzen du. |


:::::::::::::: {.columns }
::: {.column width="38%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```html
<h1>Comprar</h1>
<ul id="lista">
  <li>Tomates</li>
</ul>
```
:::

:::
::: {.column width="57%" }

::: {.mycode size=footnotesize}
[Javascript]{.title}
```javascript
const lista = document.querySelector("#lista");

const pan = document.createElement("li");
pan.textContent = "Pan";
lista.append(pan);

const arroz = document.createElement("li");
arroz.textContent = "Arroz";
lista.prepend(arroz);

const p = document.createElement("p");
p.textContent = "Hay que comprar:"
lista.before(p);

const fin = document.createElement("p");
fin.textContent = "No te olvides de nada!"
lista.after(fin);
```
:::

:::
::::::::::::::


### Elementu bat mugitzea {#mover-elemento}

DOMaren xehetasun garrantzitsu bat da elementu bat **behin bakarrik existitu daitekeela**. Elementu bat beste kokapen batean txertatzen badugu, nabigatzaileak ez du kopiarik sortzen; besterik gabe, mugitu egiten du.

::: mycode
[Javascript]{.title}
```javascript
const lista = document.querySelector("#lista");

const elemento = document.createElement("li");
elemento.textContent = "Pan";
lista.prepend(elemento);

elemento.textContent = "Arroz";
lista.append(elemento);
```
:::

Bigarren instrukzioaren ondoren, elementua zerrendaren amaieran soilik egongo da.


## Elementu bat ezabatzea {#eliminar-elemento}

Elementu bat ezabatu nahi badugu, zeregin erraza da. Elementu zehatza hautatu ondoren, [remove()]{.verbatim} funtzioa erabiltzen dugu, eta DOMetik desagertuko da.

::: mycode
[Javascript]{.title}
```javascript
const lista = document.querySelector("#lista");
lista.remove();
```
:::


## Elementu bat ordezkatzea {#reemplazar-elemento}

Elementu baten edukia beste batekin ere ordezka daiteke.

:::::::::::::: {.columns }
::: {.column width="35%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```html
<p id="mensaje">
    Texto antiguo
</p>
```
:::

:::
::: {.column width="60%" }

::: {.mycode size=footnotesize}
[Javascript]{.title}
```javascript
const nuevo = document.createElement("h2");
nuevo.textContent = "Nuevo mensaje";

const antiguo = document.querySelector("#mensaje");
antiguo.replaceWith(nuevo);
```
:::

:::
::::::::::::::

## Elementu bat hustea {#vaciar-elemento}

Elementu baten barruko edukia soilik ezabatu nahi badugu (elementua bera ezabatu gabe), honako hau egin dezakegu:

::: mycode
[Javascript]{.title}
```javascript
lista.textContent = "";
// alternativa
lista.innerHTML = "";
```
:::

::: exercisebox
[[15f](https://github.com/yuki/ejercicios/blob/main/daw/dec/15f.html)]{.solution}

Zeharkatu osagaien array bat eta gehitu osagai berriak [<li>]{.verbatim} motako elementuak sortuz, zerrendaren hasieran eta, ondoren, amaieran txertatuz.
:::

## Txertatzeak optimizatzea [DocumentFragment]{.verbatim} bidez {#optimización-inserción}

Aurreko adibideetan elementuak sortu eta zuzenean DOMean txertatu ditugu. Kode-adibide horiek behar bezala funtzionatzen dute eta guztiz baliagarriak dira, baina elementu kopurua oso handia denean, eraginkortasun txikia izan dezakete.

Elementu berri bat txertatzen den bakoitzean, nabigatzaileak DOM zuhaitza eguneratu behar du eta, kasu askotan, orriaren diseinua berriro kalkulatu behar du.

Ehunka edo milaka txertatze jarraian egiten direnean, prozesu horrek aplikazioaren errendimenduan eragina izan dezake. Arazo hori konpontzeko, JavaScript-ek [[DocumentFragment()]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/API/DocumentFragment) objektua eskaintzen du.


[DocumentFragment()]{.verbatim} gurasorik ez duen aldi baterako edukiontzi bat da, [Document]{.verbatim} motako objektu arinago bat memorian erabat eraikitzeko aukera ematen duena. Elementuak sortu eta fragmentuan gehitzen dira, baina oraindik **ez dira DOM dokumentu nagusiaren parte**. Amaitutakoan, fragmentuaren eduki osoa DOMean txertatzen da eragiketa bakar baten bidez.


### Fragmentu bat sortu {#crear-fragmento}

Fragmentu bat [createDocumentFragment()]{.verbatim} bidez sortzen da. Une horretatik aurrera, DOMeko beste edozein elementu balitz bezala erabil daiteke.

::: mycode
[Fragmentua sortu]{.title}
```javascript
const fragmento = document.createDocumentFragment();
```
:::

### Elementuak gehitu {#fragmento-añadir-elemento}

Demagun zerrenda huts bat dugula eta bertan hainbat elementu gehitu nahi ditugula. Aurretik banan-banan nola gehitu ikusi dugu. Kasu honetan, ordea,

::: mycode
[Elementuak fragmentuari gehitu]{.title}
```javascript
const lenguajes = [
    "HTML",
    "CSS",
    "JavaScript",
    "TypeScript",
    "Vue"
];
for (const lenguaje of lenguajes) {
    const elemento = document.createElement("li");
    elemento.textContent = lenguaje;
    fragmento.append(elemento);
}
```
:::

Une honetan orriak berdin-berdin jarraitzen du. Elementuak oraindik ez dira erakusten, DOMean txertatu ez direlako.


### Fragmentua txertatzea {#insertar-fragmento}

Elementu guztiak fragmentuari gehitzen amaitu ondoren, DOMean gehitu behar dugu.

:::::::::::::: {.columns }
::: {.column width="38%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```html
<h1>Lenguajes</h1>
<ul id="lista">
</ul>
```
:::

:::
::: {.column width="57%" }

::: {.mycode size=footnotesize}
[Javascript]{.title}
```javascript
const lista = document.querySelector("#lista");

lista.append(fragmento);
```
:::

:::
::::::::::::::

Hori egindakoan, erabiltzaileak azken emaitza ikusiko du. Xehetasun garrantzitsu bat da fragmentua **ez dela beste nodo bat balitz bezala txertatzen**. Fragmentua hutsik geratzen da, eta, behar izanez gero, berriro erabil daiteke.


### Zergatik da eraginkorragoa? {#razones-eficiencia}

Demagun 1000 elementu txertatu nahi ditugula. Prozesua honakoa izango litzateke:

![DOMa zuzenean erabiltzean eta fragmentu bat erabiltzean dagoen aldea](img/dec/fragment-dom.svg){width="100%"}


