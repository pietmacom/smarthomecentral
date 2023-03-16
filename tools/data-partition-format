#!/bin/sh -ex

#PARTITION="/dev/mmcblk0p4"

function _addToFstab() {
    if [[ -z "$(cat /etc/fstab | grep "${1}")" ]];
    then
	if [[ ! -z "$(mount | grep 'on / type .*(ro')" ]];
	then
	    mount -o remount,rw /
	fi

	echo "${1}" >> /etc/fstab
	echo "Entry added to fstab ${1}"
    else
	echo "Entry found in fstab ${1}"
    fi
}

function _addToData() {
    local _source="${1}"
    local _destination="${2}"

    if [[ -z "${_destination}" ]];
    then
	_destination="/media/data${_source}"
    fi

    mkdir -p ${_destination}
    chmod --reference=${_source} ${_destination}
    chown --reference=${_source} ${_destination}
}

function _rebindToData() {
    local _source="${1}"
    local _destination="${2}"

    if [[ -z "${_destination}" ]];
    then
	_destination="/media/data${_source}"
    fi

    _addToData ${_source} ${_destination}
    _addToFstab "${_destination} ${_source} none bind"
}

if [[ -z "$1" ]];
then
    echo "No Partition provided. Partition is going to be formated!"
    exit
fi

systemctl stop docker
systemctl stop docker.socket
systemctl stop containerd
systemctl stop sshd
sleep 30

PARTITION="$1"
PARTITION_ID="$(find -L /dev/disk/by-id -samefile ${PARTITION} | head -n 1)"
if [[ ! -z "$(mount | grep '/media/data')" ]];
then
    umount -A ${PARTITION}
fi

mkfs.ext4 ${PARTITION_ID}

mkdir -p /media/data
_addToFstab "${PARTITION_ID} /media/data ext4 rw,noinit_itable,noatime,nodiratime,discard 0 2"

mount ${PARTITION_ID} /media/data
rm -rf "/media/data/lost+found"

_addToData /etc

_addToData /etc/ssh
_rebindToData /etc/ssh/sshd /media/data/etc/ssh
ssh-keygen -A -f /media/data

_addToData /var

_rebindToData /var/log
_rebindToData /var/tmp
_rebindToData /var/cache

_addToData /var/lib
#_rebindToData /var/lib/systemd
_rebindToData /var/lib/docker

mkdir -p /var/lib/containerd
chmod --reference=/var/lib/docker /var/lib/containerd
chown --reference=/var/lib/docker /var/lib/containerd
_rebindToData /var/lib/containerd

_addToData /root

mkdir -p /media/data/etc/homer
cp config.default/homer/config-base.yml /media/data/etc/homer/config-base.yml

systemctl daemon-reload
mount -a

systemctl restart sshd
systemctl restart docker

docker compose create
docker compose restart
