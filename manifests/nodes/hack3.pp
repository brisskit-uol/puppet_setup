#################################################
#hack3
#This is just for the hack event, so cut down somewhat -
#-NO BACKUPS
#################################################
#camp - everyone needs to be on this to get
#to the other VMs
node 'hack3-camp.brisskit.le.ac.uk' {
	include bru_base
	include users::jl99, users::rcf8, users::si84

	package {'mysql-client': ensure => present}
}

#catissue
node 'hack3-catissue.brisskit.le.ac.uk' {
	include bru_base
	include postfix
	include users::integration, users::si84, users::ss727
	ssh::auth::client { "integration": }
	ssh::auth::server { "integration": }
}

#civicrm
node 'hack3-civicrm.brisskit.le.ac.uk' {
	include bru_base
	include postfix
	include users::rcf8, users::si84, users::tb143
}

#i2b2
node 'hack3-i2b2.brisskit.le.ac.uk' {
        include bru_base
        include users::integration, users::si84
	ssh::auth::client { "integration": }
	ssh::auth::server { "integration": }
}


#onyx
node 'hack3-onyx.brisskit.le.ac.uk' {
	include bru_base
	include users::jl99
}

#openesb
node 'hack3-openesb.brisskit.le.ac.uk' {
        include bru_base
        include users::si84
}

#any other ones that have been missed out
node /^hack3-.*$/ {
	include bru_base
}

