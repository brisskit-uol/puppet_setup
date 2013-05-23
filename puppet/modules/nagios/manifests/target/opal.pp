class nagios::target::opal {

	require nagios::target

	@@nagios_service { "check-http-opal-${fqdn}":
		use			=> "check-http-active",
		host_name		=> $fqdn,
		servicegroups		=> "check-http-opal",
		target			=> "/etc/nagios3/conf.d/service_${fqdn}.cfg",
		check_command		=> "check-http-pound!${vapp_name}!/opal",
		service_description	=> "HTTP Opal",
	}
}
