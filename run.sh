#!/bin/sh
IMAGE=pylucene_build
CONTAINER_NAME=pylucene_build
VOLUME_OPT="-v $(pwd):/host:rw"
OPTS="--name $CONTAINER_NAME $VOLUME_OPT"
docker rm $CONTAINER_NAME
if [ $# -eq 0 ]; then
	docker run -ti $OPTS $IMAGE $CMD
else
	docker run -ti $OPTS $IMAGE "$@"
fi

