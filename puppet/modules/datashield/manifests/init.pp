#Add datashield to the opal install
class datashield {

	#Need to check opal is installed and running


	#Install R components
	package { 'r-base':
		ensure => installed,
	}
	
	package { 'r-cran-rserve':
		ensure  => installed,
		require => Package['r-base'],
	}


	#Copy init script across
	file { '/etc/init.d/rserve':
		ensure  => present,
		owner   => root,
		group   => root,
		mode    => 755,
		source  => 'puppet:///modules/datashield/init.txt',
		require => User['rserve'],
	}

	#Add a user that rserv runs as - this is set in the init.d script
	user { 'rserve':
		ensure     => present,
		home       => '/var/lib/rserve',
		managehome => true,
	}

	#Make sure rserv is running
	service { 'rserve':
		ensure    => running, 
		hasstatus => false,
		require   => File['/etc/init.d/rserve'],
	}

}
