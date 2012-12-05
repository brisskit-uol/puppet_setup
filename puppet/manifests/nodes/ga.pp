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
        include backup::base                                              #Set up file tree
	include backup::users::ga_puppet_backup                           #Set up users
        ssh::auth::server { "master_backup": user => "ga_puppet_backup" } #Copy master_backup pub key to ga_puppet_backup authorized_keys

	#All these files are owned by puppet, and keep changing their status to 
	#owner read-only, so this either has to run as puppet or root. Puppet isnt
	#a real user so I dont know how to do that! Means we have a pair of CRON jobs
	#to synchronize.
        cron { run_puppet_backup:
                command => "/var/local/brisskit/backup/source/puppet.sh",
                user    => root,
                hour    => 13,
                minute  => 25
        }



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


	##############BACKUP SCHEDULES##################
        #Drupal master
        cron { run_drupal_copy_backup:
                command => "/var/local/brisskit/backup/source/drupal_master.sh",
                user    => master_backup,
                hour    => 1,
                minute  => 0
        }

        #Mediawiki master
        cron { run_mediawiki_copy_backup:
                command => "/var/local/brisskit/backup/source/mediawiki_master.sh",
                user    => master_backup,
                hour    => 1,
                minute  => 15
        }

        #Puppet master
        cron { run_puppet_copy_backup:
                command => "/var/local/brisskit/backup/source/puppet_master.sh",
                user    => master_backup,
                hour    => 1,
                minute  => 30
        }

	#Customer data
	cron { run_backup:
		command => "/var/local/brisskit/backup/source/global_master.sh",
		user    => master_backup,
		hour	=> 3,
		minute  => 0
	}
	################################################

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


#private web server
node 'ga-maven.brisskit.le.ac.uk' {
        include ga_base
        include users::jl99
}

#nagios server
node 'ga-nagios.brisskit.le.ac.uk' {
        include ga_base
	include users::russ
}

