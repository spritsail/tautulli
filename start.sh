#! /bin/sh

git -C /plexpy pull

python2.7 /plexpy/PlexPy.py --datadir /config/plexpy
