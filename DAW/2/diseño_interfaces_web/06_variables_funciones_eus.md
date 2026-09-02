
# CSSko aldagaiak {#aldagaiak}

**CSSko aldagaiek**, **propietate pertsonalizatuak** (*Custom Properties*) ere deitzen direnek, estilo-orri baten barruan berrerabil daitezkeen balioak gordetzeko aukera ematen dute. Horiei esker, koloreak, tamainak, marjinak edo beste edozein balio behin bakarrik definitu eta proiektu osoan zehar berrerabil ditzakegu.

Haien erabilerak kodearen mantentzea errazten du, balioak bikoiztea saihesten du eta askoz errazagoa egiten du gai argiak edo ilunak sortzea, edo aplikazio baten ikus-identitatea aldatzea.

Gaur egun arraroa da aldagaiak ez erabiltzea, baina aldagaiak ez ziren eraginkorrak izan nabigatzaile askotan 2016ra arte, eta aurretik haien erabilera CSS aurreprozesadoreetan baino ez zen existitzen.

## Nola sortu aldagai bat CSSn {#aldagaiak-sortu}

CSS aldagai bat propietate bat da, eta haren izena bi marratxorekin hasten da ([\-\-]{.verbatim}); ondoren, [var()]{.verbatim} funtzioaren bidez erabil dezakegu, aurretik emandako izena adieraziz. Aldagaiak [\-\-]{.verbatim}-rekin hastearen arrazoia propietate pertsonalizatuak CSSren propietate estandarretatik bereiztea da.

:::::::::::::: {.columns columnsep=0.5cm}
::: {.column width="40%"}

::: {.mycode size=footnotesize}
[Aldagaia sortu]{.title}
```css
:root {
  /* COLORES */
  --color-main: #2563eb;
  --color-ok: #16a34a;
  --color-error: #dc2626;
  --color-text: #222222;
  /* ESPACIO */
  --espacio-md: 1rem;
  /* BORDES */
  --bordes: 2px;
  --radio: 10px;
}
```
:::

:::
::: {.column width="60%" }

::: {.mycode size=footnotesize}
[Aldagaia erabili]{.title}
```css
h1 {
    color: var(--color-main);
}
a {
    color: var(--color-main);
}
.ok {
    border: var(--bordes) solid var(--color-ok);
    border-radius: var(--radio);
    padding: var(--espacio-md);
}
```
:::

:::
::::::::::::::

Ohikoena aldagaiak [:root]{.verbatim} hautatzailearen barruan deklaratzea da; horrela, aldagaiak orrialde osoan egongo dira eskuragarri. Horregatik, diseinuaren konfigurazio globala gordetzeko erabiltzen den lekua izan ohi da.

Aldagaiak behar adina aldiz erabil daitezke, eta etorkizunean aldaketak egin nahi badira, deklarazioan bakarrik aldatu behar da, eta horrek orrialde osoa aldatzea eragingo du.

Adibidean ikus daitekeen bezala, aldagaiak koloreetarako ez ezik, tarteetarako eta baita tipografietarako ere erabil daitezke.

::: infobox
Aldagaiak kategorien arabera taldekatzea eta izen deskribatzaileen konbentzio bat mantentzea gomendatzen da.
:::


## Aldagai lokalak eta herentzia {#aldagai-lokalak-herentzia}

Aurreko atalean aldagai "globalak" nola sortu ikusi dugu, [:root]{.verbatim} barruan definitu baitira, baina elementu baterako aldagai lokalak ere sor ditzakegu. Kontuan izan behar da CSSko aldagaiak **heredatu egiten direla**; beraz, aldagai bat elementu batean definitzen badugu, haren seme-alabek erabili ahal izango dute.

::: mycode
[Aldagai lokala eta heredatua]{.title}
```css
.tarjeta {
    --color-local: blue;
}

.tarjeta p {
    color: var(--color-local);
}
```
:::

Aldagaia [.tarjeta]{.verbatim} barruan eta haren ondorengo elementuetan baino ez da existitzen. Horri esker, konfigurazio propioak dituzten osagaiak sor ditzakegu.

