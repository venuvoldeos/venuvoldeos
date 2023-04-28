#!/bin/bash

hosts_file="/users/builders/venugona_scripts/hosts_list.txt"
email_address="venugona@cisco.com"
log_file="/tmp/passwordless_ssh.log"

success_output=""
failure_output=""
alert_hosts=""

while read host
do
    ssh -q -o PasswordAuthentication=no "$host" 'exit' >/dev/null 2>&1
    if [ $? -eq 0 ]; then
        success_output="$success_output\nPasswordless SSH is working for $host"
        echo -n "Passwordless SSH is working for $host" | tee -a "$log_file"
    else
        failure_output="$failure_output\nPasswordless SSH is NOT working for $host"
        alert_hosts="$alert_hosts\n$host"
        echo -n "ALERT: Passwordless SSH is NOT working for $host" | tee -a "$log_file"
    fi
done < "$hosts_file"

if [ -n "$alert_hosts" ]; then
    email_body="ALERT: Passwordless SSH is NOT working for the following hosts:\n\n$alert_hosts\n\n"
else
    email_body="Passwordless SSH status for all hosts:\n\n"
fi

email_body="$email_body\n\n$(cat "$log_file")"

echo -e "$email_body" | mail -s "Passwordless SSH status" "$email_address"

rm "$log_file"

