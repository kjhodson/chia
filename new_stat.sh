#!/usr/bin/bash

#STARTED=$(date)
echo "Started: ${STARTED}"
date '+%H:%M:%S'
echo
ps -ef|grep -E 'chia_wallet|chia_full_node|chia_farmer|chia_harvester'|grep -vE 'worker|grep'
BALANCE=$(chia wallet show| grep -A1 Chia|awk '$2 ~ /Balance/{print $3}')
echo "BALANCE = $BALANCE"
echo
chia wallet show|grep -A 1 'Chia Wallet'
echo
chia farm summary | egrep 'Total|Expected|count'
echo
chia plotnft show | egrep 'Percent|Sync'
echo
chia wallet get_transactions | egrep -v 'Transactio|To|Status' |head -20
echo
