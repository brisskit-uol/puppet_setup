#################################################
#Public facing websites
#################################################
#class pub_base {
#	include base_pub
#	include ntp
#	include puppet
#	include ga_hosts
#	include users::ob30
#}

#Drupal7 and civicrm VM
node 'pub-drupal-2.brisskit.le.ac.uk' {
        include base_pub

	#Backup stuff
        include backup::base                                           #Set up file tree
	include backup::users::pubweb_backup                           #Set up users
        ssh::auth::server { "master_backup": user => "pubweb_backup" } #Copy master_backup pub key to pubweb_backup authorized_keys
}

#mediawiki 
node 'pub-wiki-2.brisskit.le.ac.uk' {
        include base_pub

        #Backup stuff
        include backup::base                                           #Set up file tree
        include backup::users::pubweb_backup                           #Set up users
        ssh::auth::server { "master_backup": user => "pubweb_backup" } #Copy master_backup pub key to pubweb_backup authorized_keys
}



