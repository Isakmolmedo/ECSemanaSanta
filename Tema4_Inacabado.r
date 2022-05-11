# Tema 4.
demo(graphics)
# La función plot.
plot(cars$speed, cars$dist)
plot(cars)
help(plot.default)
plot(cars$speed, cars$dist, type = "l")
plot(cars$speed, cars$dist, type = "b")
colors()
palette()
plot(cars$speed, cars$dist, col = c("skyblue", "salmon3"))
help(plot)
plot(cars$speed, cars$dist, main = "Diagrama de dispersión", xlab = "Distancia de frenado (pies)", ylab = "Velocidad (millas por hora)", pch = 21, col = "blue", bg = "cyan", cex = 1.5)

radio <- 0:10
area <- pi * radio^2
plot(radio, area, type = "b", main = "Áreas de círculos en función del radio", xlab = "Radio(r)", ylab = expression(Área == pi * r^2), col = "purple", pch = 20)

class(AirPassengers)
plot(AirPassengers, main = "Una serie temporal")
class(ChickWeight$Diet)
plot(ChickWeight$Diet, main = "Un factor")
class(Titanic)
plot(Titanic, main = "Una tabla cruzada con tres factores de clasificación")



# Gráficos de funciones matemáticas: función curve.
curve(x^3 - 3 * x, -2, 2, ylab = expression(f(x) == x^3 - 3 * x))
curve(dnorm(x, mean = 10, sd = 2), 4, 16, ylab = "densidad", main = expression(paste("Normal (", mu == 10, ",", sigma == 2, ")")))
help(expression)

# Superponemos dos gráficos con add.
curve(x^2, -1, 1, ylab = "", main = expression(paste(f(x) == x^2, " y ", f(x) == x^4)))
curve(x^4, -1, 1, col = 2, add = TRUE)
help(curve)
#Ejercicio 1.
curve(dnorm(x, mean = 0, sd = 1), xlim=c(-3,6), ylim=c(0,1), col = "purple", type = 'p')
curve(dnorm(x, mean = 0, sd = 0.5), xlim=c(-3,6), ylim=c(0,1), col = "navy",type='b' ,add = TRUE)
curve(dnorm(x, mean = 3, sd = 1), xlim=c(-3,6), ylim=c(0,1), col = "green2", type='l',add = TRUE)
help(plot)
# Gráficos de símbolos: función symbols

n <- 10
set.seed(1)
x <- runif(n)
colores <- rainbow(n)
symbols(1:n, x, circles = x, bg = colores, ylim = c(0, 1.5), xlim = c(0, 11))

# Añadir elementos a un gráfico.

set.seed(123)
plot(rnorm(10), main = "Tres muestras de una Normal estándar", pch = 17, ylim = c(-3, 3))
points(rnorm(10), pch = 20, col = 2)
points(rnorm(10), pch = 21, col = 3)
points(rnorm(10), pch = 22, col = 4)
help(plot)

set.seed(123)
x <- rnorm(10)
plot(x,main='Muestra de una Normal estándar',ylim=c(-3,3),pch=19)
lines(x,col=4,lwd=2)
abline(h=0,col=1)
abline(h = -3, col = 2, lty = 3, lwd = 2)
abline(h=3,col=2,lty=3,lwd=2)
help(abline)

#Función text.
plot(x,main='Muestra de una Normal estándar', ylim=c(-4,4),xlim=c(0,10),pch=19)
abline(h=-3,col=2,lty=3,lwd=2)
abline(h=3,col=2,lty=3,lwd=2)
pr3<-round(pnorm(-3),5)
text(5,3.5,paste0('probabilidad=',pr3),col=2,pos=3)
text(0.2,0,paste0('probabilidad',1-2*pr3),pos=3,srt=90)
text(5,-3.5,paste0('probabilidad=',pr3),col=2)
help(par)

