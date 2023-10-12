#ODEIO ESSE INVERNO

valor <- quadro2$Preco.unitario
val<- 120.0
valor<-append(valor, val)
quadros["Unitario"]<- c(valor)

custo <- quadro2$Custo.unitario
cus<- 20.0
custo<-append(custo, cus)
quadros["Custo"]<-c(custo)

totalVendas<-quadros$Quantidade * valor
quadros["Total"]<- c(totalVendas)

lucro<- (valor-custo)*quadros$Quantidade
quadros["Lucro"]<- c(lucro)

library(ggplot2)

ggplot(quadros, aes(x = Vendedor, y = Total)) +
  geom_bar(stat = "identity", fill = c("#F49097", "#DFB2F4", "#55D6C2", "#0DAB76","#F49097", 
                                       "#DFB2F4", "#55D6C2", "#0DAB76")) +
  ggtitle("Faturamento por vendedor")

# Quantas calças (flaire + skinny) foram vendidas? Qual o Faturamento total em calças?
  
ggplot(calcas, aes(x = Produto, y = Total)) +
  geom_bar(stat = "identity", fill = c("#F49097", "#DFB2F4", "#DFB2F4")) +
  ggtitle("Faturamento por r")

indice <- which(quadros$Produto == "Calca Flaire")
indice2 <- which(quadros$Produto == "Calca Skinny" )
indice3 <- which(calcas$Vendedor == "Pedro")
calcas <- ""
calca <- ""
calcas <- rbind(calcas, quadros[indice, ])
calcas <- rbind(calcas, quadros[indice2, ])


calcas <- calcas[-1, ]
pedro <- subset(calcas, Vendedor == "Pedro")


calcas$Quantidade <- as.numeric(calcas$Quantidade)
calcas$Custo <- as.numeric(calcas$Custo)
calcas$Total <- as.numeric(calcas$Total)
pedro$Total <- as.numeric(pedro$Total)
calcas$Lucro <- as.numeric(calcas$Lucro)

ggplot(calcas, aes(x = Vendedor, y = Produto)) +
       geom_bar(stat = "identity", fill = c("#F49097", "#DFB2F4", "#55d6c2")) +
      ggtitle("Faturamento por r")

ggplot(pedro, aes(x = Vendedor, y = Total)) +
  geom_bar(stat = "identity", fill = c("#DFB2F4"), color = "black") +
  ggtitle("Faturamento do Pedro")

