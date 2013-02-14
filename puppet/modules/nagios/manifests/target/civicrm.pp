class nagios::target::civicrm {

	require nagios::target

	@@nagios_service { "check-http-civicrm-${fqdn}":
		use			=> "check-http-active",
		host_name		=> $fqdn,
		target			=> "/etc/nagios3/conf.d/service_${fqdn}.cfg",
		check_command		=> "check-http-pound!${vapp_name}!/civicrm",
		service_description	=> "HTTP CiviCRM",
	}
}
