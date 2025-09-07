
# Interfaze birakariak {#interfaces-rotatorios}

Ariketa honetan interfaze sinpleak sortzeko oinarrizko kontzeptuak ikasiko ditugu Android Studio IDEaren bidez eta bere berezitasunak ikusiko ditugu, **bai XML-en bai Jetpack Compose-rekin**. Horretarako, bi interfaze desberdin sortuko dira eta bakoitzak bere bertsio berezia izan beharko du **horizontal/landscape** moduan, osagaiak berrantolatuz.

Interfazeek honako hauek bete behar dituzte:

- Osagai berdinak izan behar dituzte modu bertikalean eta horizontalean
- Modu horizontala desberdina izan behar da modu bertikalarekiko, osagaiek espazio guztia aprobetxatu dezaten.
- Osagaiek **constraints** eta **kateak** erabili behar dituzte kokapen egokia izateko (ez da balio absoluturik egon behar posizioan) XML ikuspegian.
- Proiektuak API 31 gutxieneko SDKrako izan behar dira.


Ariketa honek **bi Android aplikazio** egitea eskatzen du, bi interfaze motarekin, eta dokumentu tekniko bat egitea, bakoitzaren berezitasunak deskribatuz.

**Android aplikazioak ez du funtzionalitate osoa izan behar, interfaze bakarrik (ez bada bestela adierazten).**


## Kalkulagailua {#calculadora}

Kalkulagailu aplikazio baten interfaze bat sortu, apunteetan agertzen denaren antzekoa. **Zenbakien botoiak funtzionalak izan behar dira** (sakutatzean erakusten den testua aldatu behar da), baina ez da beharrezkoa eragiketak egitea.

Compose aplikazioan botoiak ez daitezela estandarrak izan, baizik eta laukizuzenagoak, kalkulagailu erreal baten antzera. Eta koloreak ere aldatu (ez dute zertan apunteetako berdinak izan, baina zenbakien eta ekintzen artean desberdintasun bat egon dadila). **Erabili kodea berrerabiliz funtzioak erabiliz!**

*Landscape* ikuspegian, nahi duzuen moduan antola dezakezue ikuspegia.

**Gailua biratzean erakusten den testua mantendu behar da.**


## Musika aplikazioa {#musicapp}

Musika aplikazio bat simulatzen duen interfaze bat sortu behar da, eta bertan honako osagaiak agertu behar dira:

- Diskoaren irudia (probetarako gustuko duzuen disko baten irudia jar dezakezue)
- Abestiaren titulua erakusten duen testua
- Taldearen izena erakusten duen testua
- Denbora-barra irristakorra (abestiaren %25ean egon behar du) abestiak irauten duen denbora adierazteko (eta - zenbat denbora igaro den eta zenbat falta den erakusten duten testuekin)
- Botoiak (irudiak izan behar dira):
  - Aurreko abestia
  - Play/Pause (**botoi honek funtzionatu behar du eta bere egoera aldatu, erakutsiz/simulatuz abestia jotzen ari den edo ez**)
  - Hurrengo abestia
- Bolumen-barra irristakorra (bolumena %70ean egon behar du) eta alboan gutxienez ikono bat bolumena adierazteko.
- Botoiak (irudiak izan behar dira) honetarako:
  - Abestia partekatu
  - Abestiaren letra ikusi
  - Hurrengo abestien zerrenda ikusi

Gailua biratzean osagaiak modu egokian kokatu behar dira aplikazioa erabilgarria izaten jarraitzeko. Gomendagarria da:

- Pantaila %50ean banatzea:
  - Alde batean abestiaren irudia sartzea.
  - Beste aldean, gainerako botoiak/osagaiak


## Entrega

Dokumentu tekniko bat sortu behar da ([Nola egin dokumentazio ona](https://yuki.github.io/my-books/como_hacer_documentacion.html)), eta bertan atal derrigorrezkoez gain (azala, aurkibidea, sarrera, ondorioak/laburpena) honako hauek agertu behar dira:

- Android gailu emulatua sortu
  - Gailua \"Pixel 8 Pro\" izan behar da, API 31-rekin

- Kalkulagailua
  - Botoien kokapenerako aukeratutako diseinua zehaztu
    - Ikuspegi horizontaleko kokapenaren arrazoia
    - Diseinuaren eta XML blueprint-aren irudiak gehitu horizontalean eta bertikalean
    - Compose aurreikuspegiaren irudiak gehitu horizontalean eta bertikalean
  - Botoiei funtzionalitatea emateko kodea nola egin duzuen azaldu
  - Gailua biratzean ikuspegiaren egoera nola gordetzen den azaldu
  - Proiektuaren github/gitlab errepora esteka (ziurtatu errepoa publikoa dela). Aplikazio bakoitza adar desberdinean egon behar da.

- Musika aplikazioa
  - Aplikazioaren izena \"MusicApp\" izan behar da
  - Botoien kokapenerako aukeratutako diseinua zehaztu
    - Ikuspegi horizontaleko kokapenaren arrazoia
    - Diseinuaren eta blueprint-aren irudiak gehitu horizontalean eta bertikalean
    - Compose aurreikuspegiaren irudiak gehitu horizontalean eta bertikalean
  - Play/pause botoiari funtzionalitatea nola eman diozuen azaldu
  - Proiektuaren github/gitlab errepora esteka. Aplikazio bakoitza adar desberdinean egon behar da.

- Iritzia
  - Atal bat idatzi XML eta Jetpack Compose erabiliz interfaze berdina sortzearen arteko aldea adieraziz, eta zein iruditzen zaizun sinpleagoa, erosoagoa, errazago ulertzeko, errazago emaitza egiaztatzeko, funtzionalitatea...

