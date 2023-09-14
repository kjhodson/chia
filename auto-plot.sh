#!/usr/bin/bash

clear

banner "start"
banner $(date +%H:%M:%S)
date

while ps -ef|grep plotte[r] > /dev/null
 do
    sleep 60
    echo -n "."
done


echo
banner "end"
banner $(date +%H:%M:%S)
date

# ~/Scripts/MM.sh
