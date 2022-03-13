#PD captions tokenization

library(rio)
pd_dataset <- import("Party Datasets/pd_dataset.csv")


#install.packages("tidytext")
library(tidytext)

text <- data_frame(Text = pd_dataset$text)

words <- text %>% 
  unnest_tokens(output = word, input = Text)


stop <- get_stopwords(language = "it")

wordcounts <- words %>% count(word, sort = TRUE)

wordcounts <- wordcounts %>%
  anti_join(stop)

library(stringr)
error <- str_extract(wordcounts$word, ".*ã")

error <- as.data.frame(error)

wordcounts <- wordcounts %>%
  anti_join(error)

