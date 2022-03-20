library(ggplot2)
library(viridis)

library(rio)
pd_words <- import("Words/PD_words.Rdata")
lg_words <- import("Words/LG_words.Rdata")
fdi_words <- import("Words/FDI_words.Rdata")
fi_words <- import("Words/FI_words.Rdata")
m5s_words <- import("Words/M5S_words.Rdata")

ggplot(data, aes(x = word, y = count, fill = party)) + 
  geom_bar(stat = "identity") +
  scale_fill_viridis(discrete = T)
