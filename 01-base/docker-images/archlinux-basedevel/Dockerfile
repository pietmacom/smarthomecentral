FROM 192.168.182.17:5000/aarch64/archlinux:latest
#FROM menci/archlinuxarm:base-devel
RUN pacman --noconfirm -Syu
RUN pacman --noconfirm -S base-devel rsync git && \
    useradd -U -d /build build && \
    echo "build ALL=NOPASSWD: ALL" >> /etc/sudoers && \
    mkdir /src /build && \
    chown build:build /src /build

WORKDIR /build

# HAVE TO START WITH ROOT! ELSE FAKED STARTS FOREVER!
USER root


