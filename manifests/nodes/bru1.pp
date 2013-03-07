#################################################
#BRU1
#################################################
#camp - everyone needs to be on this to get
#to the other VMs
node 'bru1-camp.brisskit.le.ac.uk' {
	include base_customer
	include users::customer_admin

        #Backup stuff
        include backup::base                                         #Set up file tree
        include backup::users::vapp_backup                           #Set up users
        ssh::auth::server { "master_backup": user => "vapp_backup" } #Copy master_backup pub key to vapp_backup authorized_keys
        ssh::auth::client { "vapp_backup": }                         #Get vapp_backup private key

	package {'mysql-client': ensure => present}

	include nagios::target::camp	# Create nagios cfg file for host

	#Lets make this the pound server too.
	#include pound

}

#catissue
node 'bru1-catissue.brisskit.le.ac.uk' {
	include base_customer
	include postfix
	include users::customer_catissue
	include users::integration
	ssh::auth::client { "integration": }
	ssh::auth::server { "integration": }

        #Backup stuff
        include backup::base                                     #Set up file tree
        include backup::users::vm_backup                         #Set up users
        ssh::auth::server { "vapp_backup": user => "vm_backup" } #Copy vapp_backup pub key to vm_backup authorized_keys

	include nagios::target::catissue
}


#catissue2
node 'bru1-catissue3.brisskit.le.ac.uk' {
        include base_customer
        include postfix
        include users::customer_catissue
        include users::integration
        ssh::auth::client { "integration": }
        ssh::auth::server { "integration": }

        #Backup stuff
        include backup::base                                     #Set up file tree
        include backup::users::vm_backup                         #Set up users
        ssh::auth::server { "vapp_backup": user => "vm_backup" } #Copy vapp_backup pub key to vm_backup authorized_keys
}


#civicrm
node 'bru1-civicrm.brisskit.le.ac.uk' {
	include base_customer
	include postfix
	include users::customer_civicrm

	include nagios::target::civicrm

	#Backup stuff
        include backup::base                                     #Set up file tree
        include backup::users::vm_backup                         #Set up users
        ssh::auth::server { "vapp_backup": user => "vm_backup" } #Copy vapp_backup pub key to vm_backup authorized_keys
}

#i2b2
node 'bru1-i2b2.brisskit.le.ac.uk' {
        include base_customer
	include users::customer_i2b2
        include users::integration
	ssh::auth::client { "integration": }
	ssh::auth::server { "integration": }

	include nagios::target::i2b2
}


#onyx
node 'bru1-onyx.brisskit.le.ac.uk' {
	include base_customer
	include users::customer_onyx

        #Backup stuff
        include backup::base                                     #Set up file tree
        include backup::users::vm_backup                         #Set up users
        ssh::auth::server { "vapp_backup": user => "vm_backup" } #Copy vapp_backup pub key to vm_backup authorized_keys

	include nagios::target::onyx
}

#openesb
node 'bru1-openesb.brisskit.le.ac.uk' {
        include base_customer
	include users::customer_openesb
}


#openesb
node 'bru1-openesbx.brisskit.le.ac.uk' {
        include base_customer
	include users::customer_openesb
}



#pound
node 'bru1-pound.brisskit.le.ac.uk' {
        include base_customer
        #include pound
}

#mysql
node 'bru1-mysql.brisskit.le.ac.uk' {
        include base_customer
        include users::customer_mysql
	#include nagios::target::mysql
}

#any other ones that have been missed out
node /^bru1-.*$/ {
	include base_customer
}

