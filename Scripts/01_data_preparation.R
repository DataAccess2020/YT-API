library(rio)

pd_channel <- import("Content Details Data/pd_channel.csv")

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
