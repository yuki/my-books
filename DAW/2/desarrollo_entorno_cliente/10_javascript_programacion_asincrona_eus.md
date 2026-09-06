
# Programazio asinkronoa {#programación-asíncrona}

Orain arte garatu ditugun programa guztiek ezaugarri komun bat izan dute: instrukzioak bata bestearen atzetik exekutatzen dira. Hala ere, aplikazio askok denbora bat behar izan dezaketen zereginak egin behar dituzte:

- Zerbitzari batetik informazioa deskargatzea.
- Erabiltzaileak botoi bat sakatu arte itxarotea.
- Animazio bat erakustea.
- Ekintza bat segundo batzuk geroago exekutatzea.
- Fitxategi bat irakurtzea.
- Gailuaren GPS kokapena lortzea.

JavaScript-ek eragiketa horietako bakoitza amaitu arte itxaron beharko balu programa exekutatzen jarraitu aurretik, web-orriak blokeatuta geratuko lirateke eta erabiltzaileari erantzuteari utziko liokete.

Arazo hori saihesteko, JavaScript-ek **programazio [asinkrono](https://developer.mozilla.org/en-US/docs/Learn_web_development/Extensions/Async_JS)** eredu bat du. Horri esker, zeregin jakin batzuk abiarazi eta gainerako programa exekutatzen jarrai dezakegu, zeregin horiek amaitu bitartean.

## Eragiketa sinkronoak vs asinkronoak {#síncrona-vs-asíncrona}

Eragiketa **sinkronoa** programa hurrengo instrukzioa exekutatzen hasi aurretik amaitu behar den eragiketa da. Hau da, instrukzioak **zorrotz ordenan** exekutatzen dira, eta instrukzio bat amaitu arte hurrengoa ez da hasten.

Eragiketa **asinkrono** batek programa exekutatzen jarraitzea ahalbidetzen du eragiketa hori amaitzen den bitartean. Eragiketa amaitzen denean, JavaScript-ek dagokion kodea exekutatuko du.

+----------------+--------------------------------------------------------------------------------------+----------------------------------------------------------------------------+
|                | Programazio sinkronoa                                                                | Programazio asinkronoa                                                     |
+================+======================================================================================+============================================================================+
| Laburpena      | Instrukzioek elkarren zain egon behar dute.                                          | Eragiketa batzuk atzeko planoan exekutatzen dira.                          |
+----------------+--------------------------------------------------------------------------------------+----------------------------------------------------------------------------+
| Abantailak     | ● Ulertzeko erraza da.                            `<br>`{=html} `\linebreak`{=latex} | ● Interfazeak erantzuten jarraitzen du. `<br>`{=html} `\linebreak`{=latex} |
|                | ● Instrukzioek ordena argi bati jarraitzen diote. `<br>`{=html} `\linebreak`{=latex} | ● Eragiketa geldoetarako egokia da. `<br>`{=html} `\linebreak`{=latex}     |
|                | ● Erraza da akatsak aurkitzea.                                                       | ● Lineako eskaeretarako egokia da.                                         |
+----------------+--------------------------------------------------------------------------------------+----------------------------------------------------------------------------+
| Desabantailak  | Programa blokeatuta gera daiteke.                                                    | Fluxu konplexuagoa.                                                        |
+----------------+--------------------------------------------------------------------------------------+----------------------------------------------------------------------------+

Table: {tablename=yukitblrcol colspec=X[2,l]X[5,l]X[5,l]}

Imajina dezagun ondorengo JavaScript kodea:

::: {.mycode size=footnotesize}
[JavaScript]{.title}
```javascript
function tarea(message) {
    // emula tarea que consume tiempo
    let n = 10000000000;
    while (n > 0){
        n--;
    }
    console.log(message);
}

console.log('Empieza');
task('Llamamos API');
console.log('Terminado');
```
:::


2. urratsa exekutatzen ari den bitartean, funtzioak denbora behar du eta, beraz, gainerako prozesu guztiak **blokeatuta eta zain geratzen dira**. Egoera hori saihestu beharreko prozesua da. Web-aplikazio bat erabiltzen dugunean, eragiketa asinkronoak etengabe egiten dira:

- Kanpoko web bateko datuak kontsultatzea.
- Irudiak kargatzea.
- Bideo bat erreproduzitzea.
- Erabiltzailearen klik baten zain egotea.
- Teklatuaren sakatze baten zain egotea.



# JavaScript eta programazio asinkronoa {#javascript-asíncrona}

JavaScript-ek kodea sekuentzialki exekutatzen du, baina eragiketa asinkronoak kudeatzeko mekanismoak ditu. Mekanismo horiek guztiak lengoaiaren oinarrizko osagai batean oinarritzen dira: **Event Loop**. Eragiketa horien artean, hauek nabarmendu ditzakegu:

- Tenporizadoreak
- Gertaerak
- Promesak
- [async]{.verbatim} / [await]{.verbatim}
- [fetch()]{.verbatim}

## Event Loop {#event-loop}

**Event Loop** (gertaeren begizta) JavaScript kodearen exekuzioa eragiketa asinkronoekin koordinatzeaz arduratzen den mekanismoa da. Barrutik prozesu konplexua bada ere, modu sinplifikatuan uler dezakegu. Bere lana etengabe galdera honi erantzutea da:

- Ba al dago amaitu den zain dagoen zereginik?
- Erantzuna baiezkoa bada, exekutatu zeregin horri lotutako kodea.

JavaScript *single-threaded* da, hau da, **kode-instrukzio bakarra exekuta dezake aldi berean**; beraz, zeregin asinkronoak agertu arte **Event Loop** ez da jokoan sartzen. Badirudi zeregin gehiago egiten direla, baina horietako batzuk nabigatzaileak egiten ditu. Kodea nola exekutatzen den ulertzeko, "jokalariak" ezagutu behar ditugu:

- ***Call Stack***: Funtzioak exekutatzen diren lekua.
- **Web APIs**: Nabigatzaileak eskaintzen dituen APIak, zeregin asinkronoak egiteko, hala nola [setTimeout]{.verbatim}, HTTP eskaerak edo DOMeko gertaerak.
- ***Task Queue (Macro-task queue)***: Zeregin luzeen *callback*-ak gordetzen ditu, hala nola [setTimeout]{.verbatim} edo [setInterval]{.verbatim} zereginenak.
- ***Micro-task Queue***: [Promise.then]{.verbatim}-en *callback*-ak, [MutationObserver]{.verbatim}-en zereginak eta [queueMicrotask]{.verbatim}-en lanak gordetzen ditu.
- **Event Loop**: Deien pila egiaztatzen duen koordinatzailea: "Deien pila hutsik al dago? Hala bada, joan ilarako hurrengo zereginera."

JavaScript-ek lehentasun handiagoa ematen die *micro-task*-ei *macro-task*-ei baino, eta hurrengo adibidearekin egiazta dezakegu:

:::::::::::::: {.columns }
::: {.column width="55%"}

::: mycode
[[medium.com](https://medium.com/@vigenhovhannisiano/javascript-event-loop-explained-with-simple-diagrams-and-real-examples-8296c85ab964)-en adibidea]{.title}
```javascript
console.log("1");

setTimeout(() => {
  console.log("2 - macro-task");
}, 0);

Promise.resolve().then(() => {
  console.log("3 - micro-task");
});

console.log("4");
```
:::

:::
::: {.column width="45%" }

Nahiz eta oraindik zati bakoitzak zer egiten duen ulertzen ez dugun, irteera honakoa izango da:

- 1
- 4
- 3 - micro-task
- 2 - macro-task


:::
::::::::::::::


::: errorbox
JavaScript-ek lehentasun handiagoa ematen die *micro-task*-ei *macro-task*-ei baino.
:::

![Event Loop-aren diagrama. [Medium](https://medium.com/@rakeshraj2097/javascripts-event-loop-the-mind-behind-the-magic-4a56608abab7)-en oinarritua](img/dec/event-loop.svg){width="100%"}


Bi segundoko tenporizadore bat sortzen duen adibide sinpleagoa

::: mycode
[Adibide asinkrono sinplea]{.title}
```javascript
console.log("Inicio");
setTimeout(() => {
    console.log("Han pasado dos segundos.");
}, 2000);
console.log("Fin");
```
:::

::: errorbox
Programazio asinkronoarekin, garrantzitsua da ulertzea kodearen ordena ez datorrela beti bat exekuzio-ordenarekin.
:::


::: exercisebox
[[18a](https://github.com/yuki/ejercicios/blob/main/daw/dec/18a.html)]{.solution}

Egiaztatu aurreko adibideen funtzionamendua.
:::

# Temporizadoreak {#temporizadores}

Temporizadoreek kodea denbora jakin bat igaro ondoren edo modu errepikakorrean exekutatzea ahalbidetzen dute. JavaScript-en eskuragarri egon ziren programazio asinkronoko lehen tresnetako batzuk dira.

## [setTimeout()]{.verbatim} {#setTimeout}

[setTimeout()]{.verbatim} funtzioak funtzio bat behin bakarrik exekutatzen du adierazitako denbora igaro denean, **milisegundotan** adierazita (1000ms == 1s).

::: mycode
[[setTimeout() adibidea]{.verbatim}]{.title}
```javascript
console.log("Inicio");
const id = setTimeout(() => {
    console.log("Han pasado tres segundos.");
}, 3000);
console.log("Fin");
```
:::

[setTimeout()]{.verbatim} funtzioak identifikatzaile bat itzultzen du, eta identifikatzaile hori tenporizadorea bertan behera uzteko erabil dezakegu.

## [clearTimeout()]{.verbatim} {#clearTimeout}

Tenporizadore bat exekutatu aurretik bertan behera uzteko aukera ematen du.

::: mycode
[[setTimeout()]{.verbatim} adibidea]{.title}
```javascript
const id = setTimeout(() => {
    console.log("Han pasado cinco segundos.");
}, 5000);
clearTimeout(id);
```
:::

Funtzio hau erabilgarria da honako hauetarako:

- Atzerako kontaketa bat bertan behera uzteko.
- Jakinarazpen bat gelditzeko.
- Erabiltzaileak iritziz aldatzen badu, ekintza bat exekutatzea saihesteko.


## [setInterval()]{.verbatim} {#setInterval}

[setInterval()]{.verbatim} funtzioak funtzio bat behin eta berriz exekutatzen du, adierazitako milisegundoak igaro ondoren.

:::::::::::::: {.columns }
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[Funtzio bati deitu]{.title}
```javascript
setInterval(hola(), 2000);
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[Gezi-funtzioa erabili]{.title}
```javascript
setInterval(() => {
    console.log(new Date());
}, 1000);
```
:::

:::
::::::::::::::

Mezua segundo bakoitzean agertzen jarraituko du, harik eta tenporizadorea gelditu arte.

## [clearInterval()]{.verbatim} {#clearInterval}

[setInterval()]{.verbatim} bidez sortutako tenporizadore bat gelditzeko aukera ematen du.

::: mycode
[Tenporizadorea gelditu]{.title}
```javascript
let contador = 0;

const reloj = setInterval(() => {
    contador++;
    console.log(contador);

    if (contador === 10) {
        clearInterval(reloj);
    }
}, 1000);
```
:::

::: exercisebox
[[18b](https://github.com/yuki/ejercicios/blob/main/daw/dec/18b.html)]{.solution}

Egiaztatu tenporizadoreen adibideen funtzionamendua.
:::

## Tenporizadoreekin jardunbide egokiak {#buenas-prácticas-temporizadores}

Garrantzitsua da jardunbide egokiak erabiltzea tenporizadoreak erabiltzen ditugunean:

- Tenporizadoreek itzultzen duten identifikatzailea gordetzea.
- Jada beharrezkoak ez diren tenporizadoreak bertan behera uztea.
- Tarte laburregiak saihestea, aplikazioaren errendimenduan eragina izan dezaketelako.



# Callback-ak {#callbacks}

***Callback*** bat beste funtzio bati argumentu gisa pasatzen zaion funtzioa da, gero exekutatu dadin. Hau da, funtzio bat berehala exekutatu beharrean, beste funtzio bati ematen zaio, beharrezkoa denean deitu dezan.

Aurreko atalean tenporizadoreak erabiltzen ikasi dugu. Tenporizadoreak *set* egitean, funtzio bat jasotzen dute lehen parametro gisa. Funtzio hori gertaera jakin bat gertatzen denean exekutatzen da (kasu honetan, denbora jakin bat igarotzen denean).

Callback-ak izan ziren urte askotan JavaScript-en programazio asinkronoa egiteko mekanismo nagusia. Gaur egun ere erabiltzen dira, nahiz eta egoera askotan **promesek** eta [async]{.verbatim} / [await]{.verbatim} egiturek ordezkatu dituzten. Azken horiek aurrerago aztertuko ditugu.

::: mycode
[*Callback* baten adibidea tenporizadore batean]{.title}

```javascript
function saludar() {
    console.log("Hola");
}
setTimeout(saludar, 3000);
```
:::

Kasu honetan:

- [saludar]{.verbatim} callback-a da.
- [setTimeout()]{.verbatim} funtzioak noiz exekutatu erabakiko du.

Aurreko adibidean lehendik existitzen zen funtzio bat pasatu da, baina funtzio anonimoak eta gezi-funtzioak ere pasa daitezke.

:::::::::::::: {.columns }
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[Funtzio anonimoa]{.title}
```javascript
setTimeout(function () {
    console.log("Hola");
}, 3000);
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[Gezi funtzioa]{.title}
```javascript
setTimeout(() => {
    console.log("Hola");
}, 3000);
```
:::

:::
::::::::::::::


## Noiz erabili callback-ak {#cuándo-usar-callbacks}

**Callback** hitz ingelesak literalki "itzultzean deitzea" esan nahi du. Beraz, ideia sinplea da: funtzio bati beste funtzio bat ematea, beharrezkoa denean deituko dena.

Adibide gisa, har dezagun eragiketa bat egiten duen hurrengo funtzioa. Hirugarren parametro gisa callback funtzio bat du, emaitzarekin zer egin behar den adierazteko. Funtzioak ez daki zer gertatuko den emaitzarekin, baina *callback*-a erabiliko du horretarako.

::: mycode
[*Callback* adibidea]{.title}

```javascript
function sumar(a, b, callback) {
    const resultado = a + b;
    callback(resultado);
}
```
:::

Funtzioari deitzean, parametro gisa pasatzen diogun *callback*-ean zer egin erabaki dezakegu.


:::::::::::::: {.columns }
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[Emaitza logueatu]{.title}
```javascript
sumar(4, 6, (resultado) => {
    console.log(resultado);
});
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[Elementu batean jarri]{.title}
```javascript
sumar(4, 6, (resultado) => {
  let r = document.getElementById("r")
  r.textContent = resultado
});
```
:::

:::
::::::::::::::

Lehen deian emaitza kontsolan logeatzen da; bigarrenean, berriz, HTML elementu bat aldatzen da.

::: exercisebox
[[18c](https://github.com/yuki/ejercicios/blob/main/daw/dec/18c.html)]{.solution}

Sortu parametro gisa *callback* bat jasotzen duen funtzio bat. Deitu funtzioari *callback* desberdin batekin.
:::


## Callback-ak gertaeretan {#callbacks-evento}

Dagoeneko callback-ak erabiltzen aritu gara, konturatu gabe.

::: mycode
[*Callback* gertaeretan]{.title}

```javascript
boton.addEventListener("click", () => {
    console.log("Pulsado");
});
```
:::

Aurreko gezi-funtzioa callback bat da, eta nabigatzaileak exekutatuko du erabiltzaileak botoia sakatzen duenean.

Orain arte ikusi ditugun gertaera guztiek *callback*-ak erabiltzen dituzte, eta gauza bera gertatzen da tenporizadoreekin.

::: infobox
Gertaera eta tenporizadore guztiek *callback*-ak dituzte.
:::


## Callback hell {#callback-hell}

Aplikazio bat hazten hasten denean, callback-ek kodea zaildu dezakete. Hainbat callback elkarren barruan habiaratzen direnean, **Callback Hell** izenez ezagutzen den arazo bat agertzen da. *Pyramid of Doom* edo Zoritxarraren Piramide ere esaten zaio.

Izena kodearen itxuratik dator, koska-mailak direla eta piramide bat gogorarazten baitu. Ikusmenez, kodea jarraitzea zaila da, eta, gainera, edozein aldaketak piramidearen hainbat mailatan eragin dezake.


::: mycode
[*Callback hell*]{.title}

```javascript
login(usuario, () => {
    obtenerPerfil(() => {
        obtenerPedidos(() => {
            obtenerFactura(() => {
                console.log("Proceso terminado");
            });
        });
    });
});
```
:::


Callback-en bidezko erroreen kudeaketa ere ez da erraza. Eragiketa bakoitzak egiaztatu beharko luke arazoren bat gertatu den jarraitu aurretik. Horrek are gehiago handitzen du kodearen konplexutasuna.


## Abantailak eta desabantailak {#callbacks-ventajas-inconvenientes}

Callback-ek aurrerapen handia ekarri zuten JavaScript-era, programaren exekuzioa blokeatu gabe ataza asinkronoak egitea ahalbidetzen baitzuten. Hala ere, desabantaila batzuk ere badituzte, hurrengo taulan ikus daitekeen bezala.


+---------------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------+
| Abantailak                                                                                              | Desabantailak                                                             |
+=========================================================================================================+===========================================================================+
| ● Gertaera bat gertatzen denean kodea exekutatzea ahalbidetzen dute. `<br>`{=html} `\linebreak`{=latex} | ● Kodea mantentzea zaila izan daiteke. `<br>`{=html} `\linebreak`{=latex} |
| ● Aplikazioa blokeatzea saihesten dute.                              `<br>`{=html} `\linebreak`{=latex} | ● Habiaratutako funtzio asko.          `<br>`{=html} `\linebreak`{=latex} |
| ● Eragiketa txikietarako sinpleak dira.                              `<br>`{=html} `\linebreak`{=latex} | ● Erroreen kudeaketa konplikatua.      `<br>`{=html} `\linebreak`{=latex} |
| ● Nabigatzailearen ia API guztietan daude eskuragarri.               `<br>`{=html} `\linebreak`{=latex} | ● Irakurgarritasun txikia.             `<br>`{=html} `\linebreak`{=latex} |
| ● JavaScript-eko metodo ugaritan erabiltzen jarraitzen dira.                                            | ● Kodea berrerabiltzea zaila.                                             |
+---------------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------+

Table: {tablename=yukitblr colspec=X[4,l]X[3,l]}


# Promesak (*Promise*) {#promesas}

Aurreko atalean ikusi dugu *callback*-ek kodea eragiketa asinkrono bat amaitzen denean exekutatzea ahalbidetzen dutela. Hala ere, hainbat eragiketa elkarren mende daudenean, kodea irakurtzea eta mantentzea zaila izan daiteke.

Arazo hori konpontzeko, ECMAScript 2015ek (ES6) **Promise** (promesa) izeneko mekanismo berri bat gehitu zuen. Mekanismo horrek eragiketa asinkrono baten emaitza irudikatzea ahalbidetzen du eta hainbat eragiketa kateatzea errazten du, *Callback Hell* ezaguna sortu gabe. Gaur egun, JavaScript-eko programazio asinkronoaren oinarrizko mekanismoetako bat da.

Promesa bat sortzen dugunean, oraindik ez dugu eragiketa horren emaitza ezagutzen. Dakigun bakarra da noizbait bi egoera hauetako bat gertatuko dela:

- Eragiketa behar bezala amaituko da.
- Eragiketak errore bat sortuko du.

<!-- 
TODO: poner el símil?
Podemos imaginar una promesa como un pedido realizado por Internet. Cuando realizamos el pedido todavía no tenemos el paquete. La empresa se compromete a entregarlo más adelante. Con el paso del tiempo pueden ocurrir dos cosas:

- El paquete llega correctamente.
- El envío falla.

Mientras tanto permanecemos esperando el resultado.
 -->


## Promise baten egoerak {#estados-promise}

Promesa bakoitzak hainbat egoera igarotzen ditu, eta ondorengo diagraman modu sinplifikatuan ikus daitezke:

![Promise baten egoerak. [Iturrian](https://www.aprendejavascript.dev/clase/programacion-asincrona/promises-basico) oinarritua](img/dec/promise-estados.png){width="75%"}


- ***Pending***: Hasierako egoera da. Eragiketa oraindik ez da amaitu.
- ***Fulfilled***: Eragiketa behar bezala amaitu da. Promesak emaitza bat itzultzen du.
- ***Rejected***: Eragiketak errore bat sortu du. Promesak hutsegitearen arrazoia itzultzen du.


## Promise bat sortzea {#crear-promise}

*Promise* bat sortzeko modua hurrengo adibideetan agertzen dena da. Funtzioak bi parametro berezi jasotzen ditu, promesa ebatzi edo bazter dezaketen bi funtzio (***callback***):

- [resolve()]{.verbatim}: Eragiketa behar bezala amaitu dela adierazten du. Promesa *fulfilled* egoerara igarotzen da.
- [reject()]{.verbatim}: Eragiketak errore bat sortu duela adierazten du. Promesa *rejected* egoerara igarotzen da.


Jarraian, bi adibide sortzen dira:

- Promesa ebatzi edo baztertzen duen baldintza batekin egindako adibide sinplea.
- Bi segundoren buruan promesa ebatzi edo baztertuko duen adibidea, tenporizadoreari esker. Horrela, eskaera asinkrono bat simulatzen da (web bateko eskaera bat, adibidez).

:::::::::::::: {.columns columnsep="0.5cm"}
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[Promise sortu]{.title}
```javascript
const p=new Promise((resolve,reject)=>{
    // Tareas asíncronas
    // cambiar a false para ver error
    const success = true;
  
    if (success) {
      resolve("éxito");
    } else {
      reject("error");
    }
});
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[Promise sortu]{.title}
```javascript
const p=new Promise((resolve,reject)=>{
    // Tareas asíncronas
    // cambiar a false para ver error
    const success = true;
    
    setTimeout(() => {
      if (success) {
        resolve("éxito")
      } else {
        reject("error")
      }
    }, 2000)
});
```
:::

:::
::::::::::::::


## Promise kontsumitzea {#consumir-promise}

*Promise* bat sortu ondoren, kontsumitu egin behar da modu asinkronoan egindako funtzioaren balioa lortu ahal izateko. Horretarako, metodo hauek ditugu:

- [then()]{.verbatim}: Promise arrakastaz ebazten denean exekutatzen da.
- [catch()]{.verbatim}: Promise errore batekin baztertzen denean exekutatzen da.
- [finally()]{.verbatim}: **Beti** exekutatzen da, promesaren prozesua amaitzean ([then()]{.verbatim} edo [catch()]{.verbatim} ondoren). Ez du parametrorik jasotzen eta ezin du *promise*-aren balioa aldatu. Funtzio hau erabilgarria da honako hauetarako:
  - Kargatze-adierazleak ezkutatzeko.
  - Baliabideak askatzeko.
  - Interfazea leheneratzeko.

::: mycode
[Consumir Promise]{.title}

```javascript
promesa
  .then((respuesta)=>{
      console.log(`Éxito: ${respuesta}`)
  })
  .catch((error)=> {
      console.log(`Error: ${error}`)
  })
  .finally(()=>{
      console.log("Promesa finalizada.")
  });
```
:::

::: errorbox
[then()]{.verbatim} eta [catch]{.verbatim} elkarren baztertzaileak dira. Horietako bakarra exekutatzen da.
:::

::: exercisebox
[[18d](https://github.com/yuki/ejercicios/blob/main/daw/dec/18d.html)]{.solution}

Sortu egoera desberdinetan amaitzen diren Promesak. Erabili [finally()]{.verbatim} azken funtzio gisa.
:::


## Eragiketak kateatu {#encadenar-operaciones}

Hainbat [then()]{.verbatim} metodo modu kateatuan erabiltzea posible da. Izan ere, [then()]{.verbatim} batek Promise berri bat itzultzen du, eta horri esker emaitzen eraldaketa-kate bat sor daiteke; izan ere, bakoitzak bere emaitza hurrengoari pasa diezaioke:


::: mycode
[Eragiketak kateatu]{.title}

```javascript
promesa
  .then((respuesta)=>{
      console.log(`Éxito 1: ${respuesta}`)
      return respuesta;
  })
  .then((respuesta)=> {
      r = respuesta.toUpperCase();
      console.log(`Éxito 2: ${r}`);
      return r;
  })
  .then((respuesta)=> {
      r = respuesta.toLowerCase();
      console.log(`Éxito 3: ${r}`);
  });
```
:::

Aurreko adibidean ikus daitekeen bezala, eragiketa hauek egiten dira:

- Lehen [then()]{.verbatim}-ean promesaren erantzuna jasotzen dugu; kasu honetan, kontsolan logeatzen dugu eta erantzunaren [return]{.verbatim} egiten dugu.
- Testu/objektu hori hurrengo [then()]{.verbatim}-ean jasotzen da parametro gisa. Honek, aldi berean, zenbait eragiketa egiten ditu eta beste testu/objektu bat itzultzen du.
- Azken [then()]{.verbatim}-ean aurrekoaren [return]{.verbatim} jasotzen dugu parametro gisa, eta hirugarren eragiketa bat egiten dugu.

Hori guztia sinplifikatu egin daiteke aurretik idatzitako funtzioei dei egiten badiegu.

::: mycode
[Eragiketak kateatu]{.title}

```javascript
promesa2
  .then(respuesta => igual(respuesta))
  .then(respuesta => mayus(respuesta))
  .then(respuesta => minus(respuesta));
```
:::

Eta are gehiago hobetu dezakegu, une bakoitzean exekutatu nahi ditugun funtzioak zuzenean pasa baititzakegu. Funtzio horiek aurreko urratsaren emaitza jasoko dute, funtzioak habiaratu beharrik gabe. Hori gertatzen da funtzioaren kontratuak parametro bakarra jaso eta promesa bat itzultzea eskatzen duelako, sortzen ari garen funtzioak bezala:

::: mycode
[Eragiketak kateatu]{.title}

```javascript
promesa3
  .then(igual)
  .then(mayus)
  .then(minus);
```
:::

::: exercisebox
[[18e](https://github.com/yuki/ejercicios/blob/main/daw/dec/18e.html)]{.solution}

Sortu eragiketa kateatuak dituzten promesak eta erabili eragiketak idazteko hiru moduak.
:::


## *Callback*-ekiko abantailak {#vantajas-sobre-callbacks}

Jarraian, eragiketa berak callback-ekin eta Promise-ekin nola egin daitezkeen erakusten duen adibide bat:

::: {.mycode size=footnotesize}
[123 erabiltzailearen saio-hasierako *Callback hell*-a]{.title}

```javascript
login(123, (error,usuario) => {
  if (error) {
    console.log("Error de login");
  } else {
    obtenerPerfil(usuario.id,(error,perfil) => {
      if (error){
        console.log("Error de perfil");
      } else {
        obtenerPedidos(usuario.id, (error, pedidos) => {
            if (error){
              console.log("Error en pedidos");
            } else {
                obtenerFactura(pedidos[0].id,(error,factura) => {
                    if (error){
                        console.log("Error en factura")
                    } else {
                        // obtener total, productos...
                    }
                });
            }
        });
      }
    });
  }
});
```
:::

*Callback hell* adibide honetan erroreen kudeaketa eta egiaztapenak gehitu dira, aurreko [atalean](#callback-hell) adierazi ez zirenak. Ikus daitekeen bezala, horrek etorkizunean aldaketak egin behar direnean zailtasuna handitzen du.

Aldiz, [Promise]{.verbatim} erabiltzen badugu, hurrengo bi moduetako bat izango genuke, bertsio "luzea" edo laburtua erabiltzen dugunaren arabera.


:::::::::::::: {.columns }
::: {.column width="55%"}

::: {.mycode size=footnotesize}
[Erabiltzailearen saio-hasiera]{.title}
```javascript
obtenerUsuario(123)
  .then((usuario) => {
    return obtenerPerfil(usuario.id);
  })
  .then((usuario) => {
    return obtenerPedidos(usuario.id);
  })
  .then((pedidos) => {
    return obtenerFactura(pedidos[0].id);
  })
  .then((factura) => {
    console.log(factura);
  })
  .catch((error) => {
    console.error(error);
  });
```
:::

:::
::: {.column width="45%" }

::: {.mycode size=footnotesize}
[Erabiltzailearen saio-hasiera]{.title}
```javascript
obtenerUsuario(123)
  .then(obtenerPerfil)
  .then(obtenerPedidos)
  .then(obtenerFactura)
  .then(mostrarFactura)
  .catch((error) => {
      console.error(error);
  });
```
:::

:::
::::::::::::::


## [Promise.all()]{.verbatim} {#promise-all}

Hainbat promesa amaitu arte itxarotea ahalbidetzen du, ondoren funtzio bat exekutatzeko. Hala ere, funtzioa promesa guztiak behar bezala amaitu direnean bakarrik exekutatuko da:

::: mycode
[Promesak itxaroten]{.title}
```javascript
Promise.all([
    promesa1,
    promesa2,
    promesa3
])
.then((resultados) => {
    console.log(resultados);
});
```
:::


Promesetako edozeinek errore bat sortzen badu, [Promise.all()]{.verbatim} berehala amaituko da errore horrekin.

## [Promise.race()]{.verbatim} {#promise-race}

Amaitzen den lehen promesaren emaitza itzultzen du, edozein dela ere zein promesa den.

::: mycode
[Promesak itxaroten]{.title}
```javascript
Promise.race([
    promesa1,
    promesa2
])
.then((resultado) => {
    console.log(resultado);
});
```
:::

## [Promise.allSettled()]{.verbatim} {#promise-allsettled}

Hainbat *Promise*-ren emaitza itxaroteko erabiltzen da, horietako batzuek huts egiten duten kontuan hartu gabe. Erabilgarria da egoera-txosten bat egiteko, zer funtzionatu duen eta zer ez jakiteko.

[Promise.allSettled()]{.verbatim} erabiliz, beti [{status, value/reason}]{.verbatim} motako objektuen array bat lortuko dugu.

- **status**: [fulfilled]{.verbatim} balioa izan dezake promesak bete badira, eta [rejected]{.verbatim} baztertu badira.
- Bigarren eremua hau izango da:
  - **value**: promesak arrakasta izan badu, emaitza izango dugu.
  - **reason**: promesak huts egin badu, errorea izango dugu.

::: exercisebox
[[18f](https://github.com/yuki/ejercicios/blob/main/daw/dec/18f.html)]{.solution}

Sortu adibideak [Promise.all()]{.verbatim}, [Promise.race()]{.verbatim} eta [Promise.allSettled()]{.verbatim} erabiliz.
:::



# [async]{.verbatim} eta [await]{.verbatim} {#async-await}

Promesek callback-en arazoen zati handi bat konpondu zuten. Hala ere, hainbat promesa kateatzen direnean, kodea nahi baino konplexuagoa izan daiteke.

Programazio asinkronoa are gehiago sinplifikatzeko, ECMAScript 2017k [async]{.verbatim} eta [await]{.verbatim} hitz erreserbatuak gehitu zituen. Haien helburua kode asinkronoa kode sekuentzialaren oso antzeko itxurarekin idaztea da.


::: infobox
[async]{.verbatim} eta [await]{.verbatim} hitzen helburua kode asinkronoa kode sekuentzialaren antzeko itxurarekin idaztea da.
:::


## [async]{.verbatim} funtzioa deklaratzea {#función-async}

[async]{.verbatim} hitz erreserbatua erabiliz, funtzio bat asinkronoa dela deklaratzen dugu eta **beti promesa bat itzultzen du**. Funtzio estandarretan zein gezi-funtzioetan erabil dezakegu.

:::::::::::::: {.columns }
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[async funtzioa]{.title}
```javascript
async function saludo() {
    return "Hola";
}
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[gezi funtzioa async]{.title}
```javascript
const saludo = async () => {
    return "Hola";
};
```
:::

:::
::::::::::::::

Itxuraz kate bat itzultzen badu ere, benetan balio horrekin **ebatzitako promesa** bat itzultzen du.

## [await]{.verbatim} bidez funtzioa itxarotea {#función-await}

[await]{.verbatim} hitz erreserbatuak promesa baten emaitza itxaroteko aukera ematen du. Promesa amaitzen ez den bitartean, funtzio asinkronoa zain geratuko da. Gogoratu behar dugu horrek ez duela programa osoa blokeatzen; JavaScript-ek funtzio hori alde batera utziko du eta programaren beste zati bati ekingo dio.


:::::::::::::: {.columns }
::: {.column width="52%"}

::: {.mycode size=footnotesize}
[Funtzioa Promise itzultzen du]{.title}
```javascript
function esperar() {
    return new Promise((resolve) => {
        setTimeout(() => {
            resolve("Finalizado");
        }, 2000);
    });
}
```
:::

:::
::: {.column width="48%" }

::: {.mycode size=footnotesize}
[Funtzio asinkronoa itzaroten du]{.title}
```javascript
async function ejemplo() {
    console.log("Inicio");
    const resultado = await esperar();
    console.log(resultado);
    console.log("Fin");
}

ejemplo();
```
:::

:::
::::::::::::::


Aurreko adibidean badirudi modu sinkronoan exekutatzen ari dela, baina aplikazioaren gainerakoa blokeatzea saihestea ahalbidetzen duten JavaScript-en funtzioak erabili dira.

::: exercisebox
[[18g](https://github.com/yuki/ejercicios/blob/main/daw/dec/18g.html)]{.solution}

Sortu 3 botoi, honako hau egiten dutenak:

1. `"Botón 1 pulsado"` logeatu.
2. Deitu [18a](https://github.com/yuki/ejercicios/blob/main/daw/dec/18a.html) ariketako [task]{.verbatim} funtzioari. Saiatu 1. botoia sakatzen. Zer gertatzen da?
3. Deitu aurreko adibideko [async]{.verbatim} funtzio baten antzeko bati eta itxaron [await]{.verbatim} erabiliz. Saiatu 1. botoia sakatzen. Zer gertatzen da?
:::


Jarraian, promesak erabiliz egindako adibide baten eta async/await erabiliz egindako beste baten arteko konparaketa ikus dezakegu.

:::::::::::::: {.columns }
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[Promesekin]{.title}
```javascript
esperar()
  .then((resultado) => {
    console.log(resultado);
  });
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[Async/await]{.title}
```javascript
const resultado = await esperar();

console.log(resultado);
```
:::

:::
::::::::::::::


## Erroreen kudeaketa {#tratamiento-errores}

Promesa batek errore bat sortzen duenean, normalean [try...catch]{.verbatim} erabiliko dugu.

::: mycode
[Errore kudeaketa]{.title}
```javascript
async function ejemplo() {
    try {
        const datos = await obtenerDatos();
        console.log(datos);
    }
    catch(error){
        console.log(error);
    }
}
```
:::

Nahiz eta [[try...catch]{.verbatim}](#try-catch) lehenago aztertu genuen, une honetatik aurrera bereziki garrantzitsua izango da, funtzio asinkronoetako erroreak kudeatzeko ohiko mekanismoa baita.


## Hainbat eragiketa {#varias-operaciones}

*Promise*-ekin eragiketak nola kateatu ikusi dugu. Orain hainbat funtziori dei egin diezaiekegu eta emaitzaren zain egon, modu irakurgarriagoan:

:::::::::::::: {.columns }
::: {.column width="40%"}

::: {.mycode size=footnotesize}
[Promesekin]{.title}
```javascript
obtenerDatos()
  .then((datos) => {
    return procesar(datos);
  })
  .then((resultado) => {
    console.log(resultado);
  })
  .catch((error) => {
    console.log(error);
  });
```
:::

:::
::: {.column width="55%" }

::: {.mycode size=footnotesize}
[Async/await]{.title}
```javascript
async function ejemplo() {
  try {
    const datos = await obtenerDatos();
    const resultado = await procesar(datos);
    console.log(resultado);
  }
  catch(error){
    console.log(error);
  }
}
```
:::

:::
::::::::::::::

Horren arazoa da modu sekuentzialean programatzen ari garela; beraz, bi funtzioen denborak batzen ari gara. Horregatik, garrantzitsua da gogoratzea **paraleloan itxaron** dezakegula [Promise.all]{.verbatim} erabiliz.

::: {.mycode size=footnotesize}
[Itxaron paraleloki]{.title}
```javascript
async function perfilUsuario(id) {
  try {
    const [datos, facturas] = await Promise.all([
        obtenerDatos(id),
        obtenerFacturas(id)
    ])
    console.log(facturas);
  }
  catch(error){
    console.log(error);
  }
}
```
:::


::: exercisebox
[[18h](https://github.com/yuki/ejercicios/blob/main/daw/dec/18h.html)]{.solution}

Sortu 3 botoi, funtzio desberdinei deitzen dietenak. Funtzio horiek, aldi berean, 3, 2 eta 1 segundoko tenporizadore bana erabiliko dute.
Zein moduk behar du denbora gutxien exekutatzeko?

1. [Promise]{.verbatim} erabiliz, [then]{.verbatim} habiaratuz.
2. [async/await]{.verbatim} erabiliz, modu sekuentzialean.
3. [async/await]{.verbatim} erabiliz, [Promise.all]{.verbatim} paraleloan erabiliz.

:::

## Noiz erabili [async]{.verbatim} eta [await]{.verbatim}?

Promesekin lan egiten dugunean eta hainbat eragiketa jarraian egin behar ditugunean. Gaur egun, JavaScript aplikazio modernoak garatzeko gomendatutako ikuspegia dira.

