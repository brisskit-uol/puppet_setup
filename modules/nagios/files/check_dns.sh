#!/bin/bash

host=$(/bin/hostname --fqdn)
check=$(/usr/lib/nagios/plugins/check_dns -H www.brisskit.org -a 193.63.182.225)
rc=$?
service_name="DNS"
token="token1234"
url=http://192.168.0.221/nrdp/


echo -e "$host\t$service_name\t$rc\t$check" | /var/local/brisskit/nagios-client/send_nrdp.sh -u $url -t $token

