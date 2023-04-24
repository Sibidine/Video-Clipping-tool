#!/bin/bash

echo -n "Checking dependencies... "


for dependency_name in yt-dlp ffmpeg
do
   [[ $(which $dependency_name 2>/dev/null) ]] || { echo -en "\n$dependency_name needs to be installed. Use 'sudo apt install $dependency_name'";deps=1; }
done

if [[ $deps -ne 1 ]]
then
	echo "OK" 
else	 
	echo -en "\nInstall the above and rerun this script.\nYou may install ffmpeg or yt-dlp via your package manager or via python3's pip.\n";exit 1;
fi


