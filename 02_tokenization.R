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




#install.packages("tidytext")
library(tidytext)

df <- data_frame(Text = data$text)

words <- df %>% 
  unnest_tokens(output = word, input = Text)

stop <- get_stopwords(language = "it")

words <- words %>%
  anti_join(stop)

wordcounts <- words %>% count(word, sort = TRUE)

wordcounts <- wordcounts %>%
  anti_join(stop)


#library(TextWiller)
#prova <- TextWiller::sentiment(wordcounts$word). I don't like this approach