#################################################
#hack4
#This is just for the hack event, so cut down somewhat -
#-NO BACKUPS
#################################################
#camp - everyone needs to be on this to get
#to the other VMs
node 'hack4-camp.brisskit.le.ac.uk' {
	include base_customer
	include users::jl99, users::rcf8, users::si84
	include users::hack

	package {'mysql-client': ensure => present}
}

#catissue
node 'hack4-catissue.brisskit.le.ac.uk' {
	include base_customer
	include postfix
	include users::integration, users::si84
	include users::hack
	ssh::auth::client { "integration": }
	ssh::auth::server { "integration": }
}

#civicrm
node 'hack4-civicrm.brisskit.le.ac.uk' {
	include base_customer
	include postfix
	include users::rcf8, users::si84, users::tb143
	include users::hack
}

#i2b2
node 'hack4-i2b2.brisskit.le.ac.uk' {
        include base_customer
        include users::integration, users::si84
	include users::hack
	ssh::auth::client { "integration": }
	ssh::auth::server { "integration": }
}


#onyx
node 'hack4-onyx.brisskit.le.ac.uk' {
	include base_customer
	include users::jl99
	include users::hack
}

#openesb
node 'hack4-openesb.brisskit.le.ac.uk' {
        include base_customer
        include users::si84
	include users::hack
}

#any other ones that have been missed out
node /^hack4-.*$/ {
	include base_customer
	include users::hack
}

