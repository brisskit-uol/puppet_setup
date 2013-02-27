#!/bin/bash

host=$(/usr/bin/facter fqdn)
check=$(/usr/bin/uptime)
rc=$?
token="mzj49q5q20p4pmvo0xq5qymgvutxjoge"
url=http://192.168.0.221/nrdp/


echo -e "$host\t$rc\t$check" | /var/local/brisskit/nagios-client/send_nrdp.sh -u $url -t $token

