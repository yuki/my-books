
# Bezeroaren eskakizunen bilketa {#toma-requisitos-cliente}

Aplikazio baten programazioa hasi aurretik, argi izan behar dugu bezeroaren eskakizunak zeintzuk diren, proiektuaren irismena zein den eta zer espero den emaitzatik.

Eskakizun hauek normalean bezeroarekin egindako elkarrizketen bidez lortzen dira, ahalik eta informazio gehien jasotzeko, eta horrela aplikazioak izan behar dituen funtzionalitateak argi geratzeko.

Proiektuaren hasieran eskakizunen bat argitu gabe geratzen bada, erabaki txarrak hartzeko kate bat sor daiteke eta horrek azken emaitzan eragina izango du. Arazoa da, kasu batzuetan, erabaki txar horiek aplikazioaren *core*-an txerta daitezkeela eta etorkizunean mugatu dezaketela.

::: errorbox
Eskakizun bilketa txar batek aplikazioa gaizki garatzea eta etorkizunean mugatzea ekar dezake.
:::


## Eskakizunen lortzea {#obtencion-requisitos}

Aurrean esan bezala, eskakizunen lortzea proiektuaren hasieran egiten da, edozein programazio mota egin aurretik. Eskakizunak lortzeko ohiko moduak hauek dira:

- Bezeroarekin elkarrizketak.
- Aplikazioa erabiliko duten erabiltzaileekin elkarrizketak.
- Lan-metodologiaren egungo egoera ezagutu eta aztertzea (baldin badute). Proiektua amaitzean, metodologia hori egokitu beharko da.

Era berean, garrantzitsua da analistak eta proiektuaren arduradunak bezeroaren lekuan jartzea, galdera egokiak egiteko eta zer egin nahi den ulertzeko.


## Eskakizunen analisia {#analisis-requisitos}

Bezeroaren informazioa jaso ondoren, eskakizunen analisia egin behar da; horrela, zalantzak sor daitezke eta, kasu horretan, aurreko urratsera itzuli.

Eskakizun motak bereizteak bakoitzaren irismena ulertzen lagunduko digu, aplikazioaren atal desberdinak kudeatzeko.

Eskakizunak aztertzerakoan, normalean taula bat sortzen da, non honako hauek adierazten diren:

- **Eskakizun mota**.
- **Kategoria**, mota desberdinen artean bereizteko.
- **Lehentasuna**, lehentasunaren arabera ordenatzeko eta noiz landu behar diren jakiteko.
- **Mendekotasunak**, izan ere, eskakizun batzuk beste batzuen menpe egon daitezke. Beraz, eskakizuna egin aurretik, mendekotasunak amaitu behar dira.
- **Izenburua** eskakizuna laburbiltzen duen deskribapenarekin.
- **Eskakizunaren deskribapena**, beharrezkoa den informazio guztia eman behar da, gero garatu ahal izateko.
- **Arrazoia** eskakizunaren zergatia hobeto ulertzeko.

Eskakizunak idazterakoan, bakoitzarentzat taula bat sor dezakegu honako moduan:



```{=html}
<table data-tablename="requisito">
  <thead>
    <tr>
        <th>ID</th>
        <th>Mota</th>
        <th>Kategoria</th>
        <th>Lehentasuna</th>
        <th>Mendekotasunak</th>
    </tr>
    <tr>
        <th>1</th>
        <th>Funtzionala</th>
        <th>Transakzionala</th>
        <th>Oso altua</th>
        <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
        <td class="tg-7btt" colspan="5">Erabiltzaileen erregistroa</td>
    </tr>
    <tr>
        <td class="tg-0pky" colspan="5"><span style="font-weight:bold">Deskribapena:</span><br>Aplikazioak erabiltzailea erregistratzeko aukera emango du, honako datuak eskatuz:<br>
          <ul>
            <li>E-maila</li>
            <li>Pasahitza</li>
            <li>Izena eta abizenak (aukerakoa)</li>
            <li>Jaioteguna</li>
            <li>Generoa (aukerakoa)</li>
            <li>Herrialdea (aukerakoa)</li>
          </ul>
        </td>
    </tr>
    <tr>
        <td class="tg-0lax" colspan="5"><span style="font-weight:bold">Arrazoia:</span><br>Errezetak erregistratu ahal izateko erabiltzailea sisteman erregistratuta egon behar da.<br>Datu batzuk aukerakoak dira. Jaioteguna derrigorrezkoa da, erabiltzaileak adin nagusikoak izan behar dutelako.</td>
    </tr>
  </tbody>
</table>
```


