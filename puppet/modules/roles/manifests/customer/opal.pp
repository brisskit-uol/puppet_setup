class roles::customer::opal {

	require roles::customer::common

	include users::customer_admin

	#################
	# Nagios	#
	#################

	# Create nagios cfg file for opal role
	include nagios::target::opal

	
	#################
	# Opal!         #
	#################

notify{"in role opal":}

	include ::opal

}
