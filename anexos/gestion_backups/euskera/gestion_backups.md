
# Babeskopien kudeaketa (backups) {#gestion_copias_de_seguridad}

## Sarrera {#introducción-backups}

Babeskopia bat, edo ***backup*** bat, **jatorrizko datuen kopia bat** da, **datuak galtzen badira berreskuratu ahal izateko** egiten dena. Babeskopiak erabilgarriak dira jatorrizko datuak galdu badira giza akats baten ondorioz, sistemaren hutsegite baten ondorioz (disko gogorra apurtzea), birus batek aldatu baditu, gertaera natural baten ondorioz (eraikinaren sutea), eraso baten ondorioz (datuak nahita ezabatzea), etab.

Babeskopia-prozesuan **datuak leheneratzeko metodoa ere kontuan hartu behar da**. Hau da, *backup*eko datuak jatorrizko kokapenera berreskuratzeko egin behar ditugun pausoak.

Babeskopia-sistema bat pentsatzerakoan, honako puntu hauek kontuan hartu behar ditugu:

-   Datuen garrantzia

-   Babeskopiak hartzen duen espazioa

-   Babeskopiaren kokapena

-   Hondamendien aurkako berreskuratze-plana

-   Berreskura dezakegun gehieneko puntua

-   Datuak berreskuratzeko aurreikusitako denbora


Bestalde, kontuan hartu beharko dugu **babeskopia egiteko erabiliko dugun metodoa** eta prozesua nolakoa izango den. Prozesu hori babeskopia egingo diogun zerbitzuaren edo sistemaren araberakoa izango da.

Eta azkenik, erabiliko dugun estrategia:

-   Multi-babeskopia osoa estrategia

-   Inkrementalak eta/edo diferentzialak

-   Estrategia pertsonalizatua

-   Erabiliko dugun programak ahalbidetzen duena

-   ...

Datuen babeskopia egin aurretik, hainbat atal kontuan hartu behar ditugu. Atal horiek xehetasunez aztertu beharko dira eta baliteke etorkizunean aldatu behar izatea.

## Kontuan hartu beharrekoa {#a-tener-en-cuenta}

Babeskopiak sortzeko **plangintza** egitean, hainbat alderdi kontuan hartu behar dira babeskopien kudeaketa modu egokian egin dadin.

Plangintza hau egiteko, enpresak maneiatzen dituen datuak ezagutu behar dira: datuen garrantzia, hartzen duten bolumena, jasotzen duten aldaketen kopurua, ...

:::infobox
Enpresa bateko babeskopien kudeaketa ondo planifikatzeko, baliteke barneko arlo desberdinetako hainbat pertsonaren parte-hartzea behar izatea.
:::


### Datuak eta haien garrantzia ezagutzea {#conocer-los-datos-y-la-importancia-de-los-mismos}

Babeskopiak zein daturen gainean egin behar ditugun jakiteko, enpresan erabiltzen diren datuak ezagutu behar ditugu: haien garrantzia eta kokapena. **Adibidea**: ez da gauza bera bezeroen datu-basean kudeatzen diren datuen garrantzia edo erabiltzaile baten PCko "Deskargak" direktorioarena.

Era berean, datu horien egungo tamaina ere ezagutu behar dugu, eta guztira zenbateko bolumena hartzen duten jakin. Zenbat eta handiagoa izan datuen tamaina, orduan eta handiagoa izango da babeskopiek hartuko duten espazioa.

Kontuan hartu beharreko beste alderdi bat da datu horiek jasaten dituzten aldaketak ezagutzea eta aldaketa horien bolumena estimatzea. **Adibidea**: ez da gauza bera datu-base batek egunean 10 bezero berri jasotzea edo gure online dendak orduko 15.000 salmenta jasotzea.

::: infobox
**Gure enpresan dauden datuak, haien kokapena, garrantzia eta bolumena ezagutu behar ditugu babeskopien kudeaketa-plan on bat egin ahal izateko.**
:::

### Babeskopiak hartzen duen espazioa {#espacio-ocupado-por-la-copia-de-seguridad}

Babeskopia batek hartuko duen espazioa estimatzea erraza dirudi, baina ez da beti horrela; horregatik, lehen esan dugun bezala, datuak ezagutzea funtsezkoa da.

Kontuan hartu beharko dugu jatorrizko datuek zenbat okupatzen duten, zein backup estrategia erabiliko dugun eta jatorrizko datuetan egon daitekeen espazio-gehikuntza estimatu behar dugu.

Beraz, komeni da beti espazioa gorantz kalkulatzea, eta ahal dela espazio hori **“beroan” handitzeko aukera** izatea, babeskopiek egunero behar bezala funtziona dezaten.

