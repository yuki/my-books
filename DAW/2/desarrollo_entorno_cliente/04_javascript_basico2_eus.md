
# Kontrol-egiturak {#estructuras-control}

Orain arte aldagaiak deklaratzen, informazioa gordetzen eta haiekin eragiketak egiten ikasi dugu. Orain arte ikusi dugun guztian, instrukzioak modu sekuentzialean exekutatzen dira, bata bestearen atzetik. Programa batek erabakiak hartzeko, zereginak errepikatzeko edo sartutako informazioaren arabera instrukzio batzuk edo beste batzuk exekutatzeko gai izan behar du.

**Kontrol-egiturek** programa baten exekuzioaren fluxu normala aldatzeko aukera ematen dute, eta haiei esker aplikazio konplexu eta dinamikoak sor ditzakegu. Aurreko ikasturtean ikusi zenuten bezala, kontrol-egiturak honela bereizten dira:

- **Egitura sekuentzialak**: bata bestearen atzetik exekutatzen dira.
- **Baldintzazko egiturak**: baldintza baten arabera instrukzioak exekutatzen dituzte.
- **Egitura errepikakorrak**: bloke bat hainbat aldiz exekutatzeko aukera ematen dute.


## Baldintzazko egiturak {#estructuras-condicionales}

Beste programazio-lengoaia batzuetan bezala, [if]{.verbatim} baldintzazko egitura da sinpleena, eta eduki bat exekutatuko du baldintza bat betetzen bada. Baldintza hori betetzen ez bada eta [else]{.verbatim} blokea badago, bigarren bloke hori exekutatuko da.


:::::::::::::: {.columns }
::: {.column width="47%"}

::: {.mycode}
[Baldintza sinple]{.title}
```javascript
const edad = 20;

if (edad >= 18) {
    console.log("Mayor");
}
```
:::

:::
::: {.column width="47%" }

::: {.mycode}
[Baldintza else-rekin]{.title}
```javascript
const edad = 20;

if (edad >= 18) {
    console.log("Mayor");
} else {
    console.log("Menor");
}
```
:::

:::
::::::::::::::

