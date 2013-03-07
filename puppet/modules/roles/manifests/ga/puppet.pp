class roles::ga::puppet {

	require roles::ga

	include ssh::auth::keymaster

	#################
	# Backup	#
	#################

	# Set up file tree
	include backup::base

	# Set up users
	include backup::users::ga_puppet_backup

	# Copy master_backup pub key to ga_backup_backup authorized_keys
	ssh::auth::server { "master_backup": user => "ga_puppet_backup" }

	# All these files are owned by puppet, and keep changing their status
	# to owner read-only, so this either has to run as puppet or root.
	# Puppet is not a real user so I do not know how to do that! Means
	# we have a pair of CRON jobs to synchronise

	cron { run_puppet_backup:
		command => "/var/local/brisskit/backup/source/puppet.sh",
		user    => root,
		hour    => 13,
		minute  => 25
	}

}