::: errorbox
**Espazio faltagatik babeskopiak ez egitea lehen mailako akats gisa hartu behar da, eta ahalik eta azkarren konpondu behar da.**
:::


### Berreskuratu nahi dugun gutxieneko denbora-puntua {#punto-mínimo-en-el-tiempo-que-queremos-recuperar}

Posible da datuetan aldaketak egiten diren une berean eguneratzen diren babeskopiak izatea, baina sistema horiek martxan jartzea agian ez dago gure eskura (nola egiten diren ez dakigulako edo kostu handia dutelako).

Zenbait kasutan, enpresa batzuek datu batzuk galtzea onar dezakete, izan ere, kopiak **“denbora errealean”** egitea garestiagoa izan daiteke datu horiek berriro sortzea baino.

**Adibidea**: Enpresa batek agian ez du behar langileen fitxaketa-orduak gordetzen dituen datu-basearen babeskopia denbora errealean egitea; egun bateko datuak galtzea onargarria izan daiteke (babeskopia gauero egiten bada). Aldiz, marketinaren datu-basea denbora errealean babestu behar da.

### Berreskuratu nahi dugun gehieneko denbora-puntua {#punto-máximo-en-el-tiempo-que-queremos-recuperar}

Kontuan hartu beharreko beste alderdi garrantzitsu bat da **datuak leheneratzeko zenbat denbora atzera joan nahi dugun pentsatzea**. Ez da gauza bera duela ordubeteko datuak leheneratu nahi izatea, duela egun batekoak, aste batekoak edo urte batekoak; erabaki horrek eragina izango du babeskopia-estrategia osoan.

Horregatik, datuei merezi duten garrantzia eman behar zaie, eta oso litekeena da datu mota desberdinek **gehieneko leheneratze-puntu desberdinak** izatea.

**Adibidea**: Ez da gauza bera enpresa baten fakturazio-datuak (legeak agintzen du datu horiek gordetzea, adibidez 4 urtez), ia aldatzen ez den webgune baten datuak (astean behin egindako kopia batekin nahikoa izan daiteke) edo erabiltzaile baten karpeta pertsonala bere ekipoan (bere ekipoan enpresarentzat garrantzitsua den ezer gorde behar ez duenez, datu-galera bat onargarria izan liteke).


### Babeskopiaren kokapena {#ubicación-de-la-copia-de-seguridad}

Oso garrantzitsua da babeskopiaren kokapena zein izango den eta horrek izan ditzakeen ondorioak kontuan hartzea. Ikus ditzagun hainbat adibide:

-   Babeskopia ekipo informatiko berean egitea erabakitzen badugu, elektrizitate-arazo batek jatorrizko datuak eta babeskopiak galtzea ekar dezake.

-   Babeskopia jatorrizko datuak dauden ordenagailu-gela berean egiten badugu, gela horrek suntsitzen duen faktore baten eraginpean badago (sutea, lapurreta, ...), datu guztiak galduko genituzke.

-   Babeskopia bulego edo eraikin berean egitea erabakitzen badugu, aurreko puntuan bezala gerta daiteke.

-   Babeskopia "hodeian" egitea erabakitzen badugu, babeskopia egiteko denbora eta datuak leheneratzeko denbora handitu daitezke.

-   Babeskopia beste bulego batean egitea erabakitzen badugu, konexioaren menpe egongo gara; datuak zifratuta bidali beharko lirateke, eta babeskopia sortzeko eta leheneratzeko denborak ere kontuan hartu behar dira.

Ikus daitekeen bezala, aukera bakoitzak bere abantailak eta desabantailak ditu.

::: errorbox
**Babeskopia ez da inoiz egon behar jatorrizko datuak dauden ekipo informatiko berean, eta are gutxiago disko gogor fisiko berean.**
:::


### Babeskopia egiteko aurreikusitako denbora {#tiempo-estimado-de-la-copia}

Aurretik azaldutakoa kontuan hartuta, babeskopia egiteko behar den denbora oso garrantzitsua da, eta denborarekin alda daiteke. Ez da gauza bera megabyte gutxi batzuk edo hainbat gigabyte babestea.

Horregatik, gure babeskopiek zenbat denbora behar duten kontuan hartu behar dugu, behar bezala egiten direla ziurtatzeko eta denboran gainjarri ez daitezen.

### Hondamendien aurkako berreskuratze-plana {#plan-de-recuperación-ante-desastre}

