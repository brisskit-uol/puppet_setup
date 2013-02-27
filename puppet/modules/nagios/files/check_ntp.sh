#!/bin/bash

host=$(/usr/bin/facter fqdn)
check=$(/usr/lib/nagios/plugins/check_ntp_time -H localhost -w 0.5 -c 1.0)
rc=$?
service_name="NTP"
token="tzd9gkufjxnku7e6yez9xzbs31ltd6ln"
url=http://192.168.0.221/nrdp/


echo -e "$host\t$service_name\t$rc\t$check" | /var/local/brisskit/nagios-client/send_nrdp.sh -u $url -t $token

