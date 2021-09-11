################################################################################
### ANALISIS DESCRIPTIVO APLICACION CON RSTUDIO
################################################################################

################################################################################
### 1.1.Definir carpeta de trabajo
################################################################################

getwd()  #Devuelve el directorio("la ruta")desde donde R esta trabajando en la sesi�n actual
setwd("../../") 
getwd()
setwd("datos/clase_1") 
getwd()

################################################################################
### 1.2.Instalar y cargar paquetes ("librerias")
################################################################################

install.packages("tidyverse") #Instala el paquete, se hace solo una vez
library(tidyverse) #cargar el paquete para que este disponible

################################################################################
### 1.3.Cargar los datos
################################################################################

### 1.3.1. Datasets de base de R
paquetes <- library(help = "datasets")
head(paquetes$info[[2]])

### 1.3.2. importar datos desde Excel
install.packages("readxl")
library(readxl) 
           
d2<-read_excel("ejemplo2.xlsx", sheet=1)# carga hoja1 del libro de excel
d2
View(d2) #vista de los datos
dim(d2)  #dimension

d3 <- read_excel("ejemplo2.xlsx", sheet=2 )
d3
View(d3)
dim(d3)

### 1.3.3. importar datos en formato csv (comma separated values)
install.packages("readr")
library(readr)             
d1<-read.table(file ="ejemplo1.csv", header=T,sep=",")
d1
View(d1) #vista de los datos
dim (d1) #dimensi�n
head(d1) #muestra las variables y primeros registros

################################################################################
### 1.4.Tratamiento de datos faltantes o ausentes (missings) 
################################################################################

##missings
x<- c(3,NA,6,2,4,6,NA,1)
x
any(is.na(x))     #nos indica si hay missings
is.na(x)          #identifica la ubicacion de los missings
sum(is.na(x))     #cuenta el n�mero de missing
mean(x)
mean(x,na.rm =T)  #calcula la funcion sin los missings

##missing en un conjunto de datos
d4 <- read_excel("ejemplo3.xlsx", sheet=1)
d4
str(d4)            #Descripci�n del tipo de datos
any(is.na(d4))     #nos indica si hay missings
sum(is.na(d4))     #cuenta el n�mero de missing
is.na(d4)          #ubicacion de los missings
complete.cases(d4) #indica cuales filas estan completas
mean(d4$peso)
mean(d4$peso,na.rm = TRUE)   #calcula la funcion sin los missings 
mean(na.omit(d4$peso))       #omite los missing

################################################################################
## 1.5.Funciones b�sicas de estad�stica
################################################################################
x<-c(3.3, 3.2, 1.7, 2.3, 4.5, 2.6)
min(x)               #minimo
max(x)               #m�ximo
which.min(x)         #posici�n del minimo
which.max(x)         #posici�n del m�ximo
which( x == 3.2 )
which( x > 3 )
sum(x)
mean(x)
sd(x)
sort(x)
order(x)
rank(x)

################################################################################
### 1.6.Preparaci�n de los datos
################################################################################

###1.6.1.Cargar archivo Bajo peso al nacer
Bajopeso<-read.csv(file ="Bajopeso.csv", header=T)
Bajopeso
str(Bajopeso)

###1.6.2.Exploracion del contenido de los datos
class(Bajopeso)         #clase de objeto
typeof(Bajopeso)        #tipo de objeto
str(Bajopeso)           #tipo de variables(character,numeric,integer,complex,logical)
dim(Bajopeso)           #dimension
names(Bajopeso)         #nombre de las variables
head(Bajopeso)          #primeros elementos
tail(Bajopeso)          #encabezado �ltimos elementos
summary(Bajopeso)       #resumen las principales estaditicas de las variables
any(is.na(Bajopeso))    #presencia de missings
mean(Bajopeso$peso,na.rm = TRUE)
nrow(Bajopeso)          #numero de filas
nrow(na.omit(Bajopeso)) #selecciona solo las filas con informacion

###1.6.3.Indicar que las variables son categ�ricas
###funcion factor ()
Bajopeso$bajo_pes <- factor(Bajopeso$bajo_pes)
Bajopeso$raza     <- factor(Bajopeso$raza)
Bajopeso$fumador  <- factor(Bajopeso$fumador)
Bajopeso$part_pre <- factor(Bajopeso$part_pre)
Bajopeso$hta      <- factor(Bajopeso$hta)
Bajopeso$niveledu <- factor(Bajopeso$niveledu)
Bajopeso$diabetes <- factor(Bajopeso$diabetes)

###1.6.4.colocar etiquetas a las variables categ�ricas
### funcion levels()
levels(Bajopeso$bajo_pes) <- c("Normal","Bajo Peso")
levels(Bajopeso$raza)     <- c("Mestizo","Blanco","Afro")
levels(Bajopeso$fumador)  <- c("si","no")
levels(Bajopeso$part_pre) <- c("pretermino","a termino","termino tardio","postermino")
levels(Bajopeso$niveledu) <- c("primaria" ,"secundaria","universitaria","postgrado","tecnico","ninguna")

###1.6.5.Llamar una variable
Bajopeso$bajo_pes
Bajopeso$raza
Bajopeso$niveledu


################################################################################
### 1.7.Estadistica Descriptiva
################################################################################

################################################################################
###1.7.1.Descripcion de una variable categorica
###############################################################################

