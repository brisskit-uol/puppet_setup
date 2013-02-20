class nagios::target::i2b2 {

	require nagios::target

	@@nagios_service { "check-http-i2b2-${fqdn}":
		use			=> "check-http-active",
		host_name		=> $fqdn,
		servicegroups		=> "check-http-i2b2",
		target			=> "/etc/nagios3/conf.d/service_${fqdn}.cfg",
		check_command		=> "check-http-pound!${vapp_name}!/i2b2/main",
		service_description	=> "HTTP i2b2",
	}
}
