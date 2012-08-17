#################################################
#BE VERY CAREFUL WITH THE ONES BELOW, THEY ARE
#THE MANAAGEMENT VMS!
#################################################
class pub_base {
	include base_common
	include ntp
	include puppet
	include ga_hosts
	include users::ob30
}



#
node 'pub-drupal-1.brisskit.le.ac.uk' {
	include pub_base
}

#Drupal7 and civicrm VM
node 'pub-drupal-2.brisskit.le.ac.uk' {
        include pub_base

	#Backup stuff
        include backup::base                                           #Set up file tree
	include backup::users::pubweb_backup                           #Set up users
        ssh::auth::server { "master_backup": user => "pubweb_backup" } #Copy master_backup pub key to pubweb_backup authorized_keys
}


