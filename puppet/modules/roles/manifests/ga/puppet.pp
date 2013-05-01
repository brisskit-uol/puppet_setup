class roles::ga::puppet {

	require ::roles::ga::common

	include ::ssh::auth::keymaster

	#################
	# Backup	#
	#################

	# Set up file tree
	include ::backup::base

	# Set up users
	include ::backup::users::ga_puppet_backup

	# Copy master_backup pub key to ga_backup_backup authorized_keys
	ssh::auth::server { "master_backup": user => "ga_puppet_backup" }

	# All these files are owned by puppet, and keep changing their status
	# to owner read-only, so this either has to run as puppet or root.
	# Puppet is not a real user so I do not know how to do that! Means
	# we have a pair of CRON jobs to synchronise

	cron { run_puppet_backup:
		command => "/var/local/brisskit/backup/source/puppet.sh",
		user    => root,
		hour    => 19,
		minute  => 25
	}

	#################
	# Nagios	#
	#################

	include ::nagios::target::puppet

	#################
	# Firewall	#
	#################

	#include ::fw::target::puppet
	#Needs the hosts file to be made first.
	class {::fw::target::puppet: stage => third}



	#################
	# Puppet repo   #
	#################
	apt::source { 'puppetlabs':
		location   => 'http://apt.puppetlabs.com',
		repos      => 'main',
		key        => '4BD6EC30',
		key_server => 'pgp.mit.edu',
	}

	#################
	# PuppetDB      #
	#################

	#Configure puppetdb and its underlying database
	class { 'puppetdb': 
		database       => 'embedded',
		listen_address => '0.0.0.0',	
	}

	#Configure the puppet master to use puppetdb
	class { 'puppetdb::master::config': 
		puppetdb_server => 'ga-puppet.brisskit.le.ac.uk',
		puppetdb_port   => 8081,
	}


}
