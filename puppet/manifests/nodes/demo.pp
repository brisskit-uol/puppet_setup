#################################################
#demo
#################################################
#camp - everyone needs to be on this to get
#to the other VMs
node 'demo-camp.brisskit.le.ac.uk' {
        include base_customer
        include users::customer_admin

	#Backup stuff
        include backup::base                                         #Set up file tree
        include backup::users::vapp_backup                           #Set up users
        ssh::auth::server { "master_backup": user => "vapp_backup" } #Copy master_backup pub key to vapp_backup authorized_keys
        ssh::auth::client { "vapp_backup": }                         #Get vapp_backup private key

	package {'mysql-client': ensure => present}
}

#catissue
node 'demo-catissue.brisskit.le.ac.uk' {
        include base_customer
        include postfix

        include users::integration
	include users::customer_catissue

	ssh::auth::client { "integration": }
        ssh::auth::server { "integration": }

	#Backup stuff
        include backup::base                                     #Set up file tree
        include backup::users::vm_backup                         #Set up users
        ssh::auth::server { "vapp_backup": user => "vm_backup" } #Copy vapp_backup pub key to vm_backup authorized_keys

	package {'mysql-client': ensure => present}
}

#civicrm
node 'demo-civicrm.brisskit.le.ac.uk' {
        include base_customer
        include postfix

        include users::customer_civicrm

	#Backup stuff
        include backup::base                                     #Set up file tree
        include backup::users::vm_backup                         #Set up users
        ssh::auth::server { "vapp_backup": user => "vm_backup" } #Copy vapp_backup pub key to vm_backup authorized_keys

	package {'mysql-client': ensure => present}
}

#i2b2
node 'demo-i2b2.brisskit.le.ac.uk' {
        include base_customer

	include users::customer_i2b2
        include users::integration

        ssh::auth::client { "integration": }
	ssh::auth::server { "integration": }
}


#onyx
node 'demo-onyx.brisskit.le.ac.uk' {
        include base_customer

	include users::customer_onyx
        
        #Backup stuff
        include backup::base                                     #Set up file tree
        include backup::users::vm_backup                         #Set up users
        ssh::auth::server { "vapp_backup": user => "vm_backup" } #Copy vapp_backup pub key to vm_backup authorized_keys

	package {'mysql-client': ensure => present}
}

#any other ones that have been missed out
node /^demo-.*$/ {
        include base_customer
}
