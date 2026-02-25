
# Sysprep - Gure sistema prestatzen {#sysprep---preparando-nuestro-sistema}

Windows instalatzean (bai Server bertsioan bai mahaigainekoan), segurtasun-identifikatzaile bat sortzen da (**SID**, *Security IDentifier*), baita PC horri berezko beste informazio espezifiko bat ere, gure azpiegituran bakarra izan behar duena.

Informazio hori ekipo bakoitzerako bakarra izan behar denez, **eragina du sistema-irudi bat sortu nahi dugunean, gure sare osoan instalazio masiboa egiteko oinarri gisa erabiliko badugu**.

Adibidez, klonatutako ekipo bat Active Directory batean sartzen saiatzen bagara, honako errorea agertuko zaigu:

::: center
![](img/temas_comunes/windows_server/sysprep_1.png){width="50%"}
:::

Horregatik, Microsoftek **Sysprep** aplikazioa txertatzen du; honek **informazio espezifiko hori ezabatzeaz arduratzen da**. Honako bidean aurkitzen da: "`%WINDIR%\system32\sysprep\sysprep.exe`", eta bai kontsolatik bai ingurune grafikotik exekutatu daiteke.


Sysprep-ek ematen dizkigun funtzio nagusiak honako hauek dira:

- Windows irudiaren PCari dagokion informazio espezifikoa ezabatzen du, SID-a barne. Horri esker, beste ekipo batzuetan aplika daitezkeen irudiak sor daitezke.  
- Ekipoaren driver espezifikoak desinstalatzen ditu (baina ez ditu ezabatzen).  
- PCa **OOBE** (*Out-of-Box Experience*) moduan abiarazteko prestatzen du. Sistema honek ekipoa instalazioa eginda uzten du, erabiltzaile batek lehen aldiz piztuko balu bezala.  
- "Desatenditutako" konfigurazioa ahalbidetzen du, konfigurazio-erantzunak dituen fitxategi bat gehituz.  

Exekutatzeko modurik errazena Windows arakatzailearen bidez dagokion bidera joatea eta klik bikoitza egitea da:

Ikus daitekeen bezala, **Sysprep**-ek hainbat aukera eskaintzen dizkigu exekuzioan hautatzeko:

- **Sistemaren garbiketa-ekintza**:
    - **OOBE konfigurazioa hastea**. Aurretik azaldua.  
    - **Sistemaren auditoria modua hastea**. Auditoria moduak OOBE saihesteko aukera ematen du, Administratzaile baimenekin sartzeko eta irudian konfigurazioak eta instalazioak egiteko. [Informazio gehiago](https://docs.microsoft.com/en-us/windows-hardware/manufacture/desktop/audit-mode-overview?view=windows-10)  
    - **Generalizatu**: Aukera honek ekipoari dagokion informazio espezifikoa ezabatzen du.


![](img/temas_comunes/windows_server/sysprep_2.png){width="35%"}

::: infobox
**Irudi bat sortu nahi badugu edo makina bat klonatu nahi badugu, generalizatu aukera erabili behar dugu.**
:::

- **Itzaltzeko aukerak**: Sysprep exekutatu ondoren zer egin.

