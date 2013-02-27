#!/bin/bash

host=$(/usr/bin/facter fqdn)
check=$(/usr/lib/nagios/plugins/check_procs -w 250 -c 400)
rc=$?
service_name="Total Processes"
token="yhjrmfnxbspb7rdir72fysfh9jhj6xh8"
url=http://ga-nagios/nrdp/


echo -e "$host\t$service_name\t$rc\t$check" | /var/local/brisskit/nagios-client/send_nrdp.sh -u $url -t $token

