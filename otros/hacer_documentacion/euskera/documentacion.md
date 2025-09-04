
# Sarrera {#introducción}

Gure lan-bizitzan proiektuak egingo ditugu, arazoei irtenbideak bilatzea helburu dutenak, eta horrek hainbat lan tekniko ekarriko ditu: ordenagailu-sare bat konfiguratzea, web-aplikazio bat aldatzea, mugikorretarako aplikazio bat sortzea, azpiegitura bat aztertzea eta hobekuntzak proposatzea\...

Proiektu horrekin batera, ohikoa da egindako proiektuaren dokumentazioa aurkeztea, non bezeroaren eskakizunen jasoketa, haien analisia, proiektua gauzatzerakoan hartutako erabakiak eta zergatiak, eta proiektua nola egin den azaldu behar diren.

Interneteko dokumentazioa irakurri badugu ere, ez gaude ohituta gure dokumentazioa sortzera, eta dokumentazio propioa egiten hasten garenean, lortzen dugun emaitza ez da normalean egokia izaten.

Horregatik, dokumentu honetan dokumentazio ona egiteko aholku eta jarraibide batzuk emango dira.


# Hizkuntza formala/teknikoa {#lenguaje-formaltécnico}

:::::::::::::: {.columns }
::: {.column width="68%"}
Nahiz eta agerikoa iruditu, dokumentazioetan ezin da hizkuntza kolokiala erabili, beraz **beti ikuspegi teknikotik idatzi behar dugu**.

**Hizkuntza formala erabili behar da** eta iritziak, pentsamenduak edo erabakiak aipatzen direnean **plural maiestatikoa erabili behar da**.

Horrela, idazten duen pertsonak bere iritzia ematea saihesten da, izan ere, proiektuaren atzean normalean profesional talde bat egoten da hartutako erabakiak babesten dituena, beste profesionalen iritzia kontuan hartu dela edo gainbegiratua izan dela.
:::
::: {.column width="28%" }
![](img/documentacion/debian.png){width="100%"}
:::
::::::::::::::


::: infobox
**Proiektu honetan egindako irtenbidea egokia dela uste dugu, zeren ...**
:::

Iritziak erabiltzen direnean edo "**beste batzuk baino hobeak**" diren ezarpenak adierazten direnean, beti erabaki horren justifikazioa azaldu behar da, egindako aukeraren arrazoia ulertu ahal izateko.  

::: errorbox
**Jakina, oso garrantzitsua da dokumentuak ez izatea ortografia-akatsik, esaldi amaigaberik, loturarik gabeko esaldirik, ...**
:::


# Dokumentuaren formatua {#formato-del-documento}

Hasieran erraza iruditu arren, dokumentuaren estiloa zailena izan daiteke, eta horregatik jarraitu behar ditugu hainbat aholku, jarraian azalduko direnak, nahiz eta ez diren bakarrak izango.


## Letra, saretak eta dokumentuaren doikuntzak {#letra-sangrías-y-ajustes-del-documento}

Gaur egun, testu-editore gehienek **WYSIWYG** (ingelesez "*What You See Is What You Get*", ikusten duzuna lortzen duzuna da), hala nola Microsoft Word, LibreOffice edo Google Docs, aukera lehenetsi batzuk dituzte, eta horrek dokumentuak bisualki erakargarri egiten ditu eta, printzipioz, ez dugu gauza asko aldatu behar.

Hala ere, hobespen hauek aldatzea erraza da eta dokumentua bisualki erakargarriagoa, pertsonalizatuagoa eta beste dokumentuetatik bereizteko aukera ematen du, irakurleak lehen inpresioa hobetuz.


::: infobox
**Enpresetan ohikoa da plantilla pertsonalizatuak sortzea, enpresaren logotipoarekin, korporazio-koloreekin, logotipoan erabiltzen diren letra-motekin, ...**
:::

Dokumentu honetan bertan ikus daitekeenez, lerroarteak eta paragrafoen arteko tarteak irakurketa errazten dute, beraz konfigurazio hori egokitu beharrekoa da.  

![](img/documentacion/libreoffice.png){width="70%"}

