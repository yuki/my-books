

# Zenbaketa-sistemak {#zenbaketa-sistemak}

Sistema informatiko batean erabili nahi dugun informazioa ordenagailuak ulertu dezakeen modu batean adierazita egon behar da.

Ahozko edo idatzizko sistemen kasuan, normalean hizkuntz jakin bat erabiltzea alfabeto ezagun baten bidez. Informatikan, zenbakien zein gainerako informazioaren adierazpenerako zenbaketa-sistema desberdinak erabiltzen dira.

## Sistema hamartarra {#sistema-hamartarra}

Gizakiak, aspaldidanik, sistema hamartarra erabili izan du zenbatzeko sistema gisa, [arabiar sistemaren](https://eu.wikipedia.org/wiki/Arabiar_zifrak) bidez adierazita. Litekeena da sistema hau hartu izana eskuetan hamar hatz ditugulako.

Sistema numeriko hamartarra hamar sinbolo ordenaturen gainean dago oinarrituta (0, 1, 2, 3, 4, 5, 6, 7, 8, 9), pisuzko posizioetan kokatuta (posizio bakoitzak pisu jakin bat du), eta horien bidez nahi diren kantitateak adierazi daitezke. Hamar sinbolo erabiltzen direlako esaten da **10 oinarria** duela.

Beste zenbaketa-sistema batzuekin konbinatzen denean, oinarria adierazi behar da $\mathbf{19_{(10}}$ forman, hau da, zenbakiaren eskuinean "**(10**" txiki bat jarriz hamartar oinarrian dagoela adierazteko.

Sistema hamartarraren edozein konbinazio berreketen bidez ere adieraz daiteke, non berrekizuna 10 da eta adierazlearen balioa sinboloa dagoen posizioaren arabera izango da.

Adibide gisa, **146** zenbakia hartuko dugu. Berreketen bidez adierazpena hurrengoa da:

::: center
$146 = 100+40+6$

$146 = 1\times100 + 4\times10 + 6\times1$

$146 =1\times10^2 + 4\times10^1 + 6\times10^0$
:::

Ikus daitekeenez, adierazitako sinbolo bakoitza hartu eta oinarriarekin (kasuan kasu, 10 oinarriarekin) berreketa jarri dugu; oinarriari posizioan dagoen berretzailea jarri diogu. **Eskuineko sinboloak zero berretzailea du**, eta ezkerrerantz joan ahala posizio bakoitzean berretzailea bat handitzen da.


## Sistema bitarra {#sistema-bitarra}

Informatikan sistema garrantzitsuena sistema bitarra da, barne-barnean zirkuitu digitalek erabiltzen duten sistema delako. Sistema honetan bi sinbolo bakarrik erabiltzen dira, "0" eta "1", beraz, **oinarria 2 da**. Bi digitu horiei **bit** deitzen zaie (**binary digit**-en laburdura).

Sistema bitarra erabiltzen ari garela adierazteko, zenbakiaren ondoan oinarria jarri behar da, adibidez: $\mathbf{101001_{(2}}$. Ikus daitekeenez, azken sinboloaren ondoren "**(2**" txiki bat jartzea besterik ez da.

## Sistema hamaseitarra {#sistema-hexadecimal}

**16 oinarriko** sistema bat da, beraz, hamasei sinbolo beharko ditugu, beraz. Horretarako, ezagutzen ditugun zenbaki-sinboloak erabiltzen dira (0, 1, 2, 3, 4, 5, 6, 7, 8, 9) eta hurrengoak adierazteko letrak erabiltzen dira: "A", "B", "C", "D", "E" eta "F"; horrela, behar ditugun 16 sinboloak lortzen ditugu.

Hau kontuan hartuta, zuzenean adieraz dezakegu $\mathbf{A_{(16} = 10_{(10}}$ eta $\mathbf{E_{(16} = 14_{(10}}$ direla.

Informatikan oso ohikoa da sistema hamaseitarra erabiltzea **byte**-kin lan egiterakoan (**8 bit** dituen “hitz” bat). Sinbolo hamaseitar bakoitza 4 bit-ekoa da, eta, horregatik, byte bat adierazteko 2 sinbolo hamaseitar behar ditugu.

Era berean, hamaseitar sistema datuen formatuan kodea editatzean edo muntatzaile-programazioan (assembler) ere erabiltzen da.

Beste sistemaetan bezala, oinarria gehitu behar dugu sistema hamaseitarra erabiltzen ari garela adierazteko: $\mathbf{F17A_{(16}}$, $\mathbf{FBE1D_{(16}}$, $\mathbf{1FAB27_{(16}}$

## Sistema zortzitarra {#sistema-zortzitarra}

Ordenagailu zaharretan ohikoa zen sistema zortzitarra erabiltzea. Gaur egun, bitarra eta hamaseitarraren arteko bitarteko sistema gisa erabiltzen da gehiago.

Oraingoan zortzi sinbolo ordenatuetan oinarritzen gara (0, 1, 2, 3, 4, 5, 6, 7), eta horiek konbinatuz nahi diren kantitateak adieraz daitezke. Zortzi sinbolo erabiltzen direnez, esaten da **8 oinarria** duela.

Oinarria adierazteko, "(8" gehitu behar dugu adierazitako zenbakiaren eskuinean, adibidez: $\mathbf{770_{(8}}$, $\mathbf{175_{(8}}$

## Zenbaketa-sistemen arteko bihurketak {#zenbaketa-sistemen-arteko-bihurketak}

Orain arte ez gara zenbaketa-sistema desberdinekin topo egin, baina lau ezagutzen ditugunez, jakin behar dugu haien arteko bihurketak egiteko aukera badagoela.

Zenbaketa-sistema desberdinak ulertuta, argi izan behar dugu sinboloen adierazpena berbera izan arren, adierazitako zenbakia edo kantitatea ez dela berdina. Adibidez:

::: errorbox
$\mathbf{1010_{(10}  \neq  1010_{(2}  \neq  1010_{(16}  \neq  1010_{(8}}$
:::

Jarraian azalduko dugu ikusitako zenbaketa-sistemen arteko bihurketak nola egiten diren, eta laburbilduz, [bihurketa zuzenen taula](#tabla_conversiones_directas) dago.

### Hamartarretik bihurtu {#hamartarretik-bihurtu}

Hamartar zenbaki batetik abiatuta bihurketa desberdinak egiteko modu errazena da zatiketa jarraituak egitea, bihurtu nahi dugun oinarria erabiliz.

### ... bitarrera {#bitarra .unnumbered .unlisted}

Hamartar zenbakia zati bi egin beharko dugu, eta lortutako hondarrak berriro zati bi.

Adibide gisa $\mathbf{27_{(10}}$ hamartar zenbakia erabiliko dugu:


![](img/temas_comunes/sistemas_de_numeracion/decimal_binario.png){width="29%"}

**Hondarrak ordena alderantzikatuan hartzen ditugu** hurrengo baliokidetasuna lortzeko: $\mathbf{27_{(10} = 11011_{(2}}$

### ... hamaseitarrera {#hamaseitarra .unnumbered .unlisted}

Hamartar zenbakia zati 16 egin beharko dugu, eta lortutako hondarrak berriro zati 16. Zatidura edo hondarra 10 eta 15 artean dagoenean, dagokion letraz aldatu beharko da.


![](img/temas_comunes/sistemas_de_numeracion/decimal_hexadecimal.png){width="20%"}


**Hondarrak ordena alderantzikatuan hartzen ditugu** hurrengo baliokidetasuna lortzeko: $\mathbf{195_{(10} = C3_{(16}}$

### ... zortzitarrera {#zortzitarra .unnumbered .unlisted}

Aurrekoen antzera, zatiketa jarraituak egingo ditugu:


![](img/temas_comunes/sistemas_de_numeracion/decimal_octal.png){width="25%"}


**Hondarrak ordena alderantzikatuan hartzen ditugu** hurrengo baliokidetasuna lortzeko: $\mathbf{98_{(10} = 142_{(8}}$

### Bitarratik bihurtu {#bitarratik-bihurtu}

### ... hamartarrera {#hamartarra .unnumbered .unlisted}

Bitarreko zenbaki-sistema posizionala da, non digitu binario bakoitzak (bit-ek) bere posizio erlatiboan oinarritutako balio bat dauka: **LSB** (*Least Significant Bit* = bit esanguratsuena, eskuinean dagoena eta balio txikiena duena).

Edozein zenbaki bitar bere baliokide hamartarrera bihur daiteke. Bit bakoitzaren balioa oinarriarekin (2) biderkatu egingo dugu eta posizioa berretzailea izango da (eskuineko bit-ek 0 izango da). Adibide gisa, hartu $\mathbf{11011_{(2}}$ zenbaki bitarra:

::: center
$\mathbf{11011_{(2}}$

$\mathbf{1\times2^4 + 1\times2^3 + 0\times2^2 + 1\times2^1 + 1\times2^0}$

$\mathbf{16 + 8 + 0 + 2 + 1 = 27_{(10}}$
:::

Zenbaki guztien biderketa (eta egindako berreketa) egin ondoren, guztien batuketa egin beharko dugu emaitza lortzeko.

Kontuan izan ere **MSB** (*Most Significant Bit* = bit esanguratsuena, **ezkerrean dagoena**, balio handiena duena) $\mathbf{2^4}$ balioa duela, bosgarren bita izan arren. Hau **LSB** (*Least Significant Bit*, bit esanguratsuena, eskuinean dagoena) lehen bita delako eta $\mathbf{2^0}$ balioa duela delako eta.

### ... zortzitarrera {#octal-1 .unnumbered .unlisted}

Zenbaki bitar bat zortzitarrera bihurtzeko **3 digituren taldeetan bilduko dira digituak eskuinetik hasita**. Bit hirukote bakoitza bere zortzitar baliokidearekin ordezkatu egin beharko dugu.

Ezkerrean bit "bakarti" bat geratuko balitz (3ko talde bat osatu gabe), "0" batzuk jar daitezke ezkerrean.

Adibide gisa hartu $\mathbf{1100101001001_{(2}}$ zenbaki bitarra zortzitarrera bihurtzeko, honela egingo dugu:

::: center
$\mathbf{001\ \ 100\ \ 101\ \ 001\ \ 001_{(2} = 14511_{(8}}$
:::

### ... hamaseitarrera {#hexadecimal-1 .unnumbered .unlisted}

Aurreko kasuaren antzekoa, baina kasu honetan **4 biteko taldeetan bildu behar dira**. Aurreko adibide berbera erabiliko dugu $\mathbf{1100101001001_{(2}}$ :

::: center
$\mathbf{0001\ \ 1001\ \ 0100\ \ 1001_{(2} = 1949_{(16}}$
:::

### Hamaseitarratik bihurtu {#hamaseitarratik---ra-bihurtzea}

### ... bitarrera {#binario-1 .unnumbered .unlisted}

Hamaseitarratik bitarrera bihurtzeko, hamaseitar sinbolo bakoitza **4 biteko** sekuentziara bihurtuko dugu.

::: center

$\mathbf{F17A_{(16} = 1111\ \ 0001\ \ 0111\ \ 1010_{(2}}$

$\mathbf{1A4F_{(16} = 0001\ \ 1010\ \ 0100\ \ 111_{(2}}$
:::

### ... hamartarrera {#decimal-1 .unnumbered .unlisted}

Aurreko hamartarrera bihurketak egin dugun moduan, 16ren berreturekin ere egin daiteke, baina konplexuagoa izango litzateke.

Baina **modu errazena lehenengo bitarrera bihurtzea da**, goian ikusi dugun moduan, **eta ondoren bitarra hamartarrera bihurtzea**, aurretik ikusi dugun bezala.

### ... zortzitarrera {#octal-2 .unnumbered .unlisted}

Lehenengo bitarrera bihurtu eta gero zortzitarrera.

### Zortzitarratik bihurtu {#zortzitarratik---ra-bihurtzea}

### ... bitarrera {#binario-2 .unnumbered .unlisted}

Zortzitar digitu bakoitzak bere **3 biteko** adierazpenera bihurtzen da:

::: center
$\mathbf{167_{(8} = 001\ \ 110\ \ 111_{(2}}$

$\mathbf{253_{(8} = 010\ \ 101\ \ 011_{(2}}$
:::

Ezkerreko zeroak kendu daitezke, balioa aldatzen ez delako.

### ... hamartarra {#decimal-2 .unnumbered .unlisted}

Bi modutan egin daiteke. Lehena 8ren berreketak egitea (bitarra hamartarrera bihurtu bezala, baina oinarria aldatuz):

::: center
$\mathbf{157_{(8} = 1\times8^2 + 5\times8^1 + 7\times8^0 = }$

$\mathbf{1\times64 + 5\times8 + 7\times1 = }$

$\mathbf{64 + 40 + 7 = 111_{(10}}$

$\mathbf{157_{(8} = 111_{(10}}$
:::

Zenbaki handiekin 8ren berreketak egitea apur bat zaila denez, **lehenengo bitarrera bihurtu**, goian ikusi dugun moduan, **eta ondoren bitarra hamartarrera bihurtzea** izango litzateke alternatiba.

### ... hamaseitarrera {#hexadecimal-2 .unnumbered .unlisted}

Modu errazena hurrengoa da: lehenengo bitarrera bihurtzea, goian ikusi dugun bezala, eta ondoren bitarra hamaseitarrera bihurtzea, aurretik ikasi dugun moduan.

## Bihurtzeak egiaztatzea {#bihurtzeak-egiaztatzea}

Windows sistemako kalkulagailua erabil dezakegu bihurketak ondo egiten ari garen egiaztatzeko. Arazoa da lehenespenez hamartar sistema soilik erabiltzen duela. Ikasi ditugun zenbaki-sistemak erabiltzeko, "Programatzailea" bertsioa erabili behar da.

:::::::::::::: {.columns }
::: {.column width="45%"}
![](img/temas_comunes/sistemas_de_numeracion/calculadora1.png){width="100%"}
:::
::: {.column width="45%" }
![](img/temas_comunes/sistemas_de_numeracion/calculadora2.png){width="100%"}
:::
::::::::::::::


Behin "Programatzailea" moduan dagoela, zein den aukeratuta dagoen zenbaki-sistema  begiratu behar dugu. Zenbaki bat idazten dugunean, gainontzeko aukeretan bihurketak automatikoki ikusiko ditugu.

