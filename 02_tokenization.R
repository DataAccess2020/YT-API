#PD captions tokenization

library(rio)
pd_dataset <- import("Party Datasets/pd_dataset.csv")

library(tidyverse)

sw_ita <- scan("ita_stopwords.txt", what="", sep="\n")
#Import a list of italian stopwords


#install.packages("tidytext")
library(tidytext)
text <- data_frame(Text = pd_dataset$text)

words <- text %>% 
  unnest_tokens(output = word, input = Text)

stop <- get_stopwords(language = "it")

wordcounts <- words %>%
  count(word, sort = TRUE)

wordcounts <- wordcounts %>%
  anti_join(stop)
#I removed stopwords again using another library to be thorough

library(stringr)
wordcounts$word <- str_remove_all(wordcounts$word, ".*ã")

library(tm)
for(i in 1:nrow(wordcounts)) {
  wordcounts$word[i] <- removeWords(wordcounts$word[i], sw_ita)
  
  print(i)
}

wordcounts <- wordcounts[-which(wordcounts$word == ""), ]

save(wordcounts, file = "PD_words.Rdata")
