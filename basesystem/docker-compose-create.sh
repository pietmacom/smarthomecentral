#!/bin/sh -e

function yes_or_no {
    while true; do
        read -p "$* [y/n]: " yn
        case $yn in
            [Yy]*) return 0  ;;  
            [Nn]*) echo "Aborted" ; return  1 ;;
        esac
    done
}

docker compose down --remove-orphans
yes_or_no "Do you want to remove volumes?" && docker compose down --volumes

docker compose create
source ./docker-compose-create-after.sh

#yes_or_no "Do you want to start services?" && docker compose start

docker compose start
source ./docker-compose-start-after.sh