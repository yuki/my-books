
# Segurtasun-kopien sorrera GNU/Linux-en {#segurtasun-kopien-sorrera-gnulinux-en}

Ikusi dugun bezala, [segurtasun-kopien kudeaketa](#gestion_copias_de_seguridad) funtsezkoa da gure enpresako datuak babesteko. Barneratu behar dugu segurtasun-kopiak egitea, bai gure esparru pertsonalean bai profesionalean, gure informazioaren kudeaketaren parte dela, eta baita kopiak behar bezala egiten direla egiaztatzea ere.

Windows-en gertatzen den bezala, GNU/Linux-en ere hainbat sistema daude segurtasun-kopiak egiteko, baina erabiltzeko errazenetako bat gaur egun banaketa gehienetan instalatuta etortzen dena da: [rsync]{.commandbox}.

## Rsync direktorioak sinkronizatzeko (kopia zehatza) {#rsync-direktorioak-sinkronizatzeko}

Rsync aplikazio batek direktorioen sinkronizazioa egiteko aukera ematen du (lokalean edo urrunetik) modu eraginkorrean, izan ere, fitxategietan egindako aldaketak bakarrik sinkronizatzeko gai da.

Lehenespenez, **rsync**-ek jatorrizko direktorioan dauden aldaketak edo fitxategi berriak kopiatzen ditu eta helmugako direktoriora eramaten ditu. Fitxategi bat jatorrizko direktoriotik ezabatzen bada, **lehenespenez ez da helmugako direktoriotik ezabatzen**.

Rsync erabiltzeko modurik errazena direktorio lokal batetik urruneko zerbitzari batera sinkronizazioa sortzea da, datuen kopia bat gordetzeko.

::: infobox
**Urruneko sinkronizazio honek datu guztien kopia osoa egitearen parekoa da (modu errekurtsiboan), hau da, *full-backup* bat egitea.**
:::


::: mycode
[Bi direktorio lokal sinkronizatzeko adibidea]{.title}
```console
ruben@vega:~$ rsync -av directorio_origen  directorio_destino
```
:::

Aurreko adibidean egiten dena da **"directorio_origen"** osoa **"directorio_destino"** barruan sinkronizatzea. Aldiz:

::: mycode
[Bi direktorio lokal sinkronizatzeko adibidea]{.title}
```console
ruben@vega:~$ rsync -av directorio_origen/  directorio_destino2
```
:::

Adibide honetan, jatorrizko direktorioaren amaieran barra bat **"/"** gehitu dugunez, adierazten ari garena da **edukia (eta soilik edukia)** sinkronizatuko dela **"directorio_destino2"** barruan.

::: warnbox
Kontuz ibili behar da "**/**" horrekin, jartzeak edo ez jartzeak sinkronizazioan emaitza desberdinak ematen baititu.
:::


### Rsync urrunetik sinkronizatzeko {#rsync-urrunetik-sinkronizatzeko}

Dakigunez, ez genuke inoiz segurtasun-kopiarik egin behar lokalean disko gogor berean, ezta ekipo berean eduki ere; beraz, beharrezkoa da beste zerbitzari batzuetatik edo beste zerbitzarietara segurtasun-kopiak egin ahal izatea.

Imajinatu [/home/sistemas]{.configdir} karpeta partekatu bateko datuak **10.40.30.200** urruneko zerbitzarira kopiatu nahi ditugula, eta kopia bat [/home/backups]{.configdir} karpetan utzi:


::: mycode
[Sincronizar directorio local a servidor remoto]{.title}
```console
ruben@vega:~$ rsync -av /home/sistemas  root@10.40.30.200:/home/backups
```
:::

Komando honekin sinkronizazioa egingo dugu urruneko zerbitzarira, **[SSH](#ssh_server)** erabiliz eta **root** erabiltzailearekin konektatuz. Komandoaren atal desberdinen azalpena:

- **rsync** sinkronizazioa egiteko erabiltzen dugun programa da.

- **-av** sinkronizazioa artxibo moduan eta **"verbose"** moduan egiten duten parametroak dira (zer sinkronizatzen ari den erakusten du).

- **/home/sistemas** sinkronizatuko ditugun jatorrizko datuak dauden direktorioa da.

- **root** urruneko zerbitzarira konektatzeko erabiliko dugun erabiltzailea da.

- **\@10.40.30.200:** SSH bidez konektatuko garen zerbitzaria da kopia egiteko. **KONTUZ!** Garrantzitsua da **"@"** ikurra eta amaierako **":"** jartzea.

- **/home/backups** sinkronizatutako datuen kopia utziko dugun tokia da.

Aipatu den bezala, **rsync**-ek **SSH** erabiliko du urruneko konexioa egiteko; beraz, datuak modu seguru eta zifratuan bidaliko dira.

::: errorbox
Orain arte ikusitakoarekin fitxategi baten azken egoera bakarrik berreskuratu ahal izango genuke.
:::

### Urruneko datuak eskuratzea {#urruneko-datuak-eskuratzea}

Sinkronizazioa alderantzizko ordenan egin nahi badugu, hau da, backup zerbitzarian egonda urruneko zerbitzari batetik datuak ekarri nahi baditugu, komandoa honakoa izango litzateke:

::: mycode
[Urruneko direktorioa direktorio lokalarekin sinkronizatu]{.title}
```console
root@backups:~# rsync -av 10.40.30.5:/home/sistemas  /home/backups
```
:::


Kasu honetan, backup zerbitzarian egonda, 10.40.30.5 zerbitzaritik datuak ekarriko ditugu. Kasu honetan, zerbitzariaren IP helbidearen aurretik ez dugu erabiltzailea jarri; beraz, konexioa une honetan erabiltzen ari garen erabiltzailearekin egingo da, kasu honetan **root**.

## Rsync backup-ak egiteko

Aurreko adibideetan kopia osoak egin ditugu rsync exekutatzen dugun bakoitzean; beraz, ezin dugu berreskuratu fitxategi bat nola zegoen data zehatz batean.

**Backup inkrementala** egin nahi badugu, parametro berri batzuk gehitu behar ditugu, eta azken komandoa honela geratuko litzateke:

::: {.mycode size=footnotesize}
[Babeskopia inkrementala egiten]{.title}
```console
ruben@vega:~$ rsync -av --backup --backup-dir="Old/`date -I`" origen/  destino
```
:::

Parametro berrien azalpena honakoa da:

- **[\-b]{.verbatim}** edo **[\-\-backup]{.verbatim}**: aldatutako fitxategien backup-a sortzeko erabiltzen da (ordezkatu beharrean).
- **[\-\-backup-dir=]{.verbatim}**: **helmugan** (**en destino**) aldatutako fitxategiak non gordeko diren adierazten du, azken aldaketak jaso aurretik. Gure backup inkrementala nolakoa izatea nahi dugunaren arabera, direktorio bat erabil dezakegu edo datak jarri, aurreko adibidean bezala. Adibidez:
  - **[\-\-backup-dir="Old/\`date -I\`"]{.verbatim}**: Adibide honek eguneroko backup inkrementalak sortzeko balio du. Helmugako direktorioan honelako karpetak sortuko dira: "**2026-03-04**", "**2026-05-01**", ... eta horrela jakin ahal izango dugu fitxategiak nola zeuden data jakin batzuetan aldatu badira.
  - **[\-\-backup-dir="Old/\`date +%Y-%m-%d_%H:%M\`"]{.verbatim}**: Aurreko kasuaren antzekoa da, baina ordua ere gehitzen du, gure backup sistema minutu gutxiro exekutatzen bada: "**2026-03-04_16:34**", "**2026-04-01_00:04**", ...




## Beste parametroak {#opciones-extra}

Orain arte direktorioak sinkronizatzeko oinarrizko aukerak ikusi ditugu (bai lokalak bai urrunekoak), baina **rsync**-ek ezagutzea interesgarria den aukera gehigarri asko ditu:

-   **[\-z]{.verbatim}** edo **[\-\-compress]{.verbatim}** datuak bidali edo jaso aurretik konprimitzeko erabiltzen da. Urrunetik sinkronizazioa egingo badugu bakarrik da erabilgarria.

-   **[\-\-progress]{.verbatim}** fitxategien transferentzia nola doan ikusteko balio du (aurrerapena erakusten du).

-   **[\-\-delete]{.verbatim}** jatorrian existitzen ez diren fitxategiak helmugan ezabatzeko erabiltzen da. **Ez litzateke erabili behar [\-\-backup]{.verbatim} aukerarekin batera.**

-   **[\-\-exclude "\*txt"]{.verbatim}** sinkronizazioa egitean **"txt"** luzapena duten fitxategiak baztertzen ditu.


