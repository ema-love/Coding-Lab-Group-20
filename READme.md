##          CODING LAB 20 GROUP TASK
  #TASK ONE  Hospital-Data-Monitoring-Archival-System
Section i) and ii) This was worked on by Francis. The code is intended to first extract the text from the log files that are being constantly filled
with data from the python simulators.
This script provides an interactive way to archive system monitoring logs such as heart rate, temperature, and water usage. It allows the user to choose a log file from a numbered menu, then:

Moves the selected log file to a designated archive folder.

Renames the file using a timestamp format: log_type_YYYY-MM-DD_HH:MM:SS.log.

Creates a new empty log file for continued logging.

Section iii) was worked on by Janna. This section adds error handling to the archive_logs.sh script to make the archiving process safer and more reliable. It performs the following checks:

If the selected log file exists

If the archive directory can be created or accessed

If the file is successfully moved to the archive

If a new empty log file can be created

If any of these steps fail, the script displays a clear error message and exits. This prevents unexpected behavior or data loss during log management. It ensures that the script handles real-time data in a controlled and secure way.##






TASK II
SECTION I(Worked on by Grace)
This script facilitates the analysis of hospital log files by giving the user the ability to select a particular log, process the data in an intelligent manner, and save the outcomes as a report.  The three primary requirements listed below are satisfied by the script:
1. Interactive Exercise
The script asks the user to choose a log file to examine in a menu that appears when it runs:
1) Heart Rate (heart_rate.log)
2) Temperature (temperature.log)
3) Water Usage (water_usage.log)
Enter choice (1-3):
It only accepts the values 1, 2, or 3 and uses a while loop to make sure the input is acceptable. It uses a case statement to allocate the relevant log file path based on the selection.

SECTION II (Worked on by Mercy)
2. Analysis Functionality
 Following the selection of a valid log file, the script combines the commands awk, grep, sort, uniq, head, and tail to carry out the following actions:
 >Lists every distinct device ID that was discovered in the log.
 For every gadget:
 >Determines how many entries (occurrences) there are.
 > Extracts the first and last entry's timestamp (bonus feature).
 > This makes it easier to provide a brief summary of device usage patterns and activity.


SECTION III (Worked on by Cindy)
Now, the script automatically saves the analysis results to a report file while maintaining all of the original terminal output. During execution, the same device data (counts, timestamps) that are shown on the screen are collected and recorded to "reports/analysis_report.txt" along with a timestamp.  To do this, I created a variable named REPORT_CONTENT, which eventually writes the output data to a file after storing it throughout analysis.  The original terminal display remains unchanged; this merely creates a parallel record of each analysis session.










































##
