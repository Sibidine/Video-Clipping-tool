#!/bin/bash

#DECLARATIONS

# USER INPUTS:
# link: takes the URL of the video to be downloaded
# start_time: takes the starting point of the video from where to download
# length: takes the length of the clip desired
# name_output: takes the name of the output file to be made (without the extension)
# video_length: takes a binary input for whether the full video is desired, or merely a portion of it
# file_type: binary input for if audio or video is desired

#INPUT

read -p "Enter link to video: " link

# Check if the link starts with "https://www.youtube.com"
if ! [[ $link == https://www.youtube.com* ]]; then
	echo "Link does not start with https://www.youtube.com"
	echo "Please provide a valid link"
	exit 1
fi

echo "Enter 1 for the full video, enter 2 for a portion"
read video_length

# FULL VIDEO
if [[ video_length -eq 1 ]]
then
	echo "Enter 1 for audio, 2 for video"
	read file_type
	if [[ file_type -eq 1 ]]
	then
		# AUDIO
		yt-dlp -x --audio-format mp3 --prefer-ffmpeg "$link" > download_logs.txt
	elif [[ file_type -eq 2 ]]
	then
		#  VIDEO
		yt-dlp "$link" -S res,ext:mp4:m4a --recode mp4 > download_logs.txt
	fi

# PORTION OF THE FULL VIDEO
elif [[ video_length -eq 2 ]]
then
	read -p "Enter starting point (in seconds or hours:minutes:seconds): " start_time
	read -p "Enter length of clip: " length
	read -p "Enter name of output file:" name_output 

	echo "Enter 1 for audio, 2 for video"
	read file_type

	# SETTING SENSIBLE DEFAULTS
	start_time=${start_time:-"00:00:00"}
	length=${length:-"30"}
	name_output=${name_output:-"unnamed_$(date +"%B_%d_%Y_%T")"}

	# GENERATING THE TRUE URLs FOR THE VIDEO
	read -d'\n' video_url audio_url <<< $(yt-dlp --youtube-skip-dash-manifest -g "$link")

	if [[ file_type -eq 1 ]]
	then
		# AUDIO
		ffmpeg -ss $start_time -i "$audio_url" -t $length $name_output.mp3 > download_logs.txt
	elif [[ file_type -eq 2 ]]
	then
		# VIDEO	
		ffmpeg -ss $start_time -i "$video_url" -ss $start_time -i "$audio_url" -map 0:v -map 1:a -t $length -c:v libx264 -c:a aac $name_output.mp4 > download_logs.txt
	fi
fi

echo -e "\nCheck if the download has completed in the present working directory, if not, check the download_logs.txt." 
