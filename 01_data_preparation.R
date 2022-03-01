library(rio)

#salvini <- import(file = "salvini.csv")

#sal_id <- import(file = "id.csv")

#salvini[1,]
#ID and date column names are too long to type


#salvini <- salvini %>%
  #dplyr::rename("date" = "contentDetails.videoPublishedAt") %>%
  #dplyr::rename("video_id" = "contentDetails.videoId")



#In 00_data_import I created a dataset called salvini_youtube because I discovered that I must use
#Youtubecaptions' functions, which need URLs

captions <- import("speech1.Rdata")

divider <- function(x, n) split(x, cut(seq_along(x), n, labels = F))

cap <- divider(captions, 4509)

export(cap, "speech.Rdata")



salvini <- import("salvini_youtube.csv")

library(stringr)
#test <- str_c(test[1:757], collapse = " ") this is the strategy for each text

cap[["1"]][["text"]] <- str_c(cap[["1"]][["text"]], collapse = " ")
#This works for the text for the first element of the list, so I get that I just need to change the "1"


for (i in 1:4509) {
  cap[[i]][["text"]] <- str_c(cap[[i]][["text"]], collapse = " ")
}




#c <- data.frame(salvini$date, salvini$video_id, salvini$url)

