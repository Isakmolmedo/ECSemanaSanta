# Ejercicios_de_repaso_temas_2_y_3

#Ejercicio 1.
help(set.seed)
set.seed(1)
x<-c(runif(100))
x
mx<-mean(x)
mx
which(abs(x-mx)==min(abs(x-mx)))
x[58]
help(which)
x <- x[-which(x < mx)]
x
A<-cbind(x,abs(x-mx))
A

#Ejercicio 2.
help(read.csv)
hatco<-read.csv(file='hatco.txt',header=TRUE,sep="")
hatco
typeof(hatco)
class(hatco)
hatco$x8
hatco$x8fact<-as.factor(hatco$x8)
length(hatco$x8)
hatco$x8fact
levels(hatco$x8fact)<-c('peq','grande')
hatco$x8fact
within(hatco, hatco$x8 <- hatco$x8fact) # se podría con hacer con
#un factor mucho más rápido.
within(hatco,hatco$cliente<-as.character(hatco$cliente))
tamgrandes <- sum(hatco$x8)
peques<-subset(hatco, subset = hatco$x8 == 0); peques
grandes <- subset(hatco, subset = hatco$x8 == 1); grandes
tampeq <- length(hatco$x8) - sum(hatco$x8)
help(sample)
help(subset)
m1<-grandes[sample(nrow(grandes), 1), ]
m2<-peques[sample(nrow(peques), 1), ]
muestra<-rbind(m1,m2)
muestra
hatco$y
mean(hatco$y)
mean(peques$y)
mean(grandes$y)
length(which(peques$y > mean(peques$y)))
length(which(grandes$y > mean(grandes$y)))
class(hatco)
lapply(hatco,class)
#numericos $x1 $x2 $x3 $x4 $x5 $x6 $x7
help(scale)
hatco2 <- data.frame(scale(hatco$x1), scale(hatco$x2), scale(hatco$x3), scale(hatco$x4), scale(hatco$x5),scale(hatco$x6),scale(hatco$x7))
hatco2
rep(2:3,length.out(4))
#Ejercicio 3.
help(rep)
progaritm<-function(a1,d,n){
    v <- c()
    v[1]<-a1
    for(i in 2:n){
        v[i]<-a1+d*(i-1)
    }

    return(list(vector=v,suma=sum(v),producto=prod(v)))
}
a1<-3;
d <- 0.3
n <- 4
progaritm(3,0.3,4)

progaritm2<-function(a1,d,n,explicit){
    v <- c()
    v[1] <- a1
    for(i in 2:n){
        v[i]<-a1+d*(i-1)
    }

    if (explicit == TRUE) {
        return(list(vector = v, suma = n * (v[1] + v[n]) / 2, producto = d^n * (gamma((v[1] / d) + n) / gamma(v[1] / d))))
    }
        else if(explicit == FALSE){
        return(list(vector=v,suma=sum(v),producto=prod(v)))
    }

}
progaritm2(3,0.3,4,0)
progaritm2(3,0.3,4,1)
help(gamma)
