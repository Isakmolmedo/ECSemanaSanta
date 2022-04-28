# Cheat Sheet

# Regla de reciclaje.

# En general, R siempre va a intentar aplicar lo que le pidamos como
# buenamente pueda. Es decir, por ejemplo si faltan elementos en un vector,
# o se le aplica una función escalar a un vector,
# se aplicará al resto de dimensiones volviendo a usar los valores
# existentes.

# Concatenación de cadenas con string.

# paste(string,string,sep)
paste(c("X", "Y"), 1:10, sep = "")
# lo que hace es pegar los vectores ("X","Y") con el (1,...,10)
# por tanto aplica la regla de reciclaje y los junta ya que ponemos
# sep="".

# Familia de funciones is.()
is.na(3)
is.integer(3)
is.numeric(3)

# as.() transforma nuestar función.
as.numeric("3")
as.factor(3)

# Comparación de números en coma flotante.
# Se salta los problemas de redondeo de números en coma flotante.
# Por ejemplo,
all.equal(0.3 - 0.2, 0.1) == TRUE
0.3 - 0.2 == 0.1
all.equal(sqrt(3)^2, 3) == TRUE

# str nos da la estructura interna
# de un objeto de R.
help(str)
str(3)
str(c(2, "3"))
# summary nos da resumen de datos.
help(summary)
summary(factor(3))

# Loggin y debugging.

# Mostrar las variables definidas en el entorno.
ls()
# Mensajes
stop("hola")
warning("hola que tal")
message("buenas tardes")
# traza, tras una ejecución fallida, vemos lo que hace.
traceback()
# punto de ruptura, (breakpoint)
browser()
# Q salimos del debuggeo.

# Debug
debug(scale)
undebug()

f <- function(x) {
    n <- round(x)
    set.seed(n)
    u <- runif(n)
    return(u)
}
debug(f)
mean(f(2))
undebug(f)

f <- function(x) {
    browser()
    n <- round(x)
    set.seed(n)
    u <- runif(n)
    return(u)
}
mean(f(-2))
help(var)
# Distribuciones estadísticas, aleatoriedad y otros conceptos similares.
# media
mean(c(2, 2))
# cuasivarianza
var(c(2, 2))
# cuasi-desviación típica.
sd(c(2, 2))
# distribuciones
# rnorm(n,mean=0,sd=1)
rnorm(3, mean = 2, sd = 3)
# runif(n,min,max)
runif(3, 1, 8)
# Dibujar funciones: plot, abline, contour.
cuadrado <- function(x) x^2
plot(-3, 4)
help(plot)
# Redondeo; trunc, floor, ceiling
help(trunc)
help(floor)
help(ceiling)
# Gamma.
gamma(3)
# Tomar muestras.
# sample(contenedor,elementos,replace=TRUE/FALSE)
sample(c(2, 3, 4, 5, 7, 5, 4, 2, 4, 34, 6, 23, 2), 5, replace = TRUE)

# Familia apply y otras funciones similares.
# lapply; devuelve una lista aplicando la función de ahí la l.
# lapply(contenedor,función a aplicar)
lapply(c(2, 3, 4, 5), sqrt)
# sapply:simplifica el retorno.
# sapply(contenedor,función a aplicar)
sapply(c(2, 3, 4, 5), sqrt)
# apply, tiene el argumento MARGIN que controla la dimensión a la que
# se le aplica la función.
# apply(contenedor,MARGIN,función,...,simplify=TRUE)
apply(c(2, 3, 4, 5), 3, sqrt)
help(apply) # DUDA
# split, sirve para clasificar.
# split(contenedor,criterio)
split(Orange, Orange$Tree)
# y nos lo divide
# aggregate. Resume las columnas de un data frame para cada uno
# de los niveles de un vactor.
# aggregate(df$variable, by = list(df$factor),summary)
help(aggregate)
aggregate(Orange$Tree, by = list(Orange$age), summary)
# tapply igual que aggregate.
tapply(Orange$age, Orange$Tree, summary)
# producto.
prod(c(3, 3))
cumprod(c(3, 3))
# sumatoria.
sum(c(3, 3))
cumsum(c(3, 3))
# Particularidades de R.
# Crear un factor.
# v.factores<-factor(array de valres)
a <- c(1, 2, 3, 2, 1, 3, 2)
factor(a, labels = c("PEPE", "MARIO", "JOAQUIN"))
# niveles levels()
# Lectura de ficheros.
# directorio de trabajo.
getwd()
# setwd("path/al/directorio")
# leer tabla o data.frame
# read.table()
help(read.table)
# as.is o stringAsFactors para leerlas como factores.
# si el fichero incluye los nombres de las columnas, podemos hacer
# header=TRUE, se especifica el separador con sep="," col.names
# y row.names.

# Leer cosas más genéricas.
# scan() podemos escribir en el script lo que va a leer, por
# defecto separapor espacios en blanco:(''). Para saltarse headers,
# se pasa el argumetno skip=1.

