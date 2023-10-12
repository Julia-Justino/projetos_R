seed = 20
vendores <- c("Ana", "Flavia", "Pedro", "Mariana")
produtos <- c("calçaFlaire", "calçaSkinny", "vestido", "blusa", "manta", "saia", "casaco", "meia")
numeros <- seq(5,0)
quantidade <- sample(numeros, 6)
vend <- rep(vendores, 8)
dias <- rep(1:30, 4)
#vendas <- data.frame(dias,vend, amostra)
indice <- c(1,2)

vendas<- data.frame(vend)
vendas<- vendas[-indice,]

geral<- data.frame(vendas,dias, produtos, quantidade)

proc <- quadro2$Preco.unitario * 0.5

quadro2["aumento"] <- c(proc)