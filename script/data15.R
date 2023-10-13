seed = 20
vendores <- c("Ana", "Flavia", "Pedro", "Mariana")
produtos <- c("calçaFlaire", "calçaSkinny", "vestido", "blusa", "manta", "saia", "casaco", "meia")
numeros <- seq(5,0)
quantidade <- sample(numeros, size=32, replace=TRUE)
vend <- sample(vendores,size=32, replace=TRUE)
produ <- sample(produtos, size=32, replace = TRUE)
dias <- rep(1:32, 1)
#vendas <- data.frame(dias,vend, amostra)
indice <- c(1)

vendas<- data.frame(Vendedor = vend)
produtosV <- data.frame(Produtos = produ)


geral<- data.frame(vendas,dias, produtosV, quantidade)

proc <- quadro2$Preco.unitario * 0.5

quadro2["Aumento"] <- c(proc)

merda<-sample(vendores,size=100, replace=TRUE)