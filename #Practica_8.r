# Practica 8.

hatco <- read.csv(file = "hatco2.csv", header = TRUE, stringsAsFactors = TRUE)
hatco
str(hatco)
getwd()
plot(hatco[, c(6:13)])
# Modelo lineal:
# Yi=B0+xi1B1+....+xikBk+ei
# Yi= fidelidad por parte del cliente
# xi= variables explicativas.
# tenemos relación lineal
# en aquellos gráficos donde los puntos están muy juntos
# entre sí, como la fidelidad y el servicio de conjunto,
# la velocidad y la imagen de fuerza de ventas.
# entre servicio de conjunto y la imagen de fuerza de ventas, etc etc.
# Observamos por ejemplo que la velocidad parece colineal al resto, ya que sus
# gráficos se pueden aproximar por rectas de regresión.

mod1 <- lm(fidelidad ~ velocidad + precio + flexprec + imgfabri + servconj + imgfvent + calidadp, hatco)
mod1
# Obtenemos los coeficientes estimados. Estos nos representan
# la magnitud del efecto que cada percepción del cliente ejerce en su fidelidad a la distribuidora.
# Por ejemplo, por cada unidad que aumenta la percepción que el cliente tiene
# de dicha felixibidad, su fidelidad se incrementa en 3.362 unidades, supuesto
# que el resto de percepciones permanece constante.

# Estudiamos ahora bondad del ajuste y contraste
# de regresión.
summary(mod1)
# El 77.5% de la variabilidad total de la fidelidad de los clientes

# Significación individual de las variables explicativas.

# queda explicada por las 7 percepciones a través del modelo lineal ajustado.
anova(mod1)
# Para x2, el p-valor es 0.74 luego la no hay evidencias
# suficientes para rechazar H0 (B2=0) al 5% de significación,
# y por tanto la percepción que el cliente tiene en el precio,
# no parece influir significativamente en su fidelidad.

# Para x3 SÍ su pvalor es extremadamente pequeño, luego
# hay evidencia suficiente para rechazar H0 al 5% de signf., luego
# La flexibilidad del precio, sí afecta en la fidelidad.
# La imagen del fabricante, su p-valor es 0.95 luego no hay evidencia
# suficiente para rechazar H0 al 5% n.s.
# El servicio conjunto, ya que su valor es 0.0359<0.05, hay evidencias
# suficientes para rechazar H0 luego sí afecta.
# La imagen de fuerza de ventas no afectará, pues su p-valor 0.17>0.05 luego no hay
# evidencias suficientes para rechazar H0.
# La calidad del producto no afectará, pues su p-valor es 0.11>0.05 luego
# no hay evidencias suficientes para rechazar H0.

# Significación del término constante B0.
summary(mod1)
# Considerando 0.05 nivel de significación,
# el p-valor es 0.0440<0.05 luego rechazamos la hipótesis H0,
# pues hay evidencias suficientes.
# Considerando 0.01 nivel de significación,
# el p-valor es 0.0440>0.01 luego no rechazamos H0, pues no hay
# evidencias suficientes para rechazar.

# Homocedasticidad.
rstandard(mod1)
fitted.values(mod1)
help(lm)
plot(fitted.values(mod1), rstandard(mod1))
plot(hatco[, c(6:12)], rstandard(mod1))
names(hatco[, c(1:12)])
# imagen de fabricante y servicio conjunto,
# se puede aproximar por una parábola, luego
# esto alerta de un patrón no aleatorio que alertaría de
# desviaciones de la hipótesis de homocedasticidad.

# Incorrelación.

# install.packages('lmtest')
library("lmtest")
help(dwtest)
dwtest(mod1)
plot(rstandard(mod1), hatco[, 1], xlab = "error estandarizado", ylab = "número de orden de observación")
# p-valor>0.05 luego no podemos rechazar la hipótesis de incorrelación.

# dado el p-valor no podemos descartar la normalidad
# también se observa viendo el gráfico.

# Normalidad.
qqnorm(rstandard(mod1))
ks.test(rnorm(mod1), rstandard(mod1))

# Linealidad.
# No hay evidencia para rechazar la hipótesis de normalidad.

install.packages("car")
library("car")
crPlots(mod1)

# Identificación de datos anómalos e influyentes.
hatco$empresa
hatco[which(abs(rstandard(mod1)) > 2.5), ]

# dos empresas influyentes son la 7 y 100.
cooks.distance(mod1)
hatvalues(mod1)
plot(cooks.distance(mod1), hatco[, 1])
plot(hatvalues(mod1), hatco[, 1])
# Observo que hay datos aislados, como el de la empresa 22, 55
rstandard(mod1)[22]
rstandard(mod1)[55]

influenceIndexPlot(mod1)
# No son anómalos en su residuo estandarizado.
hatco2 <- hatco[-c(7, 100), ]
hatco2 # Eliminación de observaciones anómalas e influyentes.
mod2 <- lm(hatco2$fidelidad ~ hatco2$velocidad + hatco2$precio + hatco2$flexprec + hatco2$imgfabri + hatco2$servconj +
    +hatco2$imgfvent + hatco2$calidadp, hatco2$hatco)
mod2
summary(mod2)
# los p-valores han disminuido considerablemente, aunque se siguen manteniendo los rechazos y no rechazos.

# Estudio de multicolinealidad.
R <- cor(hatco[, 6:12])
R
ai <- eigen(R)$values # autovalores de R
sqrt(max(ai) / min(ai)) # el índice IC
vif(mod2)
help(vif)
# observo que la velocidad y el precio están por encima de 30,
# por lo que  rechazamos la multicolinealidad de velocidad y precio.

# Selección de variables explicativas.
step(mod2)
help(step)
step(mod2, direction = "both")
# Aparecen más variables al final del algoritmo.








# hatco[which(hatvalues(mod1) > 0.35), ]
# hatco[which(cooks.distance(mod1) > 0.12), ]