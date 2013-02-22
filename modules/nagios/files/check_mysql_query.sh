#!/bin/bash

host=$(/usr/bin/facter fqdn)
mysql_user=$(/usr/local/bin/brisskit_db_param nagios user)
mysql_pass=$(/usr/local/bin/brisskit_db_param nagios pass)
check=$(/usr/lib/nagios/plugins/check_mysql_query -q "SELECT 1+2" -c 3:3 -u $mysql_user -p $mysql_pass)
rc=$?
service_name="MySQL"
token="token1234"
url=http://192.168.0.221/nrdp/


echo -e "$host\t$service_name\t$rc\t$check" | /var/local/brisskit/nagios-client/send_nrdp.sh -u $url -t $token

