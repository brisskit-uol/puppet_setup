class roles::ga::nagios {

	require ::roles::ga

	#################
	# Nagios server	#
	#################

	# Set up Nagios server - requires use of absolute namespace!
	include ::nagios

	#################
	# Firewall	#
	#################

	include ::fw::target::nagios

}
