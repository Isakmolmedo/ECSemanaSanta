# Tema 2.
exp(2 - 3 * pi) # observamos que R mientras falten paréntesis
# no ejecutará la función.
help()
example(mean) # esta función es muy útil
# ya que nos da un ejemplo de cómo usar la función.

# observamos que la forma de generar un vector de una distribución normal,
# es a través del comando rnorm.
x <- rnorm(50)
y <- rnorm(50, mean = 10, sd = 2) # aquí seleccionamos la varianza y media deseadas.
x
y
summary(x)
summary(y)
# este es muy útil a la hora de ver el mínimo, máximo etc.
summary(x)[1]
hist(x) # representamos un histograma.
plot(x, y)
fit <- lm(y ~ x)
summary(fit)
abline(fit) # con esto dibujamos la línea sobre el gráfico anterior.
x <- 1:10
y <- seq(-pi, pi, length.out = 10)
y
cbind(x, y)
# fíjate como los pone en columnas, gracias a la c antes de bind.
matrix(x, 2, 5) # 2 filas 5 columnas.
f <- outer(x, y, function(x, y) cos(y) / (1 + x^2))
help(outer)
# ha creado una matriz con filas y columnas indexadas por x e y con los valores cos(y)/(1+x^2)-
contour(x, y, f)
image(x, y, f)
demo(graphics)
demo(persp)
getwd()
setwd("C:/Users/Isaac/OneDrive/r_docs")
setwd("C:/Users/Isaac/OneDrive")
install.packages("maxLik")
library(maxLik)
help(maxLik)
detach(package:maxLik)
exp(2 - 3 * pi)
x <- exp(2 - 3 * pi)
x
x <- 5
y <- 2 * x
z <- log(y)
k <- x * y * z
ls()
rm(x, y)
ls() # hemos borrado los elementos x e y.
rm(list = ls())
ls()
matrix(data = pi, nrow = 1, ncol = 3)
matrix(pi, 1, 3)
matrix(data = pi, ncol = 3)
matrix(pi, , 3)
help(Logical)
help(logical)
10 > 2
10 > 2 | 3 <= 1
floor(1.5) == 1
floor(1.5)
x <- sqrt(3)
x^2 == 3
x^2 - 3
0.3 - 0.2 == 0.1
0.3 - 0.2
all.equal(0.3 - 0.2, 0.1)
all.equal(x^2, 3)
help(all.equal)
1 + 10^{
    -15
} == 1
1 + 10^{
    -17
} == 1
Inf - Inf
2 * Inf

# Vectores.
x <- c(1, 2, 3, 4, 5)
x
y <- c(-1, 0, x, 6)
y
z <- c("uno", "dos")
z
k <- c(x, z)
k
# convierte todos los datos en tipo character.
names(x) <- c("x1", "x2", "x3", "x4", "x5")
x
# asigna nombre a cada elemento de x.
x <- 1:5
x
y <- -1:6
y
seq(1, 10)
seq(10)
seq(1, 10, by = 2)
# hemos fijado el paso.
seq(1, 10, length.out = 15)
seq(-5, 5)
rep(1, 3)
x <- 10:12
rep(x, each = 2)
# observamos que repite cada elemento 2 veces.
rep(1:4, each = 2, times = 3)
vector("numeric", 2)
vector("logical", 2)
vector("character", 2)
x <- -5:5
x
temp1 <- x > 0
temp1
temp2 <- x > 0 & x <= 3
temp2
nombres <- paste(c("X", "Y"), 1:10, sep = "")
nombres
# notese que ha repetido el vector X, Y hasta que
# tenga las posiciones deseadas y con el separador ""
nth <- paste0(1:10, c("st", "nd", "rd", rep("th", 7)))
nth
letters[1:10]
LETTERS[1:10]
month.name[1:4]
x <- seq(0, 1, length.out = 10)
x
x[2]
x[c(2, 4)]
x[1:2]
x[seq(1, 10, by = 2)]
x[c(2, 2)]
x[-c(2, 5)] # muestra el vector con los elementos 2 y 5 sustraídos.
x <- -5:5
x[x > 0]
x[x > 0 & x <= 3]
peso <- c(60, 75, 56, 70)
sexo <- c("F", "M", "F", "M")
peso[sexo == "F"]
names(peso) <- c("Marta", "Jose", "Paula", "Paco")
peso[c("Marta", "Paula")]
x <- c(1:8, NA, 10)
is.na(x)
mean(x)
mean(x, na.rm = TRUE) # na.rm nos permite ignorar el dato faltante.
is.na(x) <- c(2, 3)
x
x[is.na(x)] <- 0 # muy útil  ya que sustituye los NA del vector por 0's.
x
x <- c("a", "b", NA, "c", "NA")
is.na(x)
0 / 0
Inf / Inf
x <- c(NaN, 1:4, NA)
is.na(x)
# Observamos como es TRUE para los NA y los NaN.
is.nan(x)
x[is.nan(x)] <- NA
x
x <- 1:5
y <- seq(0, 1, length.out = 5)
x + y
x * y
exp(x) + log(1 + y)
x^2
z <- c(-2, -1)
x + z # Aquí usa la regla de reciclaje.
# evaluación de funciones a trozos.
x <- (1:10) / 10
(x < 0.3) * (2 * x) + (0.3 <= x & x < 0.7) * x^2 + (x >= 0.7) * 2
x <- c(2, 3, 5, 10, 6, 1)
cumsum(x)
prod(x)
cumprod(x)
max(x)
which.max(x) # nos da la posición
x[which.min(x)]
sort(x) # lo reordena.
order(x) # nos da las posiciones que deberían llevar cada elemento.
x[order(x)]

