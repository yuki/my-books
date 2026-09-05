
# Objektuetara bideratutako programazioa {#javascript-poo}

Orain arte objektu literalak erabiltzen aritu gara, eta objektu mota hori aplikazio askotarako nahikoa bada ere, gerta daiteke egin behar dugun garapena hasieratik egitura bera duten objektu gisa planteatzea.

Adibidez, institutu bat kudeatzeko aplikazio batek ehunka ikasle kudea ditzake, eta guztiek ezaugarri berak izango dituzte, egitura bera izango dute. **Objektuetara Bideratutako Programazioak (POO)** eredu komun bat definitzeko aukera ematen du, behar adina objektu sortzeko.

JavaScript-ek, **ECMAScript 2015etik** aurrera, **klaseetan** oinarritutako sintaxia du, beste lengoaia moderno batzuek erabiltzen dutenaren oso antzekoa. Barnean JavaScript-ek prototipoak erabiltzen jarraitzen badu ere, klaseen bidezko sintaxiak ikaskuntza errazten du, eta gaur egun programatzeko ohiko modua da.

<!-- 
TODO: su fuese necesario en el futuro, añadir qué es la POO, ventajas.
 -->

## POOko kontzeptuen laburpena {#resumen-poo}

Nahiz eta dagoeneko objektuetara bideratutako programazioa egin dugun, jarraian kontzeptu garrantzitsuenak laburbilduko ditugu:

- **Klasea**: objektuak nolakoak izango diren deskribatzen du.
- **Objektua**: klase horretatik abiatuta sortutako instantzia zehatza da.
- **Propietateak/Atributuak**: objektuaren egoera adierazten dute (izena, adina, ...).
- **Metodoak**: objektuak egin ditzakeen portaera edo funtzioak adierazten dituzte.

Tradizionalki, Objektuetara Bideratutako Programazioa oinarrizko lau kontzeptutan oinarritzen da. Kontzeptu horiek dagoeneko ezagunak egin beharko litzaizkiguke, edo, gutxienez, erabiltzen jakin beharko genuke:

- **Abstrakzioa**: sistema bat haren funtsezko ezaugarrietan arreta jarriz adieraztean datza.
- **Kapsulatzea**: datuak eta datu horiekin lan egiten duten metodoak taldekatzea da.
- **Herentzia**: herentziari esker, aurrez existitzen den klase batetik abiatuta klase berriak sor daitezke.
- **Polimorfismoa**: mota desberdinetako objektuei sintaktikoki berdinak diren mezuak bidaltzeko aukera ematen duen propietateari dagokio.


# Klase bat sortzea {#crear-clase}

Klase bat sortzeko [class]{.verbatim} hitz erreserbatua erabiltzen da. Haren sintaxi orokorra jarraian ikusiko dugu, eta klasearen izena, konbentzioz, letra larriz hasi ohi da.

Beste programazio-lengoaia batzuetan ez bezala, ez da beharrezkoa eremu publikoak adieraztea, [constructor]{.verbatim} bidez hasieratzen baitira. [constructor]{.verbatim} metodo berezi bat da, objektu berri bat sortzen denean automatikoki exekutatzen dena. **Klase bakoitzak constructor bakarra izan dezake**.

::: warnbox
Klase bakoitzak constructor bakarra izan dezake.
:::


:::::::::::::: {.columns }
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[Klase berria]{.title}
```javascript
class Alumno {
  constructor(nombre, edad) {
    this.nombre = nombre;
    this.edad = edad;
  }
  saludar() {
    console.log(`Hola ${this.nombre}`);
  }
}
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[Objektua sortu]{.title}
```javascript
const alumno1 = new Alumno("Alice",20);

const alumno2 = new Alumno("Bob",25);

alumno1.saludar();

