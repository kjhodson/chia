#!/usr/bin/bash

#STARTED=$(date)
echo "Started: ${STARTED}"
date '+%H:%M:%S'

chia wallet show | while read LINE
do
set -- "$LINE"
echo "$1"
done




exit
echo
ps -ef|grep -E 'chia_wallet|chia_full_node|chia_farmer|chia_harvester'|grep -vE 'worker|grep'
echo
chia wallet show|grep -A 1 'Chia Wallet'
echo
chia farm summary | egrep 'Total|Expected|count'
echo
chia plotnft show | egrep 'Percent|Sync'
echo
chia wallet get_transactions | egrep -v 'Transactio|To|Status' |head -20
echo
