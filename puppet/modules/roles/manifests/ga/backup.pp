class roles::ga::backup {

	require roles::ga

	#################
	# Backup	#
	#################

	# Set up file tree
	include backup::base

	# Set up users
	include backup::users::master_backup

	ssh::auth::client { "master_backup": }

	#########################
	# Backup schedules	#
	#########################

	#Drupal master
	cron { run_drupal_copy_backup:
		command	=> "/var/local/brisskit/backup/source/drupal_master.sh",
		user	=> master_backup,
		hour	=> 1,
		minute	=> 0
	}

	#Mediawiki master
	cron { run_mediawiki_copy_backup:
		command	=> "/var/local/brisskit/backup/source/mediawiki_master.sh",
		user	=> master_backup,
		hour	=> 1,
		minute	=> 15
	}

	#maven master
	cron { run_maven_copy_backup:
		command	=> "/var/local/brisskit/backup/source/maven_master.sh",
		user	=> master_backup,
		hour	=> 0,
		minute	=> 30
	}

	#Puppet master
	cron { run_puppet_copy_backup:
		command	=> "/var/local/brisskit/backup/source/puppet_master.sh",
		user	=> master_backup,
		hour	=> 1,
		minute	=> 30
	}

	#Customer data
	cron { run_backup:
		command => "/var/local/brisskit/backup/source/global_master.sh",
		user    => master_backup,
		hour	=> 3,
		minute  => 0
	}

}
