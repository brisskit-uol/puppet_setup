class base {

	#Lets figure out the vApp name
	$parts = split("${fqdn}", '-')
	$vapp_name = $parts[0]

	notify{"Starting base config $vapp_name":}

	#########################################################################
	#Directories and files
	#########################################################################

	#hosts file
	file { "/etc/hosts":
		ensure => present,
		owner  => 'root',
		group  => 'root',
		mode   => 0644,
		source => "puppet:///modules/base/hosts/${vapp_name}_hosts",
	}

	#brisskit config directory
	file { "/etc/brisskit":
		ensure => directory,
		owner  => 'root',
		group  => 'root',
		mode   => 0644,
	}

	#brisskit mysql config directory
	file { "/etc/brisskit/mysql":
		ensure => directory,
		owner  => 'ob30',
		group  => 'ob30',
		mode   => 0644,
		require => File["/etc/brisskit"],
	}

	#settings file - just the inst prefix atm
        file { "/etc/brisskit/settings.cfg":
                ensure => present,
                owner  => 'root',
                group  => 'root',
                mode   => 0644,
                source => "puppet:///modules/base/settings/${vapp_name}_settings",
		require => File["/etc/brisskit"],
        }

	#brisskit install directory
	file { "/var/local/brisskit":
		ensure => directory,
		owner  => 'root',
		group  => 'root',
		mode   => 0644,
	} 

	#mysql helper functions
	file { "/usr/local/bin/brisskit_db_param":
		ensure => present,
		owner  => 'root',
		group  => 'root',
		mode   => 0755,
		source => "puppet:///modules/base/brisskit_db_param",
	}

	file { "/usr/local/bin/brisskit_db_login":
		ensure => present,
		owner  => 'root',
		group  => 'root',
		mode   => 0755,
		source => "puppet:///modules/base/brisskit_db_login",
	}
}
