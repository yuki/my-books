
# RAID-1 softwarea GNU/Linux-en {#raid-software}

RAID-1 baten konfigurazioa egingo dugu GNU/Linux sistema batean [mdadm]{.commandbox} tresna erabiliz. Gure sisteman (Debian, Ubuntu, Mint, ...) instalatuta egon beharko luke, oinarrizko komando bat baita; hala ere, beste distribuzio batzuetan baliteke instalatu behar izatea.

Ulertu behar dugu RAID sistema bat sortzean egiten dena dela "**gailu birtual**" bat konfiguratzea; gailu horrek barnean hainbat disko gogor fisiko (edo partizio) erabiltzen ditu. Gailu birtual hori sortu ondoren, bertan fitxategi-sistema bat sortu beharko dugu (adibidez, ext4).

## Disko gogorrak egiaztatu {#mdadm-discos-duros}

Egiaztatu behar dugu gure sisteman, sistema-diskoaz gain, gutxienez bi disko ditugula:



::: mycode
[Egiaztatu ditugun diskoak]{.title}

``` console
root@vega:~# lsblk
NAME   MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
vda      8:0    0   25G  0 disk
├─vda1   8:1    0    1M  0 part
├─vda2   8:2    0  513M  0 part /boot/efi
└─vda3   8:3    0 24,5G  0 part /
vdb      8:16   0   10G  0 disk
vdc      8:32   0   10G  0 disk
```
:::


Ikus daitekeen bezala, partiziorik gabeko bi disko gogor ditugu: [vdb]{.verbatim} eta [vdc]{.verbatim}, bakoitza 10GB-koa. Beste kasu batzuetan **sdb**, **sdc**... izan daitezke.

::: infobox
GNU/Linux banaketa batzuek aukera ematen dute RAID sistema bat sortzeko instalazioa egin aurretik, eta horrela sistema eragilea RAIDaren gainean instalatzeko.
:::


### Partizioak sortu {#crear-particiones}

Gure RAID sistemari eman nahi diogun erabileraren eta diskoen tamainaren arabera, beharrezkoa izango da partizioak sortzea.

::: infobox
Posible da RAID sistema bat partizio bakar batean sortzea eta diskoaren gainerakoa modu arruntean erabiltzea.
:::

Pentsa dezagun honako egoera hau:

- 4TB-ko bi disko gogor
- RAID-1 bat erabili nahi dugu 500GB baino handiagoak ez diren datuetarako, baina etorkizunean handituz gero tarte bat utzi nahi dugu.
- Espazioaren zati bat garrantzirik gabeko beste datu batzuetarako erabili nahi dugu, eta ez da ezer gertatzen galtzen badira.

Kasu honetan, honakoa egin genezake:

- Bi diskoetan 1TB-ko partizioak sortu RAID-1 sistema muntatzeko.
- Gainerako espazioa beste datu batzuetarako uztea (guztira 6TB).


GNU/Linuxen partizioak sortzeko hainbat programa daude (**Gparted**, adibidez), baina partizio horiek mota berezi batekoak izan behar dute, eta programa guztiek ez dute mota hori onartzen.

[cfdisk]{.commandbox} erabiliko dugu disko bakoitzerako:

::: mycode
[Partizioak sortu /dev/sdb-n]{.title}

``` console
root@vega:~# cfdisk /dev/vdb
```
:::

Diskoa instalatu berria bada eta partizio-taularik ez badu, honako hau agertuko zaigu:

![](img/anexos/raid_software/cfdisk-1.png){width=45%}

Partizio-taula sortu ondoren, partizio berri bat sortzeko menua ikusiko dugu:

![](img/anexos/raid_software/cfdisk-2.png){width=100%}

"Nueva" aukeratzean, partizio berriaren tamaina galdetuko digu; adibidez, 5G:

![](img/anexos/raid_software/cfdisk-3.png){width=100%}

Behin sortuta, ikusiko dugu partizio mota "Linux fitxategi-sistema" dela, baina mota aldatu behar dugu.

::: errorbox
Partizio mota "Linux RAID" motara aldatu behar dugu.
:::

Partizio mota aldatzeko, "Tipo" aukeratu eta **Linux RAID** bilatuko dugu:

![](img/anexos/raid_software/cfdisk-4.png){width=55%}

