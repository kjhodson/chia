#!/bin/bash
# date "+%d/%m %H:%M"
#for PLOT in plots11 plots12 plots13 plots14 plots15 plots21 plots22 plots23 plots24 plots25 plots31 plots32 plots33 plots34 plots35 plots41 plots42 plots43 plots44 plots45 # plots_tmp
for PLOT in plots01 plots02 plots11 plots13 plots14 plots15 plots21 plots22  plots23 plots24 plots25 plots31 plots32 plots33 plots34 plots35 plots41 plots42 plots43 plots44 plots45 # plots_tmp

do
	#echo "${PLOT} total: $(ls /plots/${PLOT}/*.plot|wc -l) $(df -h /plots/${PLOT}|awk '$1 ~ /\/dev\/sd/{print "size: "$2,"used: " $3}')"
	SIZE=$(df -hH /plots/${PLOT}| awk '$1 ~ /dev\/sd/{print $2,$3,$4}')
   echo -n " /plots/${PLOT}: $SIZE "
   # printf "%-18s %-5s %-5s\n" /plots/${PLOT}: 3.0T 17
   ls /plots/${PLOT}/*.plot|wc -l
   COUNT=$(ls /plots/${PLOT}/*.plot|wc -l)
   (( TOTAL = TOTAL + COUNT ))
   echo $TOTAL > /home/chia/logs/plot_count.txt
done | sort -rnk 2
echo "Total number of plots is $(cat /home/chia/logs/plot_count.txt)"

