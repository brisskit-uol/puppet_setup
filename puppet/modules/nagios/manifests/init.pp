class nagios {

	include nagios::commands

	package { "nagios3":
		ensure => installed,
	}

	service { "nagios3":
		ensure		=> running,
		hasrestart	=> true,
		hasstatus	=> true,
		require		=> Package[nagios3],
	}

	service { "apache2":
		ensure		=> running,
		hasrestart	=> true,
		hasstatus	=> true,
		require		=> Package[nagios3],
	}

	exec { "nagios-config-check":
		command		=> "/usr/sbin/nagios3 -v /etc/nagios3/nagios.cfg && /usr/sbin/service nagios3 reload",
		refreshonly	=> true,
	}

#	file { "/etc/nagios3/htpasswd.users":
#		notify	=> Service["apache2"],
#		ensure	=> present,
#		owner	=> 'root',
#		group	=> 'root',
#		mode	=> 0644,
#		source	=> "puppet:///modules/nagios/htpasswd.users",
#	}

	file { "/var/local/brisskit/nagios-server":
		ensure	=> directory,
		owner	=> 'root',
		group	=> 'nagios',
		mode	=> 0644,
	}

	# Remove default configuration files
	
	file { [ "/etc/nagios3/conf.d/contacts_nagios2.cfg",
		"/etc/nagios3/conf.d/extinfo_nagios2.cfg",
		"/etc/nagios3/conf.d/generic-host_nagios2.cfg",
		"/etc/nagios3/conf.d/generic-service_nagios2.cfg",
		"/etc/nagios3/conf.d/hostgroups_nagios2.cfg",
		"/etc/nagios3/conf.d/localhost_nagios2.cfg",
		"/etc/nagios3/conf.d/services_nagios2.cfg",
		"/etc/nagios3/conf.d/timeperiods_nagios2.cfg"
		]:
		ensure 	=> absent,
		force	=> true,
		notify	=> Service["nagios3"],
	}

	define nagios-config() {
		file { "/etc/nagios3/${name}":
			source	=> "puppet:///modules/nagios/${name}",
			require	=> Package["nagios3"],
			notify	=> Exec["nagios-config-check"],
		}
	}

	nagios-config { [ "apache2.conf",
		"cgi.cfg",
		"commands.cfg",
		"htpasswd.users",
		"nagios.cfg",
		"resource.cfg" ]: }
}
