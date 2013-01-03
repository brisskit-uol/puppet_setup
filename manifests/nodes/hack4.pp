#################################################
#hack4
#This is just for the hack event, so cut down somewhat -
#-NO BACKUPS
#################################################
#camp - everyone needs to be on this to get
#to the other VMs
node 'hack4-camp.brisskit.le.ac.uk' {
	include base_customer

	include users::customer_admin
	include users::hack

	package {'mysql-client': ensure => present}
}

#catissue
node 'hack4-catissue.brisskit.le.ac.uk' {
	include base_customer
	include postfix

	include users::customer_catissue
	include users::integration
	include users::hack

	ssh::auth::client { "integration": }
	ssh::auth::server { "integration": }
}

#civicrm
node 'hack4-civicrm.brisskit.le.ac.uk' {
	include base_customer
	include postfix

	include users::customer_civicrm
	include users::hack
}

#i2b2
node 'hack4-i2b2.brisskit.le.ac.uk' {
        include base_customer

	include users::customer_i2b2
        include users::integration
	include users::hack

	ssh::auth::client { "integration": }
	ssh::auth::server { "integration": }
}


#onyx
node 'hack4-onyx.brisskit.le.ac.uk' {
	include base_customer

	include users::customer_onyx
	include users::hack
}

#openesb
node 'hack4-openesb.brisskit.le.ac.uk' {
        include base_customer
        
	realize( Users::Virtual::Ssh_user["si84"] )
	include users::hack
}

#any other ones that have been missed out
node /^hack4-.*$/ {
	include base_customer
	include users::hack
}
