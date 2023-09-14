#!/bin/bash

TODAY=$(date '+%Y-%m-%d')
COUNT=$(grep ${TODAY} ~/logs/wallet_transactions.txt |wc -l)

chia wallet show|grep --color=always -A 2 'Chia Wallet' | while read LINE
do
set -- $LINE
    case $1 in
	-Total  ) TOTAL=$3
                  OTOTAL=$(cut -d" " -f1 /home/chia/logs/total_perday.txt)
                  RCVD=$(echo $TOTAL - $OTOTAL | bc)
			  echo -n "$(date '+%d/%m/%y %H:%M:%S') "
			  echo "$TOTAL - rcvd: $RCVD (${COUNT})" 
			  echo "$TOTAL ($COUNT)" > /home/chia/logs/total_perday.txt ;;
    esac
done
