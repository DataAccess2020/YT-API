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

sal <- import("salvini_youtube.csv")

