
# # CSSko *framework*ak {#frameworks-css}

CSSko ***framework* bat** aurrez prestatutako CSS fitxategi, osagai eta utilitateen multzoa da, web-interfazeak modu azkarrago eta egituratuagoan garatzeko aukera ematen duena. Orrialde baterako beharrezkoak diren estilo guztiak hutsetik idatzi behar izan beharrean, *framework*ak zuzenean gure HTMLn erabil ditzakegun klaseak eta osagaiak eskaintzen ditu.

Adibidez, CSS hutsez botoi bat sortu nahi badugu, normalean guk geuk definitu beharko genituzke botoiaren kolorea, atzeko planoa, ertza, tamaina, barruko tartea eta botoiaren egoera desberdinak bezalako propietateak. *Framework* batean, berriz, mota horretako estiloak dagoeneko eskaintzen dituzten klaseak aurki ditzakegu. Gure botoi baten eta **Bootstrap** erabiliz sortutako baten adibidea.


:::::::::::::: {.columns}
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[Egindako CSS botoiarako]{.title}
```css
.boton {
    padding: 0.5rem 1rem;
    border: none;
    border-radius: 0.5rem;
    background-color: #0d6efd;
    color: white;
    cursor: pointer;
}
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[HTML botoia Bootstrap-ekin]{.title}
```html
<button class="btn btn-primary">
    Aceptar
</button>
```
:::

:::
::::::::::::::


Ikus daitekeenez, garatzaileak ez ditu hutsetik inplementatu behar botoiaren oinarrizko itxura lortzeko beharrezkoak diren CSS arau guztiak; nahikoa da HTMLari klase pare bat gehitzea emaitza bera lortzeko.

Framework eta estilo-sistema ugari daude:

- **[Bootstrap](https://getbootstrap.com/)**.
- **[Tailwind CSS](https://tailwindcss.com/)**.
- **[Bulma](https://bulma.io/)**.
- **[Foundation](https://get.foundation/)**.
- **[UIkit](https://getuikit.com/)**.

*Framework* batzuek ikus-osagai osoak eskaintzen dituzte; beste batzuk, berriz, diseinua arau txikiak konbinatuz eraikitzeko aukera ematen duten utilitate-klaseetan oinarritzen dira.


## Zer eskaintzen du CSSko framework batek? {#qué-proporciona-un-framework-css}

Framework bakoitzak bere ezaugarriak baditu ere, normalean hainbat tresna-mota eskaintzen ditu. Besteak beste, hauek aurki ditzakegu:

- **Layout-sistema** elementuak antolatzeko.
- **Grid** errenkaden eta zutabeen bidez banaketak sortzeko.
- **Utilitate-klaseak** ohiko propietateetarako.
- **Ikus-osagaiak**, hala nola botoiak, txartelak, menuak edo alertak.
- **Inprimakietarako estiloak**.
- **Diseinu responsive-a**.
- **Tipografia**.
- **Koloreak**.
- **Tarteak**.
- **Ertzak eta itzalak**.
- **Egoera interaktiboak**.

Beraz, CSSko *framework* bat ez da kolore eta botoien bilduma hutsa. Arau komunei jarraituz interfazeak eraikitzeko aukera ematen duten tresna batzuk eskaintzen ditu.


## CSSko frameworkak eta klaseak {#frameworks-css-clases}

Framework hauen ohiko ezaugarrietako bat CSS klaseen erabilera intentsiboa da. Adibidez, tartea kontrolatzeko edo *layout*a kontrolatzeko erabiltzen diren klaseak aurki ditzakegu:

:::::::::::::: {.columns}
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[Margen superior e inferior]{.title}
```html
<div class="mt-2 mb-2">
    Contenido
</div>
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[Botón HTML con Bootstrap]{.title}
```html
<div class="container">
  Contenido
</div>
```
:::

:::
::::::::::::::

Erabilitako klasea *framework* zehatzaren araberakoa izango da. Oinarrizko ideia da HTMLak *framework*ak eskaintzen dituen klaseak erabiltzen dituela behar ditugun estiloak aplikatzeko.



