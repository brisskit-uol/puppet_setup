#!/bin/bash

host=$(/usr/bin/facter fqdn)
dirs=$(find "/var/local/brisskit/backup/files/customer" -mindepth 2 -type d | awk 'ORS=" "')
check=$(/usr/lib/nagios/plugins/check_newest_file_age -d "$dirs")
rc=$?
service_name="Backup Customer"
token="hg9npuu3i8gfpuo9i1gy9o357ehg7jyu"
url=http://192.168.0.221/nrdp/


echo -e "$host\t$service_name\t$rc\t$check" | /var/local/brisskit/nagios-client/send_nrdp.sh -u $url -t $token

