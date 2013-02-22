#!/bin/bash

host=$(/usr/bin/facter fqdn)
check=$(/usr/lib/nagios/plugins/check_procs -s Z -w 5 -c 10)
rc=$?
service_name="Zombie Processes"
token="token1234"
url=http://192.168.0.221/nrdp/


echo -e "$host\t$service_name\t$rc\t$check" | /var/local/brisskit/nagios-client/send_nrdp.sh -u $url -t $token

