#!/usr/bin/bash
date '+%H:%M:%S'
echo -e -n "\n$GREEN"
ping -c 1 bbc.co.uk|grep 'bytes from'
echo
ps -ef| grep -vE 'worker|grep'| grep -E --color=auto 'chia_wallet|chia_full_node|chia_farmer|chia_harvester|timelord'
echo
chia wallet show|grep --color=auto -A 1 'Chia Wallet'
echo
chia farm summary | egrep --color=auto 'Total|Expected|Plot count'
echo
chia plotnft show | egrep --color=auto 'Percent|Sync|balance'
echo
chia show --state| egrep --color=auto 'Current Blockchain Status'
echo
tail -15 /home/chia/logs/wallet.log
echo
