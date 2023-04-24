# |=======================================================|
# |install.py - The install script for Video-Clipping-Tool|
# |=======================================================|

from os import system
from os.path import isfile

# package managers(currently apt,pacman,dnf,xbps,apk)
path_apt = "/usr/bin/apt"
path_pacman = "/usr/bin/pacman"
path_dnf = "/usr/bin/dnf"
path_xbps = "/usr/bin/xbps"
path_apk = "/usr/bin/apk"

# git is the only make depend
if isfile(path_apt) == True:
  prcs = system("sudo apt install git")
  if prcs != 0:
    raise OSError("error: git failed to install")
  else:
    pass
elif isfile(path_pacman) == True:
  prcs = system("sudo pacman -S git")
  if prcs != 0:
    raise OSError("error: git failed to install")
  else:
    pass
elif isfile(path_pacman) == True:
  prcs = system("sudo pacman -S git")
  if prcs != 0:
    raise OSError("error: git failed to install")
  else:
    pass
else:
  print("error: unsupported package manager")
