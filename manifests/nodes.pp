node base {
	include base, ntp
}

#node 'bru3-(.*)$/' {
#	include logwatch
#}

#node '/^(.*)-redcap$/' {
#	include mysql-server-core-5.1
#}

#node 'bru1-civi' {
#	include brisskit
#}

#node 'bru1-camp' {
#	include base
#}

#All VMs in the bru1 vApp
node /^bru1-.*$/ {
	include base, ntp
}

#node 'bru1-mysql' {
#	include mysql_passwords
#}
