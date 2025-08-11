
# Sarrera {#odoo-introducción}

[Odoo](https://es.wikipedia.org/wiki/Odoo), lehen *OpenERP* izenez ezaguna, enpresa-baliabideen plangintzarako softwarea da, lizentzia bikoitzarekin. Bertsio irekia eta beste bat lizentzia komertzialarekin dago, ezaugarri eta zerbitzu esklusiboekin.

Odook CRM atala ere badu (ingelesez *customer relationship management*, edo bezeroekin harremanak kudeatzeko sistema), baita webgune komertzial bat, fakturazioa, \...

# Instalazioa {#instalación}

Aurreko gaian ikusi dugun bezala, sistema bat instalatzeko hainbat modu daude, eta proiektuaren beharretara egokitu behar dugu instalazioa.

Gure kasuan, Docker zerbitzuen bidez instalatzea aukeratuko dugu, horrela hainbat bertsio probatu ahal izango ditugu (bai Odoo bai datu-basearena).

::: infobox
Alternatiba bat makina birtual batean instalatzea edo [web ofizialean](https://www.odoo.com/es_ES/page/download) dauden instalatzaileak erabiltzea litzateke.
:::

Instalazioa egiteko, [Docker Hub](https://hub.docker.com/_/odoo) webgunean agertzen diren jarraibideak erabiliko ditugu, aldaketa txiki batzuekin.

## Zerbitzu independenteak {#servicios-independientes}

Oinarrizkoena den sistema da, bi Docker edukiontzi altxatu behar dira:

-   **PostgreSQL** datu-basearen edukiontzia. Datu-basearen hainbat bertsio erabil daitezke, baina webgunean gomendatutakoari kasu egingo diogu. Erabiltzaile eta pasahitzarekin kontuz ibili behar da.

    Kasu honetan, PostgreSQL-en portu lehenetsia (5432) ere publikatu da:

::: mycode
[Datu-basearen edukiontzia sortu eta abiarazi]{.title}
```console
ruben@vega:~$ docker run -d -e POSTGRES_USER=odoo \
-e POSTGRES_PASSWORD=odoo -e POSTGRES_DB=postgres \
-p 5432:5432 --name odoo_db postgres:15
```
:::

-   **Odoo** bera duen edukiontzia. Edukiontzi honek web aplikazioa martxan jartzeko beharrezko zerbitzu eta liburutegiak izango ditu.

::: mycode
[Datu-basearen edukiontzia sortu eta abiarazi]{.title}
```console
ruben@vega:~$ docker run -d -p 8069:8069 --name odoo \
--link odoo_db:db -t odoo
```
:::

## Docker Compose {#docker-compose}

Docker Compose hainbat edukiontzi zerbitzu batera exekutatzeko tresna da, YAML formatuan fitxategi baten bidez sortzen dena. Zerbitzuen arkitektura azkar eta erraz sortu, gelditu eta berreraikitzeko modua da.

[compose.yaml]{.configfile} fitxategi bat sortu behar da, eta komenigarria da "zerbitzuen stack"-aren izena duen direktorio batean egotea, edukiontziak sortzean direktorioaren izena erabiltzen baitu.

::: mycode
[compose.yaml fitxategiaren edukia]{.title}
```yaml
version: '3.1'
services:
  web:
    image: odoo:16.0
    depends_on:
      - db
    ports:
      - "8070:8069"
  db:
    image: postgres:15
    environment:
      - POSTGRES_DB=postgres
      - POSTGRES_PASSWORD=odoo
      - POSTGRES_USER=odoo
    ports:
      - "5433:5432"
```
:::

Zerbitzuak abiarazteko, fitxategia dagoen direktorio berean komando hau exekutatu behar da:

::: mycode
[Docker compose abiarazi]{.title}
```console
ruben@vega:~$ docker compose up
```
:::

::: errorbox 
2023ko uztailean Compose v2-ra migratu zen, [web ofizialean](https://docs.docker.com/compose/) azaltzen den bezala. Instalatutako bertsioaren arabera `docker compose up` edo `docker-compose up` izango da.
:::


## Tresna osagarriak {#herramientas-extra}
Datu-basean sartzeko, kanpoko bezero bat erabil dezakegu. Horrela, ez dugu edukiontzian sartu beharrik eta interfaze grafiko bat izango dugu administratzeko.

Erabili daitezke:

- **DBeaver**: Mahaigaineko aplikazioa da, hainbat SGBD-rekin konektatzeko aukera ematen duena. [community](https://dbeaver.io/) bertsioa eta [lizentziaduna](https://dbeaver.com/buy/) dago, azken honek NO-SQL datu-baseekin ere konektatzeko aukera ematen du.

- **[pgAdmin](https://www.pgadmin.org/)**: PostgreSQL administratzeko web zerbitzari bidezko aplikazioa da.

::: mycode
[pgAdmin edukiontzia sortu eta abiarazi]{.title}
```console
ruben@vega:~$ docker run -p 8090:80 \
-e 'PGADMIN_DEFAULT_EMAIL=user@domain.com' \
-e 'PGADMIN_DEFAULT_PASSWORD=SuperSecret' \
--name pgadmin4 -d dpage/pgadmin4
```
:::

