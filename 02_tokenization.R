library(rio)
data <- import("salvini_dataset.csv")


library(tidyverse)
data <- add_column(data, token = NA)

#install.packages("tokenizers")
library(tokenizers)

#prova <- tokenize_words(data$text[1:4509]) had to check the outcome first

#install.packages("stopwords")
library(stopwords)

for (i in seq_along(1:4509)) {
  data$token[i] <- tokenize_words(data$text[i], stopwords = stopwords("it"))
  
}


library(TextWiller)

