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
	include base, ntp, puppet
}

node mysql-1 {
	include base, ntp 
}

##############################################
#BE VERY CAREFUL WITH THE ONES BELOW, THEY ARE
#THE MANAAGEMENT VMS!
##############################################

#puppet master. Be careful not to become self aware.
node ga-puppet {
	include ntp, puppet
}
