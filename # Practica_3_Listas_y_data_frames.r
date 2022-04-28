# Practica 3

#Ejercicio 1.
x1 <- c(1, 2, 3, 4, 5)
x2 <- c(2, 3, 4, 5, 6)
x3 <- c(3, 4, 5, 6, 7)

set.seed(1)
x<-runif(10,0,1)
y<-rnorm(10)
y

lista <- list(x1, x2, x3, x,y)

lista
help(lapply)
lapply(lista,sum)
sapply(lista,sum)
#simplificada.

reg<-lm(y~x)

typeof(reg)
is.list(reg)
lapply(reg, class) # super útil
lapply(reg,typeof)

matriz<-cbind(reg$residuals,reg$fitted.values,x,y)
matriz
colnames(matriz)
help(colnames)
colnames(matriz)<-c("C1","C2","C3","C4")
matriz
colnames(matriz) <- c("residuals", "fitted", "x", "y")

# Ejercicio 2.
xi<-c(1.2, 1.8, 2.2, 2.5, 1.1)
yi <- c(15, 18, 10, 12, 6)
ni<-c(12,23,5,9,11)
datos<-data.frame(xi,yi,ni)
datos

n<-sum(datos[,3])
mx<-sum(ni*xi)/sum(ni); mx
my<-sum(ni*yi)/sum(ni); my
s2x <- sum(ni * (xi - mx)^2)/(n-1); s2x
s2y <- sum(ni * (yi - my)^2) / (n - 1)
s2y
nrow(datos)
datos$ni
datos.n<-datos[rep(1:nrow(datos),datos$ni),1:2]
datos.n
help(rep)
help(transform)
datos.n1 <- transform(datos.n, zx = (xi - mx) / sqrt(s2x), zy = (yi - my) / sqrt(s2y))
head(datos.n1)
datos.n2 <- within(datos.n, {
    zx <- (xi - mx) / sqrt(s2x)
    zy <- (yi - my)/sqrt(s2y)})
head(datos.n2)
help(ChickWeight)
head(ChickWeight,5)
tail(ChickWeight,3)
str(ChickWeight)
summary(ChickWeight)
summary(ChickWeight$weight)
peso.dieta<-tapply(ChickWeight$weight,ChickWeight$Diet,summary)
class(peso.dieta);mode(peso.dieta);is.list(peso.dieta)
peso.dieta.2<-data.frame(matrix(unlist(peso.dieta),nrow=length(peso.dieta),byrow=1))
peso.dieta.2
help(unlist)
length(peso.dieta)
colnames(peso.dieta.2)<-names(peso.dieta[[1]])
peso.dieta.2
peso.dieta.2<-aggregate(ChickWeight$weight,by=list(ChickWeight$Diet),summary)
peso.dieta.2
class(peso.dieta.2)
Chick100<-ChickWeight[sample(1:nrow(ChickWeight),100),];Chick100
#columnas permutadas aleatoriamente.
p<-ncol(Chick100)
Chick100[,sample(1:p,p,replace=FALSE)]
#columnas por orden alfabético.
Chick100[1,order(names(Chick100))]
#ordenación según diet.
Chick100[order(Chick100$Diet),]
#ordenación según diet y weight.
Chick100[order(Chick100$Diet,Chick100$weight),]
# submuestra tomando solo una observación para cada tipo de dieta.
new <- Chick100[rev(order(Chick100$weight)),]
new[!duplicated(new$Diet),]
