#!/bin/bash
set -eo pipefail

build () {
    cd /root/pylucene-*/
    debuild -b -us -uc
    cd /root/
    cp *osdn-* /host/
}

if [ "$1" != "" ]; then
    exec "$@"
else
    build
fi

