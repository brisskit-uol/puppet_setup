#!/bin/bash

sleepseconds=120
sleeptime=$(/usr/bin/facter macaddress | tr -cd [:digit:] | awk '{printf "%d\n",$1}')
let sleeptime%=$sleepseconds
sleep $sleeptime

host=$(/usr/bin/facter fqdn)
check=$(/usr/lib/nagios/plugins/check_dns -H www.brisskit.org -a 193.63.182.225)
rc=$?
service_name="DNS"
token="gpikt91gm08swuf7e4m8ospuqnfma4iq"
url=http://ga-nagios/nrdp/


echo -e "$host\t$service_name\t$rc\t$check" | /var/local/brisskit/nagios-client/send_nrdp.sh -u $url -t $token

