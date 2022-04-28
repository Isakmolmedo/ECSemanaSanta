# Tema 3
# Definición de una función
f.suma <- function(x, y) x + y
ls()
class(f.suma)
f.suma(1, 1)
f.suma(1, NA)
f.suma(1:10, 2)
f.suma(diag(3), 1:3) # suma respectivamente a cada fila 1, 2 y 3
f.suma(1)
f.suma <- function(x = 0, y = 0) x + y
f.suma(1)
f.suma()
# aquí no nos da problemas ya que hemos dado un valor a los argumentos
# por defecto.
f1 <- function(x, y) {
    x + y
    24
}
# únicamente devuelve el último valor.
f1(1, 1)
f1(0, 0)
f1 <- function(x, y) {
    return(x + y)
    24
}
f1(1, 1)
f2 <- function(x, y) {
    x^2
    return(list(suma = x + y, resta = x - y))
    y^2
}
f2(1, 1)
# Importante observar que la ejecución de las sentencias se interrumpe cuando
# se encuentra con la palabra return.
media1 <- function(x) {
    media <- mean(na.omit(x))
    valperd <- length(x) - length(na.omit(x))
    return(list(media, valperd))
}
media1(c(2, NA, 3))
media2 <- function(x, n) {
    media <- (sum(x * n)) / sum(n)
    tam <- sum(n)
    return(list(mediavector = media, tammuestra = tam))
}
media2(c(1, 2, 3), c(2, 3, 3))
# Componentes de las funciones.
formals(f.suma) # argumentos
body(f.suma) # cuerpo
argum.original <- formals(f.suma) # almacenamos los argumentos originales.
formals(f.suma) <- alist(x = , y = , z = ) # modificamos los argumentos originales.
help(alist)
prueba <- function(x, y, z) {
    x + y
}
prueba(1, 3, 5)
# modificamos el cuerpo.
cuerpo.original <- body(f.suma) # almacenamos el cuerpo original
body(f.suma)
body(f.suma) <- expression({
    suma1 <- x + y
    suma2 <- x + z
    return(list(suma1 = suma1, suma2 = suma2))
})
f.suma(1, 2, 3)
# reestablecemos argumentos y cuerpo originales
formals(f.suma) <- argum.original
body(f.suma) <- cuerpo.original
f.suma
environment(f.suma)
x <- 1
f <- function(x) {
    y <- 1
    x <- x + y
    return(x)
}
f(x)
x
# observamos que cambia su valor únicamente dentro de la función.
y # solo existe dentro de la función
help(assign)
# Funciones especiales.
class(var)
typeof(var)
formals(var)
body(var)
environment(var)
class(sum)
typeof(sum)
formals(sum)
body(sum)
environment(sum)
class(`[`)
typeof(`[`)
# funciones anónimas
lista <- list(x = 1:10, y = 10:13)
lapply(lista, function(v) v^2)
# hemos definido una función en la misma función lapply,
# luego hemos usado una función anónima.
formals(paste)
paste("uno", "dos", "tres", sep = "+")
# gracias a ... extendemos los argumentos de forma indefinida.
grafico <- function(x, ...) {
    z <- (x - mean(x)) / sd(x)
    plot(x, z, ...)
}
grafico(1:10, main = "Gráfico 1")
grafico(1:10, main = "Gráfico 2", type = "l", col = 4)
# Reglas de alcance: lexical scoping
x <- 1
f <- function(y) {
    z <- x + y
    z
}
# y es un argumento, z variable local, x variable libre.
environment(f)
ls()
rm(list = ls())
help(rm)
ls()
f1 <- function(a, b) a + b
f2 <- function(a, b) {
    f1 <- function(a, b) a - b
    f1(a, b)
}
f1(1, 1)
f2(1, 1)

y <- 10
f <- function(x) {
    y <- 2
    y^2 + g(x)
}
g <- function(x) x * y
f(3)
# Estructuras de control.
help(cat)
x <- 5
if (x >= 5) cat("Aprobado") else cat("Suspenso")
calif <- if (x >= 5) print("Aprobado") else print("Suspenso")
f <- function(x) {
    browser()
    #    if (x >= 5) cat('Aprobado') else cat('Suspenso')
}
saludo <- function(franja = NA, nombre) {
    if (is.na(franja)) {
        paste("Hola", nombre)
    } else if (franja == 1) {
        paste("Buenos días", nombre)
    } else if (franja == 2) {
        paste("Buenas tardes", nombre)
    } else if (franja == 3) {
        paste("Buenas noches", nombre)
    } else {
        warning("Franja puede ser 1 (mañana), 2 (tarde) ó 3 (noche)")
        paste("Hola", nombre)
    }
}
nombre <- "Isaac"
saludo(2, nombre)
# como recomendación en general poner la { al final de la línea va a ser mejor
saludo(franja = 1, nombre = "Isaac")
saludo(franja = 4, nombre = "Isaac")
x <- 5
if (x > 4 | n > 1) { # se comprueban las dos.
    if (x > 4 || n > 1) "se comprueba sólo la primera"
}
help(sqrt)
raiz <- function(x) {
    if (is.numeric(x) == TRUE && x > 0) {
        resultado <- sqrt(x)
        return(resultado)
    } else {
        print("El vector introducido no es válido")
    }
}
# sentencia ifelse
milog <- function(x) ifelse(x == 0, NA, log(x))
milog(c(1, 0, 2))
milog(c(1, 0, NA))
Sys.setenv("_R_CHECK_LENGTH_1_CONDITION_" = "true")
milog <- function(x) if (x == 0) NA else log(x)
milog(c(1, 0, 2))
# sentencia switch

