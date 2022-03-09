library(tuber)
yt_oauth(id, key, token = '')

#I scraped the channel IDs from page source

pd_ch <- list_channel_videos(channel_id = pd, max_results = 51)
#max_results = 51 because anything >50 gives all the video in the account

m5s_ch <- list_channel_videos(channel_id = m5s, max_results = 51)

fdi_ch <- list_channel_videos(channel_id = fdi, max_results = 51)

lg_ch <- list_channel_videos(channel_id = lg, max_results = 51)

fi_ch <- list_channel_videos(channel_id = fi, max_results = 51)



library(rio)

export(pd_ch, file = "pd_channel.csv")

export(m5s_ch, file = "m5s_channel.csv")

export(fdi_ch, file = "fdi_channel.csv")

export(lg_ch, file = "lg_channel.csv")

export(fi_ch, file = "fi_channel.csv")



#Since Tuber's get_captions doesn't work anymore, I'm gonna be using Youtubecaption's get_captions
#But it requires URLs, which I haven't

library(stringr)

pd_url <- str_c("https://www.youtube.com/watch?v=", pd_ch$contentDetails.videoId[1:1955])

m5s_url <- str_c("https://www.youtube.com/watch?v=", m5s_ch$contentDetails.videoId[1:20000])

fdi_url <- str_c("https://www.youtube.com/watch?v=", fdi_ch$contentDetails.videoId[1:5524])

lg_url <- str_c("https://www.youtube.com/watch?v=", lg_ch$contentDetails.videoId[1:9548])

fi_url <- str_c("https://www.youtube.com/watch?v=", fi_ch$contentDetails.videoId[1:60])



pd_data <- data.frame(pd_ch[2:5], pd_url)

m5s_data <- data.frame(m5s_ch[2:5], m5s_url)

fdi_data <- data.frame(fdi_ch[2:5], fdi_url)

lg_data <- data.frame(lg_ch[2:5], lg_url)

fi_data <- data.frame(fi_ch[2:5], fi_url)



export(pd_data, "pd_data.csv")

export(m5s_data, "m5s_data.csv")

export(fdi_data, "fdi_data.csv")

export(lg_data, "lg_data.csv")

export(fi_data, "fi_data.csv")



#Download of captions of every video

library(youtubecaption)

library(rio)
pd_data <- import("pd_data.csv")


pd_captions <- vector()
v <- vector()


for (i in pd_data$pd_url[1:1955]) {
  tryCatch({
    v <- get_caption(i, "it")
  }, error = function(e){})
  
  print(i)
  pd_captions <- append(pd_captions, v)
  Sys.sleep(0.3)
}


save(... = pd_captions, file = "pd_captions.Rdata")



m5s_data <- import("m5s_data.csv")

m5s_captions <- vector()
v <- vector()

for (i in m5s_data$m5s_url[1:5000]) {
  tryCatch({
    v <- get_caption(i, "it")
  }, error = function(e){})
  
  print(i)
  m5s_captions <- append(m5s_captions, v)
}


save(... = m5s_captions, file = "m5s_captions.Rdata")


