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


#I can't use get_all_channel_details because I would send too many requests in one time
for (i in sal2$video_id) {
  cat(i, " ")
  stats <- get_video_details(i)
  
  yt_oauth(id, key, token = '')  #After almost 2000 IDs the loop stopped because of the token, so
                                          #I'll try adding it in
  Sys.sleep(1)
}

