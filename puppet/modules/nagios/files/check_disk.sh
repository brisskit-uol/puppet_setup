#!/bin/bash

host=$(/bin/hostname -s)
check=$(/etc/nagios/plugins/check_disk -w 20% -c 10% -e)
rc=$?
service_name="Disk Space"
token="token1234"
url=http://192.168.0.221/nrdp/


echo "$host\t$service_name\t$rc\t$check" | /var/local/brisskit/nagios-client/send_nrdp.sh -u $url -t $token