alumno2.saludar();
```
:::

:::
::::::::::::::


Ikus daitekeenez, [saludar]{.verbatim} metodo bat ere sortu da, eta klasearen objektu bat sortu ondoren deitu daiteke.

## Kapsulatzea {#clases-encapsulación}

Objektuetara Bideratutako Programazioaren oinarrizko printzipioetako bat **kapsulatzea** da. Objektu baten barne-egoera babestean eta bertara sartzeko modua kontrolatzean datza.

Programaren edozein atalek datuak libreki aldatzea ahalbidetu beharrean, objektuak berak erabakitzen du nola erabili behar diren.


:::::::::::::: {.columns }
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[Klase berria]{.title}
```javascript
class Cuenta {
    constructor(saldo) {
        this.saldo = saldo;
    }
    setSaldo(saldo){
        this.saldo = saldo;
    }
}
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[Objektua sortu]{.title}
```javascript
const cuenta = new Cuenta(1000);
// nada impide hacer
cuenta.saldo = -5000;
// debería ser
cuenta.setSaldo(1500);
```
:::

:::
::::::::::::::

Programazioaren ikuspegitik, eremu batera sartzea eta hura aldatzea posible da, baina horrek objektuaren portaeran eragina izan dezake. Horregatik, arazoak saihesteko, kapsulatzea erabili eta propietateak aldatzen dituzten metodoak sortu beharko genituzke.

