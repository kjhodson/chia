#!/bin/bash
date "+%d/%m %H:%M"
for PLOT in plots01 plots02 plots03 plots11 plots12 plots13 plots14 plots15 plots21 plots22 plots23 plots24 plots25

do
   echo -n " Plot dir number /${PLOT}: "
   ls /${PLOT}/*.plot|wc -l
   COUNT=$(ls /${PLOT}/*.plot|wc -l)
   (( TOTAL = TOTAL + COUNT ))
done
echo "Total number of plots is ${TOTAL}"

