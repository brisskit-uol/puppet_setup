class roles::customer::openesb {

	require roles::customer::common

	include users::customer_openesb

	#################
	# Nagios	#
	#################

	# Create nagios cfg file for openesb role
	
	#this doesnt actually exist, the base nagios stuff is in the base roles class anywany
	#include nagios::target::openesb

}