Babeskopia bat izatea bezain garrantzitsua da balizko hondamendi baten aurrean plan bat izatea. Ez du zentzurik babeskopia bat izateak, baldin eta hura leheneratzeko asteak behar baditugu, kopien egoera ez dakigulako edo leheneratzea oso konplexua bada.

Beraz, **oso garrantzitsua da hondamendien aurkako berreskuratze-plan eguneratu bat izatea**, babeskopien kudeaketan aldaketarik egon den kontuan hartuko duena, egin beharreko urratsak jasoko dituena, etab.

Berreskuratze-plan hori **noizean behin praktikan jarri beharko litzateke, oraindik baliagarria dela egiaztatzeko**, eta hala ez bada, behar diren aldaketak egiteko.

::: warnbox
**Oso garrantzitsua da hondamendien aurkako berreskuratze-plan eguneratua izatea eta noizean behin probatzea oraindik baliagarria dela ziurtatzeko.**
:::


Hondamendien aurkako berreskuratze-planak, gutxienez, honako hauek jaso beharko lituzke:


-   Enpresan dauden babeskopien metodo eta estrategia desberdinak  
-   Babeskopiak egiten diren kokapenak  
-   Babeskopia egiten zaien datuen garrantzia  
-   Babeskopia egin zaien sistema bakoitza nola leheneratu  
-   Leheneraketak egiteko ordena eta, datuen garrantziaren arabera, lehentasunak  


::: infobox
Berreskuratze-plana enpresa orok izan behar duen elementua da babeskopia-sistemak sortzerakoan, biak elkarren osagarri direlako.
:::

### Datuak berreskuratzeko aurreikusitako denbora {#tiempo-estimado-de-recuperación-de-los-datos}

Azken puntua, baina ez horregatik gutxiago garrantzitsua, datuak berreskuratzeko aurreikusitako denbora da.

::: errorbox
**Ez du balio handirik babeskopiak eta berreskuratze-plan bat izateak, baldin eta datuak berreskuratzeko bi aste behar badira.**
:::

Horregatik, datuak berreskuratzeko aurreikusitako denbora ezagutu behar dugu, langileekin, bezeroekin eta bestelakoekin denborak kudeatu ahal izateko.

Denbora hori, babeskopien tamaina bezala, aldatu egin daiteke denborarekin; beraz, **noizean behin simulazioak egitea komeni da benetako berreskuratze-denborak zein diren egiaztatzeko**.


![](img/anexos/gestion_backups/incidente_seguridad.png){width="60%"}


Aurreko grafikoa kontuan hartuta:

**RTO**:
:   berreskuratze-denboraren helburua da (*Recovery Time Objective*), eta zerbitzua berriro martxan jartzeko behar den denbora da, edo gutxienez adostutako gutxieneko zerbitzua berrezartzeko behar dena. Zenbat eta txikiagoa izan berreskuratze-denbora, orduan eta hobe.

**RPO**:
:   berreskuratze-puntuaren helburua da (*Recovery Point Objective*), eta sistemak gorabehera gertatu aurreko zein denbora-puntura arte itzul daitezkeen adierazten du. Normalean babeskopiak egiten diren maiztasunak markatzen du. Berriz ere, zenbat eta T=0 puntutik gertuago egon, orduan eta hobe.

## Backup metodoak {#métodos-de-backup}

Backup bat sortzeko hainbat estrategia daude; beraz, babestu nahi ditugun datuak aztertu eta estrategia egokiena aukeratu behar dugu.

### Fitxategiak kopiatzea {#copiar-los-ficheros}

Metodo sinpleena izango litzateke. Datu garrantzitsuen kopia bat egingo dugu beste kokapen edo euskarri batean. Sistema honekin, denbora-tarte jakin bakoitzean fitxategiak gordetzen dira eta datuen kopia oso bat lortzen dugu.

Arazoa da **ez dugula aukera izango fitxategi bat azken kopia baino lehenagoko egoerara berreskuratzeko**. Hau da, babeskopia goizeko 6:00etan egiten bada, ezin izango dugu fitxategiaren aurreko egoera lortu. Erabiltzaileak 11:00etan fitxategia hondatzen badu, 6:00etako egoerara itzul gaitezke, baina ez atzoko egoerara.

### Bloke-mailako sistema inkrementala {#sistema-incremental-a-nivel-de-bloque}

Aldatu diren bloke fisikoak bakarrik kopiatzean oinarritzen da. Jatorrizko fitxategia alde batetik gordeta eduki beharko dugu, eta hortik aurrera aldaketak bakarrik gordeko ditugu modu inkrementalean.

