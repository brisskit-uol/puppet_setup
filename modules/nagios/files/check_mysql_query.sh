#!/bin/bash

sleepseconds=120
sleeptime=$(/usr/bin/facter macaddress | tr -cd [:digit:] | awk '{printf "%d\n",$1}')
let sleeptime%=$sleepseconds
sleep $sleeptime

host=$(/usr/bin/facter fqdn)
mysql_user=$(/usr/local/bin/brisskit_db_param nagios user)
mysql_pass=$(/usr/local/bin/brisskit_db_param nagios pass)
check=$(/usr/lib/nagios/plugins/check_mysql_query -q "SELECT 1+2" -c 3:3 -u $mysql_user -p $mysql_pass)
rc=$?
service_name="MySQL"
token="b9zwe6ecstcrcdfem1703l0szrtntmij"
url=http://ga-nagios/nrdp/


echo -e "$host\t$service_name\t$rc\t$check" | /var/local/brisskit/nagios-client/send_nrdp.sh -u $url -t $token

