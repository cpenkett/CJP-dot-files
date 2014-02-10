#!/bin/bash
#"crontab -e" line:
#30 12,16,20 * * 1-5 $HOME/bin/rsync_home.sh
BACKHOST=$1
/usr/bin/rsync -CAavz $HOME $USER@$BACKHOST:$HOME/backup > $HOME/projects/rsync_backup/log_$(date --iso-8601=minutes).txt 2>&1
#/usr/bin/rsync -Cavz --delete $HOME $USER@$BACKHOST:$HOME/backup > $HOME/projects/rsync_backup/log_$(date --iso-8601=minutes).txt 2>&1
#/usr/bin/rsync -aAv --backup --backup-dir=${DATA}_backups/$(date +%y%m%d) $DATADIR $BACK_DEST > $HOME/backups/${DATA}/rsync_$(date --iso-8601=minutes).txt 2> /dev/null
