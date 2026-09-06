
# Fetch API {#fetch-api}

**Fetch API** nabigatzaileak eskaintzen duen interfaze bat da, HTTP eskaerak modu asinkronoan egiteko aukera ematen duena. Bere funtzio nagusia web-zerbitzariekin komunikatzea da, honako hauek egiteko:

- Informazioa deskargatzeko.
- Inprimakiak bidaltzeko.
- REST API bat kontsultatzeko.
- Fitxategiak igotzeko.
- Zerbitzari bateko informazioa ezabatzeko.

[fetch()]{.verbatim} funtzioak **Promise** bat itzultzen du. Beraz, aurreko kapituluan ikusitako guztia erabili ahal izango dugu: [.then]{.verbatim}, [.catch]{.verbatim}, [async]{.verbatim} eta/edo [await]{.verbatim}.

## JavaScript-eko komunikazio asinkronoen bilakaera {#evolución-peticiones-javascript}

JavaScript-en lehen urteetan ez zegoen nabigatzailetik HTTP eskaerak egiteko modu errazik, orri osoa berriro kargatu gabe. Horretarako, **[XMLHttpRequest](https://es.wikipedia.org/wiki/XMLHttpRequest) (XHR)** agertu zen, Microsoft-ek 1999an Internet Explorer 5.0-n aurkeztutako APIa ([ActiveX](https://es.wikipedia.org/wiki/ActiveX) erabiliz). Ondoren, Mozilla 2002an eta Safari 2004an batu ziren. 2006an, [W3C](https://en.wikipedia.org/wiki/World_Wide_Web_Consortium) erakundeak estandar bat sortzeko lehen zirriborroa aurkeztu zuen.

Teknologia horretatik **AJAX** (*Asynchronous JavaScript and XML*) terminoa sortu zen. Garrantzitsua da azpimarratzea **AJAX ez dela liburutegi bat, ezta funtzio bat ere**, baizik eta garapen-teknika bat. Teknika horrek JavaScript eta XMLHttpRequest erabiltzen ditu zerbitzariarekin informazioa trukatzeko, orria berriro kargatu gabe.

Garai hartan, XML erabiltzea zen "makinen arteko" komunikaziorako (sare bidez) de facto formatu estandarra; hortik dator bere izenean XML aipatzea. Denborarekin, **JSON** formatuak XML ordezkatu zuen ia erabat, sinpleagoa delako.

AJAXen ospe handieneko garaian, nabigatzaileen arteko bateragarritasuna izan zen garatzaileentzako arazo nagusietako bat. Guztiek XMLHttpRequest APIa eskaintzen bazuten ere, desberdintasunak zeuden haren inplementazioan eta portaeran, bereziki Internet Explorer, Firefox, Opera eta WebKit-en oinarritutako lehen nabigatzaileen artean.

**[jQuery](https://en.wikipedia.org/wiki/JQuery)**-k zeregin hori asko sinplifikatu zuen, AJAX eskaerak egiteko interfaze bakarra eskaintzen baitzuen, hala nola [\$.ajax()]{.verbatim}, [\$.get()]{.verbatim} edo [\$.post()]{.verbatim} funtzioen bidez. Horrela, kode berak oso antzeko moduan funtzionatzen zuen nabigatzaile desberdinetan, eta garatzaileak ez zuen horietako bakoitzerako soluzio espezifikorik programatu behar.

ECMAScript modernoaren etorrerarekin **Fetch API** agertu zen. HTTP eskaerak egiteko modu askoz errazagoa eta irakurgarriagoa eskaintzen du, eta nabigatzaile guztiek betetzen duten estandarra da.


| Teknologia | Zer da? | Egungo egoera |
|------------|----------|----------------|
| **XMLHttpRequest (XHR)** | HTTP eskaerak egiteko nabigatzailearen APIa. | Oraindik bateragarria da, baina gero eta gutxiago erabiltzen da. |
| **AJAX** | Hasiera batean `XMLHttpRequest`-en oinarritutako garapen-teknika. | Kontzeptuak indarrean jarraitzen du, nahiz eta normalean `fetch()` erabiliz inplementatzen den. |
| **Fetch API** | Promesetan oinarritutako HTTP eskaerak egiteko API modernoa. | Egungo web-garapenean gomendatutako aukera da. |

Table: {tablename=yukitblr colspec=X[1,l]X[2,l]X[2,l]}

## Eskaera sinple bat egin {#hacer-petición-simple}

Modurik errazena baliabidearen/zerbitzariaren helbidea bakarrik adieraztea da eta, esan bezala, *Promise* bat itzultzen duenez, kasu honetan [then]{.verbatim} erabiliko dugu erantzuna lortzeko.

::: mycode
[Fetch eskaera egin]{.title}
```javascript
fetch("https://jsonplaceholder.typicode.com/users")
.then((respuesta) => {
    console.log(respuesta);
});
```
:::

Aldagaia [respuesta]{.verbatim} zerbitzariari egindako HTTP erantzunari buruzko informazioa dauka, **ez ditu behar ditugun datuak**.

::: errorbox
[fetch]{.verbatim} egitean, lehenik HTTP erantzuna lortzen dugu; **ez ditu bilatzen ari garen datuak**.
:::

### [Response]{.verbatim} objektua {#objeto-response}

[fetch()]{.verbatim}-ek itzultzen duen erantzuna [Response]{.verbatim} motako objektu bat da. Objektu horrek honako informazioa dauka, besteak beste:

- [status]{.verbatim}: HTTP eskaeraren [erantzun-kodea](https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Status).
  - 200: eskaera zuzena.
  - 201: baliabidea sortu da.
  - 301: behin betiko lekuz aldatu da.
  - 401: baimenik gabe.
  - 404: baliabidea ez da aurkitu.
  - 418: teontzi bat naiz.
  - 500: barne-zerbitzariaren errorea.
- [ok]{.verbatim}: boolear bat itzultzen du eskaera zuzena izan den jakiteko (200 eta 299 artean).
- [headers]{.verbatim}: HTTP goiburuak.
- Eduki-mota.
- Erantzunaren gorputza.

::: mycode
[Response objektua]{.title}
```javascript
fetch("https://jsonplaceholder.typicode.com/users")
    .then((respuesta) => {
        console.log(respuesta.status);
        console.log(respuesta.ok);
        if (!respuesta.ok) {
            throw new Error("Error en la petición.");
        }
    });
```
:::

### Edukia lortu {#obtener-contenido}

Zerbitzariari eskatu dizkiogun datuak lortzeko, lehenik erantzuna formatu egoki batera bihurtu behar dugu. Ondorengo [metodoen](https://developer.mozilla.org/en-US/docs/Web/API/Response#instance_methods) artean aukera dezakegu:

- [json()]{.verbatim}: datuak JSON formatura bihurtzen ditu. **APIekin komunikatzeko metodoa**.
- [text()]{.verbatim}: testu arrunt gisa lortzen du.
- [blob()]{.verbatim}: fitxategi bitarretarako (irudiak, bideoak, fitxategiak).
- [arrayBuffer()]{.verbatim}: bitar gordinetarako, fitxategien manipulazio aurreraturako.
- [formData()]{.verbatim}: inprimakietarako.


JSON formatua aukeratuko dugu; horrela, datuak modu errazagoan atzitu ahal izango ditugu, JavaScript-ekin erraz kudeatzeko moduko objektu bihurtuko baitira.

[json()]{.verbatim}-i egindako deiak ere promesa bat itzultzen du. Horregatik, bigarren [then()]{.verbatim} bat edo bigarren [await]{.verbatim} bat beharko dugu, aukeratutako moduaren arabera.

::: errorbox
[json()]{.verbatim}-i egindako deiak ere promesa bat itzultzen du.
:::

:::::::::::::: {.columns }
::: {.column width="40%"}

::: {.mycode size=footnotesize}
[Promise-ekin]{.title}
```javascript
fetch(URL)
  .then((respuesta) => {
    return respuesta.json();
  })
  .then((datos)=>{
    console.log(datos)
  })
  .catch((error)=> {
    console.log(error);
  });
```
:::

:::
::: {.column width="55%" }

::: {.mycode size=footnotesize}
[Async / await]{.title}
```javascript
async function cargarUsuarios() {
  const respuesta = await fetch(URL);
  const usuarios = await respuesta.json();
  console.log(usuarios);
}

cargarUsuarios();
```
:::

:::
::::::::::::::


## Erroreen kudeaketa {#gestión-errores-fetch}

Eskaerak egitean erroreak kudeatzeko, [try...catch]{.verbatim} erabiliko dugu.

::: mycode
[Eskaeren erroreak kudeaketa]{.title}
```javascript
const URL = "https://jsonplaceholder.typicode.com/users";

async function cargarDatos() {
    try {
        const respuesta = await fetch(URL);
        const datos = await respuesta.json();
        console.log(datos);
    }
    catch(error){
        console.error(error);
    }
}
```
:::

::: exercisebox
[[19a](https://github.com/yuki/ejercicios/blob/main/daw/dec/19a.html)]{.solution}

Sortu 2 botoi, eta bakoitzak API batera deitu behar du promesak eta async/await erabiliz, datuak hurrenez hurren lortzeko.
:::


# REST APIekiko komunikazioa {#comunicación-api-rest}

Fetch-en aplikazio garrantzitsuenetako bat **REST APIekin** komunikatzea da. Gaur egun, web-, mugikor- eta mahaigaineko aplikazio gehienek zerbitzu mota hauek erabiltzen dituzte informazioa trukatzeko.

[API](https://en.wikipedia.org/wiki/API) (*Application Programming Interface*) bi programaren arteko komunikazioa ahalbidetzen duen arau-multzoa da. API batek honako hauek definitzen ditu:

- Zer eragiketa egin daitezkeen.
- Nola bidali behar diren datuak.
- Zer erantzun itzuliko dituen zerbitzariak.


## API baliabideak {#recursos-api}

API batek informazioa baliabideetan antolatu ohi du, eta baliabide horietako bakoitzak URL espezifiko bat du. Datu *fake* dituen [{JSON} Placeholder](https://jsonplaceholder.typicode.com/) API publikoa adibide gisa hartuta, baliabideak hauek izango lirateke:

- [/users](https://jsonplaceholder.typicode.com/users): erabiltzaile guztiak lortzea.
  - [/users/1](https://jsonplaceholder.typicode.com/users): 1 IDa duen erabiltzailea lortzea.
- [/posts](https://jsonplaceholder.typicode.com/posts): *post* guztiak lortzea.
  - [/posts/1/comments](https://jsonplaceholder.typicode.com/posts/1/comments): 1 IDa duen *post*-aren iruzkinak lortzea.
- [/comments](https://jsonplaceholder.typicode.com/comments): iruzkin guztiak lortzea.

Normalean, API publikoek web-interfaze bat izaten dute, kontsumitu ditzakegun datu-ereduak eta metodoak/baliabideak erakusteko. Ohikoa da [OpenAPI](https://es.wikipedia.org/wiki/Especificaci%C3%B3n_OpenAPI) zehaztapena erabiltzea. Adibidez:

- [Swagger](https://swagger.io/): web-interfazea. Adibide bat [OpenData Euskadi](https://opendata.euskadi.eus/api-culture/?api=culture_events#/) atarian ikus dezakegu.
- [Scalar](https://github.com/scalar/scalar): web-interfaze modernoagoa.

<!-- TODO: quitar scalar? -->

## Zer esan nahi du RESTek? {#qué-es-rest}

[REST](https://en.wikipedia.org/wiki/REST) (*Representational State Transfer*) web-zerbitzuak sortzeko diseinu-estilo bat da. REST API batean baliabide bakoitzak helbide bat (URL) du, eta HTTP metodoen bidez manipulatzen da.

API batekin komunikatzeko erabiltzen diren [HTTP metodoak](https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Methods) hauek dira, nahiz eta beste batzuk ere badauden:

| Metodoa | URLa | Ekintza |
|--------|--------------|------------------------------|
| GET    | /users       | Erabiltzaile guztiak itzultzen ditu. |
| GET    | /users/15    | 15 IDa duen erabiltzailea itzultzen du. |
| POST   | /users       | Erabiltzaile berri bat sortzen du. |
| PUT    | /users/15    | Lehendik dagoen baliabide bat ordezkatzen du. |
| PATCH  | /users/15    | Baliabide bat partzialki aldatzen du. |
| DELETE | /users/15    | Erabiltzaile hori ezabatzen du. |

Table: {tablename=yukitblr colspec=X[1,l]X[1,l]X[2,l]}

2026ko ekainera arte, [QUERY](https://http.dev/query) metodo berri bat proposatu da, [RFC 10008](https://datatracker.ietf.org/doc/rfc10008/) dokumentuan zehaztuta. Bideo honetan, [[midudev](https://www.youtube.com/watch?v=b0oiR_UOvVg)]{.youtube}-ek etorkizunean nola funtzionatuko duen azaltzen du.


# REST API oso bat kontsumitzea {#consumo-api-rest}

Orain arte, [fetch()]{.verbatim} bidez HTTP eskaerak egiten eta erantzunak promesak eta [async]{.verbatim} / [await]{.verbatim} erabiliz prozesatzen ikasi dugu. Orain, aurretik ikusitako kontzeptuak biltzen dituen adibide oso bat garatuko dugu. Horretarako, [{JSON} Placeholder](https://jsonplaceholder.typicode.com/) API publikoa erabiliko dugu, eta honako hauek egiteko gai izango den aplikazio txiki bat eraikiko dugu:

- Zerbitzaritik informazioa lortzea.
- Datuak HTML taula batean erakustea.
- Erregistro berriak sortzea.
- Lehendik dauden erregistroak aldatzea.
- Erregistroak ezabatzea.

## Datuak [GET]{.verbatim} bidez lortzea {#obtener-datos-get}

Erabiltzaileen zerrenda deskargatuko dugu. Horretarako, aurretik ikusi dugun bezala, [fetch()]{.verbatim} eskaera bat egingo dugu:

::: mycode
[Erabiltzaileak lortu]{.title}
```javascript
async function cargarUsuarios() {
    try {
        const respuesta = await fetch(
            "https://jsonplaceholder.typicode.com/users"
        );
        if (!respuesta.ok) {
            throw new Error("Error al obtener los usuarios.");
        }
        const usuarios = await respuesta.json();
        console.log(usuarios);
    }
    catch (error) {
        console.error(error);
    }
}
```
:::


## Datuen erakusketa {#mostrar-datos}

Erabiltzaileak lortu ondoren, array-a zeharkatu eta HTML taula batean txerta ditzakegu.



:::::::::::::: {.columns }
::: {.column width="40%"}

::: {.mycode size=footnotesize}
[HTML taula]{.title}
```html
<table>
  <thead>
    <tr>
      <th>Id</th>
      <th>Nombre</th>
      <th>Email</th>
    </tr>
  </thead>
  <tbody id="usuarios">
  </tbody>
</table>
```
:::

:::
::: {.column width="55%" }

::: {.mycode size=footnotesize}
[Txertatu data taulan]{.title}
```javascript
for (const usuario of usuarios) {
  const fila = document.createElement("tr");
  // TODO: cambiar innerHTML por createElement
  fila.innerHTML = `
      <td>${usuario.id}</td>
      <td>${usuario.name}</td>
      <td>${usuario.email}</td>
  `;
  tbody.appendChild(fila);
}
```
:::

:::
::::::::::::::


## Erregistro berri bat sortzea [POST]{.verbatim} bidez {#crear-registro}

Erabiltzaile berri bat sortzeko, **POST** metodoa erabili behar dugu. Datuak inprimaki baten bidez lor ditzakegu ([behar bezala balidatuta](#validación-javascript)).


::: {.mycode size=footnotesize}
[Erregistro berria sortu POST-ekin]{.title}
```javascript
const usuario = {
    name: "Alice",
    email: "alice@example.com"
};
const respuesta = await fetch(
    "https://jsonplaceholder.typicode.com/users",
    {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(usuario)
    }
);
```
:::

Jarraian, [fetch()]{.verbatim} metodo honen arteko aldea azaltzen da, aurretik ikusitakoaren zertxobait desberdina baita. Orain, bigarren parametro bat jasotzen du, [aukerekin](https://developer.mozilla.org/en-US/docs/Web/API/Window/fetch#options):

- **URLa**: orain arte ikusi dugun bezala, eskaera egingo dugun URLa adierazi behar dugu.
- **[options]{.verbatim}**: hainbat aukera dituen objektua:
  - **[method]{.verbatim}**: eskaera egitean erabiliko den metodoa; kasu honetan, **POST**.
  - **[headers]{.verbatim}**: eskaera egitean bidal daitezkeen [HTTP goiburuak](https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Headers).
    - **[Content-Type]{.verbatim}**: bidaliko den eduki mota. Normalean, APIak erabiltzean JSON erabiltzen da.
  - **[body]{.verbatim}**: eskaerarekin batera bidaltzen den edukia; kasu honetan, erabiltzaile berri baten datuak.

JavaScript-eko objektuak ezin dira zuzenean HTTP bidez bidali; lehenik, JSON kate bihurtu behar dira. Horretarako, [JSON.stringify()]{.verbatim} funtzioa dago, objektua JSON formatura bihurtzen duena.


## Erregistro bat aldatzea ([PUT]{.verbatim} / [PATCH]{.verbatim}) {#modificar-registro}

Informazio-erregistro bat aldatzeko orduan, bi metodo erabil ditzakegu:

- **PUT**: baliabidea erabat ordezkatzen du.
- **PATCH**: eremu batzuk soilik aldatzea ahalbidetzen du.
- 

:::::::::::::: {.columns columnsep="0.5cm"}
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[PUT metodoa]{.title}
```javascript
await fetch(
  "https://URL/users/3",
  {
    method: "PUT",
    headers: {
      "Content-Type":"application/json"
    },
    body: JSON.stringify({
      id:3,
      name:"María",
      email:"maria@example.com",
      // resto de campos
    })
  }
);
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[PATCH metodoa]{.title}
```javascript
await fetch(
  "https://URL/users/3",  
  {
    method: "PATCH",
    headers: {
      "Content-Type":"application/json"
    },
    body: JSON.stringify({
      email:"nuevo@email.com"
    })
  }
);
```
:::

:::
::::::::::::::

::: warnbox
[{JSON} Placeholder](https://jsonplaceholder.typicode.com/) zerbitzuak ez du aldaketarik egitea ezta datuak ezabatzea ere ahalbidetzen, baina eskaerei behar bezala erantzungo die.
:::

## Erregistro bat ezabatzea [DELETE]{.verbatim} bidez {#eliminar-registro}

Baliabide bat ezabatzeko, **DELETE** HTTP metodoa erabiltzen dugu. Eragiketa behar bezala amaitzen bada, baliabidea ezabatuta egongo da.


::: mycode
[DELETE metodoa]{.title}
```javascript
await fetch(
    "https://jsonplaceholder.typicode.com/users/3",
    {
        method:"DELETE"
    }
);
```
:::

::: errorbox
Azken adibideetan ez dugu [try...catch]{.verbatim} erabili, ezta eskaeraren egoera egiaztatu ere, adibideak sinplifikatzeko. **Baina erabili egin behar dira**.
:::

::: exercisebox
[[19b](https://github.com/yuki/ejercicios/blob/main/daw/dec/19b.html)]{.solution}

Sortu orri bat, beharrezkoa denean honako **[fetch]{.verbatim}** eskaerak egiten dituena:

- Erabiltzaileak lortu eta taula batean txertatu.
  - Errenkada bakoitzak "Ekintzak" izeneko zutabe bat izango du, eta bi botoi izango ditu:
    - "**Editatu**": erabiltzailearen datuak editatzeko (inprimaki bat duen leiho modala irekiko du).
    - "**Ezabatu**": erabiltzaile zehatza ezabatzeko. Errenkada ezabatuko du.
  - "Erabiltzailea gehitu" botoiak inprimaki bat duen leiho modala irekiko du, erabiltzaile bat sortzeko.
    - Eremuak balidatuta egongo dira.
    - Nabigatzailearen mezuak aldatuko dira.
    - Taularen amaieran gehituko da.
:::


# REST APIetarako garapen-tresnak {#herramientas-desarrollo-APIs}

Orain arte, [fetch()]{.verbatim} erabiliz HTTP eskaerak egiten ikasi dugu. Hala ere, aplikazio batek behar bezala funtzionatzen ez duenean, ezinbestekoa da nabigatzailearen eta zerbitzariaren artean zer gertatzen ari den jakitea.

## Nabigatzailearen garatzaile-tresnak {#herramientas-navegador}

Nabigatzaile moderno guztiek **Garatzaile-tresnak** (*Developer Tools* edo, besterik gabe, *DevTools*) izenez ezagutzen diren tresna multzo bat dute.

Tresna horiek HTML kodea, CSS estilo-orriak, JavaScript kodea, HTTP eskaerak eta web-orri baten errendimendua ikuskatzeko aukera ematen dute. Bereziki **Network** fitxan jarriko dugu arreta, ezinbesteko tresna baita REST APIekin lan egiteko. Nabigatzaileak zerbitzari desberdinekin egiten dituen komunikazio guztiak erakusten dizkigu.

Orri batek fitxategi bat deskargatzen duen edo HTTP eskaera bat egiten duen bakoitzean, erregistro berri bat agertuko da. Adibidez:

- HTML orri bat.
- CSS fitxategi bat.
- JavaScript fitxategi bat.
- Irudi bat.
- Letra-tipo bat.
- [fetch()]{.verbatim} eskaera bat.
- AJAX dei bat.

### Lortutako informazioa {#información-obtenida}

Aplikazio batek datuak kargatzen ez dituenean, erroreak itzultzen dituenean edo informazio zuzena erakusten ez duenean, *Network* fitxan zer gertatzen ari den ikus dezakegu. Erakusten digun informazioaren artean, honako hauek nabarmendu ditzakegu:

- Eskaeraren HTTP metodoa.
- Status: eskaeraren egoera.
- Dokumentu mota.
- Komunikazioa nork hasiarazi duen (HTML kodearen lerroa, JavaScript kodearena edo CSS bat ager daiteke, irudi edo letra-tipo bat bada).
- Erantzunaren tamaina.
- Erantzuna prozesatzeko erabilitako denbora.

Zutabe gehiago ere gehi ditzakegu, eta, horrela, are informazio gehiago lortu.

### Emaitzak iragaztea {#filtrar-resultados}

Nabigatzaileak eskaera moten artean iragazteko eta izenaren arabera bilatzeko aukera ematen digu. APIekin lan egitean interesatzen zaigun iragazkia **"Fetch/XHR"** da; izan ere, JavaScript-ek egindako eskaerak soilik erakutsiko ditu.


### HTTP eskaeren ikuskapena {#inspección-peticiones}

Eskaera bat hautatzean, informazio zehatza duten hainbat fitxa agertzen dira.

Garrantzitsuenak hauek dira:

- **Headers**: Eskaeraren informazio orokorra dauka. Hurrengo ataletan banatzen da:
  - **Response Headers**: Atal honetan **zerbitzaritik** jasotako goiburuak agertzen dira.
  - **Request Headers**: **Nabigatzaileak bidalitako** goiburuak.
- **Payload**: Eskaerak datuak bidaltzen baditu (adibidez, [POST]{.verbatim} edo [PUT]{.verbatim} bidez), zehazki zer informazio bidali den kontsulta dezakegu.
- **Preview**: Erantzuna interpretatuta erakusten du. HTML bat bada, dokumentua; irudi bat bada, irudia bera; eta JSON bada, antolatuta ikus dezakegu.
- **Response**: Edukia zerbitzariak bidali duen bezala erakusten du.



## APIak probatzeko tresnak

Aplikazio baten garapenean, probak nabigatzailetik edo garatzen ari garen aplikaziotik bertatik egitea ez da beti praktikoa. Askotan komenigarria da HTTP eskaerak zuzenean API batera bidaltzea eta lortutako erantzunak aztertzea ahalbidetzen duten tresnak erabiltzea.

Aplikazio horiek eskaerak bidaltzea errazten dute, HTTP goiburuak, parametroak eta autentifikazioa gehitzeko aukera ematen dute, eta zerbitzariaren erantzunak modu argian ikusteko aukera ere bai. Gainera, eskaerak proiektuen/*endpoint*-en araberako bildumetan gorde daitezke.

Dauden aplikazioen artean, honako hauek nabarmendu ditzakegu: [Postman](https://www.postman.com/), Firecamp ([web](https://firecamp.dev/) edo [mahaigaineko bertsioa](https://github.com/firecamp-dev/firecamp)), [Bruno](https://www.usebruno.com/) edo [Insomnia](https://insomnia.rest/).


![](img/laravel/postman.png){width="70%"}


**Linux kontsola** batetik, **curl** komandoa erabiliz, *endpoint*-a funtzionatzen ari den ere azkar egiazta dezakegu:

::: mycode
[curl-en erabilera kontsolan]{.title}
```console
ruben@vega:~$ curl -s  http://localhost/api/posts
{"posts":[{"id":1,"titulo":"Primer post111","texto":"Este es...”}]}
```
:::

Emaitza ikusgarriagoa lortu nahi badugu, **jq** komandoa erabil dezakegu, eta horretarako instalatu egin beharko dugu. Horrela, honako hau egin ahal izango dugu:

::: mycode
["jq" komandoa emaitza formateatzeko]{.title}
```console
ruben@vega:~$ curl -s  http://localhost/api/posts | jq
{
  "posts": [
    {
      "id": 1,
      "titulo": "Primer post",
      "texto": "Este es el texto del primer post",
      "publicado": 1,
      "deleted_at": null,
      "created_at": "2024-10-29T17:09:56.000000Z",
      "updated_at": "2024-10-29T18:09:56.000000Z"
    }
  ]
}
```
:::

Tresna hauek APIak garatzeko eta arazteko oso erabilgarriak diren arren, komeni da gogoratzea ez dutela [fetch()]{.verbatim} ordezkatzen. Haien helburua web-zerbitzu batek behar bezala funtzionatzen duela egiaztatzea da, gure JavaScript aplikazioan integratu aurretik. Tresna hauekin APIa egiaztatu ondoren, hurrengo urratsa gure kodetik API horretara **Fetch API** erabiliz sartzea da.
