
# Zer da programatzea? {#programar}

Programatzea **ordenagailu bati jarraibideak ematea** da, hark zeregin bat bete dezan. Horretarako, eman nahi ditugun jarraibideak jasotzen dituen **kode iturria** idazten da. Horrek azken emaitza gisa aplikazio informatiko bat sortzen du (programa, webgunea, bideojokoa, ...).

Programatzea askotan sukaldaritza-errezeta bat sortzearen antzekotzat hartzen da, non egin beharreko urrats guztiak (programa) zehaztu behar diren, gero beste sukaldari batek (ordenagailuak) interpretatzeko. Jarraibideren bat behar bezala adierazten ez bada, azken errezeta (egindako programa) ez da funtzionatuko.

[[Exact Instructions Challenge](https://www.youtube.com/watch?v=FN2RM-CHkuI&ab_channel=JoshDarnit)]{.movie} adibide bat da konparazio horretatik.


::: infobox
Programatzea sukaldaritza-errezeta bat idaztea bezalakoa da: erabili beharreko urrats eta osagai guztiak deskribatu behar dira.
:::


## Zertarako balio du programatzeak? {#para-que-sirve-programar}

Programatzeak zereginak automatizatzeko, jokoak sortzeko, aplikazioak egiteko, robotak kontrolatzeko eta askoz gehiagorako balio du. Gaur egun erabiltzen dugun ia guztian badago programazioa barruan: mugikorrak, autoak, garbigailuak, webguneak, etab.

Egin nahi dugun aplikazioaren arabera, programazio-lengoaia bat edo bestea erabili beharko dugu.

# Programazio-lengoaiak {#lenguajes-programación}

Ordenagailuek ez dute gure hizkuntza zuzenean ulertzen. Haiekin hitz egiteko, **programazio-lengoaiak** erabiltzen ditugu, hau da, ordenagailuak ulertu eta exekutatu ditzakeen jarraibideak idazteko modu bereziak.

Hainbat hizkuntza daude, eta bakoitzak bere ezaugarriak ditu. Batzuk ikasteko errazagoak dira, beste batzuk azkarragoak edo indartsuagoak zeregin jakin batzuetarako. Programazio-lengoai ezagunen adibide batzuk:


- **Python**: oso erraza, hasteko aproposa. Zientzian, robotikan, adimen artifizialean... erabiltzen da.
- **C edo C++**: oso azkarra, bideojokoetan, sistema eragileetan, robotetan erabiltzen da.
- **Java**: enpresetan, mugikor-aplikazioetan (Android), sistema handietan oso erabilia.
- **JavaScript**: webgune interaktiboak egiteko erabiltzen da. Web-nabigatzailean exekutatzen da (Chrome edo Firefox bezalakoetan).
- **PHP**: webguneak sortzeko erabiltzen da.
- **Scratch edo Edublocks**: blokeekin programatzen da, oso bisuala eta erraza hasteko.


## Programazio-lengoaia baten osagaiak {#componentes-lenguaje-programación}

Eguneroko bizitzan erabiltzen ditugun hizkuntzek bezala, programazio-lengoaiak ere arauak dituzte. Hizkuntz naturalen arauak hain zuzen ere:

- **Alfabetoa**: Hizkuntzak erabiltzen dituen hitzak osatzeko sinboloen multzoa. Normalean letrak, digituak eta sinboloak dira (+, -, :, (), [], ...).
- **Lexikoa**: Hizkuntzak programatzeko gordeta dituen hitzak. Lexikoko hitz bat gaizki idazten bada, programa ezingo da konpilatu/ exekutatu.
  - if, else, for, while, ...
- **Sintaxia**: Hizkuntzak dituen arauak, hitz-kate batek esaldi balioduna osatzen duela ziurtatzeko. Hizkuntza naturalean honako desberdintasuna izango litzateke:
  - "Ni auto bat gidatzen dut"
  - "Autoa gidatzen dut ni"
- **Semantika**: Esaldiak zentzua duela zehazten du (ondo idatzita egon daiteke, baina zentzurik ez izan). Honako esaldi hauek dira adibideak hizkuntza naturalean:
  - "Ni auto bat gidatzen dut"
  - "Auto batek ni gidatzen nau"


## Lengoaia motak {#tipos-lenguajes-programación}

Ordenagailuak **makina-kodea** soilik ulertzen du (bateko eta hutseko kodea, kode binarioa). Horregatik, Python edo Java bezalako hizkuntzetan idatzitako programek **itzulpena** behar dute ordenagailuak exekutatu ahal izateko.

**Itzulpena nola egiten den** kontuan hartuta, hizkuntzak honela sailkatzen dira:


- **Interpretatutako** hizkuntzak
- **Konpilatutako** hizkuntzak
- **Hibridoak** diren hizkuntzak


::: exercisebox
Bilatu gutxienez 2 programazio-lengoaia mota bakoitzerako.
:::


Programazio-lengoaiak bereizteko beste irizpide asko daude. Bereizketa hauek sakonagoak dira, eta ez gara horietan sartuko, baina hurrengo taulan batzuk ikus daitezke.


| Bereizketa-irizpideak | Sailkapena |
|----------|------------|
| Abstrakzio-mailaren arabera | Maila baxuko hizkuntzak. Maila altuko hizkuntzak. |
| Programazio-paradigmaren arabera | Inperatiboak. Deklaratiboak. Objektuetara bideratuak. Funtzionalak. Logikoak. |
| Helburuaren arabera | Helburu orokorrekoak. Helburu espezifikokoak (adibidez, datu-baseetarako edo web-erako). |
| Sintaxiaren arabera | Sintaxi sinplekoak (Python bezala). Sintaxi zorrotzekoak (Java edo C++ bezala). | 
| Tipatzearen arabera | Estatikoa. Dinamikoa. Indartsua. Ahula. |
| Memoria-kudeaketaren arabera | Eskuzko kudeaketa dutenak (C bezala). Zabor-biltzailea dutenak (Java edo Python bezala). |
| Hardwareari edo sistemari orientazioaren arabera | Sistema-hizkuntzak. Aplikazio-hizkuntzak. |

Table: {tablename=yukitblr colspec=X[l]X[l]}


### Hizkuntza interpretatuak {#lenguajes-interpretados}

**Interpretatutako** hizkuntza batek **interpretatzaile** bat behar du; hau da, zure iturburu-kodea lerroz lerro irakurri eta zuzenean exekutatzen duen programa bat. Hizkuntza interpretatu ezagunen artean honako hauek ditugu:


- Python
- JavaScript
- Bash


Hizkuntza interpretatu batekin programatzeko urratsak hauek dira:


1. Kodea idazten duzu (adibidez, Python-en).
2. Interpretatzaileak irakurri eta pausoz pauso exekutatzen du.
3. Errore bat badago, momentu horretan gelditzen da.


Hizkuntzaren eta bere interpretatzailearen arabera, 2. eta 3. urratsak alda daitezke. Zenbait kasutan, interpretatzaileak iturburu-kode osoa irakurtzen du eta, idazkeran akatsen bat badago, ez du exekutatzen eta errorea erakusten du, inolako jarraibiderik exekutatu aurretik.

Iturburu-kodea beste ordenagailu batera eramaten baduzu eta interpretatzailea instalatuta ez badago, programa ez da exekutatuko.

| Abantailak | Desabantailak |
|------------|---------------|
| Probatzeko oso errazak dira. | Normalean **motelagoak** dira konpilatutakoak baino. |
| Ikasteko eta proba azkarrak egiteko aproposak. |  |

Table: {tablename=yukitblr colspec=X[l]X[l]}


### Hizkuntza konpilatuak {#lenguajes-compilados}

**Konpilatutako** hizkuntza batek **konpilatzaile** bat behar du; honek iturburu-kode osoa fitxategi exekutagarri batean bihurtzen du. Konpilazioaren emaitzak makina-kodea (bitarra) sortzen du, eta hori sistema eragileak eta CPUak zuzenean interpretatzen dute. Hizkuntza konpilatu ezagunen artean honako hauek daude:


- C
- C++
- Rust


Hizkuntza konpilatuekin programatzean, urrats sinplifikatuak hauek dira:


1. Kodea idazten duzu (adibidez, C++-en).
2. **Konpilatzen** duzu, eta horrek fitxategi exekutagarri bat sortzen du (adibidez, [programa.exe]{.verbatim}).
3. Fitxategi hori exekutatu daiteke, iturburu-koderik edo konpilatzailerik gabe.


Konpilatutako programak beste ordenagailu batera eraman daitezke eta zuzenean exekutatu (betiere arkitektura eta sistema eragilea berdinak badira). Batzuetan, mendekotasunak ere instalatu behar izaten dira (adibidez, jokoetan DirectX).

| Abantailak | Desabantailak |
|------------|---------------|
| Exekutatzean oso **azkarra**. | Zerbaitek aldatzen bada, berriro konpilatu behar da. |
| Programa handietarako edo errendimendua behar dutenetarako aproposa. | Programa handi bat konpilatzea denbora har dezake. |
| Erroreak konpilatzean agertzen dira. |  |

Table: {tablename=yukitblr colspec=X[l]X[l]}



### Hizkuntza hibridoak {#lenguajes-híbridos}

**Hibridoak** diren hizkuntzek bi munduen onena konbinatzen dute: lehenik, kodea **konpilatzen** dute formatu bitarteko batera, eta gero **interpretatu edo exekutatzen** dute makina birtual baten bidez. Hizkuntza hibridoen adibideak:


- Java (JVM erabiltzen du)
- C# (.NET erabiltzen du)
- Kotlin (batez ere Androiden erabiltzen da)


Hizkuntza hibrido batean programatzean, urratsak hauek dira:


1. Kodea idazten duzu (adibidez, Java-n).
2. Formatu bitarteko batera konpilatzen duzu (*bytecode* Java-n). Java-ren kasuan, **JDK** (Java Development Kit) erabiliz konpilatzen da.
3. Bytecode hori **makina birtual** batean exekutatzen da, adibidez JVM (Java Virtual Machine).


Kasu honetan, programa exekutatu nahi den ordenagailuan interpretea instalatuta egon behar da.

| Abantailak | Desabantailak |   
|------------|---------------|
| Abiadura ona. | Makina birtuala instalatuta egon behar du. |
| Portabilitatea: programa bera sistema desberdinetan funtzionatzen du. | Batzuetan, konfigurazioa pixka bat konplexuagoa izan daiteke. |

Table: {tablename=yukitblr colspec=X[l]X[l]}



# Pentsamendu logikoa eta arazoen ebazpena {#pensamiento-lógico}

Programa baten kode-iturria idatzi aurretik, garrantzitsua da **programatzaile baten moduan pentsatzen** ikastea. Programazioa ez da soilik jarraibideak idaztea, baizik eta **arazoak pausoz pauso konpontzea**.

Programatzea puzzle bat konpontzea bezalakoa da. Arazoa aztertu behar duzu, nola zati txikitan bana dezakezun pentsatu, eta zati bakoitza jarraibide argiekin ebatzi.


:::warnbox
Programatzen hasi aurretik, konpondu nahi dugun arazoa ulertu behar dugu eta nola konponduko dugun pentsatu.
:::


:::exercisebox
Idatzi diskotekako atezain izateko programa baten jarraibideak. Kontuan hartu behar duzu 18 urtetik gorakoak soilik sar daitezkeela. [Irtenbidea](#programa-discoteca).
:::


# Programatzean egiten diren akatsak {#errores-al-programar}

Programatzean, normala da gauzak lehenengo aldian ez funtzionatzea. Hiru akats mota oso ohikoak dira:

- **Sintaxi-akatsak**: Kodeak “ortografia-akats” bat du. Adibidez, parentesi bat ahaztea edo hitz gako bat gaizki idaztea.
- **Logika-akatsak**: Kodea exekutatzen da, baina **ez du zuk nahi zenuena egiten**. Adibidez, [>]{.verbatim} ikurra jartzea [<]{.verbatim} ordez. Akats hauek programa exekutatzean bakarrik ikus daitezke.
- **Exekuzio-akatsak**: Programa martxan dagoenean blokeatzen da. Programa “apurtzen” duen jarraibide bat idatzi da: zeroz zatitzea, balio “arraroak” dituen aldagai bat irakurtzea...

