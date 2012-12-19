class nagios::target::base {

	require nagios::target

	package { "nagios-plugins":
		ensure	=> installed,
	}

	file { "/var/local/brisskit/nagios-client":
		ensure	=> directory,
		owner	=> "root",
		group	=> "nagios",
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

	@@nagios_service { "check-dummy-test-${hostname}":
		use		=> "dummy-check",
		host_name	=> $fqdn,
		target		=> "/etc/nagios3/conf.d/service_${fqdn}.cfg",
	}

	@@nagios_service { "check-dummy-fail-${hostname}":
		use		=> "dummy-fail",
		host_name	=> $fqdn,
		target		=> "/etc/nagios3/conf.d/service_${fqdn}.cfg",
	}

	@@nagios_service { "check-disk-space-${hostname}":
		use		=> "check-disk-space",
		host_name	=> $fqdn,
		target		=> "/etc/nagios3/conf.d/service_${fqdn}.cfg",
		require		=> Cron["check_disk"],
	}

	cron { "check_disk":
		command	=> "/var/local/brisskit/nagios-client/check_disk.sh",
		user	=> "root",
		minute	=> "*/5",
		require => File["/var/local/brisskit/nagios-client/check_disk.sh"],
	}

	file { "/var/local/brisskit/nagios-client/check_disk.sh":
		ensure	=> present,
		owner	=> "root",
		group	=> "root",
		mode	=> 0755,
		source	=> "puppet:///modules/nagios/check_disk.sh",
		require	=> File["/var/local/brisskit/nagios-client"],
	}

}

