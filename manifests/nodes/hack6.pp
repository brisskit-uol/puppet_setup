#################################################
#hack6
#This is just for the hack event, so cut down somewhat -
#-NO BACKUPS
#################################################
#camp - everyone needs to be on this to get
#to the other VMs
node 'hack6-camp.brisskit.le.ac.uk' {
	include bru_base
	include users::jl99, users::rcf8, users::si84

	package {'mysql-client': ensure => present}
}

#catissue
node 'hack6-catissue.brisskit.le.ac.uk' {
	include bru_base
	include postfix
	include users::integration, users::si84, users::ss727
	ssh::auth::client { "integration": }
	ssh::auth::server { "integration": }
}

#civicrm
node 'hack6-civicrm.brisskit.le.ac.uk' {
	include bru_base
	include postfix
	include users::rcf8, users::si84, users::tb143
}

#i2b2
node 'hack6-i2b2.brisskit.le.ac.uk' {
        include bru_base
        include users::integration, users::si84
	ssh::auth::client { "integration": }
	ssh::auth::server { "integration": }
}


#onyx
node 'hack6-onyx.brisskit.le.ac.uk' {
	include bru_base
	include users::jl99
}

#openesb
node 'hack6-openesb.brisskit.le.ac.uk' {
        include bru_base
        include users::si84
}

#any other ones that have been missed out
node /^hack6-.*$/ {
	include bru_base
}