#Función legend.
x<-seq(0,2*pi,length=100)
y1<-cos(x)
y2<-sin(x)
plot(x, y1, type = "l", col = 2, lwd = 3, xlab = expression(group("[", list(0, 2 * pi), "]")),ylab="",main="Seno y Coseno")
lines(x,y2,col=3,lwd=3,lty=2)
points(pi,0,pch=17,col=4)
legend(0,-0.5,c("Coseno","Seno"),col=2:3,lty=1:2,lwd=3)
abline(v=pi,lty=3)
abline(h=0,lty=3)
text(pi, 0, expression(group("(", list(pi, 0), ")")),adj=c(0,0))
radio<-seq(0,5,by=0.1)
area<-pi*radio^2
perimetro<-2*pi*radio
plot(radio,area,type='o',ylab='',pch=19,col=2)
lines(radio,perimetro,type='o',pch=17,col=4)
legend('topleft',legend=c('Área','Perímetro'),lty=1,pch=c(19,17),col=c(2,4),bt='n')

#Ejercicio 2.
curve(dnorm(x, mean = 0, sd = 1), xlim=c(-3,6), ylim=c(0,1), col = "purple", type = 'p')
curve(dnorm(x, mean = 0, sd = 0.5), xlim=c(-3,6), ylim=c(0,1), col = "navy",type='b' ,add = TRUE)
curve(dnorm(x, mean = 3, sd = 1), xlim = c(-3, 6), ylim = c(0, 1), col = "green2", type = "l", add = TRUE)
legend(3, 0.8, legend = c("Normal(0,1)", "Normal(0,0.5)", "Normal(3,1)"),lty=1,pch=c(19,17,16),col=c("purple","navy","green2"),bt='n')
help(legend)
help(pch)
help(legend)
help(legend)
#Función par.
par()
par(mfrow=c(2,2))#nos da una matriz de 2x2 gráficos
curve(dnorm(x),-3,3,main='Gráfico: Normal estándar')
curve(dt(x,df=10),-3,3,main='Gráfico 2: t de Student')
curve(dchisq(x,df=5),0,20,main='Gráfico 3: chi-cuadrado')
curve(df(x,df1=20,df2=10),0,5,main='Gráfico 4: F de Snedecor')

#modificamos parámetros.
par(mar=c(3.5,3.5,2.5,1.5),oma=c(1,1,1,1),mgp=c(1.5,0.5,0),
cex.axis=0.8,cex.lab=0.8,cex.main=1,col.lab='blue',bty='n')
par(mfrow=c(2,2)) # matriz de 2x2 gráficos (se rellenan por filas)
curve(dnorm(x),-3,3,main='Gráfico 1: Normal estándar')
curve(dt(x,df=10),-3,3,main='Gráfico 2: t de Student')
curve(dchisq(x,df=5),0,20,main='Gráfico 3: chi-cuadrado')
curve(df(x,df1=20,df2=10),0,5,main='Gráfico 4: F de Snedecor')

#Dispositivos gráficos
windows()
dev.cur()
dev.list()
# Bloque 1: Generación de datos para los gráficos
x<-seq(0,2*pi,length.out=20)
set.seed(2)
y1<-sin(x)+0.3*rnorm(20)
y2<-sin(x)+0.15*rnorm(20)
# Bloque 2: Iniciar un dispositivo gráfico (número 2)
# y representar (x,y1)
windows()
plot(x,y1,type='o',pch=15,col=2)
# Bloque 3: Iniciar otro dispositivo gráfico (número 3)
# y representar (x,y2)
windows()
plot(x,y2,type='o',pch=16,col=4)
## Comprueba la lista de dispositivos y el dispositivo actual
dev.list()
dev.cur()
# Bloque 4: Añadir la curva $f(x)=sen(x)$ a ambos gráficos
# primero en rojo en el dispositivo 2
dev.set(2)
curve(sin(x),add=TRUE,col=2,lty=3)
# después en azul el dispositivo 3
dev.set(3) # esto no sería necesario (3 es el dispositivo actual)
curve(sin(x),add=TRUE,col=4,lty=3)
# Bloque 5: Comparar las dos gráficas en un nuevo dispositivo (4)
# en este caso será un fichero con nombre 'graf.pdf'
pdf('graf.pdf')
plot(x,y1,pch=15,col=2,ylab='')
points(x,y2,pch=16,col=4)
# añadimos segmentos entre los puntos
segments(x,y1,x,y2,col='purple')
# y la curva f(x)=sen(x) de referencia
curve(sin(x),add=TRUE,lty=3)
# cerramos el dispositivo actual (el pdf)
dev.off()


#Metodología de análisis estadísticos en R
