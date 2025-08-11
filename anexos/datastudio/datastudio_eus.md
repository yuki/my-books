
# Informazio-panelak {#dashboards}

Informazio-panelek (ingelesez *dashboard*) datuak modu grafikoan bistaratzea ahalbidetzen diguten tresnak dira, programaziorik egin beharrik gabe informazio bihurtzeko.

Esan genezake panelak aldez aurretik programatutako interfaze grafiko bat direla, datu-iturri batetik (kalkulu-orri bat, CSV fitxategi bat, datu-base bat, ...) datuak lortzen dituena, ondoren modu grafikoan bistaratzeko.


# Ezaugarriak {#características}

Informazio-panelek honako ezaugarri hauek izaten dituzte normalean:

-   **Erabilerrazak dira**: ez da beharrezkoa programatzailea izatea haiek erabiltzeko, **betiere datuak formatu egokian baditugu**.

-   **Grafiko mota desberdinak** erabiltzeko aukera ematen dute: taulak, datu geolokalizatuetarako mapak, bero-mapak, tarta motako grafikoak, barra-mapak (horizontalak eta bertikalak), ...

-   **Interaktiboak dira**: grafikoak elkarri lotuta egon daitezke, eta horrela, batean atal bat hautatzean, gainerakoak eguneratzen dira.

    ::: center
    ![Grafiko estekatuak](img/anexos/datastudio/graficos.png){width="90%" framed=true}
    :::

-   **Iragazkiak** sor daitezke datuetan bilaketa bat egiteko.

-   Sortutako dashboard-a **parteka** dezakegu edo aurkezpen bat sor dezakegu.

Aitzitik, erabiltzerakoan zenbait desabantaila ere egon daitezke, eta argi izan behar ditugu haiek erabili aurretik:

-   **Ematen dituzten ezaugarrietara mugatuta gaude**. Beraz, eskaintzen dituztenak ez diren grafikoak sortu nahi baditugu, ezingo dugu egin.

-   Datuak **tresnak onartzen duen formatuan** egon behar dute. Guk programatzen badugu, formatua gurea izan daiteke, edo datu-hiztegia gure gustura egon daiteke.

-   Tresnarekiko **menpekotasuna**. Funtzionalitateak kentzea, ordaindu beharra jartzea, ... erabakitzen badute, datuak migratu eta panela berriro sortu beharko dugu.

# Datuak ulertzea {#datuak-ulertzea}

Informazio-panela sortu aurretik, argi izan behar dugu zer datu mota ditugun, nola antolatuta dauden (edo antolatu behar ditugun), zein formatu duten, ... horregatik, aurretiazko azterketa bat egin behar dugu.

## Datuen analisia {#datuen-analisia}

Datuen analisia egiterakoan, gutxienez, honako ezaugarri hauek kontuan hartu behar ditugu:

-   **Datuen iturria**: Datu propioak al dira? Edozein unetan berreskura al ditzakegu? Fidagarriak al dira?

-   **Datuen formatua**: Ez dugu kontuan hartu behar soilik datuak jasotzen ditugun fitxategiaren formatua, baizik eta datuak normalizatuta dauden ala ez ere. Adibidez, zenbakiak osoko/erreal formatuan ala testu formatuan gordeta dauden; geolokalizazio-daturik badagoen, bereizita ala agregatuta dagoen; ...

-   **Datuak ulertzea**: Nahiz eta agerikoa dirudien, beharrezkoa da **datuetako atal bakoitza ulertzea**, ondoren elkarrekin erlazionatzeko eta panelean/grafikoan erabiltzeko.

## Datuen eskema sortzea {#datuen-eskema-sortzea}

Aurreko puntua kontuan hartuta, baliteke datuak normalizatzea edo formatu espezifiko bat sortzea beharrezkoa izatea. Beraz, hori egiteko aukera emango digun tresnaren edo programazio-lengoaia baten ezagutza izan behar dugu.

Lortutako datu gordinek esperoak betetzen ez badituzte, egin beharreko lanen artean egongo dira:

-   **Datuak normalizatzea**: Datu mota bakoitza behar duen formatura bihurtzea. Adibidez, [OpenData Euskadi](https://opendata.euskadi.eus/inicio/) plataformako zenbait geoposizio-datutan, [UTM](https://en.wikipedia.org/wiki/Universal_Transverse_Mercator_coordinate_system) izeneko formatu bat erabiltzen dute, eta hori latitude eta longitude bihurtu behar da.

-   **Datu-hiztegia**: Datuetara eta erabiliko dugun panel-sistemara ondoen egokitzen den eskema/datu-hiztegia sortzea.

## Fitxategi mota sortzea {#fitxategi-mota-sortzea}

Azkenik, beharrezkoa izango da tresnak behar duen formatuan fitxategi mota sortzea: json, CSV, excel formatuan, ...

Horretarako, datuen eskemaren arabera, fitxategia tresna sinpleekin sor dezakegu (adibidez, excel, CSV formatuan fitxategi bat sortzeko) edo, agian, programazio-lengoaiak eta lan hori errazten diguten liburutegi espezifikoak erabili beharko ditugu (adibidez, python).

## Analisiaren dokumentazioa {#analisiaren-dokumentazioa}

Beti gomendagarria da datuen analisi-prozesua dokumentatzea, etorkizunean edo denbora bat igarota ulertzeko zergatik aldatu diren datuak egin diren moduan, edo zergatik erabili den fitxategi mota bat eta ez beste bat.

Dokumentazioak, gainera, erraztuko du geroago aldaketak egitea edo tresna berrietara egokitzapenak egitea. Horrela, hasiera batean, lanaren zati bat egina izango dugu eta ez dugu berriro egin beharko.

# Looker Studio informazio-panelen sortzaile gisa {#looker-studio-informazio-panelen-sortzaile-gisa}

[Looker Studio](https://lookerstudio.google.com/), lehen DataStudio izenez ezagutzen zena, Google-ren tresna bat da, datu desberdinetatik hornitutako informazio-panelei forma eta ikusgarritasuna emateko.

Tresna hau doakoa da, erabiltzeko erraza, eta emandako datuekin mota askotako panelak sortzeko aukera ematen du. Horrez gain, bestelako bistaratze motak ere sor daitezke, eta komunitateak [panel](https://lookerstudio.google.com/visualization) berriak eskaintzen ditu.

Panelak sortzeko, datuak behar ditugu, eta hauek hainbat iturritatik inporta edo erabili ahal izango ditugu, adibidez:

-   CSV fitxategiak (comma separated value)

-   Google kalkulu-orriak

-   MySQL, PostgreSQL, SQL Server, ... datu-baseak

-   Komunitateak sortutako beste konektore batzuk

## Datuak eskuratzea {#datuak-eskuratzea}

Lehenik eta behin, datu-iturri bat sortu beharko dugu, lortutako datuak bertara igo ahal izateko. Aurrez aipatu den bezala, beharrezkoa da haien analisia egitea, eta, behar izanez gero, ondoren normalizatzea.


:::::::::::::: {.columns }
::: {.column width="30%"}
![[OpenData Euskadi](https://opendata.euskadi.eus/inicio/)n bilaketa egin](img/anexos/datastudio/opendata.png){width="100%"}
:::
::: {.column width="63%" }

Adibide honetan, [OpenData Euskadi](https://opendata.euskadi.eus/inicio/) plataformatik lortutako datuekin Google kalkulu-orri bat erabiliko da. Bilatuko dugu datuak CSV eta/edo Excel-eko XLS formatuan egotea, horrela datuen bihurketa ez dadin hain konplexua izan.

[Datuak JSON formatuan](https://es.wikipedia.org/wiki/JSON) edo beste formatu batean badaude, agian aldez aurretik bihurketa bat egin beharko genuke. Gainera, datuak manipulatu nahi izanez gero, ez litzateke hain zuzena izango.

Bilaketa egin ondoren, emaitzen zerrenda bat lortuko dugu, eta bertan aztertu ahal izango dugu gure interesekoak diren ala ez. Zenbait kasutan, izenak nahiko adierazgarriak dira. Gure interesekoak diren eta geolokalizazio-datuak dituzten datuak bilatuko ditugu.

:::
::::::::::::::


Behin datuak deskargatu eta Google kalkulu-orri batean sartu ondoren, datuen analisia egin beharko dugu. Besteak beste, honako hauek egin beharko genituzke:

-   Lehenengo errenkada berrizendatu, zutabe bakoitza behar bezala identifikatuta egon dadin.

-   Datu bikoiztuek ezabatu daitezkeen egiaztatu.

-   Ez interesatzen zaizkigun eta/edo hutsik dauden zutabeak ezabatu.

-   Datu geografikoak formatu egokian dauden egiaztatu. Horretarako, Google Maps-en erabiliz dagokion udalerrira egiten duten erreferentzia ikus dezakegu.

    -   Latitude eta longitude datuak zelula berean egon behar dute, koma batez bereizita.

    -   UTM formatuan badaude, bihurtu egin beharko lirateke ([konbertsore hau](https://yuki.github.io/utm-converter/) erabil daiteke).

Behin hori eginda, datuak erabiltzeko prest izango genituzke.

## Datu-iturri bat sortzea Looker Studio-n {#datu-iturri-bat-sortzea-looker-studio-n}

Datuak informazio-paneletan erabili ahal izateko, lehenik eta behin "Datu-iturri" bat gehitu behar dugu. Horretarako, "Sortu → Datu-iturri" aukeratuko dugu, eta interesatzen zaigun konektore espezifikoa hautatuko dugu.

Google kalkulu-orri bat erabiltzen badugu, hura atzitzeko baimenak eman beharko dizkiogu, eta interesatzen zaigun kalkulu-orria aukeratuko dugu. Inportazioan zenbait aukera hautatzeko aukera ere emango digu:

![Datu-iturri sortzea](img/anexos/datastudio/crear_fuente_datos.png){width="90%" framed=true}

Inportazioa egin ondoren, datu-iturriaren barruan, datu bakoitzaren iturri mota identifikatu behar dugu. Zenbait kasutan, Looker Studio-k mota zuzena identifikatuko du, baina beste batzuetan ez, geolokalizazio-posizioekin gertatzen den bezala.

![Datu normalizatuak](img/anexos/datastudio/datos_normalizados.png){width="90%" framed=true}

Behin datuak normalizatuta, txostena sortzen has gaitezke.

## Txosten sortzea {#txosten-sortzea}

Datuen normalizazioa amaitu ondoren, txostena sortzen hasteko momentua da eta datuak informaziora bihurtzeko. Horretarako, pentsatu beharko dugu zer mota informazio erakutsi nahi dugun eta nola.

Looker Studio-k hainbat grafikotan erabilera eskaintzen digu, bakoitzak bere berezitasunak eta konfigurazioa dituenez, interesgarria da bakoitza ikertzea eta nola funtzionatzen duen egiaztatzea.

Jarraian, batzuk azalduko dira:

-   **Taula**: Datuak erakusteko modurik errazena da, eta izenak dioen moduan, taula formatuan, errenkada eta zutabeetan banatuta. Zutabeak orden egokian jarri ahal izango ditugu, ordenaketa sistema sortu, errenkada bikoitz edo bakoitzari koloreak gehitu, eta abar.

-   **Emaitzen koadroa**: Normalean datu hautatu edo totalen kopurua kontatzeko erabiltzen dira.

-   **Barren grafikoa**: Datuak zutabeetan biltzen ditu, bertikal, horizontala, goranzkoa edo beheranzkoa aukeratu ahal izanik.

-   **Mapak**: Mapa mota desberdinak daude, eta datuen arabera modu batean edo bestean bistaratuko dituzte.

    -   **Berotasun mapa**: Datuen posizioekin berotasun mapa bat sortzen du.

    -   **Burbuila mapa**: Datuak geolokalizatzen ditu zirkulu txikiak gehituz. Horiek kolore desberdinetakoak izan daitezke, datuen aspektu nabarmen bat identifikatuz.

<!-- Hurrengo [estekan](https://lookerstudio.google.com/reporting/a08f1776-4f54-4421-9a3e-69f2f4130b80/page/GaKdD) txosten baten oinarrizko alderdiak ikus daitezke. -->
