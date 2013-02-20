class nagios::target::camp {

	require nagios::target

	@@nagios_service { "check-http-camp-${fqdn}":
		use			=> "check-http-active",
		host_name		=> $fqdn,
		servicegroups		=> "check-http-admin",
		target			=> "/etc/nagios3/conf.d/service_${fqdn}.cfg",
		check_command		=> "check-http-pound!${vapp_name}!/admin",
		service_description	=> "HTTP Admin",
	}
}
