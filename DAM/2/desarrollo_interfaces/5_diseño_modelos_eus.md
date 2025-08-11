
# Eredu kontzeptualen diseinua {#diseño-modelos-conceptuales}

Eskakizunak jaso ondoren, hauek aztertzeko eta dagokion eredu kontzeptualaren diseinua egiteko unea da. Eredu hauek izango dira programazioa hasteko oinarria.

[Wikipediak](https://es.wikipedia.org/wiki/Modelo_conceptual) dioen bezala, **eredu kontzeptuala sistema baten irudikapena da**, sistemaren gaia ezagutzen, ulertzen edo simulatzen laguntzeko erabiltzen diren kontzeptuen konposizioz osatua, eta bertan entitate garrantzitsuak eta haien arteko erlazioak jasotzen dira.

Eredu kontzeptual baten helburu nagusia da ordezkatzen duen sistemaren oinarrizko printzipioak eta funtzionalitatea transmititzea. Gainera, erabiltzaileek erraz uler dezaketen interpretazioa eskaini behar du.

Eredu kontzeptualek honako helburu hauek dituzte:

1. Sistema ordezkariaren ulermen indibiduala hobetzea.
2. Sistemaren xehetasunak interesdunen artean modu eraginkorrean transmititzea erraztea.
3. Sistemaren diseinatzaileentzat erreferentzia-puntu bat eskaintzea, sistemaren zehaztapenak ateratzeko.
4. Sistema dokumentatzea etorkizunerako eta lankidetzarako bide bat eskaintzea.

Eredu mota desberdinen artean, honako hauek nabarmendu daitezke:

- Egituraren diagramak
  - Klase-diagramak
  - Datu-diagrama
  - Osagaien diagramak
  - Hedapen-diagramak (*despliegue*)
- Portaera eta elkarreragin (*interacción) diagramak
  - Jarduera-diagramak
  - Erabilera-kasu diagramak
  - Egoera-diagramak
  - Sekuentzia-diagramak

Jarraian, horietako batzuk zehazten dira.

## Datuen eredu kontzeptuala {#diseño-datos}

Datuen eredu kontzeptuala egiteko, ohikoena da "**Entitate-Erlazio eredua**" erabiltzea, hau da, gero diseinu logikoa eta azkenik datu-basearen diseinu fisikoa egiteko abiapuntua. Hau beharrezkoa izango da datu-base erlazional bat behar badugu.

Datuen eredua aplikazio askoren oinarrizko zatia izaten da, beraz, eskakizunen bilketa zuzena izan behar da, eta datuen ereduaren diseinua ere bai.

::: infobox
Datuen ereduaren diseinu kontzeptuala, datuen eskakizunekin batera, aplikazio askoren oinarrizko zatia da.
:::


## Erabilera-kasu diagramak {#diseño-casos-uso}

Erabilera-kasu diagramak **funtzionalitate bat deskribatzen dute**, erabiltzaile baten eta sistemaren arteko elkarreragina konbinatuz, gertaera-sekuentzia bat osatuz.

Erabilera-kasuaren deskribapena egiten denean, zer egingo den azaltzen da, baina ez nola egingo den tekniko mailan. Adierazpen zehatzak erabili behar dira, nahasmenik ez sortzeko; horregatik, sinpletasuna eta argitasuna bilatzen dira.

Adibidez, jarraian bi adibide ikus daitezke: erabiltzaile baten erregistroa eta sisteman autentifikazioa nola irudikatu daitezkeen erabilera-kasu diagramen bidez:

::::::::::::::: {.columns}
:::: {.column width="10%"}
::::
:::: {.column width="30%"}
![](img/di/tema_5/registro.png){width=100%}
::::
:::: {.column width="48%"}
![](img/di/tema_5/autenticar.png){width=100%}
::::
:::: {.column width="10%"}
::::
:::::::::::::::

Ikus daitekeenez, ekintza burutu behar denaren ikuspegi abstraktua ematen duten diagramak dira.


## Nabigazio-mapa {#mapa-navegacion}

Lortutako portaera eta elkarreragin diagramak kontuan hartuta, hurrengo urratsa aplikazioaren topologia eta funtzionalitate desberdinen arteko bideak egitea da. Lortutako emaitza aplikazioaren **nabigazio-mapa** izango da.

![Errezeta web baten nabigazio-mapa](img/di/tema_5/mapa_de_navegacion.png){width=95%}

Aplikazio edo web baten nabigazio-mapak eduki nagusien arteko esteken ikuspegi orokor eta laburtua eman behar digu.

## Prototipoak {#prototipos}

Aurreko urratsak egiten diren bitartean, paraleloan aplikazioaren itxura eta interfaze-diseinua nolakoa izango den azter daiteke.

Lehen urratsetan, **paper gaineko zirriborroak** edo aplikazioetan egin daitezke, xehetasun handirik gabe, aurretik ikusitako diseinuekin batera. Zirriborro hauek aplikazioaren ideia orokorra osatzen hasten dira.

Eredu zehatzagoak eta errealitateari hurbilagoak egiteko, **prototipo-sistemak** erabiltzen dira, hau da, erraz handitu eta aldatu daitezkeen modeloak (irudikapenak, erakustaldiak edo simulazioak). Haien ezaugarri nagusiak hauek dira:

- Erabiltzaile-interfazea izaten dute.
- Sarrera/irteera eta nabigazio funtzionalitatea izan dezakete.
- Horiek egiteko hainbat tresna daude.
- Xehetasun maila desberdina izan dezakete.
- Bezeroak ikusten duena ulertzeko gai da, beraz, *feedback*-a azkar lortzeko bide bat da.
- Aurreko etapetan aztertu ez diren ustekabeko alderdiak ager daitezke. Beraz, eskakizunen zehaztapena hobetzen eta zehazten laguntzen du.



