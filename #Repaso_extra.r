#Repaso ejercicios.

x<-seq(1,10,by=0.2)
x
n<-length(x)
names(x)<-paste("X",1:n,sep="_")
x
mx<-mean(x)
mx
which(x==min(x[x>mx]))
y<-seq(1,n,by=2)
y
x[y[1:5]]

x<-seq(-2,2,by=0.1); x
valores<-1 * (x < -1) + log(x^2)*(-1<= x & x<0)+log(x^2+1)*(0<=x & x<1)+2*(x>=1)
valores[which(is.na(valores))]<-0
valores

set.seed(1)
x<-runif(50)
x
elementos<-x[x>0.25 & x<0.75]
elementos
length(elementos)
elementos2<-x[x<0.1 | x>0.9]
length(elementos2)
mean(elementos2)
elementos2<-NA
x[x<0.1 | x>0.9]<-NA
x
help(mean)
mean(x, na.rm = TRUE)
x <- runif(50)
mean(x)
    v <- c()
    v[1] <- 1
for (i in 2:20) {

    v[i] <- v[1] + (1.2) *(i-1)
}
v

sum(v)
sd(v)
abs(1.2)*sqrt((20*21)/12)

prod(v)
1.2^{20}*gamma(1/1.2+20)/gamma(1/1.2)

x<-c(2,2,8,7,6,1,5)
x
rx<-x[-1]
length(rx)
rx[7]<-2
x-rx

ABE<-c(LETTERS[1:26])
ABE
help(sample)
ABE.5 <- sample(ABE, 5, replace = FALSE)
ABE.5
help(paste)
paste(sample(ABE.5, 5, replace = FALSE), collapse="")
PAL<-paste(paste(sample(ABE.5,5,replace=FALSE),collapse=""),paste(sample(ABE.5,5,replace=FALSE),collapse=""))
PAL

A<-matrix(1:9,3,3)
x<-1:3
A%*%x
A%*%t(x)
x%*%A
t(x)%*%A
t(x)%*%x


lista<-list(x1<-c(1,2,3,4,5),x2<-c(2,3,4,5,6),x3<-c(3,4,5,6,7)); lista
set.seed(1)
x<-runif(10); x
lista[[4]] <- x
lista
y<-rnorm(10,0,1)
y
lista[[5]]<-y
lapply(lista,sum)
sapply(lista,sum)
reg<-lm(y~x)
class(reg)
 typeof(reg)
lapply(reg,class)
matriz<-cbind(reg$residuals,reg$fitted.values,x,y)
matriz
colnames(matriz) <- paste(c('C'), 1:4, sep = "")
matriz

#Ejercicio 2.

datos<-data.frame(xi=c(1.2,1.8,2.2,2.5,1.1),yi=c(15,18,10,12,16),ni=c(12,23,5,9,11))
datos
str(datos)
datos[1]
n<-sum(datos[3])
n
datos[1]
mx <- (sum(datos[1] * datos[3])) / 60
mx
my<- (sum(datos[2]* datos[3]))/60
my
help(var)
c(1,2,3)
var(datos[1])
var(datos[2])
help(rep)
datos.n<-datos[rep(1:nrow(datos), datos$ni),1:2]
transform(datos.n, zi <- (xi - mean(xi))/var(xi))

#Acceso a ficheros externos.
help(read.csv)
censo<-read.csv(file='census.csv',header=TRUE,as.is=NA)
censo
lapply(censo,class)
str(censo)
help(read.csv)
lapply(lapply(censo, is.na), sum)
lapply(complete.cases(censo), isTRUE)
sum(complete.cases(censo))
censo2<-censo[complete.cases(censo),]
censo2
censo
censo2<-na.omit(censo)
censo2
help(na.omit)
help(write.table)
write.table(censo2, file = "censo2.txt",row.names=FALSE, sep = "\t")
 censo3<-read.table(file="censo2.txt")
censo3
str(censo3)

set.seed(1)
x<-runif(100)
x
mx<-mean(x)
mx
x[x == min(x[which(x > mx)])]
x[-(which(x < mx))]
A<-cbind(x,abs(x-mx))
help(read.table)
hatco<-read.table(file='hatco.txt',head=TRUE,sep=""); hatco
hatco$x8
help(transform)
factorcito <- factor(hatco$x8)
factorcito
class(factorcito)
class(hatco)
hatco$x8<-factorcito
hatco <- within(hatco, x8 <- factorcito)
transform(hatco, x8 = factorcito)
class(hatco$x8)
class(hatco$x8)
str(hatco)
typeof(hatco$x8)
mode(hatco$x8)
hatco$x8
hatco <- within(hatco, cliente <- as.character(cliente))
hatco<-read.table(file='hatco.txt',head=TRUE,sep=""); hatco
peq <- sum(hatco$x8)
peq
grand<- length(hatco$x8)-peq
grand
help(subset)
m1<-subset(hatco,hatco$x8==1)
m1
m2 <- subset(hatco, hatco$x8 == 0)
m2
big<-m1[sample(nrow(m1),1),]
big
small<-m2[sample(nrow(m2),1),]
small
muestra<-rbind(big,small)
muestra
mean(hatco$y)
mean(m1$y)
mean(m2$y)
subset(m1, m1$y > mean(m1$y))
subset(m2, m2$y > mean(m2$y))
str(hatco)
hatco2<-data.frame(hatco$cliente,scale(hatco$x1),scale(hatco$x2),scale(hatco$x3),scale(hatco$x4),scale(hatco$x5),scale(hatco$x6),scale(hatco$x7),hatco$y,hatco$x8)
hatco2

progaritm<-function(n,a1,d){
    v <- c()
    v[1]<-a1
    for (i in 2:n) {
        v[i] <- a1 + d * (i - 1)
    }
    return(list(v, sum(v), prod(v)))

}
progaritm(2,2,0.3)
