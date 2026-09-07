
# Sarrera {#diseño-moderno-introducción}

Orain arte, elementuen itxura bisuala nola sortu ikasi dugu, koloreak, letra-tipoak, ertzak, marjinak eta kutxen eredua erabiliz. Hala ere, oraindik falta zaigu elementuak orri baten barruan nola banatu.

Urte askotan, hori izan da CSSren zeregin konplexuenetako bat. Garatzaileek taulak, elementu flotagarriak ([float]{.verbatim}) eta kokapen absolutua ere erabiltzen zituzten menuak, zutabeak eta orri osoak eraikitzeko. Teknika horiek funtzionatzen zuten, baina zailak ziren mantentzen, eta ez ziren benetan maketazioak sortzeko diseinatu.

CSS3tik aurrera, interfazeak diseinatzeko modua erabat aldatu zuten bi teknologia agertu ziren:

- **[Flexbox](https://developer.mozilla.org/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Basic_concepts)**, elementuak **dimentsio bakarrean** banatzeko pentsatua.
- **[CSS Grid](https://developer.mozilla.org/en-US/docs/Web/CSS/Guides/Grid_layout)**, **bi dimentsioko sareta** sortzeko diseinatua, errenkadekin eta zutabeekin aldi berean.



# Flexbox {#flexbox}

**Flexbox** (*Flexible Box Layout*) elementuak **norabide bakarrean**, horizontalean zein bertikalean, antolatzen dituen maketazio-sistema da. Edukiontzi baten barruan elementuak modu errazean banatu eta lerrokatzea ahalbidetzen du.

Abantaila nagusia da nabigatzaileak elementuen artean automatikoki banatzen duela erabilgarri dagoen espazioa, eta horrela [float]{.verbatim}-ekin zeuden arazo asko saihesten dira.

Gaur egun, Flexbox da honako hauek sortzeko gehien erabiltzen den tresna:

- Menu horizontalak.
- Nabigazio-barrak.
- Lerrokatutako botoiak.
- Txartelak.
- Goiburuak.
- Inprimakiak.
- Tresna-barrak.


Flexbox-ek bi elementu mota erabiltzen ditu beti:

- **Flex edukiontzia**: Flexbox aktibatzen duen elementu gurasoa.
- **Flex elementuak**: edukiontziaren seme zuzenak.


## Flex edukiontzia {#contenedor-flex}

*Flex* edukiontzia beste elementu batzuk izango dituen elementu gurasoa da. Elementu horiek horizontalean edo bertikalean lerrokatuko dira erabilgarri dagoen espazioan.

:::::::::::::: {.columns columnsep=0.5cm}
::: {.column width="50%"}

::: {.mycode}
[HTML]{.title}
```html
<div class="contenedor">
    <div class="caja">A</div>
    <div class="caja">B</div>
    <div class="caja">C</div>
</div>
```
:::

:::
::: {.column width="50%" }

::: {.mycode}
[CSS]{.title}
```css
.contenedor {
    display: flex;
}
.caja {
    width:50px;
    height: 50px;
    border: 1px solid black;
}
```
:::

:::
::::::::::::::

Lehenespenez, elementuak errenkadetan lerrokatzen dira, bata bestearen atzetik, ezkerretik eskuinera. Edukiontzia semeak okupatutako espazioa baino handiagoa bada, lehenespenez ezkerreko zatia soilik beteko da.

Propietate lehenetsiak aldatu nahi baditugu, honako propietate hauek ditugu:

- [flex-direction]{.verbatim}: ardatzaren norabidea zehazten du (errenkada edo zutabea).
- [flex-wrap]{.verbatim}: seme guztientzat lekurik ez badago, lerro edo zutabe berri batera igarotzen den zehazten du.
- [flex-flow]{.verbatim}: aurreko propietateen konbinazioa da.
- [gap]{.verbatim}: semeen arteko tartea adierazteko.
- [row-gap]{.verbatim}: errenkaden arteko tartea.
- [column-gap]{.verbatim}: zutabeen arteko tartea.

Propietate horiek **elementu guztien multzoari** eragiten diote, eta ez seme bakar bati.


### [flex-direction]{.verbatim} {#flex-direction}

Zein ardatz mota erabili nahi dugun (errenkada edo zutabea) eta haren ordena aukeratzeko aukera ematen digu. Balio posibleak hauek dira:

- [row]{.verbatim}: Errenkada bat sortzen du.
- [row-reverse]{.verbatim}: Errenkada alderantzikatua sortzen du, eskuineko aldetik ezkerrera hasita; lehen seme amaieran jarriko du, ondoren bigarrena, ... Garrantzitsua da azpimarratzea **irudikapen bisuala soilik aldatzen duela**, ez HTML dokumentuaren ordena.
- [column]{.verbatim}: Zutabe bat sortzen du.
- [column-reverse]{.verbatim}: Alderantzizko zutabe bat sortzen du, errenkadaren kasuan bezala, baina zutabe moduan.


### [flex-wrap]{.verbatim} {#flex-wrap}

Lehenespenez, Flexbox elementu guztiak lerro bakarrean jartzen saiatzen da, eta lekurik ez badago, semeak konprimitu egin daitezke. [flex-wrap]{.verbatim} erabiliz portaera hori alda dezakegu, adierazitako balioaren arabera:

- [nowrap]{.verbatim}: beti lerro bakarra erabiliko du. Portaera lehenetsia da.
- [wrap]{.verbatim}: hainbat lerro erabiltzea ahalbidetzen du leku nahikorik ez badago.
- [wrap-reverse]{.verbatim}: hainbat lerro erabiltzea ahalbidetzen du, baina alderantzizko ordenan.

![Errenkada batean [wrap]{.verbatim} eta [wrap-reverse]{.verbatim} erabiltzearen adibidea](img/diw/flex-wrap.png){width=50%}


### [flex-flow]{.verbatim} {#flex-flow}

Propietate honek [flex-direction]{.verbatim} eta [flex-wrap]{.verbatim} konbinatzen ditu. Funtsean, aurreko bi propietateak idatzi behar izatea saihesten du, eta horrela bakarra izan dezakegu:


::: {.mycode}
[CSS]{.title}
```css
.contenedor {
    flex-flow: row wrap;
}
```
:::

Erabat baliozkoa bada ere, talde askok nahiago dute bi propietateak banaka idaztea, irakurgarritasuna hobetzeko.

### [gap]{.verbatim} {#gap}

Tradizionalki, marjinak erabili behar ziren elementuak elkarrengandik bereizteko. Flexbox-ek askoz ere irtenbide garbiagoa ekarri zuen: [gap]{.verbatim} propietatea. Espazioa automatikoki aplikatzen da elementuen artean, edukiontziaren kanpoko ertzei eragin gabe.


::: {.mycode}
[CSS]{.title}
```css
.contenedor {
    gap: 30px;
}
```
:::

Gaur egun, [gap]{.verbatim} aukera gomendatzen da marjinak erabili beharrean osagai malguak elkarrengandik bereizteko.

Norabide bakoitza banaka kontrolatzea ere posible da.

- [row-gap]{.verbatim}: errenkaden arteko tartea kontrolatzen du.
- [column-gap]{.verbatim}: zutabeen arteko tartea kontrolatzen du.

Propietate hauek bereziki erabilgarriak dira [flex-wrap]{.verbatim} erabiltzen dugunean.


::: exercisebox
[[07a](https://github.com/yuki/ejercicios/blob/main/daw/diw/07a.html)]{.solution}

Sortu edukiontzi guraso malgu bat:

- Gehitu hainbat elementu barruan.
- Konbinatu aurretik ikusitako propietateak.
- Egin leihoa txikiagoa, semeak nola berrantolatzen diren ikusteko.
- Gehitu haien artean tarte desberdinak.
:::


## Elementu malguak {#elementos-flexibles}

Elementu malguak (edukiontzi malgu baten barruan daudenak) hazi, tamaina txikitu, hasierako tamaina desberdina izan, ikusizko ordena aldatu edo gainerako kideekiko modu desberdinean lerrokatu daitezke.

Propietate nagusiak, erabileraren laburpen batekin, hauek dira:

- [flex-grow]{.verbatim}: elementua proportzionalki hazten da.
- [flex-shrink]{.verbatim}: elementuak tamaina murrizten du lekurik ez dagoenean.
- [flex-basis]{.verbatim}: elementuaren hasierako tamaina.
- [order]{.verbatim}: ikusizko ordena.
- [align-self]{.verbatim}: banakako lerrokatzea.

Propietate hauek **edukiontziaren semei aplikatzen zaizkie, inoiz ez edukiontziari berari**.


### [flex-grow]{.verbatim} {#flex-grow}

[flex-grow]{.verbatim} propietateak adierazten du elementu bat zenbat **hazi** daitekeen edukiontziaren barruan leku librea dagoenean. Lehenespenez, balioa [0]{.verbatim} da; beraz, elementuak ez dira hazten. Propietate honek ez du pixelik adierazten, baizik eta **proportzioak**.


::: {.mycode}
[Tamaina aldatu]{.title}
```css
.c1 { flex-grow: 1; }
```
:::


Propietate hau duen elementua edukiontzi gurasoaren soberako espazioa okupatuz haziko da. Seme guztiek balio bera badute, guztiak berdin haziko dira eta espazioa modu ekitatiboan banatuko dute. Horrela, **tamaina bereko zutabeak** sor ditzakegu.


Aldiz, hiru seme baditugu eta honako balio hauek badituzte:

::: {.mycode}
[Tamaina aldatu]{.title}
```css
.c1 { flex-grow: 1; }
.c2 { flex-grow: 2; }
.c3 { flex-grow: 1; }
```
:::

Horrela, hiru semeak espazioa banatuko dute, eta "c1" eta "c3" tamaina berekoak izango dira; "c2", berriz, aurreko biak baino bi aldiz handiagoa izango da.



### [flex-shrink]{.verbatim} {#flex-shrink}

[flex-grow]{.verbatim} propietateak hazkundea kontrolatzen duen bitartean, **[flex-shrink]{.verbatim}** propietateak lekurik ez dagoenean elementu bat zenbat murriztu daitekeen kontrolatzen du. Lehenespenezko balioa [1]{.verbatim} da, eta horrek esan nahi du elementua txikitu egin daitekeela. 

::: {.mycode}
[Txikiagoa izatea eragoztea]{.title}
```css
.c4 {
    width: 150px;
    flex-shrink: 0;
}
```
:::

Horrela, elementu hau ez da txikiago egingo, eta hori erabilgarria da logo eta ikonoetarako.


### [flex-basis]{.verbatim} {#flex-basis}

[flex-basis]{.verbatim} propietateak elementu baten **hasierako tamaina** definitzen du, espazioa banatu aurretik. Flexbox-ek banaketa kalkulatzeko erabiltzen duen abiapuntua dela imajina dezakegu.


::: {.mycode}
[Hasierako tamaina]{.title}
```css
.c5 {
    flex-basis: 200px;
}
```
:::


Askotan [width]{.verbatim} erabiltzearen ordez erabiltzen da, [width]{.verbatim}-ek elementuaren zabalera definitzen baitu, eta [flex-basis]{.verbatim}-ek, berriz, Flexbox-en algoritmoaren barruko hasierako tamaina definitzen baitu.

::: infobox
Flexbox-ekin lan egiten dugunean, normalean [width]{.verbatim} erabili beharrean [flex-basis]{.verbatim} erabiltzea gomendatzen da, banaketa-sistema honetarako berariaz pentsatuta baitago.
:::


### [flex]{.verbatim} propietate laburtua {#propiedad-flex-abreviada}

Aurreko hiru propietateak idatzi behar ez izateko, [[flex]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference/Properties/flex) propietatea erabil dezakegu. Propietate honek [grow shrink basis]{.verbatim} ordenari jarraitzen dio; beraz, honako instrukzio hauek baliokideak dira:

:::::::::::::: {.columns columnsep=0.5cm}
::: {.column width="50%"}

::: {.mycode}
[Propietateak banaka]{.title}
```css
.item {
    flex-grow: 1;
    flex-shrink: 1;
    flex-basis: 200px;
}
```
:::

:::
::: {.column width="50%" }

::: {.mycode}
[Propietate bakarra]{.title}
```css
.item {
    flex: 1 1 200px;
}
```
:::

:::
::::::::::::::



### [order]{.verbatim}

[order]{.verbatim} propietateak elementu baten **ikusizko ordena** aldatzen du.

:::::::::::::: {.columns columnsep=0.5cm}
::: {.column width="50%"}

::: {.mycode}
[HTML]{.title}
```html
<div class="contenedor">
    <div class="a">A</div>
    <div class="b">B</div>
    <div class="c">C</div>
</div>
```
:::

:::
::: {.column width="50%" }

::: {.mycode}
[CSS]{.title}
```css
.a { order: 2; }
.b { order: 3; }
.c { order: 1; }
```
:::

:::
::::::::::::::


Kasu honetan, ikusizko emaitza [C  A  B]{.verbatim} izango da. Irudikapen bisuala soilik aldatzen da; HTML hierarkiak, berriz, bere horretan jarraitzen du.


### [align-self]{.verbatim} {#align-self}

Orain arte, elementu guztiek lerrokatze bertikal bera partekatzen zuten. [align-self]{.verbatim} erabiliz, **elementu bakar batek** beste lerrokatze bat izatea lor dezakegu.

::: {.mycode}
[CSS]{.title}
```css
.destacado {
    align-self: center;
}
```
:::


Elementu hau bertikalki zentratuta lerrokatzen da, eta gainerako elementuek edukiontziaren lerrokatzea mantentzen dute.


::: exercisebox
[[07b](https://github.com/yuki/ejercicios/blob/main/daw/diw/07b.html)]{.solution}

Aurreko ariketan oinarrituta, erabili propietateak [flex]{.verbatim} edukiontzi baten barruko elementuetarako.
:::


# Lerrokatzeak {#alineaciones}

Flexbox-ek [float]{.verbatim} ordezkatzeko arrazoi nagusietako bat elementuak **horizontalki eta bertikalki lerrokatzeko** ematen duen erraztasuna izan zen. Flexbox-en aurretik, orri bateko elementu bat zentratzeak marjinen konbinazioak, kokapen absolutua edo baita taulak ere erabiltzea eskatzen zuen. Flexbox-ekin, lerrokatzea oso argiak diren hiru propietateren bidez egiten da:

- [justify-content]{.verbatim}: **ardatz nagusiaren** gaineko lerrokatzea.
- [align-items]{.verbatim}: **zeharkako ardatzaren** gaineko lerrokatzea.
- [align-content]{.verbatim}: **hainbat errenkada edo zutaberen** lerrokatzea, [flex-wrap]{.verbatim} dagoenean.

Ardatz nagusiaren eta zeharkako ardatzaren arteko aldea ulertzeko, ondorengo taula erabil dezakegu:


|                     |  flex-direction: row  |  flex-direction: column  |
|---------------------|---------------------|---------------------|
| **Ardatz nagusia**   | Horizontala  | Bertikala |
| **Zeharkako ardatza** | Bertikala    | Horizontala |

Table: {tablename=yukitblrcol colspec=X[2]X[3]X[3]}


::: warnbox
Propietate hauek erabili aurretik, garrantzitsua da beti edukiontziaren ardatz nagusia identifikatzea.
:::


## [justify-content]{.verbatim} {#justify-content}

[justify-content]{.verbatim} propietateak elementuak **ardatz nagusian** zehar banatzen ditu: errenkadekin lan egiten dugunean, espazio horizontala banatzen du. Balio nagusiak hauek dira:

- [flex-start]{.verbatim}: Lehenespenezko balioa da. Elementuak edukiontziaren hasieran biltzen dira.
- [flex-end]{.verbatim}: Elementuak edukiontziaren amaieran biltzen dira.
- [center]{.verbatim}: Elementuak edukiontziaren erdian biltzen dira.
- [space-between]{.verbatim}: Espazioa elementuen **artean** banatzen du. Muturrak edukiontziaren ertzei itsatsita geratzen dira.
- [space-around]{.verbatim}: Elementu bakoitzak espazioa jasotzen du bi aldeetan. Kanpoko espazioak barnekoen erdia dira gutxi gorabehera.
- [space-evenly]{.verbatim}: Espazioa erabat modu uniformean banatzen du. Espazio guztiak, muturretakoak barne, berdinak dira.


::: {.mycode}
[[justify-content]{.verbatim} adibidea]{.title}
```css
.contenedor { justify-content: space-between; }
```
:::


![[justify-content]{.verbatim} adibidea balo desberdinekin](img/diw/justify-content.png){width=60% framed=true}


::: exercisebox
[[07c](https://github.com/yuki/ejercicios/blob/main/daw/diw/07c.html)]{.solution}

Sortu edukiontziak [justify-content]{.verbatim} propietateak bere seme-alabak lerrokatzeko eskaintzen dituen aldaerekin.
:::


## [align-items]{.verbatim} {#align-items}

[align-items]{.verbatim} propietateak **zeharkako ardatzean** lerrokatzea kontrolatzen du. Errenkada batekin lan egiten badugu, lerrokatze bertikala esan nahi du. Propietate honek hainbat balio ditu; beraz, komeni da [dokumentazioa](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference/Properties/align-items) kontsultatzea, baina nagusiak hauek dira:

- [stretch]{.verbatim}: Lehenespenezko balioa da. Elementuak edukiontziaren altuera osoa betetzeko luzatzen dira, betiere altuera definituta ez badute. Oso erabilgarria da altuera bereko zutabeak sortzeko.
- [center]{.verbatim}: Elementuek definitutako altuera mantentzen dute eta beren ardatz bertikalarekiko lerrokatzen dira.
- [flex-start]{.verbatim}: Elementuak edukiontziaren goiko aldean lerrokatzen dira bertikalki.
- [flex-end]{.verbatim}: Elementuak edukiontziaren beheko aldean lerrokatzen dira bertikalki.
- [baseline]{.verbatim}: Testuaren oinarri-lerroarekiko lerrokatzen dira.

Azalpenetan errenkaden erabilera hartu da erreferentziatzat.


::: {.mycode}
[[align-items]{.verbatim} adibidea]{.title}
```css
.contenedor {
    display: flex;
    flex-wrap: wrap;
    align-items: center;
}
```
:::


![[align-items]{.verbatim} adibideak. [MDN](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference/Properties/align-items)-tik hartuta](img/diw/align-items.png){width=100%}


::: exercisebox
[[07d](https://github.com/yuki/ejercicios/blob/main/daw/diw/07d.html)]{.solution}

Egiaztatu [align-items]{.verbatim}-en azaldutako balioak eta egin zeure adibideak.
:::


## [align-content]{.verbatim} {#align-content}

[align-content]{.verbatim} propietatea [align-items]{.verbatim}-ekin nahastu ohi da, baina haren funtzioa desberdina da. [flex-wrap]{.verbatim} dagoenean eta **hainbat errenkada edo zutabe** daudenean soilik jarduten du. Parametro honekin **errenkada osoak** lerrokatzen dira, ez banakako elementuak (aurreko parametroan gertatzen zen bezala). Balioak aurrekoen antzekoak dira:

- [center]{.verbatim}: Errenkadak edukiontziaren elementuaren ardatz bertikalaren erdian lerrokatzen dira.
- [start]{.verbatim}: Errenkadak edukiontziaren goiko aldean lerrokatzen dira bertikalki.
- [end]{.verbatim}: Errenkadak edukiontziaren beheko aldean lerrokatzen dira bertikalki.
- [space-between]{.verbatim}, [space-around]{.verbatim}, [space-evenly]{.verbatim}: [[justify-content]{.verbatim}](#justify-content)-en azaldutakoaren modu berean funtzionatzen dute, baina errenkada-mailan.

Errenkada bakarra badago, [align-content]{.verbatim}-ek ez du inolako eraginik.

::: {.mycode}
[[align-content]{.verbatim} adibidea]{.title}
```css
.contenedor {
    display: flex;
    flex-wrap: wrap;
    align-content: center;
}
```
:::


::: infobox
[align-content]{.verbatim} propietateak lerro/zutabe osoan eragiten du.
:::

![[align-content]{.verbatim} adibideak. [MDN](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference/Properties/align-items)-tik hartuta](img/diw/align-content.png){width=100%}



::: exercisebox
[[07e](https://github.com/yuki/ejercicios/blob/main/daw/diw/07e.html)]{.solution}

Egiaztatu [align-items]{.verbatim}-en azaldutako balioak eta egin zeure adibideak.
:::


# CSS Grid {#grid}

Orain arte **Flexbox** erabili dugu elementuak norabide bakarrean banatzeko. Hala ere, interfaze askok **errenkadak eta zutabeak aldi berean** kontrolatu behar dituzte: irudi-galeriak, administrazio-panelak, egutegiak edo web-orri baten banaketa osoa.

**[CSS Grid Layout](https://developer.mozilla.org/en-US/docs/Web/CSS/Guides/Grid_layout)**, besterik gabe **Grid** izenez ezagutzen dena, mota horretako saretak sortzeko bereziki diseinatutako bi dimentsioko maketazio-sistema da. Flexbox-ek elementuak errenkada edo zutabe batean antolatzen dituen bitartean, Grid-ek **errenkadek eta zutabeek aldi berean** osatutako egitura oso bat definitzea ahalbidetzen du. Gaur egun, Grid da web-aplikazio baten layout nagusia eraikitzeko gomendatzen den tresna.

Bi sareta/*grid* mota daudela defini dezakegu:

- **Grid esplizitua**: errenkaden eta/edo zutabeen kopurua eta tamaina eskuz definitzen dira. Garatzaileak esplizituki definitutako diseinu finko bat du. Normalean, webgunearen egitura orokorra edo irakurketa-zutabeen sistema definitzeko erabiltzen da...
- **Grid inplizitua**: nabigatzaileak behar denean automatikoki sortzen dituen errenkadek eta/edo zutabeek osatzen dute. Normalean argazki-galerietan edo web-orrietako azal-diseinuetan erabiltzen da, elementu kopuru finko bat baina tamaina desberdinak daudenean... Hasierako sarean zehaztu dena baino elementu gehiago daudenean gertatzen da.

## Grid edukiontzia {#contenedor-grid}

Grid aktibatzeko, nahikoa da elementu bat sareta-edukiontzi bihurtzea; une horretatik aurrera, haren seme-alaba zuzen guztiak **saretako elementu** bihurtzen dira.

:::::::::::::: {.columns columnsep=0.5cm}
::: {.column width="50%"}

::: {.mycode}
[HTML]{.title}
```html
<div class="contenedor">
    <div class="caja">A</div>
    <div class="caja">B</div>
    <div class="caja">C</div>
</div>
```
:::

:::
::: {.column width="50%" }

::: {.mycode}
[CSS]{.title}
```css
.contenedor {
    display: grid;
}
.caja {
    width:50px;
    height: 50px;
    border: 1px solid black;
}
```
:::

:::
::::::::::::::


Nahiz eta oraindik errenkadarik eta zutaberik definitu ez dugun, elementua dagoeneko Grid edukiontzia da. Atal honetan ikusiko ditugun propietateak beti edukiontziari aplikatzen zaizkio. Sareta/*grid* bat bi pista (*track*) motak osatzen dute:

- **Zutabeak**: [grid-template-columns]{.verbatim}
- **Lerroak/Errenkadak**: [grid-template-rows]{.verbatim}

[[grid-template-areas]{.verbatim}](#grid-areas) izeneko ezaugarri berezi bat dago, aurrerago ikusiko duguna.


### [grid-template-columns]{.verbatim} {#grid-template-columns}

Grid-en propietate garrantzitsuena da, eta zutabeak sortzeko erabiltzen da:

::: {.mycode}
[CSS]{.title}
```css
.contenedor {
    display: grid;
    grid-template-columns: 150px 150px 150px;
}
```
:::


Balio bakoitzak zutabe baten zabalera definitzen du; beraz, aurreko adibidean 150px-eko hiru zutabe sortzen dira.


#### [fr]{.verbatim} unitatea

**[fr]{.verbatim}** (*fraction*) unitateak eskuragarri dagoen espazioaren zati bat adierazten du.

::: {.mycode}
[CSS]{.title}
```css
.contenedor {
    display: grid;
    grid-template-columns: 1fr 2fr 1fr;
}
```
:::

Hiru zutabeek espazioa proportzio desberdinetan banatzen dute; kasu honetan, erdiko zutabeak alboetakoen bikoitza hartzen du. Funtzionamendua [[flex-grow]{.verbatim}](#flex-grow)-en oso antzekoa da. Unitate hau errenkadekin ere erabil daiteke.


### [grid-template-rows]{.verbatim} {#grid-template-rows}

Lerroak modu baliokidean definitzen dira.

::: {.mycode}
[CSS]{.title}
```css
.contenedor {
    display: grid;
    grid-template-rows: 80px 200px 60px;
}
```
:::

Kasu honetan, tamaina desberdineko hiru errenkadaz osatutako *grid* bat sortu da.


## [gap]{.verbatim} Grid-en {#gap-grid}

Flexbox-ek bezala, Grid-ek [gap]{.verbatim} erabiltzen du elementuak elkarrengandik bereizteko. Horrek marjinak erabiltzea ordezkatzen du eta errenkaden eta zutabeen arteko tarte uniformea sortzen du.


::: {.mycode}
[CSS]{.title}
```css
.contenedor {
    display: grid;
    grid-template-columns: 1fr 2fr 1fr;
    gap: 20px;
}
```
:::

[gap]{.verbatim}-ez gain, [row-gap]{.verbatim} eta [column-gap]{.verbatim} ere badaude.


## [repeat()]{.verbatim} funtzioa {#función-repeat}

Zutabe berdin asko daudenean, eskuz idaztea errepikakorra da; horregatik, [repeat()]{.verbatim} funtzioa erabil dezakegu. Adibidez, lau zutabe sortzeko [1fr 1fr 1fr 1fr]{.verbatim} idatzi beharrean, honako hau erabil dezakegu:

::: {.mycode}
[CSS]{.title}
```css
.contenedor {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 20px;
}
```
:::

Emaitza erabat bera da, eta kodea irakurgarriagoa da. [repeat()]{.verbatim} CSS Grid-en gehien erabiltzen diren funtzioetako bat da.



## *Grid* moldagarriak {#grids-adaptables}

*Grid responsive*ak sor ditzakegu [[minmax()]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference/Values/minmax) eta [[auto-fit]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference/Values/repeat\#auto-fit) erabiliz.

::: {.mycode}
[CSS]{.title}
```css
.contenedor {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
    gap: 20px;
}
```
:::


Jarraian, funtzioaren azalpena:

- [repeat]{.verbatim}: funtzioa zutabe-sistema errepikatzen saiatzen da.
  - [[auto-fit]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference/Values/repeat\#auto-fit): Espazioa zutabeekin betetzen saiatzen da, baina zutabe bat hutsik badago, tolestu/desagertu egiten da.
  - [[minmax]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference/Values/minmax): bi parametro jasotzen dituen funtzioa da: minimoa eta maximoa. Gutxienekoa baino berdina edo handiagoa eta maximoa baino berdina edo txikiagoa den tarte bat sortzen du.

Beraz, zutabe-sistema bat sortzea da helburua, zutabe bakoitzak gutxienez 220px izan ditzan eta, espazio gehiago badago, zutabe berriak sor daitezen.

Patroi hau web-garapen modernoan gehien erabiltzen denetako bat da.

::: exercisebox
[[07f](https://github.com/yuki/ejercicios/blob/main/daw/diw/07f.html)]{.solution}

Sortu [grid]{.verbatim} bidez sareta den edukiontzi guraso bat, erabili aurretik ikusitako propietateak eta erabili errepikapen-sistema.
:::

## Beste parametro batzuk {#otros-parámetros}

Beste parametro batzuk ere badaude *grid*ak gure beharretara egokitzeko eta kontrolatzeko. Jarraian, [dokumentazioan](https://developer.mozilla.org/en-US/docs/Web/CSS/Guides/Grid_layout) agertzen den zerrendako batzuk ditugu.

- [grid-auto-flow]{.verbatim}: kokapen automatikoko algoritmoaren funtzionamendua kontrolatzen du, automatikoki kokatutako elementuak saretan nola banatzen diren zehaztuz (errenkadetan edo zutabeetan).
- [grid-auto-columns]{.verbatim}: *grid*-aren zutabeen tamaina zehazten du.
- [grid-auto-rows]{.verbatim}: *grid*-aren errenkaden tamaina zehazten du.
- [grid-column-start]{.verbatim}: elementu batek sareko zutabe baten barruan duen hasierako kokapena zehazten du.
- [grid-column-end]{.verbatim}: elementu batek sareko zutabe baten barruan duen amaierako kokapena zehazten du.
- [grid-row-start]{.verbatim}: elementu batek sareko errenkada baten barruan duen hasierako kokapena zehazten du.
- [grid-row-end]{.verbatim}: elementu batek sareko errenkada baten barruan duen amaierako kokapena zehazten du.




## Grid Areas {#grid-areas}

Orain arte, errenkada eta zutabe kopurua definituz eraiki ditugu sareak, eta elementuak automatikoki kokatzen utzi dugu. Hala ere, web-orri baten egitura osoa diseinatzen dugunean, erosoagoa izan ohi da **layout-aren eremu bakoitzari izen bat ematea**, errenkada eta zutabeen zenbakiekin lan egitea baino.



**Grid Areas**-ek "*header*", "*menu*", "*main*" edo "*footer*" bezalako izenak esleitzea ahalbidetzen die sareta bateko eskualde desberdinei, eta horrela kodea askoz irakurgarriagoa eta mantentzeko errazagoa bihurtzen da. [grid-template-areas]{.verbatim} propietatearen bidez, banaketa hau egin dezakegu, ikusmen aldetik argiagoa izan daitekeena.

Imajina dezagun ohiko web-orri bat, hainbat atal dituena:

:::::::::::::: {.columns columnsep=0.5cm}
::: {.column width="50%"}

::: {.mycode}
[HTML]{.title}
```html
<div id="page">
  <div id="logo">logo</div>
  <header>Header</header>
  <nav>Navigation</nav>
  <main>Main area</main>
  <div id="ads">ads</div>
  <footer>Footer</footer>
</div>
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[CSS]{.title}
```css
#page {
  display: grid;
  width: 100%;
  height: 100vh;
  grid-template-areas:
    "logo head head"
    "nav  main ads"
    ".    foot .";
  grid-template-rows: 50px 1fr 30px;
  grid-template-columns: 150px 1fr 150px;
}
#page > header {
  grid-area: head;
}
#page > nav {
  grid-area: nav;
}
/* resto áreas */
```
:::

:::
::::::::::::::

[grid-template-areas]{.verbatim}-en ikus daiteke nola bereizten den elementu bakoitza modu "bisualean", hiru errenkada eta hiru zutabe sortuz, eta "gelaxka" bakoitzak izen bat du. Izen bat errenkada berean errepikatzen denean, horizontalki zabaltzen da; gauza bera gertatzen da zutabeekin bertikalki. Puntu batez ([.]{.verbatim}) markatutako eremuak gelaxka hutsak dira. Emaitza honako hau izango litzateke:

![[grid-template-areas]{.verbatim}-en oinarrizko adibidea](img/diw/grid-template-areas.png){width=80% framed=true}

::: errorbox
"Gelaxketan" izenak jartzean, eremuek laukizuzenak osatu behar dituzte; ezin dute forma "arrarorik" izan:
:::


::: exercisebox
[[07g](https://github.com/yuki/ejercicios/blob/main/daw/diw/07g.html)]{.solution}

Sortu webgune modernoen txantiloiak [grid-template-areas]{.verbatim} erabiliz.
:::


# Grid eta Flexbox batera {#grid-flexbox-juntos}

Grid eta Flexbox ez dira teknologia lehiakideak, baizik eta **osagarriak**. Ohikoa da biak batera erabiltzea, bakoitzak ezaugarri batzuk eskaintzen baititu, eta horrek bestea erabiltzea baino errazagoa egiten du. Gainera, biak CSS estandarraren parte dira, nabigatzaile moderno guztiekin bateragarriak dira eta proiektu berean batera erabil daitezke.

Hurrengo taulan bi teknologien ezaugarri desberdinen laburpen osoa ikus daiteke:

|                | Flexbox | Grid |
|----------------|----------|------|
| Dimentsioak | 1 | 2 |
| Errenkadak | Bai | Bai |
| Zutabeak | Bai | Bai |
| Errenkaden eta zutabeen aldibereko kontrola | Ez | Bai |
| Espazioaren banaketa automatikoa | Bikaina | Bikaina |
| Layout osoa | Mugatua | Ezin hobea |
| Osagai txikiak | Ezin hobea | Posible |
| Galeriak | Onargarria | Bikaina |

Table: {tablename=yukitblrcol colspec=X[2]X[1]X[1]}



Adibidez, bi teknologiak batera erabiltzeko modu bat honako hau izan daiteke:

- **Txantiloi orokorra**: Grid-ekin sortua, hainbat atalekin:
  - **Header**: Flexbox erabiltzea logoa, atalak, bilaketa-koadroa eta abar kokatzeko.
  - **Sidebar**
  - **Main**: Edukiaren arabera, Flexbox edo Grid erabil daiteke.
  - **Footer**: Flexbox atalak gehitzeko.

