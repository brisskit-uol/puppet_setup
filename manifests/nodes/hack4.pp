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

	class {fw: stage => second}
	include fw::target::camp
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

	class {fw: stage => second}
	include fw::target::catissue
}

#civicrm
node 'hack4-civicrm.brisskit.le.ac.uk' {
	include base_customer
	include postfix

	include users::customer_civicrm
	include users::hack
	class {fw: stage => second}
	include fw::target::civicrm
}

#i2b2
node 'hack4-i2b2.brisskit.le.ac.uk' {
        include base_customer

	include users::customer_i2b2
        include users::integration
	include users::hack

	ssh::auth::client { "integration": }
	ssh::auth::server { "integration": }

	class {fw: stage => second}
	include fw::target::i2b2
}

#mysql
node 'hack4-mysql.brisskit.le.ac.uk' {
	include base_customer

	include users::hack

	class {fw: stage => second}
	include fw::target::mysql
}

#onyx
node 'hack4-onyx.brisskit.le.ac.uk' {
	include base_customer

	include users::customer_onyx
	include users::hack

	class {fw: stage => second}
	include fw::target::onyx
}

#openesb
node 'hack4-openesb.brisskit.le.ac.uk' {
        include base_customer
        
	realize( Users::Virtual::Ssh_user["si84"] )
	include users::hack
}

#pound
node 'hack4-pound.brisskit.le.ac.uk' {
	include base_customer

	include users::hack

	class {fw: stage => second}
	include fw::target::pound
}

#any other ones that have been missed out
node /^hack4-.*$/ {
	include base_customer
	include users::hack
}