Garrantzitsua da aldagai lokalak sortzean kontuan izatea osagai bakoitzak izen bereko beste aldagai bat defini dezakeela, eta, beraz, definizio desberdinak izango direla, osagai bakoitzak bere testuingurua mantentzen baitu:


:::::::::::::: {.columns }
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[Aldagai lokala osagai batean]{.title}
```css
.alerta {
    --color: #dc2626;

    color: var(--color);
    border: 2px solid var(--color);
}
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[Aldagai lokala osagai batean]{.title}
```css
.exito {
    --color: #16a34a;

    color: var(--color);
}
```
:::

:::
::::::::::::::


## Aldagaiak berriro esleitzea berrerabiltzeko {#reutilización-componentes}

Osagai generikoak sor ditzakegu eta, ondoren, aldaerak sortu aldagai baten balioa bakarrik aldatuz; horrela, ez ditugu propietate guztiak errepikatu behar.

:::::::::::::: {.columns }
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[Osagai generala]{.title}
```css
.boton {
  --color-boton: #2563eb;
  background: var(--color-boton);
  border: 2px solid var(--color-boton);
  color: white;
}
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[Kolore aldaketa]{.title}
```css
.boton-rojo {
    --color-boton: #dc2626;
}

.boton-verde {
    --color-boton: #16a34a;
}
```
:::

:::
::::::::::::::

Ondoren, HTMLn osagaiak behar ditugun klaseak izango ditu.


