
# Zer da Python? {#que-es-python}

Python **interpretez** exekutatzen den programazio-lengoaia bat da, [Guido van Rossum](https://en.wikipedia.org/wiki/Guido_van_Rossum)ek 1989an sortua. Oporretan sortu zuen eta Python izena jarri zion [Monty Python's Flying Circus](https://en.wikipedia.org/wiki/Monty_Python%27s_Flying_Circus) telesailagatik.

Van Rossumek bere hizkuntzarako zituen helburuak hauek ziren:

- Python **erraza, intuitiboa eta lehiakide nagusiak bezain indartsua** izan behar zuen.
- Proiektua **kode irekikoa** izango zen, edonork lagundu ahal izateko.
- Python-en idatzitako kodea **ingelesezko edozein testu bezain ulergarria** izango zen.
- Python **eguneroko jardueretarako egokia** izan behar zuen, prototipoak denbora gutxian egiteko aukera emanez.

Python hizkuntza sinple eta indartsu gisa duen garrantzia ulertzeko, garrantzitsua da jakitea Ruby eta Swift bezalako ondorengo hizkuntzetan eragina izan duela.

## Nork erabiltzen du {#quien-lo-usa}

Python ordenagailu-sistemen arlo askotan erabiltzen da:

- **Zereginak automatizatzea**: ordenagailuan errepikakorrak diren zereginak egiteko *script*ak sortzea. Oso ohikoa da GNU/Linux inguruneetan.
- **Web garapena**: [Flask](https://es.wikipedia.org/wiki/Flask) edo [Django](https://es.wikipedia.org/wiki/Django_(framework)) bezalako framework-ekin web orriak eta aplikazioak sor daitezke.
- **Datuen analisia**: datu-zientzian eta estatistikan erabiltzen da, Pandas edo NumPy libutegiekin.
- **Adimen Artifiziala eta Ikasketa Automatikoa (Machine Learning)**: gaur egun ereduak trebatzeko gehien erabiltzen diren lengoaiaetako bat da.
- **Zientzia eta ikerketa**: unibertsitateetan eta laborategietan oso erabilia da kalkulu eta simulazioetarako.
- **Bideojokoak**: [Pygame](https://es.wikipedia.org/wiki/Pygame) bezalako liburutegiekin joko sinpleak sor daitezke. 3D inguruneetan ere erabil daiteke, hala nola [Blender](https://docs.blender.org/api/current/info_quickstart.html)-en, eta Unity eta Unreal-en scriptak egiteko.
- **Hezkuntza**: programatzen ikasteko aproposa.


## Non erabil dezakegun {#donde-usar}

Aipatu bezala, Python interpretez exekutatzen den lengoaia denez, beharrezkoa da interpretea instalatuta izatea sortutako programak exekutatzeko, edo programak exekutatzeko aukera ematen duen plataforma bat erabiltzea.

Python gure ordenagailuetan erabili nahi badugu:

- **GNU/Linux**: GNU/Linux banaketa gehienek Python instalatuta dakarte lehenetsita, programa askoren mendekotasun gisa erabiltzen delako (pakete-sistemak, monitorizazio-programak...).
- **MacOS**: MacOS-ek lehenetsita Python interpretea instalatuta dakar, baina ez da normalean azken bertsioa izaten.
- **Windows**: Interpretea instalatu behar da. Microsoft Store-tik *[manager](https://apps.microsoft.com/detail/9nq7512cxl7t?hl=es-ES&gl=ES)* edo [eskuragarri dauden bertsioak](https://apps.microsoft.com/search/publisher?name=Python+Software+Foundation&hl=es-ES&gl=ES) instala daitezke, baita [Python web ofizialetik](https://www.python.org/downloads/windows/) ere.

Python web-aplikazio hauetatik ere erabil daiteke:

- [Edublocks](https://app.edublocks.org/): Oinarrizko kontzeptuak ikasteko erabiliko dugun sistema.
- [Jupyter](https://jupyter.org/try): JupyterLab-ek aukera ematen du web-aplikazio baten bidez programa txikiak sortzeko, grafikoak egiteko eta datu-zientzian aritzeko, dokumentazioarekin batera.
- [Google Colab](https://colab.google/): Google-k ostatatutako Jupyter Notebook zerbitzua da, GPU eta [TPU](https://en.wikipedia.org/wiki/Tensor_Processing_Unit) bezalako konputazio-baliabideak erabiltzeko aukerarekin.

Plataforma hauetan baliteke murrizketaren bat egotea. Izan ere, litekeena da hirugarrenen liburutegiak instalatu ezinik egotea.

## Python-en bertsioak {#versiones-python}

Hizkuntza naturalekin gertatzen den bezala, programazio-lengoaiak denborarekin eboluzionatzen dira. Programazio-lengoaietan, denboraren poderioz bertsio berriak ateratzen dira, hobekuntzak gehituz eta batzuetan zaharkitutako gauzak kenduz.

Python 2.0 2000ko urrian kaleratu zen, eta adar horretako azken bertsioa (2.7.18) 2020an. Python 3 2008an atera zen, hizkuntzaren diseinuan zeuden oinarrizko akats batzuk zuzentzeko asmoz. Horrek ekarri zuen zenbait aspektutan atzera-bateragarritasuna galtzea (2.0 bertsiorako idatzitako programak ezin dira 3.x interpretearekin exekutatu aldaketarik egin gabe).

Urte askotan zehar, Python 2.7.X eta 3.X bertsioak elkarrekin egon dira, proiektu handiak migratzeko denbora emateko, baina 2020an erabaki zen 2.X bertsioei euskarria (*soporte*) kentzea. Gaur egun ikusten dugun kode oro 3 bertsio edo handiagoarena izan beharko luke.

Gaur egun Python **3.13** bertsioan dago (zehazki 3.13.5).


# Aldagaiak {#variables}

**Aldagai** bat ordenagailuaren RAM memorian **datu bat gordetzeko erabiltzen dugun izen bat** da. Imajinatu dezakegu **etiketa duen kutxa bat** bezala, non balio bat gordetzen dugu eta gero erabili, aldatu edo bistaratu dezakegu.

EduBlocks-en aldagai bat sortzeko:

1. Joan **"Variables"** kategoriara.
2. Sakatu ![](img/introduccion_programacion/edublocks/edublocks_create_variable.png){inline=true height=2em} botoia aldagaia sortzeko. *Pop-up* bat agertuko zaigu aldagaia izendatzeko: [nombre_usuario]{.verbatim}. Ikusiko duzu orain kategorian 2 bloke berri agertzen direla (bat aldagaia balioz hornitzeko eta bestea erabiltzeko).


::::::::::::::: {.columns }
:::: {.column width="48%"}
![Aldagaiari balio bat esleitzeko](img/introduccion_programacion/edublocks/edublocks_variable_assign.png){width="80%"}
::::
:::: {.column width="48%"}
![Aldagaiaren balioa erabiltzeko](img/introduccion_programacion/edublocks/edublocks_variable.png){width="70%"}
::::
:::::::::::::::

Pythonen, aldagaiak modu dinamikoan definitzen dira. Horrek esan nahi du ez dugula zehaztu behar datu mota deklaratu aurretik.

::::::::::::::: {.columns }
:::: {.column width="48%"}
![](img/introduccion_programacion/edublocks/edublocks_input.png){width="90%"}
::::
:::: {.column width="48%"}

::: mycode
[Aldagaiei balio esleitzeko]{.title}

```python
#Start code here
nombre_usuario = "Rubén"
nombre_usuario = 1
```
:::

::::
:::::::::::::::


Lehenengo esaldian aldagaiei balio bat esleitzen diogu, eta ondoren balio hori beste batekin ordezkatzen dugu. Datu horiek mota desberdinekoak dira. Beste programazio-lengoaia batzuetan ezin da datu mota desberdinak aldagai berean esleitu.

Programazio-lengoaiek lexiko propioa dutenez, hitz horiek ezin izango ditugu aldagaien izen gisa erabili, bestela errorea emango du. [Dokumentazio ofizialean](https://docs.python.org/3/reference/lexical_analysis.html#keywords) hitz erreserbatuak daude, adibidez: False, await, if, else, ...

::: errorbox
Badira [hitz erreserbatu](https://docs.python.org/3/reference/lexical_analysis.html#keywords) batzuk ezin ditugunak aldagaien izen gisa erabili.
:::


## Datu motak {#tipos-datos}

Pythonen, erabiltzen dugun datu bakoitzak **mota** bat du, eta horrek adierazten du ze informazio mota ordezkatzen duen eta zer egin daitekeen harekin. Datu motak ezagutzea garrantzitsua da programa batean behar bezala erabiltzeko.

Jarraian **mota arrunten** deskribapen laburra:

| Izena         | Adibidea kodean                               | Deskribapen laburra                                |
|---------------|-----------------------------------------------|----------------------------------------------------|
| int           | [adina = 18]{.verbatim}                        | Zenbaki osoak, dezimalik gabe. Positiboak edo negatiboak izan daitezke |
| float         | [prezioa = 3.99]{.verbatim}                    | Dezimaldun zenbakiak. Positiboak edo negatiboak izan daitezke |
| str           | [izena = "Ruben"]{.verbatim}                   | Testua, beti komatxo artean                        |
| bool          | [aktibo = True]{.verbatim}                     | Egia (**True**) edo gezurra (**False**)            |
| list          | [frutak = ["udarea", "mahatsa"]]{.verbatim}    | Elementuen zerrenda ordenatua eta aldakorra        |
| tuple         | [koordenadak = (3,5)]{.verbatim}             | Zerrenda ordenatua, **aldatu ezin dena** |
| dict          | [nork = {"izena": "Ruben", "adin": 42}]{.verbatim} | Datuak **gako : balio** (*key: value*) formatuan |
| set           | [zenb = {1, 2, 3}]{.verbatim}             | **Errepikaturik gabeko** multzoa, ordenik gabe |
| NoneType      | [ezer = None]{.verbatim}                       | **Baliorik eza** adierazten du                      |
Table: {tablename=yukitblr colspec=X[1,l]X[3,l]X[5,l]}


::: infobox
Garrantzitsua da programazioan datu mota desberdinak ulertzea eta bakoitzaren erabilera jakitea.
:::

Jarraian, datu mota sinpleenak erabiliz Edublocks eta Python kodeko adibideak ikusiko ditugu. Geroago gainerako datu motak ikusiko ditugu.

::: exercisebox
Sortu programa bat lehen bost datu motetarako aldagaiak erabiliz eta haien balioak pantailaratu.
:::

### Zenbaki osoak (int) {#integers}

**Dezimalik gabeko** zenbakiak dira, positiboak edo negatiboak.


::::::::::::::: {.columns }
:::: {.column width="48%"}
![](img/introduccion_programacion/edublocks/edublocks_int.png){width="70%"}
::::
:::: {.column width="48%"}

::: mycode
[Aldagaiak zenbaki osoekin]{.title}

```python
edad = 20
puntos = -5
```
:::

::::
:::::::::::::::


### Zenbaki dezimalak (float) {#float}

Dezimalak dituzten zenbakiak dira (*coma flotante*). Positiboak edo negatiboak izan daitezke.

::::::::::::::: {.columns }
:::: {.column width="48%"}
![](img/introduccion_programacion/edublocks/edublocks_float.png){width="70%"}
::::
:::: {.column width="48%"}

::: mycode
[Osagaiak floats]{.title}

```python
precio = 14.5
valor = -2.3
```
:::

::::
:::::::::::::::


### Testu-kateak (str) {#str}

Komatxo artean dauden testuak dira, eta letrak, zenbakiak edo ikurrak izan ditzakete. Garrantzitsua da kontuan izatea, nahiz eta testuaren edukia zenbaki bat izan, mota ezberdina dela.

::::::::::::::: {.columns }
:::: {.column width="48%"}
![](img/introduccion_programacion/edublocks/edublocks_str.png){width="70%"}
::::
:::: {.column width="48%"}

::: mycode
[Variables con texto]{.title}

```python
nombre = "Ruben"
numero = "5"
entero = 5
```
:::

::::
:::::::::::::::

:::errorbox
Garrantzitsua da bereiztea "numero" eta "entero" aldagaiek bi datu mota guztiz desberdinak direla.
:::


### Booleanoak (bool) {#bool}

Bi balio posible bakarrik dituzte: **True** (egia) edo **False** (gezurra). Eragiketa logikoak egiteko edo egia/gezurra bakarrik izan daitezkeen datuak gordetzeko erabiltzen dira.


::::::::::::::: {.columns }
:::: {.column width="48%"}
![](img/introduccion_programacion/edublocks/edublocks_bool.png){width="70%"}
::::
:::: {.column width="48%"}

::: mycode
[Variables con booleans]{.title}

```python
mayor_de_edad = True
usado = False
```
:::

::::
:::::::::::::::

