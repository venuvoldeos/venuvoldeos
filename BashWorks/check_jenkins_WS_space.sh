#!/bin/bash

# Set the path to check
PATH_TO_CHECK=/local/jenkins/

# Set the workspace location
WORKSPACE=/local/jenkins/workspace/fxplatform/Builds

# Set the email address to send the log to
EMAIL_ADDRESS=venugona@cisco.com

# Set the log file name and location
LOG_FILE=/var/log/remove_old_dirs.log

# Set the file containing the list of servers
SERVER_LIST=/path/to/server/list.txt

# Function to remove old directories
function remove_old_dirs {
  # Get the disk usage of the path to check
  DISK_USAGE=$(df -kh "$PATH_TO_CHECK" | awk 'NR==2{print $5}' | sed 's/%//')

  # Check if disk usage is more than 80%
  if [ "$DISK_USAGE" -gt 80 ]; then
    echo "$(date): Disk usage is more than 80%, removing directories older than 3 months in workspace" >> "$LOG_FILE"

    # Change directory to workspace
    cd "$WORKSPACE"

    # Use the find command to identify directories that are older than 3 months
    OLD_DIRS=$(find "$PATH_TO_CHECK" -type d -mtime +90)

    # Loop through each old directory and remove it
    for dir in $OLD_DIRS
    do
      rm -rf "$dir"
      echo "$(date): Removed directory: $dir" >> "$LOG_FILE"
    done
  else
    echo "$(date): Disk usage is less than or equal to 80%, skipping directory removal" >> "$LOG_FILE"
  fi
}

# Remove old directories on the local machine
remove_old_dirs

# Loop through each server in the list
while read -r server; do
  echo "Running script on server: $server"
  # SSH into the server and run the remove_old_dirs function
  ssh "$server" "$(typeset -f remove_old_dirs); remove_old_dirs"
done < "$SERVER_LIST"

# Email the log file to the specified email address
mail -s "Log File for Directory Removal Script" "$EMAIL_ADDRESS" < "$LOG_FILE"

