
# Kontrol-egiturak {#estructuras-control}

**Kontrol-egiturak** funtsezkoak dira programazioan, eta horregatik programazio-lengoaia guztiek dituzte.

Egitura hauei esker, programak **erabakiak har ditzake** edo **ekintzak errepikatu** modu automatikoan, baldintza jakin batzuen arabera. Haiei esker, programa adimentsuago eta erabilgarriagoak sor ditzakegu.

Kontrol-egiturak honela bereizten dira:

- **Baldintzak**
- **Begistak** (*bucles*)

Garrantzitsua da ulertzea kontrol-egiturek kode-blokeak sortzen dituztela, eta hauek exekutatu daitezkeela, edo ez. "Bloke" hauek bereizten dira egitura barruan **tabulazioa** erabiltzen delako. Aurrerago hobeto ikusiko dugu adibideetan.

::: errorbox
Python kodean tabulazioa oso garrantzitsua da.
:::

Beste programazio-lengoaia batzuek egitura gehiago izan ditzakete, edo beste hitz erreserbatu batzuk. Guk ikusiko ditugunak ia hizkuntza guztietan agertzen dira, **beraz, oso garrantzitsua da nola funtzionatzen duten ulertzea**.

::: warnbox
Kontrol-egiturak funtsezkoak dira programazioan. Garrantzitsua da nola erabiltzen diren ikastea.
:::

## Baldintzak {#condicionales}

Baldintzazko egiturek programari **aukera desberdinen artean hautatzeko** aukera ematen diote, baldintza bat egiazkoa den edo ez kontuan hartuta. Baldintzaren arabera, kode-bloke bat edo bestea exekutatuko da.

### "if" baldintza {#condicional-if}

[if]{.verbatim} baldintzak **baldintza bat betetzen bada kode-bloke bat exekutatu behar dela** adierazteko erabiltzen da. Fluxu-diagrama hauxe litzateke:



::::::::::::::: {.columns }
:::: {.column width="45%"}

Ikus dezagun zer gertatzen den:

- "Kodea 1" gure programan beti exekutatuko da.
- [if]{.verbatim} baldintzara heltzen da, errombo formakoa, eta baldintza aztertzen da:
  - Baldintza betetzen bada: "Kodea A" exekutatzen da.
  - Baldintza betetzen ez bada: bloke hori saltatu eta ohiko fluxuarekin jarraitzen da.
- "Kodea 2" beti exekutatuko da.

::::
:::: {.column width="53%"}

![](img/introduccion_programacion/flujo_if.svg){width="70%"}

::::
:::::::::::::::



Edublocks-en kodean eta haren Python-eko baliokidean ikusteko, hauxe dugu adibide bezala:

::::::::::::::: {.columns }
:::: {.column width="48%"}
![](img/introduccion_programacion/edublocks/edublocks_flujo_if.png){width="70%"}
::::
:::: {.column width="48%"}

::: mycode
[Python iturburu-kodea]{.title}

```python
#Start code here
edad = 18
print("Hola")
if edad >= 18:
  print("Eres mayor de edad")
print("Adios")
```
:::

::::
:::::::::::::::

[if]{.verbatim} blokea Edublocks-en **Logic** taldean dago. Ikus dezagun kodeak zer egiten duen:

1. Aldagai bat sortzen da, **int** datu motakoa, 20 balioarekin.
2. Pantailan "Kaixo" mezua inprimatzen da.
3. [edad >= 18]{.verbatim} baldintza aztertzen da. Baldintza hau [True]{.verbatim} da? Bai, 20 handia delako 18 baino, beraz [if]{.verbatim} bloke barruan dagoen kodea inprimatzen da: "Adin nagusikoa zara".
   
   ::: warnbox
   Begiratu [if]{.verbatim} esaldiaren ondorengo kodearen tabulazioa nola dagoen.
   :::

4. Pantailan "Agur" mezua inprimatzen da.

Azter dezagun [if edad >= 18:]{.verbatim} kodea, **oso garrantzitsua baita ondo idaztea**, bestela sintaxi-erroreak izango ditugu.

