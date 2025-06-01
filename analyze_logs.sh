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
	 break
    else
        echo "invalid output, please output a number between 1-3"
    fi

done
