class roles::customer::openesb {

	require roles::customer

	include users::customer_openesb

	#################
	# Nagios	#
	#################

	# Create nagios cfg file for openesb role
	include nagios::target::openesb

}
