library(rio)
pd_dataset <- import("Party Datasets/pd_dataset.csv")


library(tidyverse)
pd_dataset <- add_column(pd_dataset, token = NA)

#install.packages("tokenizers")
library(tokenizers)

#prova <- tokenize_words(data$text[1:4509]) had to check the outcome first

#install.packages("stopwords")
library(stopwords)

for (i in seq_along(1:1955)) {
  pd_dataset$token[i] <- tokenize_words(pd_dataset$text[i], stopwords = stopwords("it"))
  
}




#install.packages("tidytext")
library(tidytext)

text <- data_frame(Text = pd_dataset$text)

words <- text %>% 
  unnest_tokens(output = word, input = Text)

stop <- get_stopwords(language = "it")

words <- words %>%
  anti_join(stop)

wordcounts <- words %>% count(word, sort = TRUE)

wordcounts <- wordcounts %>%
  anti_join(itastopwords)


library(TextWiller)
prova <- sentiment(wordcounts$word[1])


