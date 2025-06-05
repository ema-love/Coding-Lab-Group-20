#!/bin/bash

##Prints out the option statements
echo "Select log file to analyze:"
echo "1) Heart Rate (heart_rate.log)"
echo "2) Temperature (temperature.log)"
echo "3) Water Usage (water_usage.log)"

##creates a while loop to prompt the user again in case they don't put valid input
while true; do
    read -p "Enter choice (1-3):" user_choice # enables the user to input their choice

    #use of conditional or statements, we could potentially use the regex sysntax i.e if [[ "$user_choice" =~ ^[1-3]$ ]] ; then
    if [[ "$user_choice" == "1" || "$user_choice" == "2" || "$user_choice" == "3" ]]; then
    	echo " youve chosen $user_choice please proceed"

	   case $user_choice in
            1) LOG_FILE="hospital_data/active_logs/heart_rate.log" ;;
            2) LOG_FILE="hospital_data/active_logs/temperature.log" ;;
            3) LOG_FILE="hospital_data/active_logs/water_usage.log" ;;
        esac

        break
    else
        echo "Invalid input. Please enter a number between 1 and 3."
    fi
done
	



if [[ ! -f "$LOG_FILE" ]]; then
        echo "log_file not found: $LOG_FILE"
        exit 1
fi

echo "Analysis report for $LOG_FILE"
echo"............"

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
