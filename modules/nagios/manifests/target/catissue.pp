class nagios::target::catissue {

	require nagios::target

	@@nagios_service { "check-http-catissue-${fqdn}":
		use			=> "check-http-active",
		host_name		=> $fqdn,
		servicegroups		=> "check-http-catissue",
		target			=> "/etc/nagios3/conf.d/service_${fqdn}.cfg",
		check_command		=> "check-http-pound!${vapp_name}!/catissuecore",
		service_description	=> "HTTP caTissue",
	}
}
