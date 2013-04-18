#Manage the puppet agent on each VM. This is included in the first run stage so
#it completely runs before any other modules are called. This is defined by
#how it is included in the base_global class.
class puppet {

	#Lets check we have a sensible environment variable set first.
	require puppet::check_environment

	#Main puppet software
	service { "puppet":
		ensure     => "running",
		hasrestart => true,
	}

	#Manage the puppet config file
	#Note the environment variable.
	file { "/etc/puppet/puppet.conf":
		notify => Service["puppet"],
		ensure => present,
		owner  => 'root',
		group  => 'root',
		mode   => 0644,
		source => "puppet:///modules/puppet/puppet.conf.${environment}",
	}


	#Configure puppetdb and its underlying database
	#class { 'puppetdb': 
	#	database       => 'embedded',
	#	listen_address => '0.0.0.0',	
	#}

	# Configure the puppet master to use puppetdb
#	class { 'puppetdb::master::config': 
#		puppetdb_server => 'ga-puppet.brisskit.le.ac.uk',
#		puppetdb_port   => 8081,
#	}
}


