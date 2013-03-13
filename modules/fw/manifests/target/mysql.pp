class fw::target::mysql {

	require fw::target::customer

	#################################
	# Export Allow SSH from mysql	#
	#################################

	@@firewall { "110 allow SSH from ${vm_role}":

		source	=> "${hostname}",
		port	=> "22",
		action	=> "accept",
		tag	=> [ "${vapp_name}", "vappssh", ],

	}

}
