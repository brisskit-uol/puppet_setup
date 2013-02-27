#!/bin/bash

sleepseconds=60
sleeptime=$(/usr/bin/facter macaddress | tr -cd [:digit:] | awk '{printf "%d\n",$1}')
let sleeptime%=$sleepseconds
sleep $sleeptime

host=$(/usr/bin/facter fqdn)
check=$(/usr/lib/nagios/plugins/check_load -r -w 5.0,4.0,3.0 -c 10.0,6.0,4.0)
rc=$?
service_name="Current Load"
token="ec5fxn9x5ehdwy0o92iq9eg23cj9a42b"
url=http://ga-nagios/nrdp/


echo -e "$host\t$service_name\t$rc\t$check" | /var/local/brisskit/nagios-client/send_nrdp.sh -u $url -t $token

