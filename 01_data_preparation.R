library(rio)

salvini <- import(file = "salvini.csv")

sal_id <- import(file = "id.csv")

salvini[1,]
#ID and date column names are too long to type


salvini <- salvini %>%
  dplyr::rename("date" = "contentDetails.videoPublishedAt") %>%
  dplyr::rename("video_id" = "contentDetails.videoId")

sal2 <- salvini



library(tuber)
yt_oauth(id, key, token = '')


for (i in sal2$video_id) {
  cat(i, " ")
  stats <- get_video_details(i)
  
  Sys.sleep(2)
}
