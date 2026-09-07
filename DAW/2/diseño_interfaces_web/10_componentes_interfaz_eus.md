
# Interfazearen osagaiak {#componentes-interfaz}

Orain arte HTML, CSS, Flexbox, Grid eta responsive diseinua erabiliz web-orriak eraikitzen ikasi dugu. Hala ere, erabiltzaile-interfazea ez da elementuen banaketa hutsa: ia edozein web-aplikaziotan agertzen diren **osagai berrerabilgarriek** osatzen dute.

**Goiburu** bat, **menu** bat, **txartel** bat edo **inprimaki** bat interfazearen osagaien adibideak dira. Bakoitzak arazo zehatz bat konpontzen du eta proiektu bereko hainbat web-orritan berrerabil daiteke.


## Goiburuak [<header>]{.verbatim} {#cabeceras}

**Goiburua** (*header*) web-orri baten goiko eremua da. Normalean, gunearen identitatea, nabigazio nagusia eta, batzuetan, bilatzailea edo erabiltzailearen sarbidea bezalako tresnak izaten ditu.

Edozein interfazeren osagai garrantzitsuenetako bat da; izan ere, normalean gune bereko web-orri guztietan agertzen da eta erabiltzailearentzako nabigazio-puntu nagusia da.

HTMLn badago goiburua adierazteko elementu semantiko espezifiko bat: [<header>]{.verbatim}. Elementu horrek adierazten du edukia web-orri baten edo atal baten sarrera-zatiari dagokiola. Goiburu batek honako hauek izan ditzake:

- Gunearen logotipoa edo izena.
- Nabigazio-menua.
- Bilatzailea.
- Erabiltzailearen ikonoak.
- Sarbide-botoiak.

Ez dago diseinu zuzen bakar bat; garatzen ari garen aplikazio-motaren araberakoa izango da. Adibiderik sinpleenak gunearen izena soilik erakutsiko luke, baina gaur egun webgune batek hainbat atal izan ohi ditu, nabigazio-barra baten bidez atzitu daitezkeenak:


:::::::::::::: {.columns}
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```html
<header class="header">
  <h1 class="logo">MiWeb</h1>
  <nav>
    <a href="#">Inicio</a>
    <a href="#">Cursos</a>
    <a href="#">Blog</a>
    <a href="#">Contacto</a>
  </nav>
</header>
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[CSS]{.title}
```css
.header {
    display: flex;
    justify-content: space-between;
    align-items: center;

    padding: 1rem 2rem;

    background-color: #1f2937;
}

.logo {
    margin: 0;
    color: white;
}

.header nav {
    display: flex;
    gap: 1.5rem;
}

.header a {
    color: white;
    text-decoration: none;
}
```
:::

:::
::::::::::::::


[Flexbox](#flexbox) aukera onena da mota honetako banaketa horizontaletarako.



## Nabigazio-menuak [<nav>]{.verbatim}-rekin {#elemento-nav}

**Nabigazio-menua** [<nav>]{.verbatim} erabiltzaileari webgune bateko web-orri edo atal desberdinen artean nabigatzeko aukera ematen dion osagaia da. Goiburuarekin batera, erabiltzaile-esperientziaren elementu garrantzitsuenetako bat da, edukira sarbidea errazten duelako eta aplikazioaren egitura ulertzen laguntzen duelako.

Aurreko adibidean dagoeneko sortu dugu goiburuaren barruan [<nav>]{.verbatim} elementu semantikoa. Elementu horrek irisgarritasuna hobetzen du eta pantaila-irakurleei gunearen nabigazio nagusia identifikatzen laguntzen die.

Web-orri batek hainbat [<nav>]{.verbatim} elementu izan ditzake nabigazio-bloke desberdinak badaude: adibidez, menu nagusi bat eta beste bat orri-oinean.

Ikuspegi semantikotik, menu batek erlazionatutako elementuen multzoa adierazten du. Horregatik, oso ohikoa da zerrenden bidez eraikitzea.

:::::::::::::: {.columns}
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```html
<nav>
  <a href="#" class=active>Inicio</a>
  <!-- ... -->
</nav>
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[CSS]{.title}
```css
.active {
  border-bottom: 2px solid white;
}
```
:::

:::
::::::::::::::


### Nabigazioaren erabilgarritasuna {#usabilidad-navegación}

Nabigazio-menuen garrantzia kontuan hartuta, garrantzitsua da erabiltzaileari zein ataletan dagoen adieraztea. Beraz, goiburuan, gauden atalean estilo propio bat gehitu ohi da, argi eta garbi ikus dadin.

