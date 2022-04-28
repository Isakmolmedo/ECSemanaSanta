# Practica_2

A <- matrix(1:9, 3, 3)
x <- 1:3
A %*% x # aquí x es tratado como una matriz 3x1
A %*% t(x) # no funciona el producto de matrices.
t(x) %*% A # no debería funcionar, pero x es tratado como matriz 1x3.
t(x) %*% x # el resultado es una matriz 1x1 en lugar de un vector.



# Sistemas de ecuaciones lineales.

# Sistema 1
solve(2, 2) # 2x=2
# Sistema 2
A <- matrix(c(3, 1, 4, 2), 2, 2)
b <- c(12, 8)
solve(A, b)
# 3x+4y=12, x+2y=8

# Sistema 3
solve(A, diag(2))
A # nos da dos sistemas.
diag(2)


# Sistemas mal condicionados.
A <- matrix(c(10, 7, 8, 7, 7, 5, 6, 5, 8, 6, 10, 9, 7, 5, 9, 10), 4, 4)
A
b <- c(32, 23, 33, 31)
solve(A, b)
solve(A, b + 0.05)
solve(A, b + 0.1)
help(kappa)
kappa(A)
rcond(A) # mal condicionamiento bastante severo.
abs(max(eigen(A)$values) / min(eigen(A)$values))
eigen(A)
kappa(A, exact = TRUE)
1 / kappa(A)
1 / kappa(A, exact = TRUE)
help(kappa)

# Regresión lineal y mínimos cuadrados,
# implementación computacional directa.
n <- 5
set.seed(2)
x <- rnorm(n)
y <- 1 + x + rnorm(n, 0, 0.1)
help(set.seed)
X <- cbind(1, x)
X
XX <- crossprod(X)
XX
XXinv <- solve(XX)
XXinv
beta <- XXinv %*% t(X) %*% y
beta
# hacemos la regresión
curve(1 + x, -3, 3, main = "Regresión lineal simple ", ylab = "y")
points(x, y)
curve(beta[1] + beta[2] * x, add = T, col = 2)

# Implementación usando la descomposición QR
QR <- qr(X)
QR
Q <- qr.Q(QR)
Q
b <- t(Q) %*% y
R <- qr.R(QR)
R
backsolve(R, b)

# Ejercicio propuesto.
help(rep)
n <- 3
x <- 1:n
A <- matrix(rep(1:n, times = n, each = n)^rep(1:n, times = n), ncol = n, nrow = n)
b <- A %*% rep(1, n)
solve(A, b)
rcond(A)
max(abs(x - 1))
n <- 12
x <- 1:ncol
A <- matrix(rep(1:n, times = n, each = n)^rep(1:n, times = n), ncol = n, nrow = n)
b <- A %*% rep(1, n)
solve(A, b)
rcond(A)
cA <- rcond(A)
solve(A, b, tol = cA)