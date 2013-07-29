#!/usr/bin/python

import os

whitelist = ["Xdefaults", "bash_profile", "bashrc", "config", "gvimrc",
    "inputrc", "jshintrc", "tmux.conf", "vim", "vimrc", "xmonad"]

homeDir = os.path.expanduser("~")

for file in whitelist:
    dest = homeDir + "/." + file
    os.symlink(file, dest)