opciones <- function(x) {
    if (x == "a") {
        "opción 1"
    } else if (x == "b") {
        "opción 2"
    } else if (x == "c") {
        "opción 3"
    } else {
        stop("Valor de x no válido")
    }
}
opciones <- function(x) {
    switch(x,
        a = "opción 1",
        b = "opción 2",
        c = "opción 3",
        stop("Valor de x no válido")
    )
}
opciones <- function(x) {
    switch(x,
        "uno",
        "dos",
        "tres",
        "cuatro"
    )
}
opciones(2)
opciones(1.4)
opciones(5)
opciones("a")
opciones <- function(x) {
    resultado <- c("uno", "dos", "tres", "cuatro")
    resultado[x]
}
opciones(2)
opciones(1.4)
opciones(5)
opciones("a")
# versión de lucas
saludo <- function(franja = NA, nombre) {
    switch(as.character(franja),
        "NA" = paste("Hola", nombre),
        "1" = paste("Buenos días", nombre),
        "2" = paste("Buenas tardes", nombre),
        "3" = paste("Buenas noches", nombre),
        {
            warning("Franja puede ser 1 (mañana), 2 (tarde) ó 3 (noche)")
            paste("Hola", nombre)
        }
    )
}
help(switch)
saludo(1, "Isaac")
saludo(2, "Isaac")
saludo(3, "Isaac")
saludo(4, "Isaac")
saludo(NA, "Isaac")
# Estructuras de repetición
for (i in 1:3) print(i^2)
for (i in letters[1:3]) print(i)
lista <- list(matrix(1:6, 2, 3), 1:2)
lista
for (i in lista) print(i)
for (i in 1:5) if (i %% 2 == 0) print(i) else next
set.seed(1)
x <- runif(100)
suma <- 0
for (i in 1:100) {
    suma <- suma + x[i]
    if (suma > 0.5) {
        print(paste("Me paro en i=", i, "porque la suma supera 0.5"))
        break
    }
}
f <- function(x) {
    suma <- 0
    for (i in 1:length(x)) {
        suma <- suma + x[i]
        if (suma > 0.5) {
            return(paste("Me paro en i=", i, "porque la suma supera 0.5"))
        }
    }
    return(paste("He completado el ciclo y la suma es", suma))
}
f(rep(0.1, 4))
f(rep(0.1, 10))
# Repeticiones mientras se cumple una condición
set.seed(1)
i <- suma <- 0
x <- numeric()
while (suma < 0.5) {
    i <- i + 1
    x[i] <- runif(1, 0, 0.1) # uniforme en 0,0.1
    suma <- suma + x[i]
}
print(round(x, 4))
help(round)
# repeticiones infinitas.
set.seed(1)
i <- suma <- 0
x <- numeric()
repeat{
    i <- i + 1
    x[i] <- runif(1, 0, 0.1) # uniforme en 0,0.1
    suma <- suma + x[i]
    if (suma >= 0.5) break
} # observa que si no ponemos el break, se repite de forma infinita.
print(round(x, 4))
suma

x <- 1:5
suma <- 0
for (i in 1:length(x)) suma <- suma + x[i]
suma / length(x)
sum(x) / length(x)

A <- matrix(1:6, 2, 3)
A
sumas.filas <- numeric(nrow(A))
sumas.filas
for (i in 1:nrow(A)) {
    for (j in 1:ncol(A)) sumas.filas[i] <- sumas.filas[i] + A[i, j]
}
sumas.filas

