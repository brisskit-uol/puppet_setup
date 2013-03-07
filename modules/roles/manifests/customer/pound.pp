class roles::customer::pound {

	require roles::customer

	include pound

	#################
	# Nagios	#
	#################

	# Create nagios cfg file for pound role
	include nagios::target::pound

}