Testu-editore bakoitzak konfigurazio batzuk ditu alda daitezkeenak, beraz gomendagarria da denbora bat eskaintzea eskaintzen dituen konfigurazio desberdinak ulertzeko. Goiko irudian [Libreoffice](https://es.libreoffice.org/) programak eskaintzen duen konfigurazioa ikus daiteke.

**Garrantzitsua da doikuntzak estiloan bertan aldatzea**, ez izenburu edo paragrafo bakoitzean banaka. \"1. Izenburua\" guztiak berdeak eta tamaina 15 izatea nahi badugu, estilo hori editatu behar dugu. Gero urdinak eta beste letra-mota bat izatea nahi badugu, estiloa aldatzearekin automatikoki aldatuko dira izenburu guztiak, denbora galdu gabe banan-banan aldatzen.


::: errorbox
**Estiloen konfigurazioak aldatu behar ditugu, dokumentuko testu guztiei aplikatzeko. Ez paragrafoz paragrafo edo izenburuz izenburu joan**
:::

### Itxura orokorra {#aspecto-visual-general}

Dokumentu honetan ikus daitekeen bezala, ez da beharrezkoa apaingarri handirik dokumentua erakargarria eta irakurtzeko erraza izan dadin.

:::::::::::::: {.columns }
::: {.column width="25%"}
![](img/documentacion/debian.png){width="75%"}
:::
::: {.column width="70%" }
**Gure dokumentuekin begi kritikoa izan behar dugu** eta egindako lana ikusi ditugun beste dokumentuekin alderatu.

Gure dokumentuak eskatzen diren ezaugarriak ez baditu, edo guri erakargarria iruditzen ez bazaigu, **ez da arraroa pentsatzea dokumentua irakurriko duen irakasleari ere ez zaiola gustatuko**.  
:::
::::::::::::::

Itxura bisualak irakurlearen jarrera alda dezake, irakurketa atseginagoa eta errazagoa eginez. Eta alderantziz, irakurketari jarraitzeko gogorik ez izatea eta dokumentua ahalik eta azkarren amaitzea eragin dezake.

::: errorbox
**Dokumentuaren lehen inpresioak irakasleak zuzentzerakoan alde onetik edo txarretik predisposatu dezake.**
:::

## Goiburua, orri-oina eta orri-zenbakiak {#cabecera-pie-de-página-y-números-de-página}

Gomendagarria da orri-zenbakia gehitzea dokumentuan, horrela jakin dezakegu dokumentuaren zein zatitan gauden eta orri zehatz bati erreferentzia egin. Normalean orri-zenbakia orri-oinean agertzen da, dokumentu honetan egin den bezala.

Horrez gain, dokumentuaren izenburua, enpresaren izena edo erreferentzia orokor bat gehitu behar da orri-oinean edo goiburuan. Garrantzitsua da atal hauetan erabilitako letra-tamaina testu orokorra baino txikiagoa izatea eta nahikoa tarte egotea testuarekin nahastu ez dadin.

::: warnbox
**Goiburuan eta orri-oinean letra-tamaina txikiagoa izan behar da, testuarekin nahastu ez dadin.**e
:::

Berriro ere, gomendagarria da egindakoa kritikatzea, egindakoaren itxura orokorra egokia den eta irakurketa errazten duen egiaztatzea.

## Irudiak eta haien konposizioa {#imágenes-y-su-composición}

Irudiak gehitu behar diren dokumentuetan kontuan hartu behar da nola egingo den konposizioa, irudien tamaina eta non kokatuko diren.

### Tamaño y posicionamiento {#tamaño-y-posicionamiento}

Dependiendo de la imagen que queramos utilizar, podríamos ajustarla al centro, ocupando gran parte de la zona central del documento, como ya hemos visto más arriba, o como es el ejemplo que se muestra a continuación.

![](img/documentacion/debian.svg){width="70%"}

En este caso es el nombre de la distribución [Debian](https://www.debian.org/), pero anteriormente hemos visto una captura de pantalla de un programa. Las imágenes deben tener el tamaño adecuado para ver el contenido de las mismas.

### Explicación sobre las imágenes {#explicación-sobre-las-imágenes}

A lo largo de este documento se han añadido ciertas imágenes que se han puesto de distintos tamaños tanto a la izquierda como a la derecha de párrafos.

Estas imágenes han sido un mero ejemplo de cómo se pueden poner imágenes que acompañan al párrafo, **siempre dentro de los márgenes del documento y dejando espacio al texto**. Las imágenes no deben de estar pegadas al texto por ningún margen.

::: errorbox
**Toda imagen que sea añadida al documento debe llevar consigo una explicación.**
:::

En el caso de las imágenes que están situadas al lado de los párrafos, los párrafos harán referencia a las imágenes. En el caso de imágenes centradas, lo ideal es que antes antes de la misma se detalle a qué hace referencia.

Por ejemplo:

> En LibreOffice podemos modificar todos los estilos yendo al menú del párrafo yendo al menú "Estilos --\> Gestionar estilos", y desde ahí seleccionar el que nos interese modificar. Por ejemplo, el "**Cuerpo de texto**":

![](img/documentacion/libreoffice.png){width="70%"}

Tal como se puede ver, se ha realizado una pequeña introducción a lo que se quiere explicar para posteriormente añadir una imagen explicativa del resultado obtenido.

### Recorte de imágenes {#recorte-de-imágenes}

Cuando en una imagen queremos hacer referencia a algo en concreto, lo ideal es no poner la captura de pantalla del escritorio completo, sino sólo realizar la captura a la ventana de la que estamos hablando.

![](img/documentacion/recortes.png){width="40%"}


Para ello la aplicación "Herramienta de Recortes" de Windows permiten hacer un recorte perfecto de la ventana que seleccionemos, tal como se puede ver en la imagen anterior, seleccionando el modo. De esta manera obtendremos sólo la ventana que nos interesa, evitando hacer un mal recorte, y conseguiremos que **la atención se centre sobre lo que es realmente importante**.

Si queremos concretar algo dentro de una imagen, es recomendable bordear esa sección de un color (rojo, por ejemplo) para que sea más apreciable. En algunos casos también podría añadirse una pequeña flecha para mostrar la opción.

A la hora de tener capturas de pantalla de ciertas ventanas, o recortadas, puede ser conveniente añadir un pequeño borde, ya que en los escritorios actuales las ventanas hacen uso de fondo blanco y no se vería de manera correcta con el fondo blanco del documento.

A continuación se visualiza la misma imagen con y sin borde:


:::::::::::::: {.columns }
::: {.column width="47%"}
![](img/documentacion/captura.png){width="100%"}
:::
::: {.column width="47%" }
![](img/documentacion/captura.png){width="100%" framed=true}
:::
::::::::::::::

`\vspace{10pt}`{=latex}

Como se puede apreciar, la imagen que no tiene borde hace un efecto de "recorte brusco", mientras que con el borde se ve claramente que es una sección recortada.

::: infobox
**Es recomendable poner un borde a las capturas de ventanas**
:::

# Referencias {#referencias}

En todo documento pueden (y deben) existir referencias a otra documentación, o texto copiado y/o adquirido de varias fuentes, y en caso de ser así debe de ser referenciado.

> "Las referencias a otras obras son una parte muy importante en la literatura de muchas profesiones; cada una de ellas ha diseñado su propia manera de incluir esta información en el texto, y estas han dado lugar a formatos estandarizados de cita." (Fuente: [Wikipedia](https://es.wikipedia.org/wiki/Wikipedia:Referencias))

Tal como se puede ver en el párrafo anterior, el texto está entrecomillado, con una sangría superior y al final del mismo aparece la fuente de la información original y un enlace a la web de referencia. Existen distintas maneras de referenciar textos o citas de otros documentos, pero no entraremos en detalle sobre ello.

Por tanto, si a la hora de crear un documento hacemos referencia a otros textos, deberíamos indicarlo, y más cuando hacemos copia-pega del mismo. Hay que ser objetivos y dar a conocer al lector que lo que acaba de leer no es de elaboración propia y que por tanto se ha utilizado el texto de otro autor. De ahí que **hay que referenciar al autor original o la página web de donde se ha sacado la información**.

Otro ejemplo podría ser: tal como escribió [Isaac Newton](https://es.wikipedia.org/wiki/Isaac_Newton) a Hooke: "*Si he visto más lejos es porque estoy sentado sobre los hombros de gigantes.*", lo que viene a decir que hasta él mismo había basado sus estudios y había conseguido sus logros haciendo uso de las aportaciones de otros grandes científicos anteriores. Como se puede ver, la referencia está entre comillas también y en tipo de letra itálica.

# Releer el documento antes de entregar {#releer-el-documento-antes-de-entregar}

Un documento técnico no es algo que se realice en un día, por lo que pasa por varias etapas durante su escritura, y es por eso que antes de realizar la entrega se debe de repasar lo escrito.

Aunque pueda parecer obvio, este paso no se suele realizar porque quien realiza el documento suele pensar que cuando realizó la escritura ya lo hizo bien. Aún pudiendo ser cierto, una lectura posterior siempre va a sacar a relucir fallos e incongruencias de lo escrito.

En algunos casos puede que durante la escritura inicial se nos olvidase corregir faltas de ortografía, o la estructura del documento no se realizase de la mejor manera correcta, o incluso que se explique lo mismo en dos párrafos contiguos.

Es por eso que **todos los componentes que han realizado el proyecto deben de leer y aportar correcciones al mismo antes de realizar la entrega final** al cliente.

# Actualización del documento {#actualización-del-documento}

Un documento técnico suele ser un "ente vivo", que debe ser actualizado cuando los distintos servicios/componentes del proyecto sufran actualizaciones, modificaciones o simplemente se dejen de utilizar.

La documentación técnica debe reflejar fielmente el estado actual de la infraestructura/programa/web, ya que de nada sirve tener información anticuada que ya no refleja la realidad, y que puede ser incluso contraproducente.

Esta documentación servirá a nuevos integrantes de la compañía a conocer cuál es el estado de la infraestructura/programa/web, o también a una empresa externa nueva que vaya a realizar modificaciones sobre la misma.

