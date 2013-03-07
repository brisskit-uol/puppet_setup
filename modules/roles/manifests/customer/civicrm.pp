class roles::customer::civicrm {

	require roles::customer

	include postfix
	include users::customer_civicrm

	#################
	# Backup	#
	#################

	# Set up file tree
	include backup::base

	# Set up users
	include backup::users::vm_backup

	# Copy vapp_backup pub key to vm_backup authorized_keys
	ssh::auth::server { "vapp_backup": user => "vm_backup" }

	#################
	# Nagios	#
	#################

	# Create nagios cfg file for civicrm role
	include nagios::target::civicrm

}
