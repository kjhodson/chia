#!/bin/bash
# while clear ; do  date ; egrep -i 'copy|phase|crafting' /home/chia/logs/madmax_220726-10:09:09.log ; sleep 30 ; done
# trap 'clear' 0


LOGDIR=/home/chia/logs
GREEN='\033[0;32m'
CYAN='\033[0;36m'
PS3="Choose file: "

LOGFILE=$(ls -l ~/logs/bb_latest.log |cut -d " " -f 12)
while clear -x; do date ; echo -e "${GREEN}LOGFILE: ${LOGFILE}" ; egrep --color=auto -i 'Completed Writing|Plotting started|Phase|Generating plot|Completed Plot' /home/chia/logs/bb_latest.log ; sleep 60 ; done

exit

cd ${LOGDIR}
select LOGFILE in $(ls bb_cuda*.log|tail -5)
do
	break
done

while clear
do
	date
	echo -e "${GREEN}LOGFILE: ${LOGFILE}"
	egrep --color=auto -i 'PID|stage|copy|phase|crafting' ${LOGDIR}/${LOGFILE}
	sleep 30
done