```{=latex}
\begin{requisitostbl}{X[-1]X[1]X[1]X[1]X[1]}
    ID & Mota & Kategoria & Lehentasuna &  Mendekotasunak \\
    1  & Funtzionala & Transakzionala & Oso altua &    \\

    Erabiltzaileen erregistroa  \\

    \textbf{Deskribapena}:

    Plataformak erabiltzailea erregistratzeko aukera emango du, honako datuak eskatuz:

    \begin{multicols}{2}
        \begin{itemize}
            \item E-maila
            \item Pasahitza
            \item Izena eta abizenak (aukerakoa)
            \item Jaioteguna
            \item Generoa (aukerakoa)
            \item Herrialdea (aukerakoa)
        \end{itemize}
    \end{multicols}
    \\

    \textbf{Arrazoia}:

    Errezetak erregistratu ahal izateko erabiltzailea sisteman erregistratuta egon behar da.  Datu batzuk aukerakoak dira. Jaioteguna derrigorrezkoa da, erabiltzaileak adin nagusikoak izan behar dutelako.\\
\end{requisitostbl}

\vspace{10pt}
```

Kasu honetan, "Mendekotasunak" atalean ez da ezer gehitu, aplikazioaren lehen eskakizuna delako.


### Negozio-eskakizunak {#requisitos-negocio}

Negozio-eskakizunak teknikoenak ez direnak izaten dira, eta laburbilduz, **enpresak proiektua amaitzean zer lortu nahi duen** adierazten dute.

Adibide batzuk:

- Errezeta atari bat sortzea, erabiltzaileek beren errezetak igo, baloratu eta partekatu ahal izateko.
- Enpresaren produktuen kudeaketa hobetzeko aplikazio bat sortzea, inbentario digitala izateko eta agortu aurretik abisuak sortzeko.
- Eskalada gustuko duten pertsonentzako sare sozial bat sortzea, ibilbideak partekatzeko, zailtasunak baloratzeko eta eskalatzeko hitzorduak egiteko.

Ikus daitekeenez, ideia orokorra da, baina garapenean kontuan hartu beharreko beste eskakizun batzuk ere ematen dizkigu.


### Eskakizun funtzionalak {#requisitos-funcionales}

Eskakizun funtzionalak aplikazioak eskaini behar dituen zerbitzuen adierazpenak dira. Azken batean, sistemak egoera desberdinetan nola jokatuko duen definitzen dute.

Eskakizun funtzionalak honela bana daitezke:

- Eskakizun transakzionalak
- Datuen eskakizunak
- Interfaze edo aurkezpen eskakizunak
- Pertsonalizazio eskakizunak


#### Eskakizun transakzionalak {#requisitos-transaccionales}

Eskakizun transakzionalak aplikazioak izango dituen funtzionalitateak eta erabiltzaileak aplikazioan dauden datuekin egin ahal izango dituen zereginak dira.

Eskakizun eta funtzionalitate transakzional hauetan oinarrituta, beste eskakizun batzuk sortuko dira (adibidez, datuen eskakizunak eta interfaze-eskakizunak).

Eskakizun transakzional baten adibidea aurrekoa da, **erabiltzaileen erregistroa**, eta beste bat izan daiteke **erabiltzailearen login-a egitea**.



#### Datuen eskakizunak {#requisitos-datos}

Datuen eskakizunek, izenak dioen bezala, aplikazioak erabiliko dituen datuekin dute zerikusia. Garrantzitsua da ulertzea aurreko puntuetan ateratzen diren eskakizun funtzionalek aplikazioak erabiliko dituen datuak ere beharko dituztela.

Egin den analisia ulertu behar da, zein datu erabiliko diren jakiteko, eta ondoren datu-basearen Entitate-Erlazio eskema egiteko.

::: infobox
Datuen eskakizunetatik abiatuta, aplikazioaren datu-basea sor dezakegu.
:::

Adibideak:

- **Erabiltzailearen datuak**: Erabiltzailea erregistratzean zein datu eskatuko diren.
- **Edukiaren datuak**: Gure aplikazioa sukaldaritza-errezeten ingurukoa bada, errezeta berri bat gehitzean zein datu eskatuko diren (izena, osagaiak, zailtasuna, prestaketa-prozedura,...).


