library(tuber)
yt_oauth(id, key)

#Start with Salvini because his YT account is up to date and tidy. He has many high quality video

salvini_id <- list_channel_resources(filter = c(username = "MatteoSalviniOfficial"), part = "id")[[2]]
#The function always gives the id in the second element of the list

salvini <- list_channel_resources(filter = c(channel_id = salvini_id), part = "contentDetails")

