# Video-Clipping-tool
Tool for downloading clips of videos from the internet.

This tool will allow the user to generate a clip from a youtube video using `youtube-dl` and `ffmpeg`, which can be downloaded as audio or video. The idea behind this script came from [this forum post](https://unix.stackexchange.com/questions/230481/how-to-download-portion-of-video-with-youtube-dl-command) .

Disclaimer: Make sure to have both `ffmpeg` and `yt-dlp` installed for this to work!

Usage instructions: 

```
git clone https://github.com/Sibidine/Video-Clipping-tool.git
cd Video-Clipping-tool
chmod +x dependency_check.sh
./dependency_check.sh
chmod +x clip.sh
./clip.sh
```

Podman/Docker testing

To try this out even if your distribution does not have the latest version of yt-dlp and ffmpeg.
You may replace podman with docker.
Clone the repo, cd into it and then build the image
```
podman build --no-cache --rm -t video-clipping-tool-image .
podman run --rm -it -v $(pwd):/media video-clipping-tool-image
```

To remove the image
```
podman rmi --force video-clipping-tool-image
```

Todo- Add a master script that invokes both the current scripts, and correct the readme to give instructions to run the master script instead.
