#Partito Democratico dataset
library(rio)

pd_channel <- import("Content Details Data/pd_channel.csv")  #PD's channel data

library(dplyr)
pd_channel <- pd_channel %>%
  rename("date" = "contentDetails.videoPublishedAt") %>%
  rename("video_id" = "contentDetails.videoId")

pd_captions <- import("pd_captions.Rdata")
#This is a big list which contains all the details about every video: but they're all elements of the same
#list, which makes it messy to work with. I'm gonna split it into 1955 sublists, one for each video

divider <- function(x, n) split(x, cut(seq_along(x), n, labels = F))

pd_captions <- divider(pd_captions, 1955)
#Now I've got a list containing 4509 lists, each containing 5 elements. I'm only interested in "text"

#The text for each video is super messy, because it's broken down to match the segments of subtitles
#in the YouTube videos.

library(stringr)
#test <- str_c(test[1:247], collapse = " ") this is the strategy for each text

pd_captions[["1"]][["text"]] <- str_c(pd_captions[["1"]][["text"]], collapse = " ")
#This works for the text for the first element of the list, so I get that I just need to change the "1"


for (i in 1:1955) {
  pd_captions[[i]][["text"]] <- str_c(pd_captions[[i]][["text"]], collapse = " ")
}


#Now I can finally create my dataset! I'm gonna add in data from the file I created in 00_data_import

#I create the empty matrix first
pd_data <- matrix(nrow = 1955, ncol = 3, dimnames = list(c(1:1955), c("video_id", "date", "text")))

pd_data[, 1] <- pd_channel$video_id

pd_channel$date <- as.character.Date(pd_channel$date) #It was a double, it was messy to use
pd_data[, 2] <- pd_channel$date

for(i in seq_along(1:1955)){
  pd_data[i, 3] <- pd_captions[[i]][["text"]]
}

pd_data <- as.data.frame(pd_data)

pd_data$text[duplicated(pd_data$text)] <- NA
#Everytime the video didn't have subs, the text for the previous got duplicated! I removed the duplicates

#My dataset is ready!

export(pd_data, file = "pd_dataset.csv")





#Now I can do the same for the other parties
#Forza Italia dataset
library(rio)

fi_channel <- import("Content Details Data/fi_channel.csv")

library(dplyr)
fi_channel <- fi_channel %>%
  rename("date" = "contentDetails.videoPublishedAt") %>%
  rename("video_id" = "contentDetails.videoId")

fi_captions <- import("Captions/fi_captions.Rdata")

divider <- function(x, n) split(x, cut(seq_along(x), n, labels = F))

fi_captions <- divider(fi_captions, 60)


library(stringr)

for (i in 1:60) {
  fi_captions[[i]][["text"]] <- str_c(fi_captions[[i]][["text"]], collapse = " ")
}

fi_data <- matrix(nrow = 60, ncol = 3, dimnames = list(c(1:60), c("video_id", "date", "text")))

fi_data[, 1] <- fi_channel$video_id

fi_channel$date <- as.character.Date(fi_channel$date)
fi_data[, 2] <- fi_channel$date

for(i in seq_along(1:60)){
  fi_data[i, 3] <- fi_captions[[i]][["text"]]
}

fi_data <- as.data.frame(fi_data)

fi_data$text[duplicated(fi_data$text)] <- NA

export(fi_data, file = "fi_dataset.csv")





#Fratelli d'Italia dataset
library(rio)

fdi_channel <- import("Content Details Data/fdi_channel.csv")

library(dplyr)
fdi_channel <- fdi_channel %>%
  rename("date" = "contentDetails.videoPublishedAt") %>%
  rename("video_id" = "contentDetails.videoId")

fdi_captions <- import("Captions/fdi_captions.Rdata")

divider <- function(x, n) split(x, cut(seq_along(x), n, labels = F))

fdi_captions <- divider(fdi_captions, 5524)


library(stringr)

for (i in 1:5524) {
  fdi_captions[[i]][["text"]] <- str_c(fdi_captions[[i]][["text"]], collapse = " ")
}

fdi_data <- matrix(nrow = 5524, ncol = 3, dimnames = list(c(1:5524), c("video_id", "date", "text")))

fdi_data[, 1] <- fdi_channel$video_id

fdi_channel$date <- as.character.Date(fdi_channel$date)
fdi_data[, 2] <- fdi_channel$date

for(i in seq_along(1:5524)){
  fdi_data[i, 3] <- fdi_captions[[i]][["text"]]
}

fdi_data <- as.data.frame(fdi_data)

fdi_data$text[duplicated(fdi_data$text)] <- NA

export(fdi_data, file = "Party Datasets/fdi_dataset.csv")







#Lega dataset
library(rio)

lg_channel <- import("Content Details Data/lg_channel.csv")

library(dplyr)
lg_channel <- lg_channel %>%
  rename("date" = "contentDetails.videoPublishedAt") %>%
  rename("video_id" = "contentDetails.videoId")

lg_captions <- import("Captions/lg_captions.Rdata")

divider <- function(x, n) split(x, cut(seq_along(x), n, labels = F))

lg_captions <- divider(lg_captions, 9548)


library(stringr)

for (i in 1:9548) {
  lg_captions[[i]][["text"]] <- str_c(lg_captions[[i]][["text"]], collapse = " ")
}

lg_data <- matrix(nrow = 9548, ncol = 3, dimnames = list(c(1:9548), c("video_id", "date", "text")))

lg_data[, 1] <- lg_channel$video_id

lg_channel$date <- as.character.Date(lg_channel$date)
lg_data[, 2] <- lg_channel$date

for(i in seq_along(1:9548)){
  lg_data[i, 3] <- lg_captions[[i]][["text"]]
}

lg_data <- as.data.frame(lg_data)

lg_data$text[duplicated(lg_data$text)] <- NA

export(lg_data, file = "Party Datasets/lg_dataset.csv")





#Movimento 5 Stelle dataset
library(rio)

m5s_channel <- import("Content Details Data/m5s_channel.csv")

library(dplyr)
m5s_channel <- m5s_channel %>%
  rename("date" = "contentDetails.videoPublishedAt") %>%
  rename("video_id" = "contentDetails.videoId")

m5s_captions <- import("Captions/m5s_captions.Rdata")

divider <- function(x, n) split(x, cut(seq_along(x), n, labels = F))

m5s_captions <- divider(m5s_captions, 20000)


library(stringr)

for (i in 1:20000) {
  m5s_captions[[i]][["text"]] <- str_c(m5s_captions[[i]][["text"]], collapse = " ")
}

m5s_data <- matrix(nrow = 20000, ncol = 3, dimnames = list(c(1:20000), c("video_id", "date", "text")))

m5s_data[, 1] <- m5s_channel$video_id

m5s_channel$date <- as.character.Date(m5s_channel$date)
m5s_data[, 2] <- m5s_channel$date

for(i in seq_along(1:20000)){
  m5s_data[i, 3] <- m5s_captions[[i]][["text"]]
}

m5s_data <- as.data.frame(m5s_data)

m5s_data$text[duplicated(m5s_data$text)] <- NA

export(m5s_data, file = "Party Datasets/m5s_dataset.csv")
