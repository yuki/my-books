
# Sarrera {#introducción-evolución-diseño-web}

Interneten nabigatzen dugunean erraza da pentsatzea web orriak beti gaur egun daukaten itxura izan dutela beti. Hala ere, web diseinua asko eboluzionatu du [World Wide Web](https://es.wikipedia.org/wiki/World_Wide_Web) sortu zenetik, azken hamarkadako hasieran.

Lehenengo web orriak oso sinpleak ziren eta ia testu bakarrik osatuak zeuden. Urteak pasa ahala teknologia berriak agertu ziren, irudiak, estiloak, animazioak eta askoz elaboratuagoak diren interfazeak txertatzea ahalbidetu zituztenak.

Eboluzio hori ezagutzeak aukera ematen du zergatik sortu ziren teknologi batzuk, nola sortu diren gaur erabiltzen diren estandarrak eta zein diren web interfazeen garapenean jarraitu beharreko praktika onak.


# Web diseinuaren historia {#historia-diseño-web}
<!-- Copiado de DAW/2/desarrollo_entorno_cliente/01_introduccion.md -->

## Lehenengo urteak: web orri estatikoak {#primeros-años}

1991ean [Tim Berners-Lee](https://en.wikipedia.org/wiki/Tim_Berners-Lee)k HTML garatzen hasten du [CERN](https://en.wikipedia.org/wiki/CERN)en. Ez zuen HTML hizkuntza bakarrik sortu, [HTTP (HyperText Transfer Protocol)](https://es.wikipedia.org/wiki/Protocolo_de_transferencia_de_hipertexto) protokoloa eta lehenengo web zerbitzari ere sortu zen.

![Web zerbitzari lehenengoa](img/dec/First_Web_Server.jpg){width=50%}

<!-- FIN copiado de DAW/2/desarrollo_entorno_cliente/01_introduccion.md -->

Lehenengo web orriak HTML hizkuntzan bakarrik idazten ziren eta egitura oso sinplea zuten. Ez zegoen edukia eta aurkezpena bereizteko inolako banaketarik. HTML propioak adierazten zituen bai dokumentuaren egitura, bai itxura.

Lehenengo urte hauetan nabigatzaileak agertu ziren, hala nola:

- [WorldWideWeb](https://es.wikipedia.org/wiki/WorldWideWeb)
- [Mosaic](https://es.wikipedia.org/wiki/Mosaic)
- [Netscape Navigator](https://es.wikipedia.org/wiki/Netscape_Navigator)

## Nabigatzaileen guda (1995-2000) {#guerra-navegadores}

90eko hamarkadaren erdialdean Internet azkar hazten hasi zen. Microsoftek **Internet Explorer** kaleratu zuen, bitartean Netscape merkatuan lehenengo postuan zegoen. Bi enpresa lehia bizia hasi zuten beren aurkaria baino ezaugarri berriak aurretik txertatzeko.

Aldi hau **[nabigatzaileen guda](https://es.wikipedia.org/wiki/Guerra_de_navegadores)** izenez ezagutzen da, nabigatzaile bakoitzak bere HTML etiketak ezartzen zituelako. Ondorioz:

- Web orri bat nabigatzaile batean ondo funtziona zitekeen eta beste batean erroreak aurkezten zituen.
- Garatzaileek bertsio espezifikoak sortu behar zituzten nabigatzaile desberdinetarako.
- Webguneen mantentzea zailtzen zen.

Ohikoa zen webguneek "Internet Explorererako optimizatutako gunea" edo "Netscape Navigatorrekin bateragarria" mezuak izatea arazo honen ondorioz.


### Edukia antolatzeko taulak {#tablas-maquetar-contenido}

CSS oso zabalduta ez zegoen bitartean, garatzaile askok HTML taulak erabiltzen zituzten edukia antolatzeko.

::: mycode
[Edukiak antolatzeko taula]{.title}

```html
<table>
    <tr>
        <td>Menú</td>
        <td>Contenido</td>
    </tr>
</table>
```
:::


Taulak datu tabularrak bistaratzeko diseinatuta zeuden, ez diseinu osoak sortzeko, baina urte askotan web orriak eraikitzeko tresna nagusia izan ziren. **Gaur egun praktika hau guztiz desegokia da**.

## CSSaren agerpena {#aparición-css}

1996an **[CSS](https://es.wikipedia.org/wiki/CSS) (Cascading Style Sheets)** agertu zen, web garapenaren arazo nagusietako bat konpontzeko helburuarekin: **edukia eta aurkezpena bereiztea**.

:::::::::::::: {.columns }
::: {.column width="47%"}

::: {.mycode}
[HTML]{.title}
```html
<h1>Título</h1>
```
:::

:::
::: {.column width="47%" }

::: {.mycode}
[CSS]{.title}
```css
h1{
    color: blue;
    text-align:center;
}
```
:::

:::
::::::::::::::

Orduz geroztik:

- **HTML**-ek **egitura** deskribatzen zituen.
- **CSS**-ek **itxura bisuala** kontrolatzen zuen.

Bereizketa horrek abantaila ugari eskaintzen zituen:

- Kode garbiagoa.
- Mantentze erraztasun handiagoa.
- Estiloen birerabilpena.
- Irisgarritasun hobea.
- Diseinu uniformea webgune osoan.

CSS 1996an agertu arren, hainbat urte pasa ziren nabigatzaileek behar bezala ezartzen hasi arte.


## Web 2.0 {#web-2-0}

2000eko hamarkadaren hasieran Internet sakon aldatu zen. Erabiltzaileak irakurle soilak izatetik edukien sortzaile ere bihurtu ziren. Aldi honi **Web 2.0** deritzo.

Web orriak honako elementuak txertatzen hasi ziren:

- Blogak.
- Sare sozialak.
- Wikiak.
- Iritziak.
- Foroak.
- Merkataritza elektronikoa.

Diseinua ere asko eboluzionatu zuen. Populartsu bihurtu ziren:

- Botoi handiak.
- Itzalak.
- Gradienteak.
- Ertz biribildutakoak.
- Ikono koloretsuak.
- Menú elaboratuagoak.


## HTML5 eta CSS3 {#html5-css3}

2010 inguruan bi estandar nagusi sendotzen hasi ziren: **HTML5** eta **CSS3**, web garapena erabat eraldatu zutenak. Garrantzitsuenak diren berrikuntzen artean hau aurkitzen dugu:

+-----------------------------------------------------------------+------------------------------------------------------------+
| HTML5                                                           | CSS3                                                       |
+=================================================================+============================================================+
| ● Etiketa semantikoak.      `<br>`{=html} `\linebreak`{=latex}  | ● Ertz biribildutakoak. `<br>`{=html} `\linebreak`{=latex} |
| ● Bideo natiboa.            `<br>`{=html} `\linebreak`{=latex}  | ● Itzalak.             `<br>`{=html} `\linebreak`{=latex}  |
| ● Audio natiboa.            `<br>`{=html} `\linebreak`{=latex}  | ● Gradienteak.         `<br>`{=html} `\linebreak`{=latex}  |
| ● Canvas.                   `<br>`{=html} `\linebreak`{=latex}  | ● Animazioak.          `<br>`{=html} `\linebreak`{=latex}  |
| ● SVG.                      `<br>`{=html} `\linebreak`{=latex}  | ● Eraldaketak.         `<br>`{=html} `\linebreak`{=latex}  |
| ● Inprimaki osatuagoak.                                         | ● Media Queries.                                           |
+-----------------------------------------------------------------+------------------------------------------------------------+

Table: {tablename=yukitblr colspec=X[1,l]X[1,l]}

## Mugikorretarako gailuen gorakada {#auge-dispositivos-móviles}

2007an lehen iPhone agertu zen, eta nahiz eta jada Interneten nabigatzeko gailu mugikorrak egon, horietako bat ere ez zen honen renderizazio kalitateari iristen, **nabigatzaile erreala** baitzen. Denbora gutxi ondoren *smartphone* ezagun bihurtzen hasi ziren, eta horrek Interneten nabigatzeko modua erabat aldatu zuen.

Dizainatzaileek ezin zuten bakarrik mahaigaineko monitoreentzako orriak sortu, gaur egun beharrezkoa baitzen honakoa pentsatzea:

- Pantaila txikiak.
- Pantaila ukigarriak.
- Bereizmen desberdinak.
- Orientazio desberdinak.

### *Responsive Web Design* {#responsive-web-design}

2010ean Ethan Marcottek **[Responsive Web Design](https://en.wikipedia.org/wiki/Responsive_web_design)** terminoa ezagun bihurtu zuen. Bere proposamena edozein pantailaren tamainara automatikoki egokitzen diren orriak sortzea zen.

Horretarako hasi ziren erabiltzen:

- Diseinu fluidoak.
- Media Queries.
- Irudi moldagarriak.
- Unitate erlatiboak.

Gaur egun responsive diseinua funtsezko baldintza da ia edozein webguneetan.

![Iturria: [Wikipedia](https://en.wikipedia.org/wiki/Responsive_web_design) eta [Stéphanie Walter](https://stephaniewalter.design/)](img/diw/Content-is-like-water.svg){width="70%"}


## Flexbox eta CSS Grid-en etorrera {#llegada-flexbox-grid}

Urte askotan CSS bidez diseinu konplexuak sortzea zaila zen. *float*, taulak eta posizio absolutuak bezalako teknikak erabiltzen ziren.

Soluzio hauek ez ziren oso malguak eta mantentzea zaila zen. Aldaketa hori [flexbox]{.verbatim} eta [CSS Grid]{.verbatim} etorri zenetik gertatu zen, eta maquetazioan kalitate- eta mantentze-jauzi handia ekarri zuen. Gaur egun bi sistema hauek diseinu modernoko oinarria osatzen dute.


## Diseinuaren eboluzioa {#evolución-diseño}

Urte askotan interfazeek objektu errealak imitatzen saiatzen ziren. Filosofia hori **[skeuomorfismoa](https://en.wikipedia.org/wiki/Skeuomorph\#Virtual_examples)** izenez ezagutzen da:

- Botoiak botoi fisikoak bezalakoak ziren.
- Karpetak karpeta errealak bezalakoak ziren.
- Egutegiak paper-egutegiak imitatzen zituzten.

![Skeuomorfismoaren adibidea iOS 6-n. Iturria: [AppleInsider](https://appleinsider.com/articles/22/08/23/what-apple-learned-from-skeuomorphism-and-why-it-still-matters)](img/diw/skeumorphism.jpg){width="70%"}

2012tik aurrera alderantzizko joera bat hasi zen nagusitzen, **Flat Design** izenekoa. Bere ezaugarri nagusiak hauek dira:

- Kolore solidoak.
- Efektu bisual gutxi.
- Testurarik eza.
- Itzal minimoak.
- Diseinu garbia.
- Ikono sinpleak.

Microsoft estilo honen lehenengo sustatzaile handietako bat izan zen Windows Phone-rekin. Geroago Applek eta Googlek antzeko diseinuak hartu zituzten. 2014an Googlek **Material Design** aurkeztu zuen, ez zena estilo bisualen multzo bat bakarrik, diseinu sistema osoa baizik. Material Design-ek honakoak definitzen ditu:

- Koloreak.
- Tipografiak.
- Animazioak.
- Ikonografia.
- Tarteak.
- Osagai berrerabilgarriak.

Bere helburua Googleko aplikazio guztietan esperientzia koherentea eskaintzea zen. Gaur egun oraindik eboluzionatzen ari da eta web garapenaren diseinu sistema eraginkorrenetako bat da.

## Etorkizunera begira {#mirando-futuro}

Web diseinua etengabe eboluzionatzen ari da. Gaur egungo joera batzuk hauek dira:

- Modu iluna (*Dark Mode*).
- Web aplikazio progresiboak (PWA).
- Mikroanimazioak eta animazio diskretuak.
- Osagaietan oinarritutako diseinua.
- Diseinu-sistema partekatuak.
- Irisgarritasuna garapenaren lehen faseetatik.
- Errendimendu handia.

Nahiz eta tresnak azkar aldatzen diren, diseinu on baten oinarrizko printzipioak ia aldatu gabe geratzen dira.


::: infobox
20 urte baino gehiago dituen web orri bat nabigatzaile moderno batean ikusgai egon daiteke oraindik. Atzera bateragarritasun hori Webaren arrakasta handiko gakoetako bat izan da.
:::

