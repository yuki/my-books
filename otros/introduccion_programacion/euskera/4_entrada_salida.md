
# Datuen irteera print() funtzioarekin {#salida-datos-print}

Nahiz eta aurretik datuak nola erakusten diren ikusi dugun, orain hobeto azalduko dugu nola funtzionatzen duen.

::::::::::::::: {.columns }
:::: {.column width="48%"}
![](img/introduccion_programacion/edublocks/edublocks_print_1.png){width="40%"}
::::
:::: {.column width="48%"}

::: mycode
[Python iturburu-kodea]{.title}

```python
#Start code here
print("Hola")
print(123)
```
:::

::::
:::::::::::::::

Kodean ikusten dugu **print** erabiltzen dugula; hau hizkuntzaren barneko funtzio bat da, eta parametro bat pasatzen diogu. Parametro hori testu bat edo bestelako datu mota bat izan daiteke.

Aldagai baten balioa ere parametro gisa pasa diezaiokegu:

::::::::::::::: {.columns }
:::: {.column width="48%"}
![](img/introduccion_programacion/edublocks/edublocks_print_2.png){width="95%"}
::::
:::: {.column width="48%"}

::: mycode
[Python iturburu-kodea]{.title}

```python
#Start code here
nombre_usuario = "Ruben"
print(nombre_usuario)
```
:::

::::
:::::::::::::::

Edublocks-ek ez digu uzten existitzen ez diren aldagaiak erabiltzen, baina existitzen ez den aldagai bat inprimatzen saiatzen bagara, honelako errorea jasoko dugu:

::::::::::::::: {.columns }
:::: {.column width="38%"}

::: mycode
[Iturburu-kodea errorearekin]{.title}

```python
#Start code here
nombre_usuario = "Ruben"
print(nombre)
```
:::

::::
:::: {.column width="58%"}

::: mycode
[Errorea exekutatu ondoren]{.title}

```python
NameError: name 'nombre' is not defined
```
:::

::::
:::::::::::::::

::: errorbox
Existitzen ez den aldagai bat erabiltzen badugu, gure kodea exekutatzean errorea gertatuko da.
:::


## Datuak kateatzea print() funtzioarekin {#concatenar-datos}

**Print** funtzioak parametro bat baino gehiago pasatzeko aukera ematen digu, pantailan datu gehiago erakusteko agindu bakarra erabiliz.

"**Text**" blokeen taldean, *print*-ari testu gehiago gehitzeko bloke bat daukagu, eta testu horien artean aldagaiak ere sar ditzakegu.

::::::::::::::: {.columns }
:::: {.column width="58%"}
![](img/introduccion_programacion/edublocks/edublocks_print_3.png){width="100%"}
::::
:::: {.column width="38%"}

::: {.mycode size="footnotesize"}
[Python iturburu-kodea]{.title}

```python
#Start code here
nombre_usuario = "Ruben"
print("Hola", nombre_usuario)
```
:::

::::
:::::::::::::::


Bestela, **irteera formateatu** dezakegu modu [sofistikatuago batean](https://docs.python.org/3/tutorial/inputoutput.html#fancier-output-formatting), emaitza politagoa izan dadin. Horretarako, **f** funtzioa erabiltzen da.

::::::::::::::: {.columns }
:::: {.column width="58%"}
![](img/introduccion_programacion/edublocks/edublocks_print_4.png){width="100%"}
::::
:::: {.column width="38%"}

::: {.mycode size="footnotesize"}
[Python iturburu-kodea]{.title}

```python
#Start code here
nombre_usuario = "Ruben"
print(f"Hola {nombre_usuario}")
```
:::

::::
:::::::::::::::


## Parametro bereziak: "sep", "end"

**Print** funtzioak bi parametro berezi ditu, eta horiek lehenetsitako balio bat dute, guk aldatu dezakeguna. Parametro horiek hauek dira:

- **sep**: gainerako parametroak kateatzeko erabiltzen den bereizlea zehazten du. Lehenetsitako balioa hutsune bat da.
- **end**: string-a nola amaitzen den zehazten du. Lehenetsitako balioa lerro-jauzi bat da, programazioan normalean "**\\n**" gisa adierazten dena.

Parametro horiek nola erabil daitezkeen azaltzen duten adibide pare bat:

![](img/introduccion_programacion/edublocks/edublocks_print_5.png){width="80%"}


::: mycode
[Python iturburu-kodea]{.title}

```python
#Start code here
nombre_usuario = "Ruben"
print("Hola", nombre_usuario, sep="_", end="!")
print(1)
print("Te llamas", nombre_usuario, sep=":", end="?")
print(1)
```
:::


::::::::::::::: {.columns }
:::: {.column width="48%"}
Irteera eskuineko irudian bezala izan beharko litzateke. [print(1)]{.verbatim} gehitu dira, [end]{.verbatim} parametroa aldatzean eta bere balio lehenetsiarekin nola eragiten duen ikusteko. Bestela, balio horiek jarri ezean, Edublocks-ek akats bat du eta ez du emaitza erakusten.
::::
:::: {.column width="48%"}

![](img/introduccion_programacion/edublocks/edublocks_print_5_output.png){width="70%"}

::::
:::::::::::::::



# Datu-sarrera input() bidez {#entrada-datos-input}

Programa gehienek erabiltzaileen *input*-a behar dute. Kasu honetan, erabiltzaileari bere izena idazteko eskatuko diogu, eta gero agurtuko dugu. Erabiltzaileak idatzitako balioa **aldagai batean gorde** behar da.

Egin beharreko urratsak:

1. Sortu aldagai bat.
2. Hartu aldagaia balio batekin esleitzeko blokea.
3. Joan **Statements** atalera eta hartu **Input** blokea. Jarri aurreko bloke barruan, eta testu gisa idatzi: "Zein da zure izena?". Honek erabiltzaileari balioa eskatuko dio.
4. Inprimatu pantailan "Kaixo " dioen testu bat, lortutako datuaren balioarekin.

Edublocks-en honako hau izan beharko genuke:

![Código de bloques](img/introduccion_programacion/edublocks/edublocks_program_2.png){width="70%"}


::: mycode
[Python iturburu-kodea]{.title}

```python
#Start code here
nombre_usuario = input("¿Cómo te llamas? ")
print(f"Hola {nombre_usuario}")
```
:::


Eta programaren erabileraren ondoren, emaitza hau izango da:

![](img/introduccion_programacion/edublocks/edublocks_program_2_output.png){width="50%" framed=true}

Garrantzitsua da ulertzea **lortutako input-a beti izango dela "*string*" motakoa**, erabiltzaileak sartutakoarekin. Berdin dio testua zenbakiak bakarrik badira ere. Ondoren ikusiko dugu nola bihurtu datuak [mota]{#ejercicio-input} desberdinen artean.


::: exercisebox
Sortu programa bat ([erantzuna](#programa-inputs) begiratu gabe) erabiltzaileari galdera hauek egiteko eta azken emaitzan jasotako datu guztiekin esaldi bat inprimatzeko:

- Bere izena
- Bere adina
- Bizi den hiria
:::
