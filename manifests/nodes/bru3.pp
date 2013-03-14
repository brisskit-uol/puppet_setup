#################################################
#BRU3
#################################################
#camp - everyone needs to be on this to get
#to the other VMs
node 'bru3-camp.brisskit.le.ac.uk' {
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
	include pound

	class {fw: stage => second}
	include fw::target::camp
	include fw::target::pound

}

#catissue
node 'bru3-catissue.brisskit.le.ac.uk' {
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

	class {fw: stage => second}
	include fw::target::catissue
}


#catissue2
node 'bru3-catissue3.brisskit.le.ac.uk' {
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

	class {fw: stage => second}
	include fw::target::catissue
}


#civicrm
node 'bru3-civicrm.brisskit.le.ac.uk' {
	include base_customer
	include postfix
	include users::customer_civicrm

	include nagios::target::civicrm

	#Backup stuff
        include backup::base                                     #Set up file tree
        include backup::users::vm_backup                         #Set up users
        ssh::auth::server { "vapp_backup": user => "vm_backup" } #Copy vapp_backup pub key to vm_backup authorized_keys

	class {fw: stage => second}
	include fw::target::civicrm
}

#i2b2
node 'bru3-i2b2.brisskit.le.ac.uk' {
        include base_customer
	include users::customer_i2b2
        include users::integration
	ssh::auth::client { "integration": }
	ssh::auth::server { "integration": }

	include nagios::target::i2b2

	class {fw: stage => second}
	include fw::target::i2b2
}


#onyx
node 'bru3-onyx.brisskit.le.ac.uk' {
	include base_customer
	include users::customer_onyx

        #Backup stuff
        include backup::base                                     #Set up file tree
        include backup::users::vm_backup                         #Set up users
        ssh::auth::server { "vapp_backup": user => "vm_backup" } #Copy vapp_backup pub key to vm_backup authorized_keys

	include nagios::target::onyx

	class {fw: stage => second}
	include fw::target::onyx
}

#openesb
node 'bru3-openesb.brisskit.le.ac.uk' {
        include base_customer
	include users::customer_openesb

	class {fw: stage => second}
	include fw::target::openesb
}


#openesb
node 'bru3-openesbx.brisskit.le.ac.uk' {
        include base_customer
	include users::customer_openesb

	stage {fw: stage => second}
	include fw::target::openesb
}



#pound - this isn't really the pound server anymore - camp does it all now
node 'bru3-pound.brisskit.le.ac.uk' {
        include base_customer
        include pound

	stage {fw: stage => second}
	include fw::target::pound
}

#mysql
node 'bru3-mysql.brisskit.le.ac.uk' {
        include base_customer
        include users::customer_mysql
	#include nagios::target::mysql

	class {fw: stage => second}
	include fw::target::mysql
}

#any other ones that have been missed out
node /^bru3-.*$/ {
	include base_customer

	class {fw: stage => second}
	include fw::target::customer
}

