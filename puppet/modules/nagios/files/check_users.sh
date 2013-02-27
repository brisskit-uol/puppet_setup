#!/bin/bash

host=$(/usr/bin/facter fqdn)
check=$(/usr/lib/nagios/plugins/check_users -w 5 -c 10)
rc=$?
service_name="Current Users"
token="c33h3y0h70771kq622nrhqdofl2fxoxe"
url=http://ga-nagios/nrdp/


echo -e "$host\t$service_name\t$rc\t$check" | /var/local/brisskit/nagios-client/send_nrdp.sh -u $url -t $token

