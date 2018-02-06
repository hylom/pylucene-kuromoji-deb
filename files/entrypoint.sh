#!/bin/bash
set -eo pipefail

if [ "$1" != "" ]; then
    exec "$@"
else
    build
fi

build () {
    cd /root/pylucene-*/
    debuild -b -us -uc
    cd /root/
    cp *osdn-* /host/
}

