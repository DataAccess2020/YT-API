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
#Tokenizing words, it may be useful later?




#install.packages("wordcloud")
#install.packages("tm")
library(tm)
library(wordcloud)

text <- Corpus(VectorSource(data$text))

text_clean <- tm_map(text, removePunctuation)

text_clean <- tm_map(text_clean, content_transformer(tolower))

text_clean <- tm_map(text_clean, removeNumbers)

text_clean <- tm_map(text_clean, stripWhitespace)

text_clean <- tm_map(text_clean, removeWords, stopwords("it"))



wordcloud(text_clean, scale = c(2, 1), min.freq = 200, colors = rainbow(30))
#This is a first tentative at looking into recurring words



#Second tentative
install.packages("tidytext")
library(tidytext)

df <- data_frame(Text = data$text)

words <- df %>% 
  unnest_tokens(output = word, input = Text)


stop <- get_stopwords(language = "it")

words <- words %>%
  anti_join(stop)

wordcounts <- words %>% count(word, sort = TRUE)

wordcounts$word <- chartr("ã", "è", wordcounts$word)

wordcounts <- wordcounts %>%
  anti_join(stop)


wordcounts %>% 
  filter(n > 8000) %>% 
  mutate(word = reorder(word, n)) %>% 
  ggplot(aes(word, n)) + 
  geom_col() +
  coord_flip() +
  labs(x = "Word \n", y = "\n Count ", title = "Frequent Words \n") +
  geom_text(aes(label = n), hjust = 1.2, colour = "white", fontface = "bold") +
  theme(plot.title = element_text(hjust = 0.5), 
        axis.title.x = element_text(face="bold", colour="darkblue", size = 12),
        axis.title.y = element_text(face="bold", colour="darkblue", size = 12))
