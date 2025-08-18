
# Docker irudiak sortzea {#crear-imagenes-docker}

[Aurretik](#imágenes-docker) aipatu bezala, Docker irudi bat exekutatu nahi dugun zerbitzua eta behar dituen mendekotasunak dituen fitxategi aldaezina da. Nahiz eta [hub.docker.com](https://hub.docker.com/) webgunean irudi ugari egon, noizbait interesgarria izan daiteke gure irudi propioa sortzea, zerbitzu propio bat barne hartzen duena.

Irudi bat sortzeko, **Dockerfile** izeneko fitxategi bat sortu behar dugu, eta bertan erabil ditzakegun aukerak [dokumentazio ofizialean](https://docs.docker.com/reference/dockerfile/) azaltzen dira.

Halaber, gomendagarria da [praktika onak erabiltzea](https://docs.docker.com/build/building/best-practices/) aipatzen den webgunea kontuan hartzea irudiak sortzerakoan.

##  Dockerfile-eko instrukzioak {#instrucciones-dockerfile}

Dockerfile fitxategian erabil daitezkeen instrukzioen kopurua mugatua da, eta [dokumentazioan](https://docs.docker.com/reference/dockerfile/) azaltzen dira. Azpimarratzekoak honako hauek dira:


- **ADD**: Irudiari fitxategi edo direktorio propioak gehitzeko balio du, zerbitzua abiaraztean eskuragarri egon daitezen. Adibidez, konfigurazio-fitxategiak edo gure aplikazioaren kodea. Interneteko URLak edo GIT errepositorioak ere erabili daitezke jatorri gisa.
- **CMD**: Eduki honek adierazten du zein komando exekutatuko den edukiontzia abiaraztean. Komando honek parametroak izan ditzake. **Irudia sortzean CMD bakarra egon daiteke**, eta gehiago jartzen badira, azkena erabiliko da.
- **COPY**: ADD-en antzekoa. [Konparazio orri batean](https://docs.docker.com/build/building/best-practices/#add-or-copy) azaltzen dira bien arteko aldeak.
- **ENTRYPOINT**: Edukiontzia exekutagarri gisa erabiliko denean erabiltzen da. Guk sortutako *script* bat izan daiteke. Dokumentazioan atal bat dago non [CMD eta ENTRYPOINT-en arteko interakzioa azaltzen den](https://docs.docker.com/reference/dockerfile/#understand-how-cmd-and-entrypoint-interact).
- **ENV**: Ingurune-aldagaiak ezartzeko balio du.
- **EXPOSE**: Irudia abiaraztean erabiliko diren portuak (eta protokoloa) Docker-i adierazten dizkio.
- **FROM**: Dockerfile bat baliozkoa izan dadin FROM direktiba batekin hasi behar du, erabiliko den oinarrizko irudia adierazteko. Normalean irudi ofizialak erabiltzen dira. Docker-ek [Alpine Linux](https://www.alpinelinux.org/) erabiltzea gomendatzen du, RAM kontsumo baxua duelako, besteak beste.
- **RUN**: Edozein komando exekutatzeko instrukzioa da, eta irudiari geruza berri bat gehitzen dio.
- **VOLUME**: Kanpoko bolumenak izan behar dituzten direktorioak erakusteko balio du (adibidez: datu-baseen biltegiratze direktorioak, konfigurazio direktorioak...).
- **WORKDIR**: Ondoren exekutatuko diren RUN, CMD, ENTRYPOINT, COPY eta ADD komandoentzat direktorioa ezartzen du.


Beste instrukzio batzuk ere badaude, baina hauek dira irudi propio bat sortzeko oinarrizkoenak.

# Dockerfile adibidea {#ejemplo-dockerfile}

Adibide gisa, gure ekipoan direktorio batean edukiko dugun **Dockerfile** fitxategi hau erabiliko dugu.

::: mycode
[Dockerfile fitxategia]{.title}

``` docker
FROM php:8.4-apache
COPY src/ /var/www/html/
```
:::

<!-- ## Crear imagen {#crear-imagen}

hay que añadir cosas... -->

