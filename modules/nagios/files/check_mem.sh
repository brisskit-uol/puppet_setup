#!/bin/bash

sleepseconds=120
sleeptime=$(/usr/bin/facter macaddress | tr -cd [:digit:] | awk '{printf "%d\n",$1}')
let sleeptime%=$sleepseconds
sleep $sleeptime

host=$(/usr/bin/facter fqdn)
check=$(/usr/lib/nagios/plugins/check_mem -w 90 -c 95)
rc=$?
service_name="Memory Usage"
token="s2hd2ky8hxs19n1243yh7t1sngt0btzi"
url=http://ga-nagios/nrdp/


echo -e "$host\t$service_name\t$rc\t$check" | /var/local/brisskit/nagios-client/send_nrdp.sh -u $url -t $token

