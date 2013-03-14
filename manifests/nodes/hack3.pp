#################################################
#hack3
#This is just for the hack event, so cut down somewhat -
#-NO BACKUPS
#################################################
#camp - everyone needs to be on this to get
#to the other VMs
node 'hack3-camp.brisskit.le.ac.uk' {
	include base_customer
	include users::customer_admin	
	include users::hack
	package {'mysql-client': ensure => present}

	class {fw: stage => second}
	include fw::target::camp
}

#catissue
node 'hack3-catissue.brisskit.le.ac.uk' {
	include base_customer
	include postfix

	include users::integration
	include users::customer_catissue		
	include users::hack

	ssh::auth::client { "integration": }
	ssh::auth::server { "integration": }

	class {fw: stage => second}
	include fw::target::catissue
}

#civicrm
node 'hack3-civicrm.brisskit.le.ac.uk' {
	include base_customer
	include postfix
	
	include users::customer_civicrm
	include users::hack

	class {fw: stage => second}
	include fw::target::civicrm
}

#i2b2
node 'hack3-i2b2.brisskit.le.ac.uk' {
        include base_customer
        
	include users::customer_i2b2
	include users::integration
	include users::hack
	
	ssh::auth::client { "integration": }
	ssh::auth::server { "integration": }

	class {fw: stage => second}
	include fw::target::i2b2
}


#onyx
node 'hack3-onyx.brisskit.le.ac.uk' {
	include base_customer
	
	include users::customer_onyx
	include users::hack

	class {fw: stage => second}
	include fw::target::onyx
}

#openesb
node 'hack3-openesb.brisskit.le.ac.uk' {
        include base_customer
        
	realize( Users::Virtual::Ssh_user["si84"] )
	include users::hack

	class {fw: stage => second}
	include fw::target::openesb
}

#pound
node 'hack3-pound.brisskit.le.ac.uk' {
	include base_customer

	include users::hack

	class {fw: stage => second}
	include fw::target::pound
}

#any other ones that have been missed out
node /^hack3-.*$/ {
	include base_customer
	include users::hack

	class {fw: stage => second}
	include fw::target::customer
}

