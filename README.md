# YouTube communication of Italian political parties

*If we analysed the verbal communication in videos published by official YouTube accounts for the major Italian political parties, what differences would we find?
I used the APIs **YouTube Data API v3** to find out.*
<br>

<br>
<table>
<tr>
<td>

### 🔹 Hypotheses

- *H1*: Parties with common ideologies also show common keywords, emotional words and syntax.


### 🔹Data

I created my datasets using the [_YouTube Data API v3_](https://developers.google.com/youtube/v3/docs/), along with the R Packages _Tuber_ and _youtubecaptions_. <br>
The `Tuber` package allowed me to manage the API directly from R: the function `list_channel_videos` provided me with metadata for each video published on the YouTube channels, but I mostly relied on the metadata containing `publishing date` and `video ID`.

The `youtubecaptions` package allowed me to obtain captions for each video using the URLs, which I produced using the video IDs previously scraped.


### 🔹Methods

For each party's channel, I tokenized the captions to obtain overall word counts. I then calculated in-group relative frequencies to compare word choices between parties.



### 🔹Expected results

I expect allied parties to share common keywords and emotional words, as they may share values and ideologies. I also expect in-group differences over time, as some parties have had drastic changes over time (to name one example, Lega's communication after Lega Nord has become Lega - the YouTube account hasn't been changed, just renamed).



</td>
</tr>
</table>