::: exercisebox
[[14a](https://github.com/yuki/ejercicios/blob/main/daw/dec/14a.html)]{.solution}

Sortu gutxienez bi atributu eta metodo bat dituen klase bat.
:::


## Eremu eta metodo pribatuak {#campos-privados}

Bitxia badirudi ere, JavaScript-ek elementu eta metodo pribatuak 2021eko uztailean txertatu zituen. Propietate eta metodo pribatuak deklaratzeko [#]{.verbatim} ikurra erabiltzen da.

Propietate eta metodo pribatu batera klase beretik soilik sar daiteke, objektuetara bideratutako programazioa duten beste lengoaia batzuetan gertatzen den bezala.

:::::::::::::: {.columns }
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[Klase berria]{.title}
```javascript
class Cuenta {
    #saldo;
    constructor(saldo) {
        this.#saldo = saldo;
    }
    #privado() {
        console.log("Priv");
    }
    getSaldo() {
        this.#privado();
        return this.#saldo;
    }
}
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[Objektua sortu]{.title}
```javascript
const cuenta = new Cuenta(1000);
// obtener dato
console.log(cuenta.getSaldo());

//esto dará error
console.log(cuenta.#privado());
//esto dará error
console.log(cuenta.#saldo);
```
:::

:::
::::::::::::::

Ikus daitekeenez, propietate pribatura sartzeko, horretarako sortutako metodo bat erabili behar dugu, [getSaldo()]{.verbatim}, **publikoa dena**. Propietatea aldatu nahi badugu ere, metodo baten bidez egin behar da.

Garrantzitsua da zehaztea **Chrome nabigatzaileetan, garatzaile-kontsolatik, metodo pribatura sartzea posible dela**, eta, beraz, ez duela errorerik emango.

::: errorbox
Chrome nabigatzaileetan, garatzaile-kontsolatik, metodo pribatura sartzea posible da.
:::

![Chrome-ko garatzaile-kontsola ezkerrean eta Firefox-ena eskuinean](img/dec/clase-privada-chrome.png){width=100% framed=true}


::: exercisebox
[[14b](https://github.com/yuki/ejercicios/blob/main/daw/dec/14b.html)]{.solution}

Sortu atributu eta metodo pribatu bat dituen klase bat.
:::


## Getters eta setters {#getters-setters}

Aurretik propietate batera nola sartu ikusi badugu ere, beste lengoaia batzuetako estilo klasikoa erabili dugu, Java-koa esaterako. Aldiz, JavaScript-ek ***getter*** eta ***setter*** izeneko sintaxi berezi bat eskaintzen du.

***Getter*** batek propietate bat atributu bat balitz bezala kontsultatzeko aukera ematen du; ***setter***-ak, berriz, propietate bat aldatzeko aukera ematen du.


:::::::::::::: {.columns }
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[Setter eta getter]{.title}
```javascript
class Cuenta {

    #saldo;

    constructor(saldo) {
        this.#saldo = saldo;
    }

    get saldo() {
        return this.#saldo;
    }
    set saldo(valor) {
        if (valor >= 0) {
            this.#saldo = valor;
        }
    }
}
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[Nola erabiltzen da]{.title}
```javascript
console.log(cuenta.saldo);
cuenta.saldo = 500;
console.log(cuenta.saldo);
```
:::

:::
::::::::::::::

::: exercisebox
[[14c](https://github.com/yuki/ejercicios/blob/main/daw/dec/14c.html)]{.solution}

Hartu aurreko ariketetako klase bat eta aldatu, *getters* eta *setters* erabiltzeko.
:::


# Herentzia {#herencia}

Herentzia lehendik dagoen beste klase batetik abiatuta klase berri bat sortzean datza. Klase berriak jatorrizko klasearen propietateak eta metodoak heredatzen ditu. JavaScript-en [extends]{.verbatim} hitz erreserbatua erabiltzen da herentzia egiteko.

Klase alabak bere [constructor]{.verbatim} propioa definitzen duenean, klase gurasoaren constructor-ari deitu behar dio [super()]{.verbatim} bidez. Jakina, klase berri horrek funtzio berriak betetzen dituzten atributu eta metodo berriak ere izan ditzake.


:::::::::::::: {.columns }
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[Klase]{.title}
```javascript
class Persona {

  constructor(nombre, edad) {
    this.nombre = nombre;
    this.edad = edad;
  }
  saludar() {
    console.log(`Hola, 
    soy ${this.nombre}`);
  }
}
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[Klase eta herentzia]{.title}
```javascript
class Alumno extends Persona {

    constructor(nombre, edad, curso) {
        super(nombre, edad);
        this.curso = curso;
    }
}
const alumno = new Alumno(
    "Ana",20,"2º DAW"
);

alumno.saludar();
```
:::

:::
::::::::::::::


::: exercisebox
[[14d](https://github.com/yuki/ejercicios/blob/main/daw/dec/14d.html)]{.solution}

Sortu klase bat, lehenengo klasetik heredatzen duen beste klase bat eta atributu eta metodo berri bat dituena.
:::



# Polimorfismoa {#polimorfismoa}

**Polimorfismo** hitzak literalki **forma asko** esan nahi du. Objektuetara Bideratutako Programazioan, objektu desberdinek metodo berari modu desberdinean erantzun diezaioketela adierazten du.

Aurreko adibideko "**Persona**" klasea kontuan hartuta, jarraian bi klase berri sortu dira, bertatik heredatzen dutenak eta [saludar()]{.verbatim} metodoa gainidazten dutenak.


:::::::::::::: {.columns }
::: {.column width="50%"}

::: {.mycode size=footnotesize}
[Polimorfismoa]{.title}
```javascript
class Alumno extends Persona {

    saludar() {
        super.saludar();
        console.log("Soy alumno.");
    }
}
```
:::

:::
::: {.column width="50%" }

::: {.mycode size=footnotesize}
[Polimorfismoa]{.title}
```javascript
class Profesor extends Persona {

    saludar() {
        super.saludar();
        console.log("Soy profesor.");
    }
}
```
:::

:::
::::::::::::::

Kontuan izan klase gurasoaren metodoari deitzeko [super.saludar()]{.verbatim} erabili dela, eta horrek gurasoaren behar dugun metodoari egiten diola erreferentzia.

::: exercisebox
[[14e](https://github.com/yuki/ejercicios/blob/main/daw/dec/14e.html)]{.solution}

Aurreko adibidetik abiatuta, sortu klase bakoitzaren instantzia bat eta deitu haren [saludar()]{.verbatim} metodoari.
:::


# Propietate eta metodo estatikoak {#propiedades-métodos-estáticos}


Metodo estatiko bat [static]{.verbatim} hitz erreserbatuaren bidez deklaratzen da, eta ez da objekturik sortu behar hura erabiltzeko. Are gehiago, objektu bat sortzen badugu, metodo horretara sartzeak **errorea emango du**.

::: mycode
[Propietate eta metodo estatikoak]{.title}
```javascript
class Calculadora {
    static VERSION = "1.0";

    static sumar(a, b) {
        return a + b;
    }
}

const resultado = Calculadora.sumar(5, 8);
```
:::

Printzipioz, ez dugu sistema hau erabiliko, baina garrantzitsua da ezagutzea, JavaScript-ek horrela funtzionatzen duten hainbat klase baititu, hala nola [Math](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math).

