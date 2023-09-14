#!/bin/bash
# Script to move plots from nvme storage to spinning disk
# Update this to reflect target directory
DEST=/plots/plots24
# Update this to reflect temporary directory used by bladebit as destination.
TMP=/plots_tmp2

MINFREE='100000000'
DATE=$(date '+%y%m%d-%T')
LOG=/home/chia/logs/move_${DATE}.log
touch ${LOG}
rm /home/chia/logs/latest_move.log
ln -s ${LOG} /home/chia/logs/latest_move.log

while true
do
    FREE=$(df ${DEST}|awk '$1 ~ /\/dev\//{print $4}')
    TIME=$(date '+%T')
    PLOT=$(ls -tr /plots_tmp2/*.plot 2> /dev/null|head -1)
    if test ! -z ${PLOT}
    then
        if (( FREE < MINFREE ))
        then
            DELETE=$(ls -t ${DEST}/*.plot|grep -v 'plot-k32-c07-' | tail -1)
            if test ${DELETE}
            then
                echo -e "${TIME}: Deleting ${DELETE}" >> ${LOG}
                rm ${DELETE} >> ${LOG}
                sleep 5
	    fi
        fi
        echo -e "${TIME}: Moving ${PLOT} to ${DEST}" >> ${LOG}
        mv ${PLOT} ${DEST}
        TIME=$(date '+%T')
        echo -e "${TIME}: Completed move" >> ${LOG}
        unset PLOT DELETE
    fi
    echo -n '.'  >> ${LOG}
    sleep 60
done 
