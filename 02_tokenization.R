#PD captions tokenization

library(rio)
pd_dataset <- import("Party Datasets/pd_dataset.csv")


#install.packages("tidytext")
library(tidytext)
library(tidyverse)

library(TextWiller)
text <- removeStopwords(pd_dataset$text)





text <- data_frame(Text = pd_dataset$text)

words <- text %>% 
  unnest_tokens(output = word, input = Text)


stop <- get_stopwords(language = "it")

wordcounts <- words %>%
  count(word, sort = TRUE)

wordcounts <- wordcounts %>%
  anti_join(stop)

library(stringr)
wordcounts$word <- str_remove_all(wordcounts$word, ".*ã")

wordcounts <- wordcounts[-which(wordcounts$word == ""), ]



#1 try plot
wordcounts %>% 
  filter(n > 6000) %>% 
  mutate(word = reorder(word, n)) %>% 
  ggplot(aes(word, n)) + 
  geom_col() +
  coord_flip() +
  labs(x = "Word \n", y = "\n Count ", title = "Frequent Words \n") +
  geom_text(aes(label = n), hjust = 1.2, colour = "white", fontface = "bold") +
  theme(plot.title = element_text(hjust = 0.5), 
        axis.title.x = element_text(face="bold", colour="darkblue", size = 12),
        axis.title.y = element_text(face="bold", colour="darkblue", size = 12))

