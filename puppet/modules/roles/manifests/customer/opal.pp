class roles::customer::opal {

	require roles::customer::common

	include users::customer_admin

	#################
	# Nagios	#
	#################

	# Create nagios cfg file for camp role
	#include nagios::target::camp

}
