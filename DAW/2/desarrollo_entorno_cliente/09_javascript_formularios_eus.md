
# Sarrera {#introducción-formularios}

Orain arte JavaScript erabiliz web-orri dinamikoak sortzen, DOMa manipulatzen eta gertaeren bidez erabiltzailearen ekintzei erantzuten ikasi dugu. Hala ere, web-aplikazio gehienek erabiltzaileak informazioa sartzeko aukera behar dute.

Adibidez:

- Saioa hastea.
- Erregistratzea.
- Produktuak bilatzea.
- Mezuak bidaltzea.
- Eskaerak egitea.
- Hobespenak konfiguratzea.

Informazio hori guztia **inprimakien/formularioen** bidez jasotzen da. Inprimakiak erabiltzaileari web-orri batean informazioa sartzeko aukera ematen dioten kontrolen multzoa dira.

Sartutako datuak hainbat helburutarako erabil daitezke:

- Zerbitzari batera bidaltzeko.
- JavaScript bidez prozesatzeko.
- Nabigatzailean gordetzeko.
- Informazioa iragazteko edo bilatzeko erabiltzeko.

Inprimakiak web-aplikazioen garapenean gehien erabiltzen diren elementuetako bat dira.

# [<form>]{.verbatim} elementua {#elemento-form}

Inprimaki baten kontrol guztiak normalean [<form>]{.verbatim} elementu baten barruan taldekatzen dira. Elementu horrek erlazionatutako kontrol guztien edukiontzi gisa jokatzen du.

::: mycode
[Oinarrizko formularioa]{.title}
```html
<form>
    <label for="nombre">Nombre</label>
    <input type="text" id="nombre" name="nombre">
    <button type="submit">Login</button>
</form>
```
:::

Tradizionalki, erabiltzaileak bidalketa-botoia sakatzen duenean, nabigatzaileak inprimakiko datu guztiak bildu eta zerbitzarira bidaltzen ditu. Gaur egun, JavaScript-ek esku hartu ohi du datuak zuzenak direla egiaztatzeko.

![Inprimaki baten prozesua](img/dec/formulario.svg){width="100%"}

::: errorbox
**Garrantzitsua da beti balidazioa *backend*-ean ere egitea.**
:::


## Inprimakiaren atributu nagusiak {#atributos-formulario}

[[<form>]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/form) elementuak atributu ugari ditu. Garrantzitsuenak hauek dira.


| Atributua | Deskribapena |
|----------|-------------|
| [action]{.verbatim} | Datuak bidaliko diren zerbitzariaren helbidea. |
| [method]{.verbatim} | Erabilitako HTTP metodoa ([GET]{.verbatim} informazioa lortzeko edo [POST]{.verbatim} datuak bidaltzeko). |
| [autocomplete]{.verbatim} | Nabigatzailearen autobetetze-funtzioa aktibatzen ([=on]{.verbatim}) edo desaktibatzen ([=off]{.verbatim}) du. |
| [novalidate]{.verbatim} | HTML5en balidazio automatikoa desaktibatzen du. |
| [name]{.verbatim} | Inprimakiaren izena. Gaur egun gehiago erabiltzen da [id]{.verbatim}. |


::: mycode
[Formularioa atributuekin]{.title}
```html
<form action="/login" method="post" autcomplete="on" name="registro">
    <label for="nombre">Nombre</label>
    <input type="text" id="nombre" name="nombre">
    <button type="submit">Login</button>
</form>
```
:::

