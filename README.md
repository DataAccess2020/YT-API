# Youtube communication of Italian political parties


*If we analysed the verbal communication in videos published by official YouTube accounts for the major Italian political parties, what differences would we find?
I used the APIs **YouTube Data API v3** and **Watson Natural Language Understanding** to find out.*



### Hypotheses

- H1: Parties with common ideologies also show common keywords, emotional words and syntax.
- H2: Each party's keywords, emotional words and syntax change dramatically over time.


### Data

I created my datasets using the _YouTube Data API v3_, along with the R Packages _Tuber_ and _youtubecaptions_.
The Tuber package allowed me to manage the API directly from R; I was able to scrape account details for each political party and to obtain metadata for each video published on their accounts; I mostly relied on the metadata containing publishing date and video ID.

The youtubecaptions package allowed me to obtain captions for each video using the URLs, which I produced using the video IDs previously scraped.


### Methods

To look into my hypotheses, I will be using the Watson Natural Language Understanding API.


### Expected results

I expect allied parties to share common keywords and emotional words, as they may share values and ideologies. I also expect in-group differences over time, as some parties have had drastic changes over time (to name one example, Lega's communication after Lega Nord has become Lega - the YouTube account hasn't been changed, just renamed).


