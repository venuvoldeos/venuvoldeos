#!/bin/bash
####################################################################
#This script checks for the diskspace on /var/tmp, /tmp, /local
#on FXOS nodes and notifies the recipents if the disk usage is more than 80%.
#-VENUGOPAL venugona@cisco.com
#
####################################################################

# Define the hosts to check
hosts_file="/users/builders/venugona_scripts/fxos_hosts_list.txt"
hosts=()

# Read hosts from file
if [[ -f "$hosts_file" ]]; then
  while IFS= read -r line; do
    hosts+=("$line")
  done < "$hosts_file"
else
  echo "Error: $hosts_file does not exist"
  exit 1
fi

# Define partitions to check
partitions=("/local" "/var/tmp" "/tmp")

# Define log and alert file names
datestr=$(date +%Y-%m-%d-%H-%M-%S)
log_file="/tmp/check_partitions_$datestr-$$.log"
alert_file="/tmp/check_partitions_$datestr-$$.alert"

#email recipients
mailto="venugona@cisco.com charus@cisco.com ankushk2@cisco.com"

# Define the function to check password login
check_password_login() {
  host="$1"
  ssh -o "BatchMode=yes" "$host" "echo 2>&1" | grep -q "password"
  if [[ $? -eq 0 ]]; then
    echo "ALERT: Password login detected for $host" | tee -a "$alert_file"
    return 1
  else
    return 0
  fi
}

# Define the function to check disk usage
check_disk_usage() {
  host="$1"
  for partition in "${partitions[@]}"; do
    output=$(ssh "$host" "df -h $partition" 2>/dev/null)
    if [[ $? -ne 0 ]]; then
      echo "**************** ALERT !!! ****************" | tee -a "$alert_file"
      echo "ALERT !!! Login to $host failed" | tee -a "$alert_file"
      echo "********************************" | tee -a "$alert_file"
      continue
    fi
    usage=$(echo "$output" | awk 'NR==2 {print $5}' | cut -d'%' -f1)
    if [[ -n "$usage" ]] && (( "$usage" > 80 )); then
      echo "**************** ALERT !!! ****************" | tee -a "$alert_file"
      echo "ALERT: Disk usage on $host:$partition is $usage%" | tee -a "$alert_file"
      echo "********************************" | tee -a "$alert_file"
    fi
	#echo "------------------------------------" | tee -a "$log_file"
    echo "Filesystem:$partition disk usage: $usage%" | tee -a "$log_file"
	#echo "------------------------------------" | tee -a "$log_file"
  done
}

# Loop through the hosts and check password login and disk usage
for host in "${hosts[@]}"; do
  echo "------------------------------------" | tee -a "$log_file"
  echo "---------- Checking $host ----------" | tee -a "$log_file"
  check_password_login "$host"
  if [[ $? -eq 0 ]]; then
    check_disk_usage "$host"
  fi
done

# If there were no alerts, delete the alert file
if [[ ! -s "$alert_file" ]]; then
  rm "$alert_file"
fi


#Emailing reports
#mutt -s "Build Host Monitoring report" -a $logfile venugona@cisco.com < $alert_file
mailx -s "Build Host Monitoring report" -a $log_file $mailto < "$alert_file"
