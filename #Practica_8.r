# Practica 8.

hatco <- read.csv(file = "hatco2.csv", header = TRUE, stringsAsFactors = TRUE)
hatco
str(hatco)
getwd()
plot(hatco[, c(6:13)])
# tenemos relación lineal
# en aquellos gráficos donde los puntos están muy juntos
# entre sí, como la fidelidad y el servicio de conjunto,
# la velocidad y la imagen de fuerza de ventas.
# entre servicio de conjunto y la imagen de fuerza de ventas, etc etc.
# Observamos por ejemplo que la velocidad parece colineal al resto, ya que sus
# gráficos se pueden aproximar por rectas de regresión.

mod1 <- lm(fidelidad ~ velocidad + precio + flexprec + imgfabri + servconj + imgfvent + calidadp, hatco)
mod1
# ACABAR PRACTICA EN CASA.
summary(mod1)
anova(mod1)
# para x2, el p-valor es 0.74 luego la percepción del
# cleinte sobre el precio no parece influir en la
# fidelidad a la distribuidora, y B1=-0.325
# para x3 SÍ que hay influencia pues el p-valor es muy pequeño
# luego la percepción del cliente sobre la flexibilidad
# de los precios SÍ influye en la fidelidad a la distribuidora.
# el servicio de conjunto sí tendrá influencia.
# la imagen del fabricante NO y la calidad del producto tampoco.
# ya que sus p-valores son menores que 0.05.
summary(mod1)
# Considerando 0.05 nivel de significación,
# rechazamos H0, mientras que si consideramos
# 0.01, no rechazaríamos H0.
rstandard(mod1)
fitted.values(mod1)
help(lm)
plot(fitted.values(mod1), rstandard(mod1))
# HACER GRAFICOS PARA XIJ RI.
# install.packages('lmtest')
library("lmtest")
help(dwtest)
dwtest(mod1)
# asumible pues <0.05 luego rechazamos H0.
ks.test(rnorm(mod1), rstandard(mod1))
# dado el p-valor no podemos descartar la normalidad.
qqnorm(rstandard(mod1))
install.packages("car")
library("car")
crPlots(mod1)
hatco$empresa
hatco[which(abs(rstandard(mod1)) > 2.5), ]
cooks.distance(mod1)
hatvalues(mod1)
plot(cooks.distance(mod1), hatvalues(mod1))
# Identificar datos influyentes y/o aislados.
influenceIndexPlot(mod1)
hatco[which(hatvalues(mod1) > 0.35), ]
hatco[which(cooks.distance(mod1) > 0.12), ]