- **[if]{.verbatim}**: egitura baldintzazkoaren gako-hitza da.
- **[edad >= 18]{.verbatim}**: aztertzen den baldintza da.
- **[:]{.verbatim}**: **baldintza beti bi puntuekin [:]{.verbatim} amaitzen da**.

Oso garrantzitsua da ikustea [if]{.verbatim} barruko kode-blokea **eskuinera tabulazioa eginda** dagoela hutsuneekin. Horrek esan nahi du tabulazio-maila berean dagoen kode guztia [if]{.verbatim} barruko blokean dagoela, bloke bera dela.

Bloke barruko lerro guztiek **tabulazio bera** izan behar dute. Horrela ez bada, kodea exekutatzean ["IndentationError: unexpected indent"]{.verbatim} errorea izango dugu edo kodea nahi ez dugun lekuan exekutatuko da.

::: exercisebox
Azter itzazu hurrengo adibideak eta egiaztatu kodearen **tabulazioa** nola dagoen. Noiz exekutatzen da [print]{.verbatim} agindu bakoitza?
:::


::::::::::::::: {.columns }
:::: {.column width="30%"}

::: {.mycode size=small}
[Kode zuzena]{.title}

```python
#Start code here
edad = 18
print("Hola")
if edad >= 18:
  print("1")
  print("2")
  print("3")
print("Adios")
```
:::

::::

:::: {.column width="30%"}

::: {.mycode size=small}
[Tabulazio txarra]{.title}

```python
#Start code here
edad = 18
print("Hola")
if edad >= 18:
  print("1")
   print("2")
 print("3")
print("Adios")
```
:::


::::
:::: {.column width="30%"}

::: {.mycode size=small}
[Ondo dago?]{.title}

```python
#Start code here
edad = 18
print("Hola")
if edad >= 18:
  print("1")
  print("2")
print("3")
print("Adios")
```
:::

::::
:::::::::::::::


::: errorbox
Python-eko kodean tabulazioa oso garrantzitsua da.
:::


#### Habiaratutako kontrol-egiturak {#estructuras-anidadas}

Kontrol-egiturak habiaratu (*anidar*) egin daitezke. Horrek esan nahi du egitura baten bloke barruan beste egitura batzuk sar daitezkeela (kasu honetan, baldintzazkoak).


::: exercisebox
Azter ezazu hurrengo adibidea, egiaztatu kodearen **koska** nola dagoen. Zer inprimatzen da pantailan? Eta...

- [edad = 17]{.verbatim} bada?
- [edad = 67]{.verbatim} bada?
:::

::::::::::::::: {.columns }
:::: {.column width="48%"}
![](img/introduccion_programacion/edublocks/edublocks_flujo_if_anidado.png){width="70%"}
::::
:::: {.column width="48%"}

::: mycode
[Python iturburu-kodea]{.title}

```python
#Start code here
edad = 20
print("Hola")
if edad >= 18:
  print("Eres mayor de edad")
  if edad >= 65:
    print("¿Estás jubilado?")
print("Adios")
```
:::

::::
:::::::::::::::


Egitura bat bestearen barruan habiatu nahi dugunean, koska jarraitu behar da, horrek zehazten baitu non exekutatuko den kodea.

::: warnbox
GOGORATU! Python-eko kodean koska oso garrantzitsua da.
:::


### "if else" baldintza-egitura {#condicional-if-else}

[else]{.verbatim} hitz erreserbatua erabiltzen da [if]{.verbatim}-aren baldintza **betetzen ez denean** exekutatuko den kode-blokea adierazteko.

::: infobox
"[if-else]{.verbatim}" baldintzan, bi blokeetako bat beti exekutatuko da.
:::


Fluxu-diagrama honakoa izango litzateke:

::::::::::::::: {.columns }
:::: {.column width="45%"}

