#!/bin/bash

#DECLARATIONS

# link="USER INPUT"
# start_time="USER INPUT"
# length="USER INPUT"
# name_output = "USER INPUT"
# video_url="USER INPUT"
# audio_url="USER INPUT"

#INPUT

read -p "Enter link to video: " link
read -p "Enter starting point (in seconds or hours:minutes:seconds): " start_time
read -p "Enter length of clip: " length
read -p "Enter name of output file: (put in an extension of your choice)" name_output 

#GENERATING THE TRUE URLs FOR THE VIDEO
read -d'\n' video_url audio_url <<< $(youtube-dl --youtube-skip-dash-manifest -g "$link")


ffmpeg -ss $start_time -i "$video_url" -ss $start_time -i "$audio_url" -map 0:v -map 1:a -t $length -c:v libx264 -c:a aac $name_output
