

# Sarrera {#introducción-wsl}

[WSL](https://learn.microsoft.com/es-es/windows/wsl/) (*Windows Subsystem for Linux* ingelesez) Microsoft-ek garatutako bateragarritasun-geruza bat da, Linux sistemetarako sortutako exekutagarriak Windows-en modu naturalean exekutatzeko.

2019\. urtetik aurrera bertsio lehenetsia 2.a da, eta horrek aldaketa asko ekarri zituen sisteman, bertsio horrek **[Hyper-V](https://es.wikipedia.org/wiki/Hyper-V) virtualizatzailearen azpimultzo** baten bidez sortutako birtualizazio-geruza batean exekutatzen baitu. Horrek esan nahi du exekutatzen ari den kernel-a askoz bateragarriagoa dela Linux-eko binarioekin 1. bertsioan baino. Birtualizazioa erabiltzen duen arren, aurreko bertsioarekin alderatuta errendimendua ere hobetzen du.

Lehenespenez, WSL ez dator instalatuta Windows 10ean, beraz, instalazioa egin behar da nahi ditugun aplikazioak (Docker, adibidez) exekutatu ahal izateko. Windows 11 bertsioetan, ordea, bai dator instalatuta.

# Instalazioa {#instalación-wsl}

Instalazioa egiteko, Windows-en bertsio bateragarria beharko dugu (10 build 19041 edo berriagoa). Gaur egun ez luke arazoa izan behar sistema eguneratuta badugu.

Instalazioa egiteko administratzaile baimenak beharko ditugu, eta erosoago egiteko PowerShell kontsolatik edo [Windows terminal berritik](https://github.com/microsoft/terminal) egingo dugu. Horretarako, administratzaile baimenekin kontsola ireki eta exekutatu:


::: {.mycode}
[WSL instalazioa Windows 10n]{.title}

``` powershell
PS C:\Users\ruben> wsl --install
```
:::


Instalazioa egin ondoren, sistema berrabiarazi behar da aldaketak aplikatzeko eta beharrezko zerbitzuak abiarazteko. Behin berrabiarazita, leiho bat agertuko da eta bertan erabiltzailea eta pasahitza sartzeko eskatuko digu, berriki instalatutako Linux sistemarako.

::: infobox
Lehenespenez, instalatzen den banaketa Ubuntu da.
:::

# Konfigurazioak {#configuraciones-wsl}

Instalazioa egin ondoren ikusiko dugu Windows-ek zenbait konfigurazio egin dituela zerbitzu berriaren instalazioa egokitzeko.

- Instantziak abiarazita daudenean, Hyper-V sare-interfaze berri bat sortzen da, 172.25.240.0/20 sarearekin.
- Aurretik esan bezala, WSL-2-n instantziak benetan Hyper-V makina birtualak dira. Instantzien konfigurazioa erabiltzaileak sortzen duen [AppData]{.configdir} direktorioan dago. Adibidez, Debian-en kasuan, disko gogorra [./AppData/Local/Packages/TheDebianProject.../LocalState/ext4.vhdx]{.configfile} barruan dago.

  ::: warnbox
AppData direktorioa lehenespenez ezkutatuta dago Windows fitxategi-arakatzailean.
  :::

- Instantzien barruan, Windows-en disko gogorra atzitu daiteke [/mnt/c]{.configdir}-tik edo dagokion unitatetik.
- Windows-etik, fitxategi-arakatzailearen bidez, instantzien fitxategi-sistemara sar daiteke, sortuta ditugun instantziak bertan agertzen baitira.

WSL ekosistema osoaren konfigurazio orokorra egiteko, aplikazio baten bidez egin daiteke (2024ko udazkenetik aurrera erabilgarri):

![WSL konfigurazio-aplikazioa](img/temas_comunes/wsl/configuracion.png){width="100%" framed=true}

Aplikazio honetan alderdi interesgarri hauek aldatu daitezke:

- WSL barruko prozesadore logikoak
- Memoriaren gehieneko tamaina
- Sare modua (NAT, mirrored edo proxy)


## Konfigurazio aurreratua {#configuración-avanzada}

Konfigurazio aurreratu bat egiteko, [dokumentazio hau](https://learn.microsoft.com/en-us/windows/wsl/wsl-config) erabil daiteke, bi ikuspegitatik:

-   [wsl.conf]{.configfile}: konfigurazio-fitxategia, distribuzioetako [/etc]{.configdir} direktorioan kokatzen dena. **Konfigurazio honek soilik eragina du dagokion distribuzioan**. Aurrerago Docker erabiltzeko adibide bat ikusiko dugu.

-   [.wslconfig]{.configfile}: **Windows erabiltzailearen direktorioan dagoen fitxategia**. Fitxategi honek WSL 2-rekin instalatutako distribuzio guztiei eragingo dien konfigurazioa izango du.


# WSL pribilegio gabeko erabiltzaileekin

WSL-k administratzaile-baimenak behar dituzten zenbait ezaugarri erabiltzen ditu. Administratzaile-baimenik ez badago, lehenespenez WSL 1 bertsioa erabiliko da soilik, eta horren ondorioz azpisistemen errendimendua okerragoa da.

Beraz, WSL2 erabili ahal izateko **administratzailearen kredentzialetara sarbidea izatea beharrezkoa da** eta ondorengo komandoak exekutatu behar dira:

::: {.mycode}
Pribilegio gabeko erabiltzaileetan WSL2 erabiltzea]{.title}

``` powershell
PS C:\Users\usuario> wsl --update

PS C:\Users\usuario> wsl --set-default-version 2
```
:::


# Komando erabilgarriak {#comandos-útiles}

Instalazioa egin ondoren, komando batzuk erabilgarriak izan daitezke WSL erabiltzerakoan. Ez dira guztiak zehaztuko, izan ere, [wsl --help]{.commandbox} komandoarekin laguntza eta aukera gehiago lortuko ditugu.


::: {.mycode}
[Erakutsi instala daitezkeen banaketa guztiak]{.title}

``` powershell
PS C:\Users\ruben> wsl -l -o
```
:::


::: {.mycode}
[Debian banaketa bat instalatu]{.title}

``` powershell
PS C:\Users\ruben> wsl --install -d Debian
```
:::


::: {.mycode}
[Erakutsi instalatutako banaketak]{.title}

``` powershell
PS C:\Users\ruben> wsl -l -v
```
:::



::: {.mycode}
[Exekutatu instalatutako banaketa bat eta sartu bertan ]{.title}

``` powershell
PS C:\Users\ruben> wsl -d Debian
ruben@DESKTOP-1RVJ3UP:/mnt/c/Users/ruben$
```
:::


::: {.mycode}
[Amaitu/Itzali banaketa bat]{.title}

``` powershell
PS C:\Users\ruben> wsl -t Debian
```
:::



::: {.mycode}
[Itzali instantzia guztiak]{.title}

``` powershell
PS C:\Users\ruben> wsl --shutdown
```
:::


::: {.mycode}
[Ezabatu instalatutako banaketa bat]{.title}

``` powershell
PS C:\Users\ruben> wsl --unregister Debian
```
:::


::: {.mycode}
[Klonatu instalatutako banaketa baten instantzia]{.title}

``` powershell
PS C:\Users\ruben> wsl --export Ubuntu ubuntu.tar

PS C:\Users\ruben> wsl --import Ubuntu2 ubuntu2_files ./ubuntu.tar
```
:::




# Azpisistemen fitxategi-sistemara sartzea

Microsoft-ek WSL-rekin abiarazten ditugun Linux-eko fitxategi-sistemetara Windows fitxategi-esploratzailearen bidez sartzeko aukera sortu du. Honek aukera ematen du fitxategiak kopiatzeko/itsasteko sortu ditugun banaketen eta oinarri-sistema beraren artean. Hurrengo irudian hiru Linux azpisistema sortuta dauden esploratzailea ikus daiteke:

![Ubuntu-ko "/home/ruben" edukia Windows esploratzailetik](img/temas_comunes/wsl/explorador_archivos.png){width="60%" framed=true}

Bestela, azpisistema Linux-etik bertatik [Windows aplikazioak exekuta ditzakegu](https://learn.microsoft.com/en-us/windows/wsl/filesystems#run-windows-tools-from-linux), beraz edozein karpetan gaudela, [explorer.exe .]{.commandbox} komandoa deitu dezakegu, eta horrek Windows esploratzailea irekiko du bide horretan bertan:

![Linux-etik Windows esploratzailea ireki](img/temas_comunes/wsl/explorador_archivos_2.png){width="60%"}


## Fitxategi-sistemen errendimendua WSL-n

WSL nola funtzionatzen duen eta fitxategi-sistemen kudeaketa Windows sistema ostalariaren eta Linux azpisistemaren artean nola egiten den ikusita, argi izan behar dugu **bi fitxategi-sistema independente daudela, baina elkarreragingarriak direla**:

- **Windows fitxategi-sistema**: Gure Windows ordenagailuaren fitxategi-sistema da. Kontuan izan behar da, Linux azpisistemara sartzean, lehenespenez fitxategi-sistema horretan gaudela:

::: {.mycode}
[Linux azpisistemara sartzean, Windows fitxategi-sisteman gaude.]{.title}

``` powershell
PS C:\Users\ruben\Desktop> wsl -d Ubuntu
ruben@DESKTOP-1RVJ3UP:/mnt/c/Users/ruben/Desktop$
```
:::

  Ikus daitekeen bezala, Ubuntun sartzean, gauden bidea hau da: [/mnt/c/Users/ruben/Desktop]{.configdir}, hau da, Windows fitxategi-sistema (`C:`) **Linux-eko bidean muntatuta** dagoena `/mnt/c`. Horregatik, Linux-etik Windows fitxategi-sistema osoa izango dugu eskuragarri bide horretatik.

- **Linux azpisistemaren fitxategi-sistema**: Sortu dugun Linux makina birtualak bere fitxategi-sistema propioa dauka, edozein Linux-en bezala, `/` direktorioan.

::: {.mycode}
[Linux fitxategi-sistema errealera pasatzen gara]{.title}

``` powershell
ruben@DESKTOP-1RVJ3UP:/mnt/c/Users/ruben/Desktop$ cd
ruben@DESKTOP-1RVJ3UP:~$ pwd
/home/ruben
```
:::

Ikus daitekeen bezala, [pwd]{.commandbox} komandoarekin, orain Linux errealeko fitxategi-sisteman gaude.

Linux azpisisteman aplikazioak erabiltzerakoan, gomendagarria da beti Linux-eko fitxategi-sistemaren barruan egitea, eta ez muntatutako sisteman, [errendimendua](https://learn.microsoft.com/en-us/windows/wsl/filesystems#file-storage-and-performance-across-file-systems) askoz txikiagoa baita muntatutako sisteman. Beraz, ziurtatu behar dugu aplikazioa bide egokian dagoela.

::: errorbox
**Windows fitxategi-sistema muntatua erabiltzeak Linux azpisisteman errendimendua kaltetzen du.**
:::

# Docker WSL barruan {#docker-dentro-de-wsl}

Linux azpisistema batean Docker eduki nahi badugu, bi aukera bereiztu ditzakegu:

- **[Docker Desktop](#instalacion-docker-windows-mac) Windows-en** erabiltzea. Docker Desktop-ek WSL erabiliko du azpian, eta aukera dugu azpisistemek Docker Desktop-en instalatutako Docker engine-a erabiltzeko. Hau da [Microsoft-en dokumentazioak](https://learn.microsoft.com/es-es/windows/wsl/tutorials/wsl-containers) gomendatutako modua.
- Docker Engine Linux azpisistema baten barruan instalatzea.

Azken metodo hau behean azaltzen dugu.

## Docker Engine WSLn instalatzea {#docker-engine-dentro-de-wsl}

Batzuetan interesgarria izan daiteke ez erabiltzea [Docker Desktop](#instalacion-docker-windows-mac), Docker-en kontrol osoa izan nahi dugulako, Linux makina birtual oso baten instalazioan bezala. Horregatik, dagokion Linux azpisistemaren funtzionamenduan aldaketa txiki bat egin behar dugu.

::: warnbox
Docker Desktop erabiltzea errazagoa da sistema honen ordez.
:::

Adibidez, Ubuntu banaketako Linux azpisistema sortu badugu, bertan sartu beharko gara, eta [/etc/wsl.conf]{.configfile} fitxategi bat sortu beharko dugu hurrengo edukiarekin.

::: {.mycode}
[wsl.conf fitxategiaren konfigurazioa]{.title}

``` yaml
[boot]
systemd=true
```
:::


Banaketatik irteten gara eta bere berrabiaraztea behartu behar dugu. Behin urrats hauek eginda, berriro instantzian sartzen bagara, [systemd]{.commandbox} martxan egongo da eta, beraz, Docker Engine instalatu eta erabili ahal izango dugu ohiko moduan sortutako makina birtual baten moduan.

