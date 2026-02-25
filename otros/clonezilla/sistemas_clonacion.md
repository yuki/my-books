
# Clonación de discos {#clonación-discos}

La **clonación de discos** es el proceso mediante el cual se realiza una copia exacta de un disco duro o de una partición, incluyendo:

- Estructura de particiones
- Sistema operativo
- Programas instalados
- Configuraciones
- Archivos y datos

La clonación puede realizarse:

- **De disco a disco (copia directa)**:
  - Se copia un disco completo a otro disco.
  - El disco de destino tiene que ser al menos del mismo tamaño que el original
  - El disco destino queda listo para usarse inmediatamente.
  - Requiere que ambos discos estén conectados al mismo tiempo.
  - No genera un archivo intermedio.
  - Se puede hacer en un mismo equipo aprovechando la velocidad interna de los discos sin cuellos de botella, o de un disco duro a otro conectado por USB.
- **De disco a imagen**: 
  - Se genera un archivo para poder realizar la restauración más tarde.
  - Ese archivo puede almacenarse en otro dispositivo (USB, NAS, servidor).
  - Se pueden generar distintos archivos a lo largo del tiempo para guardar cómo ha evolucionado el sistema original.


## Usos principales de la clonación de discos {#usos-principales-clonación}

La clonación es muy utilizada en entornos domésticos y empresariales. Sus principales usos son:

- Permite recuperar rápidamente un sistema completo ante fallos graves.
- Cambiar de un de disco duro a otro:
  - Por cambio de tipo (de HDD a NVMe).
  - Sustitución de disco antiguo por uno nuevo.
  - Ampliación de capacidad de almacenamiento (y ahorrar el tiempo de reinstalación/configuración del sistema).
- En entornos con empresariales:
  - Se configura un equipo modelo.
  - Se clona en múltiples ordenadores.
  - Ahorra tiempo en instalaciones repetitivas.

Aunque los sistemas de clonación pueden ayudar a tener una copia de seguridad de un sistema completo, es conveniente que no sea el único y esté acompañado de otras herramientas.

::: warnbox
Los sistemas de clonación de discos pueden ayudar a tener una copia de seguridad completo, pero no debería ser el único sistema.
:::


# Herramientas de clonación {#herramientas-clonación}

Existen múltiples herramientas para realizar clonación e imágenes de disco. Entre las más conocidas podemos destacar:

- [Clonezilla](https://clonezilla.org/)
- [Partclone](https://partclone.org/)
- [dd](https://en.wikipedia.org/wiki/Dd_%28Unix%29)
- [Acronois True Image](https://es.wikipedia.org/wiki/Acronis_True_Image)

Hay muchas más, algunas siendo de pago, con más opciones que otras... pero en este documento nos vamos a centrar en Clonezilla que es Software Libre.


# Pasos post-clonación {#pasos-post-clonación}

Tras realizar la clonación de un sistema quizá sea necesario realizar alguna modificación, que dependerá del tipo de equipo del que se haya realizado el clon. Por ejemplo:

- **Cambiar el nombre de equipo**: dentro de una red no debería haber nunca dos equipos con el mismo *hostname* para evitar problemas.
- **Cambiar la dirección IP**: si es un equipo de usuario la dirección no estará configurada de manera estática, pero habría que comprobarlo.
- **Crear usuarios / meter equipo en dominio**: quizá sea necesario crear usuarios o si es un Windows en una red empresarial, meterlo en dominio.
  - En este caso, antes habrá que ejecutar [Sysprep](#sysprep---preparando-nuestro-sistema).


