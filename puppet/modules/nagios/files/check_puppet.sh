#!/bin/bash

host=$(/usr/bin/facter fqdn)
check=$(/usr/lib/nagios/plugins/check_puppet -w 630 -c 1260)
rc=$?
service_name="Puppet"
token="1jn7nhfwdsmgyx5iljqr7bccue3q6nen"
url=http://192.168.0.221/nrdp/


echo -e "$host\t$service_name\t$rc\t$check" | /var/local/brisskit/nagios-client/send_nrdp.sh -u $url -t $token

