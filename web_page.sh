#!/usr/bin/bash
# GREEN='\033[1;32m'
# RED='\033[1;31m'
# CLEAR="\033[0m"
## do
# set -- $LINE
#     case $1 in
# 	-Total  ) TOTAL=$3
#                   OTOTAL=$(cat /home/chia/logs/total.txt)
#                   RCVD=$(echo $TOTAL - $OTOTAL | bc)
#                   if test $RCVD != 0
# 		  then
# 			  echo -n "$(date '+%d/%m/%y %H:%M:%S') "
# 			  echo "$TOTAL - rcvd: $RCVD"
# 		  fi
# 			  echo $TOTAL > /home/chia/logs/total.txt ;;
#     esac
# done

echo '<html> <Title>Chia stats</title><head><meta http-equiv="refresh" content="60"></head>' > /tmp/xch.html

# /home/chia/Scripts/xchstats.sh | sed -rz -e 's/\x1b\[[0-9;]*m//g' -e 's/\n/<br>\n/g' >> /tmp/xch.html
/home/chia/Scripts/xchstats.sh | sed -rz -e 's/\x1b\[1;31m/<font size=4 color=red><strong>/g' -e 's/\x1b\[0;33m/<font color=green>/g' -e 's/\x1b\[0m/<\/font><\/strong>/g' -e 's/\n/<br>\n/g' >> /tmp/xch.html 

echo '</html>' >> /tmp/xch.html

scp -qpP 7822 /tmp/xch.html root@worldhq.com:/home/middleworld/public_html
