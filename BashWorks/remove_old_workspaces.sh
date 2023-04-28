#!/bin/bash

####################################################################
#This script checks for the directories that are older than 3 days 
#in the /local/jenkins/workspace/fxplatform/Builds path on 
#FXOS nodes.
#-VENUGOPAL venugona@cisco.com 
#
####################################################################

#host list file
#hostlist="/users/builders/venugona_scripts/fxos_hosts_list.txt"
hostlist="/users/builders/venugona_scripts/fxos_hosts_listbkp.txt"
#echo $hostlist

# Set the path to search for old directories
path_to_search="/local/jenkins/workspace/fxplatform/Builds"

# Set the number of days in minutes to check for old directories [ 1day= 1440, 2days=2880, 3days=4320]
num_days=4320

# Set the email recipients
email_recipients="venugona@cisco.com,charus@cisco.com"

# timestamp for logfile
datestr=$(date +%Y-%m-%d-%H-%M-%S)

# Set the log file path
#log_file="/local/jenkins/workspace/fxplatform/Builds/prune_logfile_$datestr.log"
log_file="/tmp/prune_logfile_$datestr.log"

# Loop through the host list file and run the command on each host#
for host in `cat $hostlist`
do
	echo "------------ Directories older than 3 days on $host ---------" | tee -a $log_file
	# Log into the host and run the command to list old directories
	ssh $host "find $path_to_search -maxdepth 1 -mindepth 1 -type d -mmin +$num_days | awk -F ' ' '{print $NF}'  | xargs ls -ld " | tee -a $log_file
	echo "--------- Removing the dirs older than 3 days --------------" | tee -a $log_file
	# Log into the host and run the command to remove old directories
	ssh $host "find $path_to_search -maxdepth 1 -mindepth 1 -type d -mmin +$num_days | awk -F ' ' '{print $NF}'  | xargs rm -rf" | tee -a $log_file
		#check if the remove command is successfull or not and log the output
		if [ $? -ne 0 ]; then
			echo "Error deleting old workspace on $host" | tee -a $log_file
		else
			echo "/local cleanup on the host $host is done" | tee -a $log_file
		fi
done

: <<'COMMENT'
# Loop through the host list file and run the command on each host
while read host; do
  # Log into the host and run the command to remove old directories
echo "------------- Logging into host $host ----" | tee -a $log_file
echo "ssh $host find $path_to_search -type d -mtime +$num_days -print0 | xargs -0 rm -rf"
  ssh $host "find $path_to_search -type d -mtime +$num_days -print0 | xargs -0 rm -rf" | tee -a $log_file

  # Check if there were any errors and log them if necessary
  if [ $? -ne 0 ]; then
    echo "Error on $host" | tee -a $log_file
  fi
done < $hostlist
COMMENT

# Send the log file as an email to the recipients
cat $log_file | mail -s "Jenkins workspace cleanup Report | $datestr" $email_recipients

