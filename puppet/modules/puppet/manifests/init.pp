class puppet {

	#Manage the puppet config file
	file { "/etc/puppet/puppet.conf":
		ensure => present,
		owner  => 'root',
		group  => 'root',
		mode   => 0644,
		source => "puppet:///modules/puppet/puppet.conf",
	}
}
