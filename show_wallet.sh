#!/usr/bin/sh

while read log
do
	echo $log
done < /home/chia/logs/wallet.log
