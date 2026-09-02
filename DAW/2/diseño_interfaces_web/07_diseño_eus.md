
# [display]{.verbatim} {#display}

**[display]{.verbatim}** propietateak HTML elementu bat dokumentuaren barruan nola irudikatzen den zehazten du. CSSko propietate garrantzitsuenetako bat da, elementu batek lerro osoa hartzen duen, testuaren moduan jokatzen duen, beste elementu batzuekin lerrokatu daitekeen edo orrialdearen fluxutik erabat desagertzen den kontrolatzen baitu.

Aurretik ikusi dugu elementuak [bloke](#elementos-bloque) eta [lerroko](#elementos-en-línea) elementuen artean bereiz daitezkeela; hala ere, CSSk portaera hori aldatzeko aukera ematen du [display]{.verbatim} propietatearen bidez.

[display]{.verbatim}-ri eman diezazkiokegun balioak hauek dira:

| Balioa | Erabilera nagusia |
|--------|-------------------|
| [block]{.verbatim} | Bloke-elementua |
| [inline]{.verbatim} | Lerroko elementua |
| [inline-block]{.verbatim} | Bloke eta lerroaren arteko nahasketa |
| [none]{.verbatim} | Elementua ezkutatzen du |
| [flex]{.verbatim} | Flexbox edukiontzia |
| [inline-flex]{.verbatim} | Lerroko Flexbox |
| [grid]{.verbatim} | Grid edukiontzia |
| [inline-grid]{.verbatim} | Lerroko Grid |


Unitate honetan lehenengo lauetan zentratuko gara. Flexbox eta Grid hurrengo unitateetan aztertuko ditugu.



## [display: block]{.verbatim} {#display-block}

Edozein elementu bloke-elementu bihur dezakegu.

:::::::::::::: {.columns columnsep=0.5cm}
::: {.column width="50%"}

::: {.mycode}
[HTML]{.title}
```html
<span>Inicio</span>
```
:::

:::
::: {.column width="50%" }

::: {.mycode}
[CSS]{.title}
```css
span {
    display: block;
}
```
:::

:::
::::::::::::::


Orain [<span>]{.verbatim} lerro berri batean hasiko da eta erabilgarri dagoen zabalera osoa hartuko du. Baliabide hau oso erabilgarria da estekak edo lerroko elementuak osagai handiago bihurtzeko.


## [display: inline]{.verbatim} {#display-inline}

Bloke-elementu bat lerroko elementu bihur dezakegu.

:::::::::::::: {.columns columnsep=0.5cm}
::: {.column width="50%"}

::: {.mycode}
[HTML]{.title}
```html
<div>Uno</div>
<div>Dos</div>
<div>Tres</div>
```
:::

:::
::: {.column width="50%" }

::: {.mycode}
[CSS]{.title}
```css
div {
    display: inline;
}
```
:::

:::
::::::::::::::

Emaitza hiru elementuak lerro bakarrean izango dira, bata bestearen ondoan. Hala ere, muga garrantzitsu bat dute: **ez dituzte behar bezala errespetatzen [width]{.verbatim} eta [height]{.verbatim}**, lerroko elementuen tamaina batez ere edukiaren arabera zehazten baita. Tamaina kontrolatu behar dugunean, normalean [inline-block]{.verbatim} erabiltzen da, jarraian ikusiko dugun bezala.



## [display: inline-block]{.verbatim} {#display-inline-block}

[inline-block]{.verbatim} aukerak bi ereduen abantailak konbinatzen ditu. Ezaugarriak:

- Beste elementu batzuekin lerro berean kokatzen da.
- [width]{.verbatim} eta [height]{.verbatim} definitzeko aukera ematen du.
- [padding]{.verbatim} eta [margin]{.verbatim} errespetatzen ditu.


::: mycode 
[CSS]{.title}
```css
.boton {
    display: inline-block;
    width: 140px;
    padding: 12px;
    border: 1px solid black;
}
```
:::

Oso erabilia izan den propietatea da botoiak eta osagai txikiak sortzeko, Flexbox ezagun egin aurretik.


## [display: none]{.verbatim} {#display-none}

[none]{.verbatim} balioak elementua dokumentuaren fluxutik erabat ezabatzen du.


:::::::::::::: {.columns columnsep=0.5cm}
::: {.column width="50%"}

::: {.mycode}
[HTML]{.title}
```html
<p>Primer párrafo</p>
<p class="oculto">Segundo</p>
<p>Tercer párrafo</p>
```
:::

:::
::: {.column width="50%" }

::: {.mycode}
[CSS]{.title}
```css
.oculto {
    display: none;
}
```
:::

:::
::::::::::::::



Bigarren paragrafoa desagertu egiten da eta espazioa betetzeari uzten dio.

### [display: none]{.verbatim} eta [visibility: hidden]{.verbatim} arteko aldea {#diferencias-display-visibility}

Bi propietateek elementuak ezkutatzen dituzten arren, haien portaera desberdina da.

- [display: none]{.verbatim}
  - Ez da bistaratzen.
  - Ez du espaziorik hartzen.
  - Dokumentuaren fluxutik desagertzen da.
- [visibility: hidden]{.verbatim}
  - Ez da bistaratzen.
  - **Bai, espazioa hartzen du**.
  - Gainerako elementuek beren kokapenari eusten diote.

[visibility]{.verbatim} xehetasunez aztertuko dugu aurrerago.


## Balioak: [flex]{.verbatim} eta [grid]{.verbatim} {#valores-flex-grid}

Balio klasikoez gain, [display]{.verbatim}-ek maketazio-sistema osoak aktibatzen ditu.

- [display: flex]{.verbatim}: Elementua edukiontzi malgu bihurtzen du.
- [display: grid]{.verbatim}: Elementua sare-edukiontzi bihurtzen du.


Bi eredu hauek sakonago ikusiko ditugu aurrerago.


## Balioak: [inline-flex]{.verbatim} eta [inline-grid]{.verbatim} {#valores-inline-flex-inline-grid}

Lerroko bertsioak ere badaude. Dokumentuarekiko lerroko elementu baten moduan jokatzen dute, baina barneko edukiak Flexbox edo Grid erabiltzen du. Erabilgarriak dira osagai txikietarako, hala nola botoi- edo ikono-taldeetarako.


## Elementu baten portaera aldatzea {#cambiar-comportamiento-elemento}

CSSren indarguneetako bat da portaera bisuala alda daitekeela HTMLa aldatu gabe. Adibidez, *navbar* estiloko menu bat zerrenda gisa idatz daiteke:


::: {.mycode}
[HTML]{.title}
```html
<ul>
    <li>Inicio</li>
    <li>Productos</li>
    <li>Contacto</li>
</ul>
```
:::


Posteriormente, CSSk bere elementuak banaketa horizontal batean bihur ditzake [display]{.verbatim} erabiliz. Horri esker, HTML semantikoa mantendu eta CSS aurkezpenerako soilik erabil daiteke.


::: exercisebox
[[06a](https://github.com/yuki/ejercicios/blob/main/daw/diw/06a.html)]{.solution}

Egiaztatu bloke-elementuen eta lerroko elementuen arteko desberdintasunak, eta ikusi [display]{.verbatim}-ek [block]{.verbatim}, [inline]{.verbatim} eta [inline-block]{.verbatim} balioekin haien portaeran duen eragina. Saiatu zerrenda batekin *navbar* bat egiten.
:::


# [position]{.verbatim}

Lehenespenez, HTML elementuak dokumentuan idatzita dauden ordena berean agertzen dira. Nabigatzaileak bata bestearen atzean kokatzen ditu, orrialdearen fluxu normala errespetatuz.

**[position]{.verbatim}** propietateak portaera hori aldatzeko eta elementu baten kokapen zehatza kontrolatzeko aukera ematen du. Horri esker, menu finkoak, leiho emergenteak, irudien gaineko etiketak edo orrialdea desplazatzean ikusgai mantentzen diren elementuak sor ditzakegu.

Eskuragarri dauden balioak hauek dira:

| Balioa | Deskribapena |
|--------|-------------|
| [static]{.verbatim} | Ohiko kokapena |
| [relative]{.verbatim} | Jatorrizko kokapenarekiko desplazamendua |
| [absolute]{.verbatim} | Aitzindari batekiko kokapen absolutua |
| [fixed]{.verbatim} | Leihoarekiko kokapen finkoa |
| [sticky]{.verbatim} | Erlatiboaren eta finkoaren konbinazioa |

Bakoitzak nabigatzaileak elementuaren kokapena kalkulatzeko modua aldatzen du. Elementu bat mugitzeko, [top]{.verbatim}, [right]{.verbatim}, [bottom]{.verbatim} eta [left]{.verbatim} propietateak ere erabiltzen dira; adibideetan ikusiko ditugu elementua kokatzeko.


## Dokumentuaren fluxu normala {#flujo-normal}

Ikus dezagun dokumentu sinple bat.

::: {.mycode}
[HTML]{.title}
```html
<header>Cabecera</header>

<main>Contenido</main>

<footer>Pie de página</footer>
```
:::


Kokapen-propietaterik aplikatu gabe, nabigatzaileak HTMLaren ordenari jarraituz kokatzen ditu elementuak. Portaera horri **dokumentuaren fluxu normala** (*[Normal Flow](https://developer.mozilla.org/en-US/docs/Learn_web_development/Core/CSS_layout/Introduction\#normal_layout_flow)*) deritzo.

Elementu guztiek hasieran [position: static]{.verbatim} dute.


## [position: static]{.verbatim} {#position-static}

Balio lehenetsia da. Elementua fluxu normalaren barruan mantentzen da, eta [top]{.verbatim}, [right]{.verbatim}, [bottom]{.verbatim} eta [left]{.verbatim} propietateak ez dira kontuan hartzen.


::: {.mycode}
[CSS]{.title}
```css
div {
    position: static;
    top: 50px;
}
```
:::

Adibide honetan, [top]{.verbatim}-ek ez du inolako eraginik izango. Normalean ez da beharrezkoa [position: static]{.verbatim} idaztea, elementu guztiek hasieran balio hori baitute.


## [position: relative]{.verbatim} {#position-relative}

[relative]{.verbatim} balioak elementu bat **jatorrizko kokapenarekiko** desplazatzen du.


:::::::::::::: {.columns columnsep=0.5cm}
::: {.column width="50%"}

::: mycode
[HTML]{.title}
```html
<div class="caja">
    Caja
</div>
```
:::

:::
::: {.column width="50%" }

::: mycode
[CSS]{.title}
```css
.caja {
    position: relative;
    top: 20px;
    left: 20px;
}
```
:::

:::
::::::::::::::


Ondorioz, kutxa [20px]{.verbatim} mugitzen da eskuinera eta gora (**20px gehitzen ditu elementuaren ezkerrean eta goialdean**). Garrantzitsuena da **jatorrizko espazioak existitzen jarraitzen duela**. Hau da, gainerako elementuek kutxa mugitu ez balitz bezala jokatzen jarraitzen dute.

![[position: relative]{.verbatim}-ren adibidea](img/diw/position-relative.png){width=50%}

::: infobox
[top]{.verbatim}, [right]{.verbatim}, [bottom]{.verbatim} eta [left]{.verbatim} propietateek elementuaren alde horretan dagoen espazioa hartzen dute kontuan.
:::


Desplazamendu txikiez gain, [relative]{.verbatim}-ek oso funtzio garrantzitsua du: **elementu absolutuentzako erreferentzia gisa balio izatea**, ondoren ikusiko dugun bezala.

## [position: absolute]{.verbatim} {#position-absolute}

Elementu absolutu bat dokumentuaren fluxu normaletik ateratzen da.

:::::::::::::: {.columns columnsep=0.5cm}
::: {.column width="50%"}

::: mycode
[HTML]{.title}
```html
<div class="padre">
    <div class="hijo"></div>
</div>
```
:::

:::
::: {.column width="50%" }

::: mycode
[CSS]{.title}
```css
.padre {
    position: relative;
}

.hijo {
    position: absolute;
    top: 20px;
    left: 10px;
}
```
:::

:::
::::::::::::::


Seme-kutxa elementu gurasoaren eskuinera eta beherantz pixka bat kokatuta agertuko da. Gainerako elementuek semeak espaziorik hartuko ez balu bezala jokatuko dute.

![ [position: absolute]{.verbatim}-ren adibidea](img/diw/position-absolute.png){width=50%}

Elementu absolutu batek **[position]{.verbatim} balioa [static]{.verbatim} ez duen lehen aitzindaria** bilatzen du, eta halakorik ez badago, erreferentzia orrialde osoa izango da. Horregatik, oso ohikoa da adibidean agertzen den bezalako konbinazio bat aurkitzea.


::: infobox
Elementu absolutu batek **[position]{.verbatim} balioa [static]{.verbatim} ez duen lehen aitzindaria** bilatzen du.
:::

::: errorbox
Aitzindaririk ez badago posizionatuta, erreferentzia orrialde osoa izango da.
:::


Jar dezagun beste adibide bat, oraingoan irudi baten gainean jarritako testu batekin:

:::::::::::::: {.columns columnsep=0.5cm}
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```html
<div class="producto">
    <img src="camiseta.jpg" alt="">
    <span class="oferta">-20%</span>
</div>
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[CSS]{.title}
```css
.producto {
    position: relative;
}

.oferta {
    position: absolute;
    top: 10px;
    left: 10px;
    background: crimson;
    color: white;
}
```
:::

:::
::::::::::::::


## [position: fixed]{.verbatim} {#position-fixed}

Elementu finko bat nabigatzailearen leihoaren kokapen berean mantentzen da beti. Erabiltzaileak scroll egiten badu ere, menuak ikusgai jarraituko du.

::: mycode
[CSS]{.title}
```css
.menu {
    position: fixed;

    top: 0;
    left: 0;
}
```
:::


Elementu finkoak honako hauetarako erabiltzen dira:

- Goiburuetarako.
- Gorantz itzultzeko botoietarako.
- Txat flotagarrietarako.
- Nabigazio-barretarako.

Dokumentuaren fluxu normaletik ere ateratzen dira.


## [position: sticky]{.verbatim} {#position-sticky}

[sticky]{.verbatim} balioak [relative]{.verbatim} eta [fixed]{.verbatim} balioen portaera konbinatzen du. Hasieran, elementua elementu normal baten moduan jokatzen da. Desplazamenduan zehar posizio jakin batera iristen denean, finkatuta geratzen da.


::: mycode
[CSS]{.title}
```css
aside {
    position: sticky;
    top: 20px;
}
```
:::


Elementua goiko ertzetik [20px]{.verbatim}-ra itsatsita mantenduko da, haren edukiontziaren barruan espazioa dagoen bitartean. Oso erabilgarria da aurkibideetarako eta alboko barrentzat.



::: exercisebox
[[06b](https://github.com/yuki/ejercicios/blob/main/daw/diw/06b.html)]{.solution}

Erabili [position]{.verbatim} propietatea ondorengo adibideak sortzeko:

- **Posizio estatikoa** duen kutxa.
- Gehitu irudi bati "Deskontua" testua, **posizio erlatiboarekin**, beheko ezkerrean.
- Sortu goiko aldean *fixed* dagoen *navbar* bat.
- Sortu "ohar" mezu bat, [sticky]{.verbatim} izan dadila paragrafo batzuk ikusten ditugun bitartean.
:::


::: questionbox
Zer dago "arraroa" ariketa honetan scroll egitean? **6d** ariketan konponduko dugu.
:::


# [float]{.verbatim} (ikuspegi historikoa)

**Flexbox** eta **CSS Grid** agertu aurretik, [[float]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference/Properties/float) propietatea zen zutabeekin, menu horizontalekin eta banaketa konplexuekin diseinuak sortzeko gehien erabiltzen zen tresna. Hamarkada bat baino gehiagoz, web-orriak maketatzeko eskuragarri zegoen ia irtenbide bakarra izan zen, nahiz eta benetan oso bestelako helburu batekin diseinatu zen.

Gaur egun [float]{.verbatim} **ez da jada maketazioak sortzeko erabiltzen**, baina CSS estandarraren parte izaten jarraitzen du eta oraindik ere erabilgarria da testua irudien inguruan jartzeko (hori baitzen bere jatorrizko helburua), testu-prozesadore batean bezala, aldizkari eta egunkarietan ikusten den moduan.


Propietateak lau balio nagusi onartzen ditu:

| Balioa | Deskribapena |
|--------|-------------|
| [left]{.verbatim} | Ezkerretara flotatzen du |
| [right]{.verbatim} | Eskuinerantz flotatzen du |
| [none]{.verbatim} | Flotaziorik gabe |
| [inline-start]{.verbatim} / [inline-end]{.verbatim} | Testuaren norabidera egokitutako bertsioak (gutxiago erabiltzen dira) |

[left]{.verbatim} eta [right]{.verbatim} erabiliz, elementua ezkerrera eta eskuinera desplazatuko da, hurrenez hurren, eta testuak (edo ondorengo elementuek) libre geratutako espazio hori hartuko dute. **Hori da gaur egun erabilera nagusia**.


:::::::::::::: {.columns columnsep=0.5cm}
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```html
<img src="moon.jpg" class="foto">

<p>Lorem ipsum dolor...</p>
<p>Lorem ipsum dolor...</p>

```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[CSS]{.title}
```css
.foto {
    float: left;
    margin-right: 1rem;
    margin-bottom: 0.5rem;
}
```
:::

:::
::::::::::::::


Elementu batek flotatzen duenean:

- Fluxu normaletik partzialki ateratzen da.
- Albo batera desplazatzen da.
- Ondorengo elementuak haren inguruan kokatzen saiatzen dira.


::: exercisebox
[[06c](https://github.com/yuki/ejercicios/blob/main/daw/diw/06c.html)]{.solution}

Erabili [float]{.verbatim} propietatea bi irudi inguratzeko, bata ezkerrean eta bestea eskuinean kokatuz.
:::


## Erabilera historikoak {#usos-históricos}

Beste sistema batzuen faltagatik, 2000ko hamarkadan [float]{.verbatim} diseinatuta ez zegoen maketazioa sortzeko erabiltzen zen, batez ere zutabeak sortzeko. Ikusmenean ondo funtzionatzen bazuen ere, mantentze-arazo ugari sortzen zituen.

Eragozpen ospetsuenetako bat edukiontziaren kolapsoa zen; horren ondorioz, elementu gurasoak altuera ezagutzeari uzten zion eta, beraz, elementua desplazatu egiten zen.

Horren ondorioz, maketazioa hobetzen eta arazo horiek saihesten saiatzeko *hack* batzuk sortzen hasi ziren. Gaur egun, ordea, zaharkituta daude **Flexbox** eta **Grid** agertu direlako.


::: errorbox
Ez litzateke [float]{.verbatim} erabili behar maketazioak egiteko, testuarekin irudi bat inguratzeko soilik.
:::


# [z-index]{.verbatim} propietatea {#z-index}

Web-interfaze askotan, hainbat elementu elkarren gainean jartzen dira: leiho modalak, goitibeherako menuak, goiburu finkoak, irudien gaineko etiketak edo botoi flotagarriak. Bi elementuk pantailaren eremu bera hartzen dutenean, nabigatzaileak erabaki behar du **zein marraztuko den bestearen gainean**.

**[z-index]{.verbatim}** propietateak posizionatuta dauden elementuen pilaketa-ordena (*stacking order*) kontrolatzen du. Zenbat eta balio handiagoa izan, orduan eta gorago agertuko da elementua gainerakoekiko.

Lehenespenez, HTML elementuak dokumentuaren ordenari jarraituz marrazten dira: HTMLn beranduago agertzen direnak normalean gainean bistaratzen dira gainjartzea dagoenean. Portaera hori [z-index]{.verbatim} erabiliz alda daiteke.

Z letra hiru dimentsioko irudikapenetik dator. Bi dimentsioko diseinu grafikoan bi ardatz erabiltzen dira: **X** ardatz horizontala eta **Y** ardatz bertikala. Hirugarren ardatza, **Z**, gehitzen badugu, marrazketa-ordena adierazten du.


## Nola aldatu [z-index]{.verbatim} {#cómo-modificar-z-index}

[z-index]{.verbatim}-ren balioa positiboa, zero edo negatiboa izan daiteke. Zenbakia zenbat eta handiagoa izan, orduan eta gorago marraztuko da elementua, baina **[position]{.verbatim} duten elementuei baino ez die eragiten** ([static]{.verbatim} balioa izan ezik).


:::::::::::::: {.columns columnsep=0.5cm}
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```html
<div class="caja roja"></div>
<div class="caja azul"></div>
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[CSS]{.title}
```css
.caja {
    position: relative;
    width: 120px;
    height: 120px;
}
.roja {
    background: crimson;
    z-index: 20;
}

.azul {
    background: royalblue;
    z-index: 10;
    left: 60px;
    top: -60px;
}
```
:::

:::
::::::::::::::


Bi kutxak partzialki gainjartzen dira. [z-index]{.verbatim} existitzen ez bada, ordena dokumentuaren fluxuaren araberakoa izango da. Propietateari balio bat gehitzen zaion unean, kutxak marrazteko kontuan hartuko da; kasu honetan, kutxa gorria urdinaren gainean agertuko da, **zenbakizko balioaren** ondorioz.

![Ezkerrean [z-index]{.verbatim} gabe, eskuinean [z-index]{.verbatim}-rekin](img/diw/z-index.png){width=80%}


Bi elementuek balio bera izango balute, HTMLaren ordena mantenduko litzateke; beranduago idatzitako elementua gainean marraztuko litzateke.

::: infobox
[z-index]{.verbatim}-ren erabilerarik ohikoena leiho *modaletan*, *navbar*-etan, goitibeherako menuetan eta abarretan da, beti dokumentuaren gainerako elementuen "gainean" daudela ziurtatzeko.
:::


## Pilaketa-testuingurua {#contexto-apilamiento}

Kontzeptu garrantzitsu bat **[stacking context](https://developer.mozilla.org/en-US/docs/Web/CSS/Guides/Positioned_layout/Stacking_context)** edo pilaketa-testuingurua da. Elementu batek bere testuingurua sortzen duenean, haren seme-alaben [z-index]{.verbatim} balioak haien artean soilik konparatzen dira.

[MDNren dokumentazioan](https://developer.mozilla.org/en-US/docs/Web/CSS/Guides/Positioned_layout/Understanding_z-index\#impact_of_stacking_contexts) pilaketaren funtzionamendua azaltzen duen adibide bat dago:

:::::::::::::: {.columns columnsep=0.5cm}
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```html
<section>
  <div id="div1">#1</div>
  <div id="div2">#2</div>
</section>
<div id="div3">#3</div>
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[CSS]{.title}
```css
/*...*/
#div1 {
  z-index: 5;
}

#div2 {
  z-index: -9;
}

#div3 {
  z-index: 0;
}
section {
  position: absolute;
  z-index: 2;
}
```
:::

:::
::::::::::::::


Adibide honetan bi testuinguru daude: bata "section" barruan ("div1" eta "div2" artean), eta bestea "section" eta "div3" artean. Biak bereizita kalkulatzen dira, eta testuinguru bakoitzaren barruan dagokien balio propioak hartzen dira kontuan.

::: questionbox
Zein dela uste duzu aurreko adibidearen marrazketa-ordena?
:::

::: exercisebox
[[06d](https://github.com/yuki/ejercicios/blob/main/daw/diw/06d.html)]{.solution}

- Erabili [z-index]{.verbatim} propietatea aurretik jarritako adibidea ikusteko. Egiaztatu portaera propietatea gehitzean eta kentzean.
- Konpondu **6b** ariketako *scroll*-arekin eta *navbar*-arekin zegoen arazoa.
- Egiaztatu pilaketa-testuinguruari buruzko erantzuna zuzena izan den.
:::


Pilaketa-testuinguruak dokumentazioan [MDN](https://developer.mozilla.org/en-US/docs/Web/CSS/Guides/Positioned_layout/Stacking_context) agertzen diren hainbat propietatek sor ditzakete, adibidez:

- [z-index]{.verbatim} duten elementu posizionatuak.
- 1 baino txikiagoa den [opacity]{.verbatim}.
- Zenbait transformazio ([transform]{.verbatim}).
- [filter]{.verbatim} eta bestelako propietate grafikoak.


## Pilaketa-eskala {#escala-apilamiento}

Ez dago zenbakikuntza ofizialik, baina proiektu askok elementu desberdinetarako antolatutako eskala erabiltzen dute:

| Elementua | Gutxi gorabeherako balioa |
|----------|---------------------------|
| Eduki normala | 1 |
| Txartelak | 10 |
| Goiburu finkoa | 100 |
| Menuak | 200 |
| Modala | 1000 |
| Elkarrizketa kritikoak | 2000 |


Garrantzitsuena ez da zenbaki zehatza, hierarkia koherentea mantentzea baizik. Garrantzitsua da, halaber, balio desberdinen artean tarte nahikoa uztea, etorkizunean tarteko testuinguru berriak gehitu nahi baditugu.

::: questionbox
Zein da gutxieneko eta gehieneko balioa? **Araberakoa da!** Balioa "integer" bat denez, sistema eragilearen eta/edo nabigatzailearen araberakoa da.
:::



# [visibility]{.verbatim} propietatea {#vibility}

Web-garapenean hainbat modu daude elementu bat ezkutatzeko. Ezagunena [display: none]{.verbatim} da, baina ez da beti aukera egokiena. Askotan elementu bat **ikusmenez desagertzea nahi dugu, dokumentuaren banaketa aldatu gabe**.

**[visibility]{.verbatim}** propietateak hori kontrolatzen du: elementu bat **ikusezin bihurtzeko aukera ematen du, orrialdean hartzen duen espazioa mantenduz**. Propietate sinplea da, baina oso erabilgarria animazioetan, tauletan, interfaze dinamikoetan eta osagai interaktiboetan.

Balio garrantzitsuenak hauek dira:


| Balioa | Deskribapena |
|--------|-------------|
| [visible]{.verbatim} | Elementua bistaratzen da |
| [hidden]{.verbatim} | Elementua ezkutatzen da, baina bere espazioa mantentzen du |
| [collapse]{.verbatim} | Tauletarako portaera berezia |

Elementu guztien balio lehenetsia [visible]{.verbatim} da; beraz, ez da beharrezkoa adieraztea eta ez da azalduko. Erabilera ohikoenak hauek dira:

- Informazioa aldi baterako ezkutatzea, diseinua mantenduz.
- Osagaiak erakutsi eta ezkutatzea, beste elementuak desplazatu gabe.
- Egoera ikusgai/ikusezinak dituzten interfazeak.
- Errenkada jakin batzuk ikusmenez desagertu behar duten taulak.
- [opacity]{.verbatim}-rekin konbinatutako animazioak.


## [visibility: hidden]{.verbatim} {#visibility-hidden}

Hau da baliorik interesgarriena, kasu honetan elementua ikusmenez desagertzen baita, bere tamaina mantentzen baitu eta dokumentuan espazioa hartzen jarraitzen baitu.

:::::::::::::: {.columns columnsep=0.5cm}
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```html
<p>Primer párrafo</p>

<p class="oculto">Segundo párrafo</p>

<p>Tercer párrafo</p>
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[CSS]{.title}
```css
.oculto {
    visibility: hidden;
}
```
:::

:::
::::::::::::::

Adibide honetan, bigarren paragrafoaren espazioak existitzen jarraitzen du. Aurretik [diferentzia [display:none]{.verbatim}-rekin](#diferencias-display-visibility) azaldu da.

Elementuak espazioa "hartzen" jarraitzen badu ere, **ezin du erabiltzailearen interakziorik jaso saguaren bidez**.


## [visibility: collapse]{.verbatim} {#visibility-collapse}

Taulen errenkadetarako eta zutabeetarako nagusiki pentsatuta dagoen balio bat dago: [collapse]{.verbatim}.

Nabigatzaile moderno gehienetan, balio honek [hidden]{.verbatim}-en antzera jokatzen du, nahiz eta haren inplementazio osoa elementu motaren araberakoa izan. Ohiko proiektuetan oso gutxitan erabiltzen da tauletatik kanpo.

::: exercisebox
[[06e](https://github.com/yuki/ejercicios/blob/main/daw/diw/06e.html)]{.solution}

- Erabili [visibility]{.verbatim} propietatea elementuak ezkutatzeko eta egiaztatu nola mantentzen den haien espazioa.
- Zer gertatzen da tauletan [collapse]{.verbatim} erabiltzean?
:::


## [visibility]{.verbatim}-ren herentzia {#herencia-visibility}

[visibility]{.verbatim} propietatea heredagarria da; beraz, [hidden]{.verbatim} balioa duen elementu baten seme guztiak ere ezkutatuta egongo dira.



# [opacity]{.verbatim} propietatea {#propiedad-opacity}

Interfaze moderno askotan leunki agertu eta desagertzen diren elementuak aurkitzen ditugu: leiho modalak, goitibeherako menuak, sagua gainetik pasatzean aldatzen diren irudiak edo intentsitatea aldatzen duten botoiak. Efektu horiek guztiek elementu komun bat dute: **gardentasuna**.

**[opacity]{.verbatim}** propietateak elementu oso baten gardentasun-maila kontrolatzen du, elementua guztiz ikusgai, partzialki gardena edo guztiz ikusezina izatea ahalbidetuz, **dokumentuan espazioa hartzen jarraitzen duen bitartean**. Dokumentuan existitzen jarraitzen du eta **saguaren gertaerak jasotzen jarrai dezake**.

[visibility]{.verbatim}-k ez bezala, [opacity]{.verbatim} efektu bisualak eta animazioak sortzeko pentsatuta dago.

[opacity]{.verbatim}-ren balioa kontrolatzeko, [0]{.verbatim} (guztiz gardena) eta [1]{.verbatim} (guztiz opakua) arteko balioa erabiltzen da; azken hori da balio lehenetsia. Adibidez:

| Balioa | Emaitza |
|--------|---------|
| `0` | Ikusezin bihurtzen da |
| `0.25` | Oso gardena |
| `0.5` | Erdi-gardena |
| `0.75` | Apur bat gardena |
| `1` | Guztiz ikusgai |

[opacity]{.verbatim} propietatea aldatzen dugunean, **elementu osoari** eragiten dio; beraz, atzeko planoa, testua, irudiak, ertzak eta ikonoak garden bihurtzen dira.

::: infobox
[opacity]{.verbatim}-ek elementu osoari eragiten dio, **baita atzeko planoari, testuari, irudiei, ertzei eta ikonoiei ere**.
:::


## Trantsizio leunak {#transiciones-suaves}

Opakutasuna erraz animatu daiteke [transition]{.verbatim} erabiliz, aldaketa berehalakoa izan beharrean pixkanaka egiten baita, adierazitako denbora kontuan hartuz. Trantsizioak sakonago aztertuko ditugu ondorengo unitate batean, baina hona hemen adibide bat:

:::::::::::::: {.columns columnsep=0.5cm}
::: {.column width="62%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```html
<img src="img/moon.jpg" alt="" class="imagen">
```
:::

:::
::: {.column width="38%" }

::: {.mycode size=footnotesize}
[CSS]{.title}
```css
.imagen {
    opacity: 0.5;
    transition: opacity 0.3s;
}
.imagen:hover {
    opacity: 1;
}
```
:::

:::
::::::::::::::


Adibide hau oso ohikoa da irudi-galerietan.


::: exercisebox
[[06f](https://github.com/yuki/ejercicios/blob/main/daw/diw/06f.html)]{.solution}

- Aurreko ariketa bikoiztu eta alderatu [visibility]{.verbatim} eta [opacity]{.verbatim}.
- Gehitu listener bat hainbat kutxatan. Noiz jartzen da indarrean?
- Sortu irudi-galeria bat [opacity]{.verbatim} erabiliz eta gehitu trantsizio bat sagua gainetik pasatzean.
:::



# Irudiak eta bideoak doitzea [object-fit]{.verbatim}-ekin {#ajustar-multimedia}

Irudiekin eta bideoekin lan egitean ohikoenetako arazo bat multimedia-fitxategi bat tamaina finkoko edukiontzi batera egokitzea da. [width]{.verbatim} eta [height]{.verbatim} besterik gabe aldatzen baditugu, oso erraza da irudia deformatuta agertzea edo proportzioak galtzea.

**[object-fit]{.verbatim}** propietateak aukera ematen du **irudi edo bideo bat bere edukiontziaren barruan nola doitzen den kontrolatzeko**, eta haren aspektu-erlazioa mantendu edo aldatzeko aukera ematen du, gure beharren arabera.

Oso erabilia da txarteletan, irudi-galerietan, erabiltzaile-profiletan, online dendetan eta aplikazio mugikorretan.

::: warnbox
[object-fit]{.verbatim} multimedia-elementuetan baino ez da erabilgarria, hala nola [<img>]{.verbatim} eta [<video>]{.verbatim} elementuetan. Ez da nahastu behar [background-size]{.verbatim} propietatearekin; azken hori atzeko planoko irudietarako erabiltzen da.
:::


Imajina dezagun honako egoera hau, non 1920x1080px bereizmeneko argazki bat jartzen dugun:

:::::::::::::: {.columns columnsep=0.5cm}
::: {.column width="60%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```html
<img src="paisaje.jpg" class="foto" alt="">
```
:::

:::
::: {.column width="40%" }

::: {.mycode size=footnotesize}
[Forzar tamaño contenedor]{.title}
```css
.foto {
    width: 300px;
    height: 300px;
}
```
:::

:::
::::::::::::::

Irudia **deformatuta** agertuko da, nabigatzaileak zabalera eta altuera modu independentean doitzen baititu. [object-fit]{.verbatim}-ekin arazo hori saihestu daiteke, irudia edukiontzira nola egokitu behar den adieraziz. Balio nagusiak hauek dira:

| Balioa | Deskribapena |
|--------|-------------|
| [contain]{.verbatim} | Proportzio osoa mantentzen du. Hutsuneak gera daitezke. |
| [cover]{.verbatim} | Gehiegizko zatia moztuz betetzen du, eta edukiontzi osoa betetzen du. |
| [fill]{.verbatim} | Irudia deformatuz betetzen du. Ez da erabiltzea gomendatzen. |
| [none]{.verbatim} | Jatorrizko tamaina mantentzen du. |
| [scale-down]{.verbatim} | [none]{.verbatim} eta [contain]{.verbatim} balioen artean aukeratzen du. |

Table: {tablename=yukitblr colspec=X[1,l]X[4,l]}


Beraz, aurreko adibidea konpontzeko, honako hau jar dezakegu:

::: mycode
[Forzar imagen con [object-fit]{.verbatim}]{.title}
```css
.foto {
    width: 300px;
    height: 300px;
    object-fit: contain;
}
```
:::


Praktikan, gehien erabiltzen diren balioak **[cover]{.verbatim}** eta **[contain]{.verbatim}** dira.


![Balioen adibideak: [contain]{.verbatim}, [cover]{.verbatim}, [fill]{.verbatim}, [none]{.verbatim} eta [scale-down]{.verbatim}](img/diw/object-fit.png){width=80%}


::: exercisebox
[[06g](https://github.com/yuki/ejercicios/blob/main/daw/diw/06g.html)]{.solution}

- Sortu irudi-galeria bat eta erabili [object-fit]{.verbatim}.
- Zein balio iruditzen zaizu hobea?
:::


# [object-position]{.verbatim} propietatea {#object-position}

Aurreko atalean ikusi genuen **[object-fit: cover]{.verbatim}** propietateak edukiontzi bat erabat betetzea ahalbidetzen duela, irudiaren zati bat moztuz. Hala ere, beste galdera bat sortzen da: **irudiaren zein zati mantendu behar da?**

**[[object-position]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference/Properties/object-position)** propietateak galdera horri erantzuten dio. Irudi edo bideo baten zein eremu mantenduko den ikusgai aukeratzeko aukera ematen du, edukia edukiontziaren barruan mozten denean.

Oso erabilia da avatarrentzat, produktuen argazkientzat, erretratuentzat eta irudi panoramikoak dituzten goiburuentzat.

Edukiontzia baino txikiagoak diren irudietan, irudia edukiontziaren barruan non kokatu aukeratzeko aukera ematen du.

[object-position]{.verbatim} propietateak bi balio onar ditzake:

- **Balio horizontala**
- **Balio bertikala**

Balioak honako hauek izan daitezke: [top]{.verbatim}, [center]{.verbatim}, [bottom]{.verbatim}, [left]{.verbatim}, [right]{.verbatim}, ehuneko bat edo neurri bat.

Lehenetsitako balioa irudiaren erdigunea da.

:::::::::::::: {.columns columnsep=0.5cm}
::: {.column width="60%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```html
<img src="paisaje.jpg" class="a">

<img src="icono.jpg" class="b">
```
:::

:::
::: {.column width="40%" }

::: {.mycode size=footnotesize}
[CSS]{.title}
```css
.a {
    width: 100px;
    height: 100px;
    object-fit: cover;
    object-position: top left;
}
.b {
    width: 400px;
    height: 400px;
    object-fit: none;
    object-position: 25% 50%;
}
```
:::

:::
::::::::::::::

Aurreko adibideetan honako egoera hauek suposatzen ditugu:

1. Irudia ez da emandako espaziora sartzen:
   - Irudia moztu egingo da, baina irudia edukiontziaren goiko ezkerreko zatiarekin lerrokatzen da; beraz, behealdetik eta eskuinaldetik moztuko da.
2. Irudia edukiontzia baino txikiagoa da:
   - Irudia horizontalki ezkerrerantz (%25) kokatzen da eta bertikalki zentratuta geratzen da.



::: exercisebox
[[06h](https://github.com/yuki/ejercicios/blob/main/daw/diw/06h.html)]{.solution}

Aurreko ariketa oinarritzat hartuta, saiatu edukiontziak handiagoak edo txikiagoak egiten, irudi handiagoekin edo txikiagoekin, eta erabili [object-position]{.verbatim} balio desberdinekin.
:::

