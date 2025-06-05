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

















































##
