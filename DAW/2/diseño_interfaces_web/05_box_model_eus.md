
# *Box Model* {#box-model}

Benetan  web-orri batek nola jokatzen duen ulertzeko, **kutxen eredua** (*[Box Model](https://developer.mozilla.org/en-US/docs/Web/CSS/Guides/Box_model)*) ezagutu behar da, CSSren kontzeptu garrantzitsuenetako bat baita.

Nabigatzaileak ez ditu HTML elementuak testu edo irudi isolatu gisa interpretatzen, **kutxa angeluzuzen** gisa baizik. Paragrafo, botoi, irudi, goiburu edo formulario bakoitzak dimentsio batzuk dituen kutxa bat hartzen du, baita gainerako elementuekiko espazio jakin bat ere.

Kutxen eredua ulertzeak galdera hauei erantzuteko aukera emango digu:

- Zergatik daude bi elementu elkarrengandik bereizita?
- Zergatik hartzen du kutxa batek espero baino leku gehiago?
- Zein da [[padding]{.verbatim}](#padding) eta [[margin]{.verbatim}](#márgenes) arteko aldea?
- Zergatik aldatzen du ertz batek elementu baten ikusgai dagoen tamaina?


## Kutxa baten eremuak {#elementos-caja}

Esan bezala, HTMLko elementu bakoitza kutxa angeluzuzen gisa interpretatzen da, eta kutxa horrek, aldi berean, lau eremu desberdin ditu:

1. **Edukia** (*content*): Elementuaren edukia.
2. **Betegarria** (*padding*): Barneko espazioa.
3. **Ertza** (*border*): Ikusgai dagoen ertza.
4. **Marjina** (*margin*): Kanpoko espazioa, kutxa hau inguruko beste kutxetatik bereizteko.

Nabigatzaileak kutxaren tamaina kalkulatzen du eremu horien guztien espazioa kontuan hartuta. Ondorengo irudietan hobeto ikus daiteke:

:::::::::::::: {.columns }
::: {.column width="33%"}
![*Box model* [MDN](https://developer.mozilla.org/en-US/docs/Web/CSS/Guides/Box_model)](img/diw/caja.png){width=100%}
:::
::: {.column width="33%" }
![*Box model* Chrome-n](img/diw/caja-chrome.png){width=100%}
:::
::: {.column width="33%" }
![*Box model* Firefox-en](img/diw/caja-firefox.png){width=100%}
:::
::::::::::::::

Gure nabigatzaileko garatzaile-tresnetatik *box model* eta orri bateko elementu bakoitzak hartzen duen tamaina ikus ditzakegu.

Eredu hau CSSko diseinuaren oinarria da, eta ezinbestekoa da ulertzea atal konplexuagoak ikusi aurretik.

## Kutxaren tamaina eta [box-sizing]{.verbatim} {#tamaño-caja-box-sizing}

Demagun honako kutxa hau dugula:

::: mycode
[Altuera maximoa]{.title}
```css
.caja {
    width: 300px;
    height: 200px;
    padding: 20px;
    border: 5px solid black;
    margin: 10px;
}
```
:::

Nahiz eta oraindik propietateak sakon aztertu ez ditugun, aurrez ikusitako kutxen eredua kontuan hartuta:

::: questionbox
Zein uste duzu dela kutxaren zabalera osoa? Eta altuera?
:::


Aurreko adibidean kutxaren zabalera [300+20+20+5+5=350px]{.verbatim} da, ezarritako zabalera gehi alde bakoitzeko *padding*-a eta ertzaren zabalera gehitu behar baitira, baita alde bakoitzean ere. Marjina ez da tamainaren kalkuluan sartzen, elementuen arteko bereizketa baita. Portaera hori arraroa izan daiteke hasieran.


[box-sizing]{.verbatim} propietateak dimentsioak nola kalkulatzen diren aldatzeko aukera ematen du. Bi balio nagusi daude:

- [content-box]{.verbatim}: portaera tradizionala da. Zabalera edukiari dagokio. **Hau da portaera lehenetsia**.
- [border-box]{.verbatim}: **zabalerak *padding*-a eta ertza barne hartzen ditu**. Portaera hau **intuitiboagoa** da.

Ondorengo irudietan hobeto ikus daiteke kutxaren benetako dimentsioa nola kalkulatzen den bi kasuetan:

:::::::::::::: {.columns }
::: {.column width="50%"}
![Konparaketa](img/diw/border_box-content-box.png){width=100%}
:::
::: {.column width="25%" }

![Content-box](img/diw/content-box.png){width=100%}

:::
::: {.column width="25%" }

![Border-box](img/diw/border-box.png){width=100%}

:::
::::::::::::::

Ikus daitekeen bezala, aukera [content-box]{.verbatim} denean, tamaina [width]{.verbatim}-en ezarritakoa da, eta ondoren gainerako tamainak gehitzen dira. Aldiz, [border-box]{.verbatim} denean, garatzaile-tresnek erakusten dute edukiaren tamainari [padding]{.verbatim}-aren eta [border]{.verbatim}-aren tamaina kendu zaiola, [width]{.verbatim}-ren guztizko tamainarekin bat etor dadin.

::: exercisebox
[[04i](https://github.com/yuki/ejercicios/blob/main/daw/diw/04i.html)]{.solution}

Egiaztatu [box-sizing]{.verbatim}-en erabilera eta [content-box]{.verbatim} edo [border-box]{.verbatim} gisa konfiguratzearen arteko aldea. Barneratu bien arteko desberdintasuna eta pentsatu zein erabiliko zenukeen benetako proiektu batean.
:::


### [box-sizing:border-box]{.verbatim} orri osoan aldatzea {#aplicar-border-box-página}

Gure web-orrian [box-sizing: border-box]{.verbatim} erabili nahi badugu, eta elementu guztiei aplikatu nahi badiegu banan-banan joan beharrik gabe, honako araua erabil dezakegu gure CSSaren hasieran:

::: mycode
[Border-box aplikatu dokumentu osoan]{.title}
```css
*,
*::before,
*::after {
    box-sizing: border-box;
}
```
:::

Horrela, elementu guztiek kutxa-eredu bera erabiliko dute. Gaur egun oso gomendatutako praktika da, dimentsioen kalkulua asko errazten duelako.

::: infobox
Gaur egun [box-sizing: border-box]{.verbatim} erabiltzea gomendatzen da hasierako diseinu-erabaki gisa.
:::

::: errorbox
Garrantzitsua da portaera lehenetsia ezagutzea, gero aldatzea erabakitzen bada, sortu ditugun osagai guztien tamainak berriro egokitu beharko baitira.
:::



## Bloke-elementuak eta lerroko elementuak {#elementos-bloque-línea}

Kutxa-ereduak elementu guztiei eragiten die, nahiz eta guztiek ez duten berdin jokatzen. Elementuak **bloke-elementuak** edo **lerroko elementuak** izan daitezke, baina **inoiz ez biak aldi berean**.


### Bloke-elementuak {#elementos-bloque}

Bloke-elementuek ezaugarri hauek dituzte:

- Eskuragarri dagoen zabalera osoa hartzen dute.
- Lerro berri batean hasten dira.
- Zabalera eta altuera onartzen dituzte.

Ondorengo taulan bloke motako elementu guztiak daude (iturria: [w3schools](https://www.w3schools.com/htmL/html_blocks.asp)):

|    |    |    |    |    |    |
|:---|:---|:---|:---|:---|:---|
| [<address>]{.verbatim} | [<article>]{.verbatim} | [<aside>]{.verbatim} | [<blockquote>]{.verbatim} | [<canvas>]{.verbatim} | [<dd>]{.verbatim} | 
| [<div>]{.verbatim} | [<dl>]{.verbatim} | [<dt>]{.verbatim} | [<fieldset>]{.verbatim} | [<figcaption>]{.verbatim} | [<figure>]{.verbatim} | 
| [<footer>]{.verbatim} | [<form>]{.verbatim} | [<h1>]{.verbatim} |-[<h6>]{.verbatim} | [<header>]{.verbatim} | [<hr>]{.verbatim} | [<li>]{.verbatim} | 
| [<main>]{.verbatim} | [<nav>]{.verbatim} | [<noscript>]{.verbatim} | [<ol>]{.verbatim} | [<p>]{.verbatim} | [<pre>]{.verbatim} |
| [<section>]{.verbatim} | [<table>]{.verbatim} | [<tfoot>]{.verbatim} | [<ul>]{.verbatim} | [<video>]{.verbatim} |

Table: {tablename=tblr}

### Lerroko elementuak {#elementos-en-línea}

Lerroko elementuek ezaugarri hauek dituzte:

- Edukiak hartzen duen espazioa baino ez dute hartzen.
- Ez dira lerro berri batean hasten.
- Zabalera eta altuerarekiko portaera desberdina dute.


Ondorengo taulan bloke motako elementu guztiak daude (iturria: [w3schools](https://www.w3schools.com/htmL/html_blocks.asp)):


|    |    |    |    |    |    |
|:---|:---|:---|:---|:---|:---|
| [<a>]{.verbatim} | [<abbr>]{.verbatim} | [<b>]{.verbatim} | [<bdo>]{.verbatim} | [<br>]{.verbatim} | [<button>]{.verbatim} | 
| [<cite>]{.verbatim} | [<code>]{.verbatim} | [<dfn>]{.verbatim} | [<em>]{.verbatim} | [<i>]{.verbatim} | [<img>]{.verbatim} |
| [<input>]{.verbatim} | [<kbd>]{.verbatim} | [<label>]{.verbatim} | [<map>]{.verbatim} | [<object>]{.verbatim} | [<output>]{.verbatim} |
| [<q>]{.verbatim} | [<samp>]{.verbatim} | [<script>]{.verbatim} | [<select>]{.verbatim} | [<small>]{.verbatim} | [<span>]{.verbatim} |
| [<strong>]{.verbatim} | [<sub>]{.verbatim} | [<sup>]{.verbatim} | [<textarea>]{.verbatim} | [<time>]{.verbatim} | [<var>]{.verbatim} |

Table: {tablename=tblr colspec=XXXXXX}

Aurrerago [[display]{.verbatim}](#display) propietatea aztertuko dugu, portaera hori aldatzeko aukera ematen duena.


# Dimentsioak {#dimensiones}

Dimentsioek HTML elementuen tamaina kontrolatzeko aukera ematen dute. CSSk zabalera eta altuera definitzeko propietateak eskaintzen ditu, baita gutxieneko eta gehieneko mugak ere, gailu desberdinetara egokitzen diren interfazeak sortzea ahalbidetzen dutenak.

Ondorengo propietateak **kutxa-ereduaren** (*box model*) parte dira eta funtsezkoak dira edozein web-diseinu eraikitzeko:

- [width]{.verbatim}: elementuaren eremuaren zabalera.
- [min-width]{.verbatim}: elementuaren gutxieneko zabalera.
- [max-width]{.verbatim}: elementuaren gehieneko zabalera.
- [height]{.verbatim}: elementuaren altuera.
- [min-height]{.verbatim}: elementuaren gutxieneko altuera.
- [max-height]{.verbatim}: elementuaren gehieneko altuera.
- [box-sizing]{.verbatim}: dimentsioak kalkulatzeko zer "kutxa-eredu" mota erabili.


## Dimentsioak eremuaren arabera {#dimensiones-por-zonas}

Jarraian, HTMLko *box model*-aren kutxen dimentsioak aldatzeko hainbat propietate ikusiko ditugu. Propietateak honela bereiz daitezke:

- **Propietate orokorra**: izenak ez du adierazten zein eremuri eragiten dion, eta, beraz, eremu guztietan egingo du aldaketa.
- **Propietate espezifikoa**: zein eremu aldatuko duen adierazten du, eta eremu horri bakarrik eragingo dio.


### Propietate orokorra: eremu guztiak {#propiedad-general-todas}

*Box model*-aren eremu guztiei eragiten dieten propietateak dira: goian, eskuinean, behean eta ezkerrean. Beraz, ondorengo adibidea badugu:

::: mycode
[Padding]{.title}
```css
.caja {
    padding: 30px;
}
```
:::

Gure kutxak [30px]{.verbatim}-ko [padding]{.verbatim}-a duela adierazten du eremu bakoitzean: **goian, eskuinean, behean eta ezkerrean***. Propietate orokorrak erabil ditzakegu eremu jakin batzuei bakarrik eragin nahi diegula zehazteko, eta hori zenbat parametro pasatzen ditugun araberakoa da:

:::::::::::::: {.columns columnsep=0.25cm}
::: {.column width="40%"}

::: {.mycode size="footnotesize"}
[Zein eremuan eragiten dio?]{.title}
```css
.a { padding: 2px; }
.b { padding: 2px 4px; }
.c { padding: 2px 4px 6px; }
.d { padding: 1px 2px 3px 4px;}
```
:::

:::
::: {.column width="60%" }

- **Balio 1**: eremu guztietan aplikatzen dela adierazten dugu.
- **2 balio**: lehenengo balioa [top]{.verbatim} eta [bottom]{.verbatim}-erako da, eta bigarrena [right]{.verbatim} eta [left]{.verbatim}-erako.
- **3 balio**: [top]{.verbatim}, [right]{.verbatim} eta [left]{.verbatim}; azken balioa [bottom]{.verbatim}-erako da.
- **4 balio**: [top]{.verbatim}, [right]{.verbatim}, [bottom]{.verbatim} eta [down]{.verbatim}.

:::
::::::::::::::


Honek [padding]{.verbatim}, [border-width]{.verbatim} eta [margin]{.verbatim} bezalako propietateei eragiten die.

::: infobox
Garrantzitsua da ordena hau ezagutzea, aurrerago ikusiko ditugun hainbat propietate orokorretan errepikatzen baita.
:::


### Propietate espezifikoa: eremu bati bakarrik eragiten dio {#propiedad-específica}

Aurrerago ikusiko ditugun propietate askok propietate espezifikoak dituzte, dagokien eremuari bakarrik eragiten diotenak. Adibidez:

- [padding-top]{.verbatim}: goiko aldean bakarrik gehitzen du padding-a.
- [border-right]{.verbatim}: eskuineko aldeko ertza bakarrik konfiguratzeko.
- [margin-bottom]{.verbatim}: beheko aldean bakarrik gehitzen du marjina.


Horrela, propietatearen izenak berak argi zehazten du zein eremuri eragiten dion.


## [width]{.verbatim} propietatea {#anchura-width}

[width]{.verbatim} propietateak elementu baten **eduki-eremuaren zabalera** ezartzen du.


::: mycode
[Zabalera]{.title}
```css
.caja {
    width: 300px;
}
```
:::

Edukiak [300px]{.verbatim}-ko zabalera izango du. Garrantzitsua da gogoratzea, lehenespenez, [padding]{.verbatim} eta [border]{.verbatim} **ez daudela zabalera horren barruan**. Portaera hori aurrerago aztertuko dugu [box-sizing]{.verbatim}-ekin.

### Zabalera erlatiboa {#ancho-relativo}

Ehunekoek elementu moldagarriak sortzeko aukera ematen dute.

::: mycode
[Padding con anchura relativa]{.title}
```css
.contenedor { width: 80%; }
```
:::

Zabalera elementu edukitzailearen tamainaren araberakoa izango da. Edukiontziak [1000px]{.verbatim} neurtzen badu, elementuak gutxi gorabehera [800px]{.verbatim} hartuko ditu. Ondoren [600px]{.verbatim} neurtzen badu, zabalera gutxi gorabehera [480px]{.verbatim} izango da.



## [min-width]{.verbatim} propietatea {#min-width}

[min-width]{.verbatim} propietateak elementu batek izan dezakeen **gutxieneko zabalera** ezartzen du.

::: mycode
[abalera eta ziurtatu gutxieneko zabalera]{.title}
```css
.caja {
    width: 50%;
    min-width: 250px;
}
```
:::

Elementua [50%]{.verbatim} hartzen saiatuko da, baina ez da inoiz [250px]{.verbatim} baino txikiagoa izango. Propietate hau oso erabilgarria da responsive diseinuetan.


## [max-width]{.verbatim} propietatea {#max-width}

[max-width]{.verbatim}-ek onartzen den **gehieneko zabalera** ezartzen du.

::: mycode
[Zabalera eta ziurtatu gehienezko zabalera]{.title}
```css
.caja {
    width: 90%;
    max-width: 1200px;
}
```
:::

Eredu hau oso ohikoa da. Lehenespenez, pantaila txikietan [90%]{.verbatim} hartuko du, eta pantaila handietan, berriz, ez ditu inoiz [1200px]{.verbatim} gaindituko. Horrela, edukia gehiegi zabala izatea saihesten dugu.


## [height]{.verbatim} propietatea {#altura-height}

[height]{.verbatim}-ek **eduki-eremuaren altuera** definitzen du.


::: mycode
[Altuera]{.title}
```css
.caja { height: 200px; }
```
:::

Edukiak [200px]{.verbatim}-ko altuera izango du. Edukiak erabilgarri dagoen espazioa baino leku gehiago hartzen badu, gainezkatzea gerta daiteke; hurrengo atalean aztertuko dugu.

[height]{.verbatim}-en ehuneko batek behar bezala funtzionatzen du guraso-elementuak altuera definitua duenean soilik. Guraso-elementuak ez badu altuera definiturik, baliteke ehunekoak espero den emaitza ez ematea.

## [min-height]{.verbatim} propietatea {#min-height}

[min-height]{.verbatim} propietateak gutxieneko altuera bat ezartzen du.

::: mycode
[Altuera]{.title}
```css
.caja { min-height: 200px; }
```
:::

Edukia oso txikia izan arren, kutxak gutxienez [200px]{.verbatim}-ko altuera izango du. Edukia hazten bada, elementua ere hazi egingo da.

::: infobox
Edukia hazi daitekeenean, altuera finko bat erabili beharrean [min-height]{.verbatim} erabiltzea gomendatzen da.
:::


## [max-height]{.verbatim} propietatea {#max-height}

[max-height]{.verbatim}-ek gehieneko altuera mugatzen du.

::: mycode
[Altuera maximoa]{.title}
```css
.caja { max-height: 400px; }
```
:::

Edukiak tamaina hori gainditzen badu, gainezkatzea gerta daiteke, [overflow]{.verbatim} propietatearen arabera. Konbinazio hau oso ohikoa da alboko paneletan eta desplazamendua duten zerrendetan.


# Overflow / gainezkatzea {#overflow}

Batzuetan, elementu baten edukiak erabilgarri dagoen espazioa baino leku gehiago hartzen du. Testua luzeegia delako, irudi bat handiegia delako edo dimentsio finko txikiegiak ezarri ditugulako gerta daiteke.

[overflow]{.verbatim} propietateak nabigatzaileak zer egin behar duen kontrolatzen du edukiak elementuaren **mugak gainditzen** dituenean. Propietate hau oso erabilia da paneletan, txarteletan, menuetan, leiho modaletan eta desplazamendua duten edukiontzietan.


Demagun hurrengo adibidean bezalako altuera finkoa duen kutxa bat dugula:

::: mycode
[Kutxa]{.title}
```css
.caja {
    width: 100px;
    height: 100px;
    border: 2px solid black;
}
```
:::

Testu oso luze bat sartzen badugu, edukiak erabilgarri dagoen altuera gaindi dezake; horri **overflow** edo **gainezkatzea** esaten zaio. Nabigatzaileak eduki horrekin zer egin erabaki behar du, eta horretarako [overflow]{.verbatim} propietatea erabiltzen dugu, honako aukeretako batekin konfigura daitekeena:

- [auto]{.verbatim}: barrak beharrezkoak direnean bakarrik agertzen dira.
- [hidden]{.verbatim}: soberan dagoen edukia ezkutatzen da.
- [scroll]{.verbatim}: desplazamendu-barrak beti agertzen dira.
- [visible]{.verbatim}: edukia elementutik kanpora ateratzen da.

Zein konfigurazio erabili behar dugun erabaki ondoren, CSSari gehituko diogu:

::: mycode
[Kutxa overflow-rekin]{.title}
```css
.caja {
    width: 100px;
    height: 100px;
    border: 2px solid black;
    overflow: auto;
}
```
:::


![[overflow]{.verbatim} como: [auto]{.verbatim}, [hidden]{.verbatim}, [scroll]{.verbatim} y [visible]{.verbatim}](img/diw/overflow.png){width=70%}


## Ardatz bakoitzaren kontrol independentea {#control-independiente-eje}

Gainezkatzea kontrolatzerakoan, horizontalki eta bertikalki bereizita kontrola dezakegu. Horretarako, propietate hauek ditugu:

- [overflow-x]{.verbatim}: ardatz horizontalarentzat.
- [overflow-y]{.verbatim}: ardatz bertikalarentzat.


::: exercisebox
[[04j](https://github.com/yuki/ejercicios/blob/main/daw/diw/04j.html) y [04k](https://github.com/yuki/ejercicios/blob/main/daw/diw/04k.html)]{.solution}

Erabili [overflow]{.verbatim} eta haren aldaerak aurrez ikusitako zabalera- eta altuera-propietateekin batera.
:::


# *Padding* {#padding}

***Padding***-a elementu baten edukiaren eta ertzaren artean dagoen **barneko** espazioa da. **Kutxa-ereduaren (Box Model)** parte da, eta barneko bereizketa sortzeko, irakurgarritasuna hobetzeko eta botoiak, txartelak edo formularioak bezalako elementuen eremu erabilgarria handitzeko erabiltzen da.

Aurretik jarritako irudia gogoratuko dugu, garrantzitsua baita *padding*-a marjinatik bereiztea:

:::::::::::::: {.columns }
::: {.column width="33%"}
![*Box model* [MDN](https://developer.mozilla.org/en-US/docs/Web/CSS/Guides/Box_model)](img/diw/caja.png){width=100%}
:::
::: {.column width="33%" }
![*Box model*  Chrome-n](img/diw/caja-chrome.png){width=100%}
:::
::: {.column width="33%" }
![*Box model* Firefox-en](img/diw/caja-firefox.png){width=100%}
:::
::::::::::::::

Gogoratu:

- **Padding**: edukiaren eta ertzaren arteko barruko espazioa.
- **Margin**: elementuen arteko kanpoko espazioa.

Beraz, honako adibide hau egin dezakegu:


::: mycode
[Padding]{.title}
```css
.caja {
    padding: 20px;
}
```
:::

Edukia ertzetik 20px-ra egongo da bere alde guztietan. Aurretik ikusi dugun bezala, padding-ak propietate bana du kaxaren alde bakoitzerako: [padding-top]{.verbatim}, [padding-right]{.verbatim}, [padding-bottom]{.verbatim} eta [padding-left]{.verbatim}.

Atzeko kolorea gehitzen badugu, **padding-a ere estaltzen du**, eta ertzeraino iritsiko da.

## *Padding*-aren erabilera botoietan {#padding-botones}

*Padding*-aren erabilera ohikoenetako bat botoi baten sakatze-eremua handitzea da. Testua txikia izan arren, botoiak erabiltzailearentzat askoz azalera erosoagoa izango du. Eredu hori ia edozein interfaze modernotan agertzen da.

::: exercisebox
[[04h](https://github.com/yuki/ejercicios/blob/main/daw/diw/04h.html)]{.solution}

Sortu hainbat elementu *padding*-a gehituz. Aldatu botoi bat *padding* pertsonalizatua gehitzeko eta, horrela, sakatze-eremu handiagoa izan dezan. Konparatu padding-ak aurreko ariketako marjinarekiko duen eragina.
:::



# Ertzak {#bordes}

Ertzek web-orri bateko elementuak ikusmenez mugatzeko aukera ematen dute. CSS-k hainbat propietate eskaintzen ditu haien lodiera, estiloa, kolorea eta forma kontrolatzeko.

Ertzak **kutxa-ereduaren (*Box Model*)** oinarrizko osagaietako bat dira, eta etengabe erabiltzen dira botoiak, txartelak, formularioak, taulak eta interfazeko beste elementu batzuk sortzeko.


## [border]{.verbatim} propietatea {#propiedad-border}

Ertz bat sortzeko modurik errazena [border]{.verbatim} propietate laburtua erabiltzea da. Hiru parametro ematen zaizkio:

- **Ertzaren lodiera**: neurri-unitate batekin edo [thin]{.verbatim}, [medium]{.verbatim} eta [thick]{.verbatim} bezalako gako-hitzekin adieraz daiteke.
- **Marra estiloa**: hainbat gako-hitz daude ertz mota adierazteko:
  - [none]{.verbatim}: Ertzik gabe.
  - [solid]{.verbatim}: Marra jarraitua.
  - [dashed]{.verbatim}: Marra etena.
  - [dotted]{.verbatim}:  Puntuzko marra.
  - [double]{.verbatim}: Marra bikoitza.
  - [groove]{.verbatim}:  Hondoratutako hiru dimentsioko efektua.
  - [ridge]{.verbatim}:  Goratutako hiru dimentsioko efektua.
  - [inset]{.verbatim}: Barruko itxura.
  - [outset]{.verbatim}: Kanpoko itxura.
- **Ertzaren kolorea**.

Hurrengo adibidean kodea propietate bakar batean edo parametro bakoitza bere propietatean banatuta ikus daiteke:


:::::::::::::: {.columns }
::: {.column width="50%"}

::: mycode
[[border]{.verbatim} propietatea]{.title}
```css
p { 
    border: 2px solid black;
}
```
:::

:::
::: {.column width="50%" }

::: mycode
[[border]{.verbatim} propietatea]{.title}
```css
p {
    border-width: 2px;
    border-style: solid;
    border-color: black;
}
```
:::

:::
::::::::::::::

[border-width]{.verbatim} propietatea propietate "orokorra" da, eta batetik lau parametrora onartzen ditu eremu desberdinetarako, lehenago azaldu dugun bezala.

::: exercisebox
[[04e](https://github.com/yuki/ejercicios/blob/main/daw/diw/04e.html)]{.solution}

Sortu ertz desberdinak lodiera, estilo eta kolore desberdinekin.
:::


## Alde bakoitzean ertz desberdinak {#ertz-desberdinak}

CSS-k ertzaren alde bakoitza modu independentean konfiguratzeko aukera ematen du, [border-top]{.verbatim}, [border-right]{.verbatim}, [border-bottom]{.verbatim} eta [border-left]{.verbatim} propietateen bidez.

[border]{.verbatim} propietatearen modu berean funtzionatzen dute; beraz, alde bakoitzari lodiera, estilo eta kolore desberdinak eslei diezazkiokegu.

Eta ezaugarri bakoitza banaka esleitu nahi badugu, propietate bereiziak ditugu, hala nola:

- [border-top-width]{.verbatim}
- [border-right-style]{.verbatim}
- [border-bottom-color]{.verbatim}

Eta horrela kaxaren alde eta propietate bakoitzerako.


## Ertz biribilduak [border-radius]{.verbatim} erabiliz {#border-radius}

Gehien erabiltzen den propietateetako bat [border-radius]{.verbatim} da, izkinak biribiltzeko aukera ematen baitu.

:::::::::::::: {.columns }
::: {.column width="50%"}

::: mycode
[[border-radius]{.verbatim} propietatea]{.title}
```css
.a { border-radius: 5px; }
.b { border-radius: 1rem; }
.c { border-radius: 50%; }
```
:::

:::
::: {.column width="50%" }

::: mycode
[Zirkulu perfektua]{.title}
```css
.avatar {
    width: 120px;
    height: 120px;
    border-radius: 50%;
}
```
:::


:::
::::::::::::::

Izkinak modu independentean konfigura daitezke propietate espezifiko hauen bidez:

- [border-top-left-radius]{.verbatim}
- [border-top-right-radius]{.verbatim}
- [border-bottom-right-radius]{.verbatim}
- [border-bottom-left-radius]{.verbatim}


## Ertz eliptikoak {#ertz-eliptikoak}

[border-radius]{.verbatim}-ek erradio horizontal eta bertikal desberdinak definitzeko aukera ere ematen du.

::: mycode
[Ertz eliptikoa]{.title}
```css
.caja {
    border-radius: 50px / 20px;
}
```
:::

Horrek forma eliptikoa duten izkinak sortzen ditu, zirkularrak izan beharrean. Ezaugarri interesgarria bada ere, diseinu gehienetan erradio berdinak erabiltzen dira. Ertz eliptikoak ondo ulertzeko, MDNren [border-radius generator](https://developer.mozilla.org/en-US/docs/Web/CSS/Guides/Backgrounds_and_borders/Border-radius_generator) webgunean nola funtzionatzen duten ikus dezakegu.

::: exercisebox
[[04f](https://github.com/yuki/ejercicios/blob/main/daw/diw/04f.html)]{.solution}

Sortu ertz desberdinak kaxaren alde bakoitzerako. Sortu beste ertz batzuk ertz biribildu, eliptiko eta tamaina desberdinekin.
:::



<!-- 
TODO: 
añadir border-image ?
outline?
foco en formulario?
bordes en tablas?
 -->


# Marjinak {#marjinak}

Marjinak elementu baten inguruan dagoen **kanpoko** espazioa dira, ertzaren ondoren. Elementuak elkarrengandik bereizteko aukera ematen dute, eta **kutxa-ereduaren (*[box model](https://developer.mozilla.org/en-US/docs/Web/CSS/Guides/Box_model)*)** oinarrizko ataletako bat dira. Beste behin gogoratuko dugu:

- **Padding**: edukiaren eta ertzaren arteko barruko espazioa.
- **Margin**: elementuen arteko kanpoko espazioa.

Marjinak ezartzeko modurik errazena [margin]{.verbatim} propietatea erabiltzea da:

::: mycode
[20px-eko marjina]{.title}
```css
.caja {
    margin: 20px;
}
```
:::

Zona bakoitzak propietate espezifiko bat ere badu: [margin-top]{.verbatim}, [margin-right]{.verbatim}, [margin-bottom]{.verbatim} eta [margin-left]{.verbatim}.

Aurretik ikusi ditugun unitate mota desberdinak adieraz ditzakegu:

::: mycode
[Marjina]{.title}
```css
.caja {
    margin: 1em 20px 2rem 5%;
}
```
:::

Marjinerako ehuneko bat erabiltzen badugu, leihoaren tamainaren araberakoa izango da, eta hori erabilgarria izan daiteke diseinu *responsive*etan.

Marjin negatiboak ere gehi ditzakegu; horren ondorioz, edukia bere "norabide naturalaren" kontrako aldera desplazatuko da. Marjin negatiboak tresna indartsuak dira, baina neurriz erabili behar dira, mantentzen zailak diren gainjartzeak sor baititzakete.

::: errorbox
Kontuz marjin negatiboak erabiltzean, nahi ez diren gainjartzeak sor baititzakete.
:::


## [margin: auto]{.verbatim} {#margin-auto}

[auto]{.verbatim} balio bereziak nabigatzaileari marjina automatikoki kalkulatzeko aukera ematen dio. Kasurik ezagunena horizontalki zentratzea da.

::: mycode
[auto marjina]{.title}
```css
.caja {
    margin: auto;
}
```
:::

Garrantzitsua da konturatzea [auto]{.verbatim} bakarrik adierazten badugu, goiko eta beheko marjinak automatikoki desagertzen direla.


<!-- 

TODO: poner esto o luego?
## 3.11.12 Márgenes automáticos en Flexbox

En diseños modernos también es frecuente utilizar `auto` dentro de Flexbox.

Por ejemplo:

```css
.menu {
    display: flex;
}

.login {
    margin-left: auto;
}
```

El margen izquierdo ocupa todo el espacio libre y desplaza el elemento hacia la derecha.

Esta técnica se estudiará con más detalle en la unidad dedicada a Flexbox.

---

 -->


## Marjinak eta atzeko planoa {#marjinak-atzeko-planoa}

Ezaugarri garrantzitsu bat da atzeko kolorea **ez dela marjinera hedatzen**.

Adibidez:

::: mycode
[Marjinak eta atzeko planoa]{.title}
```css
.caja {
    margin: 20px;
    background-color: lightblue;
    border: 1px solid black;
}
```
:::

Kolore urdina ertzera iritsi arte bakarrik hedatzen da. Hortik aurrera dagoen guztiak, hau da, marjinak, ez du atzeko kolore hori izango.

::: errorbox
Garrantzitsua da kaxaren edukia noraino iristen den ulertzea; atzeko kolorea ez da ertzetik haratago hedatzen.
:::

## Marjinen kolapsoa {#marjinen-kolapsoa}

**Marjin bertikalen** ezaugarri esklusibo bat **marjinen kolapsoa** da (*margin collapsing*).

::: questionbox
Demagun A eta B blokeak ditugula, biak bertikalki jarraian. A-k [margin-bottom=20px]{.verbatim} du, eta B-k [margin-top=30px]{.verbatim}. Zein izango da bien arteko bereizketa bertikala?
:::


Logikak 50px pentsatzera eramango gintuzke, baina ez da horrela, **aldameneko marjin bertikalek** kolapsatu egiten baitute eta handiena erabiltzen baita; kasu honetan, 30px. [Dokumentazioan](https://developer.mozilla.org/en-US/docs/Web/CSS/Guides/Box_model/Margin_collapsing) kasu guztiak azaltzen dira.

Kontuan izan behar da kolapsoa ez dela kasu guztietan gertatzen. Adibidez:

- Marjin horizontaletan.
- Flexbox elementuetan.
- Grid elementuetan.
- Posizionamendu berezia duten elementuetan.
- Padding edo ertz baten bidez bereizitako elementuetan.

Horregatik, Flexbox edo Grid-en oinarritutako diseinu modernoetan portaera hori askoz gutxiagotan agertzen da.


::: exercisebox
[[04g](https://github.com/yuki/ejercicios/blob/main/daw/diw/04g.html)]{.solution}

Sortu hainbat elementu marjinak gehituz. Egiaztatu zer gertatzen den [auto]{.verbatim} erabiltzean, aztertu marjin bertikalen eta horizontalen arteko desberdintasuna, eta egiaztatu elkarren ondoan dauden elementuen marjin bertikalen kolapsoa.
:::

