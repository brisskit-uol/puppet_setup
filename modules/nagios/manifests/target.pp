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

	#Lets figure out the vApp name
	
	$parts = split("${fqdn}", '[-.]')
	$vapp_name = $parts[0]
	$vm_role = $parts[1]
	$nagios_hostgroups = "${vapp_name}, ${vm_role}"

	@@nagios_host { $fqdn:
		ensure  		=> present,
		alias   		=> $hostname,
		address 		=> $ipaddress,
		#hostgroups		=> $vapp_name,
		hostgroups		=> $nagios_hostgroups,
		use     		=> "generic-host",
		active_checks_enabled	=> 0,
		check_freshness		=> 1,
		freshness_threshold	=> 330,
		check_command		=> "no-report!2!No report in 5 minutes",
		target  		=> "/etc/nagios3/conf.d/host_${fqdn}.cfg",
	}

	cron { "check_host":
		command => "/var/local/brisskit/nagios-client/check_host.sh > /dev/null 2>&1",
		user    => "root",
		minute  => "*/5",
		require => File["/var/local/brisskit/nagios-client/check_host.sh"],
	}

	file { "/var/local/brisskit/nagios-client/check_host.sh":
		ensure  => present,
		owner   => "root",
		group   => "root",
		mode    => 0500,
		source  => "puppet:///modules/nagios/check_host.sh",
		require => File["/var/local/brisskit/nagios-client"],
	}
}
