library(dplyr)
library(ggplot2)
library(lubridate)
library(gridExtra)
library(patchwork)
library(ggpubr)

dfTemp <- data.frame(Dia = climaTempo$Data ,
                     "Temperatura mínima" = climaTempo$temperaturaMinima, 
                     "Temperatura máxima" = climaTempo$temperaturaMaxima
                     )
# Convertir a coluna Dia para formato de data
dfTemp$Dia <- as.Date(dfTemp$Dia, format = "%d/%m/%Y")

mediaDiaClima <- dfTemp %>%
  group_by(Dia) %>%
  summarise(mediaTempMin = mean(Temperatura.mínima), mediaTempMax = mean(Temperatura.máxima))


mediaDiaClima$Dia <- as.Date(mediaDiaClima$Dia, format = "%d/%m/%Y")
dadosDia <- mediaDiaClima[1:31, ]
dadosFeveire <- mediaDiaClima[32:59, ]
dadosMarco <- mediaDiaClima[60:90, ]
dadosAbril <- mediaDiaClima[91:120, ]
dadosMaio <- mediaDiaClima[]
#=========================Janeiro Temperatura==========================================================

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
#=======================================================================================================




