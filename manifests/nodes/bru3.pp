#################################################
#BRU3
#################################################
#camp - everyone needs to be on this to get
#to the other VMs
node 'bru3-camp.brisskit.le.ac.uk' {
	include base_customer
	include users::jl99, users::rcf8, users::si84, users::ss727, users::tb143

        #Backup stuff
        include backup::base                                         #Set up file tree
        include backup::users::vapp_backup                           #Set up users
        ssh::auth::server { "master_backup": user => "vapp_backup" } #Copy master_backup pub key to vapp_backup authorized_keys
        ssh::auth::client { "vapp_backup": }                         #Get vapp_backup private key


	package {'mysql-client': ensure => present}

}

#catissue
node 'bru3-catissue.brisskit.le.ac.uk' {
	include base_customer
	include postfix
	include users::integration, users::si84, users::ss727
	ssh::auth::client { "integration": }
	ssh::auth::server { "integration": }

        #Backup stuff
        include backup::base                                     #Set up file tree
        include backup::users::vm_backup                         #Set up users
        ssh::auth::server { "vapp_backup": user => "vm_backup" } #Copy vapp_backup pub key to vm_backup authorized_keys
}

#civicrm
node 'bru3-civicrm.brisskit.le.ac.uk' {
	include base_customer
	include postfix
	include users::rcf8, users::si84, users::ss727, users::tb143

	#Backup stuff
        include backup::base                                     #Set up file tree
        include backup::users::vm_backup                         #Set up users
        ssh::auth::server { "vapp_backup": user => "vm_backup" } #Copy vapp_backup pub key to vm_backup authorized_keys
}

#i2b2
node 'bru3-i2b2.brisskit.le.ac.uk' {
        include base_customer
        include users::integration, users::si84, users::ss727
	ssh::auth::client { "integration": }
	ssh::auth::server { "integration": }
}


#onyx
node 'bru3-onyx.brisskit.le.ac.uk' {
	include base_customer
	include users::jl99, users::si84

        #Backup stuff
        include backup::base                                     #Set up file tree
        include backup::users::vm_backup                         #Set up users
        ssh::auth::server { "vapp_backup": user => "vm_backup" } #Copy vapp_backup pub key to vm_backup authorized_keys
}

#openesb
node 'bru3-openesb.brisskit.le.ac.uk' {
        include base_customer
        include users::si84
}


#pound
node 'bru3-pound.brisskit.le.ac.uk' {
        include base_customer
        include pound
}

#any other ones that have been missed out
node /^bru3-.*$/ {
	include base_customer
}

