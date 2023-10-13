x <- c(1,3,8,2,1,3)
y <- cumsum(x)

dadosNum<-data.frame(x,y)

library(dplyr)
ano <- city %>%
  arrange(desc(city$Year))

cityMaior<- head(dfdf2, n = 5)


anoQuente <- subset(df2, Year == "2020")

library(dplyr)
anoQ <- anoQuente %>%
  arrange(desc(anoQuente$Year))


cityAQ<- head(anoQ, n = 5)


library(ggplot2)

ggplot(cityAQ, aes(x = Day, y = AvgTemperature)) +
  geom_bar(stat = "identity") +
  ggtitle("Temperaturas ano de 2020")

hist(cityAQ$AvgTemperature, ylab = "Dia",
     xlab = "Temperatura", 
     main = "As 5 maiores temperaturas de 2020",
     col = c("#F49097", "#DFB2F4", "#55D6C2", "#0DAB76", "#ae759f", "#F7A072")
     )


mediaTemp <- anoQ %>%
  group_by(City) %>%
  summarise(average_temperature = mean(AvgTemperature))