Fitxategia berreskuratzeko, lehenik jatorrizko fitxategi osoa leheneratu beharko dugu, eta ondoren bloke inkrementalak aplikatu interesatzen zaigun berreskuratze-puntura iritsi arte.

### Sistema inkremental edo diferentzial bitarra {#sistema-incremental-o-diferencial-binaria}

Aurrekoaren antzekoa da, baina oraingoan blokeak (1K, 4K, 8K...) erabili beharrean, zati inkrementala edo diferentziala maila bitarrean egiten da.

### Fitxategien bertsioak {#versionado-de-ficheros}

Fitxategien bertsionatzea hainbat modutan egin daiteke:

-   **Fitxategi-sistema erabiliz**: badira fitxategi-sistemak fitxategi bat aldatzen denean automatikoki bertsio berri bat sortzen dutenak.

-   **Eskuzko bertsionatzea**: erabiltzaileak fitxategiaren bertsio berri bat sortu nahi duenean, eskuz ekintza bat egin behar du bertsio berria gordetzeko.


## Backup estrategiak {#estrategias-de-backup}

Babeskopia bat egiteko estrategia asko daude; agian ia ingurune adina estrategia daude, estrategia orokorrak erabil daitezkeelako edo kasu bakoitzerako bereziak sortu daitezkeelako. Ohikoenak azalduko ditugu.

### Babeskopia oso anitzak {#multi-backup-completos}

Metodo hau sinpleena litzateke, baina baita espazio gehien hartuko lukeena ere, eta ziurrenik denbora gehien beharko lukeena, kopiatu beharreko datuen arabera.

Metodo honetan, gorde nahi ditugun datuen kopia osoa egin genezake nahi dugun adina kokapenetan. Demagun fitxategi hondatu batetik 3 egun atzera berreskuratzeko aukera izan nahi dugula; horrek esan nahi du 3 kokapen desberdin izan beharko genituzkeela, eta egunero datuen babeskopia oso bat egingo genukeela. Adibidez:

-   **1. kokapena**: **astelehenean** lehen babeskopia osoa egingo genuke  

-   **2. kokapena**: **asteartean** bigarren babeskopia osoa egingo genuke  

-   **3. kokapena**: **asteazkenean** hirugarren babeskopia osoa egingo genuke  

-   **1. kokapena**: **ostegunean** babeskopia osoa egingo genuke (asteleheneko datuak gainidatziz)

-   ...

Ikus daitekeenez, estrategia ziklikoa eta sinplea da, eta zenbait kasutan nahikoa izan daiteke. Hala ere, lehen aipatu bezala, egunero babeskopia oso bat egingo da; beraz, kontuan hartu behar dira behar den denbora, hartzen duen espazioa, ...

### Inkrementalak eta/edo diferentzialak {#incrementales-yo-diferenciales}

Normalean metodo ohikoena da, eta programa gehienek aukera hauek eskaintzen dituzte babeskopiak egiteko.

Babeskopia inkrementalak eta/edo diferentzialak erabiltzeak datuak puntu zehatz bateraino leheneratzeko aukera ematen du. Horregatik oso garrantzitsua da zenbat denborara arte berreskuratu nahi dugun kontuan hartzea; izan ere, ez da gauza bera astebete, hilabete bat edo urtebete atzera leheneratu nahi izatea, espazioaren kalkuluan eragin zuzena duelako.

Beraz, metodologia hau erabiltzean —ohikoena dena— espazioaren estimazioa nahiko zabala izan behar da, eta etorkizunean espazioaren hazkundea kontuan hartu behar da.

#### Inkrementalak {#incrementales}

Demagun igandean datuen babeskopia oso bat egiten dugula; hori izango da ondorengo babeskopia inkrementalen oinarria:


![](img/anexos/gestion_backups/incremental.png){width="70%"}


Astelehenean kopia bat egingo da, igandeko kopiarekin alderatuta aldatu diren datuak bakarrik gordez. Asteartean, asteleheneko kopiatik aldatu diren datuen kopia egingo da... Eta horrela jarraituko da.

Metodo hau azkarra eta erraza da egiteko, eta argi dakigu noiz aldatu diren datuak; beraz, inkremental bakoitza karpeta desberdinetan gordeta badugu, berreskuratzea ere erraza izango da.

#### Diferentziala {#diferencial}

Inkrementalaren antzekoa da, baina egunero gordetzen dira azken backup osoa egin zenetik aldatu diren datu guztiak:

![](img/anexos/gestion_backups/diferencial.png){width="70%"}

Horrek egiten du backup diferentzial bakoitzak inkremental batek baino leku gehiago har dezakeela, baina egunero azken backup osotik izandako aldaketa guztiak lortuko ditugu.

