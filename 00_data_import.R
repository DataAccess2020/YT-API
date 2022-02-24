library(tuber)
yt_oauth(id, key, token = '')

#Start with Salvini because his YT account is up to date and tidy. He has many high quality video

salvini_id <- "UCDjM54fZ-cD7F8uom767OhA"
#Scraped from source, line 21. No way to obtain it from API

salvini <- list_channel_videos(channel_id = salvini_id, max_results = 51)
#I have the id for every video + date and hour of publication. 4509 videos
#I typed 51 because anything >50 gives you every video on channel


library(rio)
export(salvini, file = "salvini.csv")

id <- data.frame(salvini_id)

export(id, "id.csv")
