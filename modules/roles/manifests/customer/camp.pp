class roles::customer::camp {

	require roles::customer

	include users::customer_admin

	#################
	# Backup	#
	#################

	# Set up file tree
	include backup::base

	# Set up users
	include backup::users::vapp_backup

	# Copy master_backup pub key to vapp_backup authorized_keys
	ssh::auth::server { "master_backup": user => "vapp_backup" }

	# Get vapp_backup private key
	ssh::auth::client { "vapp_backup": }

	package {'mysql-client': ensure => present}

	#################
	# Nagios	#
	#################

	# Create nagios cfg file for camp role
	include nagios::target::camp

}
