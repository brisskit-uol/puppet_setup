class puppet {

	service { "puppet":
		ensure     => "running",
		hasrestart => true,
	}



	#Manage the puppet config file
	file { "/etc/puppet/puppet.conf":
		notify => Service["puppet"],
		ensure => present,
		owner  => 'root',
		group  => 'root',
		mode   => 0644,
		source => "puppet:///modules/puppet/puppet.conf",
	}
}
