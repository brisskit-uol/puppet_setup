class roles::customer::mysql {

	require roles::customer

	include users::customer_mysql

	#################
	# Nagios	#
	#################

	# Create nagios cfg file for mysql role
	include nagios::target::mysql

}