#### Interfaze/aurkezpen eskakizunak {#requisitos-interfaz}

Informazioa aurkeztean eta aplikazioa erabiltzean, erabiltzaileak sistemarekin elkarreragin behar du eta hori interfaze-elementu desberdinen bidez egiten da. Horregatik, beharrezkoa da interfaze-eskakizunak argi izatea, eta horietatik abiatuta nabigazio-mapa bat sortzea.

Adibideak:

- **Erabiltzailearen erregistroa**: Erabiltzailea erregistratzeko panela.
- **Erabiltzailearen login-a**: Login egiteko interfazea.
- **Erabiltzaile-interfazea**: Erabiltzailea saioa hasita dagoenean, bere panel nagusian zer erakutsiko zaion.


#### Pertsonalizazio-eskakizunak {#requisitos-personalizacion}

Eskakizun hauek aukerakoak izan daitezke, ez baitute aplikazio guztiek erabiltzaileentzako pertsonalizazio-sistemarik izango. Pertsonalizazioren bat egin badaiteke, atal honetan zehaztuko da.

Adibideak:

- Aplikazioaren hizkuntza aukeratu ahal izatea.
- Hizkuntza aldaketa automatikoki egitea.


### Ez-funtzionalak diren eskakizunak {#requisitos-no-funcionales}

Ez-funtzionalak diren eskakizunak ez dira sistemak eskaintzen dituen funtzio espezifikoetara zuzenean zuzentzen. Ez-funtzionalak diren eskakizun hauek ere hainbat ataletan bana daitezke, jarraian ikusiko dugun bezala.

::: infobox
Ez-funtzionalak diren eskakizunak normalean alderdi teknikoak izaten dira.
:::


#### Produktu-eskakizunak {#requisitos-producto}

Hauek dira produktuak izan behar duen portaera zehazten duten eskakizunak, eta eraginkortasunarekin, fidagarritasunarekin, erabilgarritasunarekin... lotuta egon daitezke. Normalean bezeroak ez ditu ezagutzen xehetasun teknikoak, eta, beraz, guk landu behar ditugu.

Kontuan izan behar da, kasu honetan, eskakizunak oso desberdinak izango direla egiten ari garen produktu/proiektu motaren arabera, ez baita berdina web-aplikazio bat edo mugikor-aplikazio bat.

Adibideak:

- Web-aplikazioa urteko 365 egunetan 24x7 erabilgarri egon behar da.
- Bertsio berriak hedatzea sistemaren bidez egingo da, akatsen bat izanez gero aldaketak atzera bota ahal izateko.
- Mugikor-aplikazioa barne-testetan probatuko da dagokion *store*-ra bidali aurretik.



#### Antolakuntza-eskakizunak {#requisitos-organizacionales}

Ez-funtzionalen artean, antolakuntza-eskakizunak ere bereiz daitezke, besteak beste:

- **Entrega-eskakizunak**: Aplikazioaren *sprint* desberdinak eta azken bertsioa noiz entregatu behar diren.
- **Inplementazio-eskakizunak**: Erabiliko den programazio-lengoaia, *framework* edo bertsioak, *debug* sistema, proiektuaren jarraipena nola egingo den, erabiliko den bertsio-kontrol sistema...
- **Estandarren erabilera**: Programazio-lengoaia konpilatua bada, zein konpilatzaile eta bertsio erabiliko diren. Aldagai-izenak sortzeko zein sistema erabiliko den ([camelCase](https://en.wikipedia.org/wiki/Camel_case), [snake_case](https://en.wikipedia.org/wiki/Snake_case), ...). Webean bada, HTML5+CSS3 erabilera...



### Sistemaren eskakizunak {#requisitos-sistema}

Amaitzeko, sistemaren eskakizunek proiektua non exekutatuko den adierazten dute, eta behar bezala funtzionatzeko bermatu behar ditugun baldintzak zeintzuk diren.

Berriz ere, aldeak egongo dira proiektua web-aplikazio bat edo mugikor-aplikazio bat den.

Adibideak:

- Aplikazioak Android sistema eragileetan funtzionatu beharko du, API 30 edo berriagoarekin.
- Mugikor-aplikazioak ez du inolako baimenik beharko erabiltzeko.
- Web-aplikazioa AWS-n hainbat konputazio-gunetan hedatuko da.


