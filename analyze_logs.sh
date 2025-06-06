#!/bin/bash

##Prints out the option statements
echo "Select log file to analyze:"
echo "1) Heart Rate (heart_rate_log.log)"
echo "2) Temperature (temperature_log.log)"
echo "3) Water Usage (water_usage_log.log)"

##creates a while loop to prompt the user again in case they don't put valid input
while true; do
    read -p "Enter choice (1-3):" user_choice # enables the user to input their choice

    #use of conditional or statements, we could potentially use the regex sysntax i.e if [[ "$user_choice" =~ ^[1-3]$ ]] ; then
    if [[ "$user_choice" == "1" || "$user_choice" == "2" || "$user_choice" == "3" ]]; then
        echo " youve chosen $user_choice please proceed"

           case $user_choice in
            1) LOG_FILE="hospital_data/active_logs/heart_rate_log.log" ;;
            2) LOG_FILE="hospital_data/active_logs/temperature_log.log" ;;
            3) LOG_FILE="hospital_data/active_logs/water_usage_log.log" ;;
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

# Initialize report content
REPORT_CONTENT="Analysis report for $LOG_FILE\n"

echo "Analysis report for $LOG_FILE"
echo "............"

DEVICES=$(awk '{print $2}' "$LOG_FILE" | sort | uniq)
for device in $DEVICES; do
        echo "Device: $device"
        REPORT_CONTENT+="Device: $device\n"

        COUNT=$(grep "$device" "$LOG_FILE" | wc -l)
        echo "Total Entries: $COUNT"
        REPORT_CONTENT+="Total Entries: $COUNT\n"

         FIRST=$(grep "$device" "$LOG_FILE" | head -1 | awk '{print $1}')
  echo "  First Entry: $FIRST"
  REPORT_CONTENT+="First Entry: $FIRST\n"

  LAST=$(grep "$device" "$LOG_FILE" | tail -1 | awk '{print $1}')
  echo "  Last Entry: $LAST"
  REPORT_CONTENT+="Last Entry: $LAST\n\n"
done

# Save report to file
mkdir -p hospital_data/reports 
echo -e "=== Analysis Report ===" >> hospital_data/reports/analysis_report.txt
echo "Date: $(date)" >> hospital_data/reports/analysis_report.txt
echo -e "$REPORT_CONTENT" >> hospital_data/reports/analysis_report.txt
echo "Report saved to reports/analysis_report.txt"
