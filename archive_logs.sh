#!/bin/bash
echo "Select log to archive:"
echo "1) Heart Rate"
echo "2) Temperature"
echo "3) Water Usage"
read -p "Enter choice (1-3): " choice

#Define BASE DIRECTORIES
LOG_DIR="hospital_data/active_logs"
ARCHIVE_DIR="hospital_data/archived_logs"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

#Set file and folder based on choice
case $choice in 
  1)
    LOG_FILE="heart_rate_log.log"
    ARCHIVE_SUBDIR="heart_data_archive"
    ;;
  2)
    LOG_FILE="temperature_log.log"
    ARCHIVE_SUBDIR="temperature_data_archive"
    ;;
  3)
    LOG_FILE="water_usage_log.log"
    ARCHIVE_SUBDIR="water_usage_data_archive"
    ;;
  *)
    echo "Invalid choice. Kindly select 1,2, or 3 ."
    exit 1
    ;;
esac

#Prepare paths
SOURCE_FILE="$LOG_DIR/$LOG_FILE"
DEST_DIR="$ARCHIVE_DIR/$ARCHIVE_SUBDIR"
ARCHIVED_FILE="${DEST_DIR}/${LOG_FILE%.LOG}_$TIMESTAMP.log"

#Error checks

#Create archive directory if it doesn't exist
mkdir -p "$DEST_DIR"

#Archive
mv "$SOURCE_FILE" "ARCHIVED_FILE"
echo "Successfully archived to $ARCHIVE_SUBDIR/$(basename "$ARCHIVED_FILE")"

touch "$SOURCE_FILE"
echo "Created new empty $SOURCE_FILE for continued logging."

# Error handling 
# 1.Check if the log file exists
if [ ! -f "$SOURCE_FILE" ]; then
    echo " Error: Log file $SOURCE_FILE does not exist. Nothing to archive."
    exit 1
fi

# 2.Check if archive directory can be created or accessed
if ! mkdir -p "$DEST_DIR"; then
    echo " Error: Cannot create or access archive directory $DEST_DIR."
    exit 1
fi

# 3.Check if file move (archive) is successful
if ! mv "$SOURCE_FILE" "$ARCHIVED_FILE"; then
    echo " Error: Failed to move $SOURCE_FILE to $ARCHIVED_FILE."
    exit 1
fi

# 4.Check if new empty log file can be created
if ! touch "$SOURCE_FILE"; then
    echo " Error: Failed to create new empty log file at $SOURCE_FILE."
    exit 1
fi