## CSSko frameworkak eta diseinu responsive-a {#frameworks-diseño-responsive}

CSSko frameworkak bereziki ezagun egin ziren arrazoietako bat interfaze **responsive-ak** sortzea errazten dutela da. Gogora dezagun interfaze responsive batek pantaila-tamaina desberdinetara egokitu behar duela.

Framework batek normalean pantaila-tamaina desberdinak kontuan hartzen dituzten klaseak eta arauak eskaintzen ditu. Adibidez, Bootstrap-ek **[breakpoint](#breakpoints-puntos-ruptura)** desberdinak erabiltzen ditu bere layout-sistema egokitzeko; horri esker, *layout* responsive-ak eraiki daitezke, beharrezkoak diren media query guztiak eskuz definitu beharrik gabe.


## CSSko framework bat erabiltzearen abantailak eta eragozpenak {#framework-ventajas-inconvenientes}

CSSko frameworkek abantaila ugari eskaintzen dituzte, baina ez dira beti aukerarik onena. Horien erabilera proiektuaren ezaugarrien araberakoa izan behar da.


| Abantailak | Eragozpenak |
|----------|-----------------|
| Garapen azkarragoa | Frameworkarekiko mendekotasuna |
| Diseinu responsive-a | HTMLa klase askorekin |
| Batzuek osagai berrerabilgarriak dituzte | Pertsonalizazioa: ez da beti erraza |
| Ikus-identitatearen koherentzia | Ikaskuntza-kurba |
| Bateragarritasuna | 
| Dokumentazioa eta komunitatea



## CSSko frameworka tresna gisa, ez CSSren ordezko gisa {#framework-no-sustituye-css}

CSSko framework bat ez da CSSren ordezkotzat hartu behar. Frameworka CSS erabiliz eraikita dago eta haren gaineko abstrakzio-geruza bat eskaintzen du. Framework bat ikasteak ez luke CSS ikasteari uztea ekarri behar.

CSS ezagutzen duen garatzaile batek framework bat modu kontzientean erabil dezake, beharrezkoa denean aldatu eta portaera lehenetsia nahikoa ez denean arazoak konpon ditzake.


# Bootstrap {#bootstrap}

**[Bootstrap](https://getbootstrap.com/)** web-interfazeak garatzera bideratutako CSS framework bat da. Web-orriak azkarrago eraikitzeko eta haien elementuen artean itxura koherentea mantentzeko aukera ematen duten estilo, osagai eta utilitateen multzoa eskaintzen du.

Bootstrap Twitterreko garatzaileek sortu zuten hasiera batean, eta kode irekiko proiektu gisa argitaratu zen 2011n. Denborarekin, web-interfazeak garatzeko CSS framework ezagun eta erabilienetako bat bihurtu zen.

Bere helburu nagusia interfaze bat eraikitzeko oinarri bat eskaintzea da, ohiko estilo guztiak hutsetik inplementatu behar izan gabe.


## Bootstrap instalatzea eta txertatzea {#instalación-bootstrap}

Bootstrap web-orri batean erabiltzeko, haren fitxategiak proiektuan txertatu behar ditugu. Hori egiteko hainbat modu daude, baina ohikoenak **[CDN](https://es.wikipedia.org/wiki/Red_de_distribuci%C3%B3n_de_contenidos)** (*content delivery network*, edukia banatzeko sarea) erabiltzea edo Bootstrap deskargatu eta haren fitxategiak proiektuaren barruan txertatzea dira.

Aukeratutako aukera proiektuaren beharren araberakoa izango da. Bootstrap-ekin lanean hasteko, CDN bat erabiltzea bereziki erraza da, ez baitugu fitxategirik deskargatu edo konfiguratu behar. Mendekotasunen gaineko kontrol handiagoa izan nahi dugun proiektuetan, Bootstrap proiektuaren barruan instala dezakegu.


::: {.mycode size=footnotesize}
[HTML Bootstrap-ekin]{.title}
```html
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Bootstrap demo</title>
  <link 
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" 
    rel="stylesheet" 
    integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" 
    crossorigin="anonymous">
</head>
<body>
  <h1>Hello, world!</h1>
  <script 
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" 
    integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" 
    crossorigin="anonymous"></script>
</body>
</html>
```
:::

Aurreko adibideak Bootstrap CDN bidez erabiltzen duen HTML orri minimoa erakusten du. Honako etiketa hauek gehitu dira:

- [meta name="viewport"]{.verbatim}: [lehenago](#viewport) ikusi dugun bezala, diseinu responsive-a izateko beharrezkoa den etiketa da.
- [link]{.verbatim} [bootstrap.min.css]{.configfile} fitxategiarentzat: Bootstrapen estilo-orria da, Bootstrap erabili ahal izateko beharrezkoak diren arau guztiekin. Bertsio «minimizatua» da (lerro-jauzirik gabe).
  - [integrity]{.verbatim} atributua: deskargatutako fitxategia espero den edukiarekin bat datorrela egiaztatzeko aukera ematen dio nabigatzaileari. Eduki hori [hash kriptografiko](https://es.wikipedia.org/wiki/Funci%C3%B3n_hash_criptogr%C3%A1fica) bat da.
  - [crossorigin]{.verbatim} atributua: beste jatorri batean dagoen baliabide baten eskaera nola egin behar den adierazten du.
- [<script>]{.verbatim} [bootstrap.bundle.min.js]{.configfile} fitxategiarentzat: Bootstrapek JavaScript fitxategi bat eskaintzen du, osagai batzuk interaktiboak baitira eta JavaScript behar baitute. *Bundle* bat da, [Popper](https://github.com/floating-ui/popper-docs/tree/main) ere barne hartzen duelako; osagai interaktibo batzuek erabiltzen duten mendekotasuna da. Garrantzitsua da fitxategi hau HTML dokumentu osoa kargatu ondoren kargatzea. Beraz:
  - Dokumentuaren amaieran egon behar du, [</body>]{.verbatim} ixteko etiketaren aurretik. Horrela, nabigatzaileak HTML edukia prozesatu dezake lehenik, eta ondoren zenbait script kargatu eta exekutatu.
  - Etiketa [<head>]{.verbatim} barruan ere gehi daiteke, [defer]{.verbatim} erabiliz, deskarga amaitzean exekutatzeko.


Deskargatutako fitxategiak edukitzeko aukera hautatzen badugu, HTML kodearekin batera gorde behar ditugu (normalean [css]{.configdir} eta [js]{.configdir} direktorioak erabiltzen dira), eta ondoren HTMLan gehitu, dagokion bidea erabiliz.

Bi sistemen arteko aldea honako taula honetan laburbil daiteke:

| CDN                                            | Fitxategi lokalak                                    |
| ---------------------------------------------- | --------------------------------------------------- |
| Ez dugu Bootstrap eskuz deskargatu behar       | Fitxategiak proiektuaren parte dira                 |
| Konfigurazio oso erraza                        | Kontrol handiagoa dugu                              |
| Nabigatzaileak Internetetik lortzen du baliabidea | Ez dugu Bootstrap CDN batetik lortu behar          |
| Oso erosoa adibideetarako eta prototipoetarako  | Egokia mendekotasunak kontrolatu nahi ditugunean    |
| CDNaren erabilgarritasunaren mende gaude        | Fitxategiak mantendu behar ditugu                   |



Bestela, instalazioa **[npm](https://nodejs.org/es)** bezalako sistemen bidez ere egin daiteke.

<!-- TODO: explicar nodejs, npm y sistema de instalación? -->

Behar bezala kargatu dela egiaztatzeko, botoi bat gehi dezakegu, dagokion klasearekin, behar bezala errendatzen den ikusteko:

::: {.mycode}
[HTML botoia Bootstrap-ekin]{.title}
```html
<button class="btn btn-primary">
    Aceptar
</button>
```
:::


## Modulu jakin batzuk soilik instalatzea {#instalar-solo-módulos}

Aurreko atalean Bootstrap osorik instalatu/konfiguratu dugu, baina modulu jakin batzuk soilik instalatzeko aukera ere badago, Bootstrapen atalek bereizketa hau baitute:

- **Layout**: dokumentuaren egitura-sistema. *breakpoint*ak, Grid sistema, zutabeak, ...
- **Content**: oinarrizko koloreetarako aldagaiak eta koherentzia izateko *reboot* sistema ditu.
- **Components**: botoiak, taulak, alertak, akordeoiak... sortzen dituzten osagai guztiak dituen atala da.
- **Utilities**: ertzak, formak, zabalerak, altuerak... sortzeko utilitateak ditu.

Zenbait proiektutan interesgarria izan daiteke osagai jakin batzuk soilik kargatzea *framework* osoa kargatu beharrean. Horregatik, interesgarria da [dokumentazioa](https://getbootstrap.com/docs/5.3/getting-started/contents/) ikustea, gehien interesatzen zaiguna erabakitzeko.


## CSS propioa Bootstraparekin batera {#css-propio-con-bootstrap}

Gure proiektua sortzerakoan ez dugu Bootstrap bakarrik erabiltzea aukeratu behar, gure CSS fitxategia ere sor baitezakegu, gure arauak edukitzeko eta, horrela, proiektua pertsonalizatzeko.

Egin behar duguna da gure CSS fitxategia Bootstrapen fitxategiaren ondoren kargatzea. Horrela, egiten ditugun arauek, **[kaskadaren](#cascada)/[espezifikotasunaren](#especificidad)/[jatorriaren](#origen-hojas-estilo)** ondorioz, Bootstrapen arauek baino lehentasun handiagoa izango dute estiloak gainidazten saiatzen garenean, behar bezala egiten badugu.


::: exercisebox
[[10a](https://github.com/yuki/ejercicios/blob/main/daw/diw/10a.html) eta [10b](https://github.com/yuki/ejercicios/blob/main/daw/diw/10b.html)]{.solution}

Sortu:

- HTML bat Bootstrap CDN bidez erabiliz.
- Gehitu botoiak eta Bootstrap erabiltzen duen osagairen bat.
- Sortu estilo-orri propio bat, klaseak gehitzen dituzten arauekin, eta erabili Bootstraparekin batera.
- Sortu Bootstrap lokalean erabiltzen duen beste HTML bat, beharrezko fitxategiak deskargatu ondoren.
:::


## Bootstrapen edukiontziak {#contenedores-bootstrap}

Bootstrap-ek **[edukiontzien](https://getbootstrap.com/docs/5.3/layout/containers/)** sistema bat eskaintzen du. Sistema horrek orri bateko edukiaren zabalera kontrolatzeko eta viewportaren barruan zentratuta mantentzeko aukera ematen du.

Edukiontzi bat bereziki erabilgarria da pantaila handietan. Oso pantaila zabal batean eduki guztia pantailaren % 100 okupatuz kokatuko bagenu, testu-lerroak luzeegiak izan litezke eta interfazeak egitura gal lezake.

Viewportaren tamainara egokitzen diren edukiontzi desberdinak daude:

|               | [Extra small <576px]{.footnotesize}  | [Small ≥576px]{.footnotesize}  | [Medium ≥768px]{.footnotesize}  | [Large ≥992px]{.footnotesize}  | [X-Large ≥1200px]{.footnotesize}  | [XX-Large ≥1400px]{.footnotesize}  |
|:--------------------|--------------|---------------|--------------|-----------------|------------------|--------|
| [.container      ]{.footnotesize}   | 100%         | 540px         | 720px        | 960px           | 1140px           | 1320px |
| [.container-sm   ]{.footnotesize}   | 100%         | 540px         | 720px        | 960px           | 1140px           | 1320px |
| [.container-md   ]{.footnotesize}   | 100%         | 100%          | 720px        | 960px           | 1140px           | 1320px |
| [.container-lg   ]{.footnotesize}   | 100%         | 100%          | 100%         | 960px           | 1140px           | 1320px |
| [.container-xl   ]{.footnotesize}   | 100%         | 100%          | 100%         | 100%            | 1140px           | 1320px |
| [.container-xxl  ]{.footnotesize}   | 100%         | 100%          | 100%         | 100%            | 100%             | 1320px |
| [.container-fluid]{.footnotesize}   | 100%         | 100%          | 100%         | 100%            | 100%             | 100%   |

Table: [Bootstrap-eko edukiontzi](https://getbootstrap.com/docs/5.3/layout/containers/)-en desberdintasunak  {tablename=yukitblrcol colspec=X[4,l]X[3]X[3]X[3]X[3]X[3]X[3]}


Kontuan hartuta gure aplikazioa nolakoa izatea nahi dugun, komeni zaigun [container]{.verbatim} klasea aukeratu beharko dugu. Leihoaren tamaina aldatzen dugunean, edukiontziak bere tamaina aldatuko du, aurreko taula kontuan hartuta.


::: exercisebox
[[10c](https://github.com/yuki/ejercicios/blob/main/daw/diw/10c.html)]{.solution}

Sortu honako hauek dituen HTML bat:

- Edukiontzi-mota desberdinak.
- Egiaztatu zer gertatzen den leihoaren tamaina aldatzean.
- Bilatu nola gehitu padding-a eta goiko eta beheko marjina, Bootstrapen berezko klaseak erabiliz.
- Aztertu nabigatzailearen garatzaile-tresnekin edukiontzi bakoitzaren CSSa, Bootstrap-ek aplikatzen dituen CSS arauak eta dituzten *breakpoint*ak.
:::



## Zutabe-sistema {#sistema-columnas}

Bootstrapen ezaugarri ezagunenetako bat **[zutabeen](https://getbootstrap.com/docs/5.3/layout/columns/) sistema** da. Sistema horrek orri batean erabilgarri dagoen espazioa hainbat zutabetan banatzeko eta *layout* responsive-ak modu errazean sortzeko aukera ematen du. Sistema hiru klasetan oinarritzen da batez ere:

- [.container]{.verbatim}: batez ere edukiaren zabalera kontrolatzen du.
- [.row]{.verbatim}: zutabeak antolatzeko errenkada bat sortzen du.
- [.col]{.verbatim}: zutabeen artean erabilgarri dagoen espazioa banatzeko aukera ematen du.


Bootstrap-ek tradizionalki **12 zutabetan** oinarritutako sistema erabiltzen du. Horrek ez du esan nahi beti 12 HTML elementu sortu behar ditugunik; errenkada baten zabalera erabilgarri guztia kontzeptualki 12 zatitan bana daitekeela esan nahi du. Banaketa hauek izan daitezke: 2+10, 4+8, 6+6...

Garrantzitsua da Bootstrapen zutabe-sistema eta **CSS Grid** bereiztea. Bootstrap-ek Flexbox-en oinarritutako sistema erabiltzen du errenkada eta zutabeen sistema tradizionalerako; CSS Grid, berriz, CSSren berezko *layout* sistema da.


::: infobox
Garrantzitsua da Bootstrapen zutabe-sistema (Flexbox-en oinarritua) eta CSS Grid bereiztea. Biek antzeko arazoak konpon ditzakete, baina ez dira gauza bera.
:::


### [col-*]{.verbatim} klaseak {#clases-col}

12 zutabeetatik zenbat erabili nahi ditugun adierazteko, honako klase hauek erabil ditzakegu:

- [col]{.verbatim}: zutabe bat sortuko dela zehazteko. Zabalera Bootstrap-ek automatikoki erabakiko du, zenbat zutabe dauden kontuan hartuta.
- [col-1]{.verbatim}: zutabe bakar baten zabalera erabiltzen du.
- [col-2]{.verbatim}: bi zutaberen zabalera erabiltzen du.
- [col-12]{.verbatim}: 12 zutabeen zabalera osoa erabiltzen du.


Horrela, errenkada berean interesatzen zaigun zutabe-kopurua soilik erabiltzen duten edukiontziak sor ditzakegu. Errenkada berean dauden edukiontzien baturak ezin ditu 12 zutabeak gainditu; hala eginez gero, hurrengo errenkadara igaroko da.

:::::::::::::: {.columns}
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[Bi zutabeen adibidea]{.title}
```html
<div class="row">
  <div class="col">
    Columna izquierda
  </div>
  <div class="col-6">
    Columna derecha
  </div>
</div>
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[3 zutabeko adibidea]{.title}
```html
<div class="row">
  <div class="col-2">
    Columna pequeña
  </div>
  <div class="col-5">
    Columna ancha
  </div>
  <div class="col-5">
    Columna ancha
  </div>
</div>
```
:::

:::
::::::::::::::


::: questionbox
Zer gertatzen da zutabeen baturak 12 zenbakia gainditzen badu?
:::


### Zutabe hutsak {#columnas-vacías}

Errenkada batean guztira 12 unitate baino gutxiago erabil ditzakegu. Horren ondorioz, amaieran erabili gabeko espazioa geratuko da.

::: {.mycode size=footnotesize}
[3 zutabeko adibidea]{.title}
```html
<div class="row">
  <div class="col-2">
    Columna pequeña
  </div>
  <div class="col-5">
    Columna ancha
  </div>
  <div class="col-5">
    Columna ancha
  </div>
</div>
```
:::

Hasieran edo erdian zutabe hutsak jarri nahi baditugu, [offset]{.verbatim} eta [offset-*]{.verbatim} klaseak ditugu.

::: {.mycode size=footnotesize}
[Zutabe hutsune daukan adibidea]{.title}
```html
<div class="row">
  <div class="offset-3 col-2">
    Columna pequeña
  </div>
  <div class="col-5">
    Columna ancha
  </div>
</div>
```
:::

::: questionbox
Nola uste duzu egituratzen dela aurreko adibidea?
:::


### Zutabeen arteko tartea {#separación-entre-columnas}

Bootstrap-ek **[gutter](https://getbootstrap.com/docs/5.3/layout/gutters/)** sistema ere badu, hau da, zutabeen artean dagoen espazioa. Zutabeek ez dute zertan bisualki elkarren ondoan egon. Bootstrap-ek haien arteko espazioa [padding]{.verbatim} eta [margin]{.verbatim}-arekin lotutako propietateen bidez kudeatzen du.

Espazio horiek Bootstrapen klase espezifikoak erabiliz alda ditzakegu: [g-0]{.verbatim}, [g-1]{.verbatim} eta [g-5]{.verbatim}-eraino.

Espazio horizontala kontrolatu nahi badugu, [gx-*]{.verbatim} klaseak ditugu, eta espazio bertikalerako [gy-*]{.verbatim} klaseak.



### Zutabe responsive-ak {#columnas-responsive}

Zutabe-sistemaren abantaila nagusietako bat da tamaina desberdinak zehaztu ditzakegula *breakpoint*-aren arabera.


::: {.mycode size=footnotesize}
[*Responsive* zutabeko adibidea]{.title}
```html
<div class="row">
  <div class="col-6 col-xl-3">
    Contenido
  </div>
  <div class="col-6 col-xl-9">
    Contenido
  </div>
</div>
```
:::

Adibide honetan, tamaina handiko pantailetan zutabeek [3+9]{.verbatim} tamaina izango dute, eta *breakpoint*-a gainditu eta «XL» baino tamaina txikiagora igarotzen garenean (Bootstrapen [<1200px]{.verbatim}), [6+6]{.verbatim} tamainako bi zutabe izatera igaroko dira.

Zutabeen *breakpoint*-en tamaina adierazteko hainbat atzizki ditugu, aurretik ikusitakoekin bat datozenak: [sm]{.verbatim}, [md]{.verbatim}, [lg]{.verbatim}, [xl]{.verbatim} eta [xxl]{.verbatim}.


::: infobox
Sistema hau oso ondo pentsatuta dago **Mobile First** ikuspegiarekin lan egiteko.
:::


### Zutabeen lerrokatzea {#alineación-columnas}

Errenkadek Flexbox erabiltzen dutenez, lerrokatzearekin lotutako Bootstrapen klaseak erabil ditzakegu. **[Lerrokatze bertikala](https://getbootstrap.com/docs/5.3/layout/columns/\#vertical-alignment)** eta **[lerrokatze horizontala](https://getbootstrap.com/docs/5.3/layout/columns/\#horizontal-alignment)** bereiz ditzakegu.

Zutabeak dituen edukiontzia edukia baino altuagoa bada, honako lerrokatze bertikal hauek egin ditzakegu:

- Errenkada osoa bertikalki zentratzeko, honako klase hauek ditugu, **[row]{.verbatim}** elementuari gehitu behar zaizkionak:
  - [align-items-start]{.verbatim}
  - [align-items-center]{.verbatim}
  - [align-items-end]{.verbatim}
- Zutabea modu independentean lerrokatu nahi badugu, honako klase hauetako bat aplikatu behar diogu dagokion **[col]{.verbatim}** elementuari:
  - [align-self-start]{.verbatim}
  - [align-self-center]{.verbatim}
  - [align-self-end]{.verbatim}

Bestalde, zutabeak edukiontziaren barruan ardatz horizontalean modu *responsive*-an zentratu nahi baditugu, honako klase hauek ditugu dagokion **[row]{.verbatim}** elementuan aplikatzeko:

  - [justify-content-start]{.verbatim}
  - [justify-content-center]{.verbatim}
  - [justify-content-end]{.verbatim}
  - [justify-content-around]{.verbatim}
  - [justify-content-between]{.verbatim}
  - [justify-content-evenly]{.verbatim}


![Bootstrap bidezko [zutabeen lerrokatzearen adibidea](https://getbootstrap.com/docs/5.3/layout/columns/\#horizontal-alignment)](img/diw/bootstrap-columns.png){width=80% framed=true}


### Zutabeen ordena

Bootstrap-ek zutabeen ikusizko [ordena](https://getbootstrap.com/docs/5.3/layout/columns/\#order-classes) aldatzeko klaseak ere eskaintzen ditu. Horretarako, [order-*]{.verbatim} klaseak daude, eta **1etik 5era** bitarteko zenbaki bat gehi dezakegu. [order-first]{.verbatim} eta [order-last]{.verbatim} klaseak ere badaude.


::: exercisebox
[[10d](https://github.com/yuki/ejercicios/blob/main/daw/diw/10d.html)]{.solution}

Sortu zutabe-sistema desberdinak dituen HTML bat:

- Zutabe eta zabalera desberdinak egongo dira.
- Egiaztatu zer gertatzen den 12 zutabeak gainditzen dituzunean edo zutabe guztiak betetzen ez dituzunean.
- Gehitu zutabe hutsak *offset* erabiliz.
- Gehitu klaseak zutabe *responsive*-ak izateko, eta aldatu haien zabalera leihoaren tamaina aldatzean.
- Egiaztatu lerrokatze-sistemak, bai horizontala bai bertikala.
- Egin proba bat zutabeen ordena aldatzeko.
:::


## Ikonoak {#bootstrap-icons}

Ikonoak ekintza, informazio edo funtzionalitate bat modu bisualean irudikatzeko aukera ematen duten elementu grafikoak dira. Oso ohikoak dira interfaze modernoetan, eta botoietan, menuetan, inprimakietan, nabigazio-barretan edo mezuetan ager daitezke.

Bootstrap-ek ez ditu ikonoak zuzenean CSS framework nagusiaren barruan sartzen. Haiekin lan egiteko, **[Bootstrap Icons](https://icons.getbootstrap.com/)** izeneko liburutegi independentea dago, proiektu berak garatua.

Bootstrap Icons Bootstraparekin batera erabiltzeko diseinatutako ikono-bilduma da, baina modu independentean ere erabil daiteke. Liburutegiak ehunka ikono eskaintzen ditu SVG formatuan.

Bootstrap Icons-ez gain, antzeko helburua duten beste liburutegi batzuk ere badaude, ikonoak eskaintzeko:

- [Material Icons](https://mui.com/material-ui/material-icons/)
- [Lucide](https://lucide.dev/icons/)
- [Feather Icons](https://feathericons.com/)
- [Font Awesome](https://fontawesome.com/)

Ikonoen liburutegi bat erabiltzeak proiektuan **ikus-identitate koherentea** mantentzea ahalbidetzen du. Erabiltzeko errazak dira, normalean **ikono-kopuru handia** izaten dute eta, ikonoak bektorialak direnez, **tamaina alda dezakegu kalitatea galdu gabe**.


### Bootstrap Icons proiektuan txertatzea {#incluir-bootstrap-icons}

Proiektu independentea denez, ikonoetarako estilo-orri berri bat txertatu behar da, haren klaseak erabili ahal izateko.

Bootstrap-ekin gertatzen zen bezala, estilo-orria deskarga dezakegu gure proiektuan edukitzeko edo CDN bat erabil dezakegu. Bi kasuetan, estilo-orria gehitzea da egin behar duguna; aukeratutako metodoaren arabera helbidea aldatzen da.

::: {.mycode size=footnotesize}
[HTML Bootstrap Icons-ekin]{.title}
```html
<head>
  <!-- resto de cosas -->
  <link rel="stylesheet" href="css/bootstrap-icons.min.css">
</head>
```
:::



### Bootstrap Icons erabiltzea {#usar-bootstrap-icons}

Liburutegia txertatu ondoren, ikonoak erabil ditzakegu haien klaseen bidez. [Proiektuaren web-orrian](https://icons.getbootstrap.com/sprite/) dauden ikono desberdinak ikusi eta bilatu ditzakegu. Ikono bat aukeratzean, haren adibide desberdinak erakusten dizkigu, baita nola erabili ere, eta ikonoa [SVG](https://es.wikipedia.org/wiki/Gr%C3%A1ficos_vectoriales_escalables) formatuan deskargatzeko aukera ematen digu.


::: {.mycode}
[Ikono desberdinak]{.title}
```html
<h1><i class="bi bi-bootstrap"></i> Icons</h1>

<i class="bi bi-person fs-1 rojo"></i>

<button class="btn btn-primary bi bi-save-fill">
Guardar
</button>


<div class="alert alert-success bi bi-check-circle-fill" role="alert">
  A simple success alert.
</div>
```
:::

Aurreko adibidean hainbat ikono gehitu dira, eta botoi batean eta alerta-abisu batean ere txertatu dira. Horrela, erabiltzaileek bi elementuen helburua identifika dezakete.

Gure klase propioak gehi ditzakegu ikonoetan koloreak ezartzeko edo haien tamaina aldatzeko. Azken horretarako, [fs-1]{.verbatim} eta [fs-6]{.verbatim} arteko klase propioak ere badaude, letra-tipoaren tamaina aldatzeko.


![Bootstrap Icons erabiliz egindako adibidea](img/diw/bootstrap-icons.png){width=40%}


::: exercisebox
[[10e](https://github.com/yuki/ejercicios/blob/main/daw/diw/10e.html)]{.solution}

Erabili Bootstrap Icons:

- Botoietan, abisuetan, paragrafoetan...
- Gehitu zure arauak koloreak ezartzeko.
- Kopiatu [09b](https://github.com/yuki/ejercicios/blob/main/daw/diw/09b.html) ariketa eta gehitu ikonoak menuetan.
:::



<!-- 
# Personalización de Bootstrap {#personalización-bootstrap}

Bootstrap proporciona una gran cantidad de estilos y componentes preparados para utilizar directamente en una página web. Sin embargo, en un proyecto real no siempre queremos utilizar exactamente el aspecto que Bootstrap proporciona por defecto, ya que haría que nuestra web sea genérica y sin personalización.

Normalmente, vamos a querer utilizar unos colores corporativos concretos, modificar el tamaño de los botones, cambiar los bordes, adaptar los espacios o crear un diseño visual completamente propio. Por este motivo, Bootstrap permite diferentes formas de **personalización**, que se puede resumir en dos niveles:

1. Añadir nuestro propio CSS después de Bootstrap.
2. Personalizar Bootstrap mediante sus variables y herramientas de compilación.

La primera opción ya la hemos visto previamente, y por tanto, no es necesario volver a explicar. Para la segunda opción hay distintos apartados en la [documentación](https://getbootstrap.com/docs/5.3/customize/overview/), por lo que es interesante leer las distintas opciones.


El método más sencillo es redefinir las [variables CSS de Bootstrap](https://getbootstrap.com/docs/5.3/customize/css-variables/) con los valores que mejor noss convengan

-->

