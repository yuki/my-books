
# CSSren historia {#historia-css}

World Wide Web-aren lehen urteetan, web-orriak gaur egungoen oso bestelakoak ziren. Haien helburu nagusia ikertzaileen artean informazioa eta dokumentuak partekatzea zen; beraz, itxura bisualak bigarren mailako garrantzia zuen.

## HTMLren arazoa {#problema-html}

HTML dokumentu baten egitura deskribatzeko sortu zen, ez haren itxura deskribatzeko. Horrela, edukia izenburuen, paragrafoen, zerrenden eta esteken bidez defini zitekeen, baina dokumentuaren aurkezpena kontrolatzeko aukera gutxi eskaintzen zituen. Horren ondorioz, orrialde gehienek oso antzeko itxura zuten: atzeko plano grisa, testu beltza, esteka urdinak eta oso banaketa sinplea.

Internet ezagun egiten hasi zen heinean, enpresek eta erakundeek itxura erakargarriagoa eta bereiziagoa zuten web-orriak sortu nahi izan zituzten. Hala ere, HTML ez zegoen horretarako diseinatuta. Ez zegoen honako alderdi hauek definitzeko mekanismorik:

- Koloreak.
- Marjinak.
- Tipografiak.
- Tarteak.
- Elementuen kokapena.

## Aurkezpen-etiketen etorrera

Diseinatzaileek orrien itxura kontrolatu nahi zutenez, nabigatzaileak aurkezpenarekin lotutako HTML etiketak txertatzen hasi ziren, hala nola: [<font>]{.verbatim}, [<center>]{.verbatim}, [<big>]{.verbatim} ...

Etiketa horiek arazoa neurri batean konpontzen zuten, baina beste arazo batzuk sortzen zituzten. Adibidez, letra-tipoa gehitu nahi bagenuen, testu guztietan zehaztu behar genuen. Gainera, edukia eta aurkezpena nahastu egiten ziren, mantentze-lanak garestiak ziren eta nabigatzaile bakoitzak etiketa batzuk modu desberdinean interpretatzen zituen, edo zuzenean ez zituen interpretatzen.

## CSSren sorrera {#nacimiento-css}

