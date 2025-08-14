
# Zer dira eragileak {#que-son-operadores}

Programazioan, **eragileak** kalkuluak egiteko edo balioak konparatzeko erabiltzen diren ikurrak dira. Batzuetan datu mota jakin batzuekin erabili daitezke, eta beste batzuetan edozein motarekin, beraz, beharrezkoa da egoki erabiltzea.

Jarraian dauden eragile motak azalduko ditugu, eta nahiz eta adibideetan zenbakiak erabili, garrantzitsua da ulertzea **ohikoena aldagaiekin erabiltzea** dela.


# Eragile aritmetikoak {#operadores-aritméticos}

**Eragiketa matematikoak** egiteko balio dute, eta datu mota zenbakidunekin erabiltzen dira.

| Eragilea        | Izena           | Adibidea      | Emaitza       |
|-----------------|-----------------|---------------|---------------|
| [+]{.verbatim}  | Batuketa        | [3 + 2]{.verbatim}  | [5]{.verbatim}   |
| [-]{.verbatim}  | Kenketa         | [7 - 4]{.verbatim}  | [3]{.verbatim}   |
| [*]{.verbatim}  | Biderketa       | [5 * 2]{.verbatim}  | [10]{.verbatim}  |
| [/]{.verbatim}  | Zatiketa        | [7 / 2]{.verbatim}  | [3.5]{.verbatim} |
| [//]{.verbatim} | Zatiketa osoa   | [7 // 2]{.verbatim} | [3]{.verbatim}   |
| [%]{.verbatim}  | Moduloa (hondarra)| [7 % 2]{.verbatim}  | [1]{.verbatim}   |
| [**]{.verbatim} | Berreketa       | [2 ** 3]{.verbatim} | [8]{.verbatim}   |

Table: {tablename=yukitblr colspec=XXXX}

Kontuan hartu beharrekoak:


::::::::::::::: {.columns }
:::: {.column width="68%"}
- **[/]{.verbatim}** zatiketak beti ematen du koma daraman zenbaki bat (**float**), nahiz eta zehatza izan.
- **[//]{.verbatim}** zatiketa osoak emaitza ematen du dezimalik gabe, eta **int** sortzen du.
- **[%]{.verbatim}** moduloak zatiketaren hondarra ematen du, **int** motakoa.
- Bi datu mota konbinatuz gero, emaitzak behar den datu mota erabiliko du emaitza ondo adierazteko.
::::
:::: {.column width="30%"}
![](img/introduccion_programacion/edublocks/edublocks_operators_arithmetic.png){width="100%"}
::::
:::::::::::::::

Edublocks-en, eragiketa hauek **Math** atalean daude, eta eragilea goitibeherako menu baten bidez hauta daiteke.

::: exercisebox
Idatzi programa bat laukizuzen baten azalera (oinarria x altuera) kalkulatzeko bi aldagairekin (ez begiratu [emaitza](#ejercicio-area)). Datuak erabiltzaileari eskatu behar dizkiozu. Gogoratu [datu moten bihurketa](tabla-conversion).
:::

# Eragile logikoak {#operadores-logicos}

Balioak **konparatzeko** erabiltzen dira emaitza logiko bat lortzeko: **egiazkoa** (**[True]{.verbatim}**) edo **faltsua** (**[False]{.verbatim}**).

| Eragilea | Esanahia            | Adibidea          | Emaitza        |
|----------|--------------------|-------------------|----------------|
| [==]{.verbatim}     | Berdina              | [3 == 3]{.verbatim}     | [True]{.verbatim}   |
| [!=]{.verbatim}     | Desberdina           | [3 != 5]{.verbatim}     | [True]{.verbatim}   |
| [<]{.verbatim}      | Txikiagoa            | [2 < 5]{.verbatim}      | [True]{.verbatim}   |
| [<=]{.verbatim}     | Txikiago edo berdina | [3 <= 3]{.verbatim}     | [True]{.verbatim}   |
| [>]{.verbatim}      | Handiagoa            | [7 > 10]{.verbatim}     | [False]{.verbatim}  |
| [>=]{.verbatim}     | Handiago edo berdina | [4 >= 5]{.verbatim}     | [False]{.verbatim}  |
| [is]{.verbatim}     | Objektu bera         | [a is b]{.verbatim}     | [True]{.verbatim} **a** eta **b** objektu bera badira |
| [is not]{.verbatim} | Objektu bera ez      | [a is not b]{.verbatim} | [True]{.verbatim} objektu desberdinak badira |

Table: {tablename=yukitblr colspec=X[1]X[2]X[1]X[2]}

Erabilitako adibide guztiak zenbakiekin dira, baina ohikoena aldagaiekin erabiltzea da. Edublocks-en **Logic** taldean daude.

![](img/introduccion_programacion/edublocks/edublocks_operators_logic.png){width="30%"}


::: exercisebox
Zein balio itzultzen dute honako adierazpen hauek? (pentsatu lehenik eta gero egiaztatu Python-en, [erantzuna](#ejercicios-logicos) ikusi aurretik):

 - [3 == "3"]{.verbatim}
 - [4 <= 4.0]{.verbatim}
 - ["kaixo" != "Kaixo"]{.verbatim}

:::


## Eragile bereziak: "is" eta "is not"

Bi eragile berezi daude, programan erabiltzen diren objektuen memoriaren kudeaketa kontuan hartzen dutenak. Bi eragile hauek programa aurreratuetan erabiltzen dira, memoria kudeatu nahi dugunean, beraz, ez ditugu erabiliko.

::: mycode
["is" eta "is not" erabilera]{.title}

```python
a = [1, 2, 3]
b = a         # b-k a objektu berari egiten dio erreferentzia memorian
c = [1, 2, 3] # c-k balio bera dauka, baina beste objektu bat da

print(a is b) # True
print(a is c) # False
print(a == c) # True, balioak berdinak direlako
```
:::

[Hemen](https://w3schools.tech/tutorial/python/python_identity_operators) ikus daitezke erabilera gehiagoren adibideak eta azalpen aurreratu bat kasu berezietarako.

::: warnbox
Ez ditugu bi eragile berezi hauek erabiliko.
:::


# Eragile logiko konbinatuak: "and", "or", "not" {#operadores-logicos-combinados}

**Baldintzak konbinatzeko** balio dute. Hurrengo kapituluan hobeto ulertuko ditugu.

| Operador | Significado  | Ejemplo    | Resultado  |
|----------|--------------|------------|------------|
| [and]{.verbatim} | Eta (biak egiazkoak)  | [3 < 5 and 10 > 2]{.verbatim}     | [True]{.verbatim}  |
| [or]{.verbatim}  | Edo (gutxienez bat egiazkoa) | [3 > 5 or 10 > 2]{.verbatim} | [True]{.verbatim}  |
| [not]{.verbatim} | Ez (balioa ezeztatzen du)  | [not True]{.verbatim}              | [False]{.verbatim} |

Table: {tablename=yukitblr colspec=X[1]X[2]X[2]X[1]}

![](img/introduccion_programacion/edublocks/edublocks_operators_logic2.png){width="60%"}


::: exercisebox
Zein balio itzultzen dute honako adierazpen hauek? (pentsatu lehenik eta gero egiaztatu Python-en, [erantzuna](#ejercicios-logicos-combinados) ikusi aurretik):

- [True == True and False == True]{.verbatim}
- [5 > 3 and 4 < 2]{.verbatim}
- [5 > 3 or 4 < 2]{.verbatim}
- [not (7 <= 7)]{.verbatim}
- [not (0)]{.verbatim}

:::

