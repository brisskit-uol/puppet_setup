class fw::target::mysql {

	require fw::target::customer

	#################################
	# Export Allow SSH from mysql	#
	#################################

	@@firewall { "110 allow SSH from mysql":

		source	=> "${vapp_name}-mysql",
		port	=> "22",
		action	=> "accept",
		tag	=> "${vapp_name}",

	}

	#################################
	# Allow mysql from catissue	#
	#################################

	firewall { "400 allow mysql from catissue":

		source	=> "${vapp_name}-catissue",
		port	=> "3306",
		action	=> "accept",

	}

	#################################
	# Allow mysql from civicrm	#
	#################################

	firewall { "400 allow mysql from civicrm":

		source	=> "${vapp_name}-civicrm",
		port	=> "3306",
		action	=> "accept",

	}

	#########################
	# Allow mysql from onyx	#
	#########################

	firewall { "400 allow mysql from onyx":

		source	=> "${vapp_name}-onyx",
		port	=> "3306",
		action	=> "accept",

	}

}
