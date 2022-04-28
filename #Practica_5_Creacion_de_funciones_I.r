#Practica 5.
help(scan)
muestra<-scan(text= "25.03 18.59 47.20 80.20 187.67
95.94 35.07 145.38 9.52 128.14
136.69 180.82 49.67 33.41 4.16
94.87 102.25 11.04 35.14 151.15
17.14 81.94 20.01 125.26 7.11
61.36 55.59 10.80 31.88 16.39
45.95 4.98 23.20 8.78 30.68
22.65 13.19 40.62 2.78 35.41
8.63 17.04 8.02 126.54 2.11
136.93 17.39 37.73 84.53 14.22")
muestra

logl <- function(theta) {
    a <- theta[1]
    b <- theta[2]
    l <- sum(log(dgamma(x = muestra, shape = a, scale = b)))
    return(-l)
}

#Establecemos valores iniciales para los parámetros.
b0<-a0<-1
res<-optim(par=c(a0,b0),fn=logl)
res$par
res
b0<-a0<-2
res<-optim(par=c(a0,b0),fn=logl)
res
res$par
library(Rsolnp)
b0<-a0<-1
res <- solnp(pars = c(a0, b0), fun = logl, LB = c(0, 0))

a0 <- var(muestra)/mean(muestra)
b0<-mean(muestra)/a0
res <- solnp(pars = c(a0, b0),fun=logl,LB=c(0,0))
res$pars
library(maxLik)
logl2<-function(theta)-logl(theta)
maxLik(logl2,start=c(1,1))
a0 <- var(muestra)/mean(muestra)
b0<-mean(muestra)/a0
maxLik(logl2, start = c(a0, b0))

A <- matrix(c(1, 0, 0, 1),2)
B<-c(0,0)
maxLik(logl2,start=c(1,1),constraints=list(ineqA=A,ineqB=B))

f <- function(a) log(a) - digamma(a) - log(mean(muestra)) + mean(log(muestra))
res <- uniroot(f, c(0.1, 100))
res

b <- mean(muestra)/res$root
b
medias<-function(x){
    if (!is.numeric(x)) stop("El vector debe ser numérico")
    x <- x[!is.na(x)]
    m.geo <- function(x) exp(mean(log(x)))
    m.arm<- function(x) 1/mean(1/x)
    mx.geo <- if (min(x) > 0) m.geo(x) else NA
    mx.arm<-if(any(x==0)) NA else m.arm(x)
    if (is.na(mx.geo) || is.na(mx.arm)) warning("El vector tiene valores negativos o cero")
    return(list(media.aritm = mean(x),media.geom=mx.geo,media.arm=mx.arm))
}

medias(1:10)
medias(c(1:10, NA))
medias(0:10)
medias(-1:10)

mediana<-function(x){
    if (missing(x) || !is.numeric(x)) stop("Debe proporcionar un argumento 'x' numérico")
    x <- x[!is.na(x)]
    xord <- sort(x)
    n <- length(x)
    if (n %% 2 == 0) (xord[n / 2] + xord[1 + n / 2]) / 2 else xord[ceiling(n / 2)]
}
mediana(1:5)
mediana(1:6)
mediana(c(1:6,NA))
mediana("hola")
set.seed(1)
mediana(runif(20))
mediana <- function(x) {
    if (missing(x) || !is.numeric(x)) stop("Debe proporcionar un argumento 'x' numérico")
    x <- x[!is.na(x)]
    xord <- sort(x)
    n <- length(x)
    if (n %% 2 == 0) (xord[n / 2] + xord[1 + n / 2]) / 2 else xord[ceiling(n / 2)]
}
mediana(1:5)
mediana(1:6)
mediana(c(1:6,NA))
mediana("hola")
set.seed(1)
mediana(runif(20))

cuartiles<- function(x){
    if (missing(x) || !is.numeric(x)) stop("Debe proporcionar un argumento 'x' numérico")
    x <- x[!is.na(x)]
    xord <- sort(x)
    n <- length(x)
    pos.Q1 <- (n + 1)/4
i<-trunc(pos.Q1)
Q1 <- x[i] + (pos.Q1 - i) * (x[i + 1]-x[i])
if (n %% 2 == 0) Q2 <- (xord[n / 2] + xord[1 + n / 2]) / 2 else Q2 <- xord[ceiling(n / 2)]
pos.Q3 <- 3 * (n + 1) / 4
i<-trunc(pos.Q3)
Q3 <- x[i] + (pos.Q3 - i) * (x[i + 1] - x[i])
return(list(Q1=Q1,Q2=Q2,Q3=Q3))

}
cuartiles(1:9)
cuartiles(1:10)
quantile(1:9,c(.25,.5,.75))
quantile(1:10,c(.25,.5,.75))