#### Inkrementala eta diferentziala {#incremental-y-diferencial}

Ohikoa izaten da bi estrategien konbinazioa egitea:

-   Hileko lehen igandean kopia osoa egitea.

-   Astelehenetik larunbatera metodo inkrementala erabiltzea.

-   Igandeetan aste osoko diferentzial bat egitea.

### Estrategia pertsonalizatua {#estrategia-personalizada}

Aurretik aipatu den bezala, ingurune adina estrategia egon daitezke. Horregatik, gure datuen, gure ingurune teknologikoaren eta gure negozio-ereduaren arabera, estrategia propio bat sortu beharko dugu.

Metodo hau konplexuena izan daiteke, agian eskuz egin behar izango dugulako; hala ere, horrela bermatuko dugu backup egin behar ditugun datuen atal bakoitzari dagokion garrantzia emango diogula.

### Programak uzten diguna {#la-que-el-programa-nos-marque}

Backupak kudeatzeko programa bat erabiltzen badugu, azkenean programak eskaintzen dituen aukeretara mugatuta egongo gara. Aipatu den bezala, inkremental/diferentzial estrategia da gehien erabiltzen dena; beraz, programa gehienek aukera hori izan beharko lukete.

Programaren arabera, aukera hauek izan ditzakegu: estrategien konbinazioak egitea, kopiak urruneko sistemetara bidaltzea (hodeira, FTP bidez, SSH bidez...), egunean hainbat kopia egitea... Horregatik, gure esku geratzen da programa desberdinak aztertzea eta gure beharretara hobekien egokitzen dena aukeratzea.

## 3-2-1 araua {#regla-3-2-1}

Aurretik esandako guztia kontuan hartuta, gehien erabiltzen den estrategietako bat, modu orokor eta sinplifikatuan, **"3-2-1 araua"** da.

Arau hau honela laburbiltzen da:

-   Datuen **3 kopia oso** izatea.

-   **2 biltegiratze mota desberdinetan** gordeta egotea.

-   **Kopietako 1 kanpoan** egotea.

Irudika dezagun online denda baten datu-base bat dugula, gure hornitzaile batek kudeatzen duen RACK bateko zerbitzari batean kokatuta, gure beste zerbitzariekin batera. Datu-base horretan **jatorrizko datuak** ditugu.

RACK bereko beste zerbitzari bat erabiliko dugu, eta bertan segurtasun kopia oso bat egingo dugu. Hau izango da **bigarren kopia osoa**, beste zerbitzari batean dagoena eta azkar eskuratu ahal izango duguna.

Datuen **hirugarren kopia** gure bulegoan izango dugu, datuen urruneko kopia bat egingo baitugu. Hirugarren kopia hau hornitzailearen azpiegituratik kanpo egongo da; beraz, CPD horretan sute bat gertatuko balitz, kopia bat izango genuke lokaleko azpiegituran.

## Datuen berreskurapenaren simulakroak egitea {#datuen-berreskurapenaren-simulakroak-egitea}

**Orain arte azaldu dugunak ez du ezertarako balio hondamendi-simulakroak** eta datuen berreskurapenaren probak egiten ez badira, dena behar bezala funtzionatzen duela ziurtatzeko. Zoritxarrez, **backup sistemen barruan ere akatsak egon daitezke**; beraz, nahiz eta uste izan kopiak ondo egiten ari direla, agian behar ditugun egunean konturatzen gara ez dela horrela, eta ondorioz ezin izango genuke datuen berreskurapena egin.

::: errorbox
**Hondamendi-simulakroak sortu beharko genituzke gure segurtasun-kopien sistemaren kateko elementu guztiak ondo funtzionatzen dutela ziurtatzeko.**
:::

Simulakro hauek honako hauek ziurtatzen lagundu beharko ligukete:

-   Segurtasun-kopiek behar bezala funtzionatzen dutela

-   Interesatzen zaigun datara arteko datuen berreskurapena egin dezakegula

-   Hondamendien aurkako berreskurapen-plana eguneratuta eta funtzionala dagoela

-   Aurreikusitako berreskurapen-denbora egokia dela  
    datuak berreskuratu ondoren, gure sistema funtzionala dela eta jarduera komertzialarekin jarrai dezakegula

::: warnbox
**Aurreko puntuetako batek huts egiten badu edo zuzena ez bada, segurtasun-kopien plan estrategiko osoa berrikusi beharko dugu akatsak konpontzeko; ondoren, simulakro berri bat egin beharko dugu oraingoan dena zuzena dela baieztatzeko.**
:::

`\clearpage`{=latex}

