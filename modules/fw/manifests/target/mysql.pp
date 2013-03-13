class fw::target::mysql {

	require fw::target::customer

	#################################
	# Export Allow SSH from mysql	#
	#################################

	@@firewall { "110 allow SSH from mysql":

		source	=> "${vapp_name}-mysql",
		port	=> "22",
		action	=> "accept",
		tag	=> [ "${vapp_name}", "vappssh", ],

	}

}