:::::::::::::: {.columns}
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```html
<header class="header">
  <h1 class="logo">MiWeb</h1>
  <nav>
    <ul class="menu">
      <li><a href="#">Inicio</a></li>
      <li><a href="#">Cursos</a></li>
      <li><a href="#">Blog</a></li>
      <li><a href="#">Contacto</a></li>
    </ul>
  </nav>
</header>
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[CSS]{.title}
```css
.menu {
  display: flex;
  gap: 1.5rem;
  list-style: none;
  padding: 0;
  margin: 0;
}
.menu a {
  text-decoration: none;
}
```
:::

:::
::::::::::::::


Interfazea erabiltzaileak harekin elkarreragiten duenean feedbacka eman behar du. Horretarako, nabigazioan [:hover]{.verbatim} efektua erabiltzen da normalean, kolorea, adibidez, aldatzeko CSS arau bereziekin.

::: {.mycode size=footnotesize}
[[:hover]{.verbatim} efektua]{.title}
```css
nav a:hover {
    color: #2563eb;
}
```
:::


### Goiburu *responsive* {#cabecera-responsive}

Garrantzitsua da, orain arte ikusitako guztia kontuan hartuta, goiburua gailu desberdinetan nola bistaratzea nahi dugun kontuan hartzea. Beraz, *responsive* egin behar dugu, gailu bakoitzera egokitu dadin. Normalean:

- Gailu mugikorretan, goiburuak eta nabigazio-estekek antolaketa bertikala dute.
- Mahaigaineko nabigatzaileetan, zabalera osoa hartzen dute, logoa ezkerrean dago eta nabigazio-estekak elkarren segidan, erdian edo eskuin-eskuinean egon daitezke.


::: exercisebox
[[09a](https://github.com/yuki/ejercicios/blob/main/daw/diw/09a.html)]{.solution}

Sortu web-orri erreal baten antza duen HTML orri bat, goiburu batekin. Honako hauek izan behar ditu:

- Orriaren izena edo logotipoa.
- 3-4 estekako nabigazio-menua.
- Bilaketa-koadroa.
- Sarbidea egiteko edo saioa hasteko botoia.

Gehitu [:hover]{.verbatim} efektua menuari, eta erakutsi aplikazioaren zein orritan gauden.
:::



# Alboko barrak {#barras-laterales}

**Alboko barra** (*sidebar*) pantailaren alboetako batean nabigazio-aukerak, tresnak edo bigarren mailako informazioa biltzen dituen interfazearen osagaia da. Oso ohikoa da administrazio-panel, hezkuntza-plataforma, eduki-kudeatzaile eta enpresa-aplikazioetan.

Goiburuan kokatu ohi den menu nagusiak ez bezala, alboko barrak aukera ugari antolatzeko aukera ematen du, espazio bertikala okupatu gabe. Normalean honako hauek izaten ditu:

- Nabigazio nagusia.
- Kategoriak.
- Sarbide azkarrak.
- Konfigurazioa.
- Erabiltzailearen informazioa.



## Oinarrizko HTML egitura {#estructura-básica-aside}

Egitura semantikoak normalean [<aside>]{.verbatim} erabiltzen du eduki osagarria adierazteko.


:::::::::::::: {.columns}
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```html
<div class="layout">
  <aside class="sidebar">
    <h2>Panel</h2>
    <nav>
      <a href="#">Inicio</a>
      <a href="#">Alumnos</a>
      <a href="#">Cursos</a>
      <a href="#">Configuración</a>
    </nav>
  </aside>
  <main>
    <h1>Contenido principal</h1>
  </main>
</div>
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[CSS]{.title}
```css
.layout {
  display: grid;
  grid-template-columns: 240px 1fr;
  min-height: 100vh;
}

.sidebar {
  padding: 1rem;
}

main {
  padding: 2rem;
}
```
:::

:::
::::::::::::::


[<aside>]{.verbatim} elementuak adierazten du eduki hori osagarria dela [<main>]{.verbatim} elementuaren bidez adierazitako eduki nagusiarekiko. Grid da alboko barra bat sortzeko tresnarik egokiena; CSS bidez, bi zutabe sortzen dira: lehenengoa [240px]{.verbatim}-koa da alboko barrarako, eta gainerakoa eduki nagusirako [<main>]{.verbatim}.



## Barne-menua Flexbox-ekin {#menú-interno-flexbox}

Sidebar-aren barruan, estekak edo atalak bertikalki kategoriatan antolatu nahi ditugunez, Flexbox erabil dezakegu estekak antolatzeko.


::: {.mycode size=footnotesize}
[CSS]{.title}
```css
.sidebar nav {
    display: flex;
    flex-direction: column;
    gap: 0.5rem;
}
```
:::


Esteka bakoitza aurrekoaren azpian agertzen da, tarte uniformea utziz. Horrela, ikus dezakegu nola **Grid-ek orria antolatzen duen** eta **Flexbox-ek osagaiak antolatzen dituen**, kasu honetan alboko barraren osagaiak.



## Sidebar *responsive* {#sidebar-responsive}

Gailu mugikorretan, normalean ez dago alboko zutabe bati eusteko adina leku. Ohikoena ezkutatzea eta berriro erakusteko botoi bat gehitzea bada ere, irtenbiderik errazena edukien gainean kokatzea da. Beraz, CSSak honela izan behar du:


::: {.mycode size=footnotesize}
[CSS]{.title}
```css
.layout {
    display: grid;
    grid-template-columns: 1fr;
}
@media (min-width: 768px) {
    .layout {
        grid-template-columns: 240px 1fr;
    }
}
```
:::


## Kokapen finkoa scroll egitean {#posición}

Administrazio-paneletan ohikoa da menua ikusgai mantentzea eta scroll egitean ez mugitzea. Horretarako, honako arau hauek gehi ditzakegu mahaigaineko bertsioaren barruan.


::: {.mycode size=footnotesize}
[Sidebar-a finko mantendu]{.title}
```css
.sidebar {
    position: sticky;
    top: 0;
    height: 100vh;
}
```
:::