Orain arte egindako aldaketak "birtualak" dira; oraindik ez dira diskoan aplikatu. Beraz, **"Escribir" aukerari eman behar zaio aldaketak gordetzeko**.


::: warnbox
Gogoratu aldaketa hauek RAIDean parte hartuko duen disko bakoitzean egin behar direla.
:::

Prozesu osoaren amaieran, honako hau izango genuke:



:::::::::::::: {.columns }
::: {.column width="45%"}
![Sortutako partizioak](img/anexos/raid_software/raid-particiones-1.svg){width="100%"}
:::
::: {.column width="45%" }
![RAID-1 sortuta partizioen "gainean"](img/anexos/raid_software/raid-particiones-2.svg){width="100%"}
:::
::::::::::::::


## RAID-1 sortu {#crear-raid}

RAIDa sortzeko honako komandoa erabiliko dugu:


::: {.mycode size=footnotesize}
[Sortu RAID-1]{.title}

``` console
root@vega:~# mdadm --create  /dev/md0  --level=1 --raid-devices=2 /dev/vdb /dev/vdc
mdadm: Note: this array has metadata at the start and
    may not be suitable as a boot device.  If you plan to
    store '/boot' on this device please ensure that
    your boot-loader understands md/v1.x metadata, or use
    --metadata=0.90
mdadm: size set to 10476544K
Continue creating array?
```
:::

Garrantzitsua da ematen digun abisua kontuan hartzea: sistema RAID baten gainean abiarazi nahi badugu, abio-kudeatzaileak hori onartu behar du. Printzipioz, ez luke arazorik egon behar.

::: warnbox
Gure sistema eragilea RAID batetik abiarazten bada, abio-kudeatzaileak hori onartu behar du.
:::


Erabili dugun komandoak honako parametro hauek ditu:

- [mdadm]{.verbatim}: gure RAIDak sortu eta kudeatzeko erabiliko dugun komandoa da.
- [\-\-create /dev/md0]{.verbatim}: RAID berri bat sortzeko parametroa da; Linuxen "/dev/md0" izeneko "gailu birtual" berria sortuko du.
- [\-\-level=1]{.verbatim}: sortu nahi dugun RAID mota; gure kasuan, RAID-1.
- [\-\-raid-devices=2]{.verbatim}: gure RAIDean parte hartuko duten gailu kopurua.
- [/dev/vdb /dev/vdc]{.verbatim}: RAIDean parte hartuko duten disko gogorrak edo partizioak.

::: errorbox
Berrabiarazi ondoren baliteke RAIDa /dev/md0 izatetik /dev/md127 izatera berrizendatu izana.
:::

Baliteke gure RAIDa berrizendatzea; hori saihesteko aukerak badaude, baina momentuz ez dugu kontuan hartuko.


## RAIDaren egoera egiaztatu {#raid-estado}

RAID bat sortzen denean, gailu birtuala sortzeko prozesua hasten da; aurreko adibidean [/dev/md0]{.verbatim}. RAID bat osatzen duten disko gogorrek huts egin dezakete, edo akatsen bat egon daiteke; beraz, garrantzitsua da RAIDa behar bezala dabilen jakitea.

Egoera ikusteko bi komando erabil ditzakegu:

### Egoera orokorra {#raid-estado-general}

GNU/Linuxen RAID sistema bat erabiltzean, RAID sistema guztien egoera orokorra egiazta dezakegu [/proc/mdstat]{.configfile} "fitxategia" erabiliz:


::: {.mycode size=footnotesize}
[RAID-1 egoera egiaztatu]{.title}

``` console
root@vega:~# cat /proc/mdstat
Personalities : [linear] [raid0] [raid1] [raid6] [raid5] [raid4] [raid10]
md0 : active raid1 vdc[1] vdb[0]
      10476544 blocks super 1.2 [2/2] [UU]
      [==>..................]  resync = 13.5% (1420032/10476544) finish=0.7min
      speed=202861K/sec

unused devices: <none>
```
:::

Ikusten badugu, egoera honetan sistemak sinkronizatzen ari dela adierazten digu. Hau gerta daiteke RAIDa sortu berri dugulako edo disko berri bat ordezkatu berri dugulako.

Sinkronizazioa amaitzen denean, honelako zerbait agertuko litzateke:

