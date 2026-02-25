
# Diskoen klonazioa {#clonación-discos}

**Diskoen klonazioa** disko gogor baten edo partizio baten kopia zehatza egitea da, honako hauek barne:

- Partizioen egitura
- Sistema eragilea
- Instalatutako programak
- Konfigurazioak
- Fitxategiak eta datuak

Klonazioa honela egin daiteke:

- **Diskotik diskora (zuzeneko kopia)**:
  - Disko oso bat beste disko batera kopiatzen da.
  - Helburuko diskoak gutxienez jatorrizkoaren tamaina bera izan behar du.
  - Helburuko diskoa berehala erabiltzeko prest geratzen da.
  - Bi diskoak aldi berean konektatuta egotea beharrezkoa da.
  - Ez da tarteko fitxategirik sortzen.
  - Ekipamendu berean egin daiteke, diskoen barne-abiadura aprobetxatuz eta botila-leporik gabe, edo disko gogor batetik USB bidez konektatutako beste batera.

- **Diskotik irudi batera**:
  - Fitxategi bat sortzen da geroago erreztaurazio egin ahal izateko.
  - Fitxategi hori beste gailu batean gorde daiteke (USB, NAS, zerbitzaria).
  - Denboran zehar hainbat fitxategi sor daitezke, jatorrizko sistemaren bilakaera gordetzeko.


## Diskoen klonazioaren erabilera nagusiak {#usos-principales-clonación}

Klonazioa oso erabilia da etxeko zein enpresa-inguruneetan. Bere erabilera nagusiak hauek dira:

- Sistema oso bat azkar berreskuratzeko aukera ematen du hutsegite larriak gertatuz gero.
- Disko batetik bestera aldatzea:
  - Mota-aldaketagatik (HDDtik NVMe-ra).
  - Disko zaharra berriarekin ordezkatzea.
  - Biltegiratze-ahalmena handitzea (eta sistema berrinstalatzeko/konfiguratzeko denbora aurreztea).
- Enpresa-inguruneetan:
  - Ereduzko ekipo bat konfiguratzen da.
  - Ondoren, hainbat ordenagailutan klonatzen da.
  - Instalazio errepikakorretan denbora aurrezten da.

Klonazio-sistemek sistema oso baten segurtasun-kopia izaten lagun dezaketen arren, komeni da ez izatea sistema bakarra eta beste tresna batzuekin osatzea.

::: warnbox
Diskoen klonazio-sistemek segurtasun-kopia oso bat izaten lagun dezakete, baina ez luke sistema bakarra izan behar.
:::


# Klonazio-tresnak {#herramientas-clonación}

Diskoen klonazioa eta irudiak sortzeko tresna ugari daude. Ezagunen artean honako hauek nabarmendu ditzakegu:

- [Clonezilla](https://clonezilla.org/)
- [Partclone](https://partclone.org/)
- [dd](https://en.wikipedia.org/wiki/Dd_%28Unix%29)
- [Acronois True Image](https://es.wikipedia.org/wiki/Acronis_True_Image)

Beste asko ere badaude, batzuk ordainpekoak eta beste batzuk aukera gehiago dituztenak... baina dokumentu honetan Software Librea den Clonezillan zentratuko gara.


# Klonazio ondorengo urratsak {#pasos-post-clonación}

Sistema baten klonazioa egin ondoren, baliteke aldaketa batzuk egin behar izatea, klona egin den ekipo motaren arabera. Adibidez:

- **Ekipoaren izena aldatzea**: sare batean ez luke inoiz egon behar *hostname* bera duten bi ekipo, arazoak saihesteko.
- **IP helbidea aldatzea**: erabiltzaile-ekipo bat bada, normalean ez da estatikoa izango, baina egiaztatu egin behar da.
- **Erabiltzaileak sortzea / ekipoa domeinuan sartzea**: baliteke erabiltzaileak sortu behar izatea edo, Windows bada enpresa-sare batean, domeinuan sartu behar izatea.
  - Kasu honetan, aurretik [Sysprep](#sysprep---preparando-nuestro-sistema) exekutatu beharko da.


