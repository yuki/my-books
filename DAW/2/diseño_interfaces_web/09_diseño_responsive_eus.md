

# Sarrera {#introducción-responsive}

Internet 1990eko hamarkadan ezaguntzen hasi zenean, erabiltzaile gehienek mahaigaineko ordenagailuetatik nabigatzen zuten, eta monitoreen bereizmen-teknologiak antzeko tamainak zituen. Web-orriak bereizmen bakar bat kontuan hartuta diseinatzen ziren; beraz, ohikoa zen 800 edo 1024 pixeleko zabalera finkoa zuten webguneak sortzea.

Denborarekin, ordenagailu eramangarriak, pantaila panoramikoak, tabletak, telefono adimendunak eta baita Internetera konektatutako telebistak ere agertu ziren. Bat-batean, web-orri bera behar bezala ikusi behar zen 320 pixel inguruko pantailetan zein 2.500 pixel baino gehiagoko zabalerako monitoreetan. Aniztasun horrek diseinurako ikuspegi berri bat behar izatea ekarri zuen: **Responsive Web Design**.

Gaur egun, diseinu *responsive* ezinbesteko baldintza da edozein web-garapenetan. Ez da soilik web-orri bat mugikor batean "sartzea", baizik eta banaketa, elementuen tamaina eta erabiltzaile-esperientzia gailu bakoitzera egokitzea.

::: infobox
Diseinu *responsive* bat ez da soilik web-orria mugikor batean sartzea; banaketa, elementuen tamaina eta erabiltzaile-esperientzia gailu bakoitzera egokitzea baizik.
:::


## Web moldagarria eta web responsive {#web-adaptativa-frente-responsive}

Askotan sinonimo gisa erabiltzen badira ere, bi kontzeptuen artean desberdintasunak daude.

| Diseinu moldagarria (Adaptive) | Diseinu responsive |
|------------------------------|------------------|
| Webgunearen hainbat bertsio | Bertsio bakarra |
| Aurrez zehaztutako zabalerak | Diseinu fluidoa |
| Aldaketak puntu zehatzetan | Etengabeko egokitzapena |
| Mantentze-lan handiagoa | Malguagoa |

Diseinu **moldagarriak** webgune beraren hainbat bertsio sortzen ditu (adibidez, bat mugikorrerako eta beste bat mahaigaineko ordenagailurako). Diseinu **responsive**-ak egitura bakarra erabiltzen du, CSS bidez egokitzen dena.

Gaur egun, gomendatutako ikuspegia responsive da.


# Viewport {#viewport}

Web-orri bat ordenagailu batean bistaratzen denean, nabigatzaileak normalean pantaila nahiko handi bat du eskuragarri. Hala ere, web-orri bera telefono mugikor batetik bisitatzen denean, erabilgarri dagoen eremua askoz txikiagoa da.

Lehen *smartphone*ak agertu zirenean, webgune asko ez zeuden prestatuta pantaila txikietarako. Ordenagailuetarako diseinatutako web-orriak erakusten saiatzeko, nabigatzaile mugikorrek pantaila fisikoa baino nabarmen zabalagoa zen *viewport* birtuala erabiltzen zuten. Emaitza web-orri txiki-txiki bat zen, eta erabiltzaileak zoom bidez handitu behar zuen.


Nabigatzaileak gailu mugikorretan web-orriaren tamaina behar bezala interpreta dezan, ***viewport*** kontzeptua erabiltzen da. Nabigatzailearen leihoaren barruan web-orri batek duen ikusgai dagoen eremua da. Funtsezkoa da kontzeptu hori ulertzea Media Queries eta diseinu responsive-rekin lanean hasi aurretik.


## Viewport-a ez da nahitaez pantailaren bereizmenaren berdina {#viewport-resolución-pantalla}

Garrantzitsua da *viewport* eta pantailaren bereizmenaren kontzeptuak ez nahastea. Gaur egun, gailu mugikorrek ordenagailuko pantaila baten bereizmen fisiko bera izan dezakete (1920 x 1080 pixel, edo are gehiago), baina horrek ez du esan nahi web-orri batek [1080px]{.verbatim}-eko zabalera duen *viewport* bat duenik.

Gailu mugikorrek **pixel-dentsitate** desberdina erabiltzen dute (***ppi*** edo *pixels per inch*) ohiko pantailekin alderatuta, eta nabigatzaileek **viewport logiko** bat erabiltzen dute web-orriak irudikatzeko. Horregatik, CSSri buruz hitz egiten dugunean, normalean **CSS pixel**ekin lan egiten dugu, ez panelaren pixel fisikoekin.


## [meta viewport]{.verbatim} etiketa {#etiqueta-meta-viewport}

Nabigatzaile mugikorrari *viewport*-a nola erabili behar duen adierazteko, [<meta>]{.verbatim} etiketa erabiltzen da [<head>]{.verbatim} elementuaren barruan. Ohiko konfigurazioa honako hau da:

::: {.mycode size=footnotesize}
[HTML [viewport]{.verbatim}-ekin [<head>]{.verbatim} elementuan]{.title}
```html
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Mi página</title>
    </head>
    <body>
        <h1>Mi página responsive</h1>
    </body>
</html>
```
:::

Etiketa hau ia nahitaezkoa da responsive izan nahi duen edozein web-orri modernotan. Jarraian, etiketaren atributu bakoitzaren azalpena dago, nahiz eta komeni den [dokumentazioa](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/meta/name/viewport) kontsultatzea, erabil daitezkeen atributu guztiak ikusteko:

- [<meta ... >]{.verbatim}: beste etiketa batzuek irudikatu ezin dituzten metadatuak adierazten dituen [HTML etiketa](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/meta) da. Barruan hainbat atributu onartzen ditu:
  - [name="viewport"]{.verbatim}: metadatuen izena da; kasu honetan, ***viewport***-ari egiten diogula erreferentzia adierazten du.
  - [content="..."]{.verbatim}: metadatuen edukia da. Komaz bereizitako balioen zerrenda bat da, [key=value]{.verbatim} motako gako-balio bikoteak dituena. Kasu honetan, honako gako hauek definitzen dira:
    - [width=device-width]{.verbatim}: nabigatzaileari adierazten dio *viewport*-aren zabalerak gailuan erabilgarri dagoen zabalerarekin bat etorri behar duela, **CSS pixelekin** neurtuta.
    - [initial-scale=1.0]{.verbatim}: web-orriaren hasierako zoom-maila adierazten du. [0]{.verbatim} eta [100]{.verbatim} arteko balioa izan daiteke; [1]{.verbatim} balioa %100 da, hau da, **ez dago zoom gehigarririk.**


::: infobox
[meta viewport]{.verbatim} etiketa [<head>]{.verbatim} goiburuan egon behar da.
:::


::: exercisebox
[[08a](https://github.com/yuki/ejercicios/blob/main/daw/diw/08a.html)]{.solution}

Sortu HTML orri bat [meta viewport]{.verbatim} etiketarekin eta egiaztatu zure mugikorrean nola ikusten den. Ezabatu etiketa eta egiaztatu berriro.
:::




## *Viewport*-arekin lotutako unitateak {#unidades-relacionadas-viewport2}

CSSek [viewport-arekin lotutako unitateak](#unidades-relacionadas-viewport) ditu, aurretik ikusi dugun bezala. Adibide bat honako hau izango litzateke:

::: {.mycode}
[HTML con cabecera [viewport]{.verbatim}]{.title}
```css
.content {
    height: 100vh;
}
```
:::


Arau honek adierazten du elementuak *viewport*-aren altueraren %100aren baliokidea izango den altuera izango duela.


## Viewport-a eta gailuaren orientazioa {#viewport-orientación-dispositivo}

Telefono bat bi orientaziotan erabil daiteke: bertikalean eta horizontalean. *Viewport*-aren zabalera eta altuera aldatu egiten dira gailua biratzean. Horri esker, web-orri responsive-ek beren banaketa automatikoki egokitu dezakete.


## Erabiltzailearen zooma ez blokeatu {#no-bloquear-zoom}

[*Viewport* etiketaren](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/meta/name/viewport) konfigurazioaren barruan, erabiltzailearen zooma blokeatzeko aukera dago:


::: {.mycode}
[HTML con cabecera [viewport]{.verbatim}]{.title}
```css
<meta name="viewport"
      content="width=device-width, initial-scale=1.0, 
               maximum-scale=1.0, user-scalable=no"
>
```
:::

Ez da gomendagarria [user-scalable=no]{.verbatim} erabiltzea web-orri arrunt batean. Erabiltzaileari edukia handitzea eragozteak **irisgarritasunari** kalte egin diezaioke, bereziki irakurtzeko orriaren tamaina handitu behar duten pertsonei. iPhone-etan, iOS 10etik aurrera, Applek konfigurazio hori ez du aintzat hartzen.

::: warnbox
Ez da gomendagarria erabiltzailearen zooma blokeatzea.
:::



# Media Queries {#media-queries}

Web-orri responsive batek ez du bere diseinua automatikoki aldatzen. Nabigatzaileak **gailuaren ezaugarrien arabera estilo batzuk edo besteak aplikatzeko** mekanismo bat behar du. Mekanismo horri **Media Queries** deitzen zaio.

Media Queries CSSren ezaugarri bat dira, baldintzazko arauak idazteko aukera ematen duena. Horiei esker, zutabe kopurua aldatu, tipografiaren tamaina egokitu, elementuak ezkutatu edo layout bat erabat berrantola dezakegu *viewport*-aren tamaina aldatzen denean. **Responsive Web Design**-aren zutabeetako bat dira; Ethan Marcottek proposatu zuen 2010ean.


## Media Queries-en konfigurazioa {#configuración-media-queries}

Media Queries-ak estilo-bloke bat aplikatu aurretik ebaluatzen dira, eta haien sintaxia honako hau da:


:::::::::::::: {.columns columnsep=0.25cm}
::: {.column width="33%"}

::: {.mycode size=footnotesize}
[Sintaxis]{.title}
```css
@media (condición) {
  /* Reglas CSS */
}
```
:::

:::
::: {.column width="33%" }

::: {.mycode size=footnotesize}
[Adibidea]{.title}
```css
@media(max-width:768px){
/*pantallas pequeñas*/
  body {
    background: red;
  }
}
```
:::

:::
::: {.column width="33%" }

::: {.mycode size=footnotesize}
[Adibidea]{.title}
```css
@media(min-width:768px){
/*pantallas grandes*/
  body {
    background: gray;
  }
}
```
:::

:::
::::::::::::::

Baldintza adierazteko sintaxia ohikoena honako hauek erabiltzea da:

- [min-width]{.verbatim}: adierazitako tamaina **gutxienez** denean aplikatzeko.
- [max-width]{.verbatim}: adierazitako tamaina **gehienez** denean arauak aplikatzeko.


::: infobox
Media Query baten barruan dauden arauak **baldintza egia denean soilik aplikatzen dira**.
:::

Aurreko adibideak konfigurazio-fitxategi berean egon daitezke, eta web-aplikazio bererako behar adina erabil ditzakegu.


## Baldintzak konbinatzea {#combinar-condiciones}

Hainbat baldintza konbina daitezke [and]{.verbatim} erabiliz:

::: {.mycode}
[*Media Queries* kobinatu]{.title}
```css
@media (min-width: 768px) and (max-width: 1199px) {
    body {
        background: beige;
    }
}
```
:::

Arau hau **[768px]{.verbatim} eta [1199px]{.verbatim}** artean soilik aplikatuko da. Erabilgarria da tabletetarako estilo espezifikoak sortu nahi ditugunean.


## Gailuaren orientazioaren arabera {#según-orientación-dispositivo}

Media Queries-ek gailuaren orientazioa ere hauteman dezakete, hau da, [portrait]{.verbatim} moduan (bertikalean) edo [landscape]{.verbatim} moduan (horizontalean) dagoen kontuan hartuta.

::: {.mycode}
[Gailuaren orientazioa]{.title}
```css
@media (orientation: landscape) {
    body {
        background: beige;
    }
}
```
:::

Horri esker, zenbait osagai egokitu ditzakegu erabiltzaileak gailua biratzen duenean.

## Eskuragarri dauden beste ezaugarri batzuk {#otras-características-media-queries}

Zabalera gehien erabiltzen den baldintza bada ere, beste hainbat ezaugarri daude.

| Ezaugarria | Adibidea |
|---------------|----------|
| Zabalera (gutxienez)     | [min-width]{.verbatim} |
| Zabalera (gehienez)     | [max-width]{.verbatim} |
| Altuera (gehienez)     | [max-height]{.verbatim} |
| Orientazioa | [orientation]{.verbatim} |
| Inprimaketa   | [print]{.verbatim} |
| Pantaila    | [screen]{.verbatim} |

Adibidez, inprimatzeko ere web-orria alda dezakegu:


::: {.mycode}
[*Media Query* inprimatzerakoan]{.title}
```css
@media print {
    nav {
        display: none;
    }
}
```
:::

Nabigatzaileak estilo hauek **inprimaketa edo PDF bat sortzean soilik** aplikatuko ditu; horrela, ez du nabigazio-barra inprimatuko.


## Arauen ordena {#orden-reglas-media-queries}

CSSren ordenak garrantzitsua izaten jarraitzen du Media Queries erabiltzean. Bi arauek espezifikotasun bera badute, behean agertzen den eta baldintza betetzen duen araua izango da nagusi.

::: {.mycode}
[Arauen ordena]{.title}
```css
h1 { font-size: 16px; }

@media (min-width: 768px) {
    h1 {
        font-size: 32px;
    }
}
```
:::

Portaera horrek cascade-aren ohiko arauak jarraitzen ditu.


## Adibideak {#ejemplos-media-queries}

Jarraian, aurretik ikusitakoaren arabera estiloak aldatzen dituzten *media queries* batzuen adibideak ditugu.


Adibide honetan portaera honako hau da:

- Mugikorrean → [1.5rem]{.verbatim}.
- Tabletetan eta ordenagailuetan → [3rem]{.verbatim}.


::: {.mycode}
[Adibide basikoa]{.title}
```css
h1 { font-size: 1.5rem; }

@media (min-width: 768px) {
  h1 {
    font-size: 3rem;
  }
}
```
:::


Oinarrizko estiloak gailu txikienari dagozkio.

Hurrengo adibidean, **Grid** baten bistaratzea aldatzen da, pantailaren tamainaren arabera.

::: {.mycode }
[Grid-ekin adibidea]{.title}
```css
#grid {
    display: grid;
    grid-template-columns: 1fr;
    gap: 1rem;
}
@media (min-width: 768px) {
  #grid {
      grid-template-columns: repeat(3, 1fr);
      gap: 3rem;
    }
}
```
:::


Pantaila handiak dituzten gailuetan hiru zutabe egongo dira; pantaila txikietan, berriz, bakarra ikusiko da.


::: exercisebox
[[08b](https://github.com/yuki/ejercicios/blob/main/daw/diw/08b.html)]{.solution}

Sortu HTML orri bat, pantaila-tamaina desberdinetarako *media queries* desberdinak dituena. Egiaztatu funtzionatzen duela mahaigaineko nabigatzailean zooma eginez eta mugikorrarekin.
:::



# Breakpoints eta haustura-puntuak {#breakpoints-puntos-ruptura}

Aurreko atalean ikasi dugu **Media Queries**-ek baldintza jakin bat betetzen denean estiloak aplikatzeko aukera ematen dutela. Sor dakigukeen galdera honakoa da: **zein zabaleratan aldatu behar dugu diseinua?**:

**Breakpoints** edo **haustura-puntuak** interfazearen banaketa aldatzen den viewport-aren balioak dira. Horiei esker, web-orri bera berrantola daiteke telefono mugikorretan, tabletetan, ordenagailu eramangarrietan edo mahaigaineko monitoreetan esperientzia egokia eskaintzeko.

Garrantzitsua da ulertzea breakpoint batek **ez duela gailu zehatz bat adierazten**, baizik eta diseinua tamaina horretara egokitzeko Media Query desberdin bat aplikatzea erabakitzen dugun unea.

Aurretik hainbat adibide ikusi ditugu, hala nola honako hau:

::: {.mycode }
[Media Query]{.title}
```css
@media (min-width: 768px) {
  /* CSS */
}
```
:::

Kasu honetan, **768 px** da breakpoint-a, hau da, "viewport-ak 768px edo gehiago hartzen dituenean, zenbait arau aplikatu" esan nahi du.


## Ohiko breakpoint-ak {#breakpoints-habituales}

Proiektu bakoitzak balio desberdinak erabil ditzakeen arren, eta gehien komeni zaizkigunak aukeratu ditzakegun arren, badira oso hedatuta dauden haustura-puntu batzuk:

::: {.mycode size=footnotesize}
[Breakpoints. Iturria: [devsheets](https://devsheets.io/sheets/screen-sizes)]{.title}
```css
/* Standard Breakpoints */
/* Mobile First Approach */
@media (min-width: 320px)  { /* Mobile Small */ }
@media (min-width: 480px)  { /* Mobile Large */ }
@media (min-width: 576px)  { /* Mobile XL */ }
@media (min-width: 768px)  { /* Tablet */ }
@media (min-width: 1024px) { /* Desktop */ }
@media (min-width: 1200px) { /* Large Desktop */ }
@media (min-width: 1440px) { /* Extra Large */ }

/* Desktop First Approach */
@media (max-width: 1439px) { /* Below XL */ }
@media (max-width: 1199px) { /* Below Large */ }
@media (max-width: 1023px) { /* Below Desktop */ }
@media (max-width: 767px)  { /* Below Tablet */ }
@media (max-width: 479px)  { /* Below Mobile Large */ }
```
:::

Balio hauek orientagarriak dira, eta **ez dira CSSren estandarraren parte**. Proiektu bakoitzak bere diseinura hobekien egokitzen diren breakpoint-ak aukeratu behar ditu.


CSSko *frameworks*-ek ere sistema hauek erabiltzen dituzte, eta guztiek normalean aliasak erabiltzen dituzten arren, tamainak antzekoak dira. Adibidez, badago nolabaiteko aldea [Bootstrap](https://getbootstrap.com/docs/5.3/layout/breakpoints/) eta [TailwindCSS](https://v2.tailwindcss.com/docs/breakpoints/) artean:

|      | Bootstrap                     | Tailwindcss | 
|------|-------------------------------|-------------|
| sm   | [min-width: 576px]{.verbatim} | [min-width: 640px]{.verbatim} |
| md   | [min-width: 768px]{.verbatim} | [min-width: 768px]{.verbatim} |
| lg   | [min-width: 992px]{.verbatim} | [min-width: 1024px]{.verbatim} |
| xl   | [min-width: 1200px]{.verbatim} | [min-width: 1280px]{.verbatim} |
| xxl / 2xl |  [min-width: 1400px]{.verbatim} | [min-width: 1536px]{.verbatim} |

Table: {tablename=yukitblrcol colspec=X[1]X[3]X[3]}


### JavaScript bidez viewport-aren tamaina ezagutzea {#conocer-tamaño-javascript}

Responsive orri baten garapenean oso erabilgarria da jakitea **zein den nabigatzailea erabiltzen ari den viewport-aren benetako tamaina**. Media Queries-ek automatikoki estilo egokiak aplikatzen dituzten arren, dimentsio horiek ezagutzeak lagundu egiten digu breakpoint jakin batean sartzen ari garen egiaztatzen edo gure diseinuaren portaera arazten.

JavaScriptek viewport-aren zabalera eta altuera lortzeko aukera ematen du [window.innerWidth]{.verbatim} eta [window.innerHeight]{.verbatim} propietateen bidez. Propietate horiek nabigatzailearen eremu ikusgaiaren tamaina itzultzen dute **CSS pixelekin**, hau da, CSSek Media Queries-ak ebaluatzeko erabiltzen dituen unitate berberekin.

::: {.mycode}
[Pantailaren tamaina jakitea]{.title}
```javascript
console.log("Ancho:", window.innerWidth);
console.log("Alto:", window.innerHeight);
```
:::


Kode hau nabigatzailearen kontsolatik exekutatzean, leihoaren tamaina aldatzean aldatuko diren bi zenbaki ikusiko ditugu. Adibidez, leihoaren zabalera [768px]{.verbatim}-etik behera murrizten badugu, [window.innerWidth]{.verbatim} balioa ere txikiagoa izango da, eta dagozkion Media Queries-ak aplikatzen hasiko dira.

Garrantzitsua da ulertzea **viewport-a ere aldatu egiten dela mahaigaineko nabigatzaile batean zooma egiten dugunean**. Zooma %125era edo %150era handitzean, nabigatzaileak orriaren zati txikiagoa erakusten du; beraz, viewport eraginkorra txikitu egiten da eta, ondorioz, itzulitako balioak txikiagoak izango dira.

Era berean, zooma murriztean, viewport-a handitu egiten da eta lortutako balioa handiagoa izango da. Horregatik, Media Queries-ek eta JavaScriptek beti viewport eraginkorrarekin lan egiten dute, eta ez monitorearen bereizmen fisikoarekin.

Aldaketa hauek ikusteko modu oso erosoa [resize]{.verbatim} gertaera entzutea da. Gertaera hori viewport-aren tamaina aldatzen den bakoitzean aktibatzen da (leihoa tamainaz aldatzean edo, nabigatzaile askotan, zooma aldatzean).

::: {.mycode}
[Pantailaren tamaina jakitea]{.title}
```javascript
window.addEventListener("resize", () => {
    console.log(
        `Viewport: ${window.innerWidth} × ${window.innerHeight}`
    );
});
```
:::

Este script txiki hau oso erabilgarria da **garapenean zehar**, gure responsive diseinua lanean ari den dimentsioak denbora errealean ikusteko aukera ematen baitu.

::: errorbox
Garrantzitsua da kode hau produkzioan ez uztea, errendimendu-arazoak saihesteko.
:::


## Gailuetarako ez, edukirako diseinatzea {#diseño-para-contenido}

Oso ohikoa den akats bat iPhone baterako edo gailu zehatz baterako *breakpoint* bat sortzea dela pentsatzea da. Egia esan, **responsive diseinu modernoak gailu zehatzetarako lan egitea saihesten du**.

::: infobox
Responsive diseinu modernoak gailu zehatzetarako lan egitea saihesten du.
:::

Estrategia zuzena edukia behar bezala ikusten ez den unea behatzea da. Adibidez, elementu bat **720px**-etan estuegi ikusten hasten bada, hori izan daiteke breakpoint egokia, nahiz eta gailu zehatz batekin bat ez etorri. **Edukia bera izan behar da diseinu-aldaketa zehazten duena**.


## Breakpoint-ak eta garapen-tresnak {#breakpoints-herramientas-desarrollo}

Nabigatzaileek **responsive diseinu-modu bat** dute garapen-tresnen barruan. Bertatik honako hauek egin ditzakegu:

- Telefonoak eta tabletak simulatu.
- Zabalera pertsonalizatua ezarri.
- Viewport-a denbora errealean ikusi.
- Media Queries-ak noiz aktibatzen diren egiaztatu.

Responsive interfazeak garatzeko ezinbesteko tresna da, hainbat gailu fisikoki eduki beharrik gabe.

Nabigatzaileek aurrez konfiguratutako gailuak simulatzeko zerrenda bat dute, eta, horrez gain, gure gailu propioa gehi dezakegu, interesatzen zaizkigun datuekin.

::: exercisebox
[[08c](https://github.com/yuki/ejercicios/blob/main/daw/diw/08c.html)]{.solution}

Aldatu aurreko ariketa eta gehitu JavaScript funtzioa *viewport*-a denbora errealean ezagutzeko.
:::


# *Mobile First* diseinua {#diseño-mobile-first}

Urte askoan, webguneak ordenagailuak kontuan hartuta diseinatzen ziren lehenik. Mahaigaineko bertsioa amaitutakoan, garatzaileak mugikorretara egokitzen saiatzen ziren, Media Queries eta salbuespen ugari erabiliz. Ikuspegi horrek funtzionatzen zuen, baina mantentzen zailak ziren estilo-orriak eta gailu mugikorretarako gutxi optimizatutako orriak sortzen zituen.

2010etik aurrera, telefono mugikorretatik nabigatzen zuten erabiltzaileen kopurua azkar hazten hasi zen. Orri askok pantaila handietarako diseinatuta jarraitzen zuten, eta esperientzia txarra eskaintzen zuten gailu txikietan.

**[Luke Wroblewski](https://www.lukew.com/about/)** diseinatzaileak ***Mobile First*** filosofia zabaldu zuen, oso ideia sinple bat proposatuz: **muga gehien dituen gailutik (tamainari dagokionez) hastea eta erabilgarri dagoen espazioa handitu ahala funtzionalitateak gehitzea**. Ikuspegi horrek hasieratik **benetan garrantzitsua den edukia lehenestera** behartzen du. Gaur egun, *framework* eta web-garapeneko gida gehienek gomendatzen duten ikuspegia da.

Lan-sekuentzia honako hau da:

1. Mugikorrerako diseinatu.
2. Tabletara egokitu.
3. Mahaigaineko ordenagailurako hobetu.
4. Monitore handietan dagoen espazioa aprobetxatu.

CSSn, horrek esan nahi du **ohiko estiloak mugikorrarenak direla**, eta Media Queries-ek, oro har, [min-width]{.verbatim} erabiltzen dutela.


## Proiektu baten ohiko egitura {#estructura-típica-proyecto}

Mobile First-en, estiloak tamaina txikienetik handienera idazten dira.

::: {.mycode}
[*Mobile first* estruktura]{.title}
```css
/* Estilos base (móvil) */
body { margin: 0; }
/* ... */

@media (min-width: 768px) {
  /* Adaptaciones para Tablet */
}

@media (min-width: 1200px) {
  /* Adaptaciones para Escritorio */
}
```
:::

::: infobox
Kontuan izan Media Queries-ek estiloak **gehitzen** dituztela, ez dutela estilo-orri osoa ordezkatzen.
:::


## Mobile First ikuspegiaren abantailak {#ventajas-enfoque-mobile-first}

Gure web-aplikazioa diseinatzerakoan, *mobile first* ikuspegiarekin hastea lagungarria da errendimendua hobetzeko, gailu mugikorrek normalean potentzia txikiagoa eta konexio motelagoak izaten baitituzte. Lehenik haientzat diseinatzeak orri arinagoak eta azkarragoak sortzen laguntzen du.

Bestalde, espazio mugatuak benetan zer informazio den garrantzitsua eta webgunean zein lekutan egon beharko lukeen galdetzera behartzen du, baita zein diren bigarren mailako elementuak ere. Horrek interfaze garbiagoak sortzen laguntzen du.

Azkenik, mahaigaineko estiloak ezabatu beharrean, hobekuntzak gehitzen ditugu soilik, erabilgarri dagoen zabalera handitu ahala.



# *Desktop First* diseinua {#diseño-desktop-first}

**Desktop First** ikuspegia mahaigaineko bertsioa diseinatzen hasten da, eta ondoren interfazea gero eta pantaila txikiagoetara egokitzen du, [max-width]{.verbatim} duten Media Queries erabiliz. Gaur egun proiektu berrietarako normalean gomendatzen ez den aukera bada ere, oso garrantzitsua da ezagutzea, oraindik ere webgune eta ondarezko proiektu ugaritan erabiltzen baita.

Lan-sekuentzia honako hau da:

1. Ordenagailurako diseinatu.
2. Ordenagailu eramangarrira egokitu.
3. Tabletara egokitu.
4. Mugikorrera egokitu.


2000ko hamarkadan, erabiltzaileen gehiengo zabalak mahaigaineko ordenagailuetatik nabigatzen zuen. Logikoa zen diseinatzaileak **960 pixeleko** zabalerako orriak sortzen hastea eta, ondoren, gailu txikietarako egokitzapen batzuk gehitzea, telefono adimendunak agertzen hasi zirenean.

Oso ohikoa zen honako adibide hau:

::: {.mycode}
[*Desktop first* adibidea]{.title}
```css
.wrapper {
    width: 960px;
    margin: 0 auto;
}
```
:::

Telefono mugikorrak iritsi zirenean, Media Queries gehitu behar izan ziren egitura hori aldatzeko.

## Desktop First-en ohiko egitura {#estructura-típica-desktop-first}

Estilo nagusiak mahaigaineko ordenagailuari dagozkio.

::: {.mycode}
[*Desktop first* estruktura]{.title}
```css
/* Estilos base (escritorio) */
body { font-size: 18px; }

/* adaptaciones */
@media (max-width: 992px) { }
@media (max-width: 768px) { }
@media (max-width: 576px) { }
```
:::

::: infobox
Kontuan izan orain baldintzek **gehienezko zabalerak** erabiltzen dituztela.
:::


## Desktop First-en abantailak eta desabantailak {#ventajas-inconvenientes-desktop-first}

Ikuspegi hau oraindik ere erabilgarria izan daiteke kasu batzuetan.

- Barne-erabilerako aplikazioak: Aplikazio bat bulegoko ordenagailuetan soilik erabiliko bada, zentzuzkoa izan daiteke lehenik mahaigaineko ordenagailuetarako diseinatzea.
- Ondarezko proiektuak: Duela urte batzuk garatutako webgune askok filosofia hori jarraitzen dute dagoeneko. Kasu horietan, normalean praktikoagoa da egitura bera mantentzea CSS erabat berridaztea baino.

Baina **hainbat desabantaila ere baditu** web-aplikazio publiko moderno bat sortzea denean helburua:

- Arau zuzentzaile gehiago: Ohikoa da mahaigaineko estiloak "desegin" behar izatea.
- Kode gehiago: Aurreko puntuaren ondorioz, normalean CSS arau gehiago erabiltzen dira *mobile first* ikuspegian baino.



# Irudi moldagarriak eta *responsive* irudiak {#imágenes-adaptativas-responsive}

Irudiak izan ohi dira web-orri baten pisuaren ehuneko handiena hartzen duten elementuak. Diseinu responsive bat ez da zutabeak eta menuak berrantolatzea soilik: irudiak ere **gailuaren tamainara egokitzea**, haien proportzioa mantentzea eta, ahal denean, **pantaila bakoitzerako bertsiorik egokiena deskargatzea** lortu behar du.

Bi kontzeptu oso garrantzitsu bereizi behar ditugu:

- **Irudi moldagarriak**: nabigatzaileak bertsio desberdin bat deskargatzen du gailuaren arabera.
- **Irudi responsiboak**: irudi berak tamaina aldatzen du eta erabilgarri dagoen espaziora egokitzen da.

Demagun **3000 × 2000 pixeleko** argazki bat dugula:

- 390 pixeleko zabalerako telefono batean erakusten badugu, nabigatzaileak haren tamaina asko murriztu beharko du.
- Gainera, irudiak hainbat megabyte hartzen baditu, beharrezkoa baino askoz eduki gehiago deskargatuko dugu.

Arazo nagusiak hauek dira:

- Kargatzeko denbora luzeagoa.
- Datu mugikorren kontsumo handiagoa.
- Erabiltzaile-esperientzia okerragoa.
- Bilatzaileetan kokapen okerragoa.

Horregatik, irudiek responsive diseinuaren parte izan behar dute.


## Irudi *responsive*ak eta *aspect-ratio* {#imágenes-responsive}

Gure webgunean irudiak gehitzean, ohikoa da erabilgarri dagoen espaziora egokitzeko tamaina aldatzea eta proportzioa mantentzea, itxura desitxuratu ez dadin.

::: {.mycode}
[*Responsive* irudiak]{.title}
```css
img {
    max-width: 100%;
    height: auto;
}
```
:::

Arau sinple honek irudiak honako hau lortzea ahalbidetzen du:

- Inoiz ez izatea edukiontzia baino zabalagoa.
- Proportzioa automatikoki mantentzea ([height:auto]{.verbatim}ri esker).
- Erabilgarri dagoen espazioa murrizten denean, tamaina ere murriztea.

Ia edozein web-proiektutan gomendatutako jardunbidea da.

Desberdintasun txikiak daude [width: 100%]{.verbatim} eta [max-width: 100%]{.verbatim} artean:

- [width:100%]{.verbatim}: Irudiak beti edukiontziaren zabalera osoa hartzen du, nahiz eta jatorriz txikiagoa izan.
- [max-width:100%]{.verbatim}: Irudia beharrezkoa denean soilik murrizten da, baina inoiz ez da jatorrizko tamainatik gora handitzen. **Hau izan ohi da gomendatutako aukera**.


Hona hemen **[Grid](#grid)** bidez sortutako galeria baten adibidea, irudi *responsive*ekin:

:::::::::::::: {.columns}
::: {.column width="35%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```html
<section class="galeria">
  <img src="1.jpg" alt="">
  <img src="2.jpg" alt="">
  <img src="3.jpg" alt="">
</section>
```
:::

:::
::: {.column width="65%" }

::: {.mycode size=footnotesize}
[CSS]{.title}
```css
.galeria {
  display: grid;
  grid-template-columns: 
            repeat(auto-fit, minmax(220px, 1fr));
  gap: 16px;
}

.galeria img {
    width: 100%;
    height: auto;
    object-fit: cover;
}
```
:::

:::
::::::::::::::

[height:auto]{.verbatim} erabili beharrean, [aspect-ratio:auto]{.verbatim} ere erabil daiteke, proportzioa mantenduko baitu. [Propietate](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference/Properties/aspect-ratio) horrek irudiak zehaztutako *ratio* batera behartzea ahalbidetzen du, nahiz eta egokiena beti *fallback* bat gehitzea den: [aspect-ratio: auto 16/9]{.verbatim}: 


::: {.mycode}
[CSS]{.title}
```css
.galeria img {
    width: 100%;
    aspect-ratio: auto 16/9;
}
```
:::


## Irudi moldagarriak [srcset]{.verbatim}-ekin {#imagenes-srcset}

Orain arte beti irudi bera deskargatzen genuen, baina HTMLk baliabide beraren hainbat bertsio eskaintzeko aukera ematen du [srcset]{.verbatim} bidez. Horrela, nabigatzaileak automatikoki aukeratzen du irudirik egokiena, honako hauen arabera:

- Viewport-aren zabalera.
- Gailuaren bereizmena.
- Pixelen dentsitatea.

Horrek datu-kontsumoa murrizten du eta errendimendua hobetzen du.

::: {.mycode}
[HTML]{.title}
```html
<img alt="Paisaje"
    src="foto-800.jpg"
    srcset="
        foto-400.jpg 400w,
        foto-800.jpg 800w,
        foto-1200.jpg 1200w
    "
    sizes="
        (max-width: 768px) 100vw,
        50vw
    ">
```
:::



[sizes]{.verbatim} atributua [srcset]{.verbatim}-ekin konbinatzen da, eta horrela honako hau lortzen dugu:

- 768 px baino txikiagoak diren pantailetan, irudiak viewport-aren %100 hartuko du.
- Pantaila handiagoetan, gutxi gorabehera %50 hartuko du.

Informazio horrekin, nabigatzaileak bertsiorik eraginkorrena hauta dezake deskargatu aurretik.

### [<picture>]{.verbatim} elementua {#elemento-picture}

Batzuetan ez da nahikoa bereizmena aldatzea: **beste argazki bat** erakutsi nahi dugu gailuaren arabera.

Horretarako, [[<picture>]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/picture) elementua dago.

::: {.mycode}
[Irudi desberdinak tamainaren arabera]{.title}
```html
<picture>
    <source
        media="(max-width: 768px)"
        srcset="cabecera-mobile.jpg"
    >
    <source
        media="(min-width: 769px)"
        srcset="cabecera-desktop.jpg"
    >
    <img src="cabecera-desktop.jpg" alt="Cabecera">
</picture>
```
:::

Nabigatzaileak baldintza betetzen duen lehen irudia aukeratuko du. Metodo hau oso erabilgarria da argazkiaren enkoadraketa mugikorraren eta mahaigainekoaren artean aldatzen denean.


### Atzeko planoko irudiak {#imágenes-fondo}

CSS bidez erabilitako irudiak ere responsive izan daitezke.

::: {.mycode}
[Irudi desberdinak tamainaren arabera]{.title}
```css
.hero {
    background-image: url("hero-mobile.jpg");
}
@media (min-width: 768px) {
    .hero {
        background-image: url("hero-desktop.jpg");
    }
}
```
:::

Horrela, gailu bakoitzak irudi desberdin bat deskargatzen du. Oso ohikoa da tamaina handiko goiburuetan teknika hau erabiltzea.



::: exercisebox
[[08d](https://github.com/yuki/ejercicios/blob/main/daw/diw/08d.html)]{.solution}

Egiaztatu tamaina desberdinetarako irudi desberdinak erabiltzearen funtzionamendua.
:::


## Irudi-formatu modernoak {#formatos-modernos}

Responsive diseinuaz gain, komeni da formatu eraginkorrak ere erabiltzea, konpresio-algoritmoa hobetzen baitute eta fitxategiek leku gutxiago har dezaketelako:

| Formatua | Gomendatutako erabilera |
|----------|-------------------------|
| JPEG | Argazkiak |
| PNG | Gardentasunak |
| SVG | Ikonoak eta logotipoak |
| WebP | Argazki optimizatuak |
| AVIF | Gehienezko konpresioa |

Gaur egun, **WebP** eta **AVIF** formatuak kalitatearen eta fitxategi-tamainaren arteko erlazio bikaina eskaintzen dute; beraz, oso gomendagarriak dira proiektu modernoetarako.



# Tipografia moldagarria {#tipografías-aadaptables}

Responsive diseinuaren helburu nagusietako bat edukia edozein gailutan **irakurgarria** dela bermatzea da. Ez da nahikoa zutabeak berrantolatzea edo irudien tamaina aldatzea: tipografiak ere erabilgarri dagoen espaziora egokitu behar du.

Tipografia moldagarriak testuaren tamaina progresiboki egokitzen du viewport-aren tamainaren arabera, eta horrela letrak mugikor batean txikiegiak izatea edo bereizmen handiko monitore batean handiegia izatea saihesten da. Horretarako, CSSek **[unitate erlatiboak](#unidades-relativas)** eta [clamp()]{.verbatim} bezalako funtzioak eskaintzen ditu.

Oraindik ere ohikoa da honelako estiloak aurkitzea:

::: {.mycode}
[Tipografia estatika]{.title}
```css
h1 { font-size: 48px; }

p { font-size: 16px; }
```
:::

Eta funtzionatzen badu ere, hainbat desabantaila ditu:

- Mugikor batean, 48 px-ko izenburu batek lerro gehiegi har ditzake.
- 4K monitore batean, 16 px-ko testua txikiegia izan daiteke.
- Tamaina bakoitza egokitzeko Media Queries ugari sortzera behartzen du.

Horregatik, responsive diseinuan **unitate erlatiboak** eta tamaina fluidoak hobesten dira.


## Tipografia-eskala {#escala-tipográfica}

Aurretik [unitate erlatibo [rem]{.verbatim}](#unidad-relativa-rem)-ari buruz hitz egitean ikusi dugun arren, komeni da gogoratzea **tipografia-eskala** koherentea erabiltzea gomendatzen dela.

::: {.mycode}
[Tipografia erlatiboa]{.title}
```css
h1    { font-size: 2.5rem; }
h2    { font-size: 2rem; }
h3    { font-size: 1.5rem; }
p     { font-size: 1rem; }
small { font-size: 0.875rem; }
```
:::


Hierarkia horrek irakurketa errazten du eta webgunearen ikus-koherentzia mantentzen du. Gainera, **nabigatzailearen lehenetsitako tamaina kontuan hartzen du, erabiltzaileak alda dezakeena**. 

## Tipografia Media Queries-ekin egokitzea {#adaptar-tipografía-media-queries}

Orain tipografia responsive bihurtzea baino ez zaigu geratzen, Media Queries erabiliz interesatzen zaigun tamainara egokitzeko. Aurreko adibidea kontuan hartuta:

::: {.mycode}
[*Media Queries* gehitzen]{.title}
```css
@media (min-width: 768px) {
    h1 { font-size: 3.5rem; }
}
```
:::

### *Viewport*-aren unitateak {#unidades-viewport}

CSSek testuaren tamaina [viewport-aren zabalerarekin](#unidades-relacionadas-viewport) erlazionatzeko aukera ere ematen du [vw]{.verbatim} unitatearen bidez.

::: {.mycode}
[Tipografiak *viewport*-aren arabera]{.title}
```css
h1 { font-size: 6vw; }
```
:::

Si viewport-ak 1000px neurtzen baditu:

- [1vw]{.verbatim} = 10 px
- [6vw]{.verbatim} = 60 px

Viewport-ak 400px neurtzen baditu:

- [1vw]{.verbatim} = 4 px
- [6vw]{.verbatim} = 24 px

Leihoa aldatzean, testuaren tamaina automatikoki aldatzen da. Arazoa da [vw]{.verbatim} erabiltzean monitore oso handi batean izenburua izugarri handia bihur daitekeela, eta mugikor oso txiki batean, berriz, txikiegia izan daitekeela.

Horregatik, normalean `vw` gutxieneko eta gehienezko mugekin konbinatzen da [clamp()]{.verbatim} bidez.


## [clamp()]{.verbatim} erabiltzea {#uso-clamp}

Aurretik [[clamp()]{.verbatim}](#clamp) funtzioa ikusi dugu, baina orain aurkitzen diogu benetako balio erantsia, [vw]{.verbatim} erabiltzeak sortzen duen arazoa konponduko baitigu. Gaur egun, tipografia fluidoa sortzeko gomendatzen den teknika da.

::: {.mycode}
[Tipografia erlatiboa [clamp()]{.verbatim}-ekin]{.title}
```css
h1 { font-size: clamp(2rem, 5vw, 4rem); }
```
:::

Aurreko arauak tipografiak honako hau egitea ahalbidetzen du:

- Inoiz ez izatea **2 rem** baino txikiagoa.
- **5vw** erabiliz hazten saiatzea.
- Inoiz ez gainditzea **4 rem**.

Nabigatzaileak automatikoki kalkulatzen du balio egokia.

::: infobox
[clamp()]{.verbatim} behar bezala erabiltzen badugu, tipografiarako Media Queries-ak sortzea saihesten dugu.
:::


## Kontuan hartu beharreko beste alderdi batzuk {#otros-aspectos-tipografías}

Web-orria egokitzerakoan kontuan hartu beharreko tipografiarekin lotutako beste alderdi batzuk ere badaude, besteak beste:

- **Lerroaren altuera**: Irakurgarritasuna ez dago letraren tamainaren mende soilik. Lerroaren altuera ([line-height]{.verbatim}) ere funtsezkoa da.
- **Lerroaren luzera**: Gehiegi zabalak diren paragrafoak zailak dira irakurtzeko; horregatik, komeni da haien zabalera [max-width]{.verbatim}-ekin mugatzea. **Lerro bakoitzeko 60–75 karaktereko zabalera** optimotzat jo ohi da testu luzeetarako. **Lerro bakoitzeko 70–80 karaktereko zabalera** optimotzat jo ohi da testu luzeetarako.
- **Paragrafoen arteko tartea**: Lerroarteaz gain, komeni da paragrafoak ikusmenez bereiztea. Horretarako, [p {margin-bottom:1rem;}]{.verbatim} erabil daiteke, eta horrela tartea gainerako tipografiarekin proportzionalki handitzea lortzen da.



# Edukiontzi fluidoak {#contenedores-fluidos}

Responsive diseinuaren oinarrizko printzipioetako bat elementuek beharrezkoa ez denean tamaina finkorik izan ez dezaten saihestea da. **960px** edo **1200px**-eko zabalera duten kutxak diseinatu beharrean, edukiontzi modernoek erabilgarri dagoen espaziora egokitzen dute beren tamaina, ehunekoak, unitate erlatiboak eta gehienezko mugak erabiliz.

**Edukiontzi fluidoa** viewport-arekin batera zabaldu eta txikitzen den elementua da, eta, aldi berean, pantaila handietan irakurketa erosoa mantentzen du. Teknika hau ia *framework* moderno guztietan erabiltzen da, hala nola [Bootstrap](https://getbootstrap.com/), [Tailwind CSS](https://tailwindcss.com/) edo [Bulma](https://bulma.io/).


## Edukiontzi fluidoa [max-width]{.verbatim}-ekin batera {#contenedor-fluido-max-width}

Edukiontziak sortzeko moduak bilakaera hau izan du:

:::::::::::::: {.columns columnsep=0.25cm}
::: {.column width="33%"}

::: {.mycode size=footnotesize}
[Zabalera finkoa]{.title}
```css
.container {
  width: 960px;
  margin: 0 auto;
}
```
:::

:::
::: {.column width="33%" }

::: {.mycode size=footnotesize}
[Fluido]{.title}
```css
.container {
  width: 100%;
}
```
:::

:::
::: {.column width="33%" }

::: {.mycode size=footnotesize}
[[max-width]{.verbatim} erabiltzen]{.title}
```css
.container {
  width: 100%;
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 1rem;
}
```
:::

:::
::::::::::::::

- **Zabalera finkoa**: Diseinu honek behar bezala funtzionatzen zuen garai hartako monitoreetan, baina hainbat desabantaila zituen:
  - Mugikorretan desplazamendu horizontala agertzen zen.
  - Pantaila txikietan edukia ez zen sartzen.
  - Diseinua zuzentzeko Media Queries ugari sortu behar ziren.
- **Ehunekoen erabilera**: Orain edukiontziak erabilgarri dagoen zabalera osoa hartzen du beti. Hala ere, tamaina handiko monitore batean paragrafoak gehiegi luzeak izan daitezke.
- **[max-width]{.verbatim} erabiltzea**: Mugikor batean zabalera osoa hartuko du, ordenagailu eramangarri batean progresiboki handituko da eta oso pantaila zabaletan (esaterako, *ultra-wide* motakoetan) ez ditu inoiz **1200 px** gaindituko.
  - [margin]{.verbatim} erabiltzeak edukia zentratzen laguntzen du.
  - [padding]{.verbatim}-ekin testua gailuaren ertzera itsatsita ez egotea lortzen dugu.


## Edukiontzia hobetu {#mejorando-contenedor}

Aurretik sortutako edukiontzi fluidoa hobetu dezakegu, arau gutxiago erabiliz baina portaera mantenduz:

::: {.mycode }
[Edukiontzia hobetzen]{.title}
```css
.container {
    width: min(100%, 1200px);
    margin-inline: auto;
    padding-inline: 1rem;
}
```
:::

Ezaugarri berriak:

- [min()]{.verbatim}-ek [100%]{.verbatim} eta [1200px]{.verbatim} balioen artean txikiena aukeratzen du.
- [margin-inline]{.verbatim}-ek [margin-left]{.verbatim} eta [margin-right]{.verbatim} ordezkatzen ditu.
- [padding-inline]{.verbatim}-ek betegarri horizontala aplikatzen du, testuaren norabidea errespetatuz.



