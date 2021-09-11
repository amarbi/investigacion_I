
# Definiendo el directorio de trabajo en R


El comando que se utiliza para definir el directorio de trabajo es: **setwd()** (en ingles: set working directory -> setwd ). 

Se puede utilizar de dos maneras:


1) Definiendo una ruta ABSOLUTA, por ejemplo:

* setwd("/home/bibiana/datos/clase_1")


*Notese que la ruta absoluta empieza con "/" indicando que es el directorio RAIZ*


2) Tambien se puede utilizar definiendo una ruta RELATIVA al directorio actual, por ejemplo:

Si necesitamos ir al directorio "/home/bibiana/datos/clase_1"


* primero averiguamos en que directorio nos encontramos (directorio actual), con el comando: getwd()


A. Ejemplo 1

Supongamos estamos en el directorio "/home/bibiana/"

Entonces podemos cambiar el directorio de forma relativa a "/home/bibiana" así:

setwd("datos/clase_1")

*Notese que en este caso la ruta relativa comienza sin "/"*


B. Ejemplo 2


Supongamos estamos en el directorio "/home/bibiana/scripts/clase_1"

Entonces podemos cambiar el directorio de forma relativa a "/home/bibiana/scripts/clase_1" así:

setwd("../../datos/clase_1")

Notese que el símbolo "../" retrocede un nivel en el directorio actual, como aquí lo ponemos dos veces "../../", significa que nos salimos de los directorios "scripts/clase_1", quedando ubicados en el directorio "/home/bibiana/" y a partir de ahí, vamos al directorio "datos/clase_1"





