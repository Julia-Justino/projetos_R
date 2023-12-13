library(tidyverse)
library(tidytext)
library(wordcloud)
library(ggplot2)
library(RColorBrewer)
library(wordcloud2)
library(tm)
library(stringr)
library(purrr)

# Remover pontuação e espaços em branco desnecessários
filme4 <- filme4 %>%
  str_replace_all("[[:punct:]]", " ") %>%
  str_replace_all("^[[:space:]]+", "") %>%
  str_replace_all("[[:space:]]+$", "")

# Dividir o texto em palavras
words <- filme4 %>%
  str_split(" ") %>%
  unlist()

sentiments <- get_sentiments("nrc-pt")


sentiments <- sapply(words, function(word) sentiments[word])

sentiments