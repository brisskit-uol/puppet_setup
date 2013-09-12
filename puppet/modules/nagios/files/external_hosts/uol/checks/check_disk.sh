#!/bin/bash

sleepseconds=120
#sleeptime=$(/usr/bin/facter macaddress | tr -cd [:digit:] | awk '{printf "%d\n",$1}')
sleeptime=7
let sleeptime%=$sleepseconds
sleep $sleeptime

#host=$(/usr/bin/facter fqdn)
host=$(hostname --fqdn)
#check=$(/usr/lib/nagios/plugins/check_disk -w 20% -c 10% -e -A -i '.gvfs')
check=$(/local/nagios/plugins/check_disk -w 20% -c 10% -e -A -i '.gvfs')
rc=$?
service_name="Disk Space"
token="y495xuj7pk351w5pkaz5a6idj6lowc3c"
url=http://nagios.brisskit.org/nrdp/


echo -e "$host\t$service_name\t$rc\t$check" | /local/nagios/send_nrdp.sh -u $url -t $token

