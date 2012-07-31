#################################################
#BE VERY CAREFUL WITH THE ONES BELOW, THEY ARE
#THE MANAAGEMENT VMS!
#################################################
class ga_base {
	include ga_base_file
	include ntp
	include puppet
	include ga_hosts
	include users::ob30
}


#puppet master. Be careful not to become self aware :)
node ga-puppet {
	include ga_base
	include ssh::auth::keymaster

        #Backup stuff
        include backup::base                                       #Set up file tree
	include backup::users::ga_backup                           #Set up users
        ssh::auth::server { "master_backup": user => "ga_backup" } #Copy master_backup pub key to vapp_backup authorized_keys

}

#mail server
node 'ga-mail.brisskit.le.ac.uk' {
	include ga_base
}

#backup vm
node ga-backup {
	include ga_base
	include backup::base
	include backup::users::master_backup
	ssh::auth::client { "master_backup": }

	cron { run_backup:
		command => "/var/local/brisskit/backup/source/global_master.sh",
		user    => master_backup,
		hour	=> 3,
		minute  => 0
	}

}

#load balancer
node ga-pound {
	include ga_base
	include postfix
}

#global ssh gateway
node 'ga-gimp.brisskit.le.ac.uk' {
	include ga_base
}

#private web server
node 'ga-private.brisskit.le.ac.uk' {
	include ga_base
	include users::jl99, users::si84, users::ss727
}
