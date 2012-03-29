class base {
	include base
}

#node 'puptest' {
#   include apache2
#}

#node 'mysql' {
#	include apache2
#}

#node 'bru3-(.*)$/' {
#	include logwatch
#}

#node '/^(.*)-redcap$/' {
#	include mysql-server-core-5.1
#}

#node 'bru1-civi' {
#	include brisskit
#}

node 'bru1-camp' {
	include base
}

