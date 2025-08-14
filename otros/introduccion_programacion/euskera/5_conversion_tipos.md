
# Zergatik beharrezkoa den datuak bihurtzea {#porque-necesario-convertir}

Batzuetan beharrezkoa da **datu baten mota aldatzea** zenbait eragiketa egin ahal izateko. Adibidez, erabiltzaileari bere adina eskatzen diogu eta ikusi nahi dugu zenbaki lehena (*primo*) den edo ez.

Datuen bihurketa egiten ez badugu, lortuko dugun emaitza ez da espero duguna izango, eta gure programak ez du gu nahi duguna egingo.

Datu mota batetik bestera pasatzeari **mota-bihurketa** edo *type casting* deitzen zaio, eta Python-ek modu errazean egitea ahalbidetzen du.

## Bihurketa-funtzio arruntenak {#tabla-conversion}

Jarraian datu mota ezberdinen arteko bihurketa nola egiten den azaltzen duen taula labur bat. Bihurketa hauetako batzuk ez daude Edublocks-en.

| Funtzioa     | Zer egiten du                                   | Adibidea                    |
|--------------|-------------------------------------------------|-----------------------------|
| [int()]{.verbatim}   | Zenbaki osora bihurtzen du   | [int("5") → 5]{.verbatim}   |
| [float()]{.verbatim} | Hamartarreko zenbakira bihurtzen du  | [float("3.14")]{.verbatim} → [3.14]{.verbatim}   |
| [str()]{.verbatim}   | Testu-katera bihurtzen du  | [str(10) → "10"]{.verbatim}  |
| [bool()]{.verbatim}  | Balio logikora (True edo False) | [bool(0)]{.verbatim} → [False]{.verbatim}   |
| [list()]{.verbatim}  | Zerrenda bihurtzen du  | [list("hola")]{.verbatim} → [["h", "o", "l", "a"]]{.verbatim} |
| [set()]{.verbatim}   | Multzo bihurtzen du (elementu errepikaturik gabe)| [set([1, 2, 2])]{.verbatim} → [{1, 2}]{.verbatim} |
| [tuple()]{.verbatim} | Tupla bihurtzen du  | [tuple([1, 2])]{.verbatim} → [(1, 2)]{.verbatim}  |

Table: {tablename=yukitblr colspec=X[l]X[3,l]X[3,l]}


## Datu mota ezagutzea {#conocer-tipo-dato}

Aldagai baten datu mota ezagutu nahi badugu, [type()]{.verbatim} funtzioa erabil dezakegu. Hona hemen kode-adibide bat:

::: mycode
[Datu mota ezagutzeko]{.title}

```python
nombre = "Ruben"
print(type(nombre))
print(type(nombre).__name__)
```
:::

::: questionbox
Zein da azken bi esaldien arteko aldea?
:::


<!-- TODO: Sería interesante hacer un ejemplo de cada tipo, pero de momento paso.
# Conversión a int {#conversion-int}
-->

