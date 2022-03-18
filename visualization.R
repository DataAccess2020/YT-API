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



#pd
total <- pd_words %>% 
  bind_rows(summarise_all(., ~if(is.numeric(.)) sum(.) else "Total"))

total <- total$n[66974]

pd_prop <- pd_words

for(i in 1:50){
  pd_prop$n[i] <- (pd_prop$n[i]/total)*100
}

pd_prop <- pd_prop[1:50, ]


#fdi
total <- fdi_words %>% 
  bind_rows(summarise_all(., ~if(is.numeric(.)) sum(.) else "Total"))

total <- total$n[98122]

fdi_prop <- fdi_words

for(i in 1:50){
  fdi_prop$n[i] <- (fdi_prop$n[i]/total)*100
}

fdi_prop <- fdi_prop[1:50, ]



#m5s
total <- m5s_words %>% 
  bind_rows(summarise_all(., ~if(is.numeric(.)) sum(.) else "Total"))

total <- total$n[101211]

m5s_prop <- m5s_words

for(i in 1:50){
  m5s_prop$n[i] <- (m5s_prop$n[i]/total)*100
}

m5s_prop <- m5s_prop[1:50, ]


plot_data <- matrix(nrow = 50, ncol = 10, dimnames = list(c(1:50), c("pd_words", "pd_prop", "m5s_words", "m5s_prop", "fi_words", "fi_prop", "fdi_words", "fdi_prop", "lg_words", "lg_prop")))
plot_data[, 1] <- pd_prop$word
plot_data[, 2] <- pd_prop$n
plot_data[, 3] <- m5s_prop$word
plot_data[, 4] <- m5s_prop$n
plot_data[, 5] <- fi_prop$word
plot_data[, 6] <- fi_prop$n
plot_data[, 7] <- fdi_prop$word
plot_data[, 8] <- fdi_prop$n
plot_data[, 9] <- lg_prop$word
plot_data[, 10] <- lg_prop$n
plot_data <- as.data.frame(plot_data)

save(plot_data, file = "plot_data.Rdata")



plot_data <- import("plot_data.Rdata")




