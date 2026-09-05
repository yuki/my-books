
# JavaScript kodea idaztea {#escribir-código-javascript}

JavaScript web-orri batean hainbat modutan txerta daiteke. Bata edo bestea aukeratzea proiektuaren tamainaren, kodearen antolaketaren eta aplikazioaren beharren araberakoa izango da. Atal honetan JavaScript kodea HTML dokumentu batean txertatzeko modu desberdinak eta web-garapen modernoan gomendatzen diren jardunbide egokiak ikasiko ditugu.

JavaScript web-orri batean txertatzeko bi modu nagusi daude:

- Kode integratua (barnekoa).
- Kodea kanpoko fitxategi batean.

## Kode integratua {#código-integrado}

Kode integratua JavaScript kodea zuzenean HTML dokumentuaren barruan idaztean datza, [<script>]{.verbatim} etiketa erabiliz.

::: mycode
[HTMLn txertatutako JavaScript kodea]{.title}

```html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Mi primera página</title>
</head>
<body>
    <h1>Hola Mundo</h1>
    <!-- esto es un comentario HTML -->
    <script>
        // esto es un comentario en JavaScript
        console.log("Hola desde JavaScript");
    </script>
</body>
</html>
```
:::

Nabigatzaileak [<script>]{.verbatim} etiketa aurkitzen duenean, haren barruan dagoen kodea interpretatu eta berehala exekutatzen du. Web-orri berean hainbat etiketa egon daitezke, eta agertzen diren ordenan exekutatuko dira.

::: infobox
[<script>]{.verbatim} etiketak [type]{.verbatim} atributua izan dezake, hala nola [type="text/javascript"]{.verbatim}. Jartzen ez bada, lehenetsitako kodea JavaScript dela ulertzen da.
:::


## Kodea kanpoko fitxategi batean {#código-fichero-externo}

JavaScript kodea idazteko modurik ohikoena [.js]{.verbatim} luzapena duen fitxategi independente batean egitea da; adibidez, [js/app.js]{.configfile}. HTML fitxategitik JavaScript fitxategiari erreferentzia egiten zaio.


:::::::::::::: {.columns columnsep=0.5cm}
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[index.html kodea]{.title}
```html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Mi primera página</title>
</head>
<body>
    <h1>Hola Mundo</h1>
    <script src="js/app.js"></script>
</body>
</html>
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=scriptsize}
[js/app.js kodea]{.title}
```javascript
console.log("Hola desde un fichero externo");
```
:::

:::
::::::::::::::


Nabigatzaileak HTML kodea jasotzen duenean, aztertu egingo du eta [src]{.verbatim} atributua ikusiko du; beraz, beste eskaera bat egingo dio zerbitzariari fitxategia deskargatzeko eta, horrela, exekutatu ahal izateko. Aukera hori ia edozein proiektutan gomendatzen da, kode integratuak ez dituen hainbat abantaila baititu:

- HTML kodea garbiagoa da.
- Egitura eta logika bereizten dira.
- Fitxategi bera hainbat orritan berrerabil daiteke.
- Errazagoa da akatsak aurkitzea.
- Talde-lana errazten du.
- Nabigatzaileak fitxategia cachean gorde dezake etorkizuneko bisitetarako. Ez dio berriro zerbitzariari eskatuko.

Proiektu bat handitzen denean, komenigarria izan daiteke kodea hainbat fitxategitan banatzea.

::: exercisebox
[[01](https://github.com/yuki/ejercicios/blob/main/daw/dec/01.html)]{.solution}

Idatzi aurreko kodea eta bilatu non agertzen den log-a.
:::


### Hainbat fitxategiren karga {#carga-ficheros-externos}

Orri batek JavaScript hainbat fitxategi dituenean, **fitxategiak kargatzeko ordena oso garrantzitsua izan daiteke**. Nabigatzaileak scriptak HTML dokumentuan agertzen diren ordenari jarraituz exekutatzen ditu. Hori kontuan hartuta, **garrantzitsua da fitxategien artean mendekotasunik dagoen kontuan hartzea**.

Demagun honako bi fitxategi hauek:

:::::::::::::: {.columns }
::: {.column width="50%"}

::: {.mycode size=scriptsize}
[js/funciones.js kodea]{.title}
```javascript
function saludar(nombre) {
    console.log(`Hola ${nombre}`);
}
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=scriptsize}
[js/app.js kodea]{.title}
```javascript
saludar("Bob");
```
:::

:::
::::::::::::::

