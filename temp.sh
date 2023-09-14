#!/bin/bash

for D in $(df -h|grep /dev/sd|cut -c 1-8|sort)
do
	echo $D
	sudo smartctl -a $D|grep Temp
done
