class fw::target::mysql {

	require fw::target::customer

	#################################
	# Allow mysql from catissue	#
	#################################

	firewall { "400 allow mysql from catissue":

		source	=> "catissue",
		port	=> "3306",
		action	=> "accept",

	}

	#################################
	# Allow mysql from civicrm	#
	#################################

	firewall { "400 allow mysql from civicrm":

		source	=> "civicrm",
		port	=> "3306",
		action	=> "accept",

	}

	#########################
	# Allow mysql from onyx	#
	#########################

	firewall { "400 allow mysql from onyx":

		source	=> "onyx",
		port	=> "3306",
		action	=> "accept",

	}

}
