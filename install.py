#!/usr/bin/python3

import os
import sys
from subprocess import check_output
try:
    from urllib.request import urlopen
except ImportError:
    from urllib import urlopen

links = {
    "ackrc": 0,
    "aria2": 0,
    "bashrc": 0,
    "gitconfig": 0,
    "hgrc": 0,
    "inputrc": 0,
    "profile": 0,
    "vim": 0,
    "vimrc": 0,
    "tmux.conf": 0,
}

downloads = {
    # vim plug
    "vim/autoload/plug.vim" : "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim",
    # bash autocompleion
    "bash-scripts/mercurial.bash" : "http://selenic.com/hg/raw-file/tip/contrib/bash_completion",
    "bash-scripts/pip.bash" : "https://raw.githubusercontent.com/ekalinin/pip-bash-completion/master/pip",
    "bash-scripts/django.bash" : "https://github.com/django/django/raw/master/extras/django_bash_completion",    
    "bash-scripts/invoke.bash" : "https://raw.githubusercontent.com/pyinvoke/invoke/master/completion/bash",
    # mine
    "bash-scripts/pimp.bash": "https://github.com/aliva/pimp/raw/master/pimp.sh",
    "bin/rip-flac-to-mp3":
        "https://gist.githubusercontent.com/aliva/1038a42c779b0f69c471/raw/d4d8d9ea3eeed0cc7c7f86a0c6f3cc25910a9703/rip-flac-to-mp3",
    "bin/hiweb":
        "https://gist.githubusercontent.com/aliva/d6380cda9e1561190f7c/raw/c6b8a35d1bd2a16c5444ec4d87e4f8e6259de3d0/hiweb",
}

ROOT = check_output("git rev-parse --show-toplevel".split(" ")).decode("utf-8").strip()
HOME = os.path.expanduser("~")

print ("ROOT %s" % ROOT)
print ("HOME %s" % HOME)

# GENRATE
with open(os.path.join(ROOT, "gitignore"), "r") as git:
    print ("GENERATING hgignore")
    with open(os.path.join(ROOT, "hgignore"), "w") as hg:
        hg.write("syntax:glob\n")
        hg.write(git.read())
        
# DOWNLOAD
if "--get" in sys.argv:
    for file in downloads:
        print("DOWNLOADING '%s'" % file)
        response = urlopen(downloads[file])
        with open(os.path.join(ROOT, file), "w") as output:
            output.write(response.read().decode("utf-8"))

# LINK        
for link in links:
    print ("LINKING '%s'" % link)
    if links[link] == 0:
        dest = ".%s" % link
    else:
        dest = links[link]
    dest = os.path.join(HOME, dest)
    
    if os.path.exists(dest):
        os.remove(dest)
    
    os.symlink(os.path.join(ROOT, link), dest)