#Files and directories common to the whole stack,
#ie customer VMs, GA VMs and pubweb VMs
class roles::global::common {

	#Make sure this runs first
	class {puppet: stage => first}

	#Other modules in main
	include sshd
	include ntp
	include users::global
	include nagios::target::base
#	include apt::get::update
	include resolver::global
	include motd
	include clamav::weeklyscan
	include clamav::dailyscan


	#Once a week do an apt-get update update 
	cron { "apt-get-update":
		ensure	=> present,
		command	=> "/usr/bin/apt-get update > /dev/null 2>&1",
		user	=> "root",
		minute	=> fqdn_rand(60),
		hour	=> fqdn_rand(4),
		weekday	=> fqdn_rand(7),
	}


	#Run an apt-get upgrade. This will run every time puppet runs on a client, 
	#so just uncomment this when necessary, i.e. dont leave this on all the time!
	exec {"apt-get-upgrade":
		command => "apt-get -y upgrade",
		path    => ["/bin", "/sbin", "/usr/bin", "/usr/sbin"],
	}


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

	#brisskit api directory
        file { "/var/local/brisskit/api":
                ensure => directory,
                owner  => 'root',
                group  => 'root',
                mode   => 0644,
		require => File["/var/local/brisskit"],
        }

	#mysql helper functions
	file { "/usr/local/bin/brisskit_db_param":
		ensure => present,
		owner  => 'root',
		group  => 'root',
		mode   => 0755,
		source => "puppet:///modules/roles/global/brisskit_db_param",
	}

	file { "/usr/local/bin/brisskit_db_login":
		ensure => present,
		owner  => 'root',
		group  => 'root',
		mode   => 0755,
		source => "puppet:///modules/roles/global/brisskit_db_login",
	}
}
