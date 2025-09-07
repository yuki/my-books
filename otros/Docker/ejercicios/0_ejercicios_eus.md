
# Oinarrizko kontainerrak sortzea

Zehaztutako parametroekin ondorengo kontainerrak sortu:

- "nginx" kontainerra sortu, sistema eragileko 8098 portua erabiliz
  - Nabigatzailean 8098 portura sartu

- "httpd" kontainerra sortu, sistema eragileko 9876 portua erabiliz
  - Nabigatzailean 9876 portura sartu

- Deskargatutako irudiak zerrendatu

- Docker Desktop-en kontainerrak ikusi

- "mi-contenedor" izeneko kontainerra sortu, nginx irudiarekin, 98 portua erabiliz

- 8098 portuko nginx kontainerra gelditu
  - Kontainerra ezabatu

- 9876 portuko httpd kontainerra gelditu
  - Kontainerra ezabatu


# Datu-baseen kontainerrak

Ez sortu bolumenik. kontainer bakoitza sortu ondoren, konektatu MySQL Workbench erabiliz.

- MySQL kontainerra sortu, 3306 portuan entzuten duena, baina MYSQL 8.0.35 bertsioa izan behar du. kontainerraren izena "db8.0.35" izan behar da

- MySQL kontainerra sortu, sistema eragilean 3344 portuan entzuten duena, MySQL 8.0.0 bertsioarekin. kontainerraren izena "db8" izan behar da


# Bolumen iraunkorrak

Ondorengo kontainerrak sortu datu-bolumen iraunkorrekin:

- MySQL 8.0.30 kontainerra sortu Docker-en, bolumen iraunkor batekin zure ekipoan.

- 2 kontainer sortu **[webdevops/php-apache](https://hub.docker.com/r/webdevops/php-apache)** irudiarekin, 8.3 eta 7.2 bertsioekin. Kontuan hartu:
- "index.php" fitxategia duen direktorio bat sortu, PHPren "phpinfo()" funtzioaren informazioa erakutsiko duena
  - Direktorio hori kontainer barruko "/app" izan dadila, "irakurketa soilik" moduan bat eta bestea "irakurketa-idazketa" moduan.
- Ariketa errepikatu **[webdevops/php-nginx](https://hub.docker.com/r/webdevops/php-nginx)** irudiarekin


# Kontainerretan sartzen

Kontainer batean aldaketarik ez dira egin behar, bere bizitza-zikloa laburra izan daitekeelako, baina interesgarria da sartzea ikertzeko edo nola sortu den ikusteko (instalatutako softwarea, liburutegiak... sortutako ibilbideak...).

- Apache eta MySQL kontaineretan sartu:
 - Zein da bakoitzean lehenetsitako ibilbidea?


# Portainer: Docker ikusi/kudeatzeko kontainerra

Portainer zer den ikertu, nola instalatzen den eta zer behar dituen ikusi. Bilatu bai bere web ofiziala bai bere iturburu-kodearen errepoa.

Portainer erabiliz, altxatutako kontainerekin honako ekintzak egin:

- Kontainerretan sartzea kontsolaren bidez
- Estatistikak ikusi (CPU, sarearen erabilera...)
- Logak ikusi, kontainerrarenak (horrela ikus dezakegu barruan zer gertatzen den)


# MySQL eta PHPMyAdmin

- MySQL kontainerra sortu (3306 portuan entzun behar du)
- PHPMyAdmin kontainerra sortu, 7654 portuan entzun behar duena (kontainer barruan 80 portua da)
- PHPMyAdminetik MySQLera konektatu ("zerbitzari"an zerbitzariaren IP jarri).