lista <- list(v1 = 1:10, vs = factor(), v3 = letters[1:4])
lapply(lista, length)
df <- data.frame(matrix(1:6, 2, 3))
lapply(df, mean)
help(colMeans)
colMeans(df)
sapply(lista, length)
A <- cbind(1:4, seq(0, 1, length.out = 4), (1:4)^2)
A
apply(A, 1, median) # mediana por filas
# MARGIN=1 opera por filas, MARGIN=2 por columnas, MARGIN=c(1,2)
# opera por filas y columnas.
apply(A, 2, var)
apply(A, c(1, 2), sqrt)
arboles <- split(Orange, Orange$Tree)
arboles
lapply(arboles, head, n = 2)
A <- matrix(1:9, 3, 3)
A
diagonales <- split(A, col(A) - row(A))
col(A)
help(col)
row(A)
diagonales
sapply(diagonales, sum)
# Funciones de clasificación y agrupación.
help(aggregate)
aggregate(Orange$age, by = list(Orange$Tree), summary)
by(Orange$age, Orange$Tree, summary)
tapply(Orange$age, Orange$Tree, summary)
# Manipulación y depuración de errores.
log.natural <- function(x) {
    if (missing(x) || !is.numeric(x)) {
        stop("Debe proporcionar un
                                        argumento 'x' numérico")
    } else if (any(x <= 0)) {
        x <- x[x > 0]
        warning("Se han eliminado los valores negativos o cero")
    }
    return(log(x))
}
log.natural()
log.natural(-1:5)
options()
help(options)

f <- function(x) {
    n <- round(x)
    set.seed(n)
    u <- runif(n)
    return(u)
}
mean(f(-2))
traceback()
# leemos de abajo hasta arriba.

f <- function(x) {
    browser()
    n <- round(x)
    set.seed(n)
    u <- runif(n)
    return(u)
}
mean(f(-2))

# en mitad de la secuencia hemos escrito get('n') para comprobar
# el valor que toma la variable local n una vez creada.
# Q hace que se pare inmediatamente sin ejecutar el resto de sentencias.
# c supone continuar la ejecución hasta el final sin paradas.

f <- function(x) {
    n <- round(x)
    set.seed(n)
    u <- runif(n)
    return(u)
}
debug(f)
mean(f(2))
debug(f)
debug(mean)
mean(f(2))
undebug(f)
undebug(mean)

# Factorial de un número.
factorial.d <- function(n) {
    if (missing(n) || !is.numeric(n)) {
        return(NA)
    }
    n <- as.integer(n)
    fact <- 1
    if (n > 1) for (i in 1:n) fact <- fact * i
    return(fact)
}
factorial.d(5)
factorial.d(0)
factorial.d(100)
factorial.d(50000)

factorial.r <- function(n) {
    if (missing(n) || !is.numeric(n)) {
        return(NA)
    }
    n <- as.integer(n)
    if (n > 1) fact <- n * factorial.r(n - 1) else fact <- 1
    return(fact)
}
factorial.r(5)
factorial.r(100)
factorial.r(5000)

factorial.v <- function(n) {
    if (missing(n) || !is.numeric(n)) {
        return(NA)
    }
    n <- as.integer(n)
    if (n > 1) fact <- prod(n:1) else fact <- 1
    return(fact)
}
factorial.v(5)
factorial.v(100)
factorial.v(5000)

factorial.d <- function(n) {
    if (missing(n) || !is.numeric(n)) {
        return(NA)
    }
    n <- as.integer(n)
    t1 <- Sys.time() # tiempo inicial.
    fact <- 1
    if (n > 1) for (i in 1:n) fact <- fact * i
    t2 <- Sys.time() # tiempo final.
    return(list(factorial = fact, tiempo = t2 - t1))
}
factorial.v <- function(n) {
    if (missing(n) || !is.numeric(n)) {
        return(NA)
    }
    n <- as.integer(n)
    t1 <- Sys.time() # tiempo inicial.
    if (n > 1) fact <- prod(n:1) else fact <- 1
    t2 <- Sys.time() # tiempo final.
    return(list(factorial = fact, tiempo = t2 - t1))
}
factorial.d(10000)
factorial.v(10000)

# Sucesión de Fibonacci.

Fibonacci.r <- function(n) {
    if (missing(n) || !is.numeric(n)) {
        return(NA)
    }
    n <- as.integer(n)
    if (n == 0) {
        return(0)
    } else if (n <= 2) {
        return(1)
    } else {
        return(Fibonacci.r(n - 1) + Fibonacci.r(n - 2))
    }
}
Fibonacci.r(5)
Fibonacci.r(20)
Fibonacci.r(30)
Fibonacci.r(300)

Fibonacci.v <- function(n) {
    if (missing(n) || !is.numeric(n)) {
        return(NA)
    }
    n <- as.integer(n)
    v <- integer(n)
    v[1:2] <- 1
    for (i in 3:n) v[i] <- v[i - 1] + v[i - 2]
    return(v[n])
}

Fibonacci.v <- function(n) {
    if (missing(n) || !is.numeric(n)) {
        return(NA)
    }
    n <- as.integer(n)
    v <- integer(n)
    v[1:2] <- 1
    for (i in 3:n) v[i] <- v[i - 1] + v[i - 2]
    return(list(elemento_n = v[n], vector = v, suma = sum(v)))
}
Fibonacci.v(5)