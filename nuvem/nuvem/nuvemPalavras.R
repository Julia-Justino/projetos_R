colnames(dadoE)
names(dadoE)[names(dadoE) =="V1"]<-"Processo"
names(dadoE)[names(dadoE) =="V2"]<-"ID"
names(dadoE)[names(dadoE) =="V3"]<-"Nome_sessão"
names(dadoE)[names(dadoE) =="V4"]<-"Sessão"
names(dadoE)[names(dadoE) =="V5"]<-"Uso_memoria"
names(dadoE)[names(dadoE) =="V6"]<-"Medida"
 

#install.packages(c("wordcloud","RColorBrewer", "wordcloud2"))

library(wordcloud)
library(RColorBrewer)
library(wordcloud2)
library(tm)


docs <-Corpus(VectorSource(dadoE$Processo))
dtm <- TermDocumentMatrix(docs)
matrix <- as.matrix(dtm)
words <- sort(rowSums(matrix),decreasing=TRUE)
df <- data.frame(word = names (words) ,freq=words)
View(df)

wordcloud(words = df$word, freq = df$freq, min.freq = 1,
          max.words=100, randow.order = FALSE, rot.per=0.35,
          colors=brewer.pal(8,"Dark2"), scale = c(2,1))

wordcloud2(data = df, size = 0.7, color = 'random-light',
           backgroundColor = 'black', rotateRatio = 0, shape = 'circle')
