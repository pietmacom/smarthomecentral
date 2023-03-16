# smarthomecentral
Docker Based Smart Home Central

# Installation

cd basesystem
./docker-compose-recreate.sh

Open a browser window at http://this_hostip/


# Restore Backup

$ ./docker-compose exec -it docker-volume-backup /root/backup-restore.sh

    [INFO] Please pass filename from list to be restored
    -rw-r--r-- 1 dsrvhm03 dsrvhm03  39M Mar 14 21:49 backup-volume-i168r336-202300.tar.gz
    drwxr-xr-x 8 dsrvhm03 dsrvhm03 4.0K Mar 15 20:52 backup-volume-i1r7-202310
    -rw-r--r-- 1 dsrvhm03 dsrvhm03  39M Mar 14 21:49 backup-volume-i28r168-202302.tar.gz
    -rw-r--r-- 1 dsrvhm03 dsrvhm03  39M Mar 14 21:49 backup-volume-i7r28-202310.tar.gz

$ ./docker-compose exec -it docker-volume-backup /root/backup-restore.sh backup-volume-i7r28-202310.tar.gz
