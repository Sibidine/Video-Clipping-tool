# |=======================================================|
# |install.py - The install script for Video-Clipping-Tool|
# |=======================================================|

from os import system, chdir
from os.path import isfile

# package managers(currently apt,pacman,dnf)
print("checking package manager")
path_apt = "/usr/bin/apt"
path_pacman = "/usr/bin/pacman"
path_dnf = "/usr/bin/dnf"

# git is the only make depend
if isfile(path_apt) == True:
  print("apt found")
  print("installing git , ffmpeg , yt-dlp")
  prcs = system("sudo apt install git ffmpeg yt-dlp")
  if prcs != 0:
    raise OSError("error: git failed to install")
  else:
    pass
elif isfile(path_pacman) == True:
  print("pacman found")
  print("installing git , ffmpeg , yt-dlp")
  prcs = system("sudo pacman -S git ffmpeg yt-dlp")
  if prcs != 0:
    raise OSError("error: git failed to install")
  else:
    pass
elif isfile(path_dnf) == True:
  print("dnf found")
  print("installing git , ffmpeg , yt-dlp")
  prcs = system("sudo dnf install git ffmpeg yt-dlp")
  if prcs != 0:
    raise OSError("error: git failed to install")
  else:
    pass
else:
  print("error: unsupported package manager")
  
 # now clone the repo
print("cloning the repo")
prcs = system("git clone https://github.com/sontaimnt/Video-Clipping-Tool")
if prcs != 0:
  print("installation failed")
else:
  pass

print("changing directory")
chdir("Video-Clipping-Tool")
print("now installing Video-Clipping-Tool")
prcs = system("sudo install -Dm755 clip.sh /usr/bin/clip")
if prcs != 0:
  print("installation failed")
else:
  print("Video-Clipping-Tool installed")
