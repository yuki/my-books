
# Koloreak {#colores}

Koloreak web-interfaz baten diseinuaren oinarrizko zati bat dira. CSSk testuaren, atzeko planoen, ertzen eta beste hainbat elementu bisualen kolorea definitzeko aukera ematen du. Koloreen bidez, ikus-identitate bat ezar dezakegu, elementuak bereizi, erabiltzailearen arreta erakarri eta edukiaren irakurgarritasuna hobetu.

CSSk koloreak zehazteko hainbat modu eta propietate ugari eskaintzen ditu, bai testuaren kolorea bai elementuen atzeko planoa kontrolatzeko.

Aurretik ikusi dugu nola aldatu testuaren kolorea aurreko adibideetan, eta badakigu normalean heredatzen den propietatea dela.

::: mycode
[CSS]{.title}
```css 
p { color: blue; }
```
:::


## Koloreak nola zehaztu {#cómo-especificar-colores}

Koloreak esleitzerakoan, kolorea adierazteko hainbat modu aukera ditzakegu:

### Koloreen izenak {#nombre-colores}

CSSk ingelesez ezagutzen dituen kolore-izen ugari daude. [red]{.verbatim} edo [blue]{.verbatim} bezalako hainbat adibide ikusi ditugu, baina [beste asko](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference/Values/named-color) ere badaude.

Honako hauek dira kolore estandarrak: aqua, black, blue, fuchsia, gray, green, lime, maroon, navy, olive, purple, red, silver, teal, white, yellow.

Izen batzuk beste batzuen aliasak dira, hala nola:

- [aqua / cyan]{color=cyan}
- [fuchsia / magenta]{color=magenta}
- [darkgray / darkgrey]{color=DarkGrey}
- [darkslategray / darkslategrey]{color=DarkSlateGrey}
- [dimgray / dimgrey]{color=DimGrey}
- [lightgray / lightgrey]{color=LightGrey}
- [lightslategray / lightslategrey]{color=LightSlateGrey}
- [gray / grey]{color=Grey}
- [slategray / slategrey]{color=SlateGrey}

Ondorengo oharrak ere kontuan hartu behar dira:

- Darkgray Gray baino argiagoa da.
- Lightpink Pink baino ilunagoa da.

Oinarrizko probak egiteko izen horiek erabiltzea ondo dagoen arren, haien erabilera nahiko mugatua da.

### Koloreak balio hamaseitarren bidez {#valores-hexadecimales}

