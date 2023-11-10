#----Importação----
library(ggplot2)
library(dplyr)

#----Number ----
dados$EmprestimoMontante <- gsub("[[:alpha:]]", "", dados$EmprestimoMontante)
dados$EmprestimoMontante <- as.numeric(dados$EmprestimoMontante)

dados$Prazo_EmprestimoMontante<- gsub("[[:alpha:]]", "", dados$Prazo_EmprestimoMontante)
dados$Prazo_EmprestimoMontante <- as.numeric(dados$Prazo_EmprestimoMontante)


#----Amostras----
educacao <- table(dados$Educacao)
auto <- table(dados$Autonomo)
depende<-table(dados$Dependentes)
generos<- table(dados$Genero)
casados <- table(dados$Casado)
area <- table(dados$AreaImovel)
status <- table(dados$StatusEmprestimo)
hist <- table(dados$Historico_de_Credito)



summary(dados$CandidatoRendimento)

amostraEducacao<-sample(dados$Educacao, size = 50, replace = FALSE)
amostraAutonomo<-sample(dados$Autonomo, size = 50, replace = FALSE)
amostraDepe <-sample(dados$Dependentes, size = 50, replace = FALSE)
amostraEmpre <- sample(dados$EmprestimoMontante, size = 50, replace = TRUE)
amostraPrazo <- sample(dados$EmprestimoMontante, size = 50, replace = TRUE)



aaaa<- subset(dados,amostraPrazo == "NA")
#----Gráficos----

graduados <- barplot(educacao, main="Proporção de graduados e não graduados", 
                     xlab="Graduação", ylab="Proporção", col=c("darkgreen", "red"))

autonomos <- barplot(auto, main = "Proporção de autonomo",
                     xlab="Graduação", ylab="Proporção",
                     col=c("darkgreen", "blue", "red")
                     )

dependentes <- barplot(depende, main = "Quantidade de dependentes",
                       xlab = "Quantidade de filhos", ylab = "Proporção")
              

genero <- barplot(generos, main = "Distribuição de genêros",
                  xlab = "Quantidade", 
                  ylab = "Proporção",  
                  col=c("blue", "red", "grey"))


casado <- barplot(casados, main = "Quantidade de casados",
                  xlab = "Casados",
                  ylab = "Proporção",
                  col = c("red", "grey", "green")
                  )


areaImo <- barplot(area, main = "Quantidade de região",
                   xlab = "Imovéis",
                   ylab = "Proporção")

statusT<- barplot(status, main = "Status de crédito",
                 xlab = "Status",
                 ylab = "Proporção")

historico<-barplot(hist, main = "Histórico de crédito",
                   xlab = "Status",
                   ylab = "Proporção")

#----
plot(amostraPrazo~amostraEmpre)
conf<- lm(amostraPrazo~amostraEmpre)
abline(conf)

ggplot(mapping = aes(amostraPrazo,amostraEmpre)) +
  ggtitle("Relação entre prazo e valor do empréstimo") +
  labs(x = "Prazo do empréstimo", y = "Valor do empréstimo") +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE)

