#!/usr/bin/python

import os

whitelist = ["Xdefaults", "bash_profile", "bashrc", "config", "gvimrc",
    "inputrc", "jshintrc", "tmux.conf", "vim", "vimrc", "xmonad"]

homeDir = os.path.expanduser("~")
currentFileDirectory = os.path.dirname(os.path.realpath(__file__))

for file in whitelist:
    dest = homeDir + "/." + file
    os.symlink(currentFileDirectory + "/" + file, dest)