::: exercisebox
[[09a](https://github.com/yuki/ejercicios/blob/main/daw/dec/09a.html)]{.solution}

Eskatu [prompt()]{.verbatim} bidez adina, eta erabili baldintzazko egitura adin hori nagusia edo adingabea den jakiteko.
:::

Baldintzan aurrez ikusitako [konparaketa-eragileak](##operadores-comparación) erabil daitezke, eta baldintza bat baino gehiago kateatu nahi baditugu, [eragile logikoak](#operadores-lógicos).

:::::::::::::: {.columns }
::: {.column width="47%"}

::: {.mycode size=footnotesize}
[Operadore logikoa]{.title}
```javascript
const edad = 20;

if (edad >= 18 && edad <=65) {
    console.log("Mayor");
} else {
    console.log("Menor o jubilado");
}
```
:::

:::
::: {.column width="47%" }

::: {.mycode size=footnotesize}
[Baldintza "else if"-rekin]{.title}
```javascript
let edad = 20;

if (edad >= 65) {
    console.log("Jubilado");
} else if (edad >= 18){
    console.log("Mayor");
} else {
    console.log("Menor");
}
```
:::

:::
::::::::::::::

Ikus daitekeen bezala, [else if]{.verbatim} ere erabil daiteke aurreko baldintzan betetzen ez den baldintza berri bat egiaztatu nahi badugu.


::: exercisebox
[[09b](https://github.com/yuki/ejercicios/blob/main/daw/dec/09b.html)]{.solution}

Eskatu [prompt()]{.verbatim} bidez adina, eta erabili baldintzazko egitura adina adingabea, nagusia edo erretiroduna den jakiteko.
:::


### Eragile ternarioa {#operador-ternario}

[if..else]{.verbatim} egitura sinple bat idatzi nahi badugu, lerro bakarrean eragile ternarioa erabil dezakegu honela:

::: {.mycode}
[Operador ternario]{.title}
```javascript
const edad = 20;

const mensaje = edad >= 18 ? "Mayor" : "Menor";
```
:::


### [switch]{.verbatim} estruktura {#switch}

Hainbat baldintza egiaztatu nahi baditugu, [if else]{.verbatim} egiturak habiaratu behar ez izateko, [switch]{.verbatim} erabil dezakegu:

::: {.mycode}
[Usando switch]{.title}
```javascript
switch (action) {
  case "draw":
    console.log("draw");
    break;
  case "eat":
    console.log("eat");
    break;
  default:
    console.log("default");
}
```
:::

Garrantzitsua da bloke bakoitzaren amaieran [break]{.verbatim} sententzia gehitzea; izan ere, hala egin ezean, gainerako mailak "ur-jauzian" exekutatzen jarraituko du. [default]{.verbatim} blokea aurreko blokeetako batekin ere bat ez datorrenean exekutatuko da.

::: exercisebox
[[09c](https://github.com/yuki/ejercicios/blob/main/daw/dec/09c.html)]{.solution}

Erabili [switch]{.verbatim} baldintzazko egitura, [break]{.verbatim} erabiliz eta erabili gabe.
:::


# Bukleak {#bucles}

Sententzia errepikakorrak eta blokeen exekuzio errepikatuak egiteko, **egitura errepikakorrak** erabiltzen dira, **bukleak/begiztak** ere deituak.

Bukle batek instrukzio-bloke bat hainbat aldiz exekutatzeko aukera ematen du, betiere baldintza jakin bat betetzen bada. Beste programazio-lengoaia batzuetan gertatzen den bezala, JavaScript-en hainbat bukle mota daude:

## [while]{.verbatim} bukle {#bucle-while}

[while]{.verbatim} buklea bloke bat exekutatzen du **baldintza egia den bitartean**. Baldintza **iterazio bakoitzaren aurretik** ebaluatzen da, eta, beraz, baldintza faltsua bada, bukle ez da exekutatuko.

:::::::::::::: {.columns }
::: {.column width="47%"}

::: {.mycode}
[Bukle while]{.title}
```javascript
let contador = 1;

while (contador <= 5) {
    console.log(contador);
    contador++;
}
```
:::

:::
::: {.column width="47%" }

::: {.mycode}
[Bukle infinitua]{.title}
```javascript
let contador = 1;

while (contador <= 5) {
    console.log(contador);
}
```
:::

:::
::::::::::::::

::: errorbox
Garrantzitsua da baldintza kontuan hartzea **bukle infinituak** saihesteko.
:::


## [do...while]{.verbatim} bukle {#bucle-do-while}

Kasu honetan, baldintza blokea **exekutatu ondoren** ebaluatzen da.


::: {.mycode}
[Bulle do...while]{.title}
```javascript
let contador = 1;
do {
    console.log(contador);
    contador++;
} while (contador <= 5);
```
:::



## [for]{.verbatim} bukle {#bucle-for}

Aldez aurretik errepikapen kopurua ezagutzen dugunean gehien erabiltzen den bukle da.


::: {.mycode}
[Bukle for]{.title}
```javascript
for (let i = 1; i <= 5; i++) {
    console.log(i);
}
```
:::

Kasu honetan, sententziaren barruan hiru zati bereizten dira:

- **Hasieratzea**: [let i = 0]{.verbatim}
- **Baldintza**: [i < 10]{.verbatim}
- **Eguneratzea**: [i++]{.verbatim}


::: exercisebox
[[10a](https://github.com/yuki/ejercicios/blob/main/daw/dec/10a.html)]{.solution}

Sortu ikusitako bukle bakoitzaren adibide bat.
:::


## [for...of]{.verbatim} bukle {#bucle-for-of}

JavaScript modernoak [for...of]{.verbatim} bukle dauka, objektu iterableak (Array, Map, Set...) zeharkatzeko diseinatua.

Array-ak zeharkatzeko gomendatutako modua da.


::: {.mycode}
[Bukle for...of]{.title}
```javascript
const colores = ["Rojo", "Verde", "Azul"];

for (const color of colores) {
    console.log(color);
}
```
:::

## [for...in]{.verbatim} bukle {#bucle-for-in}

[for...in]{.verbatim} buklearekin objektu baten propietateak zeharka daitezke.

::: {.mycode}
[Bukle for...in]{.title}
```javascript
const alumno = {
    nombre: "Bob",
    edad: 20
};

for (const propiedad in alumno) {
    console.log(propiedad);
}
```
:::

Array-etan ere erabil daiteke, baina **ez da gomendagarria**. Array-ak zeharkatzeko beti [for...of]{.verbatim} erabiliko dugu.


## Bukleen laburpena

Ondorengo taulan bukle moten laburpena eta bakoitza zertarako erabili beharko genukeen ikus daiteke.

| Egoera | Gomendatutako bukle |
|-----------|------------------|
| Errepikapen kopuru ezaguna | `for` |
| Baldintza bat betetzen den bitartean errepikatzea | `while` |
| Gutxienez behin exekutatzea | `do...while` |
| Array-ak zeharkatzea | `for...of` |
| Objektuen propietateak zeharkatzea | `for...in` |


## [break]{.verbatim} eta [continue]{.verbatim} sententziak {#break-verbatim}

Batzuetan beharrezkoa da bukle baten ohiko portaera aldatzea, eta horretarako honako instrukzio hauek ditugu:

- [break]{.verbatim}: buklea berehala amaitzen du.
- [continue]{.verbatim}: uneko iterazioa saltatzen du eta hurrengoarekin jarraitzen du.


:::::::::::::: {.columns }
::: {.column width="47%"}

::: {.mycode size=footnotesize}
[break]{.title}
```javascript
const numeros = [4, 8, 15, 23];

for (const numero of numeros) {
    if (numero === 15) {
        console.log("Encontrado");
        break;
    }
}
```
:::

:::
::: {.column width="47%" }

::: {.mycode size=footnotesize}
[continue]{.title}
```javascript
for (let i = 1; i <= 5; i++) {
    if (i === 3) {
        continue;
    }
    console.log(i);
}
```
:::

:::
::::::::::::::

::: exercisebox
[[10b](https://github.com/yuki/ejercicios/blob/main/daw/dec/10b.html)]{.solution}

Sortu ikusitako bukle bakoitzaren adibide bat.
:::


# Oinarrizko erroreen kudeaketa {#gestión-errores-básica}

JavaScript-ek akatsak detektatzeko eta kudeatzeko aukera ematen du, aplikazioa ustekabean amaitu ez dadin.

## [try...catch]{.verbatim} egitura {#try-catch}

Programazio-lengoaia askotan dagoen salbuespenen kudeaketarako egitura [try...catch]{.verbatim} da, eta JavaScript ez da salbuespena.

Akats bat sortzeko joera duen sententzia bat exekutatzen badugu, programa gelditu egin daiteke. Sententzia hori [try...catch]{.verbatim} baten barruan exekutatzen badugu, akatsaren kudeaketa kontrola dezakegu.

::: {.mycode}
[Erroreen kudeaketaren adibidea]{.title}
```javascript
try {
    console.log(variableInexistente);
}
catch (error) {
    console.log("Error: "+error);
}
```
:::

### [error]{.verbatim} objektua {#error-object}

[catch]{.verbatim} blokeak erroreari buruzko informazioa duen objektu bat jasotzen du, bi atributu dituena:

- **name**: errorearen izena.
- **message**: errore-mezua.


### [finally]{.verbatim} blokea {#finally}

[try...catch]{.verbatim} blokearekin batera, [[finally]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/try...catch#syntax) izeneko aukerako bloke bat gehi dezakegu, eta **beti exekutatuko da, errorea egon zein ez**.


::: {.mycode}
[Erroreen kudeaketa]{.title}
```javascript
try {
    console.log("Inicio");
}
catch (error) {
    console.log("Error: "+error);
}
finally {
    console.log("Fin");
}
```
:::


## Erroreak [throw]{.verbatim} bidez sortzea {#generar-errores-throw}

Erroreak nahita sortzea ere posible da [[throw]{.verbatim}](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/throw) sententziaren bidez.

::: {.mycode}
[Erroreak sortzeko adibidea]{.title}
```javascript
const edad = -5;

if (edad < 0) {
    throw new Error("La edad no puede ser negativa.");
}
```
:::


# Funtzioak {#funciones}

Orain arte, instrukzio-sekuentzia batez osatutako programak idatzi ditugu. Programak handitzen diren heinean, ohikoa da beti zeregin bera egiten duten kode-blokeak aurkitzea. Kode hori hainbat aldiz kopiatu eta itsasteak programa mantentzea zailagoa egiten du eta akatsak egiteko probabilitatea handitzen du.

**[Funtzioek](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions)** instrukzio multzo bat izen baten pean taldekatzeko aukera ematen dute, beharrezkoa den bakoitzean exekutatu ahal izateko. Funtzioak edozein programazio-lengoaiaren elementu garrantzitsuenetako bat dira.


## Funtzioen deklarazioa eta erabilera {#declaración-funciones}

Funtzio bat sortzeko modu klasikoan [function]{.verbatim} hitz erreserbatua erabiltzen da. Funtzioari deitzeko, hitz erreserbatu hori erabiliko dugu [()]{.verbatim} parentesiekin batera.

:::::::::::::: {.columns }
::: {.column width="47%"}

::: {.mycode}
[Funtzioa sortu]{.title}
```javascript
function saludar() {
    console.log("Hola.");
}
```
:::

:::
::: {.column width="47%" }

::: {.mycode}
[Funtzioari deitu]{.title}
```javascript
saludar();
saludar();
```
:::

:::
::::::::::::::

::: infobox
[function]{.verbatim} bidez deklaratutako funtzioak kodean agertu aurretik ere erabil daitezke.
:::



## Parametroak {#parámetros}

Askotan, funtzio batek datu desberdinekin lan egin behar du exekutatzen den bakoitzean, eta horretarako **parametroak** erabiltzen dira. Parametro bat funtzioari deitzean balio bat jasotzen duen aldagaia da. Funtzio batek hainbat parametro jaso ditzake.

:::::::::::::: {.columns }
::: {.column width="47%"}

::: {.mycode size=footnotesize}
[Funtzioa sortu]{.title}
```javascript
function saludar(nombre) {
    console.log(`Hola ${nombre}`);
}
```
:::

:::
::: {.column width="47%" }

::: {.mycode}
[Funtzioari deitu]{.title}
```javascript
saludar("Ann");
saludar("Bob");
```
:::

:::
::::::::::::::

Nahiz eta ohikoa den "parametroa" eta "argumentua" sinonimotzat erabiltzea, bada [alde txiki bat](https://es.wikipedia.org/wiki/Argumento_(inform%C3%A1tica)):

- **Parametroa:** funtzioan definitutako aldagaia.
- **Argumentua:** funtzioari deitzean pasatzen zaion balioa.


### Balio lehenetsia  {#valor-por-defecto}

ECMAScript 2015etik aurrera, parametroei balio lehenetsia esleitzea posible da. Horrela, funtzioari deitu diezaiokegu parametroa gehituz edo gehitu gabe.


:::::::::::::: {.columns }
::: {.column width="47%"}

::: {.mycode size=footnotesize}
[Funtzioa sortu]{.title}
```javascript
function saludar(nombre="Usuario") {
    console.log(`Hola ${nombre}`);
}
```
:::

:::
::: {.column width="47%" }

::: {.mycode}
[Funtzioari deitu]{.title}
```javascript
saludar();
saludar("Alice");
```
:::

:::
::::::::::::::

::: exercisebox
[[11a](https://github.com/yuki/ejercicios/blob/main/daw/dec/11a.html)]{.solution}

Sortu balio lehenetsia duen funtzio baten adibidea.
:::


### Argumentuak pasatzea {#paso-argumentos}

Beste programazio-lengoaia batzuetan, funtzio bat deklaratzean, parametro kopuru berarekin deitu behar dugu. Halaber, normalean funtzio-identifikatzaile bera parametro desberdinekin erabiltzeko aukera ematen dute; horri [funtzioen gainkarga](https://es.wikipedia.org/wiki/Sobrecarga_(inform%C3%A1tica)) esaten zaio. JavaScript-en ez da horrelakorik gertatzen, ez baitu behartzen parametroen kopuru bera duten argumentuak zehazki ematera. Hau abantailatzat har daiteke, baina kontuz ibili behar da.


:::::::::::::: {.columns }
::: {.column width="47%"}

::: {.mycode}
[Funtzioa sortu]{.title}
```javascript
function sumar(a, b) {
    console.log(a+b);
}
```
:::

:::
::: {.column width="47%" }

::: {.mycode}
[Funtzioari deitu]{.title}
```javascript
sumar(4);
```
:::

:::
::::::::::::::

Bigarren parametroak, argumenturik pasatu ez zaionez, [undefined]{.verbatim} balioa izango du. Horregatik, komeni da beharrezkoa denean parametro lehenetsiak erabiltzea edo funtzioa sortzean hori kontuan hartzea.

::: exercisebox
[[11b](https://github.com/yuki/ejercicios/blob/main/daw/dec/11b.html)]{.solution}

Sortu parametroak dituen funtzio baten adibidea.
:::


## Itzulera-balioa {#valor-retorno}

Funtzio askok ez dute zeregin bat bakarrik egiten, emaitza bat ere sortzen dute. Horretarako, [return]{.verbatim} hitz erreserbatua erabiltzen da emaitza itzultzeko.

:::::::::::::: {.columns }
::: {.column width="47%"}

::: {.mycode}
[Funtzioa sortu]{.title}
```javascript
function sumar(a, b) {
    return a + b;
}
```
:::

:::
::: {.column width="47%" }

::: {.mycode}
[Funtzioari deitu]{.title}
```javascript
let resultado = sumar(4,6);
console.log(resultado);
```
:::

:::
::::::::::::::

Funtzio batek [return]{.verbatim} ez badu, lehenespenez itzultzen duen balioa [undefined]{.verbatim} da.


::: errorbox
[return]{.verbatim} exekutatzen denean, funtzioa amaitu egiten da. [return]{.verbatim} ez badago, lehenespenez [undefined]{.verbatim} itzultzen du.
:::

::: exercisebox
[[11c](https://github.com/yuki/ejercicios/blob/main/daw/dec/11c.html)]{.solution}

Sortu itzulera-balioa duen funtzio baten adibidea.
:::


## Funtzio anonimoak eta gezi-funtzioak (*arrow functions*) {#arrow-functions}

JavaScript modernoak **funtzio anonimoak** sortzeko sintaxi bat du, izenik/identifikatzailerik ez duten funtzioak definitzeko modu trinkoagoa eskaintzen duena. Funtzio anonimoak sortzeko beste modu bat "gezi-funtzioak" (*arrow functions*) deritzenak dira.

Funtzio anonimoak erabiltzen dira haien kodea berrerabiltzea beharrezkoa ez denean, balioak zuzenean aldagai bati esleitzeko, beste funtzio bati argumentu gisa pasatzeko edo funtzio batetik itzultzeko.

Jarraian, funtzio anonimoen hainbat adibide eta erabil daitekeen sintaxia ikus daitezke.

:::::::::::::: {.columns }
::: {.column width="47%"}

::: {.mycode size=footnotesize}
[Funtzio anonimoa]{.title}
```javascript
const m = function(x, y){
  return x * y;
};
```
:::

:::
::: {.column width="47%" }

::: {.mycode size=footnotesize}
[Gezi-funtzioa]{.title}
```javascript
const m = (x, y) => {
    return x * y;
}
```
:::

:::
::::::::::::::

:::::::::::::: {.columns }
::: {.column width="47%"}

::: {.mycode size=footnotesize}
[Gezi-funtzioa]{.title}
```javascript
const m = (x, y) => x * y;
```
:::

:::
::: {.column width="47%" }

::: {.mycode size=footnotesize}
[Gezi-funtzioa]{.title}
```javascript
const m = () => "Hola!";
```
:::

:::
::::::::::::::


::: exercisebox
[[11d](https://github.com/yuki/ejercicios/blob/main/daw/dec/11d.html)]{.solution}

Sortu funtzio anonimoen eta gezi-funtzioen hainbat adibide.
:::


<!-- 


# 4.7 Clausuras (Closures)

Una **clausura** (*closure*) aparece cuando una función recuerda las variables del entorno donde fue creada.

Ejemplo:

```javascript
function crearContador() {

    let contador = 0;

    return function () {

        contador++;

        return contador;

    };

}

const contar = crearContador();

console.log(contar());

console.log(contar());

console.log(contar());
```

Salida:

```
1

2

3
```

Aunque la función `crearContador()` ya ha terminado, la función interna sigue teniendo acceso a la variable `contador`.

Las clausuras constituyen una característica muy potente del lenguaje y se utilizan frecuentemente en bibliotecas y frameworks.

---

# 4.8 Funciones de orden superior

Una función de orden superior es aquella que:

- Recibe otra función como argumento.
- Devuelve una función como resultado.
- O ambas cosas.

Por ejemplo:

```javascript
function ejecutar(funcion) {

    funcion();

}

ejecutar(() => {

    console.log("Hola");

});
```

Este tipo de funciones resulta fundamental en JavaScript moderno.

---

# 4.9 Callbacks

Un **callback** es una función que se pasa como argumento a otra función para que sea ejecutada posteriormente.

Ejemplo:

```javascript
function procesar(callback) {

    console.log("Inicio");

    callback();

    console.log("Fin");

}

procesar(() => {

    console.log("Procesando...");

});
```

Salida:

```
Inicio

Procesando...

Fin
```

Los callbacks aparecen constantemente al trabajar con eventos, temporizadores, peticiones HTTP y programación asíncrona.

En unidades posteriores volveremos a estudiarlos con mucho más detalle.


 -->




