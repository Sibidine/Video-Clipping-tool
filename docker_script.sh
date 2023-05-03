#!/bin/sh


./dependency_check.sh
./clip.sh

pwd
ls -la


mv *.mp4 *.mp3  /media
mv download_logs.txt  /media


# cp *.mp4 *.mp3  /media
# cp download_logs.txt  /media