# cargar datos de un paquete.
# data(dataset,package="nombre_del_paquete")

# Escribir a ficheros.
# write.table("path/al/archivo") write
write.table(cars[1:10, ], file = "datos1.txt")
datos1 <- read.table("datos1.txt", header = TRUE)
datos1

# funciones.
# Declaración de una función.
# f<-funcion(parámetros){expresión}
# class(f)="function"

# Comprobar argumentos de una función.
# formals(función)
formals(f)

# Cuerpo de una función.
body(f)
# body función.

# funciones anónimas.
# es como la creación de una función normal y corriente
# pero sin asignárselo a un objeto.

# número variable de argumentos en una función.
# function(parámetros,obligatorios,...)

# argumentos omitidos.
# missing(argumento), especialmente útil cuando se cita directamnete
# los parámetros de una función.
# f(x=1,y=2,w=4) => missing(z)
formals(paste)
paste("uno", "dos", "tres", sep = "+") # tiene varios argumentos.

# Bucles.
# for(variable in rango){} Habitualmente for(i in min:max) o
# for (x in contenedor)

# while (cond){expre}

# salida temprana break

# Flujo de control.
# condicional
# if(cond){expr} else if
# (cond) {expr} else{}

# condicional vectorizado.
# ifelse(condición,valor verdadero, valor falso)
# switch
# switch(variable,posible_valor1=retorno,posible_valor2=retorno)

# Operadores.
# Aritméticas. + - * / ^
# Módulos %%
# División entera %/%
# Lógicas !,&,&&,|,||,xor(x,y)
# Los operadores dobles lo revisan todo del tirón, mientras que los simples funcionan
# vectorialmente elemento a elemento.

# Dataframes
# Constructor. data.frame(columna1,columna2,...)
# Acceso a elementos
# df[v] como lista: selecciona columnas.
# df[v1,v2] como matriz: selecciona elementos.
# Filtrado.
# df[condición]
# subset(df,condición)
# Ojo, condición es una expresión LÓGICA indicando lo que se quiere
# tomar. Se puede combinar de varias formas como.
# df[1:2,c("edad","estudios")]

# Primeros elementos. head(df)
# Últimos elementos. tail(df)

# Transformaciones.
# transform(df,expresión1,expresión2,...)
# Añade las filas calculadas por las expresiones daas como.
transform(mtcars, wt = wt / 2) # aquí transforma una columna.
transform(mtcars, columna_nueva = wt / 2) # aquí la añade.
# Añadir columnas.
# within(df,z<-expr)
# Añade la columna de nombre z calculada por la expresión.
# Se pueden añadir varias columnas metiéndole en un bloque

# Matrices

# multiplicación elemento a elemento *
# multiplicación matricial %*%
# traspuesta t(matriz)
# Inversa solve(A)
A <- matrix(c(1, 2, 3, 4, 5, 6), 2, 3)
A
# Resolución de sistemas solve(A,b)

# Suma de filas y columnas. rowSums(), colSums()

# Obtener las diagonales de una matriz.
# split(matriz,col(matriz)-+row(matriz))
# diag(matriz)
# Unir filas o columnas rbind, cbind.


# Vectores y listas.

# Longitud length(v)
# Resizing length(v)<- valor
# Filtrar elementos.
# x[condición]
v <- c(1, 2, 3, 4, 5)
v[v > 3]
# Obtener índices de elementos que cumplen una condición.

# which(condición sobre x)
# Da los índices para los cuales la condición es cierta.
# Ejemplos: which(LETTERS == "R")
which(LETTERS == "R")
which((1:12) %% 2 == 0)
which(ll <- c(TRUE, FALSE, TRUE, NA, FALSE, FALSE, TRUE))
order(LETTERS) # Índices ordenados.
help(order)
# Vector ordenado.
sort(A)
# Atributos.
mode(A)
typeof(A)
# Eliminar elemento en una cierta posición.
# x[-indice(s)]
# x[-c(2,3)] nos devuelve el vector sin las posiciones 2 y 3

# Acceso a elementos de una lista.
# lista[[1]]
# lista$nombre_objeto
# lista[['nombre_objeto']]
lista <- list(c(1, 23, 4), "HOLA")
lista
class(lista[[1]])
class(lista[1])
lista[1]

# Crear una nueva componente para una lista.
# lista$componente<-objeto lista[[indice]]<-objeto
lista[[3]] <- "BUENAS"
lista
# hemos creado una nueva.

# Estructura de datos.
# Secuencias
# n:m, seq(from,to,by), rep.
1:19
seq(1, 15, by = 2)
rep(3, 4)
# Vectores c(valor1,valor2) vector(type,length)
c(2, 3)
vector("logical", 3) == c(FALSE, FALSE, FALSE)
# Matrices.
# matrix(data,nrow,ncol)
# listas
# list() list(nombre_1= objeto_1,nombre_2=objeto_2 ...)
lista2 <- list(elemento1 = c(2, 3, 3, 3, 3), elemento2 = "HOLA")
lista2