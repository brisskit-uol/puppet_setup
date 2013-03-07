class roles::customer::catissue {

	require roles::customer

	include postfix
	include users::customer_catissue
	include users::intergration
	ssh::auth::client { "integration": }
	ssh::auth::server { "integration": }

	#################
	# Backup	#
	#################

	# Set up file tree
	include backup::base

	# Set up users
	include backup::users::vm_backup

	# Copy vapp_backup pub key to vm_backup authorized_keys
	ssh::auth::server { "vapp_backup: user => "vm_backup" }

	#################
	# Nagios	#
	#################

	# Create nagios cfg file for catissue role
	include nagios::target::catissue

}
