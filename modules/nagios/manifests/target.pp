class nagios::target {

	package { "nagios-plugins":
		ensure	=> installed,
	}

	file { "/var/local/brisskit/nagios-client":
		ensure	=> directory,
		owner	=> "root",
		group	=> "root",
		mode	=> 0644,
	}

	file { "/var/local/brisskit/nagios-client/send_nrdp.sh":
		ensure	=> present,
		owner	=> "root",
		group	=> "root",
		mode	=> 0755,
		source	=> "puppet:///modules/nagios/send_nrdp.sh",
		require	=> File["/var/local/brisskit/nagios-client"],
	}

	file { "/etc/nagios-plugins/config/brisskit.cfg":
		ensure	=> present,
		owner	=> "root",
		group	=> "root",
		mode	=> 0644,
		source	=> "puppet:///modules/nagios/brisskit.cfg",
		require => Package["nagios-plugins"],
	}

	@@nagios_host { $fqdn:
		ensure  => present,
		alias   => $hostname,
		address => $ipaddress,
		use     => "generic-host",
		target  => "/etc/nagios3/conf.d/host_${fqdn}.cfg",
	}
}
