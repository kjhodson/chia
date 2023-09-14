#!/usr/bin/bash
DATE=$(date +%y%m%d-%H:%M)
LOGFILE=~/logs/madmax_${DATE}.log
PLOTS=5
THREADS=4
TMP="/plots_tmp2/"
TMP2="/ssd/"
DEST="/test_mount/"
POOLKEY=b7b2c7966e1eeff379444ac3b0c56cdfdd7ddc3930ebecf6f82ec57d7aff28f6f62b685f3b132a4107e15e12e81d61bc
FARMKEY=b10c361e79e00c4bd9dca55f22b0550de97a4a116b03522721164a1b7537e5096672d93c48d35949cc55138a4a76b4fe

mkdir -p ~/logs

echo "~/chia-plotter/build/chia_plot -n ${PLOTS} -r ${THREADS} -u 128 -t ${TMP} -d ${DEST} -p ${POOLKEY} -f ${FARMKEY}"
date > ${LOGFILE}
~/chia-plotter/build/chia_plot -n ${PLOTS} -r ${THREADS} -u 128 -t ${TMP} -d ${DEST} -p ${POOLKEY} -f ${FARMKEY} >> ${LOGFILE} &