::: exercisebox
[[05a](https://github.com/yuki/ejercicios/blob/main/daw/diw/05a.html)]{.solution}

Sortu hainbat aldagai global eta lokal, heredatu eta aldatu egiten direnak osagai desberdinetan, eta erabil itzazu.
:::



## Balio lehenetsiak [var()]{.verbatim}-rekin {#valores-por-defecto-var}

[[var()]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference/Values/var) funtzioak bigarren parametro bat onartzen du, ordezko balio gisa erabiltzen dena. Lehenengo aldagaia existitzen ez bada, bigarren balioa erabiliko du.

::: mycode
[Lehendabiziko balorea eta ordezkoa]{.title}
```css
color: var(--color-texto, black);
```
:::

Mekanismo hau erabilgarria da osagai berrerabilgarriak garatzen ditugunean.


## Aldagaiak eta modu iluna {#variables-modo-oscuro}

CSSko aldagaien abantaila handienetako bat gaiak sortzeko aukera da. Gaur egun ohikoa da webguneek modu argia eta modu iluna izatea.


:::::::::::::: {.columns }
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[Gaiak]{.title}
```css
/* tema claro*/
:root {
    --fondo: white;
    --texto: #222;
}
/* tema oscuro */
body.dark {
    --fondo: #111;
    --texto: #eee;
}
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[Gaia erabili]{.title}
```css
body {
    background: var(--fondo);
    color: var(--texto);
}
```
:::

:::
::::::::::::::


[<body>]{.verbatim}-ren klasea aldatzean, interfaze osoa automatikoki aldatzen da.



## Aldagaiak eta [calc()]{.verbatim} {#variables-calc}

Aldagaiak CSSko funtzioekin konbina daitezke; horrela, nabigatzaileak kalkulua automatikoki egiten du.

:::::::::::::: {.columns }
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[Aldagaia]{.title}
```css
:root {
    --espacio: 1rem;
}
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[[calc]{.verbatim} erabilera]{.title}
```css
.caja {
    padding: calc(var(--espacio) * 2);
}
```
:::

:::
::::::::::::::


Konbinazio hau oso indartsua da diseinu-sistema malguak sortzeko.



<!-- 
TODO: poner esto aquí o más adelante?
## Variables y media queries {#variables-media-queries}

También podemos modificar variables dentro de una media query.

```css
:root {
    --ancho: 90%;
}

@media (min-width: 1200px) {
    :root {
        --ancho: 1100px;
    }
}
```

Después:

```css
.contenedor {
    width: var(--ancho);
}
```

La lógica queda centralizada en un único lugar.

-->



# CSSko funtzioak {#funciones-css}

**CSSko funtzioak** estilo-orri baten barruan kalkuluak egiteko, koloreak manipulatzeko, aldagaiak erabiltzeko edo balio dinamikoak sortzeko aukera ematen duten adierazpen bereziak dira. Funtzio bat izen batez eta ondoren parentesiez osatuta dagoelako ezagutzen da. Horietako batzuk dagoeneko ikusi ditugu, hala nola:

- [[calc()]{.verbatim}](#calc): kalkuluak egiten ditu, neurri-unitate desberdinak erabiltzeko aukera emanez.
- [[min()]{.verbatim}](#min-y-max): gutxieneko balioa itzultzen du.
- [[max()]{.verbatim}](#min-y-max): gehieneko balioa itzultzen du.
- [[clamp()]{.verbatim}](#clamp): balioa gutxieneko, hobetsitako eta gehieneko balio baten artean mugatzen du.
- [[var()]{.verbatim}](#variables): aldagaiak erabiltzeko.
- [[url()]{.verbatim}](#background-image): irudiak gehitu ahal izateko.

Beste funtzio batzuk ere badaude, ia guztiak funtzio matematikoak, [dokumentazioan](https://developer.mozilla.org/en-US/docs/Web/CSS/Guides/Custom_functions_and_mixins) ikus ditzakegunak. Interesgarria da horiek ezagutzea, agian erabilgarriak izango baitira gure proiektuan.


##  [if()]{.verbatim} funtzioa {#función-if}

CSS estilo-orrietarako hizkuntza gisa sortu bazen ere, dagoeneko ikusi dugu funtzioak eta aldagaiak dituela eta kalkuluak egiteko aukera ematen duela. Gainera, etengabe garatzen ari denez, 2025ean [[if()]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference/Values/if) baldintza sortzea proposatu zen.

::: errorbox
[if()]{.verbatim} baldintza gaur egun Chrome, Opera eta horien eratorrietan baino ez da funtzionala. Ez dugu erabiliko.
:::


:::::::::::::: {.columns }
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[[if()]{.verbatim} funtzioa]{.title}
```css
.ok {
    background-color: if(
        style(--black: true): black;
        else: white;
    );
    color: if(
        style(--black: true): white;
        else: black;
    );
}
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[Gai iluna erabili]{.title}
```HTML
<div class="ok">
    Lorem ipsum ... 
</div>
<div class="ok" style="--black: true">
    Lorem ipsum ...
</div>
```
:::

:::
::::::::::::::

Adibidean baldintza nola erabili ikus dezakegu, testuaren kolorea eta atzeko planoa aldatzeko.



## Funtzioak sortzea {#creación-funciones}

Berriro ere, atal honek CSS garatzen eta estilo-orri baten berezkoak baino programazio-lengoaien ezaugarri propioagoak gehitzen ari dela ikusteko baino ez du balio.

[[@function]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference/At-rules/@function) arauak funtzio berrerabilgarriak definitzeko aukera emango digu; horiei parametroak pasa eta balioak itzuli ahal izango dizkiegu.

::: errorbox
[@function]{.verbatim} araua gaur egun Chrome, Opera eta horien eratorrietan baino ez da funtzionala. Ez dugu erabiliko.
:::

:::::::::::::: {.columns columnsep=0.5cm}
::: {.column width="43%"}

::: {.mycode size=footnotesize}
[Funtzioaren sortu]{.title}
```css
:root {
  --espacio-md: 1rem;
}

@function --double(--value) {
  result: calc(var(--value) * 2);
}

```
:::

:::
::: {.column width="57%" }

::: {.mycode size=footnotesize}
[Funtzioa erabili]{.title}
```css
p {
  --base-spacing: 10px;
  border-radius: --double(var(--espacio-md));
  padding: --double(var(--espacio-md));
}
```
:::

:::
::::::::::::::

Parametro gisa balio bat jasotzen duen eta haren bikoitza itzultzen duen funtzio bat deklaratu da. Funtzioa erabiltzean, aurretik existitzen den aldagai bat pasa zaio; horrela, CSS ia "programazio-lengoaia" bihurtzen ari dela ikus dezakegu.


::: exercisebox
[[05b](https://github.com/yuki/ejercicios/blob/main/daw/diw/05b.html)]{.solution}

Probatu adibide hau Chrome-n eta bateragarria ez den beste nabigatzaile batean.
:::


