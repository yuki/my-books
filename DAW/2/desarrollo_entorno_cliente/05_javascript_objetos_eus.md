
# Objektuak {#objetos}

Orain arte datu bakarra gordetzeko gai diren aldagaiekin lan egin dugu, baina, dagoeneko dakigunez, benetako aplikazio batean normalean entitate eta datu konplexuagoak erabiltzen ditugu. Horren ondorioz, aldagai independenteak soilik erabiltzea ez da eraginkorra eta ez da oso errealista.

JavaScript-en **[objektuak](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Working_with_objects)** erabil ditzakegu, erlazionatutako informazioa taldekatzea ahalbidetzen duen egitura bat baitira. Objektu baten barruko datu bakoitza **propietate** bat da, eta komatxoekin edo komatxorik gabe deklara daiteke (normalean, komatxorik gabe). JavaScript-eko objektuetatik [JSON](https://es.wikipedia.org/wiki/JSON) formatua (*JavaScript Object Notation*) eratorri da, gaur egun Interneten oso erabilia, [XML](https://es.wikipedia.org/wiki/Extensible_Markup_Language)-aren alternatiba gisa.

:::::::::::::: {.columns columnsep="0.5cm"}
::: {.column width="33%"}

::: mycode
[Sortu objektu berria]{.title}
```javascript
const alumno = {
  nombre: "Alice",
  edad: 20,
  direccion: {
    ciudad: "Bilbao",
    calle: "una",
  }
};
```
:::

:::
::: {.column width="33%" }

::: mycode
[Sortu objektu berria]{.title}
```javascript
const alumno = {
  "nombre": "Bob",
  "edad": 20,
  "direccion": {
    "ciudad": "BI",
    "calle": "una",
  }
};
```
:::

:::
::: {.column width="33%" }

::: mycode
[Sortu objektu berria]{.title}
```javascript
const nombre = "Bob";
const edad = 30;
const alumno = {
  nombre,
  edad,
  //...
};
```
:::


:::
::::::::::::::



Aurreko adibidean **alumno** objektua dugu, hiru propietat eta bakoitzari dagokion balioarekin. Objektuak alda daitezke, nahiz eta [const]{.verbatim} erabiliz deklaratu diren, edukia aldatzen ari garelako, eta ez erreferentzia (hau da [const]{.verbatim}-ek babesten duena).


## Propietateak {#propiedades}

Aipatu dugun bezala, objektu batek propietateen bilduma bat dauka, eta propietate horiekin hainbat eragiketa egiteko aukera dugu. Jarraian, horiek zehaztuko ditugu:

### Propietateak atzitzea eta aldatzea {#acceder-modificar-propiedades}

Objektu bat sortu ondoren, haren propietateen balioa kontsulta dezakegu, aldatu, propietate berriak gehitu edo ezabatu. JavaScript-ek objektu baten barruan gordetako informazioa atzitzeko hainbat modu eskaintzen ditu.

Propietateetara sartzeko bi modu erabil ditzakegu:

:::::::::::::: {.columns columnsep="0.5cm"}
::: {.column width="47%"}

::: {.mycode size=footnotesize}
[Propietateen baloreak lortu]{.title}
```javascript
console.log(alumno.nombre);
console.log(alumno.edad);
console.log(alumno.direccion.calle);
```
:::

:::
::: {.column width="53%" }

::: {.mycode size=footnotesize}
[Propietateen baloreak lortu]{.title}
```javascript
console.log(alumno["nombre"]);
console.log(alumno["direccion"]["calle"]);
//evitad mezclar
console.log(alumno["direccion"].calle);
```
:::

:::
::::::::::::::

Kortxeteen erabilera ohikoagoa izaten da propietatearen izena aldagai batean dugunean.


:::::::::::::: {.columns }
::: {.column width="50%"}

::: mycode
[Propietateen baloreak lortu]{.title}
```javascript
let propiedad = "direccion";
console.log(alumno[propiedad])
```
:::

:::
::: {.column width="50%" }

::: mycode
[Propietateak aldatu]{.title}
```javascript
alumno.nombre = "Bob";
alumno.curso = "2º DAW";
```
:::

:::
::::::::::::::


Propietatea aldatzeko, goiko kodean ikus daitekeen modu bera erabiliko genuke. Propietate berriak gehitu nahi baditugu, gauza bera egingo dugu.

### Propietateak ezabatzea {#eliminar-propiedades}

Propietate bat ezabatu nahi badugu, [delete]{.verbatim} eragilea erabiliko dugu. Lehenespenez, beti [true]{.verbatim} itzultzen du, [salbuespenak badaude ere](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/delete#return_value).

::: mycode
[Propietateak kendu]{.title}
```javascript
delete alumno.curso;
```
:::


### Existitzen ez den propietate batera sartzea {#propiedad-inexistente}

Baliteke kasuren batean definitu gabeko propietate batera eta, beraz, existitzen ez den propietate batera sartzen saiatzea. Emaitza [undefined]{.verbatim} izango da, eta, beraz, ez du errorerik sortuko.


### Existitzen ez den objektu batera [?.]{.verbatim} bidez sartzea {#objeto-inexistente}

Objektu bat existitu ez badaiteke, bertara edo haren propietate batera sartzen saiatzen bagara, errore bat jasoko dugu. Errore hori saihesteko, [?.]{.verbatim} eragilea erabil dezakegu (*[optional chaining](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Optional_chaining)* deitzen zaio).

::: mycode
[Existitzen ez den objektu batera sartu]{.title}
```javascript
const profesor = null;
console.log(profesor?.nombre); // undefined
console.log(profesor.nombre);  // error
```
:::

### Egiaztatu propietate bat existitzen den {#comprobar-propiedad}

Modu erraz bat [in]{.verbatim} eragilea erabiltzea da. Eragile hori erabiltzean, boolear motako balio bat lortuko dugu, eta, beraz, propietatea existitzen bada [true]{.verbatim} izango dugu.


::: mycode
[Egiaztatu propietate bat existitzen den]{.title}
```javascript
if ("edad" in alumno) {
    console.log("tiene edad")
} else {
    console.log("no tiene edad")
}
```
:::

### Propietateen zeharkatzea {#recorrido-propiedades}

Askotan beharrezkoa izaten da objektu baten propietate guztiak prozesatzea. JavaScript-ek hainbat mekanismo eskaintzen ditu propietate horiek zeharkatzeko.

#### [for...in]{.verbatim} erabiliz {#recorrer-utilizando-for-in}

Aurretik ikusi dugu begizta erabil dezakegula. Modurik errazena `for...in` begizta erabiltzea da. Kasu honetan, propietateen izena soilik lortuko dugu.

::: mycode
[[for...in]{.verbatim}]{.title}
```javascript
const alumno = {
    nombre: "Alice",
    edad: 20,
    ciudad: "Bilbao"
};

for (const propiedad in alumno) {
    console.log(propiedad);
}
```
:::

::: exercisebox
[[12a](https://github.com/yuki/ejercicios/blob/main/daw/dec/12a.html)]{.solution}

Sortu objektu bat, gehitu propietate bat, ezabatu eta zeharkatu propietate guztiak.
:::

#### Propietate guztiak [Object.keys()]{.verbatim} bidez lortzea {#obtener-todas-las-propiedades}

[Object.keys()]{.verbatim} funtzioak objektuaren propietate guztiak dituen array bat itzultzen du.

::: mycode
[[Object.keys()]{.verbatim}]{.title}
```javascript
const propiedades = Object.keys(alumno);
console.log(propiedades);
// recorrer propiedades
for (const propiedad of Object.keys(alumno)) {
    console.log(propiedad);
}
```
:::


#### Propietateen balioak soilik [Object.values()]{.verbatim} bidez lortzea {#obtener-valores-las-propiedades}

Balioak soilik nahi baditugu, [Object.values()]{.verbatim} funtzioa erabil dezakegu.

::: mycode
[Baloreak lortu]{.title}
```javascript
console.log(Object.values(alumno));
```
:::


#### Propietatea eta balioa [Object.entries()]{.verbatim} bidez lortzea {#obtener-propiedad-valor-array}

[[[gakoa,balioa],...]]{.verbatim} formatuan osatutako array bat itzultzen du.

::: mycode
[Propietatea eta balioa lortu]{.title}
```javascript
// recorrer propiedad/valor
for (const [propiedad, valor] of Object.entries(alumno)) {
    console.log(propiedad, valor);
}
```
:::

::: exercisebox
[[12b](https://github.com/yuki/ejercicios/blob/main/daw/dec/12b.html)]{.solution}

Erabili [Object.entries()]{.verbatim} objektu bat zeharkatzeko.
:::


#### Zein metodo erabili? {#resumen-recorrer}

Laburpen gisa, ondorengo taula erabilgarria da.

| Metodoa | Itzultzen du |
|---------|----------|
| [for...in]{.verbatim} | Objektuaren propietateak. |
| [Object.keys()]{.verbatim} | Propietateak dituen array bat. |
| [Object.values()]{.verbatim} | Balioak dituen array bat. |
| [Object.entries()]{.verbatim} | Propietate-balio bikoteak dituen array bat. |

JavaScript modernoan oso ohikoa da [Object.entries()]{.verbatim} [for...of]{.verbatim}-ekin batera erabiltzea, sintaxi argia eta irakurtzeko erraza eskaintzen baitu, baina behar dugunaren araberakoa izango da.

::: infobox
Erabili une bakoitzean objektuak zeharkatzeko beharretara hobekien egokitzen den metodoa.
:::


## Metodoak {#objetos-métodos}

Objektuek funtzioak ere izan ditzakete, eta funtzio horiei **metodo** deitzen zaie. Metodoak bi modutan deklara daitezke, jarraian ikus dezakegun bezala:

:::::::::::::: {.columns }
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[Metodoa]{.title}
```javascript
const alumno = {
    nombre: "Carol",
    saludar: function () {
        console.log("Hola.");
    }
};
alumno.saludar();
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[Metodoa]{.title}
```javascript
const alumno = {
    nombre: "David",
    saludar (saludo) {
        console.log(`Hola ${saludo}`);
    }
};
alumno.saludar("tu");
```
:::

:::
::::::::::::::


### [this]{.verbatim} balioa {#valor-this .unnumbered}

Metodo baten barruan, objektura bera sar gaitezke [this]{.verbatim} hitz erreserbatua erabiliz.

:::::::::::::: {.columns }
::: {.column width="50%"}

::: {.mycode size=footnotesize}
["this" erabiltzen]{.title}
```javascript
const alumno = {
  nombre: "Eve",
  saludar() {
    console.log(`Hola ${this.nombre}`);
  }
};
alumno.saludar();
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[ez erabili gezi-funtzioak "this"-ekin]{.title}
```javascript
const alumno = {
  nombre: "Frank",
  saludar: => () {
    console.log(`Hola ${this.nombre}`);
    //undefined
  }
};
alumno.saludar();
```
:::

:::
::::::::::::::

Teknikoki posible bada ere gezi-funtzioak metodo gisa erabiltzea, normalean **ez da gomendagarria**. Gezi-funtzioak erabiltzean ez dute beren [this]{.verbatim} propioa sortzen, eta horrek arazoak sor ditzake emaitzekin.

::: errorbox
Hobe da *arrow functions* metodo gisa erabiltzea saihestea.
:::

::: exercisebox
[[12c](https://github.com/yuki/ejercicios/blob/main/daw/dec/12c.html)]{.solution}

Sortu metodo bat objektu baten barruan eta erabili. Sortu beste metodoa gezi-funtzioarekin eta [this]{.verbatim} erabiltzen. Zer gertatzen da?
:::

## Objektuen kopia {#copia-objetos}

Askotan objektu baten kopia bat sortu behar dugu, kopia aldatzeko jatorrizkoa aldatu gabe. Hala ere, JavaScript-en objektu bat kopiatzeak ez du beti espero dugun emaitza ematen. Portaera hori ulertzeko, gogoratu behar da objektuak gordetzen dituzten aldagaiek **objektuaren erreferentzia gordetzen dutela**, eta ez objektua bera.

Imajina dezagun objektu bat sortu eta objektu hori beste aldagai bati esleitzen diogun ondorengo adibidea:

::: {.mycode size=footnotesize}
[Objektuen kopia]{.title}

```javascript
const alumno1 = {
    nombre: "Grace",
    edad: 20
};
const alumno2 = alumno1;
```
:::

::: exercisebox
[[12d](https://github.com/yuki/ejercicios/blob/main/daw/dec/12d.html)]{.solution}

Gehitu edo aldatu propietate bat [alumno2]{.verbatim}-n. Zer gertatzen da [alumno1]{.verbatim}-ekin?
:::

Bi aldagaiek objektu berari egiten diote erreferentzia:

![Objektuen erreferentzia](img/dec/objetos.png){width=50%}

Horren ondorioz, [alumno2]{.verbatim} aldatzen badugu ere, aldaketa [alumno1]{.verbatim}-en ere islatuko da. Are gehiago, konparaketa [===]{.verbatim} erabiliz egiten badugu, [true]{.verbatim} itzuliko digu, objektu bera direlako.


::: {.mycode size=footnotesize}
[Objektuen konparaketa]{.title}

```javascript
const alumno1 = {
    nombre: "Heidi",
    edad: 20
};
const alumno2 = alumno1;
console.log(alumno1 === alumno2);
const alumno3 = {
    nombre: "Heidi",
    edad: 20
};
console.log(alumno1 === alumno3);
```
:::

::: exercisebox
[[12e](https://github.com/yuki/ejercicios/blob/main/daw/dec/12e.html)]{.solution}

Egin aurreko ariketa eta barneratu gertatzen dena.
:::

### Azaleko kopia {#copia-superficial}

Objektuaren benetako kopia bat egiteko, *[Spread](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax)* eragilea [..]{.verbatim} erabili behar dugu, nahiz eta [Object.assign()]{.verbatim} ere erabil daitekeen.

:::::::::::::: {.columns }
::: {.column width="45%"}

::: {.mycode size=footnotesize}
[Azaleko kopia]{.title}

```javascript
const alumno1 = {
    nombre: "Ivan",
    edad: 20,
    direccion: {
        ciudad: "Bilbao"
    }
};
const alumno2 = {...alumno1};
console.log(alumno1 === alumno2);
```
:::

:::
::: {.column width="52%" }

::: {.mycode size=footnotesize}
[Azaleko kopia]{.title}

```javascript
const alumno1 = {
    nombre: "Alice",
    edad: 20,
    direccion: {
        ciudad: "Bilbao"
    }
};
const alumno2 = Object.assign({}, alumno1);
console.log(alumno1 === alumno2);
```
:::

:::
::::::::::::::


::: exercisebox
[[12f](https://github.com/yuki/ejercicios/blob/main/daw/dec/12f.html)]{.solution}

Aldatu adina eta hiria [alumno1]{.verbatim}-en. Zer gertatzen da [alumno2]{.verbatim}-n?
:::

::: errorbox
Kontuz, **azaleko kopiak** baino ez dira. **Habiaratutako objektuek objektu bera izaten jarraitzen dute**.
:::


### Kopia sakona {#copia-profunda}

Objektu bat erabat kopiatu behar dugunean, habiaratutako objektu guztiak barne, **kopia sakonaz** (*deep copy*) hitz egiten dugu. Kasu horietan [structuredClone()]{.verbatim} erabili behar dugu.

::: {.mycode size=footnotesize}
[Kopia sakona]{.title}

```javascript
const alumno1 = {
    nombre: "Bob",
    edad: 20,
    direccion: {
        ciudad: "Bilbao"
    }
};
const alumno2 = structuredClone(alumno1);
```
:::

::: exercisebox
[[12g](https://github.com/yuki/ejercicios/blob/main/daw/dec/12g.html)]{.solution}

Aldatu adina eta hiria [alumno1]{.verbatim}-en. Zer gertatzen da [alumno2]{.verbatim}-n?
:::



## Objektuak konbinatzea {#combinar-objetos}

*spread* eragilea objektuak konbinatzeko ere erabil daiteke.

::: mycode
[Objektuak konbinatu]{.title}
```javascript
const persona = {
    nombre: "Carol"
};
const datos = {
    ...persona,
    edad: 20,
    ciudad: "Bilbao"
};
console.log(datos);
```
:::


## Propietateak gainidaztea {#sobreescribir-propiedades}

Propietate bat behin baino gehiagotan agertzen bada, azkenak izango du lehentasuna.

::: mycode
[Propietateak gainidatzi]{.title}
```javascript
const alumno = {
    nombre: "Dan",
    edad: 20
};

const copia = {
    ...alumno,
    edad: 21
};
```
:::

# Array-ak {#arrays}

Orain arte ikusi dugu objektuek erlazionatutako informazioa taldekatzea ahalbidetzen dutela; hala ere, askotan **hainbat elementu** gorde behar izaten ditugu. Horretarako, beste lengoaia batzuetan bezala, JavaScript-ek **[array-ak](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array)** eskaintzen ditu.

Beste lengoaia batzuetan ez bezala, JavaScript-ek datu-mota desberdinetako elementuak dituzten array-ak sortzeko aukera ematen du. Adibiderik argiena objektuen array bat da, [API](https://en.wikipedia.org/wiki/API) batetik [JSON](https://es.wikipedia.org/wiki/JSON) formatuan lortzen ditugun datuak dira.


:::::::::::::: {.columns }
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[Acceder simple]{.title}
```javascript
const datos = [10, 20, "treinta"];
const llenar = [];
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[Array objektuekin]{.title}
```javascript
const alumnos = [
    {
        nombre: "Ann",
        edad: 20
    },
    {
        nombre: "Bob",
        edad: 21
    }
];
```
:::

:::
::::::::::::::



"Array tradizionalaz" gain, badira beste [bilduma indexatu](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects\#indexed_collections) batzuk ere.

## Elementuak atzitzea eta aldatzea {#array-acceder-modificar}

Array baten elementuak atzitzeko eta aldatzeko, haien indizearen bidez egin behar dugu. JavaScript-en **indizeak 0-tik hasten dira**.


:::::::::::::: {.columns }
::: {.column width="50%"}

::: mycode
[Indize bateko balorea]{.title}
```javascript
console.log(datos[0]);
```
:::

:::
::: {.column width="50%" }

::: mycode
[Indize bat aldatu]{.title}
```javascript
datos[2] = 30;
```
:::

:::
::::::::::::::


## Array-aren luzera {#longitud-array}

Array-ak zenbat elementu dituen jakiteko, [length]{.verbatim} propietatea dugu. Beraz, azken elementura sartu nahi badugu, 1 kendu beharko diogu.

:::::::::::::: {.columns }
::: {.column width="50%"}

::: mycode
[Array-ren luzera]{.title}
```javascript
console.log(datos.length);
```
:::

:::
::: {.column width="50%" }

::: mycode
[Azkenengo elementua]{.title}
```javascript
datos[datos.length-1];
```
:::

:::
::::::::::::::


## Array bat zeharkatu {#recorrer-array}

Modu klasikoan [for]{.verbatim} begizta erabiltzen da, nahiz eta gaur egun [for...of]{.verbatim} erabiltzen den.

:::::::::::::: {.columns }
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[Array zeharkatu]{.title}
```javascript
for (let i=0; i<datos.length; i++) {
    console.log(datos[i]);
}
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[Array zeharkatu]{.title}
```javascript
for (const dato of datos) {
    console.log(dato);
}
```
:::

:::
::::::::::::::


::: exercisebox
[[13a](https://github.com/yuki/ejercicios/blob/main/daw/dec/13a.html)]{.solution}

Sortu array bat, aldatu elementuren bat, egiaztatu haren luzera eta zeharkatu.
:::


## Array-en metodoak {#array-metodos}

JavaScript-ek metodo ugari eskaintzen ditu array-ekin lan egiteko. Horietako askok array-aren edukia aldatzen dute, eta beste batzuek array berri bat itzultzen dute. Jarraian, erabilienak ikusiko ditugu, baina interesgarria da [array-en dokumentazioa](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array) kontsultatzea metodo guztiak ikusteko.


:::::::::::::: {.columns }
::: {.column width="48%"}

::: {.mycode size=footnotesize}
[Array-en metodoak]{.title}
```javascript
const numeros = [10, 20, 30, 40, 50];
// añadir elemento al final
numeros.push(60);
// eliminar último elemento
numeros.pop();
// añadir al inicio
numeros.unshift(5);
// eliminar el primero
numeros.shift();
// obtener una parte del array
const nums = numeros.slice(1, 3);
```
:::

:::
::: {.column width="52%" }

::: {.mycode size=footnotesize}
[Array-en metodoak]{.title}
```javascript
const colores = ["Rojo","Verde","Azul"];
// buscar un elemento
console.log(colores.includes("Verde"));
// obtener la posición
console.log(colores.indexOf("Azul"));
// concatenar arrays
const nuevo = numeros.concat(colores);
const letras = ["C", "A", "B"];
// ordenar
letras.sort();
// invertir
letras.reverse();
// convertir en cadena
console.log(colores.join(", "));
```
:::

:::
::::::::::::::

Ondorengo taulan ikusitako metodoen laburpena dago:

| Metodoa | Deskribapena |
|---------|-------------|
| [push()]{.verbatim} | Amaieran gehitzen du |
| [pop()]{.verbatim} | Azkena ezabatzen du |
| [unshift()]{.verbatim} | Hasieran gehitzen du |
| [shift()]{.verbatim} | Lehenengoa ezabatzen du |
| [includes()]{.verbatim} | Existitzen den egiaztatzen du |
| [indexOf()]{.verbatim} | Posizioa itzultzen du |
| [concat()]{.verbatim} | Array-ak elkartzen ditu |
| [slice()]{.verbatim} | Zati baten kopia lortzen du |
| [splice()]{.verbatim} | Elementuak txertatu edo ezabatzen ditu |
| [sort()]{.verbatim} | Ordenatzen du |
| [reverse()]{.verbatim} | Ordena alderantzikatzen du |
| [join()]{.verbatim} | Testu bihurtzen du |


## Array-en kopia {#copia-arrays}

Objektuekin gertatzen zen bezala, array bat sortu eta beste aldagai bati esleitzen badiogu, ez dugu kopiarik egiten, datuaren erreferentzia bat baizik. Garrantzitsua da hori kontuan izatea; beraz, gogoratu objektuen [kopia sakonean](#copia-profunda) ikusitakoa array-ekin gauza bera egiteko.


::: exercisebox
[[13b](https://github.com/yuki/ejercicios/blob/main/daw/dec/13b.html)]{.solution}

Erabili aurreko metodoak eta kopiatu array-ak objektuekin egin dugun bezala.
:::

<!-- 

# Métodos modernos

JavaScript moderno incorpora métodos muy potentes para trabajar con arrays.

Los más importantes son:

- `find()`
- `filter()`
- `map()`
- `reduce()`
- `some()`
- `every()`

Estos métodos constituyen la base de la programación funcional en JavaScript y se estudiarán en el siguiente apartado de la unidad.

 -->





<!-- 

# 5.5 Desestructuración y operador spread

JavaScript moderno incorpora varias características que simplifican enormemente el trabajo con objetos y arrays.

Dos de las más utilizadas son la **desestructuración** (*destructuring*) y el **operador spread** (`...`).

Ambas aparecen constantemente en aplicaciones modernas y son fundamentales para trabajar con bibliotecas y frameworks como Vue.

---

# Desestructuración de objetos

La desestructuración permite extraer propiedades de un objeto y almacenarlas en variables de forma muy sencilla.

Supongamos el siguiente objeto.

```javascript
const alumno = {
    nombre: "Ana",
    edad: 20,
    ciudad: "Bilbao"

};
```

En lugar de escribir:

```javascript
const nombre = alumno.nombre;

const edad = alumno.edad;
```

podemos escribir:

```javascript
const { nombre, edad } = alumno;
```

Ahora disponemos de dos variables.

```javascript
console.log(nombre);

console.log(edad);
```

Resultado:

```
Ana

20
```

---


# Desestructuración de arrays

También funciona con arrays.

```javascript
const colores = [

    "Rojo",

    "Verde",

    "Azul"

];
```

Podemos escribir:

```javascript
const [primero, segundo] = colores;

console.log(primero);

console.log(segundo);
```

Resultado:

```
Rojo

Verde
```

---

# Ignorar elementos

```javascript
const [primero, , tercero] = colores;

console.log(tercero);
```

Resultado:

```
Azul
```

---

# Intercambiar variables

Una aplicación muy interesante consiste en intercambiar dos variables.

```javascript
let a = 10;

let b = 20;

[a, b] = [b, a];

console.log(a);

console.log(b);
```

Resultado:

```
20

10
```

---

# El operador spread

El operador spread (`...`) permite expandir un objeto o un array.

Ya lo hemos utilizado para copiar objetos.

También funciona con arrays.

```javascript
const grupo1 = [
    "Ana",
    "Luis"
];

const grupo2 = [
    "Pedro",
    "Marta"
];

const grupoCompleto = [
    ...grupo1,
    ...grupo2
];

console.log(grupoCompleto);
```

Resultado:

```javascript
["Ana", "Luis", "Pedro", "Marta"]
```

---

# Añadir elementos fácilmente

```javascript
const numeros = [

    1,

    2,

    3

];

const nuevos = [
    ...numeros,
    4,
    5
];
```

Resultado:

```javascript
[1, 2, 3, 4, 5]
```

---


 -->
