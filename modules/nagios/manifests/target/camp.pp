class nagios::target::camp {

	require nagios::target

	$parts = split("${fqdn}", '-')
	$vapp_name = $parts[0]

	@@nagios_service { "check-http-camp-${fqdn}":
		use			=> "check-http-active",
		host_name		=> $fqdn,
		target			=> "/etc/nagios3/conf.d/service_${fqdn}.cfg",
		check_command		=> "check-http-pound!${vapp_name}!/admin",
		service_description	=> "HTTP Admin",
	}
}
