library(dplyr)
library(ggplot2)
library(lubridate)
#library(gridExtra)
#library(patchwork)

dfTemp <- data.frame(Dia = climaTempo$Data ,
                     "Temperatura mínima" = climaTempo$temperaturaMinima, 
                     "Temperatura máxima" = climaTempo$temperaturaMaxima,
                     "umidade" = climaTempo$uminidadeRelativaPorcen
                     )

# Converter a coluna Dia para formato de data
dfTemp$Dia <- as.Date(dfTemp$Dia, format = "%d/%m/%Y")

mediaDiaClima <- dfTemp %>%
  group_by(Dia) %>%
  summarise(mediaTempMin = mean(Temperatura.mínima), mediaTempMax = mean(Temperatura.máxima), umidade = mean(umidade))


mediaDiaClima$Dia <- as.Date(mediaDiaClima$Dia, format = "%d/%m/%Y")

dadosDia <- mediaDiaClima[1:31, ]
dadosDia$mediaTempMin<-round(dadosDia$mediaTempMin)
dadosDia$mediaTempMax<-round(dadosDia$mediaTempMax)
dadosDia$umidade<-round(dadosDia$umidade)


#=====================================Janeiro==========================================================

ggMAX <- ggplot(dadosDia, aes(x = Dia, y = mediaTempMax, group=1, label=round(mediaTempMax))) +
  geom_line(stat = "identity", color="red", size=1) +
  geom_point(color="black")+
  geom_text(nudge_y = 0.7, color="black")+
  labs(x = "Data", y = "Temperatura máxima", title = "Gráfico mensal de temperaturas ºC máximas (Janeiro)")



ggMIN <- ggplot(dadosDia, aes(x = Dia, y = mediaTempMin, group=1, label=round(mediaTempMin), color = mediaTempMin)) +
  geom_line(stat = "identity", color="blue", size=1) +
  geom_point(color="black")+
  geom_text(nudge_y = 0.7, color="black")+
  labs(x = "Data", y = "Temperatura mínima", title = "Gráfico mensal de temperaturas ºC mínima (Janeiro)")
 
ggMAX + ggMIN + plot_layout(nrow = 2)

ggUMI<- ggplot(dadosDia, aes(x = Dia, y = umidade, group=1, label=round(umidade), color = umidade)) +
  geom_bar(stat = "identity", size=1) +
  geom_point()+
  geom_text(nudge_y = 1.7)+
  labs(x = "Data", y = "Umidade mínima", title = "Gráfico mensal de umidade (Janeiro)")
#=======================================================================================================
hist(dadosDia$umidade,  col="#abf5bf",main="Umidade anual 2023")

#================================Todo===================================================================
umidadeAno <- hist(mediaDiaClima$umidade,  col="#abf5bf",main="Umidade anual 2023")
tempMaxAno <- hist(mediaDiaClima$mediaTempMax, col="#52d977", main="Temperatura máxima anual 2023")     
tempMinAno<-hist(mediaDiaClima$mediaTempMin, col="#669172", main = "Temperatura mínima anual 2023")


#=================================Exportação de dados para csv==========================================
#write.table(mediaDiaClima$umidade, file = "umidade.csv", sep = ",", col.names = TRUE, fileEncoding = "UTF-8")
#write.table(dadosDia, file = "dadosDia.csv", sep = ",", col.names = TRUE, fileEncoding = "UTF-8")


#=============================analise===============================================
#=Rodar essa parte no terminal, não sei o motivo mas no terminal roda
pontosGraf<- ggplot(mapping = aes(dadosDia$mediaTempMax, dadosDia$mediaTempMin)) +
  geom_point() +
  geom_smooth(se = FALSE, method = "lm")+
  geom_hline(yintercept = mean(dadosDia$mediaTempMax))+
  labs(x = "Máxima", y = "Mínima", title = "Gráfico de temperaturas")


#                            TESTE ==============================================>
plot(dadosDia$umidade~dadosDia$mediaTempMax)
modeloReta<-lm(dadosDia$umidade~dadosDia$mediaTempMax)
abline(modeloReta)


graficoReta<-ggplot(mapping = aes(dadosDia$umidade, dadosDia$mediaTempMax)) +
  geom_point() +
  geom_smooth(method = "lm")


retas <- ggplot(mapping = aes(dadosDia$umidade, dadosDia$mediaTempMax)) +
   geom_point() +
   geom_smooth(se = FALSE, method = "lm") +
   geom_hline(yintercept = mean(dadosDia$mediaTempMax))


retas +
   geom_segment(
    aes(x = dadosDia$umidade, 
        y = dadosDia$mediaTempMax,
       yend = mean(dadosDia$mediaTempMax)), 
      xend = dadosDia$umidade,
    color="red")



retas + geom_segment(
  aes(x = dadosDia$umidade, 
      y = dadosDia$mediaTempMax,
      xend = dadosDia$umidade, 
      yend = predict(lm(dadosDia$umidade ~ dadosDia$mediaTempMax)))
  , color="red")


SQt = sum((mean(dadosDia$umidade) - dadosDia$mediaTempMax)**2)
SQres = sum((predict(lm(dadosDia$umidade ~ dadosDia$mediaTempMax)) - dadosDia$mediaTempMax)**2)
R2 = (SQt - SQres) / SQt
summary(lm(dadosDia$umidade ~ dadosDia$mediaTempMax))
predict(lm(dadosDia$umidade ~ dadosDia$mediaTempMax))
#==============================TESTE Temperaturas==================================================
plot(dadosDia$mediaTempMin~dadosDia$mediaTempMax)
modeloReta1<-lm(dadosDia$mediaTempMin~dadosDia$mediaTempMax)
abline(modeloReta1)


graficoReta1<-ggplot(mapping = aes(dadosDia$mediaTempMin, dadosDia$mediaTempMax)) +
  geom_point() +
  geom_smooth(method = "lm")


retas1 <- ggplot(mapping = aes(dadosDia$mediaTempMin, dadosDia$mediaTempMax)) +
  geom_point() +
  geom_smooth(se = FALSE, method = "lm") +
  geom_hline(yintercept = mean(dadosDia$mediaTempMax))


retas1 +
  geom_segment(
    aes(x = dadosDia$mediaTempMin, 
        y = dadosDia$mediaTempMax,
        yend = mean(dadosDia$mediaTempMax)), 
    xend = dadosDia$mediaTempMin,
    color="red")



retas1 + geom_segment(
  aes(x = dadosDia$mediaTempMin, 
      y = dadosDia$mediaTempMax,
      xend = dadosDia$mediaTempMin, 
      yend = predict(lm(dadosDia$mediaTempMin ~ dadosDia$mediaTempMax)))
  , color="red")


SQt1 = sum((mean(dadosDia$mediaTempMin) - dadosDia$mediaTempMax)**2)
SQres1 = sum((predict(lm(dadosDia$mediaTempMin ~ dadosDia$mediaTempMax)) - dadosDia$mediaTempMax)**2)
R21 = (SQt1 - SQres1) / SQt1
summary(lm(dadosDia$mediaTempMin ~ dadosDia$mediaTempMax))
predict(lm(dadosDia$mediaTempMin ~ dadosDia$mediaTempMax))