::: exercisebox
[[09b](https://github.com/yuki/ejercicios/blob/main/daw/diw/09b.html)]{.solution}

Aurreko ariketan oinarrituta:
- Gehitu alboko barra bat.
- Aldatu mugikorraren eta mahaigainaren arteko portaera.
:::


# Txartelak {#tarjetas}

**Txartelak** (*cards*) interfaze modernoen diseinuan gehien erabiltzen diren osagaietako batzuk dira. Txartela erlazionatutako informazioa azalera bisual independente baten barruan biltzen duen edukiontzia da, edukia antolatzea eta berrerabiltzea erraztuz.

Gaur egun, ia edozein aplikaziotan aurki ditzakegu txartelak: online denda bateko produktuak, hezkuntza-plataforma bateko ikastaroak, albisteak, erabiltzaile-profilak, estatistika-panelak edo sare sozialetako argitalpenak. Normalean, izenburua, testua, etiketak, botoiak, ikonoak eta/edo irudi bat izaten ditu.

Oinarrizko egitura honakoa bezain sinplea da:

:::::::::::::: {.columns}
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```html
<article class="card">
  <img src="curso.jpg"
      alt="Curso de HTML">
  <h2>Curso de HTML</h2>
  <p>
    Aprende los fundamentos
    del desarrollo web.
  </p>
</article>
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[CSS]{.title}
```css
.card {
    padding: 1.5rem;
    border: 1px solid #d1d5db;
    border-radius: 0.75rem;
    background-color: white;
}

.card h2 {
    margin-top: 0;
}
.card img {
    width: 100%;
    aspect-ratio: 16 / 9;
    object-fit: cover;
    border-radius: 0.5rem;
}
```
:::

:::
::::::::::::::

[[<article>]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/article) erabiltzen dugu, beste leku batzuetan berrerabil daitekeen eduki-unitate independentea adierazten duelako.

Txartelaren goiko zatia estaltzen duen irudi bat gehitu da, eta txartelari zein irudiari ertz biribilduak gehitu zaizkie itxura hobetzeko.


## Txartelak eta Grid-en kokapena {#tarjetas-posicionamiento-grid}

Txartelak erabiltzea eredu ezin hobea da sareta/*grid* bat sortzeko. Txartelak kokatzeko orduan, hainbat modutan egin dezakegu eta, beraz, *grid*-aren konfigurazioa gehien nahi dugun diseinura egokitu dezakegu:

- **Beti zutabe kopuru bera izatea**: diseinu hau egokia da pantailaren tamaina kontrolatuta badugu eta beste sistema batean ikusiko ez dela badakigu. **EZ da gomendatutako sistema**.
- **Txartelek beti zabalera bera izatea**: aproposa da beti itxura bera izatea nahi badugu. Arazoa da ez dela pantailaren tamainara egokitzen.
- ***[grid responsive](#grids-adaptables)*** erabiltzea: txartelek gutxieneko tamaina bat izango dute esleituta, baina pantailaren tamainara egokituko dira. **Hau da gaur egun gomendatutako sistema**.


# Botoiak {#botones}

**Botoiak** erabiltzaileek gehien elkarreragiten duten osagaietako bat dira. Inprimakiak bidaltzeko, leihoak irekitzeko, ekintzak berresteko, eragiketak bertan behera uzteko edo aplikazio baten barruan nabigatzeko aukera ematen dute. Botoien diseinu on batek erabilgarritasuna hobetzen du, ekintza bakoitzaren garrantzia argi adierazten du eta berehalako erantzun bisuala ematen dio erabiltzaileari.

HTMLn oso erabilgarriak diren bi elementu daude: **[<button>]{.verbatim}** eta **[<a>]{.verbatim}**. CSS bidez biek itxura bera izan dezaketen arren, haien esanahi semantikoa desberdina da:

- [<button>]{.verbatim}: ekintza bat exekutatzen du.
- [<a>]{.verbatim}: beste web-orri batera nabigatzen du.


## [<button>]{.verbatim} elementua {#elemento-button}

Ekintzak exekutatzeko elementu semantikoa [<button>]{.verbatim} da. Ohikoenak inprimaki bat bidaltzea, elkarrizketa-koadro bat irekitzea, JavaScript funtzio bat exekutatzea edo ekintza bat berrestea/baztertzea dira.


:::::::::::::: {.columns}
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```html
<button>Guardar</button>

<button disabled>Cancelar</button>
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[CSS]{.title}
```css
button {
    padding: 0.75rem 1.25rem;
    border: none;
    border-radius: 0.5rem;
    background-color: #2563eb;
    color: white;
    cursor: pointer;
}
```
:::

:::
::::::::::::::

Botoi baten atributuak aldatzean, sakatzeko eremu handiagoa, ertz biribilduak eta kolore desberdina izan ditzakegu, besteak beste.


## Botoi baten egoerak {#estados-botón}

Botoi batek egoera bisual desberdinak izan ditzake, eta, beraz, CSS arau gisa erabil ditzakegu:

- [button]{.verbatim}: egoera lehenetsia.
- [button:hover]{.verbatim}: sagua gainean jartzean duen egoera.
- [button:active]{.verbatim}: botoian klik egiten denean.
- [button:disabled]{.verbatim}: botoia desaktibatuta dago eta ezin da gainean klik egin.


## Botoien arteko desberdintasunak eta taldekatzea {#diferentes-botones-agrupación}

Ekintza guztiek ez dute garrantzi bera; beraz, ekintza desberdinak egiteko botoiak badaude, kolore eta/edo forma desberdinak izan beharko lituzkete, edo ikono desberdinen bidez adierazi beharko lirateke. Botoiak erraz identifikatzeko eta erabiltzeko modukoak izan behar dira. Horretarako, jardunbide egoki gisa, garrantzitsua da:

- Egiten duen ekintza deskribatzen duen testua erabiltzea.
- Ekintzak bereizteko kolorearen mende soilik ez egotea.
- Testuaren eta atzeko planoaren arteko kontraste nahikoa mantentzea.
- Sakatzeko eremu zabala eskaintzea (gutxienez 44 × 44 px inguru ukipen-interfazeetan).
- Ekintza erabilgarri ez dagoenean [disabled]{.verbatim} atributua erabiltzea.


![Bootstrap-eko botoien adibidea [Bootstrap](https://getbootstrap.com/docs/5.3/components/buttons/)](img/diw/botones-bootstrap.png){width=90%}


Aplikazio askotan ohikoa da ekintza desberdinak egiteko botoiak lerrokatzea eta elkarrengandik hurbil jartzea. Horretarako modurik onena Flexbox eta haren lerrokatze-sistema erabiltzea da, horizontalki zein bertikalki. Zenbait *framework*-ek botoiak taldekatzea ahalbidetzen dute; ekintza elkarren artean erlazionatuta dituzten botoietarako erabiltzen da.

![Botoi-taldea [Bulma](https://bulma.io/documentation/elements/button/\#button-group) erabiliz](img/diw/button-group-bulma.png){width=40%}


::: exercisebox
[[09c](https://github.com/yuki/ejercicios/blob/main/daw/diw/09c.html)]{.solution}

Aurreko ariketan oinarrituta:
- Sortu txartelak dituen grid sistema bat.
- Txartel bakoitzak irudi bat, goiburu bat, testu labur bat eta botoi motako esteka bat izan behar ditu.
- Gehitu txartelen batean "eskaintza" testua, beheratutako produktu bat balitz bezala.
:::



# Inprimakiak {#formularios}

**Inprimakiak** [<form>]{.verbatim} dira web-aplikazio batek erabiltzailearen informazioa jasotzeko erabiltzen duen mekanismo nagusia. Saioa hasteko prozesutik matrikula batera, online erosketa batera edo kontaktu-inprimaki batera, ia edozein webgunek behar ditu ondo diseinatutako inprimakiak.

Inprimaki on batek ez du soilik estetikoki atsegina izan behar: **argia, irisgarria, betetzeko erraza eta gailu mugikorretara egokitzeko modukoa** ere izan behar du. Inprimaki baten barruan aurkituko ditugun elementurik ohikoenak hauek dira:

- Etiketak ([label]{.verbatim}): eremu bakoitzak etiketa deskribatzaile bat izan behar du. [for]{.verbatim} atributuak etiketa dagokion [<input>]{.verbatim} eremuaren [id]{.verbatim}-arekin lotzen du. Erlazio horrek irisgarritasuna hobetzen du eta testuaren gainean klik egitean sarrera-eremua ere aktibatzea ahalbidetzen du.
- Testu-eremuak ([input]{.verbatim}): datu-mota jakin batzuetarako mota desberdinak daude, eta garrantzitsua da egokia aukeratzea, balidazioa eta erabiltzaile-esperientzia hobetzen baititu gailu mugikorretan.
  - [text]{.verbatim}: Testu orokorra.
  - [email]{.verbatim}: Posta elektronikoa.
  - [password]{.verbatim}: Pasahitzak.
  - [tel]{.verbatim}: Telefonoa.
  - [number]{.verbatim}: Zenbakizko balioak.
  - [date]{.verbatim}: Datak.
- Testu-eremu zabalak ([textarea]{.verbatim}): testu luzeak gehitzeko.
- Goitibeherako zerrendak ([select]{.verbatim}): hainbat aukeraren artean hautatzeko aukera ematen du.
- Egiaztapen-laukiak ([input type="checkbox"]{.verbatim}): hainbat aukera hautatzeko aukera ematen du.
- Hautaketa-laukiak ([inpuyt type="radio"]{.verbatim}): hainbat aukeren artean aukera bakarra hautatzeko aukera ematen du.
- Botoiak ([button]{.verbatim}).


Inprimakiak sarrerako kontrol guztiak biltzen ditu eta informazioa zerbitzarira bidaltzea ahalbidetzen du erabiltzaileak dagokion botoia sakatzen duenean.


:::::::::::::: {.columns}
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```html
<form>
  <div class="form-group">
    <label for="nombre">Nombre</label>
    <input
      id="nombre"
      type="text"
    >
  </div>

  <div class="form-group">
    <label for="email">Correo</label>
    <input
      id="email"
      type="email"
    >
  </div>
</form>
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[CSS]{.title}
```css
.form-group {
    display: flex;
    flex-direction: column;
    gap: 0.5rem;
    margin-bottom: 1rem;
}

input,
textarea,
select {
    width: 100%;
    padding: 0.75rem;
    border: 1px solid #d1d5db;
    border-radius: 0.5rem;
    font: inherit;
    box-sizing: border-box;
}
```
:::

:::
::::::::::::::

Aurreko adibideak oinarrizko inprimaki bat sortzen du, honako ezaugarri hauekin:

- Zabalera osoa.
- Tarte erosoa.
- Ertz biribilduak.
- Orrialdearen gainerakoarekin bat datorren tipografia.

*label* bakoitza dagokion *input*-arekin talde batean bateratuz Flexbox sistema bat sor daiteke. Kasu honetan, bertikalki lerrokatu da, baina mahaigaineko ikuspegirako horizontalki ere konfigura daiteke.



::: exercisebox
[[09d](https://github.com/yuki/ejercicios/blob/main/daw/diw/09d.html)]{.solution}

Sortu gailu desberdinetan itxura desberdina izango duen inprimaki bat.
:::



# Taulak {#tablas}

**Taulek** errenkada eta zutabeetan antolatutako informazioa irudikatzeko aukera ematen dute. Bereziki erabilgarriak dira elkarren artean erlazioa duten datuak erakutsi behar ditugunean, hala nola ikasleen zerrendak, produktuak, ordutegiak, emaitzak edo estatistikak.

CSSk ia edozein elementu-multzo taula bisual batean bihurtzeko aukera ematen duen arren, datuak benetan taulakoak direnean HTMLko tauletarako elementu espezifikoak erabili behar ditugu. Horrek egitura semantikoa eskaintzen du, irisgarritasuna errazten du eta nabigatzaileei informazioa behar bezala interpretatzeko aukera ematen die.

Taula bat honako elementu hauen bidez eraikitzen da:

- [<table>]{.verbatim}: Taularen edukiontzia.
- [<thead>]{.verbatim}: Taularen goiburua osatzen duten errenkadak biltzen ditu. Aukerakoa da.
- [<tbody>]{.verbatim}: Taularen eduki nagusia osatzen duten errenkadak biltzen ditu. Aukerakoa da.
- [<tfoot>]{.verbatim}: Taularen beheko zatia osatzen duten errenkadak biltzen ditu. Aukerakoa da.
- [<tr>]{.verbatim}: Errenkada.
- [<th>]{.verbatim}: Goiburuaren gelaxka.
- [<td>]{.verbatim}: Datuen gelaxka.


:::::::::::::: {.columns}
::: {.column width="43%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```html
<table>
  <thead>
    <tr>
      <th>Student ID</th>
      <th>Name</th>
      <th>Major</th>
      <th>Credits</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>3741255</td>
      <td>Jones, Martha</td>
      <td>Computer Science</td>
      <td>240</td>
    </tr>
    <tr>
      <td>3971244</td>
      <td>Nim, Victor</td>
      <td>Russian Literature</td>
      <td>220</td>
    </tr>
  </tbody>
  <tfoot>
    <tr>
      <th colspan="3">Totals</td>
      <td>460</td>
    </tr>
  </tfoot>
</table>
```
:::

:::
::: {.column width="57%" }

::: {.mycode size=footnotesize}
[CSS]{.title}
```css
thead, tfoot {
  border-bottom: 2px solid rgb(160 160 160);
  text-align: center;
  background-color: #2c5e77;
  color: white;
}

tbody {
  background-color: #e4f0f5;
}
table {
  border-collapse: collapse;
  border: 2px solid rgb(140 140 140);
  font-family: sans-serif;
  font-size: 0.8rem;
  letter-spacing: 1px;
}

th, td {
  border: 1px solid rgb(160 160 160);
  padding: 8px 10px;
}
tbody > tr > td:last-of-type {
  text-align: center;
}
tbody tr:nth-child(even) {
    background-color: #f3f4f6;
}
```
:::

:::
::::::::::::::


## Taulen estiloak {#estilos-tabla}

Nabigatzaileek ia ez diete estilorik gehitzen taulei, eta horrek irakurketa zaildu dezake; beraz, garrantzitsua da geure estiloak gehitzea. Gehitu ohi diren estiloen artean honako hauek gomendatzen dira:

- **Goiburuak**: goiburuei estilo bat gehitzeak zutabe bakoitzak zer adierazten duen argi ikusteko aukera ematen du.
- **Ertzak**: edukia bereizteko aukera ematen dute, eta horrela bistaratzea hobetzen da.
- **Txandakako errenkadak**: taula luzeetan komenigarria da errenkada bikoitien eta bakoitien koloreak txandakatzea.
- **[:hover]{.verbatim} efektua**: irakurketa errazteko, kurtsorea dagoen errenkada ere nabarmendu daiteke.
- **Taula *responsive*ak**: taulen arazo nagusietako bat pantaila txikietan duten portaera da. Irtenbide erraza desplazamendu horizontala baimentzea da, [overflow-x: auto]{.verbatim} erabiliz taularen **elementu gurasoaren edukiontzian**.


::: exercisebox
[[09e](https://github.com/yuki/ejercicios/blob/main/daw/diw/09e.html)]{.solution}

Sortu aurretik azaldutakoa jasoko duen taula bat.
:::


# Modalak {#modals}

***[Modal](https://www.w3schools.com/howto/howto_css_modals.asp)*** bat web-orri baten eduki nagusiaren gainean agertzen den leiho bat da, informazioa erakusteko edo erabiltzaileari ekintza bat egiteko eskatzeko. *Modal*a irekita dagoen bitartean, normalean erabiltzaileak harekin elkarreragin behar du atzean geratzen den edukiarekin jarraitu aurretik.

*Modalak* normalean honako hauetarako erabiltzen dira:

- Informazio gehigarria erakusteko.
- Ekintza garrantzitsuak berresteko.
- Datuak sortzeko/editatzeko inprimakiak erakusteko.
- Egoera jakin batzuen berri emateko.
- Irudiak edo eduki handituak erakusteko.

*Modalak* neurriz erabili behar dira. Ekintza bat zuzenean web-orrian egin badaiteke, normalean hobe da erabiltzailea leiho *modal* batekin ez etetea.

[<dialog>]{.verbatim} etiketa agertu aurretik nola sortzen ziren azalduko da, eta ondoren etiketa berriarekin nola egiten diren.


## Antzinako oinarrizko egitura {#modal-estructura-básica}

Modalek nola funtzionatzen duten ulertzeko, modu "artisauan" nola egiten ziren azalduko da. Gaur egun ere metodo hori erabiltzen dute hainbat *framework*-ek.

:::::::::::::: {.columns}
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```html
<div class="modal">
  <div class="modal-content">
    <h2>Confirmar acción</h2>
    <p>
        ¿Seguro?
    </p>
    <button>Cancelar</button>
    <button>Eliminar</button>
  </div>
</div>

<button id="abrir">Open Modal</button>
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[CSS]{.title}
```css
.modal {
  display: none;
  position: fixed;
  z-index: 1;
  padding-top: 100px;
  left: 0;
  top: 0;
  /* ... */
}
```
:::

:::
::::::::::::::

Egiturak hiru elementu nagusi ditu:

- [.modal]{.verbatim}: edukiaren gainean *overlay* gisa kokatzen den elementua da.
- [.modal-content]{.verbatim}: erakutsi nahi dugun mezua da.
- [<button>]{.verbatim}: ekintza exekutatzen duen botoia da. Kasu honetan, modala soilik erakutsiko du.
- **JavaScript kodea**: botoia sakatzean, modala ikusgai bihurtuko du. Mezua ezkutatzeko hainbat modu erabil daitezke:
  - Modalak adierazten duen ekintza berrestea/baztertzea.
  - Modalaren ixteko botoi batean klik egitea (sistema eragilearen leiho baten antzera).
  - Modalaren *overlay*-aren gainean klik egitea. Horrela, ixtea errazten da.


::: {.mycode size=footnotesize}
[JavaScript kodea]{.title}
```javascript
var modal = document.getElementById("myModal");
var btn = document.getElementById("myBtn");

btn.onclick = function() {
    modal.style.display = "block";
}

// para ocultar/cerrar el modal
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
```
:::


## [<dialog>]{.verbatim} elementua {#elemento-dialog}

2022tik aurrera, nabigatzaile guztietan dago erabilgarri [[<dialog>]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/dialog) elementua, Chrome-k proposatu zuena. Etiketa honekin modal elementu bat sor dezakegu (nahiz eta modal bat ez izan ere), osagai interaktibo bat, alerta bat edo azpi-leiho bat sortzeko.

Adibiderik oinarrizkoenetan ez da beharrezkoa JavaScript erabiltzea, 2023tik [popovertarget]{.verbatim} atributua baitago. Atributu horri esker, botoi bat elkarrizketa-koadroa irekitzeko lotu daiteke, [id]{.verbatim} kontuan hartuta.


::: {.mycode size=footnotesize}
[HTML]{.title}
```html
<button popovertarget="my-dialog">Open dialog</button>

<dialog id="my-dialog" popover>
  <p>bla bla</p>
  <button popovertarget="my-dialog" popovertargetaction="hide">Close</button>
</dialog>
```
:::

[<dialog>]{.verbatim}-ek modalak egiteko modu "tradizionalean" oinarritutako funtzionalitateak eskaintzen ditu; oraingoan, ordea, nabigatzailea gai da ekintza batzuk egiteko, eta, beraz, ez ditugu eskuz egin behar. Aukera bereziki interesgarria da web-aplikazio modernoetan, eta gomendagarria da [MDNren dokumentazioan](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/dialog) dauden aukera desberdinak ikustea.

::: infobox
HTML eta CSS etengabe garatzen ari diren teknologiak dira; beraz, noizean behin, garatzailearen lana errazteko ezaugarriak gehitzen dira.
:::


## Kontuan hartu beharreko alderdiak {#modals-aspectos}

Modal bat sortzean, zenbait alderdi kontuan har daitezke itxura eta erabilgarritasun orokorra hobetzeko. Horietako batzuk nahitaezkoak dira, eta beste batzuk aukerakoak:

- *Overlay*-ak atzeko planoa iluntzea, modalaren edukia hobeto ikusteko.
- Ez dugu ahaztu behar modalak eduki orokorrak baino [z-index]{.verbatim} handiagoa izan behar duela.
- Erakusteko/ezkutatzeko animazio bat gehitzeak erabiltzaileari begirada non finkatu behar duen jakiten lagun diezaioke.
- Atzeko planoko scroll-a saihesteak fokua modalean mantentzeko sentsazioa hobetzen du.


:::::::::::::: {.columns}
::: {.column width="35%"}

::: {.mycode size=footnotesize}
[CSS]{.title}
```css
body.modal-open {
    overflow: hidden;
}
```
:::

:::
::: {.column width="65%" }

::: {.mycode size=footnotesize}
[JavaScript]{.title}
```javascript
//Al abrir el modal, se añade una clase
btn.addEventListener("click", () => {
  modal.classList.add("is-open");
  document.body.classList.add("modal-open");
});
// falta quitar la clase al cerrar el modal
```
:::

:::
::::::::::::::


Aurreko adibidearekin, modal bat irekita dagoenean ezinezkoa da web-orrian scroll egitea.


::: exercisebox
[[09f](https://github.com/yuki/ejercicios/blob/main/daw/diw/09f.html)]{.solution}

Sortu honako hauek dituen HTML web-orri bat:

- *Custom* modala irekitzeko botoia.
- [<dialog>]{.verbatim} bat irekitzeko botoia.
  - Egiaztatu dituen aukerak eta begiratu ea interesgarria den horietakoren bat.
:::


# Abisuak eta/edo alertak {#avisos-alertas}

**Abisuak** eta **alertak** aplikazio baten egoerari buruzko informazio garrantzitsua erabiltzaileari erakusteko erabiltzen diren osagaiak dira. Modalek ez bezala, alertak normalean **ez dute orriaren gainerakoarekiko interakzioa blokeatzen**, eta, beraz, erabiltzaileak lanean jarrai dezake alertak ikusgai dauden bitartean. Bereziki erabilgarriak dira honako hauek jakinarazteko:

- Eragiketak behar bezala egin direla.
- Erroreak.
- Abisuak.
- Informazio gehigarria.
- Aplikazio baten egoeran gertatutako aldaketak.

Adibide ohikoa litzateke inprimaki baten datuak bidali ondoren behar bezala gorde direla adierazten duen mezua erakustea.


:::::::::::::: {.columns}
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```HTML
<div class="aviso alert-info ">
  Los datos se han guardado.
</div>
<div class="aviso alert-error ">
  ¡ERROR!
</div>
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[CSS]{.title}
```css
.aviso {
    padding: 1rem;
    border-radius: 0.5rem;
    border: 1px solid transparent;
    margin: 10px 0;
}
.alert-info {
    background-color: #dbeafe;
    color: #1e3a8a;
}
```
:::

:::
::::::::::::::


## Abisu motak {#tipos-avisos}

Abisuak edo alertak sortzerakoan, kontuan hartu beharko genuke zer motatako aplikazioa eraikitzen ari garen eta zer abisu jakinarazi nahi dizkiogun azken erabiltzaileari. Aplikazio estandar batean, honako hauek sor ditzakegu:


:::::::::::::: {.columns}
::: {.column width="50%"}

- **Informazio-abisu**: erabiltzailearentzat erabilgarria den informazioa adierazten du.
- **Berrespen-/arrakasta-abisu**: eragiketa behar bezala egin dela adierazteko (datuak gordetzea, erabiltzailea sortzea, ...).
- **Abisu-alerta**: erabiltzailearen arreta behar denean, errore bat ez den arren.
- **Errore-alerta**: ekintza ezin izan dela egin edo errore batekin amaitu dela adierazteko.

:::
::: {.column width="50%" }

![Abisuen adibidea](img/diw/alertas.png){width=100%}

:::
::::::::::::::

## Egin daitezkeen hobekuntzak {#posibles-mejoras-alertas}

Abisuak eta alertak sortzerakoan, honako ezaugarri hauek gehitzea interesgarria izan daiteke:

- **Ikonoak**: ikono batek mezu-mota azkar identifikatzen lagun dezake.
- **Izenburua**: izenburu bat gehi dezakegu edukia bereizteko.
- **Ixteko botoia**: abisua/alerta desagerrarazteko, ixteko botoi bat gehitu.
- **Aldi baterako alerta**: aplikazio batzuek mezuak segundo batzuez erakusten dituzte eta ondoren automatikoki ezkutatzen dituzte. Baliagarria da berrespen-mezuetarako, baina ez ditugu automatikoki ezkutatu behar erabiltzaileak irakurtzeko denbora behar duen mezu garrantzitsuak.
- **Errorearen IDa**: gertatutakoa arazteko (*debug* egiteko), errore-kode bakar bat gehi dezakegu, erabiltzaileak errore horren berri eman ahal izan dezan.
- **Errorea non gertatu den adieraztea**: hau bereziki erabilgarria da inprimakietan. Huts egin duen sarrera-erregistroari ertz gorri bat gehitzeak argi adierazten dio erabiltzaileari non dagoen errorea.


::: exercisebox
[[09g](https://github.com/yuki/ejercicios/blob/main/daw/diw/09g.html)]{.solution}

Sortu abisu- eta alerta-elkarrizketa desberdinak:

- Gehitu kolore desberdinak abisu-mota bakoitzerako.
- Gehitu izenburu bat.
- Gehitu testuarekin lerrokatutako ikono bat (erabili Flexbox).
:::


# Breadcrumbs {#breadcrumbs}

***Breadcrumbs*** edo **ogi-apurrak** erabiltzaileak webgune edo aplikazio baten barruan jarraitu duen bide hierarkikoa erakusten duen nabigazio-osagaia dira. Adibidez: [Hasiera > Ikastaroak > Web Garapena > JavaScript]{.verbatim}.

Azkar jakiteko aukera ematen dute **erabiltzailea non dagoen**, eta goiko mailetara itzultzea errazten dute menu nagusia erabili beharrik gabe, maila bakoitza, azkena izan ezik, esteka baita.

Bereziki erabilgarriak dira egitura hierarkiko sakona duten webguneetan, hala nola online dendetan, hezkuntza-plataformetan, dokumentazio teknikoan edo eduki-kudeatzaileetan.


*Breadcrumbs* nabigazio-osagai bat direnez, [<nav>]{.verbatim} elementua erabil dezakegu, nahiz eta zerrenda bat ere erabil daitekeen.


:::::::::::::: {.columns}
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```HTML
<nav class="breadcrumbs"
    aria-label="Breadcrumb">
  <ol>
    <li>
      <a href="/">Inicio</a>
    </li>
    <li>
      <a href="/cursos">Cursos</a>
    </li>
    <li>
      <a href="/cursos/web">
        Desarrollo Web
      </a>
    </li>
    <li>
      JavaScript
    </li>
  </ol>
</nav>
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[CSS]{.title}
```css
.breadcrumbs ol {
    display: flex;
    align-items: center;
    gap: 0.5rem;
    padding: 0;
    margin: 0;
    list-style: none;
}

.breadcrumbs li + li::before {
    content: ">";
    margin: 0 0.5rem;
}
```
:::

:::
::::::::::::::


Adibidean zerrenda bat sortu da, eta mailen artean [>]{.verbatim} bereizketa gehitzeko, CSS arau bat erabili da [anai-arreba ondokoei](#resumen-selectores) dagokien hautatzailearekin.


::: exercisebox
[[09h](https://github.com/yuki/ejercicios/blob/main/daw/diw/09h.html)]{.solution}

Sortu *breadcrumb* bat eta aldatu estiloak. Aztertu bereizlea CSS bidez edo JavaScript bidez gehitzeko aukera.
:::



# Orri-zenbakitzailea {#paginación}

**Orri-zenbakitzailea** eduki-kantitate handia hainbat orritan banatzeko aukera ematen duen nabigazio-osagaia da. Emaitza guztiak aldi berean erakutsi beharrean, elementu-talde txikiak aurkezten dira eta erabiltzaileari haien artean nabigatzeko aukera ematen zaio.

Ohikoa da orri-zenbakitzailea honako hauetan aurkitzea:

- Produktu-zerrendetan.
- Bilaketa-emaitzetan.
- Ikasleen zerrendetan.
- Albisteetan.
- Artikuluetan.
- Datu-base bateko erregistroetan.
- Administrazio-paneletan.


Orri-zenbakitzailea ez da soilik elementu bisual bat. Estekek edukien orrialde desberdinetara benetan sartzeko aukera eman behar dute. Orri-zenbakitzaileak nabigazioa adierazten du; beraz, [<nav>]{.verbatim} erabil dezakegu, aurretik ikusi dugun bezala, edo zerrenda bat.


:::::::::::::: {.columns}
::: {.column width="55%"}

::: {.mycode size=footnotesize}
[HTML]{.title}
```HTML
<nav aria-label="Paginación">
    <a href="?page=1">Anterior</a>
    <a href="?page=1">1</a>
    <a href="?page=2" class="active">2</a>
    <a href="?page=3">3</a>
    <a href="?page=4">4</a>
    <a href="?page=2">Siguiente</a>
</nav>
```
:::

:::
::: {.column width="45%" }

::: {.mycode size=footnotesize}
[CSS]{.title}
```css
.pagination a {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    min-width: 1.5rem;
    min-height: 1.5rem;
    padding: 0.5rem;
    border: 1px solid #d1d5db;
    border-radius: 0.5rem;
    color: #374151;
    text-decoration: none;
    font-weight: bold;
}
```
:::

:::
::::::::::::::

Adibidean estekei dagokien CSSa soilik gehitu da; beste hainbat orrialdetan gertatzen den bezala, zenbaki bakoitzaren inguruan ertz txiki bat sortzen du.

![Orri-zenbakitzailearen adibidea](img/diw/paginacion.png){width=50%}



## Ohiko diseinua {#paginación-diseño-habitual}

Orri-zenbakitzailea nabigazio-sistema denez, begiratu batean hainbat alderdi argi erakutsi behar dizkigu. Besteak beste, honako hauek nabarmendu ditzakegu:

- Gauden orria.
- [:hover]{.verbatim} efektua esteken gainean.
- "Aurrekoa" edo "Hurrengoa" desaktibatzea, lehenengo edo azken orrian bagaude, hurrenez hurren.
- Orrialde asko daudenean, ez du zentzurik zenbaki guztiak erakusteak.



::: exercisebox
[[09i](https://github.com/yuki/ejercicios/blob/main/daw/diw/09i.html)]{.solution}

Sortu ohiko erabilerako *orri-zenbakitzailea* sistema bat, zehaztutako diseinu-ezaugarriak dituena.
:::



# Akordeoiak {#acordeones}

**Akordeoia** eduki-blokeak erakutsi eta ezkutatzeko aukera ematen duen interfazearen osagaia da. Bloke bakoitza erabiltzaileak sakatu dezakeen izenburu edo goiburu batez osatu ohi da, lotutako informazioa zabaltzeko.

Bereziki erabilgarriak dira informazio asko dugunean eta ez dugunean dena aldi berean osorik erakutsi nahi. Ohiko adibide batzuk hauek dira:

- Ohiko galderak.
- Laguntza-atalak.
- Konfigurazio-aukerak.
- Deskribapen gehigarriak.
- Kategorien arabera taldekatutako informazioa.

Akordeoi batek hasieran eduki guztiak itxita izan ditzake.


## Oinarrizko egitura {#acordeón-estructura}

Beste elementu batzuekin gertatzen den bezala, hasiera batean sistema hau modu "artisauan" eraikitzen zen, HTML, CSS eta JavaScript erabiliz. Baina 2020tik bi etiketa berri daude, [[<details>]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/details) eta [<sumamry>]{.verbatim}, eta horiek sortzea errazten dute, JavaScript erabiltzea beharrezkoa ez delako.

:::::::::::::: {.columns}
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[Eskuz egindako metodoa]{.title}
```HTML
<div class="accordion">
  <div class="accordion-item">
    <button class="accordion-header">
      Cabecera
    </button>
    <div class="accordion-content">
        <p>Contenido.</p>
    </div>
  </div>
  <!-- Más secciones -->
</div>
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[Metodo berria]{.title}
```html
<details>
  <summary>Cabecera</summary>
  <p>
    Contenido.
  </p>
</details>
```
:::

:::
::::::::::::::


Hurrengo urratsa CSS kodea izatea da, estilo pertsonalizagarriak gehitzeko eta atala lehenespenez ezkutatzeko, eta JavaScript kodea izatea atala ezkutatu/erakusteko, metodo zaharrean.

:::::::::::::: {.columns columnsep=0.25cm}
::: {.column width="44%"}

::: {.mycode size=footnotesize}
[CSS]{.title}
```css
.accordion {
    border: 1px solid #d1d5db;
    border-radius: 0.5rem;
    overflow: hidden;
    width: 40%;
}
.accordion summary, 
.accordion .accordion-header {
    width: 100%;
    display: flex;
    align-items: center;
    justify-content: space-between;
    border: none;
    background-color: #f3f4f6;
    padding: 1rem 0rem 1rem 1rem;
    cursor: pointer;
    font-weight: 600;
    list-style: none;
    font: inherit;
}
```
:::

:::
::: {.column width="56%" }

::: {.mycode size=footnotesize}
[JavaScript]{.title}
```javascript
const headers = 
document.querySelectorAll(".accordion-header");

headers.forEach(header => {
    header.addEventListener("click", () => {
        const item = header.parentElement;
        item.classList.toggle("is-open");
    });
});
```
:::

:::
::::::::::::::

![Ejemplo de acordeón](img/diw/acordeon.png){width=50%}



## Diseinua eta laguntzak {#acordeón-diseño-ayudas}

Akordeoien erabilgarritasuna errazteko, ohikoa da honako diseinu eta/edo laguntza hauek erabiltzea:

- Goiburua edukitik bereiztea: normalean, goiburuak kolore bat izaten du eta edukiak beste bat.
- Atala irekita edo itxita dagoen adierazteko gezi edo ikono bat gehitzea. Egoera aldatzean, ikonoak ere aldatu egin behar du.
- Hainbat akordeoi-atal batera badaude, atal desberdinak bereizi behar dira.
- Zenbait kasutan, edukiontzi bat irekitzean gainerakoak itxi nahi izaten ditugu. Hori egiten ari garen informazioaren eta/edo aplikazioaren araberakoa izango da.


::: exercisebox
[[09j](https://github.com/yuki/ejercicios/blob/main/daw/diw/09j.html)]{.solution}

Sortu akordeoi-sistema bat metodo berriarekin eta metodo "eskuzko"/"zaharrarekin". Eman gehien gustatzen zaizun CSS diseinua eta, beharrezkoa bada, JavaScript kodea.
:::





