#!/bin/sh -ex

_arguments="$@"
mkdir -p build && \
chmod 777 build && \
docker run -it \
	   --rm \
	   -v .:/src \
	   -v ./build:/build \
	   --privileged \
	   mybasedevel sh -c "rsync -rq --progress /src/ /build --exclude build && \
	                      su build -c '${_arguments[@]}'"