Arazo horiek konpontzeko, 1994an [Håkon Wium Lie](https://en.wikipedia.org/wiki/H%C3%A5kon_Wium_Lie) informatikari norvegiarrak ***Cascading Style Sheets*** izeneko hizkuntza berria proposatu zuen, **CSS** siglez ezagunagoa. Haren proposamena bi alderdi desberdin erabat bereiztean oinarritzen zen:

* **HTML** edukiaren eta egituraren deskribapenaz arduratuko zen.
* **CSS** itxura soilik definitzeaz arduratuko zen.

Ideia oso ondo hartu zen eta, [Bert Bos](https://en.wikipedia.org/wiki/Bert_Bos) bezalako beste kolaboratzaile batzuekin batera, W3Cren estandar bihurtu arte garatu zen. 1996ko abenduan, lehenengo gomendio ofiziala argitaratu zen: **CSS Level 1 (CSS1)**. Hainbat alderdi aldatzeko aukera ematen zuen, besteak beste:

- Koloreak.
- Tipografiak.
- Marjinak.
- Koskak.
- Testuaren lerrokatzea.
- Atzeko planoak.

## CSS2 {#css2}

1998an **CSS2** agertu zen, eta hobekuntza ugari ekarri zituen. Horien artean, honako hauek nabarmentzen ziren:

- Posizionamendu absolutua.
- Posizionamendu erlatiboa.
- Euskarri-motak (pantaila, inprimaketa...).
- Geruzak.
- Hautatzaile berriak.
- Taula osatuagoak.

CSS2ri esker, diseinu askoz konplexuagoak garatzen hasi ziren. Hala ere, nabigatzaileek oraindik alde handiak zituzten inplementazioan. Urte askotan ohikoa izan zen web-orri batek nabigatzaile batean behar bezala funtzionatzea eta beste batean erroreak erakustea.


## CSS3: eboluzionatzeko modu berri bat {#css3}

Zehaztapen erraldoi bakarra sortu beharrean, W3Ck CSS modulu txiki eta independenteetan banatzea erabaki zuen. Nahiz eta herri mailan CSS3-ri buruz hitz egiten dugun, egia esan, ez dago "CSS3" izeneko dokumentu ofizialik. Gaur egun, CSS modulu ugarik osatzen dute, eta bakoitzak bere garapen-erritmoa du. Hona hemen adibide batzuk:

- Hautatzaileak.
- Atzeko planoak eta ertzak.
- Animazioak.
- Trantsizioak.
- Flexbox.
- Grid Layout.
- CSS aldagaiak.
- Media Queries.

Sistema horri esker, funtzionalitate berriak txerta daitezke urteak itxaron behar izan gabe bertsio oso berri bat argitaratzeko.

## CSSren aurreprozesadoreen sorrera {#preprocesadores-css}

Muga horiek gainditzeko, CSSren aurreprozesadore izenekoak agertu ziren. Aurreprozesadore batek CSS estandarra baino hizkuntza ahaltsuago eta erosoago batean idazteko aukera ematen du, eta ondoren automatikoki CSS estandar bihurtzen da. Bi aurreprozesadore ezagunenak hauek dira:

- [SASS](https://en.wikipedia.org/wiki/Sass_(style_sheet_language)): 2006an sortu zen eta aldagaiak, habiaratzea, mixins sistema (funtzio gisa defini daiteke) kodea errepikatu behar ez izateko, herentzia, begiztak... sortzeko aukera ematen du.
- [LESS](https://es.wikipedia.org/wiki/LESS_(lenguaje_de_hojas_de_estilo)): 2009an sortu zen, SASSen inspirazioan oinarrituta, eta abantaila nagusia da JavaScript bidez nabigatzailean exekuta daitekeela, aurretik aurreprozesatu beharrik gabe.

Duela urte batzuk arte, ia proiektu handi guztiek SASS edo LESS erabiltzen zuten barnean, honako hauek ahalbidetzen baitzituzten:

- Kodea errepikatzea murriztea.
- Proiektu handiak antolatzea.
- Osagaiak berrerabiltzea.
- Mantentze-lanak erraztea.
- Taldean lan egitea.
- Zereginak automatizatzea.

Garai hartan, CSSk oraindik ez zituen ezaugarri horietako asko.

Denborarekin, CSSk hainbat funtzio txertatu ditu, hala nola aldagaiak, hautatzaile berriak, zenbait funtzio matematiko... Ondorioz, proiektu txiki eta ertain asko CSS soilik erabiliz gara daitezke.

Hala ere, SASSek oso erabilia izaten jarraitzen du proiektu handietan, kodearen antolaketarekin eta estiloak berrerabiltzearekin lotutako abantailak eskaintzen jarraitzen duelako.


## CSS gaur egun {#css-actualidad}

Gaur egun, CSS oso hizkuntza ahaltsua da, etengabe eboluzionatzen ari dena, eta hainbat enpresak parte hartzen dute ezaugarri berriak proposatzeko eta gehitzeko.


# CSS HTML orri batean gehitzea {#añadir-css-pagina-html}

HTML orri batek estilo-orri bat erabili ahal izateko, nabigatzaileari CSS fitxategia non dagoen adierazi behar zaio. Modurik ohikoena [<link>]{.verbatim} elementua HTML dokumentuaren [<head>]{.verbatim} atalaren barruan erabiltzea da.

::: mycode
[Gehitu CSS HTML orrialde batean]{.title}

```html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Mi primera página con CSS</title>
    <link rel="stylesheet" href="css/estilos.css">
</head>
<body>
    <h1>Hola mundo</h1>
</body>
</html>
```
:::

Adibide honetan, nabigatzaileak [css]{.configdir} karpetaren barruan dagoen [estilos.css]{.configfile} fitxategia kargatzen du, ****orria erakutsi aurretik****. [rel="stylesheet"]{.verbatim} atributuak estekatutako fitxategia estilo-orri bat dela adierazten du; [href]{.verbatim} atributuak, berriz, CSS fitxategiaren bidea zehazten du.


## Hainbat estilo-orri txertatzea {#añadir-varias-hojas}

Benetako proiektuetan, oso ohikoa da CSS kodea hainbat fitxategitan banatzea, haren mantentze-lanak errazteko. Kasu horretan, nabigatzaileak estilo-orri guztiak deskargatu eta aplikatuko ditu agertzen diren ordenan. Hainbat estilo-orrik elementu beraren propietate bera aldatzen dutenean, **kargatzen diren ordenak azken emaitzan eragina izan dezake**.

::: mycode
[Gehitu CSS bat baino gehiago HTML batean]{.title}

```html
<head>
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/estilos.css">
    <link rel="stylesheet" href="css/titulos.css">
</head>
```
:::

Aurreko adibidearekin jarraituz, demagun honako kode hau dutela:

:::::::::::::: {.columns }
::: {.column width="50%"}

::: mycode
[estilos.css]{.title}
```css
h1 {
    color: blue;
}
```
:::

:::
::: {.column width="50%" }

::: mycode
[titulos.css]{.title}
```css
h1 {
    color: red;
}
```
:::

:::
::::::::::::::


Izenburuaren azken kolorea **gorria** izango da, bigarren estilo-orriak lehenengoa gainidazten duelako. Portaera hori **[kaskada](#cascada)** (*cascade*) izenez ezagutzen den mekanismoaren parte da, eta aurrerago zehatz-mehatz aztertuko dugu.

::: errorbox
Fitxategiak kargatzeko ordena garrantzitsua da.
:::

Ez dago proiektu batek izan behar duen CSS fitxategi kopuru finkorik. Aplikazio txikietan, estilo-orri bakarra nahikoa izan ohi da, baina proiektua handitzen den heinean, ohikoa da kodea hainbat fitxategitan banatzea, haien funtzioaren arabera.

::: exercisebox
[[01](https://github.com/yuki/ejercicios/blob/main/daw/diw/01.html)]{.solution}

Kargatu bi CSS fitxategi eta egiaztatu ordenaren garrantzia, aurreko ariketan agertzen den bezala.
:::


## Barneko CSS {#css-interno}

CSS estiloak zuzenean HTML orri baten barruan idatz daitezke [<style>]{.verbatim} etiketak erabiliz, eta goiburuko [<head>]{.verbatim} atalaren barruan egon behar dute.

::: mycode
[HTML+CSS inline]{.title}

```html
<html>
  <head>
    <style>
      body {
        background-color: linen;
      }  
      h1 {
        color: maroon;
        margin-left: 40px;
      }
    </style>
  </head>
  <body>
    <!-- ... -->
  </body>
</html>
```
:::

::: errorbox
Ez da gomendatzen CSS barnekoa HTML baten barruan erabiltzea.
:::

HTML bateratuak sortzeko sistemak daude (HTML auto-edukiak sortzeko), webgune estatikoak sortzeko, baina garapenean zehar ****ez da CSS HTMLaren barruan erabili behar****.


## CSS estiloak *inline* {#estilos-css-inline}

HTML kodearen barruan CSS estiloak erabil daitezke; horiei *inline* estiloak esaten zaie. Teknika hau oso erabilia zen webaren hasieran, baina **ez da erabiltzea gomendatzen**, CSS estiloen berrerabilpenaren aurka egiten duelako.

Horrez gain, maketazioaren eta estiloen arteko bereizketaren aurka ere egiten du, eta horrek zaildu egin dezake osagaiak aplikazio bereko atal desberdinetan berrerabiltzea. Hurrengo adibidean *inline* estilo baten adibidea eta HTML eta CSS bereizita nola egingo litzatekeen ikus daitezke:

:::::::::::::: {.columns columnsep=0.5cm}
::: {.column width="33%"}

::: mycode
[HTML+CSS inline]{.title}

```html
<p style="
 color: red;
 font-style: italic;
">
    Texto
</p>
```
:::

:::
::: {.column width="33%" }

::: mycode
[HTML]{.title}
```html
<p class="special">
    Texto
</p>
```
:::

:::
::: {.column width="33%" }

::: mycode
[CSS]{.title}
```css
.scpecial {
  color: red;
  font-style: italic;
}
```
:::

:::
::::::::::::::

Lehenengo adibidean, estilo bera duen beste [p]{.verbatim} bat nahi izanez gero, estilo hori berriro idatzi beharko litzateke; bereizketa erabiliz, berriz, klasea jartzea baino ez litzateke beharrezkoa izango. Lehenengo adibidean estilo berri bat gehitu nahi badugu, hainbat lekutan aldatu beharko genuke; bereizketa erabiliz, berriz, CSS estilo-orrian egitea baino ez litzateke beharrezkoa izango.

::: errorbox
Ez da gomendatzen *inline* estiloak erabiltzea.
:::


## CSSren garrantziaren adibideak {#ejemplos-importancia-css}

CSS estilo-orriek aukera ematen digute web-orri baten itxura erabat aldatzeko, estilo-orria aldatuta. Pentsa dezagun enpresa batek hainbat bezerorentzat online denda-produktu bat duela.

- CSS estiloak *inline* badaude, bezero bakoitzarentzat estiloak aldatzeak honako hauek ekarriko lituzke:
  - Iturburu-kode osoa kopiatzea.
  - *Inline* estiloak aldatzea.
  - Ezaugarri berri bat gehitu nahi badugu, bezero bakoitzean aldatu beharko litzateke.
  - *Inline* estiloak berriro aldatzea.
- CSS estiloak HTMLtik bereizita badaude:
  - Bezero bakoitzarentzat CSSaren kopia bat egiten da eta estilo propioekin aldatzen da.
  - Ezaugarri berri bat gehitu nahi badugu, bezero bakoitzean HTMLa soilik eguneratzen da.


Jarraian, HTML kode beraren adibide bat ikus daiteke, CSS estilo-orri desberdinekin. Adibideak [W3Schools](https://www.w3schools.com/css/css_intro.asp) webgunetik lortuak dira.

:::::::::::::: {.columns columnsep=0.5cm}
::: {.column width="50%"}

![Estilo gabe](img/diw/ejemplo-1.png){width=100% framed=true}

:::
::: {.column width="50%" }

![Adibide 1](img/diw/ejemplo-2.png){width=100% framed=true}


:::
::::::::::::::

:::::::::::::: {.columns columnsep=0.5cm}
::: {.column width="50%"}

![Adibide 2](img/diw/ejemplo-3.png){width=100% framed=true}

:::
::: {.column width="50%" }

![Adibide 3](img/diw/ejemplo-4.png){width=100% framed=true}


:::
::::::::::::::


# CSSren sintaxia {#sintaxis-css}

CSSk sintaxi sinplea eta ikasteko nahiko erraza du. Beste programazio-lengoaia batzuek ez bezala, CSSk ez du kontrol-egiturarik, hala nola begiztarik edo baldintzarik (nahiz eta aurrerago aztertuko ditugun funtzioak eta arau aurreratuak badituen). Haren funtzio nagusia **HTML elementuak nola erakutsi behar diren** adieraztea da.

## CSS araua {#regla-css}

Estilo-orri bat **CSS arau** multzo batek osatzen du. Arau bakoitzak honako hauek adierazten ditu:

- Zer elementu aldatu behar diren.
- Zer propietate aldatu behar diren.
- Zer balio esleitu behar zaion propietate bakoitzari.

Egitura orokorra honako hau da:

:::::::::::::: {.columns }
::: {.column width="50%"}

::: mycode
[Egitura]{.title}
```css
selector {
    propiedad: valor;
}
```
:::

:::
::: {.column width="50%" }

::: mycode
[Adibide erreala]{.title}
```css
h1 {
    color: red;
}
```
:::

:::
::::::::::::::

Arau horrek adierazten du [<h1>]{.verbatim} elementu guztiak gorriz erakutsi behar direla.


### Hautatzailea {#selector}

Hautatzaileak adierazten du **zein HTML elementuri** eragingo dion arauak. Hurrengo taulan adibide gutxi batzuk baino ez dira agertzen, baina [eranskinean](#etiquetas-html) hautatzaile gisa erabil daitezkeen HTML etiketa guztiak agertzen dira.

| Hautatzailea | Funtzioa |
|-----------|---------|
| h1 | 1. mailako izenburuak |
| h2 | 2. mailako izenburuak |
| p | Paragrafoak |
| ul | Ordenatu gabeko zerrenda |



### Propietateak {#propiedades}

Propietateek aldatu nahi dugun itxura-alderdia adierazten dute. Ehunka propietate desberdin daude. Gehien erabiltzen direnetako batzuk hauek dira:

| Propietatea | Funtzioa |
|-----------|---------|
| [color]{.verbatim} | Testuaren kolorea |
| [background-color]{.verbatim} | Atzeko planoaren kolorea |
| [font-size]{.verbatim} | Testuaren tamaina |
| [font-family]{.verbatim} | Tipografia |
| [width]{.verbatim} | Zabalera |
| [height]{.verbatim} | Altuera |
| [margin]{.verbatim} | Kanpoko marjina |
| [padding]{.verbatim} | Barneko tartea |
| [border]{.verbatim} | Ertza |
| [text-align]{.verbatim} | Testuaren lerrokatzea |

Propietate bakoitzak balio jakin batzuk soilik onartzen ditu; garrantzitsuenak ikasiko ditugu.


### Balioak {#valores}

Propietate bakoitzak balio bat behar du. Propietatearen arabera, balio hori honako hauetako bat izan daiteke:

| Balioa | Adibidea |
|-----------|---------|
| Kolore bat | [color:red;]{.verbatim} |
| Zenbaki bat | [font-size: 20px;]{.verbatim} |
| Luzera bat | [font-size: 2rem;]{.verbatim} |
| Ehuneko bat | [width: 80%;]{.verbatim}  |
| Gako-hitz bat | [display: flex;]{.verbatim} |
| Funtzio bat | [width: calc(100% - 50px);]{.verbatim} |




## Adierazpenak {#declaraciones}

Propietate batek eta balio batek osatutako bikote bakoitzari **adierazpen** esaten zaio. Arau berak hainbat adierazpen izan ditzake. Hurrengo adibidean hiru daude:


::: mycode
[Adibide erreala]{.title}
```css
h1 {
    color: blue;
    font-size: 40px;
    text-align: center;
}
```
:::

Giltzen artean dagoen adierazpen multzoari **adierazpen-bloke** esaten zaio.


## Iruzkinak {#comentarios}

Iruzkinek kodeari informazioa gehitzeko aukera ematen dute, nabigatzaileak informazio hori interpretatu gabe. Lerro bakarrekoak edo hainbat lerrotakoak izan daitezke:


:::::::::::::: {.columns }
::: {.column width="50%"}

::: mycode
[Komentario]{.title}
```css
/* Estilos generales */
body {
    margin: 0;
}
```
:::

:::
::: {.column width="50%" }

::: mycode
[Komentario lerro askotan]{.title}
```css
/*
  Curso: DAW
  Fecha: Septiembre de 2026
*/
```
:::

:::
::::::::::::::



## Maiuskulen eta minuskulen arteko bereizketa {#sensibilidad-mayúsculas-minúsculas}

Bai propietateen izenak, bai gako-hitzak, minuskulaz idatzi behar dira. Nabigatzaile batzuek aldaera jakin batzuk onartzen dituzten arren, beti gomendatzen da lengoaiaren konbentzioei jarraitzea.



## Zuriuneak {#espacios-en-blanco}

CSSk ez ditu kontuan hartzen beharrezkoak ez diren zuriuneak. Hurrengo arauak baliokideak dira.

:::::::::::::: {.columns columnsep="0.5cm"}
::: {.column width="31%"}

::: mycode
[Ignora espacios]{.title}
```css
h1 {
color:red;
}
```
:::

:::
::: {.column width="31%" }

::: mycode
[Ignora espacios]{.title}
```css
h1 {
  color:red;
}
```
:::

:::
::: {.column width="38%" }

::: mycode
[Ignora espacios]{.title}
```css
h1 {   color:red;     }
```
:::

:::
::::::::::::::

Guztiek emaitza bera sortzen dute, baina bigarrena bakarrik da erraz irakurtzeko modukoa.


## Koska (*indentation*) {#indentation}

Koskatzean, kodea zertxobait eskuinerantz desplazatzen da haren egitura erakusteko. CSSk koska erabili gabe behar bezala funtzionatzen badu ere, koska uniformea erabiltzeak irakurgarritasuna asko hobetzen du. Editore gehienek zeregin hori automatikoki egiten dute. Bi edo lau zuriune erabiltzea aukera dezakegu.


## Puntu eta koma {#punto-y-coma}

Adierazpen bakoitza puntu eta koma baten bidez amaitzen da **;**. Arau batek hainbat adierazpen dituenean, puntu eta koma nahitaezkoa da.


## Zer gertatzen da errore bat dagoenean? {#ocurre-error}

CSSren ezaugarri oso garrantzitsu bat da nabigatzaileak estilo-orria interpretatzen jarraitzen saiatzen direla, erroreak aurkitzen badituzte ere.

::: mycode
[Errore]{.title}
```css
h1 {
    color: blue;
    colr: red;
    font-size: 40px;
}
```
:::


Kasu honetan:

- [color: blue;]{.verbatim} behar bezala aplikatuko da.
- [colr: red;]{.verbatim} ez ikusi egingo zaio.
- [font-size: 40px;]{.verbatim} normaltasunez aplikatuko da berriro.

Portaera horri esker, errore txikiek ez dute orria bistaratzea eragozten.


## Propietateen ordena {#orden-propiedades}

CSSk ez du propietateak ordena jakin bati jarraituz idaztera behartzen. Hurrengoek emaitza bera sortzen dute:

:::::::::::::: {.columns }
::: {.column width="50%" }

::: mycode
[Ordena]{.title}
```css
h1 {
    color: blue;
    margin: 20px;
    font-size: 30px;
}
```
:::

:::
::: {.column width="50%" }

::: mycode
[Ordena]{.title}
```css
h1 {
    font-size: 30px;
    margin: 20px;
    color: blue;
}
```
:::

:::
::::::::::::::


Hala ere, proiektu profesionaletan, normalean ordena jakin bati jarraitzen zaio irakurketa errazteko.

1. Posizionamendua.
2. Kaxa-eredua.
3. Tipografia.
4. Koloreak.
5. Animazioak.

Beti irizpide bera mantentzeak kodearen mantentze-lanak hobetzen ditu.

::: infobox
Garapen-talde batean formatu, ordena eta koska bera erabili beharko lirateke.
:::


# CSS hautatzaileak {#selectores-css}

CSS arau batek adierazi behar du zein HTML elementuri aplikatu behar zaion. Horretarako, **hautatzaileak** erabiltzen dira. Hautatzailea CSS arau baten zatia da, eta aldatu nahi ditugun elementuak identifikatzeko aukera ematen du.

Hautatzaileak CSSren oinarrizko ataletako bat dira, HTML dokumentu bateko elementu desberdinei estilo desberdinak aplikatzeko aukera ematen baitute, eta hainbat ataletan bereiz daitezke.


## Mota-hautatzailea {#selector-tipo}

Mota-hautatzaileak **mota jakin bateko HTML elementu guztiak** hautatzeko aukera ematen du.

:::::::::::::: {.columns }
::: {.column width="50%"}

::: mycode
[HTML]{.title}
```html
<p>Primer párrafo.</p>
<p>Segundo párrafo.</p>
<p>Tercer párrafo.</p>
```
:::

:::
::: {.column width="50%" }

::: mycode
[CSS]{.title}
```css
p {
    color: blue;
}
```
:::

:::
::::::::::::::


Aurreko adibidea kontuan hartuta, CSS-k [<p>]{.verbatim} motako elementu guztiak hautatzen ditu, testuari kolore urdina gehituz.

Mota hautatzaileak sinpleak dira, baina oso orokorrak izan daitezke behar denean estilo desberdinak aplikatu elementu beraren mota berean.


## Hautatzaile unibertsala {#selector-universal}

Hautatzaile unibertsala izartxo batez ([*]{.verbatim}) irudikatzen da eta dokumentuko elementu guztiak hautatzen ditu.


::: mycode
[CSS]{.title}
```css
* {
    margin: 0;
    box-sizing: border-box;
}
```
:::

Hautatzaile unibertsala maiz erabiltzen da doikuntza orokor txikiak egiteko. Nahiz eta erabilgarria izan, ez da komeni gehiegikeriaz erabiltzea elementu guztiei propietate asko aplikatzeko, erredundantzia sortu eta mantentzea zaildu ahal baitu.


::: exercisebox
[[02a](https://github.com/yuki/ejercicios/blob/main/daw/diw/02a.html)]{.solution}

Sortu HTML bat [h1]{.verbatim} eta [p]{.verbatim} elementuekin eta sortu CSS bat hautatzaile unibertsala erabiliz, marjina kendu eta elementu guztiei ertza gehitzeko.
:::


## Klase hautatzailea {#selector-clase}

Klase hautatzaileek estiloak aplikatu ahal dituzte elementu jakin batzuei, mota bereko elementu guztiak eragin gabe. HTMLn [class]{.verbatim} atributua erabiltzen da.


:::::::::::::: {.columns }
::: {.column width="50%"}

::: mycode
[HTML]{.title}

```html
<h1 class="importante grande">
  Izenburu garrantzitsua
</h1>

<p class="importante">
  Testu hau garrantzitsua da.
</p>

<p class="grande">
  Testu hau handia da.
</p>
```
:::

:::
::: {.column width="50%" }

::: mycode
[CSS]{.title}
```css
.importante {
  color: red;
}

.grande {
  font-size: 50px;
}
```
:::

:::
::::::::::::::

CSSn, klase bat hautatzeko puntu bat ([.]{.verbatim}) erabiltzen da, klasearen izena jarraituta. Klase bat hainbat aldiz erabil daiteke eta elementu desberdinetan, beraz, hori kontuan hartu behar da, baina aurrerago hitz egingo dugu.

Bestalde, [class]{.verbatim} atributua zuriunez banatutako klase anitz eduki ahal ditu, beraz, bi klaseen estiloak jasoko ditu. Modu honetan estiloak berrerabiltzeko eta konbinatzeko aukera dugu gure beharren arabera.


::: exercisebox
[[02b](https://github.com/yuki/ejercicios/blob/main/daw/diw/02b.html)]{.solution}

Sortu HTML bat klaseak eta konbinazioak dituzten elementuekin eta sortu CSS bat klase berrerabilgarriak eta hautatzaile unibertsala erabiliz.
:::


## Identifikatzaile hautatzailea {#selector-identificador}

HTMLk [id]{.verbatim} atributua ere badu, eta **behin bakarrik** erabili behar da HTML dokumentu bakoitzean. Elementu bat bere identifikatzailearen bitartez hautatzeko [#]{.verbatim} karakterea erabiltzen dugu:


:::::::::::::: {.columns }
::: {.column width="50%"}

::: mycode
[HTML]{.title}

```html
<h1 id="titulo-principal">
    Nire web orria
</h1>
```
:::

:::
::: {.column width="50%" }

::: mycode
[CSS]{.title}
```css
#titulo-principal {
    color: blue;
}
```
:::

:::
::::::::::::::


Hautatzailea **[id]{.verbatim} [titulo-principal]{.verbatim} den elementuari** aplikatuko zaio.

::: exercisebox
[[02c](https://github.com/yuki/ejercicios/blob/main/daw/diw/02c.html)]{.solution}

Sortu HTML bat identifikatzaileak dituzten elementuekin eta sortu CSS propioak.
:::


## Atributuaren arabera hautatzea {#selecto-atributo}

CSS-k HTML atributu jakin batzuk dituzten elementuak hautatzeko aukera ematen du. Adibidez, [type]{.verbatim} atributua duten elementu guztiak hauta ditzakegu:


:::::::::::::: {.columns }
::: {.column width="50%"}

::: mycode
[HTML]{.title}

```html
<input type="text">

<input type="email">

<input type="password">
```
:::

:::
::: {.column width="50%" }

::: mycode
[CSS]{.title}
```css
input[type] {
    border: 1px solid black;
}
input[type="email"] {
    background-color: lightblue;
}
```
:::

:::
::::::::::::::


Atributuaren balio zehatz bat ere hauta dezakegu, adibidean [type="email"]{.verbatim}. Kasu honetan, posta elektronikoaren eremua bakarrik izango du atzeko plano urdin argia.

Atributu hautatzaileak bereziki erabilgarriak dira HTML elementu baten ezaugarrietara lotutako estiloak aplikatu behar direnean.

Beste adibide bat [target]{.verbatim} atributua duten esteketarako.

:::::::::::::: {.columns }
::: {.column width="50%"}

::: mycode
[HTML]{.title}

```html
<a href="http://google.com"
    target="_self">
    link
</a>
<a href="http://google.com" 
    target="_blank">
    link
</a>
```
:::

:::
::: {.column width="50%" }

::: mycode
[CSS]{.title}
```css
a[target] {
    font-weight: bold;
}
a[target="_blank"] {
    color: red;
}
```
:::

:::
::::::::::::::

::: exercisebox
[[02d](https://github.com/yuki/ejercicios/blob/main/daw/diw/02d.html)]{.solution}

Sortu HTML bat atributuak dituzten elementuekin eta sortu CSS propioak.
:::


## Hautatzaileak taldekatu {#agrupar-selectores}

Arau berdinak hainbat hautatzaileri aplikatu ahal dizkiegu komaz banatuta. Taldekatzeak kodea errepikatzea ekiditen du.

:::::::::::::: {.columns }
::: {.column width="50%"}

::: mycode
[Hautatzaileak taldekatu]{.title}

```css
h1,
h2,
h3 {
    font-family: sans-serif;
}
```
:::

:::
::: {.column width="50%" }

::: mycode
[Hautatzaileak taldekatu]{.title}
```css
h1, h2, h3 {
    font-family: sans-serif;
}
```
:::

:::
::::::::::::::



## Hautatzaile beherakoiak {#selectores-descendientes}

CSS-k beste elementu batzuen barruan dauden elementuak hautatzeko aukera ematen du. Bakarrik [<article>]{.verbatim} elementuaren barruan dauden paragrafoak hauta ditzakegu.

:::::::::::::: {.columns }
::: {.column width="50%"}

::: mycode
[HTML]{.title}

```html
<article>
    <p>Lehen paragrafoa.</p>
    <p>Bigarren paragrafoa.</p>
</article>

<article>
    <div>
        <p>
            Testua.
        </p>
    </div>
</article>

<p>Kanpoko paragrafoa.</p>
```
:::

:::
::: {.column width="50%" }

::: mycode
[CSS]{.title}
```css
article p {
    color: blue;
}
```
:::

:::
::::::::::::::


[article]{.verbatim} eta [p]{.verbatim} arteko hutsuneak adierazten du [<article>]{.verbatim} elementuaren ondorengo [<p>]{.verbatim} elementuak hautatzen ari garela.

Emaitza hau izango da:

- Lehen paragrafoa → urdina.
- Bigarren paragrafoa → urdina.
- Kanpoko paragrafoa → estilo hau gabe.
- Testua → urdina.

Hautatzaile beherakoiak ez du seme zuzenetara mugatzen, ondorengo guztiei aplikatzen zaie.

::: errorbox
Hautatzaile beherakoiak ez du seme zuzenetara mugatzen, ondorengo guztiei aplikatzen zaie.
:::


## Seme zuzenen hautatzailea {#selector-hijo-directo}

Batzuetan ez dugu edozein ondorengo hautatu nahi, baizik eta **seme zuzenak** bakarrik. Horretarako [>]{.verbatim} sinboloa erabiltzen da.

:::::::::::::: {.columns }
::: {.column width="50%"}

::: mycode
[HTML]{.title}

```html
<article>
  <p>Paragrafo zuzena.</p>
  <div>
    <p>Div baten barruan.</p>
  </div>
</article>
```
:::

:::
::: {.column width="50%" }

::: mycode
[CSS]{.title}
```css
article > p {
    color: blue;
}
```
:::

:::
::::::::::::::


Modu honetan lehen paragrafoa bakarrik hautatzen da, bigarren paragrafoa ez delako [<article>]{.verbatim} elementuaren seme zuzen.

::: exercisebox
[[02f](https://github.com/yuki/ejercicios/blob/main/daw/diw/02f.html)]{.solution}

Sortu HTML bat CSS batekin, ondorengoak eta seme zuzenak bereizteko.
:::


## Hurbileko anai-arrebaren hautatzailea {#selector-hermano-adyacente}

CSS-k beste elementu baten ondoren berehala agertzen diren elementuak hautatzeko aukera ematen du. Horretarako [+]{.verbatim} sinboloa erabiltzen da.


:::::::::::::: {.columns }
::: {.column width="50%"}

::: mycode
[HTML]{.title}

```html
<h2>Izenburua</h2>
<p>Lehen paragrafoa.</p>
<p>Bigarren paragrafoa.</p>
```
:::

:::
::: {.column width="50%" }

::: mycode
[CSS]{.title}
```css
h2 + p {
    color: blue;
}
```
:::

:::
::::::::::::::


Arau honen bidez lehen paragrafoa bakarrik hautatzen da, bigarrena ez.


## Ondorengo anai-arrebak hautatzea {#selector-hermano-posterior}

Elementu baten ondoren agertzen diren anai-arreba guztiak hautatzeko [~]{.verbatim} erabiltzen da.


:::::::::::::: {.columns }
::: {.column width="50%"}

::: mycode
[HTML]{.title}

```html
<h2>Izenburua</h2>
<p>Lehen paragrafoa.</p>
<p>Bigarren paragrafoa.</p>
<div>Beste elementu bat.</div>
<p>Hirugarren paragrafoa.</p>
```
:::

:::
::: {.column width="50%" }

::: mycode
[CSS]{.title}
```css
h2 ~ p {
    color: blue;
}
```
:::

:::
::::::::::::::


Arau honen bidez [<h2>]{.verbatim} elementuaren ondoren dauden [<p>]{.verbatim} elementu guztiak hautatzen dira. Beraz, hiru paragrafoak hautatuko dira.

::: exercisebox
[[02g](https://github.com/yuki/ejercicios/blob/main/daw/diw/02g.html)]{.solution}

Sortu HTML bat CSS batekin, hurbileko anai-arrebak eta ondorengo guztiak bereizteko.
:::




## Pseudo-klaseak {#pseudoclases}

**Pseudo-klaseak** elementuak egoera edo baldintza baten arabera hautatzeko aukera ematen dute, eta bi puntu bidez irudikatzen dira ([:]{.verbatim}). Adibide batzuk:

- [:hover]{.verbatim}: Erabiltzaileak saguaren erakuslea elementuaren gainean jartzen duenean.
- [:focus]{.verbatim}: Elementu batek fokua duenean.
- [:active]{.verbatim}: Elementu bat aktibatzen ari den momentua adierazten du.
- [:visited]{.verbatim}: Erabiltzaileak jadanik bisitatu dituen estekak.



::: exercisebox
[[02h](https://github.com/yuki/ejercicios/blob/main/daw/diw/02h.html)]{.solution}

Sortu HTML bat CSS batekin pseudo-klase hauek erabiltzeko.
:::


## Pseudo-elementuak {#pseudoelementos}

**Pseudo-elementuak** elementu baten zati jakin batzuk hautatzeko edo hura lotutako edukia sortzeko aukera ematen dute. Normalean bi puntu bidez irudikatzen dira ([::]{.verbatim}).


:::::::::::::: {.columns }
::: {.column width="50%"}

::: mycode
[HTML]{.title}

```html
<p class="aviso">
    Eremu hau derrigorrezkoa da.
</p>
```
:::

:::
::: {.column width="50%" }

::: mycode
[CSS]{.title}
```css
p::first-letter {
    font-size: 50px;
}
p::first-line {
    font-weight: bold;
}
.aviso::before {
    content: "⚠ ";
}
.enlace::after {
    content: " →";
}
```
:::

:::
::::::::::::::


Sortutako arauek honakoak egiten dituzte:

- Paragrafo bakoitzaren lehen letra aldatzen du.
- Testuaren lehen lerroa aldatzeko aukera ematen du.
- Elementuaren edukia baino lehen edukia txertatzeko aukera ematen du.
- [::after]{.verbatim} modu antzekoan funtzionatzen du, baina edukia ondoren txertatzen du.


::: errorbox
[::before]{.verbatim} eta [::after]{.verbatim} bidez sortutako edukia dokumentuaren irudikapen bisualaren parte da, baina ez du erabiltzaileak behar duen HTML edukia ordezten. Ez ditugu erabiliko informazio funtsezkoa sartzeko, pertsona guztientzat edo laguntza-teknologientzat eskuragarri egon behar dena.
:::


::: exercisebox
[[02i](https://github.com/yuki/ejercicios/blob/main/daw/diw/02i.html)]{.solution}

Sortu aurreko adibidea eta barneratu pseudo-elementuak.
:::



## Hautatzaileen konbinazioa {#combinación-selectores}

Hautatzaileak konbinatu daitezke arau askoz zehatzagoak sortzeko. Adibidez:


:::::::::::::: {.columns }
::: {.column width="50%"}

::: mycode
[HTML]{.title}

```html
<article class="destacado">
  <p>Urdina izango da.</p>
</article>
```
:::

:::
::: {.column width="50%" }

::: mycode
[CSS]{.title}
```css
article.destacado p {
    color: blue;
}
```
:::

:::
::::::::::::::


Arau honek honako baldintzak dituen elementuaren barruan dauden paragrafoak hautatzen ditu:

- [<article>]{.verbatim} da.
- [destacado]{.verbatim} klasea du.


Klaseak ere konbinatu ditzakegu:

:::::::::::::: {.columns }
::: {.column width="50%"}

::: mycode
[HTML]{.title}

```html
<button class="boton">
    Onartu
</button>

<button class="boton importante">
    Ezabatu
</button>
```
:::

:::
::: {.column width="50%" }

::: mycode
[CSS]{.title}
```css
.boton.importante {
    background-color: red;
}
```
:::

:::
::::::::::::::

Arau honek **bi klaseak** dituen elementuak bakarrik hautatzen ditu:



## Hautatzaileen laburpena {#resumen-selectores}

| Hautatzailea | Adibidea | Hautatzen du |
|---|---|---|
| Unibertsala | [*]{.verbatim} | Elementu guztiak |
| Mota | [p]{.verbatim} | Mota horretako elementu guztiak |
| Klasea | [.aviso]{.verbatim} | [aviso]{.verbatim} klasea duten elementuak |
| ID | [#menu]{.verbatim} | [id="menu"]{.verbatim} duen elementua |
| Atributua | [input[type="email"]]{.verbatim} | Email motako input-ak |
| Beherakorra | [article p]{.verbatim} | [<article>]{.verbatim} barruan dauden [<p>]{.verbatim} |
| Seme zuzena | [article > p]{.verbatim} | [<article>]{.verbatim} elementuaren seme zuzenak |
| Hurbileko anai-arrebak | [h2 + p]{.verbatim} | Berehala ondoren datorren [<p>]{.verbatim} |
| Ondorengo anai-arrebak | [h2 ~ p]{.verbatim} | Anai-arreba ondorengo [<p>]{.verbatim} |
| Pseudo-klasea | [a:hover]{.verbatim} | Kurtsorea gainean duen esteka |
| Pseudo-elementua | [p::first-letter]{.verbatim} | Paragrafo baten lehen letra |


## Praktika onak {#buenas-prácticas}

CSS hautatzaileak idatzean zenbait gomendio jarraitu behar dira.

- Erabili klaseak estilo berrerabilgarrietarako.
- Saihestu hautatzaile oso konplexuak, mantentzea zaildu baitute.
- Erabili izen deskribatzaileak klase eta identifikatzaile bakarretarako.

