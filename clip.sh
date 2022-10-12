#!/bin/bash

#DECLARATIONS

# USER INPUTS:
# link
# start_time
# length
# name_output
# video_url
# audio_url
# video_length
# download_type
# file_type

#INPUT

read -p "Enter link to video: " link
echo "Enter 1 for the full video, enter 2 for a portion"
read video_length

# FULL VIDEO
if [[ video_length -eq 1 ]]
then
	echo "Enter 1 for audio, 2 for video"
	read file_type
	if [[ file_type -eq 1 ]]
	then
		youtube-dl -x --audio-format mp3 --prefer-ffmpeg "$link"
	elif [[ file_type -eq 2 ]]
	then
		youtube-dl "$link"
	fi

# PORTION OF THE FULL VIDEO
elif [[ video_length -eq 2 ]]
then
	read -p "Enter starting point (in seconds or hours:minutes:seconds): " start_time
	read -p "Enter length of clip: " length
	read -p "Enter name of output file:" name_output 

	#GENERATING THE TRUE URLs FOR THE VIDEO
	read -d'\n' video_url audio_url <<< $(youtube-dl --youtube-skip-dash-manifest -g "$link")
	ffmpeg -ss $start_time -i "$video_url" -ss $start_time -i "$audio_url" -map 0:v -map 1:a -t $length -c:v libx264 -c:a aac $name_output.mp4
fi
