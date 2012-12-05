class nagios {
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

	file { "/etc/nagios3/htpasswd.users":
		notify	=> Service["apache2"],
		ensure	=> present,
		owner	=> 'root',
		group	=> 'root',
		mode	=> 0644,
		source	=> "puppet:///modules/nagios/htpasswd.users",
	}
}