::: exercisebox
[[17a](https://github.com/yuki/ejercicios/blob/main/daw/dec/17a.html)]{.solution}

Aldatu inprimakiaren atributuak eta egiaztatu zer gertatzen den.
:::


## Inprimakiaren barruko kontrolak {#controles-formulario}

Inprimaki batek hainbat kontrol-mota izan ditzake, hala nola [[<input>]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/input), eta horietako bakoitza informazio-mota jakin bat sartzeko diseinatuta dago. Garrantzitsua da egokiak aukeratzea, aplikazioaren erabilgarritasuna erraztuko baitute eta, gainera, **datuen balidazioa erraztuko baitute**. Honako hauek izan daitezke:

- Testu-koadroak.
- Pasahitzak.
- Egiaztapen-laukiak.
- Aukera-botoiak.
- Goitibeherako zerrendak.
- Testu-eremuak.
- Botoiak.

### Kontroletako [name]{.verbatim} atributua {#atributo-name}

Kontrol guztiek [name]{.verbatim} atributu bat izan behar dute. Atributu hori izango da inprimakia bidaltzean zerbitzarira bidaliko den identifikatzailea.

::: mycode
[Formularioa atributuekin]{.title}
```html
<form action="/login" method="post" autcomplete="on" name="registro">
    <label for="nombre">Nombre</label>
    <input type="text" id="nombre" name="name">
    <button type="submit">Login</button>
</form>
```
:::

Aurreko adibidean ikus dezakegu [input]{.verbatim} motako [text]{.verbatim} kontrolak beste bi atributu dituela, eta izen desberdinak eman zaizkie bereizteko:

- [id]{.verbatim}: orain arte ikusi dugun HTML identifikatzaile bakarra da.
- [name]{.verbatim}: botoia sakatzean zerbitzarira bidaliko den eremuaren izena da.

::: exercisebox
[[17a](https://github.com/yuki/ejercicios/blob/main/daw/dec/17a.html)]{.solution}

Aldatu [id]{.verbatim} eta [name]{.verbatim} atributuak eta aztertu aldaketak.
:::


### Testu-eremuak {#campos-texto}

Testu-kontrolek karaktere-kateak sartzeko aukera ematen dute. Hainbat atributu dituzte, baina garrantzitsuena [type]{.verbatim} da:

- [type]{.verbatim}: Testu-eremuaren mota adierazten du. Mota jakinaren arabera, testua sartzea erraztu dezake.
  - [[text]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/input/text): Testu-eremu arrunta.
  - [[password]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/input/password): Pasahitzetarako; nabigatzaileak sartutako karaktereak ezkutatzen ditu, baina **ez da zifratzen**.
  - [[email]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/input/email): HTML5ek automatikoki egiaztatuko du formatuak email baten antza duen.
  - [[url]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/input/url): Web-helbideak sartzeko aukera ematen du.
  - [[tel]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/input/tel): Ez du formatua automatikoki balidatzen, baina datua gailu mugikorretan sartzea errazten du.
  - [[search]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/input/search): Nabigatzaile batzuek edukia ezabatzeko botoiak dituzte.
- [minlength]{.verbatim}: *string*-aren gutxieneko luzera.
- [maxlength]{.verbatim}: Eduki behar duen gehieneko luzera. Muga horretara iritsiz gero, ezin da gehiago idatzi.
- [pattern]{.verbatim}: Sartutako testuak bete behar duen **adierazpen erregularra** idazteko aukera ematen du.
- [placeholder]{.verbatim}: Lehenespenez agertzen den testua da, baina erabiltzailea idazten hasten denean desagertu egiten da.
- [readonly]{.verbatim}: Balio boolearra da; atributua badago, eremua ezin da editatu.
- [size]{.verbatim}: Testu-eremuaren tamaina.

::: mycode
[Testu eremuak]{.title}
```html
<label for="nombre">Nombre</label>
<input type="text" name="nombre">
<label for="password">Password</label>
<input type="password" name="password" min=6 max=12>
<label for="email">email</label>
<input type="email" name="email" placeholder="hola@example.com">
```
:::


### Zenbakizko eremuak {#campos-numéricos}

[Zenbakizko](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/input/number) eremuak testu-eremuen antzekoak dira, baina zenbakietarako soilik, eta normalean handitzeko edo txikitzeko botoiak izaten dituzte. [type="number"]{.verbatim} gisa ezarri behar da, eta berezko atributuak ere baditu:

- [max]{.verbatim}: Onartutako gehieneko zenbakia.
- [min]{.verbatim}: Onartutako gutxieneko zenbakia.
- [step]{.verbatim}: Botoiekin handitzeko edo txikitzeko erabiltzen den kopurua.

::: mycode
[Zenbaki eremuak]{.title}
```html
<label for="number">number</label>
<input type="number" name="number" min=5>
<label for="number2">number2</label>
<input type="number" name="number2" min=6 max=50 step=2>
```
:::


### Ordu/data eremuak {#campos-hora-fecha}

Orduak eta/edo datak adierazteko erabiltzen diren eremu espezifiko batzuk daude.

- [type]{.verbatim}: Eremu-mota adierazten du.
  - [[date]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/input/date): Datetarako eremua.
  - [[datetime-local]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/input/datetime-local): Tokiko data eta ordurako.
  - [[month]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/input/month): Urte jakin bateko hilabete bat hautatzeko.
  - [[time]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/input/time): Ordua soilik hautatzeko.
  - [[week]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/input/week): Astea soilik hautatzeko.
- [max]{.verbatim}: Mota bakoitzaren arabera, onartutako gehieneko ordua/data adieraziko du. Formatua motaren araberakoa izango da.
- [min]{.verbatim}: Mota bakoitzaren arabera, onartutako gutxieneko ordua/data adieraziko du. Formatua motaren araberakoa izango da.

::: mycode
[Ordu/data eremuak]{.title}
```html
<label for="number">date</label>
<input type="date" name="date">
<label for="datetime-local">datetime-local</label>
<input type="datetime-local" name="datdatetime-locale">
<label for="month">month</label>
<input type="month" name="month">
<label for="time">time</label>
<input type="time" name="time">
<label for="week">week</label>
<input type="week" name="week">
```
:::


### Tarte-eremuak {#campos-rango}

Datu-tarte baten barruan balio bat hautatzeko graduatzaile motako eremuak dira. [type="range"]{.verbatim} motakoak dira, eta [max]{.verbatim}, [min]{.verbatim} eta [step]{.verbatim} atributuak ere onartzen dituzte.

::: mycode
[Tarte-eremuak]{.title}
```html
<label for="range">range</label>
<input type="range" name="range">
<label for="range2">range2</label>
<input type="range" name="range2" min=0 max=30 step=2>
```
:::


### Lauki eta aukera-eremuak {#campos-casillas-opciones}

Hainbat aukera aldi berean edo hainbat aukeren artean aukera bakarra hautatzeko aukera ematen dute:

- [type]{.verbatim}: Eremu-mota adierazten du.
  - [[checkbox]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/input/checkbox): Hainbat aukera hautatzeko aukera ematen du.
  - [[radio]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/input/datetime-local): *radio groups*-etan erabiltzen da, eta aukera bakarra hauta daiteke.
- [checked]{.verbatim}: Aukera hautatuta dagoela adierazten duen balio boolearra.

[name]{.verbatim} bera partekatzen duten laukiak talde berekoak dira.


::: {.mycode size=footnotesize}
[Lauki eta aukera-eremuak]{.title}
```html
<fieldset>
  <legend>Choose your interests:</legend>
  <div>
    <input type="checkbox" id="coding" name="interest" value="coding" checked />
    <label for="coding">Coding</label>
  </div>
  <div>
    <input type="checkbox" id="music" name="interest" value="music" />
    <label for="music">Music</label>
  </div>
</fieldset>

<fieldset>
  <legend>Please select your preferred contact method:</legend>
  <div>
    <input type="radio" id="contactChoice1" name="contact" value="email" />
    <label for="contactChoice1">Email</label>
    <input type="radio" id="contactChoice2" name="contact" value="phone" />
    <label for="contactChoice2">Phone</label>
    <input type="radio" id="contactChoice3" name="contact" value="mail" />
    <label for="contactChoice3">Mail</label>
  </div>
</fieldset>
```
:::

### Zabalgarri zerrendak {#listas-desplegables}

Ohikoa da inprimaki batean hainbat [aukera](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/option) dituen [goitibeherako zerrendak](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/select) egotea:

::: mycode
[Zabalgarri zerrendak]{.title}
```html
<label for="hr-select">Your favorite food</label> <br />
<select name="foods" id="hr-select">
  <option value="">Choose a food</option>
  <hr />
  <optgroup label="Fruit">
    <option value="apple">Apples</option>
    <option value="banana">Bananas</option>
    <option value="cherry">Cherries</option>
    <option value="damson">Damsons</option>
  </optgroup>
  <hr />
  <optgroup label="Fish">
    <option value="cod">Cod</option>
    <option value="haddock">Haddock</option>
    <option value="salmon">Salmon</option>
    <option value="turbot">Turbot</option>
  </optgroup>
</select>
```
:::


### Beste kontrol batzuk {#otros-controles}

Inprimakiek beste kontrol batzuk ere badituzte. Horietako batzuk ez dira hain ohikoak, baina beste aplikazio-mota batzuetarako ere erabilgarriak dira.

- [[<textarea>]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/textarea): Lerro anitzeko testua sartzeko eremua.
  - [rows]{.verbatim}: Lerro kopurua aldatzeko.
  - [cols]{.verbatim}: Zutabe kopurua aldatzeko.
- [[<input type="color">]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/input/color): Kolore bat hautatzeko hautatzailea.
  - [value]{.verbatim}: Lehenetsitako kolorea adieraz daiteke.
- [[<input type="file">]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/input/file): Gure ordenagailuko fitxategi bat hautatzeko hautatzailea.
  - [accept]{.verbatim}: Hautatzaileak erakutsiko duen [fitxategi-mota](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/input/file#unique_file_type_specifiers) adierazteko aukera ematen du, gainerakoak baztertuz.
- [[<input type="hidden">]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/input/hidden): Inprimakiari ezkutuko eremu bat gehitzeko aukera ematen du, erabiltzaileak nahitaez bete behar ez duen beharrezko informazioa bidaltzeko.


::: {.mycode size=footnotesize}
[Beste kontrol batzuk]{.title}
```html
<textarea name="textarea" rows="5" cols="30">
Write something here…
</textarea>

<div>
  <input type="color" id="foreground" name="foreground" value="#e66465" />
  <label for="foreground">Foreground color</label>
</div>
<div>
  <label for="avatar">Choose a profile picture:</label>
  <input type="file" id="avatar" name="avatar" accept="image/png, image/jpeg" />
</div>
<div>
  <input type="hidden" id="postId" name="postId" value="34657" />
</div>
```
:::

### Botoiak {#botones}

Inprimakiek normalean gutxienez [bidalketa-botoi](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/button) bat izaten dute, baina eremuak berrezartzeko beste botoi bat ere gehi daiteke.

::: mycode
[Botoiak]{.title}
```html
<!-- método antiguo -->
<input type="submit" value="Enviar">
<input type="reset" value="Reset">

<!-- mejor así -->
<button>Aceptar</button>
<button type="reset">Reset</button>
```
:::

## [required]{.verbatim} atributua duten derrigorrezko kontrolak {#controles-obligatorios}

Ohikoa da inprimaki baten barruan derrigorrezko kontrolak egotea (izena, pasahitza, emaila...), eta, beraz, erabiltzaileak testua sartu behar izatea.

Zeregin hori errazteko, HTMLek [[required]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Attributes/required) atributua eskaintzen du. Atributu horrek erabiltzaileari eremua bete behar duela gogorarazten dio. Balidazio hori nabigatzaileak egiten du.

::: mycode
[Derrigorrezko kontrolak]{.title}
```html
<label for="nombre">Nombre</label>
<input id="nombre" type="text" required>
```
:::

## Etiketak eta irisgarritasuna {#etiquetas-accesibilidad}

Behar bezala programatutako inprimaki bat ez da beti erraza erabiltzeko. Irisgarritasunak eta erabilgarritasunak erabiltzaile orok inprimaki bat eroso bete ahal izatea bilatzen dute, erabilitako gailua edo erabiltzailearen gaitasunak edozein direla ere. Inprimaki irisgarriak diseinatzeak erabiltzaile guztiei egiten die mesede, eta jardunbide egokia da web-garapenean.

Kontrol bakoitzak etiketa deskribatzaile bat izan beharko luke, aurreko adibideetan ikusi dugun bezala. Etiketa horrek, [<label>]{.verbatim}, honako forma hau du:

::: mycode
[Etiketa]{.title}
```html
<label for="nombre">Nombre</label>
<input id="nombre" type="text">
```
:::

Etiketaren [for]{.verbatim} atributuaren eta kontrolaren [id]{.verbatim} atributuaren arteko erlazioari esker, erabiltzaileak etiketan klik egin dezake kontrola aktibatzeko. Hori bereziki erabilgarria da [checkbox]{.verbatim} eta [radio]{.verbatim} eremuetan.

::: errorbox
Erabilgarritasuna hobetzeko, [checkbox]{.verbatim} eta [radio]{.verbatim} kontroletan etiketaren [for]{.verbatim} eta kontrolaren [id]{.verbatim} erabili behar dira.
:::

### [placeholder]{.verbatim} atributua {#atributo-placeholder}

Aurretik ikusi dugu [placeholder]{.verbatim} atributua erabilgarria dela testu-eremuetan, adibideko testu bat erakusteko aukera ematen baitu. Atributu horrek **ez du [<label>]{.verbatim} etiketa ordezkatu behar**.

### Kontrolak taldekatu {#agrupar-controles}

Hainbat kontrol talde berekoak direnean, aurretik ikusi dugun [<fieldset>]{.verbatim} etiketa erabiltzea gomendatzen da. Normalean hautaketa-eremuetarako erabiltzen da, baina edozein eremu-motatan erabil daiteke.


# JavaScript formularioetan erabili {#uso-javascript-formularios}

Dagoeneko ikusi dugu HTML bidez inprimakiak nola sortu, baina aplikazio dinamikoak eraikitzeko beharrezkoa da JavaScript-etik kontrolak atzitzea, haien edukia irakurtzeko, aldatzeko edo erabiltzailearen ekintzei erantzuteko.

Atal honetan inprimaki baten gainean egiten diren ohikoenak diren eragiketak ikasiko ditugu.

## Inprimakiaren kontrolak lortu {#obtener-controles-formulario}

DOMeko beste edozein elementu bezala, kontrolak ohiko hautaketa-metodoen bidez lor daitezke. Orain arte ikusitako guztia kontuan hartuta, hurrengo adibideetan kontrolen zati bat hautatuko dugu eta haien balioa nola lortu ikusiko dugu.

::: mycode
[Kontrolak lortu]{.title}
```javascript
// obtener un control concreto
const password = document.querySelector("#password");
console.log(password.value);

// un checkbox o radio
const coding = document.querySelector("#coding");
console.log(coding.checked);

// una lista seleccionable
const lista = document.querySelector("#hr-select");
// valor seleccionado
console.log(lista.value);
// índice del seleccionado
let indice = lista.selectedIndex
console.log(indice);
// texto a través del índice
console.log(lista[indice].text)

// obtener todos los inputs en un array
const controles = document.querySelectorAll("input");
```
:::


Garrantzitsua da ulertzea [value]{.verbatim} atributuak itzultzen duen guztia testu bat dela; beraz, zenbaki bat espero badugu, bihurtu egin beharko dugu.

Aitzitik, [checkbox]{.verbatim} eta [radio]{.verbatim} lortzeko, [checked]{.verbatim} atributua erabili behar dugu. Atributu horrek balio boolearra itzuliko digu.

Goitibeherako zerrendetan, hautatutako [item]{.verbatim}a eta zerrendan duen kokapena lor daitezke. Zerrenda zerotik hasten da, baina normalean kokapen hori hautatzeko testu estandar baterako erabiltzen da. Kontuan izan behar da, halaber, gauza bat dela erabiltzaileari erakusten zaion [option]{.verbatim}-aren testua eta beste bat [value]{.verbatim}-aren benetako balioa.

::: exercisebox
[[17b](https://github.com/yuki/ejercicios/blob/main/daw/dec/17b.html)]{.solution}

Sortu aurretik ikusitako kontrolak dituen inprimaki bat, eta botoia sakatzean balioak lortu. Erabili [preventDefault()]{.verbatim} balioak ikusteko.
:::

## Balioak aldatu {#modificar-valores}

Kontrol baten edukia aldatu eta balio berri bat esleitu nahi badugu, aurreko atalaren antzera egiten da; desberdintasun bakarra da balioa lortu beharrean, esleitu egin behar dugula.


## Formulario osoa lortu {#obtener-formulario-completo}

Inprimaki osoa lor dezakegu.

::: {.mycode size=footnotesize}
[Formulario osoa lortu]{.title}
```javascript
const formulario = document.querySelector("#registro");
```
:::


## Inprimakietan fokua erabili {#uso-foco}

Fokuak, [focus]{.verbatim}, adierazten du zein kontrol dagoen erabiltzailearen informazioa jasotzeko prest edo une horretan erabiltzen ari den. Elementu batek fokua noiz galdu duen ere jakin dezakegu [blur]{.verbatim} erabiliz.

JavaScript-etik fokua elementu batean koka dezakegu; normalean, oso erabilgarria da balidazio-akats bat detektatzen dugunean. Aurrerago balidazioa nola egin ikusiko dugun arren, erabiltzaileak kontrol bat idazten/erabiltzen duen bakoitzean egin daiteke, edo [blur]{.verbatim}-ekin gertaera bat sor daiteke, kontrolak fokua galtzen duenean balidatzeko.

::: mycode
[Gertaera balidatzeko]{.title}
```javascript
const password = document.querySelector("#password");
password.addEventListener("blur", (e)=>{
    if (password.value.length < 7){
        alert("password corta");
    }
});
```
:::

## Kontrolak gaitzea eta desgaitzea {#habilitar-deshabilitar}

Kontrolak [disabled]{.verbatim} propietatearen bidez gaitu edo desgaitu daitezke; propietate hori boolear motakoa da. HTMLn, atributua gehitzea nahikoa da kontrola desgaituta dagoela adierazteko.

:::::::::::::: {.columns }
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```html
<input type="text" disabled>
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[Desgeitu]{.title}
```javascript
boton.disabled = true;
```
:::

:::
::::::::::::::

Eremua desgaitzen den unean, ezin izango du fokua jaso eta ez da inprimakira bidaliko.


## [readonly]{.verbatim} atributua {#atributo-readonly}

[readonly]{.verbatim} propietatea dago kontrol bat aldatu ezin dadin. Erabiltzaileak edukia irakur dezake, kontrolak fokua jaso dezake eta inprimakian bidaliko da. Adibidez, erabiltzaileari aldatu ezin izango duen ID bakarra edo erabiltzaile-izen bat esleitzen zaionean erabiltzen da.

:::::::::::::: {.columns }
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```html
<input type="text" readonly>
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[*readonly*]{.title}
```javascript
boton.readonly = true;
```
:::

:::
::::::::::::::


# HTML5 balidazioa {#validación-html5}

HTML5ek balidazio-sistema integratu bat du, JavaScript koderik idatzi gabe akats asko egiaztatzeko aukera ematen duena. Funtzionalitate horri esker, nahitaezko eremuak, barrutitik kanpoko zenbakiak, posta elektronikoaren helbide okerrak eta beste hainbat egoera detekta daitezke.

Kapitulu honetan zehar atributu horietako batzuk ikusi ditugu dagoeneko, baina hemen berriro zerrendatuko ditugu:

- [required]{.verbatim}: nahitaezko eremua.
- [minlength]{.verbatim} eta [maxlength]{.verbatim}: testuaren tamainarako.
- [min]{.verbatim} eta [max]{.verbatim}: zenbakizko eremuetarako.
- [step]{.verbatim}: zenbakizko eremua egiaztatuko du.
- [pattern]{.verbatim}: adierazitako adierazpen erregularraren bidez egiaztatuko du.

Balidazio horiek guztiak automatikoki egiten dira inprimakia bidaltzeko botoia sakatzean. Balidazio hori nabigatzaileak egiten du, eta datuak zuzenak ez badira, normalean mezu baten bidez adierazten du.

## JavaScript-etik egiaztatzea {#comprobar-validación-html5}

JavaScript-ek balidazio horren egoera ere kontsulta dezake [checkValidity()]{.verbatim} funtzioaren bidez. Funtzio horrek balio boolear bat itzultzen du.

:::::::::::::: {.columns }
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```html
<input type="text" minlength="4">
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[Egiaztatu balidazioa]{.title}
```javascript
nombre.checkValidity();
```
:::

:::
::::::::::::::

Balidazioa egoera egiaztatzeaz gain, nabigatzailearen balidazio-mezuak berriro agertzea ere behartu dezakegu.

::: mycode 
[Balidazioa erakustea]{.title}
```javascript
formulario.reportValidity();
```
:::

Eta agertzen den testua aldatu eta pertsonaliza dezakegu.

::: mycode 
[Balidazio-testua aldatzea]{.title}
```javascript
nombre.setCustomValidity(
    "Debe introducir su nombre."
);
```
:::

## CSS egoerak {#estados-css}

HTML5ek kontrol baten egoera adierazten duten pseudo-klaseak ditu. Horrela, gure gustura pertsonaliza dezakegu eta gure aplikazioaren koloreetara egokitu.

::: mycode 
[Balidaziorako CSSa]{.title}
```css
input:valid {
    border: 2px solid green;
}
input:invalid {
    border: 2px solid red;
}
```
:::


# JavaScript bidezko balidazioa {#validación-javascript}

Dagoeneko ikusi dugu HTML5ek egiaztapen automatiko ugari dituela, baina badira arau konplexuagoak behar dituzten egoerak, eta horietan JavaScript erabili beharko da. Adibidez:

- Bi pasahitz alderatzea.
- NAN bat balidatzea.
- Data bat beste bat baino beranduagokoa dela egiaztatzea.


## Denbora errealeko balidazioa {#validación-tiempo-real}

Erabiltzaileak testu-eremu batean idazten duen bitartean balidatu dezakegu:

::: mycode 
[Denbora errealeko balidazioa]{.title}
```javascript
nombre.addEventListener("input", () => {
    if (nombre.value.length < 3) {
        console.log("Nombre demasiado corto.");
    }
});
```
:::

Denbora errealean balidatzen dugunean, akatsak automatikoki detektatzen dira eta erabiltzaileari ohartaraz diezaiokegu gainerako inprimakia betetzen jarraitu aurretik. Horrela, ez ditu aldi berean izan daitezkeen akats guztiak jasoko.

## Inprimakia bidaltzean balidatzea {#validación-al-enviar}

Erabiltzaileak bidalketa-botoia sakatzean ere egin daitezke egiaztapen guztiak, inprimaki osoa bete ondoren:

::: mycode 
[Denbora errealeko balidazioa]{.title}
```javascript
formulario.addEventListener("submit", (e) => {
    if (nombre.value === "") {
        e.preventDefault();
        alert("Debe introducir un nombre.");
        nombre.focus();
    }
});
```
:::

Metodo hau erabiltzeko abantailetako bat da balidazio guztia funtzio berean egon daitekeela. Adibidean ikus daitekeen bezala, balidazioa egin da eta, balidazioa zuzena ez bada, erabiltzaileari abisua ematen zaio eta dagokion eremuan fokua jartzen da.

::: warnbox
Balidazioa [preventDefault()]{.verbatim} erabiliz egiten denean, inprimakia bidaltzea saihesten da.
:::

::: exercisebox
[[17c](https://github.com/yuki/ejercicios/blob/main/daw/dec/17c.html)]{.solution}

Sortu eremu bat denbora errealean eta eremu guztiak inprimakia bidaltzean balidatzen dituen inprimaki bat.
:::


## HTML5 eta JavaScript konbinatzea {#combinar-html5-javascript}

Aplikazio gehienetan bi teknikak erabiltzen dira: HTML5ek akats sinpleenak automatikoki balidatzen ditu, eta JavaScript-ekin aplikazioaren egiaztapen espezifikoak egiten dira. Konbinazio horrek nabarmen murrizten du beharrezkoa den kode-kopurua.


<!-- 
TODO: añadir expresiones regulares para validación
 -->


# Akats-mezuak eta erabiltzaile-esperientzia {#mensajes-error-ux}

Inprimaki bat behar bezala balidatzea ez da soilik erabiltzaileak datu okerrak sartzea eragoztea; garrantzitsua da, halaber, zer akats egin duen eta nola zuzendu dezakeen argi jakinaraztea.

Mezu egokiak erakusten dituen inprimaki bat askoz errazagoa da erabiltzeko datuak bidaltzea besterik gabe eragozten duen beste bat baino. Mezu on batek hiru galdera hauei erantzun beharko lieke:

- Zer gertatu da?
- Zergatik gertatu da akatsa?
- Nola konpon daiteke?

Akats-mezuek argiak, laburrak, zehatzak, adeitsuak eta erabiltzaile teknikoa ez den batek erraz ulertzeko modukoak izan behar dute.

::: errorbox
"*pattern mismatch*" akatsa erabilgarria izan daiteke *debugging* egiteko, baina ez erabiltzailearentzat.
:::

Aurreko ataletan erabiltzaile-esperientzia ona izateko jarraibide batzuk azaldu baditugu ere, jarraian berriro bilduko ditugu, garapenean jardunbide egokiak izateko.


## Mezuak eremuaren ondoan erakustea {#mensajes-junto-campo}

Ahal den guztietan, mezua akatsa duen kontrolaren ondoan agertu behar da. Horrela, erabiltzaileak berehala identifikatuko du zein datu zuzendu behar duen. Horretarako, hasieran ezkutatuta dauden HTML elementuak erabil daitezke, eta, akatsen bat dagoenean, elementu horiek erakutsi:

:::::::::::::: {.columns columnsep="0.5cm"}
::: {.column width="37%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```html
<label for="nombre">
    Nombre
</label>

<input
    id="nombre"
    type="text">

<span id="errorNombre" 
      class="hidden error">
</span>
```
:::

:::
::: {.column width="63%" }

::: {.mycode size=footnotesize}
[Balidazio egiaztatu]{.title}
```javascript
const nombre = document.querySelector("#nombre");
if (nombre.value === ""){
  const er = document.querySelector("#errorNombre");
  er.textContent = "Debe introducir un nombre.";
  er.mensaje.classList.replace("hidden", "");
}
```
:::

:::
::::::::::::::

Balidazioa denbora errealean egiten ari bada, erabiltzaileak akatsa zuzendu ondoren, akats-mezua desagertu egin behar da.

### Eremua nabarmentzea {#resaltar-campo}

Akats-mezuaz gain, kontrola beste kolore batekin bisualki adieraztea gomendatzen da, akatsa zein eremuk duen nabarmentzeko. Aurretik adierazi dugu HTML5ek CSS klase berezi batzuk dituela, baina gure klase propioak ere sor ditzakegu.

:::::::::::::: {.columns }
::: {.column width="50%"}
::: {.mycode size=footnotesize}
[HTML]{.title}
```css
.error {
    border: 2px solid red;
}
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[JavaScript]{.title}
```javascript
// añadir y quitar clase
nombre.classList.add("error");
nombre.classList.remove("error");
```
:::

:::
::::::::::::::

Hurrengo irudian erabiltzailearen erregistro-inprimakia ikus daiteke. Bertan, akats-mezu guztiak inprimakiaren hasieran erakustea eta akatsa duten eremuak nabarmentzea aukeratu da.

![Balidazio-akatsak](img/dec/validacion-errores.png){width="50%" framed=true}


## Ez ezabatu sartutako informazioa {#no-borrar-información}

Inprimakiak akatsak dituenean, erabiltzaileak eremu okerrak soilik zuzendu ahal izatea espero du. Ez luke beharrezkoa izan behar datu guztiak berriro idaztea. Horregatik, normalean ez da inprimakia hustu behar balidazioak huts egiten duenean.

::: warnbox
Erabilgarritasunerako garrantzitsua da balidazioa egitean betetako eremuak ez hustea.
:::

## Eremuan fokua jartzea {#poner-foco}

Aurretik ikusi dugu gomendagarria dela balidatu den eta akatsa duen eremuan kurtsorea jartzea. Horrela, inprimakia handia bada, erabiltzailea berehala has daiteke akatsa zuzentzen.


# Inprimakiekin ariketak {#ejercicios-formularios}

Unitate honetan zehar HTML inprimakiak sortzen, haien kontrolak JavaScript-etik atzitzen eta erabiltzaileak sartutako informazioa balidatzen ikasi dugu. Atal honetan ezagutza horiek guztiak bilduko ditugu hainbat ariketa garatuz.

Helburua ez da benetako aplikazio bat sortzea, baizik eta adibide bakar batean web-garapenean gehien erabiltzen diren teknikak integratzea.

::: exercisebox
[[17d](https://github.com/yuki/ejercicios/blob/main/daw/dec/17d.html)]{.solution}

Sortu eremu hauek dituen inprimaki bat:

- Izena
- Posta elektronikoa
- Adina
- Pasahitza
- Pasahitzaren berrespena
- Erabilera-baldintzen onarpena

Bidali aurretik, honako hauek egiaztatuko dira:

- Nahitaezko eremu guztiak beteta egotea.
- Erabiltzailea adin nagusikoa izatea.
- Bi pasahitzak bat etortzea.
- Erabilera-baldintzak onartu izana.

Erabili HTMLren eta zure balidazioa, eta akatsen bat badago, akatsak erakutsi eta CSSa aldatu.
:::


::: exercisebox
[[17e](https://github.com/yuki/ejercicios/blob/main/daw/dec/17e.html)]{.solution}

Sortu ikastetxearen webgunerako inprimaki bat, ikasle berriak erregistratzeko. Honako hauek izan behar ditu:

- Izena
- Abizenak
- Posta elektronikoa
- Adina
- Ikasturtea
- Txanda (goizez edo arratsaldez)
- Iruzkinak
- Pribatutasun-politikaren onarpena

Inprimakiak baldintza hauek bete beharko ditu:

- Eremu guztiak nahitaezkoak izango dira, "Iruzkinak" izan ezik.
- Adinak 16 eta 99 urte artekoa izan beharko du.
- Posta elektronikoak HTML5eko sarrera-mota egokia erabili beharko du.
- Ikasleak pribatutasun-politika onartu beharko du.
- Akatsen bat badago, arazoa adierazten duen mezu bat erakutsiko da eta inprimakia ez da bidaliko.
- Datu guztiak zuzenak badira, erregistroa behar bezala egin dela adierazten duen mezu bat agertuko da.
- Inprimakiak CSS bidezko diseinu sinplea izan beharko du.
:::
