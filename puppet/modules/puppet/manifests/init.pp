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
}


