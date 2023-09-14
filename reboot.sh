#!/bin/bash

chia stop all

for M in  $(df -h /plots*| egrep -v 'on|/$' |awk '{print $NF}')
  do
    echo ${M}
    sudo umount ${M}
  done

sudo systemctl reboot
