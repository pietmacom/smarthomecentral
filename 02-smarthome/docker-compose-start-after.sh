#!/bin/sh -ex

# Docs
# - https://discourse.nodered.org/t/auto-install-packages-using-package-json/23135/4
# - https://nodered.org/docs/user-guide/node-red-admin
docker compose exec -it nodered /bin/sh -c 'sleep 20 && node-red admin install node-red-contrib-huemagic-fork && node-red admin install node-red-contrib-ccu'

