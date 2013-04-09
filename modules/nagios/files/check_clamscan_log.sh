#!/bin/bash

sleepseconds=120
sleeptime=$(/usr/bin/facter macaddress | tr -cd [:digit:] | awk '{printf "%d\n",$1}')
let sleeptime%=$sleepseconds
sleep $sleeptime

host=$(/usr/bin/facter fqdn)
check=$(/usr/lib/nagios/plugins/check_clamscan_log)

rc=$?
service_name="Clamscan"
token="823uyrhfksahfjlahsf84ahjkasfd82k"
url=http://ga-nagios/nrdp/


echo -e "$host\t$service_name\t$rc\t$check" | /var/local/brisskit/nagios-client/send_nrdp.sh -u $url -t $token

