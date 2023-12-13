library(wordcloud)
library(RColorBrewer)
library(wordcloud2)
library(tm)
library(stringr)

luke_line <- SW_EpisodeV_ptBR[SW_EpisodeV_ptBR$personagem == "LUKE", ]
View(luke_line)

docs <-Corpus(VectorSource(luke_line))
dtm <- TermDocumentMatrix(docs)
matrix <- as.matrix(dtm)
words <- sort(rowSums(matrix),decreasing=TRUE)
df <- data.frame(word = names (words) ,freq=words)
View(df)

wordcloud(words = df$word, freq = df$freq, min.freq = 1,
          max.words=100, randow.order = FALSE, rot.per=0.35,
          colors=brewer.pal(8,"Dark2"), scale = c(2,1))

wordcloud2(data = df, size = 4.5, color = 'random-light',
           backgroundColor = 'black', rotateRatio = 0, shape = 'circle')

docs <- tm_map(docs, content_transformer(gsub), pattern = "\\b(yoda,yoda, 	
Yoda...,yoda?)\\b", replacement = "Yoda")

docs<-tm_map(docs, removeWords, c("yoda,yoda, 	
Yoda...,yoda?"))
