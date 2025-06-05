#!/bin/bash

LOG_FILE ="hospital_data/active_logs/heart_rate_log.log"

if [[ ! -f $LOG_FILE]]; then
	echo "log_file not found: $LOG_FILE"
	exit 1
fi

echo 'Analysis report for $log_file'
echo'...'

DEVICES=$(awk '{print $2}' "$LOG_FILE" | sort | uniq)
for device in $DEVICES; do
	echo "Device: $devics"


        COUNT=$(grep "$device" "$LOG_FILE" | wc -l)
        echo "Total Entries: $COUNT"




         FIRST=$(grep "$device" "$LOG_FILE" | head -1 | awk '{print $1}')
  echo "  First Entry: $FIRST"

  LAST=$(grep "$device" "$LOG_FILE" | tail -1 | awk '{print $1}')
  echo "  Last Entry: $LAST"
  echo ""
done


























