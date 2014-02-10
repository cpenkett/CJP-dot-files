#!/bin/bash
#"crontab -e" line:
#00 20 * * 1-5 $HOME/bin/copy_bash_history.sh
cp $HOME/.bash_history $HOME/projects/bash_history/bash_history_$(date --iso-8601=minutes).txt > /dev/null 2>&1
