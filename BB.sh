#!/usr/bin/bash
GREEN='\033[0;31m'
CYAN='\033[0;36m'

DEST="/plots_tmp2/"
MVDEST=$(grep 'DEST=' move_plots.sh)
PLOTS=212
TMP="/plots_tmp/"
# TMP="/plots_tmp2/"

DATE=$(date +%y%m%d-%H:%M:%S)
LOGFILE=~/logs/bb_${DATE}.log
LOGLINK=~/logs/bb_latest.log
rm ${LOGLINK}
ln -s ${LOGFILE} ${LOGLINK}
THREADS=12
# if test $(basename $0) = 'BB.sh'
# then
# 	TMP="/plots_tmp/"
# else
# 	TMP="/plots_tmp2/"
# fi
TMPFILES=$(ls ${TMP} | wc -l)

POOLKEY=b7b2c7966e1eeff379444ac3b0c56cdfdd7ddc3930ebecf6f82ec57d7aff28f6f62b685f3b132a4107e15e12e81d61bc
CONTRACT=xch1k58egc0cf67nyv6dma8rj6lj7a44ylcmju50y06uqvmer3j48kvs4nthyk
# Farmer public key (m/12381/8444/0/0): b10c361e79e00c4bd9dca55f22b0550de97a4a116b03522721164a1b7537e5096672d93c48d35949cc55138a4a76b4fe
FARMKEY=b10c361e79e00c4bd9dca55f22b0550de97a4a116b03522721164a1b7537e5096672d93c48d35949cc55138a4a76b4fe

echo -e "\n\tNumber of plots = ${PLOTS}"
echo -e "\tNumber of threads = ${THREADS}"
echo -e "\tTemporary Directory = ${TMP}"
echo -e "\tDestination Directory = ${DEST}"
echo -e "\tFinal destination is ${MVDEST}\n\n"

echo -e "/home/chia/bladebit/bladebit_cuda -f ${FARMKEY} -c ${CONTRACT} --compress 7 -n ${PLOTS} cudaplot --disk-128 -t1 ${TMP} ${DEST} >> ${LOGFILE} &"

[ ${TMPFILES} -gt 5 ] && echo -e "\n\t${GREEN}${TMP} appears to contain files\n\tDon't forget to delete any old plots, and check that /plots_tmp is empty"
echo -en "\n\t${CYAN}Log file is ${LOGFILE}"
echo
echo -en "\tHit enter when ready to continue: "
read nowt
echo -en "\n\t${CYAN}Have you updated move_plots.sh?"
echo -en "\tHit enter when ready to plot: "
read nowt
echo

mkdir -p ~/logs

echo "Starting move_plots.sh process: $(date)" > ${LOGFILE}
nohup /home/chia/Scripts/move_plots.sh &
echo "Starting bladebit_cuda process: $(date)" >> ${LOGFILE}
nohup /home/chia/bladebit/bladebit_cuda -f ${FARMKEY} -c ${CONTRACT} --compress 7 -n ${PLOTS} cudaplot --disk-128 -t1 ${TMP} ${DEST} >> ${LOGFILE} &
echo "PID: $!" >> ${LOGFILE}

