#!/bin/bash

sleepseconds=60
sleeptime=$(/usr/bin/facter macaddress | tr -cd [:digit:] | awk '{printf "%d\n",$1}')
let sleeptime%=$sleepseconds
sleep $sleeptime

host=$(/usr/bin/facter fqdn)
check=$(/usr/bin/uptime)
rc=$?
token="mzj49q5q20p4pmvo0xq5qymgvutxjoge"
url=http://ga-nagios/nrdp/


echo -e "$host\t$rc\t$check" | /var/local/brisskit/nagios-client/send_nrdp.sh -u $url -t $token

