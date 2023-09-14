#!/usr/bin/bash

GREEN='\033[0;33m'
RED='\033[1;31m'
CLEAR="\033[0m"
DATE=$(date '+%d/%m/%y')
DAY=$(date '+%d')
YDAY=$(expr $DAY - 1)
# YDAY=$((${DAY} - 1))
# YDATE="${YDAY}/$(date '+%m/%y')"
# NUMMOUNTS=$(df -h /plots/plots*|grep /plots|wc -l)
BLOCK_COUNT=$(grep -A2 'Amount rewarded' /home/chia/logs/wallet_transactions.txt|grep Created|wc -l)
LASTMONTH=$(tail -1 /home/chia/logs/wallet_permonth.log|cut -d' ' -f3)
BALANCE=$(chia wallet show|grep --color=auto -A 1 'Chia Wallet'|grep -v 'Wallet'|awk '{print $3" "}')
YESTERDAY=$(cut -d" " -f1 /home/chia/logs/total_perday.txt)
TODAYSOFAR=$(echo "$BALANCE - $YESTERDAY" | bc)
MONTHTODATE=$(echo ${BALANCE} - ${LASTMONTH} | bc)
AVERAGE=$(echo "scale=8 ; ${MONTHTODATE} / ${YDAY}" | bc)
XCHUSD=$(tail -1 /home/chia/logs/xchprice.log|awk '{print $3}')
VALUE=$(echo "$XCHUSD * ${BALANCE}" | bc)

# XCHGBP=$(curl 'https://api.coingecko.com/api/v3/simple/price?ids=chia&vs_currencies=GBP' 2>/dev/null| awk -F: '{print $3}'| cut -d '}' -f1)
# XCHUSD=$(curl 'https://api.coingecko.com/api/v3/simple/price?ids=chia&vs_currencies=USD' 2>/dev/null| awk -F: '{print $3}'| cut -d '}' -f1)
# XCH=$(tail -1 /home/chia/logs/xchprice.log)

echo -e "${RED}$(date '+%A %d %H:%M:%S')${CLEAR}"
echo -e -n "${GREEN}"
 	echo -e "${RED}chia price: ${CLEAR}${GREEN}\$${XCHUSD}: \$${VALUE}"
echo -e "${RED}chia wallet balance: ${CLEAR}\c"
	echo ${BALANCE}
echo -e "${RED}blocks found to date:${CLEAR} ${BLOCK_COUNT}"
chia farm summary | egrep -iw --color=auto 'total size|plot'
#	ping -c 1 -W 2 bbc.co.uk|grep 'bytes from'
echo -e "${RED}chia version:${CLEAR} \c"
	chia version
echo -e "${GREEN}\c"
echo -e "${RED}chia processes:${CLEAR}"
	ps -ef| grep -vE 'worker|grep'| grep -E --color=auto 'main.py|chia_wallet|chia_full_node|chia_farmer|chia_harvester|timelord' 
echo -e "${RED}critical file systems:${CLEAR}"
	df -h / /home|tail -n +2
echo -e "${RED}chia netspace:${CLEAR} \c"
	chia netspace | tail -1
echo -e "${RED}month so far: ${CLEAR}\c"
	echo ${MONTHTODATE}
echo -e "${RED}This month's daily average: ${CLEAR}\c"
	echo ${AVERAGE}
# echo -e "${RED}farm status:${CLEAR}"
	chia farm summary | egrep --color=auto 'Expected'
	chia plotnft show | egrep --color=auto 'Points|Sync'
# echo -en "${RED}Blockchain Status: ${CLEAR}"
# chia show --state| egrep --color=auto 'Current Blockchain Status'|cut -d" " -f4-
# echo
	NUM=$(grep $DATE /home/chia/logs/wallet.log | wc -l)
	echo -e "${RED}today's transactions ${CLEAR}(${NUM}: ${TODAYSOFAR}):"
	grep $DATE /home/chia/logs/wallet.log | tac | cut -d " " -f1,2,5,6
	echo -e "${RED}Previous 7 day's totals${CLEAR}"
	tail -7 /home/chia/logs/wallet_perday.log | tac | cut -d " " -f1,5,6,7
	echo -e "${RED}previous monthly totals:${CLEAR}"
	/home/chia/Scripts/monthly.sh # | tail -6
	echo -e "${RED}blocks found history: ${CLEAR}(${BLOCK_COUNT})"
	grep -A2 'Amount rewarded' /home/chia/logs/wallet_transactions.txt|grep Created|cut -d' ' -f3|awk -F- '{print $3"-"$2"-"$1}'
echo -e "${RED}plotting stats:${CLEAR}\c"
	if ps -ef|grep -q [b]ladebit_cuda
	then
		# ps -ef|grep [p]lotter|awk '{print $1,$2,$3,$4,$5,$6,$7,$8}'
		echo
		# PLOT_LOG=$(ls -tr ~/logs/bb_latest.log|tail -1)
		# NEWPLOT=$(grep 'Generating plot' ~/logs/bb_latest.log|cut -d: -f 1|tail -1)
		# ENDPLOT=$(grep 'Completed Plot' ~/logs/bb_latest.log|tail -1)
		egrep 'Generating plot|Completed Plot|Completed writing' ~/logs/bb_latest.log | tail -6 # | tac
	else
		echo " no plotting in progress"
	fi
echo -e "${RED}plot info:${CLEAR}"
	/home/chia/Scripts/num_plots.sh
