
# Clonezilla {#clonezilla}

**[Clonezilla](https://clonezilla.org/)** **Software Librea** den tresna bat da, **disko eta partizioen klonazioa eta irudiak sortzea** helburu duena. GNU/Linuxen oinarrituta dago eta normalean sistema abiarazgarri batetik (USB) exekutatzen da, sisteman instalatu beharrik gabe.

Oso erabilia da honako eremu hauetan:

- Sistema-administrazioa
- Ikastetxeak
- Enpresak
- Informatika-laborategiak
- Zerbitzu teknikoak

Clonezillak barne-tresnak erabiltzen ditu erabilitako blokeak bakarrik kopiatzeko; horrek prozesua eraginkorragoa egiten du sektorez sektoreko kopia tradizional batekin alderatuta. Horri esker, printzipioz klonazioa azkarrago egiten da eta irudi bat sortuz gero, **jatorrizko disko gogorrak baino leku gutxiago okupatzen du**.

## Bertsioak {#versiones}

Clonezillak bi bertsio nagusi ditu:

- **Clonezilla Live**:
  - Ekipo bakarra klonatzeko diseinatuta dago.
  - USB edo CD/DVD bidez exekutatzen da.
  - Mantentze teknikorako aproposa da.
  - Irudiak sortu eta errestaurazio egiteko aukera ematen du.
  - Fitxategi-sistema ugari onartzen ditu.

- **Clonezilla Server Edition**:
  - Hainbat ekipo aldi berean klonatzeko aukera ematen du.
  - Multicast teknologia erabiltzen du.
  - Sare-azpiegitura behar du.
  - Enpresa edo hezkuntza-inguruneetarako pentsatuta dago.

Dokumentu honetan Live-*stable* bertsioan (3.3.1 bertsioa) zentratuko gara; deskarga daiteke bere [deskarga-orrian](https://clonezilla.org/downloads.php).


# Clonezillaren oinarrizko erabilera {#uso-básico}

Clonezillaren ISOa deskargatu ondoren, gomendagarriena da **Ventoy** duen USB bat erabiltzea ekipoa hortik abiarazteko. Horretarako, beharrezkoa izango da UEFI sisteman aldaketak egitea.

Abiaraztean honelako menu bat agertuko zaigu; hau, funtsean, Linuxen GRUB abio-menua da, aukera desberdinekin moldatua:

![](img/clonezilla/clonezilla-1.png){width=50% framed=true}

Lehenengo aukera hauta dezakegu, eta sistema eragilea kargatuko du (oinarrian [Debian](https://www.debian.org/) duena). Sistema honek martxan dagoen ekipoaren hardwarea detektatuko du. Sistemaren hizkuntza aukeratzeko eta teklatua aldatzeko aukera emango digu (lehenetsita ingelesez dago), eta ondoren honako menu hau erakutsiko digu:

![](img/clonezilla/clonezilla-2.png){width=50% framed=true}

Clonezilla lehenago erabili badugu edo komandoak ezagutzen baditugu, terminal batera (*Enter_shell*) sar gaitezke azkarrago lan egiteko. Bestela, ***Start_Clonezilla*** aukera hautatzen badugu, honako menu honetara eramango gaitu:

![](img/clonezilla/clonezilla-3.png){width=75% framed=true}

Menu honek lau aukera ditu, eta jarraian azalduko ditugu.


## Device-image {#device-image}

Aukera hau disko gogor oso baten edo haren partizio baten irudia sortzeko da, edo dagoeneko sortuta dugun irudi bat disko edo partizio batean errestauratzeko.

Erabili edo sortuko dugun irudia nonbait egon behar da; beraz, hainbat euskarri aukeratzeko aukera ematen digu:

- Konektatutako gailu bat (beste disko gogor bat edo USB bat)
- SSH zerbitzari bat
- Fitxategi-zerbitzari bat (Samba, NFS, WebDav)
- AWSko S3 *bucket* bat


## Device-device {#device-device}

Aukera honek disko edo partizio bat beste disko edo partizio batera klonatzeko aukera ematen du, betiere ekipo berean badaude. Oso garrantzitsua da argi izatea zein den datuen jatorrizko diskoa eta zein den helburuko diskoa (azken honek bere edukia guztiz ezabatuko du).

::: errorbox
Kontu handiz hautatu behar dira jatorrizko eta helburuko diskoa/partizioa. Nahasten bagara, datu guztiak galduko ditugu!
:::


## Remote-source {#remote-source}

Aukera honekin zerbitzari bat sortuko dugu, eta honek disko/partizio lokal bat klonatzeko aukera emango du. Ondoren, bezero bat konektatzeko zain geratuko da (hau izango da hautatutako edukia jasoko duen helburuko ekipoa).

![](img/clonezilla/remote-source-dest.svg){width=50%}

Aukera hau hautatzean, lehenik diskoa edo partizioa aukeratu beharko dugu, eta ondoren haren egoerari buruzko hainbat galdera egingo dizkigu.


## Remote-dest {#remote-dest}

Aukera hau hautatu behar da datuak idatzi nahi ditugun helburuko ekipoan. Jatorrizko zerbitzariaren IP helbidea eskatuko digu, eta partizio bat ala disko oso bat leheneratu nahi dugun galdetuko digu.


## Lite-server eta Lite-client {#lite}

Aukera hauek aurrekoen antzekoak dira, baina ekipoen klonazio masiboa egiteko erabiltzen dira. Sare isolatu batean bagaude, **Clonezilla lite-server** gai da bere DHCP eta PXE zerbitzaria zabaltzeko, bezeroak automatikoki autokonfigura daitezen eta klonazio-prozesua automatikoki has dezaten.


