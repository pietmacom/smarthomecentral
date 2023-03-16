#!/bin/sh +ex
mkdir -p build && \
chmod 777 build && \
docker run -it \
	   --rm \
	   -v .:/src \
	   -v ./build:/build \
	   --privileged \
	   mybasedevel sh -c "su build -c 'rsync -rq --progress /src/ /build --exclude build' && \
	                      su build"
