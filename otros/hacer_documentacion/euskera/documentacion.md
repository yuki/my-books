
# Sarrera {#introducción}

Gure lan-bizitzan proiektuak egingo ditugu, arazoei irtenbideak bilatzea helburu dutenak, eta horrek hainbat lan tekniko ekarriko ditu: ordenagailu-sare bat konfiguratzea, web-aplikazio bat aldatzea, mugikorretarako aplikazio bat sortzea, azpiegitura bat aztertzea eta hobekuntzak proposatzea\...

Proiektu horrekin batera, ohikoa da egindako proiektuaren dokumentazioa aurkeztea, non bezeroaren eskakizunen jasoketa, haien analisia, proiektua gauzatzerakoan hartutako erabakiak eta zergatiak, eta proiektua nola egin den azaldu behar diren.

Interneteko dokumentazioa irakurri badugu ere, ez gaude ohituta gure dokumentazioa sortzera, eta dokumentazio propioa egiten hasten garenean, lortzen dugun emaitza ez da normalean egokia izaten.

Horregatik, dokumentu honetan dokumentazio ona egiteko aholku eta jarraibide batzuk emango dira.


# Hizkuntza formala/teknikoa {#lenguaje-formaltécnico}

:::::::::::::: {.columns }
::: {.column width="68%"}
Nahiz eta agerikoa iruditu, dokumentazioetan ezin da hizkuntza kolokiala erabili, beraz **beti ikuspegi teknikotik idatzi behar dugu**.

**Hizkuntza formala erabili behar da** eta iritziak, pentsamenduak edo erabakiak aipatzen direnean **plural maiestatikoa erabili behar da**.

Horrela, idazten duen pertsonak bere iritzia ematea saihesten da, izan ere, proiektuaren atzean normalean profesional talde bat egoten da hartutako erabakiak babesten dituena, beste profesionalen iritzia kontuan hartu dela edo gainbegiratua izan dela.
:::
::: {.column width="28%" }
![](img/documentacion/debian.png){width="100%"}
:::
::::::::::::::


::: infobox
**Proiektu honetan egindako irtenbidea egokia dela uste dugu, zeren ...**
:::

Iritziak erabiltzen direnean edo "**beste batzuk baino hobeak**" diren ezarpenak adierazten direnean, beti erabaki horren justifikazioa azaldu behar da, egindako aukeraren arrazoia ulertu ahal izateko.  

::: errorbox
**Jakina, oso garrantzitsua da dokumentuak ez izatea ortografia-akatsik, esaldi amaigaberik, loturarik gabeko esaldirik, ...**
:::


# Dokumentuaren formatua {#formato-del-documento}

Hasieran erraza iruditu arren, dokumentuaren estiloa zailena izan daiteke, eta horregatik jarraitu behar ditugu hainbat aholku, jarraian azalduko direnak, nahiz eta ez diren bakarrak izango.


## Letra, saretak eta dokumentuaren doikuntzak {#letra-sangrías-y-ajustes-del-documento}

Gaur egun, testu-editore gehienek **WYSIWYG** (ingelesez "*What You See Is What You Get*", ikusten duzuna lortzen duzuna da), hala nola Microsoft Word, LibreOffice edo Google Docs, aukera lehenetsi batzuk dituzte, eta horrek dokumentuak bisualki erakargarri egiten ditu eta, printzipioz, ez dugu gauza asko aldatu behar.

Hala ere, hobespen hauek aldatzea erraza da eta dokumentua bisualki erakargarriagoa, pertsonalizatuagoa eta beste dokumentuetatik bereizteko aukera ematen du, irakurleak lehen inpresioa hobetuz.


::: infobox
**Enpresetan ohikoa da plantilla pertsonalizatuak sortzea, enpresaren logotipoarekin, korporazio-koloreekin, logotipoan erabiltzen diren letra-motekin, ...**
:::

Dokumentu honetan bertan ikus daitekeenez, lerroarteak eta paragrafoen arteko tarteak irakurketa errazten dute, beraz konfigurazio hori egokitu beharrekoa da.  

![](img/documentacion/libreoffice.png){width="70%"}

