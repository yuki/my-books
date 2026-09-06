
# Sarrera {#introducción-eventos}

Orain arte DOMeko elementuetara sartzen eta JavaScript bidez aldatzen ikasi dugu. Hala ere, web-orri bat oraindik ez da interaktiboa, ohikoa baita erabiltzaileak egindako ekintzei erantzutea:

- Botoi batean sakatzea.
- Testu-koadro batean idaztea.
- Aukera bat hautatzea.
- Sagua mugitzea.
- Tekla bat sakatzea.
- Elementu bat arrastatzea.

Ekintza horiei **gertaera** deitzen zaie. Horiei esker, JavaScript-ek kodea ekintza jakin bat gertatzen den unean bertan exekuta dezake. Gertaerak honako hauek eragin ditzakete:

- Erabiltzaileak.
- Nabigatzaileak.
- HTML dokumentuak berak.

Existitzen diren gertaera guztien artean ([elementuaren](https://developer.mozilla.org/en-US/docs/Web/API/Element#events), [document](https://developer.mozilla.org/en-US/docs/Web/API/Document#events), ...) honako hauek nabarmendu ditzakegu, erabilienetakoak baitira:

| Gertaera | Ekintza |
|---------|--------|
| [click]{.verbatim} | Erabiltzaileak elementu batean sakatzen du. |
| [dblclick]{.verbatim} | Klik bikoitza. |
| [input]{.verbatim} | Testu-eremu baten edukia aldatzen da. |
| [change]{.verbatim} | Inprimaki bateko aldaketa amaitzen da. |
| [submit]{.verbatim} | Inprimaki bat bidaltzen da. |
| [keydown]{.verbatim} | Tekla bat sakatzen da. |
| [keyup]{.verbatim} | Tekla bat askatzen da. |
| [mouseenter]{.verbatim} | Sagua elementu batean sartzen da. |
| [mouseleave]{.verbatim} | Sagua elementutik ateratzen da. |
| [load]{.verbatim} | Orria kargatzen amaitzen da. |


## Gertaerek gidatutako programazioa {#programación-dirigida-eventos}

Web-aplikazio modernoek **gertaerek gidatutako programazioa** izeneko eredu baten bidez funtzionatzen dute. Instrukzioak bata bestearen atzetik exekutatu eta programa amaitu arte itxaron beharrean, JavaScript-ek gertaeraren bat gertatu zain egoten da.

Gertaera gertatzen denean, hari lotutako kodea exekutatzen du eta, ondoren, hurrengo gertaeraren zain geratzen da berriro. Portaera horri esker, orriak aktibo eta interaktibo iraun dezake erabiltzaileak erabiltzen duen bitartean.

Egia esan, ez da JavaScript erabiltzailearen ekintzak zuzenean detektatzen dituena; nabigatzailea da gertatzen dena etengabe behatzen duena. Gertaera bat detektatzen duenean, JavaScript-en exekuzio-motorrari jakinarazten dio dagokion funtzioa exekuta dezan.

<!-- De hecho, podemos hacer que el navegador deje de detectar ciertos eventos, ideal para debuggear:
https://devtoolstips.org/tips/en/disable-event-listeners/

- En **Chrome**, en la pestaña Elements, a la derecha hay un apartado "Event Listeners"
- En **Firefox**, TODO: poner dónde está 
-->


# Erregistratu gertaerak: [addEventListener()]{.verbatim}  {#registrar-evento}

JavaScript-ek gertaera bati erantzun diezaion, beharrezkoa da gertaera hori erregistratzea. Gaur egun, **gomendatutako modua [[addEventListener()]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/API/EventTarget/addEventListener) metodoa erabiltzea da** (2015etik dago erabilgarri). Metodo horrek edozein gertaerari funtzio bat lotzeko aukera ematen du; beraz, gutxienez bi parametro nagusi jasotzen ditu.

- Gertaeraren izena.
- Gertaera gertatzen denean exekutatuko den funtzioa.

:::::::::::::: {.columns }
::: {.column width="32%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```html
<button id="boton">
    Pulsar
</button>

<ul id="lista"></ul>
```
:::

:::
::: {.column width="63%" }

::: {.mycode size=footnotesize}
[JavaScript]{.title}
```javascript
const boton = document.querySelector("#boton");
boton.addEventListener(
    "click",
    function () {
        console.log("Botón pulsado.");
        const e = document.createElement("li");
        e.textContent = "elemento";
        const l = document.getElementById("lista");
        l.append(e);
    }
);
```
:::

:::
::::::::::::::

Adibide honekin, gertaera bat sortzea eta aurretik ikusitako elementuen sorrera lotu ditugu. Botoian sakatzean, zerrendari gehituko zaion elementu bat sortzen da, eta, gainera, mezu bat erakusten da kontsolan. [Dokumentazioan](https://developer.mozilla.org/en-US/docs/Web/API/EventTarget/addEventListener) [addEventListener()]{.verbatim}-ek dituen aukera guztiak ikus daitezke.

Kasu honetan, funtzioa (modu klasikoan) gertaeraren barruan sortu dugu, baina gezi-funtzio bat erabil dezakegu edo lehendik dagoen funtzio bati deitu:

:::::::::::::: {.columns }
::: {.column width="55%"}

::: {.mycode size=footnotesize}
[Gezi funtzioa]{.title}
```javascript
boton.addEventListener(
    "click",
    () => {
        console.log("Botón pulsado.");
    }
);
```
:::

:::
::: {.column width="45%" }

::: {.mycode size=footnotesize}
[Funtzioari deitu]{.title}
```javascript
boton.addEventListener(
    "click",
    nuevoElemento
);
```
:::

:::
::::::::::::::

::: exercisebox
[[16a](https://github.com/yuki/ejercicios/blob/main/daw/dec/16a.html)]{.solution}

Erabili aurreko adibidea eta sortu [click]{.verbatim} gertaerak abiaraziko dituzten 3 botoi: bata funtzio oso batekin, bestea gezi-funtzio batekin eta hirugarrena lehendik dagoen funtzio bati deituz.
:::


## Elementu bat hainbat gertaerarekin {#elemento-varios-eventos}

Elementu berak hainbat gertaerari erantzun diezaioke.

::: mycode
[Elementu hainbat gertaerarekin]{.title}
```javascript
boton.addEventListener(
    "mouseenter",
    () => { console.log("Ratón encima.");}
);

boton.addEventListener(
    "mouseleave",
    () => { console.log("Ratón sale del botón.");}
);
```
:::



## Gertaera bererako hainbat funtzio {#mismo-evento-varias-funciones}

Zenbait egoeratan gertaera bererako bi funtzio edo gehiago izan nahi ditugu; beraz, hainbat funtzio erregistra ditzakegu gertaera bererako.

::: mycode
[Funtzio desberdin gertaera berdin batekin]{.title}
```javascript
boton.addEventListener(
    "click",
    () => console.log("Primera")
);

boton.addEventListener(
    "click",
    () => console.log("Segunda")
);
```
:::

Botoian klik egitean, bi funtzioak exekutatuko dira.


## Zergatik erabili [addEventListener()]{.verbatim}? {#por-qué-utilizar-addeventlistener}

HTML eta JavaScript bidez gertaerak sortzeko, honako modu hauek ere erabil daitezke:

:::::::::::::: {.columns }
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[HTMLn *inline* funtzioa]{.title}
```HTML
<!-- añadir función en HTML-->
<button onclick="saludar()">
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[Gehitu gertaera elementuari]{.title}
```javascript
// añadir evento al elemento
boton.onclick = function (){
    console.log("Hola");
}
boton.onclick = function (){
    console.log("Adios");
}
```
:::

:::
::::::::::::::

::: questionbox
Zer gertatzen da botoian sakatzean? Hiru funtzioetatik zein exekutatzen da?
:::

::: exercisebox
[[16b](https://github.com/yuki/ejercicios/blob/main/daw/dec/16b.html)]{.solution}

Aurreko ariketa abiapuntutzat hartuta:

- Gehitu [mouseenter]{.verbatim} eta [mouseleave]{.verbatim} gertaerak button1 botoiari.
- Gehitu HTMLko [onclick]{.verbatim} funtzio *inline* bat button1 botoiari.
- Gehitu bi [onclick]{.verbatim} gertaera button1 botoiaren elementuari JavaScript bidez.

Zer exekutatzen da azkenean button1 botoian klik egitean?
:::

Ariketa eginda egiaztatu ahal izan den bezala, [addEventListener()]{.verbatim} erabiltzeak hainbat abantaila ditu metodo "zaharren" aldean:

- HTMLa eta JavaScript bereizteak kodearen mantentzea errazten du.
- **Gertaera bererako** hainbat kudeatzaile erregistratzeko aukera ematen du.
  - *Inline* metodoak funtzio bakarra gehitzeko aukera ematen du.
  - Elementu bati gertaera bat gehitzean, aurretik idatzitako kodea gainidazten ez dela ziurtatzen dugu.
- [addEventListener()]{.verbatim}-ek parametro gehiago gehitzeko aukera ematen du, gertaeraren hedapena kontrolatzeko.

::: infobox
Beti [addEventListener()]{.verbatim} erabiltzea gomendatzen da.
:::


## Gertaerak [removeEventListener()]{.verbatim} bidez ezabatzea {#eliominar-eventos}

Orain arte funtzio bat gertaera bati lotzen ikasi dugu, baina zenbait egoeratan **gertaera bat ezabatzea** ere beharrezkoa izan daiteke, exekutatzen jarrai ez dezan. Horretarako, JavaScript-ek [removeEventListener()]{.verbatim} metodoa eskaintzen du.

Gertaera bat ezabatzea erabilgarria da, besteak beste, honako egoera hauetan:

- Ekintza bat hainbat aldiz exekuta dadin saihestea.
- Jada erabiltzen ez diren elementuetako gertaerak ezabatzea.
- Aplikazio konplexuen errendimendua hobetzea.

Ondorengo kodeak adibide gisa balio du: **Gertaera desaktibatu** botoian sakatzean, botoi nagusiak [click]{.verbatim} gertaerari erantzuteari utziko dio.

:::::::::::::: {.columns }
::: {.column width="31%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```HTML
<button id="boton">
    Pulsar
</button>

<button id="quitar">
    Quitar evento
</button>
```
:::

:::
::: {.column width="64%" }

::: {.mycode size=footnotesize}
[Gertaera kendu]{.title}
```javascript
const boton = document.querySelector("#boton");
const desactivar = document.querySelector("#quitar");

function saludar() {
    console.log("Hola");
}

boton.addEventListener("click", saludar);

desactivar.addEventListener("click", () => {
    boton.removeEventListener("click", saludar);
});
```
:::

:::
::::::::::::::


[removeEventListener()]{.verbatim} erabiltzeak lehendik dagoen funtzio baten erreferentzia adierazten denean baino ez du funtzionatzen; beraz, ez luke balio funtzio *inline* batekin edo gezi-funtzio batekin.

::: exercisebox
[[16c](https://github.com/yuki/ejercicios/blob/main/daw/dec/16c.html)]{.solution}

Erabili [removeEventListener()]{.verbatim} aurretik sortutako gertaera bat ezabatzeko.
:::

<!-- 
TODO: añadir abortsignal para eliminación automática con el options:
https://developer.mozilla.org/en-US/docs/Web/API/EventTarget/addEventListener#examples
https://developer.mozilla.org/en-US/docs/Web/API/AbortController
 -->

## Funtzioaren aukerak {#opciones-función}

Ikusitako parametroez gain, gertaera-mota eta funtzioa, [addEventListener()]{.verbatim}-ek [aukerako parametroak](https://developer.mozilla.org/en-US/docs/Web/API/EventTarget/addEventListener#options) jaso ditzake. Parametro horiek honela bereizten dira:

- [options]{.verbatim}: *event listener*-aren ezaugarriak zehazten dituen objektua. Eskuragarri dauden aukeren artean honako hauek daude:
  - [once]{.verbatim}: balio boolearra; [true]{.verbatim} bada, automatikoki ezabatzen da deitu ondoren. Aurretik ikusitako [removeEventListener()]{.verbatim} erabiltzeko alternatiba da.
  - [signal]{.verbatim}: seinale bat lotzeko aukera ematen du.


# [Event]{.verbatim} objektua {#objeto-event}

Gertaera bat gertatzen denean, nabigatzaileak automatikoki objektu bat sortzen du, gertaerarekin lotutako informazio guztia duena. Objektu horri **[[Event]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/API/Event)** deitzen zaio. JavaScript-ek automatikoki pasa diezaioke argumentu gisa gertaera kudeatzen duen funtzioari. Funtzioari pasatzen zaion aldagaiaren izena normalean "[event]{.verbatim}" edo "[e]{.verbatim}" izaten da, laburtzeko.

:::::::::::::: {.columns }
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[Gertaeraren data ikusi]{.title}
```javascript
boton.addEventListener(
    "click",
    (event) => {
        console.log(event);
    }
);
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[Gertaeraren data ikusi]{.title}
```javascript
boton.addEventListener(
    "click",
    (e) => {
        console.log(e);
    }
);
```
:::

:::
::::::::::::::

Erabiltzaileak klik egiten duen bakoitzean, nabigatzaileak informazio ugari duen objektu bat erakutsiko du.

## [Event]{.verbatim}-en propietateak {#atributos-event}

[Event]{.verbatim} objektuak dozenaka propietate eta metodo ditu, baina praktikan arazo jakin bat konpontzeko beharrezkoak direnak baino ez dira erabiltzen. Adibide batzuk honako atributu hauek dira:

- [type]{.verbatim}: gertatu den gertaera-mota adierazten du.
- [target]{.verbatim}: gertaera sortu duen elementua.
- [currentTarget]{.verbatim}: [addEventListener()]{.verbatim} erregistratuta duen elementua adierazten du. Aurreko atributuarekin bat etor daitekeen arren, ez da beti horrela izaten, [target]{.verbatim} gertaera erregistratuta duen elementuaren seme-alaba izan baitaiteke.
- [clientX]{.verbatim} eta [clientY]{.verbatim}: saguaren koordenatuak.
- [key]{.verbatim} eta [code]{.verbatim}: sortutako tekla eta teklatuaren tekla fisikoa adierazten dituzte.



## [Event]{.verbatim}-en oinarritutako interfazeak {#interfaces-basadas} 

Gertaera guztiek [Event]{.verbatim} objektu bat sortzen badute ere, hainbat [interfaze espezializatu](https://developer.mozilla.org/en-US/docs/Web/API/Event\#interfaces_based_on_event) daude. Horietako batzuk:

- [MouseEvent](https://developer.mozilla.org/en-US/docs/Web/API/MouseEvent): dokumentazioak dioen bezala, erabiltzaileak "seinalatze-gailu batekin" (sagua, adibidez) elkarreragiten duenean gertatzen diren gertaerak.
- [KeyboardEvent](https://developer.mozilla.org/en-US/docs/Web/API/KeyboardEvent): teklatuarekiko elkarreragin-gertaerak.
- [SubmitEvent](https://developer.mozilla.org/en-US/docs/Web/API/SubmitEvent): gertaera hau inprimaki baten [submit]{.verbatim} ekintza deitzen denean aktibatzen da.
- [InputEvent](https://developer.mozilla.org/en-US/docs/Web/API/InputEvent): edita daitezkeen edukietan gertatzen diren aldaketekin lan egiten duten gertaerak.
- [FocusEvent](https://developer.mozilla.org/en-US/docs/Web/API/FocusEvent): "fokuarekin" lotutako gertaerak.
- [TouchEvent](https://developer.mozilla.org/en-US/docs/Web/API/TouchEvent): ukipen-pantailetarako edo *trackpad*-etarako.
- [DragEvent](https://developer.mozilla.org/en-US/docs/Web/API/DragEvent): *drag & drop* elkarreragina adierazten duten gertaerak.

- [GamepadEvent](https://developer.mozilla.org/en-US/docs/Web/API/GamepadEvent): joko-kontrolagailuen APIrako interfazea.


# Gertaeren adibideak {#ejemplos-de-eventos}

Jarraian, ohiko moduan erabiltzen diren hainbat gertaeren adibide ikusiko ditugu.


## Saguaren gertaerak {#eventos-ratón}

Orain arte ikusitako adibide guztiek [click]{.verbatim} gertaera hartu dute kontuan. Saguari dagokio eta *[MouseEvent](https://developer.mozilla.org/en-US/docs/Web/API/MouseEvent)* bat sortzen du. Jarraian, adibide berri bat ikusiko dugu, [Event]{.verbatim}-en propietateak erabiliz:

:::::::::::::: {.columns }
::: {.column width="30%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```html
<button>Rojo</button>

<button>Verde</button>

<button>Azul</button>
```
:::

:::
::: {.column width="65%" }

::: {.mycode size=footnotesize}
[Elementuari gertaera gehitu]{.title}
```javascript
const botones = document.querySelectorAll("button");

for (const boton of botones) {
    boton.addEventListener("click", (e) => {
        console.log(e.target.textContent);
        console.log(`X,Y: ${e.clientX},${e.clientY}`);
    });
}
```
:::

:::
::::::::::::::

<!-- FIXME: intentar quitar eso -->
`\clearpage`{=latex}

::: exercisebox
[[16d](https://github.com/yuki/ejercicios/blob/main/daw/dec/16d.html)]{.solution}

- Sortu hiru botoi [Event]{.verbatim} objektuaren informazioa lortzeko gertaerekin.
- Sortu [div]{.verbatim} elementu bat gertaera batekin. [div]{.verbatim} horrek, aldi berean, beste bi [div]{.verbatim} elementu izan behar ditu barruan. Egiaztatu [target]{.verbatim} eta [currentTarget]{.verbatim} arteko aldea.
:::


## Teklatuaren gertaerak {#eventos-teclado}

Erabiltzaileak tekla bat sakatzen duenean, [KeyboardEvent](https://developer.mozilla.org/en-US/docs/Web/API/KeyboardEvent) objektu bat sortzen da. Gertaera bat sor dezakegu [document]{.verbatim}-en, *keylogger* gisa funtziona dezan:

::: {.mycode size=footnotesize}
[Teklatuaren gertaerak]{.title}
```javascript
document.addEventListener("keydown", (e) => {
    console.log(`${e.key} y ${e.code}`);
});
```
:::

::: exercisebox
[[16e](https://github.com/yuki/ejercicios/blob/main/daw/dec/16e.html)]{.solution}

Sortu Konami kodea (https://en.wikipedia.org/wiki/Konami_Code) sartzean alerta bat sortzen duen web-orri bat.
:::


## Sarrerako gertaerak {#eventos-entrada}

Inprimakietako [sarrera](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/input) elementuek ([<input>]{.verbatim}) gertaera espezifikoak sortzen dituzte editatzen direnean edo fokua lortzen dutenean.

:::::::::::::: {.columns }
::: {.column width="35%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```html
<form id="form">
    <input id="nombre">
</form>
<pre id="output"></pre>
```
:::

:::
::: {.column width="65%" }

::: {.mycode size=footnotesize}
[Sarrerako gertaerak]{.title}
```javascript
const form = document.querySelector("#form");
const nombre = document.querySelector("#nombre");
form.addEventListener("input", (e) => {
    console.log(e.target.value);
});

nombre.addEventListener("focus", (e) => {
    console.log(e.target.value);
});
```
:::

:::
::::::::::::::

Erabiltzaileak letra bat idazten duen bakoitzean, testu-koadroaren uneko edukia agertuko da, eta baita testuak fokua jasotzen duenean ere.

::: exercisebox
[[16f](https://github.com/yuki/ejercicios/blob/main/daw/dec/16f.html)]{.solution}

Sortu [input]{.verbatim}, [range]{.verbatim} eta [textarea]{.verbatim} bat dituen inprimaki bat. Inprimakiak fokua nork duen eta aldaketa bat egitean duen balioa logeatu behar ditu.
:::




## Inprimakiaren/bidalketaren gertaerak {#eventos-envío}

Inprimakiek gertaera bat ere sortzen dute bidaltzen saiatzen direnean, [submit]{.verbatim} gertaera gertatzean.

::: mycode
[Añadir evento al formulario]{.title}
```javascript
const formulario = document.querySelector("form");

formulario.addEventListener("submit", (evento) => {
    console.log("Formulario enviado");
});
```
:::



# Portaera lehenetsia saihestu {#evitar-comportamiento-predeterminado}

Elementu batzuek portaera lehenetsi bat dute: esteka batek beste orri bat irekitzea edo inprimaki bat zerbitzarira bidaltzea, adibidez. Batzuetan interesgarria da portaera hori saihestea. Horretarako, [preventDefault()]{.verbatim} funtzioa dugu.

::: mycode
[Portaera lehenetsia saihestu]{.title}
```javascript
formulario.addEventListener("submit", (evento) => {
    evento.preventDefault();
    console.log("Envío cancelado.");
});
```
:::

# Gertaeraren hedapena gelditu {#parar-propagación}

Gertaerak DOM zuhaitzean behetik gora hedatzen dira. Edukiontzi batek beste elementu bat duenean barruan eta biek gertaerak entzuten dituztenean, elementu barrukoenean gertaera bat abiaraztean, elementu hori duen edukiontziak ere jasoko du gertaera. Hedapen hori geldiarazteko, [stopPropagation()]{.verbatim} funtzioa dago.

::: mycode
[Gertaeraren hedapena gelditu]{.title}
```javascript
formulario.addEventListener("submit", (evento) => {
    evento.stopPropagation();
});
```
:::

::: exercisebox
[[16g](https://github.com/yuki/ejercicios/blob/main/daw/dec/16g.html)]{.solution}

- Sortu [div]{.verbatim} bat, eta haren barruan beste [div]{.verbatim} bat. Biek [click]{.verbatim} gertaera jaso dezakete.
- Erabili [checkbox]{.verbatim} bat gertaeraren hedapena gelditu nahi duzun kontrolatzeko.
- Egin klik bi egoeretan: zer gertatzen da?
:::

