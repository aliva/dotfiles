#!/usr/bin/python3

import os
import sys
from subprocess import check_output
try:
    from urllib.request import urlopen
except ImportError:
    from urllib2 import urlopen

links = {
    "atom": 0,
    "ackrc": 0,
    "bashrc": 0,
    "cow": 0,
    "gitconfig": 0,
    "hgrc": 0,
    "inputrc": 0,
    "profile": 0,
    #"torrc": 0,
    #"vim": 0,
    "tmux.conf": 0,
    "vimrc": 0,
    "zshrc": 0,
    "aria2.conf": "aria2/aria2.conf",
}

downloads = {
    # vim plug
    #"vim/autoload/plug.vim" : "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim",

    # bash autocompleion
    # "bash-scripts/mercurial.bash" : "http://www.selenic.com/hg/raw-file/tip/contrib/bash_completion",
    # "bash-scripts/pip.bash" : "https://raw.githubusercontent.com/ekalinin/pip-bash-completion/master/pip",
    # "bash-scripts/django.bash" : "https://github.com/django/django/raw/master/extras/django_bash_completion",
    # "bash-scripts/invoke.bash" : "https://raw.githubusercontent.com/pyinvoke/invoke/master/completion/bash",
    # "bash-scripts/celery.bash" : "https://raw.githubusercontent.com/celery/celery/master/extra/bash-completion/celery.bash",
    # "bash-scripts/go.bash" : "https://github.com/kura/go-bash-completion/raw/master/etc/bash_completion.d/go",

    # zsh
    "zsh/plugins/invoke/invoke.plugin.zsh": "https://github.com/pyinvoke/invoke/raw/master/completion/zsh",

    # mine
    # "bash-scripts/pimp.bash": "https://github.com/aliva/pimp/raw/master/pimp.sh",
    "bin/rip-flac-to-mp3": "https://gist.githubusercontent.com/aliva/1038a42c779b0f69c471/raw/rip-flac-to-mp3",
    "bin/hiweb": "https://gist.githubusercontent.com/aliva/d6380cda9e1561190f7c/raw/hiweb",
}

ROOT = check_output("git rev-parse --show-toplevel".split(" ")).decode("utf-8").strip()
HOME = os.path.expanduser("~")

print ("ROOT %s" % ROOT)
print ("HOME %s" % HOME)

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
    print ("GENERATING hgignore")
    with open(os.path.join(ROOT, "hgignore"), "w") as hg:
        hg.write("syntax:glob\n")
        hg.write(git.read())

# LINK
for link in links:
    print ("LINKING '%s'" % link)
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
