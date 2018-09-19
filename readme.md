# What's this ?

PyLucene 4.10 supports "kuromoji" morphological analyzer, but
pylucene (python-lucene) package in Debian (sid) not supports it
because of build settings. 

This repository provides build config files to make kuromoji-enabled
python-lucene package, and container config files to build.

# How to use

You need docker environment and the user who can access docker daemon.

    $ git clone https://pf.osdn.net/gitroot/h/hy/hylom/pylucene-kuromoji-deb.git
    $ cd pylucene-kuromoji-deb/
    $ ./build.sh
    $ ./run.sh
    $ docker rm pylucene_build


