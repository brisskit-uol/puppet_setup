#!/bin/bash

host=$(/bin/hostname --fqdn)
check=$(/usr/lib/nagios/plugins/check_mem -w 90 -c 95)
rc=$?
service_name="Memory Usage"
token="token1234"
url=http://192.168.0.221/nrdp/


echo -e "$host\t$service_name\t$rc\t$check" | /var/local/brisskit/nagios-client/send_nrdp.sh -u $url -t $token

