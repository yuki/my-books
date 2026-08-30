
# Espezifikotasuna {#especificidad}

Aurreko atalean ikusi dugu CSSk hainbat hautatzaile mota erabiltzeko aukera ematen duela HTML elementuak hautatzeko. Batzuetan, CSS arau batzuek elementu berean eragin dezakete eta propietate bera alda dezakete. Adibidez:

:::::::::::::: {.columns }
::: {.column width="60%"}

::: mycode
[HTML]{.title}

```html
<p id="mensaje" class="importante">
    Hola mundo
</p>
```
:::

:::
::: {.column width="40%" }

::: mycode
[css]{.title}
```css
p {
    color: blue;
}
.importante {
    color: green;
}
#mensaje {
    color: red;
}
```
:::

:::
::::::::::::::

Aurreko hiru arauek elementu berean eragiten dute, eta hirurek [color]{.verbatim} propietatearen balioa ezartzen saiatzen dira. Horrelako kasuetan, hainbat arau daudenean, **espezifikotasuna** CSSk erabiltzen duen mekanismoa da hainbat arau elementu berari aplika dakizkiokeenean lehentasuna zein arauk duen zehazteko. Testua **gorria** izango da, [#mensaje]{.verbatim} hautatzaileak beste bi hautatzaileek baino espezifikotasun handiagoa duelako.


## Hautatzaile motak eta espezifikotasuna  {#tipos-selectores-especificidad}

Hautatzaile baten espezifikotasuna erabilitako hautatzaile motaren araberakoa da batez ere. **Lehentasun handienetik txikienera**, honako sailkapen hau ezar dezakegu:

A) *Inline* estiloak.
B) Identifikatzaileak ([#id]{.verbatim}).
C) Klaseak, atributuak eta pseudo-klaseak.
D) Elementuak eta pseudo-elementuak.



Espezifikotasuna ulertzeko, hautatzaile bat lau balioren bidez adieraz dezakegu: [A B C D]{.verbatim}. Balio horiek puntuazio bat balira bezala irudika ditzakegu. Ikus ditzagun honako adibide hauek:

:::::::::::::: {.columns }
::: {.column width="33%"}

::: mycode
[CSS]{.title}

```css
p {
    color: blue;
}
```
:::

:::
::: {.column width="33%" }

::: mycode
[CSS]{.title}
```css
.mensaje {
    color: green;
}
```
:::

:::
::: {.column width="33%" }

::: mycode
[CSS]{.title}
```css
#mensaje {
    color: red;
}
```
:::

:::
::::::::::::::


Puntuazioak honela geratuko lirateke:

- [0 0 0 1]{.verbatim}: elementu motako hautatzaile bat duelako.
- [0 0 1 0]{.verbatim}: klase bat delako.
- [0 1 0 0]{.verbatim}: identifikatzaile bat delako.


