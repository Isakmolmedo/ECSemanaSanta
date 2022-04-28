#Practica 6.

f<-function(x) x^2-5
curve(f, 0, 10)
abline(h=0,col=2)

f <- function(x) x^2 - 5
f.prima <- function(x) 2 * x
x0 <- 2
x1 <- x0 - f(x0) / f.prima(x0); x1
x2 <- x1 - f(x1) / f.prima(x1); x2

algoritmo.NR <- function(f, f.prima, x0, tol, nmax) {
    x <- x0
    for (i in 2:nmax) {
        x[i] <- x[i - 1] - f(x[i - 1]) / f.prima(x[i - 1])
        dif <- abs(x[i] - x[i - 1])
        if (dif < tol) break
    }
    if (dif > tol) warning("Se ha alcanzado el número máximo de iteraciones
    sin llegar a la convergencia")
    return(list(raiz = x[i], num.iteracions = i, iteraciones = x, tolerancia = dif))
}
f <- function(x) x^2 - 5
f.prima<-function(x) 2*x
algoritmo.NR(f, f.prima, 2, 10^{-4}, 10)

algoritmo.NR<-function(f,f.rpima,x0,tol=1e-10,nmax=50,dibuja=TRUE,lim.x=c(x0-2,x0+2))
{
 if (missing(f) || missing(f.prima) || missing(x0))
 stop("Debe proporcionar los argumentos requeridos")
if (!is.function(f) || !is.function(f.prima))
 stop("Los argumentos 'f' y 'f.prima' deben ser funciones")
 if (!is.numeric(x0) || length(x0)>1)
 stop ("Proporcione un valor inicial adecuado")
 if (dibuja) {
 curve(f,lim.x[1],lim.x[2])
 abline(h=0,col=2)
 }
