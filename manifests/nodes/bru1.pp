#####################################################################
#BRU1 nodes
#####################################################################
node 'bru1-camp.brisskit.le.ac.uk' {
	include bru_base
	include users::integration

	#Backup stuff
	include backup::base                                         #Set up file tree
	include backup::users::vapp_backup                           #Set up users
        ssh::auth::server { "master_backup": user => "vapp_backup" } #Copy master_backup pub key to vapp_backup authorized_keys
	ssh::auth::client { "vapp_backup": }                         #Get vapp_backup private key
}

#catissue
node 'bru1-lb.brisskit.le.ac.uk' {
	include bru_base
	include postfix
	include users::si84, users::ss727
}

#civicrm
node 'bru1-civicrm.brisskit.le.ac.uk' {
	include bru_base
	include postfix
	include users::si84, users::ss727

	#Backup stuff
        include backup::base                                     #Set up file tree
        include backup::users::vm_backup                         #Set up users
        ssh::auth::server { "vapp_backup": user => "vm_backup" } #Copy vapp_backup pub key to vm_backup authorized_keys
}


#any other ones that have been missed out
node /^bru1-.*$/ {
	include bru_base
	include users::integration
}