Garrantzitsua da ulertzea espezifikotasun-balioak ez direla puntuazio arrunt bat bezala batzen. Ezkerretik eskuinera alderatzen dira. Adibidez, [0 1 0 0 > 0 0 20 0]{.verbatim}; lehenengoa espezifikoagoa da, nahiz eta bigarren hautatzaileak 20 klase izan, identifikatzailearen hautatzaileak klaseek baino lehentasun handiagoa duelako. Badira [kalkulagailuak](https://specificity.keegan.st/) balioa kalkulatzeko eta arau desberdinak alderatzeko, bat bestea baino espezifikoagoa zein den jakiteko.


::: exercisebox
[[03a](https://github.com/yuki/ejercicios/blob/main/daw/diw/03a.html)]{.solution}

Sortu HTML bat hiru [p]{.verbatim} elementurekin eta gehitu estiloak espezifikotasunaren arabera.
:::

## Hautatzaileen konbinazioa {#combinar-selectores}

Hautatzaileak konbinatzen ditugunean, espezifikotasuna ere metatu egiten da. Aurretik azaldutako arauari jarraituz, azter ditzagun honako adibide hauek:


:::::::::::::: {.columns }
::: {.column width="50%"}

::: mycode
[CSS]{.title}

```css
article p {
    color: blue;
}
```
:::

:::
::: {.column width="50%" }

::: mycode
[CSS]{.title}
```css
article .mensaje {
    color: green;
}
```
:::

:::
::::::::::::::


Puntuazioak honela geratuko lirateke:

- [0 0 0 2]{.verbatim}: bi mota-hautatzaile dituelako.
- [0 0 1 1]{.verbatim}: mota-hautatzaile bat eta klase-hautatzaile bat dituelako. Beraz, aurrekoa baino espezifikotasun handiagoa du.


## Hainbat klase {#varias-clases}

Hautatzaile batek hainbat klase baditu, guztiek hartzen dute kontuan espezifikotasunerako.


:::::::::::::: {.columns }
::: {.column width="50%"}

::: mycode
[CSS]{.title}

```css
.mensaje.importante {
    color: red;
}
```
:::

:::
::: {.column width="50%" }

::: mycode
[CSS]{.title}
```css
.mensaje {
    color: blue;
}
```
:::

:::
::::::::::::::

Lehenengo araua bigarrena baino espezifikoagoa da.


## Atributu-hautatzaileak {#selectores-atributos-especificidad}

Atributu-hautatzaileek klaseen garrantzi bera dute.

:::::::::::::: {.columns }
::: {.column width="50%"}

::: mycode
[CSS]{.title}

```css
input[type="email"] {
    border-color: blue;
}
```
:::

:::
::: {.column width="50%" }

[0 0 1 1]{.verbatim} puntuazioa du, honako hauek dituelako:

- Mota-hautatzaile bat: [input]{.verbatim}
- Atributu-hautatzaile bat: [[type="email"]]{.verbatim}

:::
::::::::::::::




## Pseudo-klaseak {#pseudoclases-especificidad}

Pseudo-klaseak ere klase baten moduan hartzen dira kontuan espezifikotasunari dagokionez.


:::::::::::::: {.columns }
::: {.column width="50%"}

::: mycode
[CSS]{.title}

```css
a:hover {
    color: red;
}
```
:::

:::
::: {.column width="50%" }

[0 0 1 1]{.verbatim} puntuazioa du, honako hauek dituelako:

- Mota-hautatzaile bat: [a]{.verbatim}
- Atributu-hautatzaile bat: [:hover]{.verbatim}

:::
::::::::::::::




## Pseudo-elementuak {#pseudoelementos-especificidad}

Pseudo-elementuak mota-hautatzaile gisa hartzen dira kontuan.


:::::::::::::: {.columns }
::: {.column width="50%"}

::: mycode
[CSS]{.title}

```css
p::first-letter {
    font-size: 30px;
}
```
:::

:::
::: {.column width="50%" }

[0 0 0 2]{.verbatim} puntuazioa du, honako hauek dituelako:

- Mota-hautatzaile bat: [p]{.verbatim}
- Pseudo-elementu bat: [::first-letter]{.verbatim}

:::
::::::::::::::



## Hautatzaile unibertsala {#selector-universal-especificidad}

**Hautatzaile unibertsalak** ez du espezifikotasunik ematen. Gauza bera gertatzen da [> + ~]{.verbatim} eragileekin. Elementu horiek hautatzaileen arteko erlazioak ezartzeko balio dute, baina ez dute espezifikotasuna handitzen.


## Espezifikotasuna eta ordena {#especificidad-y-orden}

Espezifikotasuna ez da CSSk erabiltzen duen irizpide bakarra. Bi arauk **espezifikotasun bera** dutenean, agertzeko ordenak zein aplikatzen den zehaztu dezake. Hurrengo adibidean, bi hautatzaileek puntuazio bera dute eta elementu mota berari eragiten diote:



::: mycode
[CSS]{.title}

```css
p {
    color: blue;
}
p {
    color: red;
}
```
:::

Puntuazio bera izan arren, aplikatzen den araua bigarrena da, ondoren agertzen delako; beraz, testua gorria izango da.


## Adierazpen bat [!important]{.verbatim} bidez behartzea {#forzar-declaracion-important}

CSSk [!important]{.verbatim} izeneko tresna berezi bat eskaintzen du, eta lehentasun berezia du kaskadaren mekanismoaren barruan. Erabil daiteke adierazpen jakin batek beste adierazpen arrunten gainetik lehentasuna izan dezan behartzeko.

Aurreko adibidea kontuan hartuta, lehenengo arauari [!important]{.verbatim} gehituz gero, lehentasuna hartzen du eta bigarren araua baliogabetzen du:

::: mycode
[CSS]{.title}

```css
p {
    color: blue !important;
}
p {
    color: red;
}
```
:::


[!important]{.verbatim} asko daudenean, zaila bihurtzen da jakitea zein arau aplikatuko den azkenean; beraz, **ez da gomendatzen estilo-arazoak konpontzeko ohiko irtenbide gisa erabiltzea**.

::: errorbox
[!important]{.verbatim} erabiltzea praktika txartzat hartzen da.
:::


## Nabigatzailearen tresnak {#herramientas-navegador-comprobar-especificidad}

Nabigatzaileen garatzaileentzako tresnek erraz egiaztatzeko aukera ematen dute zein CSS arau aplikatzen ari diren. Adibidez, Chrome edo Firefoxen, ikuskatzailearen bidez elementu bat hauta dezakegu, eta nabigatzaileak honako hauek erakutsiko ditu:

- Elementuari eragiten dioten arauak.
- Aplikatutako propietateak.
- Gainidatzitako propietateak.
- Arau bakoitza dagoen CSS fitxategia.
- Definituta dagoen lerroa.
- Zenbait kasutan, espezifikotasunarekin lotutako informazioa.

Propietate bat marratuta agertzen bada, esan nahi du propietate berarentzat lehentasun handiagoa duen beste adierazpen bat dagoela. Ordena identifikatzen eta tresna hau erabiltzen ikastea funtsezkoa da CSS arazoak konpontzeko.


::: exercisebox
[[03b](https://github.com/yuki/ejercicios/blob/main/daw/diw/03b.html)]{.solution}

Hurrengo HTML eta CSS kodea kontuan hartuta, aztertu kodea eta zehaztu zer kolore izango duen testuak (idatzi paper batean). Kopiatu testua fitxategietan eta egiaztatu asmatu duzun. Aztertu garatzaileentzako tresnen bidez zein arau aplikatzen diren eta zein marratzen diren espezifikotasun txikiagoa dutelako.

::: {.mycode size="footnotesize"}
[HTML]{.title}

```html
<h1 id="titulo">Especificidad de CSS</h1>

<h2 class="azul">Primer ejemplo</h2>
<p class="base">Párrafo 1</p>

<h3 class="verde">Segundo ejemplo</h3>
<p id="importante" class="destacado">Segundo párrafo</p>

<h2 class="gris">Tercer ejemplo</h2>
<p class="base resaltado">Tercer párrafo</p>

<p class="importante">Cuarto párrafo</p>
```
:::

::: {.mycode size="footnotesize"}
[CSS]{.title}

```css
p { color: black;}
h1 { color: darkgray;}
h2 { color: purple;}
h3 { color: brown;}
#titulo { color: red;}
.base { color: green;}
h2.azul { color: blue;}
p.destacado { color: orange;}
h3.verde { color: olive;}
p.resaltado { color: teal;}
p.importante { color: fuchsia !important;}
#importante { color: darkblue !important;}
h2.gris { color: gray;}
```
:::

:::


# Herentzia {#herencia}

**Herentzia** CSSren oinarrizko mekanismoetako bat da. Elementu batean definitutako CSS propietate jakin batzuk haren ondorengo elementuei automatikoki transmititzeko aukera ematen du. Herentziari esker, ez da beharrezkoa propietate batzuk orrialde bateko elementu guztietan banaka ezartzea.


:::::::::::::: {.columns }
::: {.column width="50%"}

::: mycode
[HTML]{.title}

```html
<body>
    <h1>Título</h1>
    <p>Primer párrafo.</p>
    <div>
        <p>Segundo párrafo.</p>
    </div>
</body>
```
:::

:::
::: {.column width="50%" }

::: mycode
[CSS]{.title}
```css
body {
    color: blue;
}
div {
    color: red;
}
```
:::

:::
::::::::::::::

Aurreko adibidearekin, ondorengo elementuetako testuek guraso-elementuan zehaztutako kolorea heredatuko dute. Bestalde, ikus daitekeen bezala, elementu batek berezko balioa izan dezake hereda daitekeen propietate baterako, eta bere herentzia propioa ere has dezake, [div]{.verbatim} arauarekin gertatzen den bezala.

::: infobox
Herentziak beharrezkoa den CSS kode kopurua murrizteko aukera ematen du, eta orrialde baterako estilo orokorrak sortzea errazten du.
:::



## Propietate guztiak ez dira heredatzen {#no-todo-se-hereda}

Garrantzitsua da kontuan izatea **CSS propietate guztiak ez direla heredagarriak**. Adibidez, [color]{.verbatim} normalean heredatzen da, baina kaxa-ereduarekin lotutako propietateak, hala nola [margin]{.verbatim}, normalean ez dira heredatzen.

Beraz, honako hauen artean bereizi behar dugu:

- **Propietate heredagarriak**: lehenespenez, guraso-elementuaren kalkulatutako balioarekin ezartzen dira. Testuarekin lotutako propietateak dira, hala nola [color]{.verbatim}, [font-family]{.verbatim}, [font-size]{.verbatim}, [font-style]{.verbatim}, [line-height]{.verbatim}, [text-align]{.verbatim} eta [visibility]{.verbatim}.
- **Heredagarriak EZ diren propietateak**: lehenespenez, propietatearen hasierako balioarekin ezartzen dira. Kaxa-ereduarekin edo *layout*-arekin lotutako propietateak dira, hala nola [border]{.verbatim}, [background]{.verbatim}, [margin]{.verbatim}, [padding]{.verbatim}, [width]{.verbatim} eta [height]{.verbatim}.

Propietate bat heredagarria den jakiteko, [MDN](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference/Properties/color) edo [W3C](https://www.w3schools.com/cssref/pr_text_color.php) dokumentazioan ***Inherited*** definizioa ikus dezakegu; **True** bada, heredatu egiten da.


## Herentzia behartzea [inherit]{.verbatim} erabiliz {#forzar-herencia}

CSSk [inherit]{.verbatm} gako-hitza eskaintzen du, propietate batek guraso-elementutik heredatutako balioa erabili behar duela esplizituki adierazteko.

Hitz hori erabiliz, berez heredatuko ez liratekeen propietateak ere heredatu ahal izango ditugu.


:::::::::::::: {.columns }
::: {.column width="50%"}

::: mycode
[HTML]{.title}

```html
<div>
    <p>Primer párrafo.</p>
    <p>Segundo párrafo</p>
</div>
```
:::

:::
::: {.column width="50%" }

::: mycode
[CSS]{.title}
```css
div {
  border: 2px solid red;
}
p {
    border: inherit;
}
```
:::

:::
::::::::::::::


::: exercisebox
[[03d](https://github.com/yuki/ejercicios/blob/main/daw/diw/03d.html)]{.solution}

Sortu HTML bat automatikoki heredatzen diren propietateekin eta herentzia behartuaren bidez heredatzen diren beste batzuekin.
:::


## [initial]{.verbatim} reset gisa {#initial-reset}

[initial]{.verbatim} reset bat balitz bezala defini genezake, CSSren arabera propietatearentzat definitutako hasierako balioa ezartzen baitu.

Demagun honako adibide hau:

:::::::::::::: {.columns }
::: {.column width="50%"}

::: mycode
[HTML]{.title}

```html
<div>
    <h1>Título</h1>>
    <p>primer párrafo</p>
</div>
```
:::

:::
::: {.column width="50%" }

::: mycode
[CSS]{.title}
```css
div {
  color:red
}
h1 {
    color: initial;
}
```
:::

:::
::::::::::::::

[div]{.verbatim} elementuan kolore bat ezartzen dugu, eta herentziaren bidez haren azpian dauden elementu guztiek kolore hori izan beharko lukete; baina [h1]{.verbatim} arauan kolorea lehenetsitako baliora itzultzen dugu.


::: exercisebox
[[03e](https://github.com/yuki/ejercicios/blob/main/daw/diw/03e.html)]{.solution}

Sortu heredatutako propietateak dituen HTML bat, baina [initial]{.verbatim} erabiliz ezar ez daitezen.
:::


## [unset]{.verbatim} gako-hitza {#palabra-clave-unset}

[unset]{.verbatim} gako-hitzak bi portaera konbinatzen ditu.

- Propietatea heredagarria bada, [unset]{.verbatim} honela jokatzen du: [inherit]{.verbatim}
- Propietatea heredagarria ez bada, [initial]{.verbatim} bezala jokatzen du.

::: mycode
[CSS]{.title}
```css
p {
    color: unset;
    margin: unset;
}
```
:::

Aurreko adibidean bi jokabide-moduak ditugu:

- [color]{.verbatim} propietate heredagarria denez, [unset]{.verbatim} erabiltzeak heredatutako balioa erabiltzea eragingo du.
- [margin]{.verbatim}-erako, lehenetsitako balioa erabiliko da.



## [revert]{.verbatim} gako-hitza {#palabra-clave-revert}

[revert]{.verbatim} gako-hitzak propietateak aurreko jatorri-arauak erabiliz izango zukeen baliora itzultzeko aukera ematen du, uneko adierazpena aplikatzen jarraitu beharrean.

Haren funtzionamendua kaskadarekin eta CSS arauen jatorri desberdinekin lotuta dago.

Zenbait kasutan erabilgarria izan daitekeen arren, oraingoz ez dugu erabiliko; hala ere, komeni da [MDN](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference/Values/revert) webgunean adibide bat ikustea.


# Kaskada {#cascada}

**CSS** izena *Cascading Style Sheets* esamoldetik dator, gaztelaniaz **hojas de estilo en cascada**. *Kaskada* hitzak CSSk erabiltzen duen mekanismoari egiten dio erreferentzia, elementu berari eragiten dioten hainbat arau daudenean zein estilo aplikatu behar diren zehazteko.

Web-orri batean, ohikoa da arau desberdinek propietate bererako balioak ezarri ahal izatea.


::: mycode
[CSS]{.title}
```css
p {
    color: blue;
}
p {
    color: red;
}
```
:::


Bi arauek [<p>]{.verbatim} elementuei eragiten diete, eta biek [color]{.verbatim} propietaterako balio bat ezartzen dute. CSSk bi balioetatik zein erabiliko duen erabaki behar du. Kaskada egoera horiek ebaztea ahalbidetzen duen arau multzoa da.



## Kaskadak ez du esan nahi "azken arauak irabazten duela" {#cascada-no-gana-última-regla}

Agertze-ordena kaskadak erabiltzen duen irizpideetako bat baino ez da; beraz, kontuz ibili behar da eta ez da pentsatu behar azken araua beti zuzena izango denik.

Gogoratu behar da aplikatzen den araua [espezifikotasun](#especificidad) handiena duena dela.


## Oinarrizko hiru ideiak {#ideas-fundamentales}

Kaskada ulertzeko, aurretik ikusi ditugun kontzeptuak bereizi behar dira:

- **Espezifikotasuna**: elementu batekin hainbat arau bat datozenean, zein hautatzailek duen lehentasun handiagoa zehazten du.
- **Herentzia**: propietate jakin batzuk guraso-elementuetatik ondorengo elementuetara igarotzea ahalbidetzen du.
- **Kaskada**: hainbat adierazpen posible daudenean, azkenean zein adierazpen erabiliko den zehazten du.


## Estilo-orrien jatorria {#origen-hojas-estilo}

CSS arauak hainbat lekutatik etor daitezke. Modu sinplifikatuan, honako hauek bereiz ditzakegu:

- Nabigatzailearen estilo-orriak.
- Erabiltzaileak emandako estilo-orriak.
- Orriaren egilearen estilo-orriak.

Web-orriak ohiko moduan garatzean, batez ere **egilearen** estiloekin lan egingo dugu, hau da, guk geuk idazten ditugun CSSekin.

### Nabigatzailearen estiloak {#estilos-navegador}

Nabigatzaileek lehenetsitako estilo-orri bat dute, normalean **user-agent stylesheet** izenez ezagutzen dena. Gure HTMLa sortzen dugunean, elementuren bat gehitzean, dagoeneko berezko estiloa izango du tamainari, koloreari, letra-tipoari, lodierari, marjinei eta abarrei dagokienez.

Estilo horiek ez ditugu guk idatzi; nabigatzailearen lehenetsitako arauetatik datoz. Arau horiek normalean estilo lehenetsiak eskaintzen dituzte honako etiketa hauetarako: [<h1>]{.verbatim}, [<p>]{.verbatim}, [<a>]{.verbatim}, [<ul>]{.verbatim}, [<button>]{.verbatim}, [<input>]{.verbatim}, eta beste elementu askotarako.

Hori dela eta, HTML orri batek itxura bisuala izan dezake estilo-orririk idatzi ez badugu ere.

![Estilorik gabeko HTML bera Chrome, Firefox eta Safari nabigatzaileetan MacOSen](img/diw/estilos-navegador.png){width=80% framed=true}

Ikus daitekeen bezala, botoian desberdintasun nabariak daude, baina baita zerrendako *bullet*-a non marrazten den, elementuen arteko tartean eta, modu sotilagoan, estekaren azpimarratzean ere.

Hori beti izan da arazo bat, eta are gehiago lehenago, nabigatzaile batzuek estandarra behar bezala kudeatzen ez zutenean, batez ere kaxa-parametroen kudeaketan. Horregatik, **[reset.css](https://meyerweb.com/eric/tools/css/reset/)** fitxategiak daude lehenetsitako estiloak berrezartzeko. CSS *framework*ek, hala nola [Bootstrap](https://getbootstrap.com/docs/5.2/content/reboot/) edo [TailWind](https://tailwindcss.com/docs/preflight), eragiketa hori ere egiten dute beren estiloak aplikatu aurretik.


## Kaskada-sistema kontrolatzea {#controla-sistema-cascada}

CSSk eboluzionatu egin du, eta gaur egun kaskada kontrolatzeko mekanismo osagarriak daude. Horietako bat **kaskada-geruzak** dira, [@layer]{.verbatim} erabiliz.

Geruzek CSS arauak lehentasun-maila desberdinetan antolatzeko eta, ondoren, arauak geruza bakoitzaren barruan kokatzeko aukera ematen dute. Hori bereziki erabilgarria da proiektu handietan, CSSaren zati desberdinak liburutegi edo modulu desberdinetatik etor daitezkeenean.

::: mycode
[CSS]{.title}
```css
@layer main {
    p {
        color: blue;
    }
}

@layer componentes {
    p {
        color: red;
    }
}
```
:::

Aurreko adibidean, "**componentes**" geruza "main" geruza baino lehentasun handiagokoa da, ondoren deklaratzen delako; beraz, testuaren kolorea gorria izango da. Geruzen ordena ere zehaztu dezakegu, gero deklarazioen ordena edozein izanda ere.


:::::::::::::: {.columns }
::: {.column width="50%"}

::: mycode
[Geruzen ordena]{.title}

```css
@layer componentes, main;
```
:::

:::
::: {.column width="50%" }

::: mycode
[Geruzen ordena]{.title}
```css
@layer componentes;
@layer main;
```
:::

:::
::::::::::::::


Orain "main" geruza da lehentasun handiagoa duena (deklarazioan ondoren gehitu delako), eta, beraz, haren estiloak aplikatuko dira espezifikotasun bera dagoenean.

::: exercisebox
[[03f](https://github.com/yuki/ejercicios/blob/main/daw/diw/03f.html)]{.solution}

Sortu geruzak dituen CSS bat eta aldatu deklarazioen ordena haien estiloak aplikatzeko.
:::


## Espezifikotasuna eta ordena {#especificidad-orden}

Orain arte ikusitako guztia kontuan hartuta, lehentasun handiena duten arauak espezifikotasunaren arabera zehazten dira; baina espezifikotasun bera dutenean, azkenik deklaratzen den arauak irabazten du, betiere *layers* zehaztapenik tartean ez badago, horrek ordena alda baitezake.


## Herentziaren eta kaskadaren arteko aldea {#diferencia-herencia-cascada}

**Herentzia** eta **kaskada** erlazionatutako kontzeptuak dira, baina ez dira gauza bera. Herentziak propietate jakin batzuk guraso-elementu batetik haren ondorengo elementuetara igarotzea ahalbidetzen du.

Kaskadak, berriz, hainbat CSS adierazpen aplika daitezkeenean zein adierazpenek duen lehentasuna zehazten du; beraz, espezifikotasunaren bidez zehaztu beharko da zeinek duen lehentasuna.


Honela laburbil dezakegu:

| Kontzeptua | Funtzioa |
|---|---|
| Herentzia | Zenbait propietate guraso-elementuetatik ondorengo elementuetara transmititzen ditu |
| Kaskada | Zein adierazpenek duen lehentasuna erabakitzen du |
| Espezifikotasuna | Hainbat arau bat datozenean, zein hautatzailek duen lehentasuna zehazten laguntzen du |

Table: {tablename=yukitblr colspec=X[1,l]X[4,l]}


# Neurketa-unitateak {#unidades-de-medida}

Tamainak, distantziak eta dimentsioak kontrolatzen dituzten CSS propietateek neurketa-unitateak erabili behar dituzte.

::: mycode
[Tamainak jartzen]{.title}
```css
p {
    font-size: 20px;
}
```
:::


Kasu honetan:

- [font-size]{.verbatim} letra-tipoaren tamaina adierazten du.
- [20]{.verbatim} zenbakizko balioa da.
- [px]{.verbatim} neurketa-unitatea da.

Unitateek nabigatzaileari elementu batek zenbat neurtu behar duen, zenbat espazio okupatu behar duen edo elementu desberdinen artean zer distantzia egon behar duen adierazteko aukera ematen diote.

CSS unitateak, batez ere, honela sailka daitezke:

- **Unitate absolutuak**: beste elementu baten tamainaren araberakoak ez diren neurriak adierazten dituzte zuzenean.
- **Unitate erlatiboak**: dokumentuaren ezaugarri baten, guraso-elementuaren, letra-tipoaren tamainaren edo nabigatzailearen leihoaren tamainaren araberakoak dira. Unitate erlatiboak bereziki garrantzitsuak dira pantaila-tamaina desberdinetara egokitzen diren interfazeak sortzeko.


## Unitate absolutuak {#unidades-absolutas}

Unitate absolutu nagusiak hauek dira:

| Unitatea | Esanahia |
|---|---|
| [px]{.verbatim} | CSS pixela |
| [cm]{.verbatim} | Zentimetroa |
| [mm]{.verbatim} | Milimetroa |
| [in]{.verbatim} | Hazbetea |
| [pt]{.verbatim} | Puntua |
| [pc]{.verbatim} | Pika |
| [Q]{.verbatim} | 1/40 cm |

Table: {tablename=yukitblr colspec=X[1,l]X[4,l]}

Ohiko web-garapenean, [px]{.verbatim} da alde handiz gehien erabiltzen den unitate absolutua.

### CSS pixela {#pixel-css}

[px]{.verbatim} unitateak **CSS pixel** bat adierazten du. Garrantzitsua da CSS pixel bat pantailako pixel fisiko batekin nahitaez ez nahastea, gailu modernoek pixelen dentsitate oso handia izan baitezakete.

Beraz, [px]{.verbatim} CSS unitate gisa ulertu behar da, eta ez besterik gabe "pantailako puntu fisiko bat" bezala. Oso erabilgarria izan ohi da tamaina jakin batzuk zehaztasunez kontrolatu nahi ditugunean, eta ohiko erabilerak hauek dira:

- Ertzak.
- Ikonoak.
- Itzalak.
- Tarte txikiak.
- Kontrol zehatza behar duten tamainak.

### Unitate fisikoak {#unidades-físicas}

CSSk unitate fisikoak ere eskaintzen ditu, hala nola [cm]{.verbatim}, [mm]{.verbatim}, [in]{.verbatim} edo [pt]{.verbatim}. Unitate horiek bereziki interesgarriak izan daitezke inprimaketarekin lan egiten denean.

::: mycode
[Unitate fisikoak]{.title}
```css
@media print {
    .pagina { /* A4 */
        width: 21cm;
        min-height: 29.7cm;
    }
}
```
:::

::: infobox
Pantailatan unitate fisikoak erabiltzeak ez du zentzurik.
:::

## Unitate erlatiboak {#unidades-relativas}

Luzera-unitate erlatiboek luzera bat beste luzera-propietate batekiko erlazioan zehazten dute. Luzera-unitate erlatiboak hobeto egokitzen dira errendatze-euskarri desberdinetara.

| Unitatea | Esanahia |
|---|---|
| [em]{.verbatim} | Elementuaren letra-tipoaren tamainarekiko erlatiboa (2em uneko letra-tipoaren tamainaren 2 bider da) |
| [rem]{.verbatim} | Erro-elementuaren letra-tipoaren tamainarekiko erlatiboa |
| [ex]{.verbatim} | Uneko letra-tipoaren x-altuerarekiko erlatiboa (gutxi erabiltzen da) |
| [ch]{.verbatim} | Uneko letra-tipoaren "0" (zero) karakterearen zabalerarekiko erlatiboa |
| [vw]{.verbatim} | Ikuspegi-leihoaren zabaleraren %1arekiko erlatiboa |
| [vh]{.verbatim} | Ikuspegi-leihoaren altueraren %1arekiko erlatiboa |
| [%]{.verbatim} | Guraso-elementuarekiko erlatiboa |

Table: {tablename=yukitblr colspec=X[1,l]X[4,l]}

[vw]{.verbatim}, [vh]{.verbatim}, [vmin]{.verbatim} eta [vmax]{.verbatim} neurriek nabigatzailearen leihoa hartzen dute kontuan. Leihoak 50 cm-ko zabalera izango balu, orduan [1vw = 0.5cm]{.verbatim} izango litzateke.



### [em]{.verbatim} unitate erlatiboa {#unidad-relativa-em}

[em]{.verbatim} unitatea letra-tipoaren tamainarekin lotutako unitate erlatiboa da. Nabigatzaileek 16 px-ko tamaina lehenetsia dute, eta erabiltzaileak alda dezake (adibidez, ikusmen-arazoengatik).

Adibidez, honako hau erabiltzen badugu:

::: mycode
[Unintate erlatiboa]{.title}
```css
p {
    font-size: 20px;
    margin: 2em;
}
```
:::

[2em]{.verbatim} balioa adierazitako tamainarekin lotuta dago, eta, beraz, 40px izango da. Baina lehenengo araua adierazten ez bada, lehenespenez nabigatzailearen balioa hartzen da, eta, beraz, 32px izango dira.

::: exercisebox
[[03g](https://github.com/yuki/ejercicios/blob/main/daw/diw/03g.html)]{.solution}

Egiaztatu [em]{.verbatim} unitatearen balio erlatiboa:

- CSSn letra-tipoaren tamaina adieraziz.
- Nabigatzailearen balio lehenetsia erabiliz.
- Bilatu nabigatzailearen konfigurazioa, aldatu 32px-ra eta egiaztatu aldaketak.
:::


[body]{.verbatim} elementuan letra-tipoaren tamaina adierazten badugu, ondoren [em]{.verbatim} erabil dezakegu gainerako tamainak erlatiboak egiteko.

::: mycode
[Tamainuak jartzen]{.title}
```css
body {
    font-size: 16px;
}
h1 {
    font-size: 2em;
}
```
:::


#### [em]{.verbatim} unitatearen metaketaren arazoa {#problema-acumulación-em}

[em]{.verbatim} unitatearen ezaugarri garrantzitsu bat da elementuak habiaratuta daudenean metatu egin daitekeela. Aztertu hurrengo adibidea:


:::::::::::::: {.columns }
::: {.column width="50%"}

::: mycode
[HTML]{.title}

```html
<div>
    Texto
    <div>
        Texto interior
    </div>
</div>
```
:::

:::
::: {.column width="50%" }

::: mycode
[CSS]{.title}
```css
body {
    font-size: 16px;
}
div {
    font-size: 1.5em;
}
```
:::

:::
::::::::::::::


::: questionbox
Zer tamaina izango du "barneko testuak"?
:::


Bigarren [<div>]{.verbatim} elementuak bere gurasoaren letra-tipoaren tamaina erabiltzen du erreferentzia gisa; gurasoa beste [<div>]{.verbatim} bat da, eta horrek, aldi berean, 16px-etik abiatutako letra-tipo erlatiboa du. Emaitza honako hau izango litzateke:

- Jatorrizko tamaina: 16px
- Lehenengo [<div>]{.verbatim}: 16x1.5 = 24px
- Bigarren [<div>]{.verbatim}: 24x1.5 = 36px

Hori erabilgarria izan daiteke zenbait kasutan, baina tamainen kontrola ere zaildu dezake.

::: errorbox
[em]{.verbatim} unitatea erlatiboa eta metagarria da, eta horrek arazoak sor ditzake.
:::


::: exercisebox
[[03h](https://github.com/yuki/ejercicios/blob/main/daw/diw/03h.html)]{.solution}

Egin aurreko adibidea eta aztertu emaitza.
:::


### [rem]{.verbatim} unitate erlatiboa {#unidad-relativa-rem}

[rem]{.verbatim} unitatea letra-tipoaren tamainarekiko erlatiboa ere bada, baina dokumentuaren erro-elementua hartzen du erreferentziatzat. [rem]{.verbatim} unitatea **root em**-etik dator, eta HTML dokumentuaren erroa normalean [<html>]{.verbatim} elementua da.


:::::::::::::: {.columns }
::: {.column width="50%"}

::: mycode
[HTML]{.title}

```html
<h1>Título 1</h1>
<div>
    <h1>Título 2</h1>
</div>
```
:::

:::
::: {.column width="50%" }

::: mycode
[CSS]{.title}
```css
html {
    font-size: 16px;
}
div {
    font-size: 2rem;
}
h1 {
    font-size: 2rem;
}
```
:::

:::
::::::::::::::

::: questionbox
Zein tamaina izango dute [h1]{.verbatim} elementuek?
:::

::: exercisebox
[[03i](https://github.com/yuki/ejercicios/blob/main/daw/diw/03i.html)]{.solution}

Egin aurreko adibidea eta aztertu emaitza.
:::


[rem]{.verbatim}-ren abantaila [em]{.verbatim}-rekiko da tamainen eskala modu erraz eta argian sortzeko aukera ematen duela.

::: mycode
[CSS]{.title}
```css
html  { font-size: 16px; }
h1    { font-size: 2rem; }
h2    { font-size: 1.5rem; }
p     { font-size: 1rem; }
small { font-size: 0.875rem; }
```
:::

Tamainen arteko erlazioa erreferentzia bakar bati dagokionez mantentzen da, eta horrek eskala orokorra geroago aldatzea errazten du.


### [ch]{.verbatim} unitate erlatiboa {#unidad-relativa-ch}

[ch]{.verbatim} unitatea erabilitako letra-tipoaren [0]{.verbatim} karakterearen zabalerarekin lotuta dago. Adibidez:

::: mycode
[CSS]{.title}
```css
p {
    max-width: 60ch;
}
```
:::

Horri esker, testu-lerro baten zabalera gutxi gorabehera mugatu daiteke. Bereziki erabilgarria da testu luzeen irakurgarritasuna hobetzeko. Horrela, paragrafoek lerro luzeegiak izatea saihesten dugu eta izango duten tamaina kontrolatzen dugu.


### [ex]{.verbatim} unitate erlatiboa {#unidad-relativa-ex}

[ex]{.verbatim} unitatea uneko letra-tipoaren [x]{.verbatim} letraren altuerarekin lotuta dago. Adibidez:

::: mycode
[CSS]{.title}
```css
.elemento {
    height: 5ex;
}
```
:::

Erabilera askoz ere urriagoa da [em]{.verbatim}, [rem]{.verbatim} edo [ch]{.verbatim} unitateena baino.

Ohiko garapenetarako, haren existentzia ezagutzea nahikoa izan daiteke, aldizka erabili beharrik gabe.




### Ehunekoak {#porcentajes}

`%` sinboloak unitate erlatibo bat adierazten du, eta haren balioa erabiltzen den testuinguruaren araberakoa da. Propietate askotan, ehunekoa edukiontzi-elementua erreferentzia gisa erabiliz kalkulatzen da.


:::::::::::::: {.columns }
::: {.column width="50%"}

::: mycode
[HTML]{.title}

```html
<div class="contenedor">
    <div class="caja"></div>
</div>
```
:::

:::
::: {.column width="50%" }

::: mycode
[CSS]{.title}
```css
.contenedor {
    width: 800px;
}

.caja {
    width: 50%;
}
```
:::

:::
::::::::::::::


[.contenedor]{.verbatim} elementuak 800px-eko tamaina finkoa du, eta haren barruko kutxak dagokion erreferentzia-tamainaren %50eko zabalera du, hau da, erdia.

::: infobox
Ehunekoak oso erabilgarriak dira diseinu moldagarriak sortzeko.
:::


Ehuneko baten esanahi zehatza erabiltzen den propietatearen araberakoa da.

::: mycode
[CSS]{.title}
```css
.caja {
    padding: 10%;
}
```
:::


Aurreko propietatea ez da zehazki modu berean interpretatzen; beraz, komeni da [dokumentazioa](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference/Values/percentage) irakurtzea.

::: warnbox
Ehunekoaren erabilera propietate zehatzaren eta testuinguruaren araberakoa da.
:::



### *viewport*-arekin lotutako unitateak {#unidades-relacionadas-viewport}

CSSk nabigatzailearen leihoaren tamainarekiko erlatiboak diren unitateak ere eskaintzen ditu. ***[viewport](#viewport)***, modu sinplifikatuan, orriaren eremu ikusgaia da. Harekin lotutako unitate tradizionalak hauek dira:

- [vw]{.verbatim}: ***viewport width*** esan nahi du eta *viewport*-aren **zabaleraren** %1 adierazten du; beraz, [100vw]{.verbatim} *viewport*-aren zabaleraren %100 da.
- [vh]{.verbatim}: ***viewport height*** esan nahi du eta *viewport*-aren **altueraren** %1 adierazten du; beraz, [100vh]{.verbatim} *viewport*-aren altueraren %100 da.

::: mycode
[CSS]{.title}
```css
.elemento {
    width: 100vw;
    height: 100vh;
}
```
:::

Hala ere, benetako aplikazioetan ez da beti beharrezkoa zabalera adierazteko [100vw]{.verbatim} erabiltzea, arazoak sor baititzake desplazamendu-barrak agertzen direnean.

Beste unitate batzuk ere badaude, [dokumentazioan](https://developer.mozilla.org/en-US/docs/Web/CSS/Guides/Values_and_units/Numeric_data_types\#dimensions) azaltzen direnak.


| Unit |	Relative to |
|:----|:----|
| [dvh]{.verbatim} | 1% of the dynamic viewport's height. |
| [dvw]{.verbatim} | 1% of the dynamic viewport's width. |
| [lvh]{.verbatim} | 1% of the large viewport's height. |
| [lvw]{.verbatim} | 1% of the large viewport's width. |
| [svh]{.verbatim} | 1% of the small viewport's height. |
| [svw]{.verbatim} | 1% of the small viewport's width. |
| [vb]{.verbatim} | 1% of viewport's size in the root element's block axis. |
| [vh]{.verbatim} | 1% of viewport's height. |
| [vw]{.verbatim} | 1% of viewport's width. |
| [vi]{.verbatim} | 1% of viewport's size in the root element's inline axis. |
| [vmax]{.verbatim} | 1% of viewport's larger dimension. |
| [vmin]{.verbatim} | 1% of viewport's smaller dimension. |


Table: {tablename=yukitblr colspec=X[1,l]X[4,l]}

Aurrerago sakon aztertuko dugu zer den eta nola funtzionatzen duen [*Viewport*](#viewport)-ak.

## Angelu-unitateak {#unidades-ángulos}

CSSk angeluak adierazteko unitateak ere erabiltzen ditu. Nagusiak hauek dira:

- [deg]{.verbatim}: graduak.
- [rad]{.verbatim}: radianak.
- [grad]{.verbatim}: gradu zentesimalak.
- [turn]{.verbatim}: birak.



:::::::::::::: {.columns }
::: {.column width="50%"}

::: mycode
[Errotazio]{.title}

```css
.elemento {
    transform: rotate(45deg);
}
```
:::

:::
::: {.column width="50%" }

::: mycode
[Errotazio]{.title}
```css
.elemento {
    transform: rotate(0.5turn);
}
```
:::

:::
::::::::::::::

Hurrengo taulan hainbat adibide eta haien baliokidetasunak ikus daitezke, [MDN](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference/Values/angle) dokumentaziotik hartuta.


| Rotación | Equivalencias |
|:----|:----|
| ![](img/diw/angle90.png){width=50%}      | [90deg = 100grad = 0.25turn ≈ 1.5708rad]{.verbatim} |
| ![](img/diw/angle180.png){width=50%}     | [180deg = 200grad = 0.5turn ≈ 3.1416rad]{.verbatim} |
| ![](img/diw/angleminus90.png){width=50%} | [-90deg = -100grad = -0.25turn ≈ -1.5708rad]{.verbatim} |

Table: {tablename=yukitblr colspec=X[1,l]X[4,l]}



::: exercisebox
[[03j](https://github.com/yuki/ejercicios/blob/main/daw/diw/03j.html)]{.solution}

Sortu bi elementu 200px-ko zabalerarekin eta erabili biraketa unitate desberdinak erabiliz.
:::


## Denbora-unitateak {#unidades-tiempo}

CSS propietate batzuek denbora-unitateak erabiltzen dituzte. Unitate horiek bereziki erabiliko ditugu CSS trantsizioak eta animazioak aztertzen ditugunean. Nagusiak hauek dira:

- [s]{.verbatim}: segundoak.
- [ms]{.verbatim}: milisegundoak.


:::::::::::::: {.columns }
::: {.column width="50%"}

::: {.mycode size="footnotesize"}
[Trantsizioak]{.title}

```css
.boton {
  transition: background-color 0.3s;
}
```
:::

:::
::: {.column width="50%" }

::: {.mycode size="footnotesize"}
[Trantsizioak]{.title}
```css
.boton {
  transition: background-color 300ms;
}
```
:::

:::
::::::::::::::

Bi balioek iraupen bera adierazten dute.



<!-- 
TODO: poner esto?
## Unidades de frecuencia {#unidades-frecuencia}

CSS también define unidades relacionadas con frecuencias:

```text
Hz
kHz
```

Por ejemplo:

```css
audio {
    /* Ejemplo conceptual */
}
```

Sin embargo, actualmente tienen una utilización muy reducida en el desarrollo web habitual.

No es necesario utilizarlas en los primeros desarrollos con CSS. -->


## Unitate gabeko balioak {#valores-sin-unidad}

CSS propietate batzuek unitaterik gabeko zenbakiak onartzen dituzte.

:::::::::::::: {.columns }
::: {.column width="50%"}

::: mycode
[Opakutasun]{.title}

```css
.elemento {
    opacity: 0.5;
}
```
:::

:::
::: {.column width="50%" }

::: mycode
[Altuera]{.title}
```css
.elemento {
    line-height: 1.5;
}
```
:::

:::
::::::::::::::

Adibide hauetan ez da beharrezkoa unitatea jartzea, honako arrazoi hauengatik:

- [opacity]{.verbatim}: normalean 0 eta 1 arteko zenbaki bat erabiltzen du.
- [line-height]{.verbatim}: unitaterik gabe ere erabil daitekeen propietatea da.



## [0]{.verbatim} balioa {#valor-0}

CSS propietate askotan, balioa zero denean, unitatea bazter daiteke.

::: mycode
[0 unitate barik]{.title}
```css
.elemento {
    margin: 0;
    padding: 0;
    border-width: 0;
}
```
:::

Kasu hauetan ez da unitaterik jarri behar zero jarri dugulako; beste kopuru bat balitz, berriz, [px]{.verbatim}, [em]{.verbatim} edo beste edozein unitate jarri beharko litzateke.


## Automatikoki kalkulatutako neurriak {#medidas-calculadas}

CSS modernoan, mugikorrak eta *tabletak* agertzearen ondorioz, diseinu *responsive* bihurtu da ezinbesteko, eta, beraz, neurri erlatiboak erabiltzea ere ezinbestekoa da. Horri neurriak automatikoki kalkulatzeko aukera gehitu behar zaio.


### [Calc()]{.verbatim} {#calc}

CSSk unitate desberdinak erabiliz kalkuluak egiteko aukera ematen du [calc()]{.verbatim} funtzioaren bidez.

::: mycode
[Zabalera kalkulatu automatikoki]{.title}
```css
.caja {
    width: calc(100% - 40px);
}
```
:::

Arau honekin zabalera "eskuragarri dagoen zabalera ken 40px" izango dela adierazten ari gara, eta, horrela, ez dugu zabalera behartu behar, erlatiboa eta kalkulatua baita.

[calc()]{.verbatim} funtzioak oinarrizko lau eragiketak onartzen ditu: batuketa ([+]{.verbatim}), kenketa ([-]{.verbatim}), biderketa ([*]{.verbatim}) eta zatiketa ([/]{.verbatim}).


### [min()]{.verbatim} eta [max()]{.verbatim} {#min-y-max}

CSS modernoek tamaina kalkulatzeko bi funtzio ere eskaintzen ditu:

- [min()]{.verbatim}: emandako balioetatik txikiena erabiltzen du.
- [max()]{.verbatim}: emandako balioetatik handiena erabiltzen du.

Bi funtzioek komaz bereizitako parametro bat edo gehiago onartzen dituzte.

:::::::::::::: {.columns }
::: {.column width="50%"}

::: mycode
[min()]{.title}

```css
.caja {
    width: min(90%, 1000px);
}
```
:::

:::
::: {.column width="50%" }

::: mycode
[max()]{.title}
```css
.caja {
    width: max(300px, 50%);
}
```
:::

:::
::::::::::::::

Lehenengo adibideak emandako balioetatik txikiena erabiltzea ahalbidetzen du. Beraz:

- Pantaila txikietan `90%` erabil dezake.
- Pantaila handietan ez du `1000px` gaindituko.

Bigarren adibidean, [max()]{.verbatim} erabiliz, bi balioetatik handiena erabiliko du.


### [clamp()]{.verbatim} {#clamp}

Diseinu moldagarrietarako bereziki erabilgarria den funtzio bat [clamp()]{.verbatim} da. Haren [sintaxiak](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference/Values/clamp\#parameters) hiru parametro onartzen ditu, [clamp(min, val, max)]{.verbatim}:

- **min**: Nahiago den balioa balio hori baino txikiagoa bada, gutxieneko balioa erabiliko da.
- **val**: Nahiago den balioa da. Haren emaitza gutxieneko eta gehieneko balioen artean dagoen bitartean erabiliko den adierazpena da. Normalean balio erlatiboa izaten da.
- **max**: Gehieneko balioa da. Nahiago den balioa goiko muga hori baino handiagoa bada, propietateari esleituko zaion adierazpen-baliorik handiena (positiboena) da.


::: mycode
[max()]{.title}
```css
h1 {
    font-size: clamp(2rem, 5vw, 4rem);
}
```
:::


Adibide honen tamaina:

- Ez da inoiz [2rem]{.verbatim} baino txikiagoa izango.
- [5vw]{.verbatim} erabiltzen saiatuko da.
- Ez da inoiz [4rem]{.verbatim} baino handiagoa izango.

Horri esker, erabilgarri dagoen espaziora progresiboki egokitzen diren tamainak sor daitezke.

