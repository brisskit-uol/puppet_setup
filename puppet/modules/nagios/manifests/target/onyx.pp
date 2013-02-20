class nagios::target::onyx {

	require nagios::target

	@@nagios_service { "check-http-onyx-${fqdn}":
		use			=> "check-http-active",
		host_name		=> $fqdn,
		servicegroups		=> "check-http-onyx",
		target			=> "/etc/nagios3/conf.d/service_${fqdn}.cfg",
		check_command		=> "check-http-pound!${vapp_name}!/onyx",
		service_description	=> "HTTP Onyx",
	}
}
