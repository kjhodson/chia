#!/usr/bin/bash
GREEN='\033[0;33m'
RED='\033[1;31m'
CLEAR="\033[0m"
DATE=$(date '+%d/%m %T:')

# XCHGBP=$(curl 'https://api.coingecko.com/api/v3/simple/price?ids=chia&vs_currencies=GBP' 2>/dev/null| awk -F: '{print $3}'| cut -d '}' -f1)
XCHUSD=$(curl 'https://api.coingecko.com/api/v3/simple/price?ids=chia&vs_currencies=USD' 2>/dev/null| awk -F: '{print $3}'| cut -d '}' -f1)
# XCH=$(echo "\$$XCHUSD (&#163;$XCHGBP)")

# echo -e -n "${GREEN}"
echo -e "${CLEAR}${DATE}: $XCHUSD"
