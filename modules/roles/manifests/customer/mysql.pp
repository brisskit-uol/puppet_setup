class roles::customer::mysql {

	require roles::customer::common

	include users::customer_mysql

	package {'mysql-client': ensure => present}

	#################
	# Nagios	#
	#################

	# Create nagios cfg file for mysql role
	include nagios::target::mysql

}
