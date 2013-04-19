class roles::customer::opal {

	require roles::customer::common

	include users::customer_admin

	#################
	# Nagios	#
	#################

	# Create nagios cfg file for camp role
	include nagios::target::camp

	
	#################
	# Opal!         #
	#################

	#Add obiba key and url to sources list
	apt::source { 'obiba':
		location   => 'http://pkg.obiba.org',
		release    => 'stable/',
		repos      => '',
		key_source => 'http://pkg.obiba.org/obiba.org.key',
		include_src => false,
	}

}
