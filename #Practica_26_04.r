employee <- read.table(file = "Employee.txt", header = TRUE, stringsAsFactors = TRUE)
getwd()
employee
typeof(employee)
class(employee)
str(employee)
levels(employee$gender) <- c("female", "male")
str(employee)
attach(employee)
plot(c(1, 2))
hist(salary)
res <- hist(salary, plot = FALSE)
res
hist(salary, breaks = 100)
# puntos de corte para intervalos con distinta amplitud
x1 <- seq(15000, 40000, by = 5000)
x2 <- seq(50000, 80000, by = 5000)
x3 <- seq(100000, 140000, by = 20000)
hist(salary, breaks = c(x1, x2, x3))
hist(salary, breaks = c(x1, x2, x3))
lines(density(salary), col = "blue")
curve(dnorm(x, mean = mean(salary), sd = sd(salary)), add = TRUE)
help(dnorm)
# sí porque más o menos sigue la distribución de la normal asociada.
qqnorm(salary)
ks.test(salary, pnorm, mean = mean(salary), sd = sd(salary))
shapiro.test(salary)
boxplot(salary)
summary(salary)
hist(salary, probability = TRUE, main = "", axes = FALSE)
axis(1)
lines(density(salary), col = "red", lwd = 2)
par(new = TRUE)
# esto nos sirve para que el próximo gráfico se superponga al anterior.
boxplot(salary, horizontal = TRUE, axes = FALSE, lwd = 2)

boxplot(salary ~ gender)
boxplot(salary ~ minority)
boxplot(salary ~ jobcat)
# A continuación salario con una doble clasificación.
boxplot(salary ~ gender * jobcat)

boxplot(salary ~ startsal)
boxplot(salary ~ age)
boxplot(salary ~ startsal * age)

plot(startsal, salary)
mod <- lm(salary ~ startsal)
mod
plot(startsal, salary)
abline(mod, col = "blue")
plot(age, salary)
mod2 <- lm(salary ~ age)
mod2
abline(mod2, col = "red")
plot(edu, salary)
mod3 <- lm(salary ~ edu)
abline(mod3, col = "green")
age
# vemos que hay cierta relación, entre la edad y el salario a edades tempranas, pero no tanto
# a edades mayores como 50 y 60, luego podemos decir que hay una relación medianamente fuerte
# entre edad y salario.
# por otra parte entre años de educación y salario vemos que apenas hay relación, ya que la
# recta se ajusta bastante regular a los datos.
str(employee)
tab <- table(jobcat)
tab
tab.fi <- prop.table(tab)
tab.fi # frecuencias relativas
# construimos una tabla
# clásica de frecuencias.
data.frame(tab, Freq.rel = as.numeric(tab.fi))
barplot(tab)
pie(tab)
tab2 <- table(gender)
tab2
tab2.fi <- prop.table(tab2)
tab2.fi
data.frame(tab2, Freq.rel = as.numeric(tab2.fi))
barplot(tab2)
pie(tab2)
tab3 <- table(minority)
tab3
tab3.fi <- prop.table(tab3)
data.frame(tab3, Freq.rel = as.numeric(tab3.fi))
barplot(tab3)
pie(tab3)

tab2 <- table(jobcat, gender)
tab2
# Añadimos las sumas por filas y columnas.
addmargins(tab2)
barplot(tab2)
barplot(tab2,
    legend.text = TRUE, args.legend = list(x = "topleft", bty = "n"),
    ylim = c(0, 300), density = 30, col = c("green", "blue", "red"), main = "Number of employees by gender and job category"
)

barplot(tab2,
    legend.text = TRUE,
    args.legend = list(x = "top", bty = "n"),
    density = 30,
    col = c("green", "blue", "red"),
    main = "Number of employees by gender and job category", beside = TRUE
)


tab3 <- table(jobcat, minority)
tab3
addmargins(tab3)
barplot(tab3)
barplot(tab3,
    legend.text = TRUE, args.legend = list(x = "topleft", bty = "n"),
    ylim = c(0, 400), density = 30, col = c("green", "blue", "red"),
    main = "Number of employees by minority"
)

barplot(tab3,
    legend.text = TRUE, args.legend = list(x = "top", bty = "n"),
    density = 30, col = c("green", "blue", "red"),
    main = "Number of employees by gender and job category",
    beside = TRUE
)