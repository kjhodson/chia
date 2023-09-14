#!/bin/bash
# date "+%d/%m %H:%M"
# for PLOT in plots01 plots02 plots03 plots11 plots12 plots13 plots14 plots15 plots21 plots22 plots23 plots24 plots25


# df -T | awk '$1 ~ /\/dev\/sd/ {print $2}' | while read LINE
df --output=source,fstype,target | sort | egrep 'xfs|ext4' | while read LINE
do
	set $LINE
	if [[ $2 =~ xfs ]]
	then
		echo -e "$1 $3: \c"
		sudo xfs_admin -l $1 | awk '{print $NF}'  | sed 's/"//g' 
	else
		echo -e "$1 $3: \c"
		sudo e2label $1 | awk '{print $NF}'| sed 's/"//g'
	fi
done
exit

do
   echo -n " Plot dir number /${PLOT}: "
   ls /${PLOT}/*.plot|wc -l
   COUNT=$(ls /${PLOT}/*.plot|wc -l)
   (( TOTAL = TOTAL + COUNT ))
done
echo "Total number of plots is ${TOTAL}"