CSSn koloreak definitzeko gehien erabiltzen den moduetako bat balio hamaseitarrak erabiltzea da. Kolore hamaseitar bat [#]{.verbatim} sinboloarekin hasten da eta normalean sei karakterez osatuta dago:

::: mycode
[Koloreak hamaseitarrean]{.title}
```css
p { color: #ff0000; }
```
:::


:::::::::::::: {.columns }
::: {.column width="70%"}

Sei karaktereek osagai hauek adierazten dituzte:

- Gorria ([R]{.verbatim}).
- Berdea ([G]{.verbatim}).
- Urdina ([B]{.verbatim}).

Horregatik, sistema honi **RGB hamaseitarra** deritzo, eta [#RRGGBB]{.verbatim} gisa adierazten da. Osagai bakoitzak [00]{.verbatim} eta [FF]{.verbatim} arteko balioa izan dezake. Karaktere hamaseitarrak letra xehez ere idatz daitezke.


:::
::: {.column width="30%" }

![Iturria: [Wikipedia](https://en.wikipedia.org/wiki/RGB_color_model)](img/diw/Venn_diagram_rgb.svg){width=100%}

:::
::::::::::::::

Sistema honekin 24 biteko kolore-**[sakontasuna](https://es.wikipedia.org/wiki/Profundidad_de_color)** dugu (8 bit kanal bakoitzeko), eta horrek 16.777.216 koloreko aniztasuna ematen du.


Horrela, adibide erraz gisa:

- #000000: beltza, kolorerik ez dagoelako.
- #[FF]{color=red}0000: gorria
- #00[FF]{color=green}00: berdea
- #0000[FF]{color=blue}: urdina
- #FFFFFF: zuria, kolore guztiak batera

Osagai bakoitzaren bikoteak bi karaktere berdinez osatuta daudenean, hiru karaktereko forma laburtua erabil dezakegu. Beraz, honako adibide hauek baliokideak dira:

- #FF0000 = #F00
- #112233 = #123
- #00FFAA = #0FA

### Koloreak [rgb()]{.verbatim} erabiliz {#valores-rgb}

Beste aukera bat [rgb()]{.verbatim} funtzioa erabiltzea da, RGB sistema berriro adierazteko. Funtzio honekin osagai bakoitza bi modutan adieraz daiteke:

- [0]{.verbatim} eta [255]{.verbatim} arteko balio baten bidez.
- %0 eta %100 arteko ehuneko baten bidez.

::: mycode
[Koloreak [rgb()]{.verbatim}-rekin]{.title}
```css
p {
    color: rgb(255 0 0);
    background-color: rgb(30% 20% 50% );
}
```
:::

Hurrengo taulan agertzen diren koloreak berdinak dira:

| Hexadecimal | RGB | RGB | 
|-----|-----|-----|
| [#FF0000]{.verbatim}  | [rgb(255 0 0)]{.verbatim} | [rgb(100% 0% 0%)]{.verbatim} |
| [#00FF00]{.verbatim}  | [rgb(0 255 0)]{.verbatim} | [rgb(0% 100% 0%)]{.verbatim} |
| [#0000FF]{.verbatim}  | [rgb(0 0 255)]{.verbatim} | [rgb(0% 0% 100%)]{.verbatim} |
| [#FFFFFF]{.verbatim}  | [rgb(255 255 255)]{.verbatim} | [rgb(100% 100% 100%)]{.verbatim} |
| [#000000]{.verbatim}  | [rgb(0 0 0)]{.verbatim} | [rgb(0% 0% 0%)]{.verbatim} |


::: warnbox
Lehen, [rgb()]{.verbatim} funtzioko balioak komaz bereizten ziren, baina gaur egun ez da beharrezkoa.
:::

### Koloreak HSL-rekin {#colores-hsl}

:::::::::::::: {.columns }
::: {.column width="70%"}

CSSk **[HSL](https://en.wikipedia.org/wiki/HSL_and_HSV)** eredua erabiliz koloreak definitzeko aukera ere ematen du. HSL siglek honako hau esan nahi dute:

- ***Hue***: tonua/ñabardura.
- ***Saturation***: saturazioa.
- ***Lightness***: argitasuna.

CSSn [hsl()]{.verbatim} funtzioaren bidez erabil daiteke. Hurrengo adibidean kolore gorria erakusten da:

:::
::: {.column width="30%" }

![Fuente: [Wikipedia](https://en.wikipedia.org/wiki/HSL_and_HSV)](img/diw/HSL_color_solid_cylinder.png){width=100%}

:::
::::::::::::::



::: mycode
[Koloreak [hsl()]{.verbatim}-rekin]{.title}
```css
p { color: hsl(0 100% 50%); }
```
:::


:::::::::::::: {.columns }
::: {.column width="70%"}

HSLk balioak zilindro baten moduan adierazten ditu. Lehenengo balioak tonua adierazten du eta angelu baten bidez adierazten da. Adibidez:

- 0°: gorria
- 60°: horia
- 120°: berdea
- 180°: cyana
- 240°: urdina
- 300°: magenta
- 360°: gorria berriro, zirkuluari bira osoa eman diogulako.

Saturazioa eta argitasuna ehunekoen bidez adierazten dira.

:::
::: {.column width="30%" }

![Fuente: [techterms](https://techterms.com/img/xl/hsl_1546.png)](img/diw/hsl_1546.png){width=100%}

:::
::::::::::::::


Saturazioak %100eko balioa duenean, %50ekoa duenean baino biziagoa da. Argitasuna txikiagoa denean, kolore ilunagoa lortzen dugu, eta %0 jartzen badugu, beltza izango da.

HSL bereziki erosoa izan daiteke kolore beraren aldaerak sortu behar ditugunean. Hurrengo adibidean, argitasunarekin jolastuz, kolore beraren 3 aldaera lortuko ditugu:

::: mycode
[HSL-rekin argitasun-aldaketa]{.title}
```css
.color-base {
    color: hsl(210 80% 50%);
}
.color-claro {
    color: hsl(210 80% 70%);
}
.color-oscuro {
    color: hsl(210 80% 30%);
}
```
:::

### Alfa-kanala {#canal-alfa}

Alfa-kanalak (ingelesez *alpha*) kolore baten gardentasuna edo opakutasuna kontrolatzeko aukera ematen du. Bai [rgb()]{.verbatim} bai [hsl()]{.verbatim} funtzioetan erabil daiteke, bi funtzioei laugarren parametro bat gehituz, [/]{.verbatim} karakterearen ondoren.


::: mycode
[Gardentasuna gehitu zaio kolore bati]{.title}
```css
h1{
    background-color: rgb(0 0 255 / 50%);
}
h2{
    background-color: hsl(240 100% 50% / 0.5);
}
h3{
    background-color: #FF00007F;
}
```
:::

Alfa-kanala ehuneko gisa edo [0]{.verbatim} eta [1]{.verbatim} arteko balio baten bidez adieraz daiteke. Bi adibideetan adierazten ari gara zehaztutako koloreak %50eko opakutasuna duela, honela funtzionatzen baitu:

- [0%]{.verbatim}: erabat gardena.
- [50%]{.verbatim}: erdi-gardena.
- [100%]{.verbatim}: erabat opakua.

Sistema hamaseitarrean, amaieran beste bikote berri bat gehitu behar da gardentasun-maila adierazteko.

Alfa-kanala zehazteko beste modu batzuk ere badaude, [rgba()]{.verbatim} eta [hsla()]{.verbatim} funtzioak erabiliz, baina CSS modernoan aurrez ikusitako funtzioen aliasak dira.


### [transparent]{.verbatim} gako-hitza {#palabra-transparent}

Zerbait erabat gardena izatea nahi badugu, [transparent]{.verbatim} gako-hitza erabil dezakegu. [Dokumentazioan](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference/Values/named-color\#transparent) azaltzen den bezala, [rgb(0 0 0 / 0%)]{.verbatim}-ren aliasa/*shortcut* da.

Elementu baten atzeko planoa zehazteko erabili ohi da, horrela atzean egon daitekeen atzeko planoa ikusgai uzteko.

::: mycode
[Atzeko plano gardena]{.title}
```css
h1{
    background-color: transparent;
}
```
:::

## Zein sistema erabili {#sistema-a-utilizar}

:::::::::::::: {.columns }
::: {.column width="70%"}
Erantzun anbiguoa eman dezakeen arren, proiektuaren eta azken teknologia erabiliko dugunaren araberakoa da, horrek ere eragina baitu.

Sistema hamaseitarra edo [rgb()]{.verbatim} funtzioa erabiltzen dugunean, [sRGB](https://en.wikipedia.org/wiki/SRGB) izeneko [kolore-espazioarekin](https://en.wikipedia.org/wiki/Color_space) lan egiten ari gara. Sistema horrek, aurrez esan bezala, 24 bit erabiltzen ditu (8 kanal bakoitzeko), guztira 16.777.216 kolore lortuz.

Aitzitik, [hsl()]{.verbatim} erabiltzean ez gara kanal bakoitzeko 8 bit horietara mugatzen, eta gure nabigatzaileak/sistemak/pantailak beste kolore-sakontasun bat erabiltzen badu, hori erabili ahal izango dugu.

Teknologiak aurrera egin ahala, koloreak adierazteko modu berriak behar ditugu, kolore-espazioa zabaltzen ari delako; adibidez, kanal bakoitzeko 10 kolore-bit, HDR, ...
:::
::: {.column width="30%" }

![sRGB eta BT2020 arteko konparaketa](img/diw/color_scheme.svg){width=100%}

:::
::::::::::::::


## Koloreak eta interfazeen diseinua {#colores-diseño-interfaces}

Interfaze batean normalean ez ditugu koloreak modu isolatuan erabiliko; ohikoena paleta txiki bat definitzea da. Adibidez:

- Kolore nagusia
- Bigarren mailako kolorea
- Atzeko planoko kolorea
- Testuaren kolorea
- Bigarren mailako testuaren kolorea
- Arrakasta-kolorea
- Errore-kolorea
- Abisu-kolorea

Aurrerago, CSS aldagaiak aztertzen ditugunean, balio horiek zentralizatu ahal izango ditugu.



# Atzeko planoak {#fondos}

CSSk elementuen atzeko planoa kontrolatzeko aukera ematen du hainbat propietateren bidez. Koloreak, irudiak eta gradienteak erabil ditzakegu, eta haien tamaina, posizioa edo errepikapena bezalako alderdiak kontrolatu.

Atzeko planoekin lotutako propietateak bereziki garrantzitsuak dira interfazeen diseinuan, txartelak, goiburuak, botoiak, atal nabarmenduak eta beste ikusizko osagai batzuk sortzeko aukera ematen baitute.

## Atzeko planoaren kolorea {#background-color}

[background-color]{.verbatim} propietateak elementu baten atzeko planoaren kolorea ezartzeko aukera ematen du. Aurretik aztertutako edozein kolore-formatu erabil dezakegu:


::: mycode
[Gehitu kolorea atzeko planoan]{.title}
```css
body {background-color: #d0d0d0}
.div1 { background-color: #2563eb }
.div2 { background-color: rgb(37, 235, 212) }
.div3 { background-color: hsl(262 83% 53% / 0.5) }
```
:::

Propietate hori edozein elementuri eslei diezaiokegu, baita dokumentuaren atzeko planoari ere [body]{.verbatim} elementuaren bidez, adibidean ikus daitekeen bezala.

::: exercisebox
[[04a](https://github.com/yuki/ejercicios/blob/main/daw/diw/04a.html)]{.solution}

Sortu hainbat elementu eta gehitu kolorea haien atzeko planoan, aurretik ikusitako sistema desberdinak erabiliz.
:::

## Atzeko planoko irudiak {#background-image}

[background-image]{.verbatim} propietateak irudi bat atzeko plano gisa erabiltzeko aukera ematen du.

::: mycode
[Gehitu irudia atzeko planoan]{.title}
```css
div { background-image: url("fondo.jpg"); }
```
:::

[url()]{.verbatim} funtzioak irudiaren helbidea adierazten du. Bidea CSS fitxategiarekiko erlatiboa edo absolutua izan daiteke, aplikazioa nola antolatuta dagoen kontuan hartuta. Bide erlatiboa izatea nahi badugu, honako fitxategi-egitura hau dugula irudikatuz:

::: mycode
[Fitxategi estruktura]{.title}
```text
proyecto/
├── css/
│   └── estilos.css
└── img/
    └── fondo.jpg
```
:::

Irudia [estilos.css]{.verbatim} fitxategitik kargatzeko, honako bide hau erabiliko dugu: [url("../img/fondo.jpg")]{.verbatim}.

[background-image]{.verbatim} [background-color]{.verbatim}-rekin batera erabil dezakegu, baina koloreak irudia erabilgarri ez dagoenean bakarrik funtzionatuko du.


::: exercisebox
[[04b](https://github.com/yuki/ejercicios/blob/main/daw/diw/04b.html)]{.solution}

Sortu elementuak eta gehitu irudiak atzeko plano gisa. Egiaztatu zer gertatzen den [background-color]{.verbatim} gehitzen bada eta irudia existitzen ez bada.
:::


### [background-repeat]{.verbatim} {#background-repeat}

Atzeko planoko irudi bat errepikatu egin daiteke erabilgarri dagoen espazio guztia betetzeko. Portaera hori [[background-repeat]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference/Properties/background-repeat) propietatearen bidez kontrola dezakegu. Haren balio nagusietako batzuk, besteak beste, hauek dira:

- [repeat]{.verbatim}: irudia horizontalki zein bertikalki errepikatzea ahalbidetzen du. Atzeko planoko irudi baten portaera lehenetsia da. Bereziki erabilgarria da ereduak osatzen dituzten irudi txikiak erabiltzen ditugunean.
- [repeat-x]{.verbatim}: irudia horizontalki errepikatzen da.
- [repeat-y]{.verbatim}: irudia bertikalki errepikatzen da.
- [no-repeat]{.verbatim}: irudia errepika ez dadin erabiltzen da; aukera egokiena da atzeko plano gisa argazki bakar bat gehitu nahi dugunean.
- [space]{.verbatim}: irudia ebakirik egin gabe errepikatzen da. Lehenengo irudia elementuaren hasieran eta amaieran jartzen da, eta erdian errepikapenak gehitzen dira, tarte libreak utziz.

Hurrengo irudiak [MDN](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference/Properties/background-repeat) adibidetik hartutakoak dira.

:::::::::::::: {.columns }
::: {.column width="33%"}
![repeat](img/diw/repeat.png){width=100%}
:::
::: {.column width="33%" }
![repeat-x](img/diw/repeat-x.png){width=100%}
:::
::: {.column width="33%" }
![no-repeat](img/diw/no-repeat.png){width=100%}
:::
::::::::::::::

::: exercisebox
[[04c](https://github.com/yuki/ejercicios/blob/main/daw/diw/04c.html)]{.solution}

Egiaztatu [background-repeat]{.verbatim}-ren parametro desberdinen arteko aldea.
:::


### Atzeko planoko hainbat irudi {#varias-imágenes-fondo}

CSSk aldi berean atzeko planoko hainbat irudi erabiltzeko aukera ematen du; horri esker, irudiak konbina ditzakegu efektuak sortzeko, aurrez prozesatu beharrik gabe.

Hainbat irudi jartzean, geruzak bata bestearen gainean gehituz funtzionatzen du: jartzen den lehenengoa bigarrenaren gainean egongo da, bigarrena hirugarrenaren gainean, eta horrela hurrenez hurren.

[W3C](https://www.w3schools.com/Css/tryit.asp?filename=trycss3_background_multiple) dokumentazioko hurrengo adibidean bi irudi gehitu zaizkio elementu bati:


:::::::::::::: {.columns columnsep="0.5cm"}
::: {.column width="35%"}

::: {.mycode size="footnotesize"}
[HTML]{.title}
```html
<div id="example1">
  <h1>Lorem Ipsum</h1>
  <p>Lorem ipsum  ...</p>
</div>
```
:::


:::
::: {.column width="65%" }

::: {.mycode size="footnotesize"}
[CSS]{.title}
```css
#example1 {
  background-image: url(img_flwr.gif), url(paper.gif);
  background-position: right bottom, left top;
  background-repeat: no-repeat, repeat;
  padding: 15px;
}
#example1 p {
	width:60%;
}
```
:::

:::
::::::::::::::

Ikus daitekeen bezala, hainbat [url()]{.verbatim} parametro gehi daitezke [background-image]{.verbatim}-en, eta gauza bera egin daiteke posizioarekin eta irudia errepikatzea nahi badugu.

::: warnbox
Garrantzitsua da gogoratzea irudiak geruzatan antolatzen direla, "goitik" beherantz.
:::


## Atzeko planoaren beste propietate batzuk {#otras-propiedades}

Atzeko planoarekin lotutako beste propietate batzuk ere badaude; beraz, komeni da bakoitzaren dokumentazioa kontsultatzea, eskaintzen dituen aukerak ezagutzeko.

- [background-position]{.verbatim}: atzeko planoko irudi baten posizioa kontrolatzeko aukera ematen du, honako balio hauek erabiliz:
  - Gako-hitzak, konbina daitezkeenak: [left]{.verbatim}, [center]{.verbatim}, [right]{.verbatim}, [top]{.verbatim} edo [bottom]{.verbatim}.
  - Ehunekoak, bi posiziorekin: ezkerretik eta goitik dagoen posizioa.
  - [px]{.verbatim} eta [em]{.verbatim} bezalako posizioak ere erabil daitezke.
- [background-size]{.verbatim}: atzeko planoko irudiaren tamaina kontrolatzeko aukera ematen du.
  - Dimentsio bakarra jartzen badugu, zabalera izango da eta proportzioa mantenduko du. Bigarren bat gehitzen badugu, altuera izango da.
  - [cover]{.verbatim} hitz erreserbatua erabiltzen badugu, elementu osoa estaliko du, baina proportzioa bat ez badator, irudiaren zati bat ikusgai dagoen eremutik kanpo gera daiteke.
  - [contain]{.verbatim} hitz erreserbatua erabiltzen badugu, irudia eskalatu egingo da elementuaren barruan osorik ikus dadin, baina espazio librea utziko du.
- [background-attachment]{.verbatim}: scroll-a egiten dugunean atzeko planoaren portaera kontrolatzeko aukera ematen du. Balio hauek onartzen ditu:
  - [scroll]{.verbatim}: ohiko portaera.
  - [fixed]{.verbatim}: kasu honetan, atzeko planoa finko gera daiteke edukia desplazatzen dugun bitartean.
- [background-origin]{.verbatim}: atzeko planoko irudia kutxaren zein eremutatik kokatzen den zehazteko aukera ematen du. Balioak [border-box]{.verbatim}, [padding-box]{.verbatim} edo [content-box]{.verbatim} dira.


::: mycode
[Propietate jakin batzuen adibideak soilik]{.title}
```css
.a {background-position: top left;}
.b {background-position: 10% 50%;}
.c {background-position: 10em 50px;}
.d {background-size: 300px;}
.e {background-size: cover;}
.f {background-size: contain;}
```
:::


## Gradienteak {#degradados}

CSSk gradienteak sortzeko aukera ematen du kanpoko irudirik erabili beharrik gabe. Gradienteak nabigatzaileak berak sortzen ditu, eta horri esker ikusmen aldetik konplexuak diren atzeko planoak sor daitezke irudirik deskargatu beharrik gabe.

Gradienteak sortzeko hainbat modu daude:

- [[linear-gradient()]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference/Values/gradient/linear-gradient): gradiente lineal bat sortzen du. Norabidea lehen parametro gisa adieraz daiteke:
  - [to right]{.verbatim}: gradientea ezkerretik eskuinera doa.
  - [to bottom]{.verbatim}: goitik behera.
  - Bi kolore baino gehiago adieraz daitezke, eta nabigatzaileak haien arteko trantsizioak egingo ditu. Horietako bakoitzaren posizioa ere adieraz daiteke.
- [[radial-gradient()]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference/Values/gradient/radial-gradient): erdiko puntu batetik abiatzen eta kanporantz hedatzen den gradientea sortzen du.
- [[conic-gradient]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference/Values/gradient/conic-gradient): erdiko puntu baten inguruan gradiente koniko bat sortzen du.

::: {.mycode size="footnotesize"}
[Gradiente]{.title}
```css
.a { background: linear-gradient(red, orange); }
.b { background: linear-gradient(to right, red, orange, yellow); }
.c { background: linear-gradient(45deg, red 25%, yellow 50%, blue 100% ); }
.d { background: linear-gradient( to right, red 0%, yellow 50%, blue 100% ); }
.e { background: radial-gradient(circle, white, blue); }
.f { background: conic-gradient(red, orange, yellow, green, blue, purple, red); }
```
:::

:::::::::::::: {.columns }
::: {.column width="25%"}
![](img/diw/gradient1.png){width=100%}
:::
::: {.column width="25%" }
![](img/diw/gradient2.png){width=100%}
:::
::: {.column width="25%" }
![](img/diw/gradient3.png){width=100%}
:::
::: {.column width="25%" }
![](img/diw/gradient4.png){width=100%}
:::
::::::::::::::

::: exercisebox
[[04d](https://github.com/yuki/ejercicios/blob/main/daw/diw/04d.html)]{.solution}

Sortu hainbat gradiente, ikusitako aukerak eta dokumentazioan agertzen direnak erabiliz.
:::

### Irudi baten gaineko gradientea {#degradado-sobre-imagen}

Irudiak bata bestearen gainean jar daitezkeela ikusi dugun bezala, gradiente bat ere sor dezakegu irudi baten gainean jartzeko.

::: {.mycode size="footnotesize"}
[Gradiente]{.title}
```css
.a {
    background-image:
        linear-gradient(
            rgb(0 0 0 / 50%),
            rgb(0 0 0 / 50%)
        ),
        url("paisaje.jpg");
}
```
:::

Emaitza argazki ilundu bat da, geruza beltz erdi-gardenez estalia, eta haren gainean testua jar dezakegu.


## [background]{.verbatim} propietate laburtua {#propiedad-background}

Atzeko planoak propietate espezifikoen bidez nola sortu edo gehitu ikusi dugu, baina [background]{.verbatim} propietateari aurrez ikusitako atributu guztiak gehi dakizkioke, ondorengo ordenan:


::: {.mycode size="footnotesize"}
[CSS]{.title}
```css
.caja {
    background:
        #222
        url("imagen.jpg")
        no-repeat
        center
        / cover;
}
```
:::

Propietate bakar honekin atzeko planoaren kolorea, irudi bat, errepikapena, posizioa eta tamaina ezarri ditugu. Propietate laburtua oso erabilgarria izan daiteke, baina hasieran errazagoa izan daiteke propietate bakoitza banaka erabiltzea.

