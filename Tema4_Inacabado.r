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
