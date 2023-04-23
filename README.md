# Video-Clipping-tool
Tool for downloading clips of videos from the internet.

(Edit on 2/4/23- youtube-dl seems to have issues with uploader-id as of right now- for this to work, a nightly build is needed instead of the 2021.12.17 release, else this script does not work as of right now. Will update this bit incase of a new release. Right now youtube-dl has been removed from this program and yt-dlp is being used for now)

This tool will allow the user to generate a clip from a youtube video using `yt-dlp` and `ffmpeg`, which can be downloaded as audio or video. The idea behind this script came from [this forum post](https://unix.stackexchange.com/questions/230481/how-to-download-portion-of-video-with-youtube-dl-command) .

Disclaimer: Make sure to have both `ffmpeg` and `yt-dlp` installed for this to work!

Usage instructions: 

``` 
git clone https://github.com/Sibidine/Video-Clipping-tool.git
cd Video-Clipping-tool
chmod +x clip.sh
./clip.sh
```

Todo- Add a master script that invokes both the current scripts, and correct the readme to give instructions to run the master script instead.
