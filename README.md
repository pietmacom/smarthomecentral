# smarthomecentral
Docker Based Smart Home Central

# Installation

cd basesystem
./docker-compose-recreate.sh

Open a browser window at http://this_hostip/


# Backup
## Explain backup procedure

./docker-compose exec -it docker-volume-backup /root/backup-strategy-explain.sh

    Normalized backup strategy definition:
            i1*7 7*4 4*6 6*2 (given: i1 7 4 6*2)

    Explained backup strategy:
            i1*7    => Backup - changes - every 1. days and keep last 7 backups for 7 days (1 Backups)
            7*4     => Backup every 7. days and keep last 4 backups for 28 days (4 Backups)
            4*6     => Backup every 28. days and keep last 6 backups for 168 days (6 Backups)
            6*2     => Backup every 168. days and keep last 2 backups for 336 days (2 Backups)

    Examples for storage usage for whole period:
            13 Backups * 10 MB      => 130 MB / 0.13 GB
            13 Backups * 100 MB     => 1300 MB / 1.27 GB
            13 Backups * 1 GB       => 13312 MB / 13.00 GB / 0.01 TB
            13 Backups * 10 GB      => 133120 MB / 130.00 GB / 0.13 TB
            13 Backups * 20 GB      => 266240 MB / 260.00 GB / 0.25 TB
            13 Backups * 40 GB      => 532480 MB / 520.00 GB / 0.51 TB
            13 Backups * 80 GB      => 1064960 MB / 1040.00 GB / 1.02 TB
            13 Backups * 100 GB     => 1331200 MB / 1300.00 GB / 1.27 TB

## Restore Backup

$ ./docker-compose exec -it docker-volume-backup /root/backup-restore.sh

    [INFO] Please pass filename from list to be restored
    -rw-r--r-- 1 dsrvhm03 dsrvhm03  39M Mar 14 21:49 backup-volume-i168r336-202300.tar.gz
    drwxr-xr-x 8 dsrvhm03 dsrvhm03 4.0K Mar 15 20:52 backup-volume-i1r7-202310
    -rw-r--r-- 1 dsrvhm03 dsrvhm03  39M Mar 14 21:49 backup-volume-i28r168-202302.tar.gz
    -rw-r--r-- 1 dsrvhm03 dsrvhm03  39M Mar 14 21:49 backup-volume-i7r28-202310.tar.gz

$ ./docker-compose exec -it docker-volume-backup /root/backup-restore.sh backup-volume-i7r28-202310.tar.gz
