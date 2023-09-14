#!/bin/bash

chia wallet get_transactions > /home/chia/logs/wallet_transactions.txt
chia wallet show|grep --color=always -A 2 'Chia Wallet' | while read LINE
do
set -- $LINE
    case $1 in
	-Total  ) TOTAL=$3
                  OTOTAL=$(cat /home/chia/logs/total.txt)
                  RCVD=$(echo $TOTAL - $OTOTAL | bc)
                  if test $RCVD != 0
		  then
			  echo -n "$(date '+%d/%m/%y %H:%M:%S') "
			  echo "$TOTAL - rcvd: $RCVD" 
		  fi
			  echo $TOTAL > /home/chia/logs/total.txt ;;
    esac
done
