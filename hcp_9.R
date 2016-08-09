# hcp 9
setwd("/home/ollie/git_tree/pewtermoon/head_cleaner_plus")

library(seewave)

# Get audio file from YT
yt_url <- "https://www.youtube.com/watch?v=LxGuumZ4UxE"
audio_format <- "vorbis"
filename <- "hcp_9"

extract_audio_cmd <- paste("youtube-dl --extract-audio --audio-format", 
                           paste0("'", audio_format, "'"),
                           "--output", paste0("'", filename, ".%(ext)s'"), 
                           yt_url)

if(!file.exists("hcp_9.ogg")){
    system(extract_audio_cmd)
}

# Get ABC's audio file
# Convert 9 from mp3 to ogg
if(!file.exists("9.ogg")){
    system("avconv -i 9.mp3 9.ogg")
}
  
# Play with sox
system("sox hcp_9.ogg hcp_9_2.ogg trim 4 19 speed 0.75 reverb 80")
system("sox -m 9.ogg hcp_9.ogg 9_2.ogg")
system("play 9_2.ogg")
