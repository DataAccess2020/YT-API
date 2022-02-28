library(tuber)
yt_oauth(id, key, token = '')

#Start with Salvini because his YT account is up to date and tidy. He has many high quality video

salvini_id
#Scraped from source, line 21

salvini <- list_channel_videos(channel_id = salvini_id, max_results = 51)
#I have the id for every video + date and hour of publication. 4509 videos
#I typed 51 because anything >50 gives you every video on channel


library(rio)
export(salvini, file = "salvini.csv")

s_id <- data.frame(salvini_id)

export(s_id, "id.csv")


#Since Tuber's get_captions doesn't work anymore, I'm gonna be using Youtubecaption's get_captions
#But it requires URLs, which I haven't

salvini <- import("salvini.csv")

sal <- salvini


url <- str_c("https://www.youtube.com/watch?v=", sal$video_id[1:4509])

salv_data <- data.frame(sal[2:5], url)

export(salv_data, "salvini_youtube.csv")




#Huge download of captions of every video

sal <- import("salvini_youtube.csv")




library(youtubecaption)

speech <- vector()
v <- vector()

for (i in sal$url[1:500]) {
  tryCatch({
    v <- get_caption(i, "it")
  }, error = function(e){})
  
  print(i)
  speech <- append(speech, v)
  Sys.sleep(0.5)
}



for (i in sal$url[501:1000]) {
  tryCatch({
    v <- get_caption(i, "it")
  }, error = function(e){})
  
  print(i)
  speech <- append(speech, v)
  Sys.sleep(0.8)
}



for (i in sal$url[1001:1500]) {
  tryCatch({
    v <- get_caption(i, "it")
  }, error = function(e){})
  
  print(i)
  speech <- append(speech, v)
  Sys.sleep(0.4)
}



for (i in sal$url[1501:2000]) {
  tryCatch({
    v <- get_caption(i, "it")
  }, error = function(e){})
  
  print(i)
  speech <- append(speech, v)
  Sys.sleep(0.4)
}



for (i in sal$url[2001:2500]) {
  tryCatch({
    v <- get_caption(i, "it")
  }, error = function(e){})
  
  print(i)
  speech <- append(speech, v)
  Sys.sleep(0.4)
}



for (i in sal$url[2501:3000]) {
  tryCatch({
    v <- get_caption(i, "it")
  }, error = function(e){})
  
  print(i)
  speech <- append(speech, v)
  Sys.sleep(0.4)
}



for (i in sal$url[3001:3500]) {
  tryCatch({
    v <- get_caption(i, "it")
  }, error = function(e){})
  
  print(i)
  speech <- append(speech, v)
  Sys.sleep(0.4)
}



for (i in sal$url[3501:4000]) {
  tryCatch({
    v <- get_caption(i, "it")
  }, error = function(e){})
  
  print(i)
  speech <- append(speech, v)
  Sys.sleep(0.4)
}



for (i in sal$url[4001:4509]) {
  tryCatch({
    v <- get_caption(i, "it")
  }, error = function(e){})
  
  print(i)
  speech <- append(speech, v)
  Sys.sleep(0.4)
}


save(... = speech, file = "speech1.Rdata")