::: exercisebox
[[02a](https://github.com/yuki/ejercicios/blob/main/daw/dec/02a.html) y [02b](https://github.com/yuki/ejercicios/blob/main/daw/dec/02b.html)]{.solution}

Zein izango litzateke fitxategiak kargatzeko ordena zuzena? Probatu aukera posible guztiak. Zer gertatzen da ordena okerra denean?
:::

## Non kargatu JavaScript? {#dónde-cargar-javascript}

Tradizionalki, bi aukera zeuden.

- **[<head>]{verbatim}** elementuaren barruan: Metodo honek arazoak sor ditzake. Nabigatzaileak fitxategia deskargatzen duen bitartean, HTML orria eraikitzeari uzten dio. Ondorioz, erabiltzaileak karga motelagoa dela hauteman dezake, eta exekuzioren bat egiten bada, HTMLa oraindik eraiki gabe dagoenez, akatsak gerta daitezke.
- **[<body>]{verbatim}** elementua itxi aurretik: Urte askotan gomendioa scriptak [<body>]{verbatim} elementuaren itxieraren aurretik jartzea izan zen.

:::::::::::::: {.columns }
::: {.column width="50%"}

::: {.mycode size=scriptsize}
[head-en kodea]{.title}
```html
<head>
    <script src="03.js"></script>
</head>
<body>
    <h1 id="titulo">Título</h1>
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=scriptsize}
[body itxi aurretik]{.title}
```html
<body>
    <h1 id="titulo">Título</h1>
...
    <script src="03.js"></script>
</body>
```
:::

:::
::::::::::::::

::: exercisebox
[[03a](https://github.com/yuki/ejercicios/blob/main/daw/dec/03a.html) y [03b](https://github.com/yuki/ejercicios/blob/main/daw/dec/03b.html)]{.solution}

Zein desberdintasun dago hurrengo kodea [head]{.verbatim} elementuan edo [body]{.verbatim} elementuaren amaieran kargatzean?

[console.log(document.getElementById("titulo"))]{.verbatim}
:::


### defer atributua {#atributos-al-cargar}

Gaur egun, gomendatzen den jardunbiderik erabiliena [defer]{.verbatim} atributua erabiltzea da. Horrek errendimendua hobetzen du eta oraindik existitzen ez diren HTML elementuekin lotutako akats asko saihesten ditu, izan ere:

- nabigatzaileak HTML dokumentua eraikitzen jarraitzen du;
- JavaScript fitxategia atzeko planoan deskargatzen da;
- kodea ez da exekutatzen HTML dokumentua kargatzen amaitu arte.


::: {.mycode}
[Erabili "defer" atributu bezala]{.title}
```html
<head>
  <script src="app.js" defer></script>
</head>
```
:::

::: exercisebox
[[03c](https://github.com/yuki/ejercicios/blob/main/daw/dec/03c.html)]{.solution}

Aldatu aurreko ariketa [defer]{.verbatim} erabiliz [head]{.verbatim} elementuan.
:::

### async atributua {#atributo-async}

[async]{.verbatim} atributua ere badago. Kasu honetan, nabigatzaileak fitxategia paraleloan deskargatzen du, baina **deskarga amaitu bezain laster** exekutatzen du, nahiz eta HTML dokumentua oraindik guztiz kargatu ez. [async]{.verbatim} duten hainbat script-en arteko exekuzio-ordena **ez dago bermatuta**.

Horregatik, normalean script independenteetarako soilik erabiltzen da; adibidez:

- **Bisiten analisi-tresnak**: aplikaziotik isolatuta funtzionatzen duten liburutegiak izan ohi dira. Datuak bildu eta kanpoko zerbitzarietara bidaltzen dituzte (adibidez, *Google Analytics*).
- **Publizitatea**: aurreko kasuaren antzekoa da, baina publizitatea txertatzeko. Kasu honetan, kanpoko zerbitzari batetik datuak eskuratzen dituzte irudiak web-orrian txertatzeko.

::: errorbox
Ez da gomendagarria [async]{.verbatim} erabiltzea elkarren mendekoak diren scriptetarako.
:::

## Konparaketa eta jardunbide egokiak {#comparativa}

Ikusi ahal izan dugun bezala, JavaScript kodea kargatzeko hainbat modu daude. Horregatik, garrantzitsua da kodea non jarri behar dugun ulertzea eta fitxategiak kargatzean atributuak erabiltzea beharrezkoa izan daitekeela jakitea.

Hurrengo irudian kargatzeko metodo desberdinen irudikapen bisuala ikus daiteke:

![Iturria: [MDN](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/script)](img/dec/async-defer.jpg){width=100%}


Hurrengo taulan ere laburbiltzen da nola erabil daitezkeen.

| Metodoa | HTMLaren karga blokeatzen du? | Ordena errespetatzen du? | Gomendatutako erabilera |
|---------|-------------------------------|---------------------------|-------------------------|
| [<script>]{.verbatim} klasikoa | Bai | Bai | Adibide sinpleetarako soilik. |
| [<script defer>]{.verbatim} | Ez | Bai | Gomendatutako aukera. |
| [<script async>]{.verbatim} | Ez | Ez nahitaez | Script independenteak. |

Table: {tablename=yukitblr colspec=XXXX}

::: infobox
Garrantzitsua da gure kodea kargatzeko moduen arteko desberdintasunak ezagutzea.
:::


## Lengoaiaren gramatika {#gramática}

Programazio-lengoaia guztiek bezala, JavaScript-ek bere gramatika eta lexikoa ditu. MDNren dokumentazioan [lexiko osoa](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Lexical_grammar) azaltzen da.


# Modu zorrotza (["use strict"]{.verbatim}) {#modo-estricto}

JavaScript hasiera batean oso malgua izateko diseinatu zen. Lehen urteetan, detektatzeko zailak ziren akatsak sor zitzaketen ekintza batzuk egitea ahalbidetzen zuen, hala nola aldagaiak deklaratu gabe sortzea edo gomendagarriak ez ziren egiturak erabiltzea. Segurtasuna hobetzeko eta aplikazioen garapena errazteko, **ECMAScript 5 (ES5)** estandarrak **modu zorrotza** (*[Strict Mode](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Strict_mode)*) txertatu zuen 2009an.

Modu zorrotza fitxategi edo funtzio baten hasieran honako instrukzio hau idatziz aktibatzen da:


::: mycode
[Modu zorrotza gehitu]{.title}

```javascript
"use strict";
```
:::

Une horretatik aurrera, interpretatzaileak arau zorrotzagoen multzo bat aplikatzen du, garapenean zehar akatsak detektatzen laguntzen duena. Adibidez, aldagaiak nahi gabe sortzea eragozten du, segurutzat jotzen ez diren zenbait eragiketa saihesten ditu eta lehen oharkabean pasa zitezkeen egoeretan salbuespenak sortzen ditu. Horrek akatsak detektatzea errazten du eta kode sendoagoa eta mantentzeko errazagoa idazten laguntzen du.

Gaur egun, **ECMAScript moduluak** ([import]{.verbatim} eta [export]{.verbatim} erabiltzen dituzten fitxategiak) modu zorrotzean funtzionatzen dute automatikoki, eta, beraz, ez da beharrezkoa goiburua haietan idaztea. Hala ere, oraindik ere gomendagarria da direktiba hori ezagutzea, proiektu ugaritan erabiltzen jarraitzen baita eta moduluak hedatu aurretik garatutako aplikazioen funtzionamendua ulertzea ahalbidetzen baitu.

Liburu honetan zehar JavaScript-en ezaugarri modernoak erabiliko ditugu beti, eta lengoaiaren egungo gomendioei jarraituko diegu. Proiektu moderno askotan modu zorrotza dagoeneko automatikoki aktibatzen bada ere, haren helburua ezagutzeak JavaScript-en bilakaera eta garapenaren hasieratik jardunbide egokiak hartzearen garrantzia ulertzen laguntzen du.

::: exercisebox
[[03d](https://github.com/yuki/ejercicios/blob/main/daw/dec/03d.html)]{.solution}

Sortu JavaScript fitxategi bat ondorengo kodearekin. Zer gertatzen da?

::: mycode
[Modu zorrotza]{.title}

```javascript
"use strict";
nombre = "Ana";
console.log(nombre);
```
:::

:::


# Iruzkinak {#comentarios}

Iruzkinak iturburu-kodean txertatutako testu-zatiak dira, **JavaScript-en exekuzio-motorrak exekutatzen ez dituenak**. Haien helburua programaren funtzionamendua ulertzen laguntzea, diseinu-erabakiak dokumentatzea edo garapenean zehar zenbait instrukzio aldi baterako desaktibatzea da.

Beste lengoaia batzuetan gertatzen den bezala, lerro bakarreko edo hainbat lerrotako iruzkinak egin ditzakegu.


:::::::::::::: {.columns }
::: {.column width="50%"}

::: mycode
[Lerro bateko iruzkina]{.title}

```javascript
// Este es un comentario
console.log("Hola mundo");
let edad = 20; // edad
```
:::

:::
::: {.column width="50%" }

::: mycode
[Lerro askotako iruzkina]{.title}
```javascript
/*
Este comentario puede ocupar
una o varias líneas.
*/
console.log("Hola");
```
:::

:::
::::::::::::::


Iruzkinek kodeari informazio erabilgarria eman beharko liokete; beraz, ez lirateke lerro bakoitza azaltzeko erabili behar. Ohikoena honako kasu hauetan erabiltzea da:

- Algoritmo konplexuak.
- Diseinu-erabakiak.
- Agerikoak ez diren soluzioak.
- Ezagutzen diren mugak.
- Aldatzeko zain dagoen kodea.


::: errorbox
Iruzkinak eguneratuta mantendu behar dira kodea eguneratu ahala.
:::



## JSDoc iruzkinak {#jsdoc}

Beste programazio-lengoaia batzuetan gertatzen den bezala, proiektu profesionaletan ohikoa da dokumentaziorako formatu berezi bat erabiltzea. Javan [Javadoc](https://en.wikipedia.org/wiki/Javadoc) erabili ohi da eta, JavaScript-en, antzeko sintaxia erabiliz, **[JSDoc](https://en.wikipedia.org/wiki/JSDoc)** erabil daiteke.

Funtzioak, klaseak eta programaren beste elementu batzuk modu egituratuan dokumentatzea ahalbidetzen du. Haren sintaxia [/**]{.verbatim} erabiliz hasten da.

::: mycode
[JSDoc iruzkinak]{.title}
```javascript
/**
 * Devuelve la suma de dos números.
 *
 * @param {number} a Primer número.
 * @param {number} b Segundo número.
 * @returns {number} Resultado de la suma.
 */
function sumar(a, b) {
    return a + b;
}
```
:::


# Aldagaiak {#variables}

Aldagaiek informazioa memorian gordetzeko aukera ematen dute, gero erabili ahal izateko. Horiei esker, programa batek balioak gogora ditzake, kalkuluak egin, informazioa aldatu edo kodearen atal desberdinen artean datuak trukatu.

:::::::::::::: {.columns }
::: {.column width="35%"}

::: mycode
[Aldagai bat sortu eta erabili]{.title}

```javascript
let nombre = "Alice";
console.log(nombre);
```
:::

:::
::: {.column width="65%" }
Kasu honetan:

- [let]{.verbatim}: aldagai bat deklaratuko dugula adierazten du.
- [nombre]{.verbatim}: identifikatzailea da.
- ["Alice"]{.verbatim}: gordetako balioa da.
- [console.log(nombre);]{.verbatim}: aldagaiaren erabilera

:::
::::::::::::::


Aldagai baten izenari **identifikatzaile** deitzen zaio, eta hainbat arau bete behar ditu. Honako hauek izan ditzake:

- Letrak.
- Digituak (hasieran izan ezik).
- Beheko marra (`_`).
- Dolar ikurra (`$`).

Logikoa denez, ezin dira [hitz erreserbatuak](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#reserved_words) erabili aldagaien identifikatzaile gisa. Garrantzitsua da jakitea, halaber, JavaScript *case sensitive* dela; beraz, [nombre]{.verbatim} eta [Nombre]{.verbatim} ez dira gauza bera.

::: errorbox
JavaScript *case sensitive* da. Kontuz identifikatzaileak erabiltzean.
:::


## Deklarazioa eta hasieratzea {#declaración-inicialización}

Garrantzitsua da bi kontzeptu bereiztea.

- **Aldagaia deklaratzea**: aldagaia sortzean datza. Oraindik ez du baliorik.
- **Aldagaia hasieratzea**: lehen aldiz balio bat esleitzean datza.
- Bi ekintzak aldi berean egin daitezke.


:::::::::::::: {.columns }
::: {.column width="33%"}

::: mycode
[Definitu]{.title}

```javascript
let edad;
```
:::

:::
::: {.column width="33%" }

::: mycode
[Balioa eman]{.title}

```javascript
edad = 20;
```
:::

:::
::: {.column width="33%" }

::: mycode
[Biak]{.title}

```javascript
let edad = 20;
```
:::

:::
::::::::::::::


## [let]{.verbatim}, [const]{.verbatim} eta [var]{.verbatim} arteko desberdintasunak {#diferencias-variables}

Aldagaiak deklaratzeko hiru hitz erreserbatu erabil ditzakegu:

- [let]{.verbatim}: Balioa alda daitekeen aldagaiak deklaratzeko gomendatutako modua da.
- [const]{.verbatim}: Konstante bat deklaratzen du. Konstante batek balio bat jaso behar du sortzen den unean. Konstante batek objektu edo array bat gordetzen duenean, konstante mantentzen dena **objektuaren erreferentzia** da, ez nahitaez haren edukia. Hitzarmen bidez, konstante batek balio finko global bat adierazten duenean, maiuskulaz idatzi ohi da.
- [var]{.verbatim}: ECMAScript 2015 baino lehen aldagaiak deklaratzeko erabiltzen zen, baina **ez da gomendatzen kode berrian erabiltzea**. Arrazoia da portaera desberdina duela aldagaien esparruari eta goratzeari (*[hoisting](https://developer.mozilla.org/es/docs/Glossary/Hoisting)*) dagokienez, eta horrek detektatzeko zailak diren akatsak eragin ditzake.



:::::::::::::: {.columns }
::: {.column width="33%"}

::: {.mycode size=footnotesize}
["let"-ekin]{.title}

```javascript
let contador = 0;
contador++;
contador++;
console.log(contador);
```
:::

:::
::: {.column width="36%" }

::: {.mycode size=footnotesize}
[Konstante]{.title}

```javascript
const PI = 3.141592;
PI = 3; // TypeError:
const letras = ["a", "b"];
// permitido
letras.push("c");
```
:::

:::
::: {.column width="33%" }

::: {.mycode size=footnotesize}
["var"-ekin]{.title}

```javascript
var nombre = "Ana";
```
:::

:::
::::::::::::::


## Aldagaien esparrua {#ámbito-variables}

**[Esparruak](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Grammar_and_types\#variable_scope)** (*scope*) zehazten du programaren zein ataletatik atzi daitekeen aldagai batera. Lau esparru daude:

- ***Global scope***: *script* moduan dagoen kode guztiaren esparru lehenetsia.
- ***Module scope***: moduluetako kodearen esparrua (aurrerago ikusiko dugu).
- ***Function scope***: funtzio beraren barruko esparrua.
- ***Block scope***: [let]{.verbatim} eta [const]{.verbatim} aldagaientzat, giltzen artean dagoen esparrua (a [bloke](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/block)).

Laburpen gisa, ondorengo taula erabil dezakegu:

|                          | **let**                    | **const**                        | **var**               |
|--------------------------|----------------------------|----------------------------------|-----------------------|
| Esparrua (scope)         | Blokea                     | Blokea                           | Funtzioa/Globala      |
| Berriro deklaratzea      | Bai                        | **Ez**                           | Bai                   |
| Berriro esleitzea        | Bai                        | Ez                               | Bai                   |
| Gomendatutako erabilera  | Aldatzen diren aldagaietarako | Balio finko edo erreferentzietarako | **Saihestu**          |

Table: {tablename=yukitblrcol colspec=XXXX}

::: errorbox
Garrantzitsua da aldagaien *scope*a kontuan hartzea, akatsak saihesteko.
:::

## Izenak jartzeko konbentzioa

JavaScript-ek hainbat izen erabiltzeko aukera ematen du, baina badira oso onartuak dauden konbentzioak.

- **[camelCase](https://en.wikipedia.org/wiki/Camel_case)**: **JavaScript-en erabiltzen den konbentzioa** da. Lehenengo hitza minuskulaz hasten da, eta hurrengoak maiuskulaz. Izenen adibideak: nombreCompleto, numeroAlumnos, fechaNacimiento, ...
- **[Snake_Case](https://en.wikipedia.org/wiki/Snake_case)**: Python-en, PHP-n, ... erabiltzen da. Izenen adibideak: nombre_completo, numero_alumnos, ...


Bestalde, aldagaien hizkuntza, iruzkinak nola idatzi... erabaki beharko genuke. Hori guztia programatzaileek erabiltzen duten hizkuntzaren, kodea argitaratuko den ala ez, eta abarren araberakoa izango da.

::: infobox
Garrantzitsuena konbentzio bat aukeratzea eta beti mantentzen saiatzea da.
:::


# Datu motak {#tipos-datos}

Programa batek kudeatzen duen informazio guztia **datu** moduan gordetzen da. JavaScript-ek hainbat datu motarekin lan egin dezake, hala nola zenbakiekin, testuekin, balio logikoekin, elementuen zerrendekin edo objektuekin. Datu mota desberdinak ezagutzea funtsezkoa da programa zuzenak idazteko eta akatsak saihesteko.

JavaScript **tipatze dinamikoko lengoaia** da; horrek esan nahi du aldagai bat deklaratzean ez dela beharrezkoa haren mota adieraztea. Javan edo C-n ez bezala, programatzaileak aldagaien mota adierazi behar baitu, JavaScript-en lengoaia bera arduratzen da mota automatikoki zehazteaz, esleitutako balioaren arabera.


## Mota primitiboak {#tipos-primitivos}

Beste programazio-lengoaia batzuek bezala, JavaScript-ek balio bat adierazten duten datu-mota primitibo batzuk ditu:

- [[Boolean]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Boolean): [true]{.verbatim} eta [false]{.verbatim} izan daitezkeen balioak soilik.
- [[null]{.verbatim}](https://developer.mozilla.org/en-US/docs/Glossary/Null): Balio nulua dela adierazten duen hitz berezia.
- [[undefined]{.verbatim}](https://developer.mozilla.org/en-US/docs/Glossary/Undefined): Oraindik deklaratu ez diren aldagaiei esleitzen zaien balio primitiboa.
- [[Number]{.verbatim}](https://developer.mozilla.org/en-US/docs/Glossary/Number): Zenbaki osoa edo koma mugikorreko zenbakia. Adibidez: [42]{.verbatim} edo [3.14159]{.verbatim}.
  - [[Infinity]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/POSITIVE_INFINITY) eta [[-Infinity]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/NEGATIVE_INFINITY) balioak sor ditzake; balio horiek izan daitezkeen [gehienezko](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/MAX_VALUE) eta [gutxieneko](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/MIN_VALUE) balioak adierazten dituzte.
  - [[NaN]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/NaN): *Not a Number*, datu mota bat zenbakia den jakiteko eragiketaren emaitza; kasu honetan, ez da zenbakia: [Number("hola")]{.verbatim}
- [[BigInt]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Data_structures#bigint_type): [zehaztasun arbitrarioko](https://es.wikipedia.org/wiki/Aritm%C3%A9tica_de_precisi%C3%B3n_arbitraria) zenbaki osoa. Adibidez: [9007199254740992n]{.verbatim}.
- [[String]{.verbatim}](https://developer.mozilla.org/en-US/docs/Glossary/String): Testu bat osatzen duten karaktereen sekuentzia. Honela idatz daiteke:
  - **Komatxo bakunak**: [\'hola\']{.verbatim}
  - **Komatxo bikoitzak**: ["hola"]{.verbatim}
  - **Alderantzizko komatxoak**: [\`hola\`]{.verbatim}
- [[Symbol]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol): Unibokoa eta aldaezina dela bermatzen duen datu mota.

::: exercisebox
[[04](https://github.com/yuki/ejercicios/blob/main/daw/dec/04.html)]{.solution}

Probatu orain arte deskribatutako datu-mota guztiak, [[symbol]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/Symbol) bereziki azpimarratuz.
:::


:::::::::::::: {.columns }
::: {.column width="50%"}

::: {.mycode}
[Datu-moten adibidea]{.title}
```javascript
let verdadero = true;
let falso = false;
let nulo = null;
let edad = 18;
let temperatura = 22.5;
let saldo = -150.75;
// Infinity
console.log(42 / 0);
// -Infinity
console.log(-42 / 0);
```
:::

:::
::: {.column width="50%" }

::: {.mycode}
[Datu-moten adibidea]{.title}
```javascript
let nombre = "Charlie";
let ciudad = 'Bilbao';
let saludo = `Hola`;
console.log("Hola "+nombre)
console.log("Hola %s",nombre)
console.log(`Hola ${nombre}`)
let edad;
// undefined
console.log(edad);
```
:::

:::
::::::::::::::


## Objektuak {#objetos-resumen}

Aurretik deskribatu ez diren gainerako datu-motak [[Object]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Data_structures#objects) motakoak dira. Horien artean funtzioak, array-ak, adierazpen erregularrak, [[Map]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map) edo Error motako objektuak egon daitezke.

Objektu baten adibidea honako hau izango litzateke:

::: mycode
[Object adibidea]{.title}
```javascript
const alumno = {
    nombre: "Alice",
    edad: 20,
    aprobado: true
};
console.log(alumno.nombre)
```
:::

Aurrerago, [Objektuak](#objetos) atalean sakonduko dugu.

## [typeof]{.verbatim} eragilea {#operador-typeof}

JavaScript-ek [[typeof]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/typeof) eragilea dauka, datu baten mota ezagutzeko aukera ematen duena.

::: {.mycode}
[[typeof]{.verbatim} operadorea]{.title}
```javascript
let nombre = "Bob";
typeof nombre;
```
:::


## Mota bihurketa {#conversión-tipos}

Askotan beharrezkoa da datu-mota bat beste batera bihurtzea; batzuetan aldi baterako, eta beste batzuetan behin betiko. Bihurketa esplizitua azalduko dugu, geroago eragileekin azalduko diren bihurketa inplizituen kasu batzuk baitaude.


:::::::::::::: {.columns }
::: {.column width="50%"}

::: {.mycode}
[Datuen bihurketa]{.title}
```javascript
let edad = Number("25");
//NaN
Number("Hola")
parseInt("123")
// 123
parseInt("123px")
parseInt(123.4)
parseFloat("12.75")
```
:::

:::
::: {.column width="50%" }

::: {.mycode}
[Datuen bihurketa]{.title}
```javascript
String(25)
String(true)
Boolean(1)
Boolean("123")
Boolean(0)
Boolean("")
Boolean(null)
Boolean(undefined)
Boolean(NaN)
```
:::

:::
::::::::::::::


::: exercisebox
[[05](https://github.com/yuki/ejercicios/blob/main/daw/dec/05.html)]{.solution}

Egin proba bat ikusitako mota-bihurketa desberdinekin.
:::


## [==]{.verbatim} eta [===]{.verbatim} arteko konparaketa

JavaScript-ek lehenespenez egiten dituen bihurketa automatikoen ondorioz, konparaketa-eragileak bereziki eragiten ditu. Horren ondorioz, batzuetan nahi ez ditugun akatsak izan ditzakegu gure kodean:

::: exercisebox
[[06a](https://github.com/yuki/ejercicios/blob/main/daw/dec/06a.html)]{.solution}

Zein emaitza ematen dituzte ondorengo eragiketek?

- [5 == 5]{.verbatim}
- [5 == "5"]{.verbatim}
- [1 == true]{.verbatim}
- [0 == false]{.verbatim}
:::

Bihurketa automatikoak saihesteko, [[===]{.verbatim} edo *strict equality*](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Strict_equality) eragilea dago. Eragile horrek **Boolean** bat itzultzen du, eta bai balioa bai datu-mota hartzen ditu kontuan.

::: exercisebox
[[06b](https://github.com/yuki/ejercicios/blob/main/daw/dec/06b.html)]{.solution}

Zein emaitza ematen dituzte ondorengo eragiketek?

- [5 === 5]{.verbatim}
- [5 === "5"]{.verbatim}
- [1 === true]{.verbatim}
- [0 === false]{.verbatim}
- [Symbol(42) === Symbol(42)]{.verbatim}
- [typeof Symbol(42) === typeof Symbol(42)]{.verbatim}
:::

Ezeztapen-eragilea [[!==]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Strict_inequality) da.

::: warnbox
Konparaketak egiterakoan [===]{.verbatim} erabiltzea gomendatzen da.
:::


# Eragileak {#operadores}

Eragileek balio baten edo gehiagoren gainean eragiketak egiteko aukera ematen dute. Horiei esker, kalkulu matematikoak egin, datuak konparatu, baldintzak konbinatu, balioak esleitu edo aldagaiak aldatu daitezke. Ez ditugu guztiak aztertuko, asko baitira, baina guztiak [MDNren dokumentazioan](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Expressions_and_operators) aurki daitezke, eta "familien" arabera bereizita daude (esleipenekoak, konparaketakoak, aritmetikoak...).

## Eragile aritmetikoak {#operadores-aritméticos}

Eragile aritmetikoek eragiketa matematikoak egiteko aukera ematen dute.

| Eragilea | Deskribapena | Adibidea |
|:----------:|:-------------:|:---------:|
| `+` | Batuketa | `5 + 2` |
| `-` | Kenketa | `5 - 2` |
| `*` | Biderketa | `5 * 2` |
| `/` | Zatiketa | `5 / 2` |
| `%` | Zatiketaren hondarra | `5 % 2` |
| `**` | Berreketa | `5 ** 2` |


## Esleipen-eragileak {#operadores-asignación}

Aldagai batean balio bat gordetzeko aukera ematen dute. Erabiliena [=]{.verbatim} eragilea bada ere, eragiketak modu laburtuan idazteko aukera ematen diguten beste eragile batzuk ere badaude.

| Eragilea | Honen baliokidea |
|----------|------------|
| `+=` | `x = x + valor` |
| `-=` | `x = x - valor` |
| `*=` | `x = x * valor` |
| `/=` | `x = x / valor` |
| `%=` | `x = x % valor` |
| `**=` | `x = x ** valor` |


::: exercisebox
[[07a](https://github.com/yuki/ejercicios/blob/main/daw/dec/07a.html)]{.solution}

Idatzi aurreko esleipen bakoitzaren adibide bat.
:::


## Gehikuntza eta txikitze-eragileak {#operadores-incremento-decremento}

Aldagai bat unitate batean handitzeko edo txikitzeko aukera ematen dute. Aldagaiaren aurretik edo ondoren jar daitezke, eta kokatzen diren lekuaren arabera haien portaera aldatu egiten da.

:::::::::::::: {.columns }
::: {.column width="50%"}

::: mycode
[Gehitu]{.title}

```javascript
let x = 5;
x++;
console.log(x++);
console.log(++x);
```
:::

:::
::: {.column width="50%" }

::: mycode
[Kendu]{.title}
```javascript
let x = 5;
x--;
console.log(x--);
console.log(--x);
```
:::

:::
::::::::::::::

::: exercisebox
[[07b](https://github.com/yuki/ejercicios/blob/main/daw/dec/07b.html)]{.solution}

Zein da aurreko kodearen emaitza?
:::


## Konparaketa-eragileak {#operadores-comparación}

Bi balio konparatzeko aukera ematen dute. Emaitza beti balio boolearra da: [true]{.verbatim} edo [false]{.verbatim}.

| Eragilea | Esanahia |
|----------|-------------|
| [>]{.verbatim} | Handiagoa |
| [<]{.verbatim} | Txikiagoa |
| [>=]{.verbatim} | Handiagoa edo berdina |
| [<=]{.verbatim} | Txikiagoa edo berdina |
| [==]{.verbatim} | Berdina (bihurketa automatikoarekin) |
| [!=]{.verbatim} | Desberdina (bihurketa automatikoarekin) |
| [===]{.verbatim} | Berdintasun zorrotza |
| [!==]{.verbatim} | Desberdintasun zorrotza |


::: warnbox
Aurreko atalean ikusi dugun bezala, [===]{.verbatim} eta [!==]{.verbatim} erabiltzea gomendatzen da.
:::



## Eragile logikoak {#operadores-lógicos}

Hainbat baldintza konbinatzeko aukera ematen dute. Aurrerago erabiliko ditugu baldintzazko sententzien atalean.

| Eragilea | Esanahia |
|----------|-------------|
| `&&` | Eta logikoa (AND) |
| `||` | Edo logikoa (OR) |
| [!]{.verbatim} | Ezeztapena (NOT) |


## Kateatzeko eragilea {#operador-concatenación}

[+]{.verbatim} eragilea testu-kateak elkartzeko ere erabil daiteke, baina gaur egun normalean nahiago izaten da *[template literals](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Template_literals)* erabiltzea.

::: mycode
[Testua kateatzea]{.title}

```javascript
const nombre = "John";
const apellido = "Doe";
console.log(nombre + " " + apellido);
// mejor así
console.log(`Hola ${nombre} ${apellido}`);
```
:::

## Ezkerreko balioa nulua bada esleitzeko eragilea [??]{.verbatim} {#operador-asignacion-izquierda-nula}

*[nullish coalescing assignment](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Nullish_coalescing_assignment)* eragilea dago. Eskuineko datua soilik hartzen du ezkerrekoak [null]{.verbatim} edo [undefined]{.verbatim} balio duenean.

::: mycode
[Nullish coalescing assignment]{.title}

```javascript
const a = { duration: 50 };
a.speed ??= 25;
console.log(a.speed);
// Salida esperada: 25

a.duration ??= 10;
console.log(a.duration);
// Salida esperada: 50
```
:::

Eragile horrek existitzen ez diren balioekin lotutako akats asko saihesten ditu.


# Datuen sarrera eta irteera {#entrada-salida-datos}

Programa orok erabiltzailearekin komunikatu behar du, eta normalean komunikazio horrek honako hauek hartzen ditu barne:

- Informazioa erakustea.
- Datuak eskatzea.
- Akats-mezuak erakustea.
- Ekintza bat berrestea.

JavaScript-en hainbat mekanismo daude zeregin horiek egiteko. Hasiera batean Web formatuan izan beharko lukeen arren, hasteko beste modu batzuk ikusiko ditugu, eta horrela *debugging* egiteko ere erabili ahal izango ditugu.

## Kontsolaren bidezko irteera {#salida-consola}

Garapenean zehar ohikoena nabigatzailearen kontsola erabiltzea da. Orain arte erabiltzen ari garen funtzioa da, eta gehien erabiltzen dena. *log* formatuaz gain, ondoren zehazten diren beste metodo batzuk ere erabil ditzakegu:


Azken bi metodoetan, nabigatzaile batzuek kolore edo ikono desberdinak erabiliz erakusten dituzte.


## Datuak eskatzea [prompt()]{.verbatim} bidez {#solicitar-datos}

[prompt()]{.verbatim} funtzioak erabiltzaileari informazioa eskatzen dion leiho bat erakusten du. Erabiltzaileak balioa idatzi eta **Onartu** botoia sakatu beharko du. Balioa aldagai batean gorde beharko da.


[prompt()]{.verbatim} funtzioak **beti testu-kate bat itzultzen du**.


Gaur egun funtzio hau ez da erabiltzen, hainbat eragozpen baititu eta haren funtzionalitatea inprimakien bidez lor baitaiteke:

- Programaren exekuzioa eteten dute.
- Orriaren interakzioa blokeatzen dute.
- Itxura nabigatzailearen araberakoa da.
- Ezin dira pertsonalizatu.

::: exercisebox
[[08](https://github.com/yuki/ejercicios/blob/main/daw/dec/08.html)]{.solution}

Eskatu [prompt()]{.verbatim} bidez izen-abizenak, eta erabili kontsola datuak *template literals* erabiliz erakusteko.
:::

## Mezuak [alert()]{.verbatim} bidez erakustea {#mostrar-mensajes-alert}

[alert()]{.verbatim} funtzioak mezu bat duen leiho bat erakusten du. Programa geldituta geratzen da erabiltzaileak onartzeko botoia sakatu arte. Gaur egun ia ez da erabiltzen, [prompt()]{.verbatim} funtzioaren arrazoi berberengatik.

::: mycode
[alert metodoa]{.title}
```javascript
alert("Bienvenido");
```
:::


## Egiaztapena [confirm()]{.verbatim} bidez eskatzea {#uso-confirm}

[confirm()]{.verbatim} funtzioak bi botoi dituen galdera bat erakusten du, *Onartu* edo *Utzi* aukeratzeko, eta *boolean* balio bat itzultzen du.

::: mycode
[confirm metodoa]{.title}
```javascript
const borrar = confirm("¿Desea eliminar el registro?");
```
:::

Berriro ere, ia erabiltzen ez den funtzioa da, ohikoa baita *modals* erabiltzea.

## Informazioa orrian erakustea

Kontsolaz gain, JavaScript-ek web-orri baten edukia alda dezake. Aurrerago sakonago aztertuko dugu, baina ondorengo adibidea aurrerapen gisa erabil dezakegu.

:::::::::::::: {.columns }
::: {.column width="35%"}

::: {.mycode size=footnotesize}
[index.html]{.title}
```html
<p id="mensaje"></p>
```
:::

:::
::: {.column width="65%" }

::: {.mycode size=scriptsize}
[Código js/app.js]{.title}
```javascript
document.getElementById("mensaje").textContent = "Hola!";
```
:::

:::
::::::::::::::


<!-- 

---

# Encadenamiento opcional (`?.`)

Permite acceder a propiedades de un objeto sin producir un error cuando dicho objeto no existe.

```javascript
const usuario = null;

console.log(usuario?.nombre);
```

Resultado:

```
undefined
```

Sin este operador el programa produciría una excepción.

Es una característica incorporada en JavaScript moderno y ampliamente utilizada.

---

# Operador de propagación (`...`)

Permite expandir el contenido de un array u objeto.

```javascript
const numeros = [1, 2, 3];

const copia = [...numeros];

console.log(copia);
```

Resultado:

```
[1, 2, 3]
```

También se utiliza para combinar arrays y objetos.

Estudiaremos este operador con mayor profundidad en unidades posteriores.


 -->