#!/bin/sh


./dependency_check.sh
./clip.sh

pwd
ls -la

cp *.mp4 *.mp3  /media
cp download_logs.txt  /media
