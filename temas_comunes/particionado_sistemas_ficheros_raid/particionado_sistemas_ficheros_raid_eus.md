
# Partizioak eta fitxategi-sistemak {#partizioak-fitxategi-sistemak}

Aurreko atalean ikusi dugu [biltegiratze-sistemak](#biltegiratze_gailuak) (diska gogorrak izenez ere ezagunak) hainbat motatako, gaitasuneko eta tamainako gailuak izan daitezkeela...

Sistema Eragilean disko gogor bat erabiltzerakoan, gutxienez bi kontu hartu behar ditugu kontuan:

-   **Partizio mota**.

-   **Fitxategi-sistema**.

Sistema Eragilearen arabera, eta instalazioan aukeratutako moduan, aukera gehiago edo gutxiago emango dizkigu aukera hauek hautatzeko, aldatzeko edo pertsonalizatzeko.

Erabaki egokiak hartzeko, gutxienez, honako xehetasun hauek jakin beharko genituzke:

-   Ordenagailuan instalatutako disko gogor kopurua.

-   Bakoitzaren mota (mekanikoa, SSD, NVMe...).

-   Haien tamaina.

-   Ordenagailuak beteko duen funtzioa.

Horrela, instalazioa nola egin nahi dugun aurrez aztertu ahal izango dugu.

## MBR eta GPT partizioak  {#particionado-mbr-y-gpt}

Disko gogorrak partizio izeneko zatitan banatzen dira. Espazioaren zatiketa **logikoak** dira, elkarren artean independenteak direnak.

**Disko gogorraren partizioaren antzekoa armairu bat litzateke**: espazio jakin bat dugu, eta hori "partizio" egiten dugu apal horizontal eta bertikalak gehituz, arropa mota desberdinak modu independentean gordetzeko, konpartimentu bakoitzean.

Disko gogor baten partizio-taula sortzerakoan, honako mota hauen artean aukeratu dezakegu:

-   **MBR**: *Master Boot Record*-etik, edo **DOS partizio-taula** izenez ere ezaguna.

-   **GPT**: *GUID Partition Table*-tik, EFI zehaztapenak proposatua, aurrekoa baino modernoagoa.

Hurrengo taulan bi sistema hauen arteko desberdintasun nabarmenenak ikus daitezke, eta GPT-k dituen abantailek sistema sendoagoa egiten dute:

|    | MBR | GPT |
|:--:|:--:|:--:|
| Partizioaren gehienezko tamaina | 2 TB | 18 Exabyte |
| Partizio primario kopurua | 4 | Mugagabea (Windows-ek 128 onartzen ditu) |
| Partizio-taula| Hasieran | Hasieran eta amaieran (babeskopia) |
| Partizioaren IDa | Partizioan gordetzen da | GUID identifikatzaile bakarra|
| Abio anitzeko euskarria | Ahula | Abio-kudeatzailearen sarrerak partizio bereizi batean daude  |

Table: {tablename=yukitblrcol colspec=XXX}

Gure disko gogorraren partizio-sistema zein den egiaztatzeko:

-   **Windows**-en: Disko kudeatzailetik.

-   **GNU/Linux**-en: GParted, fdisk, ...

Jarraian, Windows ordenagailu bateko disko desberdinen pantaila-argazkiak ikus daitezke.

:::::::::::::: {.columns }
::: {.column width="45%"}
![](img/temas_comunes/particionado_sistemas_ficheros_raid/hdd_mbr.png){width="100%"}
:::
::: {.column width="45%" }
![](img/temas_comunes/particionado_sistemas_ficheros_raid/hdd_gpt.png){width="100%"}
:::
::::::::::::::


## RAID {#raid}

RAID (*redundant array of independent disks* ingelesez) disko independenteen matrize edo talde errepikakorra da, hainbat biltegiratze-unitate erabiliz biltegiratze logiko bakarra sortzeko sistema bati egiten dio erreferentzia. Horrela, **sistema eragileak biltegiratze logiko bakarra ikusten du, baina "azpian" hainbat disko erabiltzen dira**.

Sortutako talde motaren arabera, datuak banatu edo errepikatu egingo dira taldea osatzen duten unitateen artean.

RAID sistema bat sortzerakoan, bi modutan egin daiteke:

-   **Hardware bidezko RAID**: RAID sistemaren eragiketak egiteaz eta kudeatzeaz hardware espezializatu bat arduratzen da. Bi azpimota bereiz daitezke:

    -   **Plaka nagusia**: Plaka batzuek RAID sortzeaz arduratzen den kontrolagailu espezializatua dute, UEFI sistematik kudeatu daitekeena.

    -   **Kontrolagailu-txartel espezializatua**: Hau da sistema **profesionalena**. Diskoak plaka nagusira konektatu ordez, txartel honetara konektatzen dira (normalean SATA bidez eta konektore berezien bidez). Batzuetan bateria propioa dute (zerbitzariak elikadura galtzen badu idazketa kontrolatzeko) eta konfigurazio-menu propioa.

-   **Software bidezko RAID**: Sistema Eragileak arduratzen da RAID sistema sortzeaz eta kudeatzeaz. Paritatea beharrezkoa bada, CPU-k egingo du, beste prozesuei baliabideak kenduz.

[Wikipedia](https://es.wikipedia.org/wiki/RAID)n ikus daitekeenez, RAID mota desberdinak daude, eta elkarren artean konbina daitezke, baina jarraian ohikoenak azalduko dira.

### RAID 0 {#raid-0}

:::::::::::::: {.columns }
::: {.column width="65%"}
RAID 0 sistemak datuak modu berdinean banatzen ditu bi edo disko gehiagoren artean, paritate-informaziorik erabili gabe. RAID 0-k **ez du errepikapena ahalbidetzen**, beraz, **sistemako diskoetako bat hondatzen bada, datu guztiak galduko dira**.

**Guztizko espazioa = diskoen espazioen batuketa.**

Sistema honekin idazketa-abiadura handiagoa lor daiteke, datuak disko guztietan aldi berean idazten direlako.
:::
::: {.column width="30%" }
![Iturria: [Wikipedia](https://commons.wikimedia.org/wiki/File\:Raid0.png)](img/temas_comunes/particionado_sistemas_ficheros_raid/Raid0.png){width="100%"}
:::
::::::::::::::

::: errorbox
**Ez da gomendagarria RAID 0 erabiltzea datu garrantzitsuak dituzten sistemetan.**
:::


### RAID 1 {#raid-1}

RAID 1, ispilu-RAID izenez ere ezaguna, datuen kopia zehatza sortzen du bi edo biltegiratze-sistema gehiagotan.

:::::::::::::: {.columns }
::: {.column width="65%"}


Oso erabilgarria da datuak babestu nahi ditugunean, nahiz eta diskoen guztizko gaitasuna ez aprobetxatu. **Diskoetako bat hondatzen bada, datuak ez dira galduko**.

**RAID 1 tamaina txikieneko diskoaren tamainara mugatzen da.**

Idazketan ez da errendimendua hobetzen, baina irakurketa-denbora murrizten da diskoak aldi berean erabil daitezkeelako.
:::
::: {.column width="30%" }
![Iturria: [Wikipedia](https://commons.wikimedia.org/wiki/File\:Raid1.png)](img/temas_comunes/particionado_sistemas_ficheros_raid/Raid1.png){width="100%"}
:::
::::::::::::::


### RAID 5 {#raid-5}

RAID 5 datuak bloke mailan banatzen dituen sistema da, eta **paritatea** gehitzen du. Paritatea erabiliz, erroreak zuzendu edo disko bat galtzen bada datuak berreskuratu daitezke.

RAID 5 sistema bat sortzeko gutxienez 3 disko behar dira, eta horietako bat informazioa gordetzeko "erabiltzen ez dena" izango da.

**Guztizko bolumena = (n-1)\*disko txikienaren tamaina**, non "n" RAID 5 osatzen duten disko kopurua den. 3 disko 2TB-ko baditugu, guztizko tamaina = (3-1)\*2TB = 4TB izango da.

Disko bat hondatzen bada, datuak mantentzen dira, baina RAID 5 sistemak ez luke bigarren disko baten matxura jasango. Horregatik, hori gertatzen denean, disko hondatua ordezkatu behar da, datuak disko berrian berregin daitezen, paritate-sistemari esker.

::: center
![Iturria: [Wikipedia](https://commons.wikimedia.org/wiki/File\:Raid5.png)](img/temas_comunes/particionado_sistemas_ficheros_raid/Raid5.png){width="50%"}
:::

#### Spare/erreserba diskoak {#discos-sparereserva}

RAID 5 desberdin daude, eta hardware kontrolagailu batzuek, baita ere, "***hot spare***" edo **erreserba** izeneko diskoak izateko aukera ematen dute.

Disko hauek konektatuta daude (kontrolagailura edo plaka nagusira), baina ez daude RAID taldean. Taldeko diskoetako bat huts egiten duenean eta RAID sistema degradatuta dagoenean sartuko dira taldean.

Horrela, taldean sartzean, RAID-a automatikoki konpontzen hasiko da, sistemaren administratzaileak errorea gertatu dela jakin arte itxaron beharrik gabe.

## Fitxategi-sistemak {#sistemas-de-ficheros}

**Fitxategi-sistemek datuak nola gordetzen eta berreskuratzen diren kontrolatzen dute**. Fitxategi-sistemarik gabe, biltegiratze-euskarrian gordetako datuak datu-multzo handi bat izango lirateke, non ezinezkoa litzatekeen datu bat non amaitzen den eta hurrengoa non hasten den jakitea.

::: infobox
**Fitxategi-sistemak datuak nola gordetzen diren "*ikuspegi logiko*" bat eskaintzen digu.**
:::

Fitxategi-sistemen funtzio nagusiak hauek dira:

-   Fitxategiei espazioa esleitzea.

-   Espazio librea kudeatzea (beharrezkoa bada berrantolatuz).

-   Programetarako API bat eskaintzea fitxategiak sortu, ezabatu, aldatu eta ixteko.

-   Fitxategietarako sarbidea kudeatzea (baimenak).

-   Sarbide-errendimendua optimizatzea.

### Fitxategiak {#ficheros}

Fitxategi bat (edo artxibo bat) gailu batean gordetako byte-sekuentzia bat da, **izen batez eta normalean luzapen batez identifikatzen dena**. Fitxategiak direktorioetan gorde daitezke, eta hauek, aldi berean, beste direktorio batzuetan.

Ingelesez, ***file*** eta ***archive*** bereizten dira:

-   **File**: Elkarrekin gordetzen den informazio-multzoa da. Informazio hori nola gordetzen den irakurtzen/ idazten duen programaren diseinuaren araberakoa da.

-   **Archive**: Artxibo bat fitxategi-multzo bat da, ***metadata***-rekin batera (datuen inguruko informazioa ematen duten datuak). Adibide argiena artxibo konprimituak dira, programak banatzeko artxiboak, ...

Fitxategiek izen bat dute identifikatzeko. Fitxategi-sistemaren arabera, honela izan daiteke:

-   **Maiuskulak/minuskulak bereizten dituena (case sensitive)**: Hau da, "hola.txt" eta "HOla.txt" bi fitxategi desberdin dira.

-   **Maiuskulak/minuskulak bereizten ez dituena (case insensitive)**: Ez daude izen bereko bi fitxategi, nahiz eta maiuskulak eta minuskulak desberdinak izan. "hola.txt" eta "HOla.txt" ezin dira direktorio berean egon.

Fitxategiek normalean **luzapena** dute, izenaren ondoren puntu bat eta normalean 3 hizkiko luzapena. Luzapen hauek fitxategi mota bereizteko balio dute, baina ez dute fitxategiaren edukia zehazten.

::: warnbox
**Luzapenak ez du fitxategi mota zehazten. Fitxategi bati luzapena aldatzen badiogu, edukia berdina izaten jarraitzen du**
:::

[Ohiko luzapenen](https://en.wikipedia.org/wiki/List_of_filename_extensions) zerrenda txiki bat:

-   **Testu eta bulegoko dokumentuak**: .txt, .doc, .docx, .xls, .xlsx, .ppt, .pptx, .odt, .odp, .ods, .pdf ...

-   **Multimedia, irudi, audio, bideo fitxategiak**: .png, .jpg, .jpeg, .tiff, .ps, .bmp, .svg, .gif, .mp3, .mp4, .avi, .mpg, .mpeg, .mkv, ...

-   **Artxibo konprimituak**: .zip, .bz2, .gz, .gzip, .7z, .rar, .r00, ...

-   **Programazio fitxategiak**: .c, .java, .class, .py, .php, .rb, .pl, .sh, ...

Windows sistemetan luzapenak ezkutatuta daude fitxategi arakatzailean, beraz, erabiltzaile arrunt batek ez ditu ikusten.

### Erabilienak diren fitxategi-sistemak {#sistemas-de-ficheros-más-utilizados}

[Fitxategi-sistema asko](https://en.wikipedia.org/wiki/List_of_file_systems) daude, eta Sistema Eragile bakoitzak bat erabiltzen du lehenetsita, bere funtzioetarako optimizatua. Hala ere, beste fitxategi-sistema batzuk ere erabil ditzake beste gailu batzuetan.

:::infobox
**Sistema Eragileek fitxategi-sistema lehenetsia erabiltzen dute, baina normalean beste batzuetara ere sar daitezke**
:::

Jarraian, Sistema Eragile desberdinen fitxategi-sistema lehenetsiak eta lehenetsita irakur ditzaketen fitxategi-sistemak jasotzen dituen taula bat dago:

| Sistema Eragilea | Fitxategi-sistema | Irakur dezakeen beste batzuk |
| :----: | :----: | :----: |
| **DOS, Windows 95** |    |    |
| **Windows 95 OSR2, Windows 98** | FAT16, FAT32 |  |
|  **Windows NT, 2000, XP,...   Windows 10, Windows 11**  | NTFS (bertsio desberdinak)  |  FAT16, FAT32 |
| **Windows Server > 2012, Windows 11**  | NTFS, ReFS  | FAT16, FAT32, NTFS |
| **GNU/Linux** | Ext4, ReiserFS | Gehienak |
| **MacOS** | HFS+, APFS | FAT16, FAT32 |

Table: {tablename=yukitblr colspec=XXX}

Beste fitxategi-sistema batzuk irakurtzeko programak eta driver-ak badaude, baina **batzuetan mugak izan ditzakete (idazketan, baimenetan, ...)**.

[Wikipedia](https://en.wikipedia.org/wiki/Comparison_of_file_systems)n fitxategi-sistema askoren ezaugarriak jasotzen dira. Jarraian, informazio horren zati bat:

|   | FAT 32 | NTFS | ReFS | EXT-4 | APFS |
|:--|:--:|:--:|:--:|:--:|:--:|
| Fitxategi izen max. | 8.3 (255) | 255 | 255 | 255 | 255 |
| Bolumen max. | 16TB | 16TB | 1YB | 1 EB | ? |
| Fitxategi tamaina max. | 4GB | 16TB | 16EB | 16TB | 8 EB |
| Baimenak | Ez | Bai | Bai | Bai | Bai|
| Konpresioa | Ez | Bai | Ez | Ez | Bai|
| Zifratzea | Ez | Bai | Ez/Bai | Bai | Bai|

Table: {tablename=yukitblrcol colspec=X[2]XXXXX}

Fitxategi-sistemek ezaugarri berriak hartzen dituztenez, baliteke batzuk lehen bertsioetan ez egotea eta geroago gehitzea.

## Direktorioen hierarkia {#jerarquía-de-directorios}

Fitxategi-sistema batean informazioa gordetzerakoan, direktorioen hierarkia bati jarraituz egiten da. Hierarkia hau sistema eragilea instalatzean sortzen da, eta bertan sistemarako beharrezko fitxategiak gordetzen dira.

Geroago, hierarkia hau handitu daiteke erabiltzaileen informazioa gordetzeko, edo programak eta zerbitzuek informazioa gorde eta erabiltzeko. **Hasierako egitura mantendu egin behar da eta ez da aldatu behar ziur ez bagaude zer egiten ari garen**.

::: errorbox
**Sistema Eragilea instalatzean sortutako direktorio eta fitxategiak "aldatu ezin diren" egituraren parte dira. Aldatzen/mugitzen badira, baliteke sistema ez ibiltzea. KONTUZ!**
:::

### Windows sistemak {#sistemas-windows}

Microsoft-ek "[unitate-letra](https://es.wikipedia.org/wiki/Letra_de_unidad)" sistema erabiltzen hasi zen MS-DOS kaleratzearekin, nahiz eta ez ziren lehenak izan.

Sistema honek alfabetoaren letra bat erabiltzen du biltegiratze-sistemaren bolumen edo unitate logikoak identifikatzeko.

MS-DOS eta Windows-en, honela izendatzen dira:

-   **A:\\** [Disketea](#disquete) unitatea.

-   **B:\\** Bigarren diskete unitaterako erreserbatua.

-   **C:\\** Partizio edo disko gogor nagusia. Bertan instalatzen dira sistema eragilea eta programak.

-   **D:\\** CD-ROM/DVD-ROM-erako erreserbatua.

-   **E:\\** eta **Z:** beste disko gogor, partizio, CD-ROM/DVD-ROM, biltegiratze-sistema eramangarrietarako...

Sare bidez partekatutako karpetetarako ere erabil daiteke, nahiz eta ez den beharrezkoa.

### GNU/Linux {#gnulinux}

GNU/Linux sistema eragileetan (eta UNIX aldaeretan, hala nola FreeBSD eta MacOS) hierarkia puntu bakar batean hasten da, "**/**" izeneko **erro direktorioa** edo "barra".

[***Filesystem Hierarchy Standard*** (FHS)](https://es.wikipedia.org/wiki/Filesystem_Hierarchy_Standard) da fitxategiak hierarkian non gorde behar diren jakiteko erreferentzia, eta ezagunenetako batzuk hauek dira. Geroago hitz egingo dugu horri buruz.

