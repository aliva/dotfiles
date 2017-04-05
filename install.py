#!/usr/bin/python3

import os
import sys
from subprocess import check_output
try:
    from urllib.request import urlopen
except ImportError:
    from urllib2 import urlopen

links = {
    "ackrc": 0,
    "aria2.conf": "aria2/aria2.conf",
    "bashrc": 0,
    "editorconfig": 0,
    "gitconfig": 0,
    "hgrc": 0,
    "isort.cfg": 0,
    "pythonrc": 0,
    "profile": 0,
    "tmux.conf": 0,
    "vimrc": 0,
    "vscode": "config/Code/User",
    "Xmodmap": 0,
    "zshrc": 0,
    # "vim": 0,
}

downloads = {
}

ROOT = check_output(
    "git rev-parse --show-toplevel".split(" ")
).decode(
    "utf-8"
).strip()
HOME = os.path.expanduser("~")

print("ROOT %s" % ROOT)
print("HOME %s" % HOME)

# DOWNLOAD
if "--get" in sys.argv:
    for file in downloads:
        print("DOWNLOADING '%s'" % file)
        try:
            response = urlopen(downloads[file], timeout=5)
            with open(os.path.join(ROOT, file), "w") as output:
                output.write(response.read().decode("utf-8"))
        except Exception as e:
            print("ERROR: %s" % str(e))
            continue

# GENRATE
with open(os.path.join(ROOT, "gitignore"), "r") as git:
    print("GENERATING hgignore")
    with open(os.path.join(ROOT, "hgignore"), "w") as hg:
        hg.write("syntax:glob\n")
        hg.write(git.read())

# LINK
for link in links:
    print("LINKING '%s'" % link)
    if links[link] == 0:
        dest = ".%s" % link
    else:
        dest = ".%s" % links[link]

        if dest.find("/"):
            head, tail = os.path.split(dest)
            conf_dir = os.path.join(HOME, head)
            if not os.path.exists(conf_dir):
                os.makedirs(conf_dir)

    dest = os.path.join(HOME, dest)

    if os.path.exists(dest):
        os.remove(dest)

    os.symlink(os.path.join(ROOT, link), dest)
