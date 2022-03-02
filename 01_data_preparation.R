library(rio)

#salvini <- import(file = "salvini.csv")

#sal_id <- import(file = "id.csv")

#salvini <- salvini %>%
  #dplyr::rename("date" = "contentDetails.videoPublishedAt") %>%
  #dplyr::rename("video_id" = "contentDetails.videoId")

#In 00_data_import I created a dataset called salvini_youtube because I discovered that I must use
#Youtubecaptions' functions, which need URLs

captions <- import("speech1.Rdata")
#This is a big list which contains all the details about every video: but they're all elements of the same
#list, which makes it messy to work with. I'm gonna split it into 4509 sublists, one for each video

divider <- function(x, n) split(x, cut(seq_along(x), n, labels = F))

cap <- divider(captions, 4509)
#Now I've got a list containing 4509 lists, each containing 5 elements. I'm only interested in "text"

#The text for each video is super messy, because it's broken down to match the segments of subtitles
#in the YouTube videos.

library(stringr)
#test <- str_c(test[1:757], collapse = " ") this is the strategy for each text

cap[["1"]][["text"]] <- str_c(cap[["1"]][["text"]], collapse = " ")
#This works for the text for the first element of the list, so I get that I just need to change the "1"


for (i in 1:4509) {
  cap[[i]][["text"]] <- str_c(cap[[i]][["text"]], collapse = " ")
}


#Now I can finally create my dataset! I'm gonna add in data from the file I created in 00_data_import

salvini <- import("salvini_youtube.csv")

#I create the empty matrix first
salvid <- matrix(nrow = 4509, ncol = 4, dimnames = list(c(1:4509), c("video_id", "url", "date", "text")))

salvid[, 1] <- salvini$video_id
salvid[, 2] <- salvini$url

salvini$date <- as.character.Date(salvini$date) #It was a double, it was messy to use
salvid[, 3] <- salvini$date


for(i in seq_along(1:4509)){
  salvid[i, 4] <- cap[[i]][["text"]]
}

salvid <- as.data.frame(salvid)

salvid$text[duplicated(salvid$text)] <- NA
#Everytime the video didn't have subs, the text for the previous got duplicated! I removed the duplicates

#My dataset is ready!