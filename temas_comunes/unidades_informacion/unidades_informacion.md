

# Unidades de Información digital {#unidades-de-información-digital}

A la hora de almacenar información digital es importante conocer el tamaño del objeto que queremos almacenar y el espacio libre del lugar en el que lo queremos guardar.

En decimal estamos acostumbrados a contar usando el [Sistema Internacional de Unidades](https://es.wikipedia.org/wiki/Sistema_Internacional_de_Unidades), y dependiendo de la magnitud que queramos medir, haremos uso de unos prefijos establecidos. Por ejemplo, para medir la distancia usamos el **metro**, y por tanto nos quedaría:

-   **Sin prefijo** : metro, una unidad.

-   **deca-**metro: $10^1$ metros

-   **hecto-**metro: $10^2$ metros

-   **kilo-**metro: $10^3$ metros

-   **mega-**metro: $10^6$ metros

-   **giga-**metro: $10^9$ metros

-   \...

En decimal hacemos uso de la **base 10**, y por tanto con cada prefijo lo que estamos haciendo es modificar el exponente que indica la cantidad. Para unidades pequeñas el exponente varía de uno en uno, pero a partir de cierta cantidad (**kilo-**), la cantidad cambia multiplicando por 1000 ($10^3$).

## Sistema binario {#sistema-binario-explicacion}

En informática la información se guarda en formato binario, y la unidad más pequeña es el **bit**, que es un acrónimo de ***bi**nary digi**t***. Cada bit es una única unidad que sólo permite dos estados: **0** o **1**. A la hora de representarlo se hace uso de la letra **b** minúscula, por lo tanto, **10b** son 10bits.

### Múltiplos {#múltiplos}

Al igual que en decimal, a medida que aumentamos la cantidad, se hace uso de prefijos para facilitar el conocer de qué cantidad estamos hablando.

A continuación se expone una tabla de las medidas más utilizadas:

| Nombre       | Símbolo | Cantidad  |
|:------------:|:-------:|:---------:|
|  **Bit**     | **b**   | $2^0=1$   |
| Nibble       |         | 4b  |
| **Byte**     | **B**   | 8b  |
| **Kibi**byte | **KiB** | $2^{10}=1024$ B |
| **Mebi**byte | **MiB** | $2^{20}=1024$ KiB |
| **Gibi**byte | **GiB** | $2^{30}=1024$ MiB |
| **Tebi**byte | **TiB** | $2^{40}=1024$ GiB |
| **Pebi**byte | **PiB** | $2^{50}=1024$ TiB |
| **Exbi**byte | **EiB** | $2^{60}=1024$ PiB |

Table: {tablename=yukitblr}


## Sistema decimal {#sistema-decimal-explicacion}

Aunque la manera correcta de nombrar las unidades cuando hablamos en términos informáticos debería ser la anterior (en sistema binario), lo habitual es que se haga uso de los prefijos del sistema decimal. En la siguiente tabla se ven los nombres y cantidades:

| Nombre       | Símbolo | Cantidad  |
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
Cuando hablamos de unidades informáticas **deberíamos usar el sistema binario**, ya que es tal como se guarda la información y la cantidad real.
:::


## Usos {#usos}

A la hora de utilizar las medidas vistas previamente hay que diferenciar qué queremos medir, ya que no se hará siempre igual.

-   **Almacenamiento**: A la hora de querer expresar una cantidad de almacenamiento (para un disco duro, un *pendrive* USB, RAM, \...) se hace uso del **Byte** y de sus múltiplos usando los prefijos vistos previamente.

    :::::::::::::: {.columns }
    ::: {.column width="40%"}
    ![](img/temas_comunes/unidades_informacion/hdd.png){width="100%"}
    :::
    ::: {.column width="50%" }
    ![](img/temas_comunes/unidades_informacion/hdd2.png){width="100%" framed=true}
    :::
    ::::::::::::::
    
    ::: center
    [Exploradores de ficheros mostrando la cantidad en decimal y binario.]{.footnotesize}
    :::

-   **Transmisión**: Cuando hablamos de tasa de transferencia de datos se hace uso del término "tasa de bits" (en inglés ***bitrate***), que indican el número de bits que se transmiten por unidad de tiempo. Hoy día se suele medir en kbps (o kb/s, kilobits por segundo), Mbps (Mb/s, o megabit por segundo), \... Para convertirlo a Bytes por segundo habría que dividirlo por "8".

    ::: center
    ![](img/temas_comunes/unidades_informacion/bitrate.png){width="40%"}
    :::

::: warnbox
**La transmisión de datos se expresa en "bits por segundo"**
:::
