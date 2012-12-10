#Files and directories common to the whole stack,
#ie customer VMs, GA VMs and pubweb VMs
class base_global {

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

	#brisskit mysql config directory
	file { "/etc/brisskit/mysql":
		ensure => directory,
		owner  => 'ob30',
		group  => 'ob30',
		mode   => 0644,
		require => File["/etc/brisskit"],
	}

        #brisskit keys directory
        file { "/etc/brisskit/keys":
                ensure  => directory,
                owner   => 'ob30',
                group   => 'ob30',
                mode    => 0600,
		recurse => true,
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
		source => "puppet:///modules/base_global/brisskit_db_param",
	}

	file { "/usr/local/bin/brisskit_db_login":
		ensure => present,
		owner  => 'root',
		group  => 'root',
		mode   => 0755,
		source => "puppet:///modules/base_global/brisskit_db_login",
	}
}