set.seed(1)
x <- runif(100)
mx <- mean(x)
which(abs(x - mx) == min(abs(x - mx)))
which.min(abs(x - mx))
which.min(x - mx > 0)
x <- 1:5
mode(x)
typeof(x)
length(x)
y <- x > 2
mode(y)
typeof(y)
z <- letters[5]
mode(z)
typeof(z)
x <- numeric()
length(x)
x[3] <- 3
x
x <- 1:10
x <- x[3 * (1:3)]
x

x <- numeric()
length(x) <- 3
x
y <- 1:5
length(y) <- 10
y
length(y) <- 3
y

# Factores.
# útiles para clasificación y agrupación de datos.
# son variables ordinales con número fijo de posibles valores (levels)
civil <- c(
    "soltero/a", "viudo/a", "casado/a", "soltero/a", "viudo/a", "divorciado/a",
    "soltero/a", "casado/a", "soltero/a", "divorciado/a"
)
civil
civil.f <- factor(civil)
civil.f
# observamos como nos ha dado niveles según los distintos tipos
# de datos
class(civil)
attributes(civil)
class(civil.f)
attributes(civil.f)
factor(civil, levels = c("soltero/a", "casado/a", "divorciado/a", "viudo/a"))
sexo.f <- factor(c(1, 1, 2, 1, 1, 2, 2, 1, 2, 1), labels = c("hombre", "mujer"))
sexo.f
# asigna hombre a los datos 1 y mujer a los de datos 2
unclass(sexo.f)
# así hacemos que solo se muestren números, aunque se sigan teniendo
# las etiquetas de hombre y mujer
civil.f[1]
# es curioso ver como nos da el primer elemento, pero sin embaro
# nos sigue comentando los niveles del factor.
civil.f[-(1:5)]
levels(sexo.f) # observamos todos los niveles.
levels(sexo.f)[2]
levels(sexo.f) <- c("masculino", "femenino")
sexo.f
# hemos renombrado los niveles luego el factor.
edad <- c(23, 25, 20, 19, 20, 22, 24, 20, 23, 19)
tapply(edad, sexo.f, mean)
# observa como a cada vector, le ha asignado las distintas etiquetas y
# de ahí se ha hecho la media.
tapply(edad, sexo.f, summary)
# resumen pero OJO, para cada nivel
boxplot(edad ~ sexo.f)
hist(edad)
# Matrices y arrays
x <- 1:10
dim(x) <- c(2, 5)
x
matrix(1:10, nrow = 2, ncol = 5, byrow = TRUE)
# lo ha rellenado por filas gracias al argumento byrow.
cbind(1:3, 4:6, 7:9) # column bind
rbind(1:3, 4:6, 7:9) # row bind
cbind(matrix(1:9, 3, 3), c(1, 0, 1)) # ha pegado los vectores
cbind(matrix(1:9, 3, 3), 0) # gracias a la regla de reciclaje
# repite el 0 hasta que cuadre con el cbind.
A <- matrix(1:9, 3, 3)
rownames(A) <- c("fila.1", "fila.2", "fila.3")
A
A <- matrix(1:4, 2, 2)
A
class(A)
attributes(A)
A <- matrix(1:9, 3, 3)
A[1, 1]
A[, 1] # columna 1 completa
A[1, ] # fila 1 completa
A[1:2, 1:2] # submatriz
A[, -1] # suprime la primera columna
A[-1, -1] # suprime la primera columna y primera fila
A > 3
B <- A
B[A > 3] <- NA
B
A[1:5] # ojo, aquí para seleccionar los elementos de la matriz,
# sestá tratada como si fuera un vector resultado de la concatenación
# de sus columnas.
x <- 1:24
dim(x) <- c(3, 4, 2)
x
# los arrays extienden las matrices a más de dos dimensiones
class(x)
attributes(x)
x <- array(1:24, dim = c(3, 4, 2))
x[1, 1, 1]
x[, 1, 1]
x[, , 1]
x[, , -1]
A <- matrix(c(0, 1, -1, 2), 2, 2)
A
A * A # elemento a elemento
A %*% A # multiplicación matricial
crossprod(A, A) # hace t(A1)%*%A2
A
rowSums(A)
colSums(A)
A <- matrix(c(3, 5, 2, 4, -2, -2, -1, 1, 1), 3, 3)
b <- c(8, 4, 1)
solve(A, b)
AA <- crossprod(A, A)
solve(AA)
chol2inv(chol(AA))
f <- function(x, y) 2 * y / (1 + x^2)
xx <- seq(0, 1, length.out = 5)
yy <- xx + 1
outer(xx, yy, f) # nos da el producto de xx yy matricial, a través de la función outer
x <- matrix(c(17, 10, 11, 12, 5, 14, 13, 10, 8), ncol = 3)
x
x[order(x[, 1]), ] # ordena la matriz por los valores de la primera columna
x[, order(x[1, ])] # ordena la matriz por los valores de la primera fila
x[, rev(order(x[1, ]))]
# lo hace en orden inverso.
# Listas
A <- matrix(1:6, 3, 2)
m1 <- rowMeans(A)
m2 <- colMeans(A)
minA <- min(A)
maxA <- max(A)
nomb <- c("col1", "col2", "col3")
cond <- A > mean(A) + sd(A)
lista <- list(A, m1, m2, minA, maxA, nomb, cond)
lista
F <- vector(mode = "list", length = 3) # creamos una lista vacía
F
lista <- list(matriz = A, med_fil = m1, med_col = m2, minimo = minA, maximo = maxA, nombres = nomb, cond = cond)
lista[[1]]
lista[["matriz"]]
lista$matriz
lista[[1]]
lista[1]
class(lista[[1]])
class(lista[1])
lista[2:3]
# nos ha devuelto una sublista
lista[[7]] <- !cond
lista[[8]] <- list(1:10, factor(c(1, 2, 2, 1, 1, 1, 2)))
lista
lista1 <- lista[2:3]
lista2 <- lista[8]
c(lista1, lista2)
# únicamente pega las dos sublistas creadas.
# Aplicaciones
matrix(1:4, 2, 2, dimnames = list(c("fil1", "fil2"), c("col1", "col2")))
x <- rnorm(100) # ns da 100 valores aleatorios de la normal
hist(x)
resultado <- hist(x)
resultado
sum(diff(resultado$breaks) * resultado$density)
# Data frames
dni <- c("22456715A", "22456716B", "22456717C", "22456718D", "22456719E")
edad <- c(45, 35, 52, 60, 25)
sexo <- factor(c("Hombre", "Mujer", "Hombre", "Mujer", "Hombre"))
estudios <- factor(c("superior", "superior", "profesional", "medio", "profesional"))
salario <- c(2500, 1500, 2000, 1200, 1800)
datos <- data.frame(dni, edad, sexo, estudios, salario)
datos
# observa como pone los distintos vectores y factores en columna
datosmas <- data.frame(DNI = dni, EDAD = edad, SEXO = sexo, SALARIO = salario)
datosmas
names(datos)
names(datos)[c(1, 5)] <- c("NIF", "sueldo")
names(datos)
# ha cambiado únicamente las posiciones 1 y 5
str(datos) # útil para ver la estructura del data frame
summary(datos)
datos[2]
# selecciona la primera columna creada
datos[, 2] # nos da la segunda columna íntegra.
datos[1:2, c("edad", "estudios")]
datos[datos$sexo == "Hombre", ] # nos da todos los elementos en fila que
# correspondan a la característica Hombre.
str(datos[2])
str(datos[, 2])
str(datos[, 2, drop = FALSE]) # de esta forma no simplifica la dimensión del objeto a devolver.
# es decir por ejemplo A[,1] nos da un vector (con la primera columna
# de la matriz), sin embargo, al escribir, A[,1,drop=FALSE] obtenemos matriz
# con una única columna
head(mtcars)
subset(mtcars, subset = vs == 0 & hp > 90) # nos selecciona una parte del data frame.
subset(mtcars, subset = vs == 0 & hp > 90, select = c(-vs))
# nótese que esta vez hemos seleccionado todo salvo la columna vs después
# de la selección.
transform(mtcars, wt = wt / 2.2046) # modificamos una de las columnas.
transform(mtcars, wt2 = wt / 2.2046) # se crea una nueva columna
# en el data frame.
mtcars2 <- within(mtcars, {
    vs <- factor(vs, labels = c("V", "S"))
    am <- factor(am, labels = c("automatic", "manual"))
    cyl <- ordered(cyl)
    gear <- ordered(gear)
    carb <- ordered(carb)
})
mtcars2
with(mtcars2, boxplot(mpg ~ vs))
with(subset(mtcars2, vs == "V"), hist(mpg, main = "vs=V"))
with(subset(mtcars2, vs == "S"), hist(mpg, main = "vs=S"))
help(hist)
# comprobación y cambio del tipo de objeto
x <- c(1, 2, 2, 1, 2, 1, 1, 1)
is.numeric(x)
is.factor(x)
x <- as.factor(x)
x
class(x)
is.vector(x)
is.numeric(x)
is.factor(x)
as.matrix(1:2)
as.complex(1:2)
A <- matrix(1:4, 2, 2)
is.numeric(A)
as.numeric(A)
D <- as.data.frame(A)
D
is.data.frame(D[1])
is.data.frame(D[1, ])
is.data.frame(D[, 1])
is.vector(D[, 1])
as.numeric(factor(c("H", "M")))
hh <- hist(runif(100), plot = FALSE)
is.list(hh)
# OJO, el tipo de objeto NULL es aquel que nos indica que un objeto
# está ausente.
getwd()
datos <- read.table(file = "datos.txt", header = TRUE)
datos
datos <- read.table(file = "datos.txt", header = TRUE, as.is = c(1))
help(read.table)
str(datos)
datos <- scan(file = "datos.txt", skip = 1, what = list(DNI = "", edad = 0, sexo = "", estudios = "", salario = 0))
str(datos)
# al poner 0 indicamos tipo numéricos y al poner '' indicamos tipo char.
datos <- as.data.frame(datos)
str(datos)
datos2 <- scan(text = "1 2 3 4 5 6 7 8")
datos2
str(cars)
data(cars)
data(coal, package = "boot")
str(coal)
attach(cars)
search()
mean(speed)
detach(cars)
mean(speed)
write.table(cars[1:10, ], file = "datos1.txt")
datos1 <- read.table("datos1.txt", header = TRUE)
datos1
write(runif(10), file = "datos2.txt", ncolumns = 1)
write(t(as.matrix(datos1)), file = "datos3.txt", ncolumns = 2)
# Listas de búsqueda.
unlink("datos3.txt")
# Únicamente comentar que siempre comenzará a buscar por GlobalEnv
# y si existen dos datos, tomará el que esté primero en orden.