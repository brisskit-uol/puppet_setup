class roles::customer::i2b2 {

	require roles::customer

	include users::customer_i2b2
	include users::integration
	ssh::auth::client { "integration": }
	ssh::auth::server { "integration": }

	#################
	# Nagios	#
	#################

	# Create nagios cfg file for i2b2 role
	include nagios::target::i2b2

}
