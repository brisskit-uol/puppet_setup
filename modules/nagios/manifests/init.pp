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

	file { "/etc/nagios3/htpasswd.users":
		notify	=> Service["apache2"],
		ensure	=> present,
		owner	=> 'root',
		group	=> 'root',
		mode	=> 0644,
		source	=> "puppet:///modules/nagios/htpasswd.users",
	}

	file { "/etc/nagios3/apache2.conf":
		ensure	=> present,
		notify	=> Service["apache2"],
		source	=> "puppet:///modules/nagios/apache2.conf",
	}

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
#		notify	=> Service["nagios3"],
	}


	define nagios-config() {
		file { "/etc/nagios3/${name}":
			source	=> "puppet:///modules/nagios/${name}",
			require	=> Package["nagios3"],
			notify	=> Exec["nagios-config-check"],
		}
	}

	nagios-config { [ "cgi.cfg",
		"commands.cfg",
		"nagios.cfg",
		"resource.cfg" ]: }

	define nagios-config-confd() {
		file { "/etc/nagios3/conf.d/${name}":
			source	=> "puppet:///modules/nagios/${name}",
			require	=> Package["nagios3"],
			notify	=> Exec["nagios-config-check"],
		}
	}

	nagios-config-confd { [ "servicetemplates.cfg",
		"hosttemplates.cfg",
		"contacts.cfg",
		"timeperiods.cfg",
		"hostgroups.cfg",
		"services.cfg", ]: }

	file { "/etc/nagios3/conf.d":
		ensure  => directory,
		owner   => 'root',
		group   => 'root',
		mode    => 0644,
		recurse => true,
		require => Package["nagios3"],
		notify  => Exec["nagios-config-check"],
	}

	file { "/var/local/brisskit/nrdp":
		ensure	=> directory,
		owner	=> 'root',
		group	=> 'nagios',
		mode	=> 0644,
		recurse	=> true,
		source	=> "puppet:///modules/nagios/nrdp",
	}

	file { "/var/lib/nagios3/tmp":
		ensure	=> directory,
		owner	=> 'nagios',
		group	=> 'www-data',
		mode	=> 0660,
		require	=> Package["nagios3"],
	}

	file { "/etc/apache2/conf.d/nrdp.conf":
		ensure	=> link,
		target	=> "/var/local/brisskit/nrdp/nrdp.conf",
		require	=> Package["nagios3"],
		notify	=> Service["apache2"],
	}

	user { "www-data":
		groups	=> "nagios",
		notify	=> Service["apache2"],
	}

	Nagios_host <<||>> {

		notify	=> File["/etc/nagios3/conf.d"],

	}

	Nagios_service <<||>> {

		notify	=> File["/etc/nagios3/conf.d"],

	}

}
