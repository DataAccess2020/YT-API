library(ggplot2)
library(dplyr)
library(plotly)
library(viridis)
library(hrbrthemes)

library(rio)
pd_words <- import("Words/PD_words.Rdata")
lg_words <- import("Words/LG_words.Rdata")
fdi_words <- import("Words/FDI_words.Rdata")
fi_words <- import("Words/FI_words.Rdata")
m5s_words <- import("Words/M5S_words.Rdata")

pd_dataset <- import("Party Datasets/pd_dataset.csv")
lg_dataset <- import("Party Datasets/lg_dataset.csv")
fdi_dataset <- import("Party Datasets/fdi_dataset.csv")
fi_dataset <- import("Party Datasets/fi_dataset.csv")
m5s_dataset <- import("Party Datasets/m5s_dataset.csv")


#get in-party proportion of each word
total <- fi_words %>% 
  bind_rows(summarise_all(., ~if(is.numeric(.)) sum(.) else "Total"))

total <- total$n[4656]

fi_prop <- fi_words

for(i in 1:50){
  fi_prop$n[i] <- (fi_prop$n[i]/total)*100
}

fi_prop <- fi_prop[1:50, ]


#lega
total <- lg_words %>% 
  bind_rows(summarise_all(., ~if(is.numeric(.)) sum(.) else "Total"))

total <- total$n[68604]

lg_prop <- lg_words

for(i in 1:50){
  lg_prop$n[i] <- (lg_prop$n[i]/total)*100
}

lg_prop <- lg_prop[1:50, ]
