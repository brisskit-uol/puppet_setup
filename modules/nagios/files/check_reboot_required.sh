#!/bin/bash

sleepseconds=120
sleeptime=$(/usr/bin/facter macaddress | tr -cd [:digit:] | awk '{printf "%d\n",$1}')
let sleeptime%=$sleepseconds
sleep $sleeptime

host=$(/usr/bin/facter fqdn)
check=$(/usr/lib/nagios/plugins/check_reboot_required)

rc=$?
service_name="Reboot required"
token="mcn4y86v1bqvhup47w2r4c5d7hqx7ycx"
url=http://ga-nagios/nrdp/


echo -e "$host\t$service_name\t$rc\t$check" | /var/local/brisskit/nagios-client/send_nrdp.sh -u $url -t $token

