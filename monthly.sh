#!/usr/bin/bash
declare -A MONTH
MONTH[1]="Jan"
MONTH[2]="Feb"
MONTH[3]="Mar"
MONTH[4]="Apr"
MONTH[5]="May"
MONTH[6]="Jun"
MONTH[7]="Jul"
MONTH[8]="Aug"
MONTH[9]="Sep"
MONTH[10]="Oct"
MONTH[11]="Nov"
MONTH[12]="Dec"
M=$(date '+%m')
OLDVALUE=3.06
MONTH=$(date '+%b')
# set $(printf "%s %.2f\n" $(awk '{print $1, $3}' ~/logs/wallet_permonth.log ))
printf "%s %.2f\n" $(awk '{print $1, $3}' /home/chia/logs/wallet_permonth.log ) | while read LINE
do
	set $LINE
	X=$(echo $1 | cut -d'/' -f2 )
	X=$(expr $X \* 1)
#	[ $X -ne 1 ] && (( X-- )) || X=12
#	[ $X -eq 1 ] && X=12
	NEWVALUE=$(echo "$2 - $OLDVALUE" | bc)
	echo "${MONTH[$X]} $NEWVALUE - $2"
	OLDVALUE=$2
done | tac
