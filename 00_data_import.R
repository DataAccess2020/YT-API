library(tuber)
yt_oauth(id, key, token = '')

#Start with Salvini because his YT account is up to date and tidy. He has many high quality video

salvini_id <- "UCDjM54fZ-cD7F8uom767OhA"
#Scraped from source, line 21. No way to obtain it from API

salvini <- list_channel_videos(channel_id = salvini_id)
#I have the id for the 50 newest videos + date and hour of publication