Testu-editore bakoitzak konfigurazio batzuk ditu alda daitezkeenak, beraz gomendagarria da denbora bat eskaintzea eskaintzen dituen konfigurazio desberdinak ulertzeko. Goiko irudian [Libreoffice](https://es.libreoffice.org/) programak eskaintzen duen konfigurazioa ikus daiteke.

**Garrantzitsua da doikuntzak estiloan bertan aldatzea**, ez izenburu edo paragrafo bakoitzean banaka. \"1. Izenburua\" guztiak berdeak eta tamaina 15 izatea nahi badugu, estilo hori editatu behar dugu. Gero urdinak eta beste letra-mota bat izatea nahi badugu, estiloa aldatzearekin automatikoki aldatuko dira izenburu guztiak, denbora galdu gabe banan-banan aldatzen.


::: errorbox
**Estiloen konfigurazioak aldatu behar ditugu, dokumentuko testu guztiei aplikatzeko. Ez paragrafoz paragrafo edo izenburuz izenburu joan**
:::

### Itxura orokorra {#aspecto-visual-general}

Dokumentu honetan ikus daitekeen bezala, ez da beharrezkoa apaingarri handirik dokumentua erakargarria eta irakurtzeko erraza izan dadin.

:::::::::::::: {.columns }
::: {.column width="25%"}
![](img/documentacion/debian.png){width="75%"}
:::
::: {.column width="70%" }
**Gure dokumentuekin begi kritikoa izan behar dugu** eta egindako lana ikusi ditugun beste dokumentuekin alderatu.

Gure dokumentuak eskatzen diren ezaugarriak ez baditu, edo guri erakargarria iruditzen ez bazaigu, **ez da arraroa pentsatzea dokumentua irakurriko duen irakasleari ere ez zaiola gustatuko**.  
:::
::::::::::::::

Itxura bisualak irakurlearen jarrera alda dezake, irakurketa atseginagoa eta errazagoa eginez. Eta alderantziz, irakurketari jarraitzeko gogorik ez izatea eta dokumentua ahalik eta azkarren amaitzea eragin dezake.

::: errorbox
**Dokumentuaren lehen inpresioak irakasleak zuzentzerakoan alde onetik edo txarretik predisposatu dezake.**
:::

## Goiburua, orri-oina eta orri-zenbakiak {#cabecera-pie-de-página-y-números-de-página}

Gomendagarria da orri-zenbakia gehitzea dokumentuan, horrela jakin dezakegu dokumentuaren zein zatitan gauden eta orri zehatz bati erreferentzia egin. Normalean orri-zenbakia orri-oinean agertzen da, dokumentu honetan egin den bezala.

Horrez gain, dokumentuaren izenburua, enpresaren izena edo erreferentzia orokor bat gehitu behar da orri-oinean edo goiburuan. Garrantzitsua da atal hauetan erabilitako letra-tamaina testu orokorra baino txikiagoa izatea eta nahikoa tarte egotea testuarekin nahastu ez dadin.

::: warnbox
**Goiburuan eta orri-oinean letra-tamaina txikiagoa izan behar da, testuarekin nahastu ez dadin.**e
:::

Berriro ere, gomendagarria da egindakoa kritikatzea, egindakoaren itxura orokorra egokia den eta irakurketa errazten duen egiaztatzea.

## Irudiak eta haien konposizioa {#imágenes-y-su-composición}

Irudiak gehitu behar diren dokumentuetan kontuan hartu behar da nola egingo den konposizioa, irudien tamaina eta non kokatuko diren.

### Tamaina eta kokapena {#tamaina-eta-kokapena}

Erabiliko dugun irudiaren arabera, dokumentuaren erdialdean jar daiteke, zati handi bat okupatuz, goian ikusi dugun bezala, edo behean agertzen den adibidean bezala.

![](img/documentacion/debian.svg){width="70%"}

Kasu honetan [Debian](https://www.debian.org/) banaketaren izena da, baina lehenago programaren pantaila-argazki bat ikusi dugu. Irudiek tamaina egokia izan behar dute, bertako edukia ondo ikusteko.


### Irudien azalpena {#irudien-azalpena}

Dokumentu honetan hainbat irudi gehitu dira, tamaina desberdinetan, paragrafoen ezkerrean zein eskuinean.

Irudi hauek adibide hutsak izan dira, paragrafoari laguntzen dioten irudiak nola jar daitezkeen erakusteko, **beti dokumentuaren marjinaren barruan eta testuari tartea utziz**. Irudiak ez dira testuaren kontra egon behar marjinetan.

::: errorbox
**Dokumentuan gehitzen den irudi guztiak azalpen bat izan behar dituzte.**
:::

Paragrafoen alboan dauden irudien kasuan, paragrafoek irudiei erreferentzia egingo diete. Irudiak erdian daudenean, komenigarria da irudiaren aurretik zer adierazten duen zehaztea.

Adibidez:

> LibreOffice-n estilo guztiak alda ditzakegu paragrafoaren menura joanda, eta gero "Estiloak --\> Estiloak kudeatu" menura sartuta, interesatzen zaigun estiloa hautatuz. Adibidez, "**Testu gorputza**":

![](img/documentacion/libreoffice.png){width="70%"}

Ikus daitekeen bezala, azaldu nahi denari sarrera labur bat egin zaio, eta ondoren lortutako emaitzaren azalpen-irudi bat gehitu da.


### Irudien mozketa {#irudien-mozketa}

Irudi batean zerbait zehatzari erreferentzia egin nahi diogunean, egokiena ez da pantaila osoaren argazkia jartzea, baizik eta aipatzen ari garen leihoaren argazkia soilik egitea.

![](img/documentacion/recortes.png){width="40%"}


Horretarako, Windows-eko "Mozketa tresna" (*Herramienta de Recortes*) aplikazioak aukera ematen du hautatutako leihoaren mozketa perfektua egiteko, goiko irudian ikus daitekeen bezala, modua aukeratuz. Horrela, interesatzen zaigun leihoa bakarrik lortuko dugu, mozketa txarra saihestuz, eta **arreta benetan garrantzitsua den horretan zentratzea lortuko dugu**.

Irudi baten barruan zerbait zehaztu nahi badugu, gomendagarria da atal hori kolore batez (gorriz, adibidez) inguratzea, nabarmenagoa izan dadin. Zenbait kasutan gezi txiki bat ere gehi daiteke aukera erakusteko.

Leiho jakin batzuen pantaila-argazkiak edo moztuak ditugunean, komenigarria izan daiteke borde txiki bat gehitzea, gaur egungo mahaigaineko leihoek atzealde zuria erabiltzen dutelako eta dokumentuaren atzealde zuriaren aurka ez litzatekeelako ondo ikusiko.

Ondoren, irudi bera ertza gabe eta ertzarekin ikus daiteke:

:::::::::::::: {.columns }
::: {.column width="47%"}
![](img/documentacion/captura.png){width="100%"}
:::
::: {.column width="47%" }
![](img/documentacion/captura.png){width="100%" framed=true}
:::
::::::::::::::

`\vspace{10pt}`{=latex}

Ikus daitekeenez, borde gabeko irudiak "mozketa zakarra" efektua ematen du, eta ertza duenean argiago ikusten da moztutako atala dela.

::: infobox
**Leihoen pantaila-argazkiei ertza jartzea gomendagarria da**
:::

# Erreferentziak {#erreferentziak}

Dokumentu guztietan egon daitezke (eta egon behar dute) beste dokumentazio batzuetara, kopiatutako edo hainbat iturritatik jasotako testuetara erreferentziak, eta horrela bada, erreferentziatu egin behar da.

> "Beste lan batzuetara egindako erreferentziak oso garrantzitsuak dira lanbide askotako literaturan; bakoitzak informazio hori testuan sartzeko bere modua diseinatu du, eta horrek aipamenen formatu estandarizatuak sortzea ekarri du." (Iturria: [Wikipedia](https://es.wikipedia.org/wiki/Wikipedia:Referencias))

Goiko paragrafoan ikus daitekeen bezala, testua komatxo artean dago, goiko marjinarekin, eta amaieran informazioaren jatorria eta webgunerako esteka agertzen dira. Beste dokumentuetako testuak edo aipamenak erreferentziatzeko modu desberdinak daude, baina ez gara horretan sakonduko.

Beraz, dokumentu bat sortzerakoan beste testu batzuei erreferentzia egiten badiegu, adierazi beharko genuke, eta are gehiago kopiatu eta itsatsi egiten dugunean. Objektiboak izan behar dugu eta irakurleari jakinarazi behar diogu irakurri duen hori ez dela gure sorkuntza, eta beste egile baten testua erabili dela. Horregatik, **jatorrizko egilea edo informazioa atera den webgunea erreferentziatu behar da**.

Beste adibide bat izan daiteke: [Isaac Newton](https://es.wikipedia.org/wiki/Isaac_Newton)ek Hookeri idatzi ziona: "*Urrunago ikusi badut, erraldoien sorbaldetan eserita egon naizelako da.*", horrek esan nahi du berak ere bere ikasketak eta lorpenak aurreko zientzialari handien ekarpenak erabiliz lortu zituela. Ikus daitekeenez, erreferentzia komatxo artean dago eta letra etzanez idatzita dago.

# Dokumentua entregatu aurretik berrikusi {#dokumentua-entregatu-aurretik-berrikusi}

Dokumentu tekniko bat ez da egun batean egiten den zerbait, idazketan zehar hainbat etapa izaten ditu, eta horregatik, entregatu aurretik idatzitakoa berrikusi behar da.

Oso agerikoa dirudien arren, urrats hau ez da normalean egiten, dokumentua idazten duenak pentsatzen duelako idazketa egiterakoan ondo egin zuela. Egia izan daitekeen arren, irakurketa beranduago beti aterako ditu idatzitakoaren akatsak eta kontraesanak.

Zenbait kasutan, hasierako idazketan ortografia-akatsak zuzentzea ahaztu zaigu, dokumentuaren egitura ez da egokiena izan, edo bi paragrafo jarraian gauza bera azaldu dugu.

Horregatik, **proiektua egin duten kide guztiek dokumentua irakurri eta zuzenketak egin behar dituzte azken entregaren aurretik** bezeroari.

# Dokumentuaren eguneraketa {#dokumentuaren-eguneraketa}

Dokumentu tekniko bat "izaki bizidun" bat izaten da normalean, proiektuaren zerbitzu/komponente desberdinek eguneraketak, aldaketak edo erabilerarik ez izatea jasaten dutenean eguneratu behar dena.

Dokumentazio teknikoak azpiegitura/programa/web-aren egungo egoera zehaztasunez islatu behar du, bestela ez du balio informazio zaharkitua izateak, eta are okerragoa izan daiteke.

Dokumentazio honek konpainiako kide berriei azpiegitura/programa/web-aren egoera ezagutzeko balioko die, edo kanpoko enpresa berri bati bertan aldaketak egiteko.

