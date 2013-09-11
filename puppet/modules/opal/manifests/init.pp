#Add datashield to the opal install
class opal {

notify{"in opal":}

	#Add obiba key and url to sources list
	apt::source { 'obiba':
		location   => 'http://pkg.obiba.org',
		release    => 'stable/',
		repos      => '',
		key        => '7A49E499',
		key_source => 'http://pkg.obiba.org/obiba.org.key',
		include_src => false,
	}

	#Install the package
	package { 'opal':
		ensure => installed,
		require => Class['apt::source[obiba]'],
	}

	#Main config file
	file { "opal-config.properties.puppet":
    		path    => "/etc/opal/opal-config.properties.puppet",
    		owner   => 'opal',
    		group   => 'adm',
    		mode    => 750,
    		content => template("opal/opal-config.properties.erb"),
		notify  => Service["opal"],
  	}

	#Make sure opal is running
	service { "opal":
        	ensure => running,
    	}

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
		source  => 'puppet:///modules/opal/init.txt',
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
