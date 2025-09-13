

# Informazio digitalaren unitateak {#informazio-digitalaren-unitateak}

Informazio digitala biltegiratzean, gorde nahi dugun objektuaren tamaina eta gorde nahi dugun tokiko espazio librea ezagutzea garrantzitsua da.

Hamartarrean, [Nazioarteko Unitate Sistema](https://eu.wikipedia.org/wiki/Nazioarteko_Unitate_Sistema) erabiltzen ohituta gaude, eta neurtu nahi dugun magnitudearen arabera, aurrez ezarritako aurrizkiak erabiltzen ditugu. Adibidez, distantzia neurtzeko **metroa** erabiltzen dugu, eta horrela geratuko litzateke:


-   **Sin prefijo** : metro, una unidad.

-   **deka-**metro: $10^1$ metro

-   **hekto-**metro: $10^2$ metro

-   **kilo-**metro: $10^3$ metro

-   **mega-**metro: $10^6$ metro

-   **giga-**metro: $10^9$ metro

-   \...


Hamartarrean **10 oinarria** erabiltzen dugu, eta beraz, aurrizki bakoitzarekin adierazten duen berretzailea aldatzen dugu. Unitate txikietan berretzailea 1 gehituz aldatzen da, baina kantitate jakin batetik aurrera (**kilo-**), kantitatea 1000z biderkatuz aldatzen da ($10^3$).

## Sistema bitarra {#sistema-binario-explicacion}

Informatikan informazioa formatu bitarrean gordetzen da, eta unitate txikiena **bit** da, ***bi**nary digi**t*** hitzaren laburdura. Bit bakoitza unitate bakarra da, eta bi egoera soilik onartzen ditu: **0** edo **1**. Adierazteko letra xehea (**b**) erabiltzen da, beraz, **10b** 10 bit dira.

### Multiploak {#multiploak}

Hamartarrean bezala, kantitatea handitzen dugun heinean, aurrizkiak erabiltzen dira zein kantitatez ari garen jakitea errazteko.

Jarraian erabilienak diren neurriak azaltzen dituen taula bat dago:

|    Izena     | Simbolo |     Kopurua       |
| :----------: | :-----: | :---------------: |
|   **Bit**    |  **b**  |      $2^0=1$      |
|    Nibble    |         |        4b         |
|   **Byte**   |  **B**  |        8b         |
| **Kibi**byte | **KiB** |  $2^{10}=1024$ B  |
| **Mebi**byte | **MiB** | $2^{20}=1024$ KiB |
| **Gibi**byte | **GiB** | $2^{30}=1024$ MiB |
| **Tebi**byte | **TiB** | $2^{40}=1024$ GiB |
| **Pebi**byte | **PiB** | $2^{50}=1024$ TiB |
| **Exbi**byte | **EiB** | $2^{60}=1024$ PiB |

Table: {tablename=yukitblr}


## Sistema hamartarra {#sistema-decimal-explicacion}

Informatika arloan unitateak izendatzeko modu zuzena aurrekoa izan beharko litzateke (sistema bitarra), baina ohikoa da sistema hamartarreko aurrizkiak erabiltzea. Hurrengo taulan izenak eta kantitateak ikus daitezke:

| Izena       | Simbolo | Kopurua  |
|:------------:|:-------:|:---------:|
|  **Bit**     | **b**   | $2^0=1$   |
| Nibble       |         | 4b  |
| **Byte**     | **B**   | 8b  |
| **Kilo**byte | **KB** | $10^{3}=1000$ B |
| **Mega**byte | **MB** | $10^{6}=1000$ KB |
| **Giga**byte | **GB** | $10^{9}=1000$ MB |
| **Tera**byte | **TB** | $10^{12}=1000$ GB |
| **Peta**byte | **PB** | $10^{15}=1000$ TB |
| **Exa**byte  | **EB** | $10^{18}=1000$ PB |

Table: {tablename=yukitblr}

::: errorbox
Informatikako unitateei buruz hitz egiten dugunean **sistema bitarra erabili beharko genuke**, informazioa horrela gordetzen eta benetako kantitatea hori baita.
:::


## Erabilerak {#erabilerak}

Aurreko neurriak erabiltzerakoan, zer neurtu nahi dugun bereizi behar da, ez baita beti berdin egingo.

-   **Biltegiratzea**: Biltegiratze-kantitate bat adierazi nahi dugunean (disko gogor bat, USB *pendrive* bat, RAM, \...), **Byte** eta bere multiploak erabiltzen dira, aurretik ikusitako aurrizkiak erabiliz.

    :::::::::::::: {.columns }
    ::: {.column width="40%"}
    ![](img/temas_comunes/unidades_informacion/hdd.png){width="100%"}
    :::
    ::: {.column width="50%" }
    ![](img/temas_comunes/unidades_informacion/hdd2.png){width="100%" framed=true}
    :::
    ::::::::::::::
    
    ::: center
    [Fitxategi esploratzaileak kantitatea hamartarrean eta bitarrean erakusten.]{.footnotesize}
    :::

-   **Transmisioa**: Datuen transferentzia-tasari buruz hitz egiten dugunean "bit-tasa" terminoa erabiltzen da (ingelesez ***bitrate***), eta horrek denbora-unitate bakoitzean transmititzen diren bit kopurua adierazten du. Gaur egun, normalean kbps (edo kb/s, kilobit segundoko), Mbps (Mb/s, megabit segundoko), \... erabiltzen dira. Byte segundoko bihurtzeko, "8"-z zatitu behar da.

    ::: center
    ![](img/temas_comunes/unidades_informacion/bitrate.png){width="40%"}
    :::

::: warnbox
**Datuen transmisioa "bit segundoko" adierazten da**
:::
