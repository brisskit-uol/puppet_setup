#################################################
#hack2
#This is just for the hack event, so cut down somewhat -
#-NO BACKUPS
#################################################
#camp - everyone needs to be on this to get
#to the other VMs
node 'hack2-camp.brisskit.le.ac.uk' {
	include bru_base
	include users::jl99, users::rcf8, users::si84

	package {'mysql-client': ensure => present}

	include users::hack
}

#catissue
node 'hack2-catissue.brisskit.le.ac.uk' {
	include bru_base
	include postfix
	include users::hack
	include users::integration, users::si84, users::ss727
	ssh::auth::client { "integration": }
	ssh::auth::server { "integration": }
}


#civicrm
node 'hack2-civicrm.brisskit.le.ac.uk' {
	include bru_base
	include postfix
	include users::rcf8, users::si84, users::tb143
	include users::hack
}

#i2b2
node 'hack2-i2b2.brisskit.le.ac.uk' {
        include bru_base
        include users::integration, users::si84
	include users::hack
	ssh::auth::client { "integration": }
	ssh::auth::server { "integration": }
}


#onyx
node 'hack2-onyx.brisskit.le.ac.uk' {
	include bru_base
	include users::jl99
	include users::hack
}

#openesb
node 'hack2-openesb.brisskit.le.ac.uk' {
        include bru_base
        include users::si84
	include users::hack
}

#any other ones that have been missed out
node /^hack2-.*$/ {
	include bru_base
	include users::hack
}

