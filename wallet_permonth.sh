#!/bin/bash

chia wallet show|grep --color=always -A 2 'Chia Wallet' | while read LINE
do
set -- $LINE
    case $1 in
	-Total  ) TOTAL=$3
                  OTOTAL=$(cat /home/chia/logs/total_permonth.txt)
                  RCVD=$(echo $TOTAL - $OTOTAL | bc)
			  echo -n "$(date '+%d/%m/%y %H:%M:%S') "
			  echo "$TOTAL - rcvd: $RCVD" 
			  echo $TOTAL > /home/chia/logs/total_permonth.txt ;;
    esac
done
