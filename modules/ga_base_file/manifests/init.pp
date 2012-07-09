class ga_base_file {

	#########################################################################
	#Directories and files
	#########################################################################

	#brisskit config directory
	file { "/etc/brisskit":
		ensure => directory,
		owner  => 'root',
		group  => 'root',
		mode   => 0644,
	}

	#brisskit install directory
	file { "/var/local/brisskit":
		ensure => directory,
		owner  => 'root',
		group  => 'root',
		mode   => 0644,
	} 
}
