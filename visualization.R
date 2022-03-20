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



