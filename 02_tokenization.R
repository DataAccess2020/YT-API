#install.packages("tokenizers")
library(tokenizers)

library(rio)
data <- import("salvini_dataset.csv")


library(tidyverse)
data <- add_column(data, token = NA)

#prova <- tokenize_words(data$text[1:4509]) had to check the outcome first

#install.packages("stopwords")
library(stopwords)

for (i in seq_along(1:4509)) {
  data$token[i] <- tokenize_words(data$text[i], stopwords = stopwords("it"))
  
}



#install.packages("wordcloud")
#install.packages("tm")
library(tm)
library(wordcloud)
wordcloud(data$token[[1]], scale = c(2, 1), min.freq = 100, colors = rainbow(30))
#This is a first tentative at looking into recurring words