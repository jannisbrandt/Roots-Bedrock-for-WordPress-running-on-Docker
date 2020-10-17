#!/bin/bash

# Simple cron script that infinitely loops the WP instances scheduled jobs using the provided WP-CLI script wp.sh
# @date 18.03.2019
# @author eickhorst@fleimedia.de

LOOPCOUNT=0
LOOPWAIT=30

while true; do

	LOOPCOUNT=$((LOOPCOUNT+1))

	echo "[ Starting Loop No. $LOOPCOUNT ========================================================= ]"
	$(dirname "$0")/wp.sh cron event run --all
	echo "[ End of Loop No. $LOOPCOUNT =========================================================== ]"

	sleep $LOOPWAIT

done
