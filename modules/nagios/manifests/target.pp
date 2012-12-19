class nagios::target {
	@@nagios_host { $fqdn:
		ensure  => present,
		alias   => $hostname,
		address => $ipaddress,
		use     => "generic-host",
		target  => "/etc/nagios3/conf.d/host_${fqdn}.cfg",
	}
}
