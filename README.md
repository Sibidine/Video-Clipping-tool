# Video-Clipping-tool
Tool for downloading clips of videos from the internet.

This tool will allow the user to generate a clip from a youtube video using `youtube-dl` and `ffmpeg`, which can be downloaded as audio or video. The idea behind this script came from [this forum post](https://unix.stackexchange.com/questions/230481/how-to-download-portion-of-video-with-youtube-dl-command) .

Disclaimer: Make sure to have both `ffmpeg` and `youtube-dl` installed for this to work!

Usage instructions: 

``` 
git clone https://github.com/Sibidine/Video-Clipping-tool.git
cd Video-Clipping-tool
chmod +x clip.sh
./clip.sh
```

Todo- Add a master script that invokes both the current scripts, and correct the readme to give instructions to run the master script instead.