- "Kodea 1" beti exekutatuko da gure programan.
- [if]{.verbatim} baldintzara iristen da, eta baldintza aztertzen da:
  - Baldintza betetzen bada: "kodea A" exekutatzen da.
  - Baldintza betetzen ez bada: [else]{.verbatim}-ko "kodea B" exekutatzen da.
- "Kodea 2" beti exekutatuko da.

::::
:::: {.column width="53%"}

![](img/introduccion_programacion/flujo_if_else.svg){width="90%"}

::::
:::::::::::::::

Ikusten den bezala, "[if-else]{.verbatim}" egitura erabiltzean beti exekutatuko da kode-bloke bat.  
Honako kodea erabiliko dugu [adibide]{#ejemplo-if-else} gisa:

::::::::::::::: {.columns }
:::: {.column width="48%"}
![](img/introduccion_programacion/edublocks/edublocks_flujo_if_else.png){width="70%"}
::::
:::: {.column width="48%"}

::: mycode
[Python iturburu-kodea]{.title}

```python
#Start code here
edad = 17
print("Hola")
if edad >= 18:
  print("Eres mayor de edad")
else:
  print("Eres menor de edad")
print("Adios")
```
:::

::::
:::::::::::::::


[else]{.verbatim} blokea Edublocks-en ere **Logic** taldean dago. Kodeak zer egiten duen ulertuko dugu:

1. Aldagai bat sortzen da, balioa 17 duena, eta **int** datu motakoa da.
2. Pantailan "Kaixo" inprimatzen da.
3. [edad >= 18]{.verbatim}. Baldintza hau [True]{.verbatim} al da? Ez, **beraz else blokera pasatzen da eta bertako edukia exekutatzen da**.
4. Pantailan "Agur" inprimatzen da.

::: exercisebox
Gehitu [else]{.verbatim} blokean, [erantzuna](#ejercicio-else-anidado) ikusi gabe:

- 13 baino handiagoa bada: idatz dezala "Eres adolescente"
- Bestela, 6 baino handiagoa bada: idatz dezala "¿En qué curso estás?"
- Bestela: idatz dezala "¿Sabes montar en bici?"
:::



### "elif" baldintza-egitura {#condicional-elif}

**[elif]{.verbatim}** laburbilduz [else]{.verbatim} eta [if]{.verbatim} bateratzen dituen egitura da, [else]{.verbatim} barruan bloke bat egin beharrik gabe.  
Baldintza bat baino gehiago dagoenean ebaluatzeko erabiltzen da, eta lehen baldintza egiazkoa denean ebaluazioa gelditzen da.



::::::::::::::: {.columns }
:::: {.column width="48%"}
![](img/introduccion_programacion/edublocks/edublocks_flujo_if_elif.png){width="70%"}
::::
:::: {.column width="50%"}

::: mycode
[Python iturburu-kodea]{.title}

```python
#Start code here
edad = 6
print("Hola")
if edad >= 18:
  print("Eres mayor de edad")
elif edad >= 13:
  print("Eres adolescente")
elif edad >= 6:
  print("¿En qué curso estás?")
else:
  print("¿Sabes montar en bici?")
print("Adios")
```
:::

::::
:::::::::::::::

Aurreko adibidean ikus daiteke nola gehitu diren baldintza batzuk. Ikus dezagun zer gertatzen den [edad = 6]{.verbatim} denean:

1. **[edad >= 18]{.verbatim}**: Ez, beraz hurrengo aukerara salto egiten da. Aurretik [else]{.verbatim} izango litzateke, baina kode honetan baldintza berri bat dago.
2. **[edad >= 13]{.verbatim}**: Ez, beraz salto egiten dugu.
3. **[edad >= 6]{.verbatim}**: Bai! Beraz, baldintza honetan dagoen kode blokea exekutatzen da, eta ez da “ur-jauzi”aren gainerakoa (hau da, [else]{.verbatim}) aztertzen jarraitzen.

::: exercisebox
Konparatu/parekatu kode hau [aurreko ariketaren soluzioarekin](#ejercicio-else-anidado).
:::

### Ariketa

Egin ondorengo ariketa. [Hainbat soluzio posible](#ejercicio-notas) daude, beraz saia zaitez bi egiten: bata egitura [if-else]{.verbatim} erabiliz, eta bestea [elif]{.verbatim} erabiliz.

::: exercisebox
Idatzi programa bat ([erantzuna](#ejercicio-notas) ikusi gabe) nota bat (0tik 10era) eskatzeko eta adierazteko ea:

- "Suspenso" (< 5)
- "Aprobado" (5 - 6.9)
- "Notable" (7 - 8.9)
- "Sobresaliente" (9 - 10)
:::


## Bukleak {#bucles}

**Begizta** edo *bukle* bat egitura bat da, **baldintza bat betetzen den bitartean** agindu multzo bat automatikoki **errepikatzeko** aukera ematen duena. Python-ek bucle mota nagusi bi ditu: [while]{.verbatim} eta [for]{.verbatim}.

Lan errepikakorrak egiten duen kodea behin eta berriro ez idaztea helburu dauka, errepikatzea oso eraginkorra (*ineficiente*) delako. Adibidez, 1etik 10era arteko zenbakiak erakutsi nahi baditugu, [print()]{.verbatim} 10 aldiz idatzi beharrean bukle bat erabil dezakegu.

Bukle bat idaztean kontuan hartu behar da baldintza noizbait bete ez dadila, bestela **bukle infinitu** batean sartuko ginateke.

::: errorbox
Kontuz ibili bukleak idazterakoan, **bukle infinituak** ez sortzeko.
:::


### "while" buklea {#bucle-while}

Baldintza bat betetzen den bitartean agindu multzo bat errepikatzeko balio du. Baldintza betetzeari uzten dionean, buklea gelditzen da eta programaren ohiko fluxuarekin jarraitzen da.

::::::::::::::: {.columns }
:::: {.column width="45%"}

Fluxu-diagrama kontuan hartuta:

1. "Kodea 1" beti exekutatuko da gure programan.
2. "while baldintza" esaldira heltzen da eta aztertzen da:
   - Baldintza betetzen bada: "Kodea A" exekutatzen da eta 2. pausora itzultzen da.
   - Baldintza betetzen ez bada: buklearen blokea saltatzen da.
3. "Kodea 2" exekutatzen da.


::::
:::: {.column width="53%"}

![](img/introduccion_programacion/bucle_while.svg){width="70%"}

::::
:::::::::::::::

Adibide bat egingo dugu lehenengo 10 zenbakiak inprimatzeko. Edublocks-en, bukleak **Loops** taldean daude.

::::::::::::::: {.columns }
:::: {.column width="55%"}
![](img/introduccion_programacion/edublocks/edublocks_bucle_while.png){width="90%"}
::::
:::: {.column width="44%"}

::: mycode
[Python iturburu-kodea]{.title}

```python
#Start code here
contador = 1
while contador <= 10:
  print(contador)
  contador = contador + 1
```
:::

::::
:::::::::::::::

Aurreko kodetik nabarmendu dezakegu:

- [contador = 1]{.verbatim}: aldagaia hasieratzen dugu **1** balioarekin.
- [while]{.verbatim}: buklean sartuko garela adierazteko hitz gakoa da.
  - [contador <= 10:]{.verbatim}: buklearen blokean sartzeko baldintza da.
  - [contador = contador + 1]{.verbatim}: hau da esaldi garrantzitsuena, aldagaiaren balioa iterazio bakoitzean handitzen dugulako. Hau gehitzen ez badugu, **bukaezinako bukle batean egongo ginateke, kontagailuak beti 1 balio lukeelako**.

::: exercisebox
Egin programa bat ([erantzuna](#ejercicio-bucle-inverso) ikusi gabe) erabiltzaileari zenbaki bat eskatzeko eta 0ra iritsi arte zenbaki guztiak alderantzizko ordenean inprimatzeko.
:::

::: exercisebox
Egin programa bat ([erantzuna](#ejercicio-contador) ikusi gabe) 1etik 100era arteko zenbaki guztien batuketa emaitza lortzeko.
:::

### "for" buklea {#bucle-for}

[for]{.verbatim} buklea sekuentzia baten elementuak banan-banan aztertzeko erabiltzen da: zerrenda bat ([list]{.verbatim}), multzo bat [set]{.verbatim}, testu-kate bat, [range()]{.verbatim} erabiliz zenbakien tarte bat...

Jarraian adibide bat zerrenda bat erabiliz:

![](img/introduccion_programacion/edublocks/edublocks_bucle_for.png){width="70%"}


::: mycode
[Python iturburu-kodea]{.title}

```python
#Start code here
personajes = ["Mario", "Zelda", "Lara Croft"]
for personaje in personajes:
  print(f"Me gustan las sagas de {personaje}")
```
:::

Jarraian, aurreko kodearen azalpen garrantzitsuena:

- [personajes]{.verbatim}: elementu desberdinak dituen zerrenda motako aldagaia da.
- [for]{.verbatim}: bukle batean sartuko garela adierazteko hitz gakoa da.
  - [personaje]{.verbatim}: aldagaia sortzeko balio du; aldagai horri zerrendako elementu bakoitza esleituko zaio, bukle zerrenda zeharkatzen duen bakoitzean.
  - [in personajes:]{.verbatim}: [personajes]{.verbatim} zerrendaren edukia zeharkatuko dela adierazten du.

::: warnbox
Iteratzen dugun aldagaiari izen egokia aukeratzea garrantzitsua da; zentzua izan behar du.
:::


Beste adibide bat [[range()]{.verbatim}](https://docs.python.org/3/library/functions.html#func-range) funtzioarekin. Funtzio honek parametro kopuru desberdinak onartzen ditu:yu

- **[range(10)]{.verbatim}**: **0tik adierazitako zenbakiaren "ken 1" arteko** zerrenda bat sortzen du (adierazitako zenbakia ez da sartzen).
- **[range(start,stop,step)]{.verbatim}**: [start]{.verbatim}-etik hasi eta [stop]{.verbatim} baino bat gutxiagora arteko zerrenda bat sortzen du, [step]{.verbatim}-en araberako jauziekin (ez bada jartzen, lehenetsia 1 da).

::::::::::::::: {.columns }
:::: {.column width="48%"}
![](img/introduccion_programacion/edublocks/edublocks_bucle_for_range.png){width="90%"}
::::
:::: {.column width="50%"}

::: mycode
[Python iturburu-kodea]{.title}

```python
#Start code here
for i in range(10):
  print(f"El {i}")
print("Nuevo contador")
for i in range(-10, 10):
  print(f"El {i}")
```
:::

::::
:::::::::::::::


::: exercisebox
Sortu [for]{.verbatim} bukle bat 0tik 400era, 5eko jauziekin. [Erantzuna](#ejercicio-bucle-for).
:::

::: exercisebox
Egin programa bat ([erantzuna](#tabla-multiplicar) ikusi gabe) erabiltzaileari zenbaki bat eskatzeko eta bere biderketa-taula inprimatzeko 10era arte (sartutako zenbakia 10 baino handiagoa bada, taula zenbaki horretara arte egingo da).
:::


### Bukletan erabilgarriak diren instrukzioak {#bucles-instrucciones-utiles}

Bukletan erabili daitezkeen instrukzio batzuk daude, oso erabilgarriak izan daitezkeenak:

- **[break]{.verbatim}**: Bukaera iritsi baino lehen buklea uzteko balio du.
- **[continue]{.verbatim}**: Iterazio honetako gainerako kodea exekutatu gabe, buklearen hurrengo iteraziora pasatzeko balio du.

::: exercisebox
Egin programa bat ([erantzuna](#ejercicio-break) ikusi gabe) 1etik 30era arteko zenbakiak inprimatzeko, **baina**:

- 7, 15 eta 23 zenbakiak inprimatu gabe saltatu.
- 27 zenbakira iristean buklea amaitu.
:::