###Calcular frecuencias absolutas 
tabla1<-table(Bajopeso$fumador)  
tabla1
tabla2<-table(Bajopeso$bajo_pes)
tabla2
tabla<-table(Bajopeso$niveledu)
tabla

###Calcular frecuencias relativas
proporciones<-prop.table(tabla1)   
proporciones
proporciones2<-prop.table(tabla2)   
proporciones2

###Calcular Proporciones
Porcentajes<-proporciones*100
Porcentajes
Porcentajes2<-proporciones2*100
Porcentajes2

## redondear
round(Porcentajes, dig=2)
round(Porcentajes2, dig=2)

###############################################################################
###1.7.1.1. graficos de base
###############################################################################

### grafico de sectores 
dev.new()              ##Abrir una nueva ventana gr�fica
pie(Porcentajes, main="Madres fumadoras")

 
### nivel educativo
Edu<-table(Bajopeso$niveledu)
Edu
pc=round(Edu/sum(tablaedu)*100, dig=2)
pc
dev.new() 
levels(Bajopeso$niveledu)=paste(levels(Bajopeso$niveledu),"%", sep=" ")
pie(Edu,main="Nivel educativo de la madre", col=c("blue","purple","green","pink","gray","red"))

### grafico de barras
dev.new() 
barplot (Edu)
dev.new() 
barplot(Edu, main="Peso al nacimiento", col=c("blue","purple","green","pink","gray","red"))
legend("topright", c("primaria" ,"secundaria","universitaria","postgrado","t�cnico","ninguna"),
       lty = 1, lwd = 2, col=c("blue","purple","green","pink","gray","red"), bty = "n", cex = 0.8)

################################################################################
###1.7.2.Descripcion de una variable cuantitativa
###############################################################################

### verificar si hay missing
any(is.na(Bajopeso$edad))     #nosindica si hay missings

####Calcular las Medidas Resumen

##medidas de tendencia central
mean(Bajopeso$edad)     ##Media
median(Bajopeso$edad)   ##Mediana

##medidas de dispersion
var(Bajopeso$edad)      ##varianza
sd(Bajopeso$edad)       ##Desviacion eStandar
min(Bajopeso$edad)      ##Minimo
max(Bajopeso$edad)      ##Maximo
range(Bajopeso$edad)    ##Rango

((sd(Bajopeso$edad)/mean(Bajopeso$edad))*100) ##coeficiente de variacion

##medidas de localizacion
quantile(Bajopeso$edad) ##Cuartiles
IQR(Bajopeso$edad)      ##Rango Intercuartilico

##Resumen medidas descriptivas
summary(Bajopeso$edad)    ##Resumen principales Medidas descriptivas
install.packages("Hmisc")
library(Hmisc) 
describe(Bajopeso)        ##Resumen de las variables Medidas descriptivas

####Medidas Resumen por Grupos
pesof<- Bajopeso$bajo_pes
tapply(Bajopeso$edad,pesof, summary)


###############################################################################
###Recodificar variables
install.packages("car")
library(car) #instalar la libreria car

Bajopeso$edad.rec <- recode(Bajopeso$edad,"14:19='14 a 19';20:30='20 a 30';30:35='30 a 35';36:45='35 a 45'")
Bajopeso$edad.rec <- as.factor(Bajopeso$edad.rec)
Bajopeso$edad.rec
table(Bajopeso$edad.rec)


###############################################################################
###1.7.2.1. graficos de base
###############################################################################

##Boxplot univariado
dev.new() 
boxplot(Bajopeso$edad, horizontal = TRUE)
stripchart(Bajopeso$edad,method = "jitter", pch = 19, add = TRUE, col = "blue")


##Boxplot por grupos
dev.new() 
boxplot(Bajopeso$edad,col="green", main="boxplot edad de la madre",xlab="Edad",ylab="Frecuencia")
Bajopeso$bajo_pes
pesof<-factor(Bajopeso$bajo_pes)
levels(pesof)<- c("Normal","Bajo Peso")
boxplot(edad ~ pesof, data = Bajopeso,col=c("deeppink","darkturquoise"),labels=levels(pesof), main="Boxplot edad de la madre por peso al nacer", ylab="Edad", xlab="Peso al nacer")


##Histograma
dev.new() 
hist(Bajopeso$edad, col='orange', breaks=40, 
     ylab = "Frecuencia", xlab="Edad",main = "histograma edad de la madre")

##Histograma con curva
dev.new() 
hist(Bajopeso$edad,col="red", breaks=40, main="histograma edad de la madre",xlab="Edad", freq = F, xlim = c(10, 50))
lines(density(Bajopeso$edad))


##Gr�fico de dispersi�n (Relaci�n entre variables)
dev.new() 
plot(Bajopeso$edad,Bajopeso$pesom, main="Grafico edad vs peso de la madre",xlab="Edad",ylab="Peso de la madre", col="blue",cex=1 )


##FUNCION mfrow() Gr�ficos simult�neos
dev.new()
par(mfrow=c(2,2))
plot(Bajopeso$edad,Bajopeso$pesom, main="Grafico edad vs peso de la madre",xlab="Edad",ylab="Peso de la madre", col="blue",cex=1 )
hist(Bajopeso$edad,main="Histograma edad de la madre",xlab="Edad",ylab="frecuencia")
hist(Bajopeso$pesom,main="Histograma peso",xlab="Peso",ylab="frecuencia")
boxplot(Bajopeso$edad,main="Edad de la madre")




