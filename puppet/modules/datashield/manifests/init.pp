#Add datashield to the opal install
datashield {

	#Need to check opal is installed and running


	#Install R components
	package { 'r-base':
		ensure => installed
	}
	
	package { 'r-cran-rserve':
		ensure => installed,
		require => Package['r-base']
	}


	#Copy init script across
	File { '/etc/init.d/rserve':
		ensure => present,
		owner  => root,
		group  => root,
		mode   => 755,
		source => 'puppet://modules/datashield/init.txt',

	}
}