::: {.mycode size=footnotesize}
[Comprobar estado RAID-1]{.title}

``` console
root@vega:~# cat /proc/mdstat
Personalities : [linear] [raid0] [raid1] [raid6] [raid5] [raid4] [raid10]
md0 : active raid1 vdc[1] vdb[0]
      10476544 blocks super 1.2 [2/2] [UU]

unused devices: <none>
```
:::

RAID degradatu bat begiratzen badugu, hau da, disko bat kenduta dagoenean, honelako zerbait agertuko zaigu:

::: {.mycode size=footnotesize}
[RAID-1 con fallo]{.title}

``` console
root@vega:~# cat /proc/mdstat
Personalities : [linear] [raid0] [raid1] [raid6] [raid5] [raid4] [raid10]
md127 : inactive vdb[1](S)
      10476544 blocks super 1.2
```
:::

Begiratu **inactive** egoerari; honek esan nahi du RAIDaren egoera gelditu dela, akats gehiago saihesteko, konpondu arte.



### RAID bakar baten egoera {#raid-estado-uno}

[mdadm]{.commandbox} komandoarekin RAID sistema bakar baten egoera ere ikus dezakegu. Horretarako, bere izena jakin behar dugu; gure kasuan [md0]{.verbatim}.

::: {.mycode size=footnotesize}
[RAID-1 egoera aztertu]{.title}

``` console
root@vega:~# mdadm --detail /dev/md0
/dev/md0:
           Version : 1.2
     Creation Time : Mon Mar  2 17:45:17 2026
        Raid Level : raid1
        Array Size : 10476544 (9.99 GiB 10.73 GB)
     Used Dev Size : 10476544 (9.99 GiB 10.73 GB)
      Raid Devices : 2
     Total Devices : 2
       Persistence : Superblock is persistent

       Update Time : Mon Mar  2 17:46:09 2026
             State : clean
    Active Devices : 2
   Working Devices : 2
    Failed Devices : 0
     Spare Devices : 0

Consistency Policy : resync

              Name : mint:0  (local to host mint)
              UUID : 34ca56f7:9f58fb2c:bd4295b8:56d40413
            Events : 17

    Number   Major   Minor   RaidDevice State
       0     253       16        0      active sync   /dev/vdb
       1     253       32        1      active sync   /dev/vdc
```
:::

RAIDa sinkronizazio-egoeran badago, honelako zerbait ikusiko genuke: "**Resync Status : 60% complete**".

RAIDa ondo dagoela egiaztatzeko, **"State: clean"** lerroa ere ikus dezakegu. Akatsen bat badago, baliteke **"State: inactive"** agertzea.


## Fitxategi-sistema sortu {#crear-sistema-ficheros-en-raid}

Sortu dugun RAID sistema diskoen barne-kudeaketa da, baina haren gainean fitxategi-sistema bat sortu behar dugu.

::: warnbox
RAID sistema sortu ondoren, haren gainean fitxategi-sistema bat sortu behar da.
:::

Horretarako, Gparted erabil dezakegu, [md0]{.verbatim} disko gisa hautatuz.


![](img/anexos/raid_software/gparted-raid.png){width=85% framed=true}

Fitxategi-sistema sortu ondoren, egin ditugun urrats guztien eskema honelakoa izango litzateke:

![](img/anexos/raid_software/raid-final.svg){width=65%}

Laburbilduz, azken urratsak hauek lirateke:

1. Beharrezkoa bada, partizioak sortu.
2. Dagokion partizio/diskoetan RAID sistema sortu.
3. Sortutako RAIDaren gainean fitxategi-sistema sortu.
4. Fitxategi-sistema ohiko moduan erabili.


# Proposatutako arikta  {#ejercicio-raid}

RAID sistemek nola funtzionatzen duten hobeto ulertzeko, honako ariketa hau egitea proposatzen da:

1. 15GB-ko 3 disko gogor sortu makina birtual batean.
2. 10GB-ko RAID-1 sistema sortu, 3 disko gogorrek parte hartuta.
3. Gainerako espazioarekin RAID-5 sistema sortu.


![](img/anexos/raid_software/raid-ejercicio.svg){width=65%}


4. Sortu berri diren RAIDen gainean fitxategi-sistemak sortu.

