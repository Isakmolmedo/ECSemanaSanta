# Practica_1_Vectores

# Ejercicio 1.
x <- seq(1, 10, by = 0.2)
x
n <- length(x)
n
help(names)
names(x) <- paste(c("x_"), 1:46, sep = "")
names(x)
x
mx <- mean(x)
hmg <- which(x > mx)
hmg
length(hmg)
which(x == min(x[x > mx]))
min(x[x > mx])
help(min)
y <- seq(1, 10, by = 2)
y
impar <- x[y]
impar
# Una versión más genérica.
y <- seq(1, by = 2, length.out = n)
x[y[1:5]]



# Ejercicio 2.
valrs <- seq(-2, 2, by = 0.1)
valrs
fx <- (valrs < -1) * 1 + (-1 <= valrs & valrs < 0) * (log(valrs^2)) + (0 <= valrs & valrs < 1) * log(valrs^2 + 1) + 2 * (valrs >= 1)
fx
# consejo, fíjate en la siguiente línea de código para fijar los
# elementos que sean NA como 0.
fx[is.nan(fx)] <- 0 # fx[x==0]<-0

# Ejercicio 3.
set.seed(1)
help(runif)
x <- runif(50)
x
z <- which(x > 0.25 & x < 0.75)
z
z[1:length(z)] <- 1
sum(z)
sum(x > 0.25 & x < 0.75)
sum(x < 0.1 | x > 0.9)
x[which(x < 0.1 | x > 0.9)] <- NA
x
help(mean)
mean(na.omit(x))
mean(x, na.rm = TRUE)
x[is.na(x)] <- 0
x
mean(x)

# Ejercicio 4.
a1 <- 1
d <- 1.2
n <- 20
p20 <- a1 + (0:(n - 1)) * d
p20
sum(p20)
20 * (p20[1] + p20[20]) / 2
sd(p20)
abs(1.2) * sqrt((20 * 21) / 12)
prod(p20)
d^n * gamma(p20[1] / 1.2 + n) / gamma(p20[1] / 1.2)

# Ejercicio 5.
x <- c(2, 2, 8, 7, 6, 1, 5)
length(x)
x[-1] - x[-length(x)]
# toma el vector sin el primer elemento y le resta el
# vector sin el último elemento, muy clever.

# Ejercicio 6.
set.seed(1)
ABE <- sort(c(LETTERS, "´Ñ"))
ABE
ABE.5 <- sample(ABE, 5, replace = FALSE)
# toma una muestra de 5 elementos SIN REEMPLAZAMIENTO.
PAL <- c(paste(sample(ABE.5, replace = FALSE), collapse = ""), paste(sample(ABE.5, replace = FALSE), collapse = ""))
PAL
# el collapse "" es para pegar las letras de la muestra ABE.5