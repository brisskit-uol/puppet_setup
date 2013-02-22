#!/bin/bash

host=$(/usr/bin/facter fqdn)
dirs=$(find "/var/local/brisskit/backup/files/ga" -mindepth 1 -type d | awk 'ORS=" "')
check=$(/usr/lib/nagios/plugins/check_newest_file_age -d "$dirs")
rc=$?
service_name="Backup ga"
token="token1234"
url=http://192.168.0.221/nrdp/


echo -e "$host\t$service_name\t$rc\t$check" | /var/local/brisskit/nagios-client/send_nrdp.sh -u $url -t $token

