class roles::ga::nagios {

	require roles::ga

	#################
	# Nagios server	#
	#################

	# Set up Nagios server
	include nagios

}
